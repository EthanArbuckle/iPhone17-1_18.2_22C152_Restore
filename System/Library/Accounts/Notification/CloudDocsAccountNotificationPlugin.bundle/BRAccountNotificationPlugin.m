@interface BRAccountNotificationPlugin
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (BOOL)isCloudDocsUnsupported:(id)a3 inStore:(id)a4 showUserNotification:(BOOL)a5;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation BRAccountNotificationPlugin

- (BOOL)isCloudDocsUnsupported:(id)a3 inStore:(id)a4 showUserNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = +[BRDaemonConnection defaultConnection];
  id v10 = [v9 newSyncProxy];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_4444;
  v21 = sub_4454;
  id v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_445C;
  v16[3] = &unk_8190;
  v16[4] = &v17;
  [v10 validateCloudDocsSupported:v5 withReply:v16];
  uint64_t v11 = v18[5];
  if (v11)
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v18[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] iCloud Drive can't be enabled: %@%@", buf, 0x16u);
    }

    [v7 setEnabled:0 forDataclass:kAccountDataclassUbiquity];
    [v8 saveAccount:v7 withHandler:&stru_81D0];
  }
  _Block_object_dispose(&v17, 8);

  return v11 != 0;
}

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  unsigned int v12 = objc_msgSend(a6, "br_isEnabledForCloudDocs");
  unsigned int v13 = objc_msgSend(v10, "br_isEnabledForCloudDocs");
  uint64_t v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v18 = @"No";
    *(_DWORD *)v20 = 138413314;
    *(void *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 1024;
    if (v12) {
      CFStringRef v19 = @"Yes";
    }
    else {
      CFStringRef v19 = @"No";
    }
    *(_DWORD *)&v20[14] = a4;
    if (v13) {
      CFStringRef v18 = @"Yes";
    }
    *(_WORD *)&v20[18] = 2112;
    *(void *)&v20[20] = v19;
    __int16 v21 = 2112;
    CFStringRef v22 = v18;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Account %@ will change with type: %u. Was Enabled: %@, Is Enabled: %@%@", v20, 0x30u);
  }

  BOOL v16 = ((v13 ^ 1 | v12) & 1) == 0
     && -[BRAccountNotificationPlugin isCloudDocsUnsupported:inStore:showUserNotification:](self, "isCloudDocsUnsupported:inStore:showUserNotification:", v10, v11, a4 == 2, *(_OWORD *)v20, *(void *)&v20[16]);

  return v16;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10 = a3;
  id v142 = a5;
  id v11 = a6;
  unsigned int v12 = v11;
  if (v10) {
    unsigned int v13 = v10;
  }
  else {
    unsigned int v13 = v11;
  }
  id v14 = v13;
  if (objc_msgSend(v14, "br_isEligibleiCloudAccount"))
  {
    v135 = self;
    memset(v162, 0, sizeof(v162));
    sub_6008(0, (uint64_t)"-[BRAccountNotificationPlugin account:didChangeWithType:inStore:oldAccount:]", 183, v162);
    v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v162[0];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(void *)v164 = v15;
      _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx plugin notification about %@%@", buf, 0x20u);
    }
    id v138 = v14;

    unsigned int v136 = objc_msgSend(v12, "br_isEligibleiCloudAccount");
    unsigned int v134 = objc_msgSend(v10, "br_isEligibleiCloudAccount");
    unsigned int v17 = objc_msgSend(v12, "br_isEnabledForCloudDocs");
    unsigned int v18 = objc_msgSend(v10, "br_isEnabledForCloudDocs");
    unsigned int v19 = objc_msgSend(v12, "br_isEnabledForUbiquity");
    unsigned int v20 = objc_msgSend(v10, "br_isEnabledForUbiquity");
    unsigned int v141 = objc_msgSend(v12, "br_needsToVerifyTerms");
    unsigned int v140 = objc_msgSend(v10, "br_needsToVerifyTerms");
    uint64_t v21 = kAccountDataclassUbiquity;
    unsigned int v132 = objc_msgSend(v12, "aa_useCellularForDataclass:", kAccountDataclassUbiquity);
    unsigned int v133 = objc_msgSend(v10, "aa_useCellularForDataclass:", v21);
    if ([v10 isDataSeparatedAccount])
    {
      CFStringRef v22 = [v12 accountDescription];
      __int16 v23 = [v10 accountDescription];
      unsigned int v137 = [v22 isEqualToString:v23];
    }
    else
    {
      unsigned int v137 = 1;
    }
    if (qword_C728 == -1)
    {
      if (!v18)
      {
LABEL_16:
        unsigned int v139 = v17;
        switch(a4)
        {
          case 1:
            v29 = brc_bread_crumbs();
            v30 = brc_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = objc_msgSend(v10, "br_dsid");
              if (objc_msgSend(v10, "br_isManagedAppleID")) {
                int v32 = 89;
              }
              else {
                int v32 = 78;
              }
              int v126 = v32;
              if (objc_msgSend(v10, "br_isEnabledForUbiquity")) {
                int v33 = 89;
              }
              else {
                int v33 = 78;
              }
              int v123 = v33;
              if (objc_msgSend(v10, "br_isEnabledForCloudDocs")) {
                int v34 = 89;
              }
              else {
                int v34 = 78;
              }
              int v120 = v34;
              unsigned int v130 = v20;
              if (objc_msgSend(v10, "br_isEnabledForiCloudDesktop")) {
                int v35 = 89;
              }
              else {
                int v35 = 78;
              }
              unsigned int v36 = objc_msgSend(v10, "br_isEligibleiCloudAccount");
              *(_DWORD *)buf = 138414082;
              if (v36) {
                int v37 = 89;
              }
              else {
                int v37 = 78;
              }
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)v164 = v126;
              *(_WORD *)&v164[4] = 1024;
              *(_DWORD *)&v164[6] = v123;
              __int16 v165 = 1024;
              int v166 = v120;
              __int16 v167 = 1024;
              int v168 = v35;
              unsigned int v20 = v130;
              __int16 v169 = 1024;
              int v170 = v37;
              __int16 v171 = 2112;
              id v172 = v29;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] account added <%@ dsid:%@ managed:%c ub:%c br:%c desktop:%c eligible:%c>%@", buf, 0x3Eu);
            }
            goto LABEL_86;
          case 2:
            v29 = brc_bread_crumbs();
            v30 = brc_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v129 = objc_msgSend(v12, "br_dsid");
              if (objc_msgSend(v12, "br_isManagedAppleID")) {
                int v39 = 89;
              }
              else {
                int v39 = 78;
              }
              int v127 = v39;
              if (objc_msgSend(v12, "br_isEnabledForUbiquity")) {
                int v40 = 89;
              }
              else {
                int v40 = 78;
              }
              int v124 = v40;
              if (objc_msgSend(v12, "br_isEnabledForCloudDocs")) {
                int v41 = 89;
              }
              else {
                int v41 = 78;
              }
              int v121 = v41;
              if (objc_msgSend(v12, "br_isEnabledForiCloudDesktop")) {
                int v42 = 89;
              }
              else {
                int v42 = 78;
              }
              int v119 = v42;
              if (objc_msgSend(v12, "br_isEligibleiCloudAccount")) {
                int v43 = 89;
              }
              else {
                int v43 = 78;
              }
              int v118 = v43;
              v117 = objc_msgSend(v10, "br_dsid");
              if (objc_msgSend(v10, "br_isManagedAppleID")) {
                int v44 = 89;
              }
              else {
                int v44 = 78;
              }
              int v116 = v44;
              if (objc_msgSend(v10, "br_isEnabledForUbiquity")) {
                int v45 = 89;
              }
              else {
                int v45 = 78;
              }
              int v115 = v45;
              if (objc_msgSend(v10, "br_isEnabledForCloudDocs")) {
                int v46 = 89;
              }
              else {
                int v46 = 78;
              }
              int v114 = v46;
              unsigned int v131 = v20;
              unsigned int v47 = v19;
              if (objc_msgSend(v10, "br_isEnabledForiCloudDesktop")) {
                int v48 = 89;
              }
              else {
                int v48 = 78;
              }
              unsigned int v49 = objc_msgSend(v10, "br_isEligibleiCloudAccount");
              *(_DWORD *)buf = 138415874;
              if (v49) {
                int v50 = 89;
              }
              else {
                int v50 = 78;
              }
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v129;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)v164 = v127;
              *(_WORD *)&v164[4] = 1024;
              *(_DWORD *)&v164[6] = v124;
              __int16 v165 = 1024;
              int v166 = v121;
              __int16 v167 = 1024;
              int v168 = v119;
              __int16 v169 = 1024;
              int v170 = v118;
              __int16 v171 = 2112;
              id v172 = v10;
              __int16 v173 = 2112;
              v174 = v117;
              __int16 v175 = 1024;
              int v176 = v116;
              __int16 v177 = 1024;
              int v178 = v115;
              __int16 v179 = 1024;
              int v180 = v114;
              __int16 v181 = 1024;
              int v182 = v48;
              unsigned int v19 = v47;
              unsigned int v20 = v131;
              __int16 v183 = 1024;
              int v184 = v50;
              __int16 v185 = 2112;
              v186 = v29;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] account modified <%@ dsid:%@ managed:%c ub:%c br:%c desktop:%c eligible:%c> -> <%@ dsid:%@ managed:%c ub:%c br:%c desktop:%c eligible:%c>%@", buf, 0x70u);
            }
            goto LABEL_86;
          case 3:
            v29 = brc_bread_crumbs();
            int v38 = 1;
            v30 = brc_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v51 = objc_msgSend(v12, "br_dsid");
              if (objc_msgSend(v12, "br_isManagedAppleID")) {
                int v52 = 89;
              }
              else {
                int v52 = 78;
              }
              int v128 = v52;
              if (objc_msgSend(v12, "br_isEnabledForUbiquity")) {
                int v53 = 89;
              }
              else {
                int v53 = 78;
              }
              int v125 = v53;
              if (objc_msgSend(v12, "br_isEnabledForCloudDocs")) {
                int v54 = 89;
              }
              else {
                int v54 = 78;
              }
              if (objc_msgSend(v12, "br_isEnabledForiCloudDesktop")) {
                int v55 = 89;
              }
              else {
                int v55 = 78;
              }
              int v122 = v55;
              unsigned int v56 = objc_msgSend(v12, "br_isEligibleiCloudAccount");
              *(_DWORD *)buf = 138414082;
              if (v56) {
                int v57 = 89;
              }
              else {
                int v57 = 78;
              }
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v51;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)v164 = v128;
              *(_WORD *)&v164[4] = 1024;
              *(_DWORD *)&v164[6] = v125;
              __int16 v165 = 1024;
              int v166 = v54;
              unsigned int v17 = v139;
              __int16 v167 = 1024;
              int v168 = v122;
              __int16 v169 = 1024;
              int v170 = v57;
              __int16 v171 = 2112;
              id v172 = v29;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] account deleted <%@ dsid:%@ managed:%c ub:%c br:%c desktop:%c eligible:%c>%@", buf, 0x3Eu);

              int v38 = 1;
            }
            goto LABEL_87;
          case 4:
            v29 = brc_bread_crumbs();
            v30 = brc_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              sub_65E4((uint64_t)v29, v30);
            }
LABEL_86:
            int v38 = 0;
LABEL_87:

            break;
          default:
            int v38 = 0;
            break;
        }
        v58 = brc_bread_crumbs();
        v59 = brc_default_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          v113 = [v10 propertiesForDataclass:v21];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v113;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v58;
          _os_log_debug_impl(&dword_0, v59, OS_LOG_TYPE_DEBUG, "[DEBUG] ubiquity dataclass: %@%@", buf, 0x16u);
        }
        if (((v20 ^ 1 | v19) & 1) == 0)
        {
          memset(buf, 0, sizeof(buf));
          sub_6008(0, (uint64_t)"-[BRAccountNotificationPlugin account:didChangeWithType:inStore:oldAccount:]", 264, buf);
          v60 = brc_bread_crumbs();
          v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
            sub_6570(buf);
          }

          v62 = +[BRDaemonConnection secondaryConnection];
          v63 = [v62 remoteObjectProxyWithErrorHandler:&stru_8278];
          [v63 jetsamCloudDocsAppsWithReply:&stru_8298];

          BRNotifyNameForAccountDidStartUsingUbiquityNotification();
          id v64 = objc_claimAutoreleasedReturnValue();
          [v64 UTF8String];
          brc_notify_post();

          sub_61DC((uint64_t *)buf);
        }
        if (v17 == v18 && ((int v65 = v18 ^ 1, ((v18 ^ 1 | v136) & 1) != 0) || ((v134 ^ 1) & 1) != 0))
        {
          if ((v18 & (v132 ^ v133)) == 1)
          {
            v111 = brc_bread_crumbs();
            v112 = brc_default_log();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
              sub_64E8(v133);
            }

            BRPostAccountTokenChangedNotification();
          }
        }
        else
        {
          v66 = +[BRDaemonConnection defaultConnection];
          id v67 = [v66 newSyncProxy];

          unsigned int v68 = v18;
          if (v18)
          {
            int v69 = v38;
            v70 = [v10 identifier];
            v71 = objc_msgSend(v10, "br_dsid");
            v72 = brc_bread_crumbs();
            v73 = brc_default_log();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v70;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v72;
              _os_log_impl(&dword_0, v73, OS_LOG_TYPE_DEFAULT, "[NOTICE] Initiating login for %@%@", buf, 0x16u);
            }

            v74 = qword_C720;
            v156[0] = _NSConcreteStackBlock;
            v156[1] = 3221225472;
            v156[2] = sub_59A8;
            v156[3] = &unk_82E8;
            v75 = &v157;
            id v157 = v67;
            v76 = &v158;
            id v77 = v70;
            id v158 = v77;
            id v78 = v71;
            id v159 = v78;
            id v79 = v67;
            dispatch_async(v74, v156);
          }
          else
          {
            int v69 = v38;
            v80 = [v12 identifier];
            objc_msgSend(v12, "br_dsid");
            id v78 = (id)objc_claimAutoreleasedReturnValue();
            v81 = brc_bread_crumbs();
            v82 = brc_default_log();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v80;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v81;
              _os_log_impl(&dword_0, v82, OS_LOG_TYPE_DEFAULT, "[NOTICE] Initiating logout for %@%@", buf, 0x16u);
            }

            v83 = qword_C720;
            v153[0] = _NSConcreteStackBlock;
            v153[1] = 3221225472;
            v153[2] = sub_5B40;
            v153[3] = &unk_8310;
            v75 = &v154;
            id v154 = v67;
            v76 = &v155;
            id v77 = v80;
            id v155 = v77;
            id v84 = v67;
            dispatch_sync(v83, v153);
          }

          int v65 = v68 ^ 1;
          unsigned int v17 = v139;
          int v38 = v69;
        }
        int v85 = v17 ^ 1;
        if ((v65 & 1) == 0 && (v85 & 1) == 0)
        {
          v86 = +[BRDaemonConnection defaultConnection];
          v87 = [v86 remoteObjectProxy];

          v150[0] = _NSConcreteStackBlock;
          v150[1] = 3221225472;
          v150[2] = sub_5CD0;
          v150[3] = &unk_8338;
          v150[4] = v135;
          id v151 = v10;
          id v152 = v142;
          [v87 verifyAccountLoaded:v150];
        }
        if (v141 != v140)
        {
          v88 = +[BRDaemonConnection defaultConnection];
          id v89 = [v88 newSyncProxy];

          v148[0] = _NSConcreteStackBlock;
          v148[1] = 3221225472;
          v148[2] = sub_5DC8;
          v148[3] = &unk_82C0;
          id v90 = v89;
          id v149 = v90;
          [v90 invalidateAccountCacheWithReply:v148];
          v91 = [v90 result];
          unsigned __int8 v92 = [v91 BOOLValue];

          if ((v92 & 1) == 0)
          {
            v93 = brc_bread_crumbs();
            v94 = brc_default_log();
            if (os_log_type_enabled(v94, (os_log_type_t)0x90u)) {
              sub_6458(v90);
            }
          }
          BRPostAccountTokenChangedNotification();
        }
        if (((v65 | v85 | v137) & 1) == 0)
        {
          v95 = +[BRDaemonConnection defaultConnection];
          id v96 = [v95 newSyncProxy];

          v97 = [v10 identifier];
          v98 = qword_C720;
          v145[0] = _NSConcreteStackBlock;
          v145[1] = 3221225472;
          v145[2] = sub_5DDC;
          v145[3] = &unk_8310;
          id v146 = v96;
          id v147 = v97;
          id v99 = v97;
          id v100 = v96;
          dispatch_async(v98, v145);
        }
        id v14 = v138;
        if (((v141 ^ 1 | v140) & 1) == 0)
        {
          v101 = +[BRDaemonConnection defaultConnection];
          id v102 = [v101 newSyncProxy];

          v143[0] = _NSConcreteStackBlock;
          v143[1] = 3221225472;
          v143[2] = sub_5F6C;
          v143[3] = &unk_82C0;
          id v103 = v102;
          id v144 = v103;
          [v103 userVerifiedTermsWithReply:v143];
          v104 = [v103 result];
          unsigned __int8 v105 = [v104 BOOLValue];

          if ((v105 & 1) == 0)
          {
            v106 = brc_bread_crumbs();
            v107 = brc_default_log();
            if (os_log_type_enabled(v107, (os_log_type_t)0x90u)) {
              sub_63C8(v103);
            }
          }
        }
        if (v38)
        {
          memset(buf, 0, sizeof(buf));
          sub_6008(0, (uint64_t)"-[BRAccountNotificationPlugin account:didChangeWithType:inStore:oldAccount:]", 375, buf);
          v108 = brc_bread_crumbs();
          v109 = brc_default_log();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG)) {
            sub_6354(buf);
          }

          v110 = objc_msgSend(v12, "br_dsid");
          BRUnsetMigrationStatusForDSIDInPref();

          sub_61DC((uint64_t *)buf);
        }
        sub_61DC(v162);
        goto LABEL_127;
      }
    }
    else
    {
      dispatch_once(&qword_C728, &stru_8210);
      if (!v18) {
        goto LABEL_16;
      }
    }
    v26 = objc_msgSend(v10, "br_dsid");
    v27 = qword_C720;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5850;
    block[3] = &unk_8238;
    id v161 = v26;
    id v28 = v26;
    dispatch_async(v27, block);

    goto LABEL_16;
  }
  uint64_t v24 = brc_bread_crumbs();
  __int16 v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_665C(v14, (uint64_t)v24, v25);
  }

LABEL_127:
}

@end