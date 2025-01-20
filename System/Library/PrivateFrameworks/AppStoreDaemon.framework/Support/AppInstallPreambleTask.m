@interface AppInstallPreambleTask
- (void)main;
@end

@implementation AppInstallPreambleTask

- (void)main
{
  v3 = +[NSNumber numberWithLongLong:[(SQLiteMemoryEntity *)self->_install databaseID]];
  sub_10041E684((uint64_t)AppInstallInfo, v3);
  v4 = (AppInstallInfo *)objc_claimAutoreleasedReturnValue();
  installInfo = self->_installInfo;
  self->_installInfo = v4;

  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    Property = self->_installInfo;
    if (Property) {
      Property = objc_getProperty(Property, v7, 80, 1);
    }
    id v9 = Property;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Performing preamble checks", buf, 0xCu);
  }
  if ((unint64_t)sub_10026E91C(self->_package, @"archive_type") <= 1)
  {
    install = self->_install;
    v150[1] = 0;
    v11 = sub_1003C0068(install);
    id v13 = 0;
    v14 = self->_installInfo;
    if (v14) {
      v14 = objc_getProperty(v14, v12, 80, 1);
    }
    id v16 = v14;
    if (v11) {
      objc_setProperty_atomic(v11, v15, v16, 40);
    }

    v150[0] = v13;
    v17 = sub_1003BFC54(v11, v150);
    id v18 = v150[0];

    if (!v17)
    {
      v19 = +[RestoreKeeper shared];
      v20 = sub_100424D84(self->_install);
      v21 = sub_100424C14(&self->_install->super.super.isa);
      v22 = [v19 restoringCoordinatorForBundleID:v20 logKey:v21];

      if (!v22)
      {
        uint64_t v46 = sub_1003A9E40((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v18);
LABEL_32:
        uint64_t v32 = v46;
LABEL_39:

        goto LABEL_40;
      }
      v23 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v92 = self->_installInfo;
        if (v92) {
          v92 = objc_getProperty(v92, v24, 80, 1);
        }
        id v93 = v92;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v93;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%@] Found an existing restoring coordinator", buf, 0xCu);
      }
    }
    v25 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"cancel_if_duplicate"];
    unsigned int v26 = [v25 BOOLValue];

    v27 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"item_id"];
    uint64_t v28 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"bundle_id"];
    v29 = (void *)v28;
    if (v27)
    {
      id v30 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v27, "unsignedLongLongValue"), 0);
    }
    else
    {
      if (!v28)
      {
        v34 = v11;
        id v35 = v18;
        v33 = 0;
        goto LABEL_34;
      }
      id v30 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v28 allowPlaceholder:0 error:0];
    }
    v33 = v30;
    if (v30)
    {
      v34 = v11;
      id v35 = v18;
      if (v26)
      {
        v36 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v94 = self->_installInfo;
          if (v94) {
            v94 = objc_getProperty(v94, v37, 80, 1);
          }
          id v95 = v94;
          v96 = v95;
          *(_DWORD *)buf = 138412802;
          if (v27) {
            v97 = v27;
          }
          else {
            v97 = v29;
          }
          *(void *)&buf[4] = v95;
          __int16 v152 = 2114;
          id v153 = v33;
          __int16 v154 = 2114;
          v155 = v97;

        v38 = };
        v39 = ASDErrorWithDescription();
LABEL_29:

        goto LABEL_35;
      }
      if (sub_1000173A0(v30))
      {
        v40 = self->_install;
        if (!v40 || sub_10026E91C(v40, @"source_type") != (id)2)
        {
          v142 = v17;
          v41 = [v33 iTunesMetadata];
          v42 = [v41 distributorInfo];
          v38 = [v42 distributorID];

          v43 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v133 = self->_installInfo;
            if (v133) {
              v133 = objc_getProperty(v133, v44, 80, 1);
            }
            id v134 = v133;
            v135 = v134;
            *(_DWORD *)buf = 138413058;
            if (v27) {
              v136 = v27;
            }
            else {
              v136 = v29;
            }
            *(void *)&buf[4] = v134;
            __int16 v152 = 2114;
            id v153 = v33;
            __int16 v154 = 2114;
            v155 = v136;
            __int16 v156 = 2114;
            v157 = v38;

          v45 = };
          v39 = ASDErrorWithDescription();

          v17 = v142;
          goto LABEL_29;
        }
      }
    }
    else
    {
      v34 = v11;
      id v35 = v18;
    }
LABEL_34:
    v39 = 0;
LABEL_35:

    id v47 = v39;
    v48 = v35;
    v11 = v34;
    if (v47)
    {
LABEL_36:
      id v49 = v47;

LABEL_37:
      uint64_t v50 = sub_1003A9DB8((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v17, v49);
LABEL_38:
      uint64_t v32 = v50;
      id v18 = v49;
      goto LABEL_39;
    }
    if (self->_automaticType != 1) {
      goto LABEL_50;
    }
    if (sub_1003F465C())
    {
      if (sub_100005C38() && sub_100009458())
      {
        v53 = +[LSApplicationWorkspace defaultWorkspace];
        unsigned __int8 v54 = [v53 applicationIsInstalled:@"com.apple.AppStore"];

        if ((v54 & 1) == 0)
        {
          v55 = sub_1004253D0(&self->_install->super.super.isa, 0);
          id v56 = v55;
          if (v55
            && ([v55 deviceBasedVPP] & 1) == 0
            && ([v56 isB2BCustomApp] & 1) == 0)
          {
            v62 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v140 = self->_installInfo;
              if (v140) {
                v140 = objc_getProperty(v140, v137, 80, 1);
              }
              id v141 = v140;
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v141;
              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "[%@] Automatic download requires App Store to be installed", buf, 0xCu);
            }
LABEL_58:

            v64 = ASDErrorWithDescription();

            goto LABEL_61;
          }
        }
LABEL_50:
        if (self->_automaticType != 2)
        {
LABEL_54:
          id v59 = 0;
          goto LABEL_62;
        }
        id v57 = objc_alloc((Class)LSApplicationRecord);
        v58 = sub_100424D84(self->_install);
        id v56 = [v57 initWithBundleIdentifier:v58 allowPlaceholder:0 error:0];

        if (v56 && [v56 isBeta])
        {

          goto LABEL_54;
        }
        v62 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v129 = self->_installInfo;
          if (v129) {
            v129 = objc_getProperty(v129, v63, 80, 1);
          }
          id v130 = v129;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v130;
          _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "[%@] Canceling automatic installation because beta version of app is not installed", buf, 0xCu);
        }
        goto LABEL_58;
      }
      v60 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v131 = self->_installInfo;
        if (v131) {
          v131 = objc_getProperty(v131, v65, 80, 1);
        }
        id v132 = v131;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v132;
        _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "[%@] Automatic downloads are not permitted", buf, 0xCu);
      }
    }
    else
    {
      v60 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v127 = self->_installInfo;
        if (v127) {
          v127 = objc_getProperty(v127, v61, 80, 1);
        }
        id v128 = v127;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v128;
        _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "[%@] Automatic downloads have been disabled", buf, 0xCu);
      }
    }

    v64 = ASDErrorWithDescription();
LABEL_61:
    id v47 = v64;
    if (v47) {
      goto LABEL_36;
    }
LABEL_62:
    v66 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"supports_32bit_only"];
    unsigned int v67 = [v66 BOOLValue];

    if (v67)
    {
      v68 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v125 = self->_installInfo;
        if (v125) {
          v125 = objc_getProperty(v125, v69, 80, 1);
        }
        id v126 = v125;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v126;
        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "[%@] Application only supports 32-bit architecture", buf, 0xCu);
      }
      v70 = ASDErrorWithDescription();
    }
    else
    {
      v70 = 0;
    }
    id v71 = v70;
    id v49 = v71;

    if (v71) {
      goto LABEL_37;
    }
    if (+[AMSDevice deviceIsAppleTV]
      && ([(SQLiteMemoryEntity *)self->_install valueForProperty:@"restore_type"],
          v72 = objc_claimAutoreleasedReturnValue(),
          id v73 = [v72 integerValue],
          v72,
          v73 == (id)1))
    {
      id v149 = 0;
      unsigned __int8 v74 = sub_100279B34(v17, &v149);
      id v18 = v149;
      if ((v74 & 1) == 0)
      {
        uint64_t v46 = sub_1003A9EB8((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v17, v18);
        goto LABEL_32;
      }
    }
    else
    {
      id v18 = 0;
    }
    if (!v17)
    {
LABEL_118:
      sub_100285600((uint64_t)AppProgressCoordinator, self->_install, @"Restart");
      v117 = [(SQLiteMemoryEntity *)self->_package valueForProperty:@"data_promise_id"];
      if (v117)
      {
        id v143 = v18;
        v118 = sub_1002C8A7C([CoordinatorPromiseProvider alloc], v17, &v143);
        id v119 = v143;

        v120 = sub_1002C8BB4(v118, v117, 0);
        if ([v120 isComplete])
        {
          v121 = [(SQLiteMemoryEntity *)self->_install databaseID];
          v122 = v17;
          id v123 = v17;
          self;
          uint64_t v32 = (uint64_t)sub_1003AB218((id *)[AppInstallPreambleResponse alloc], v121, (void *)3, v123, 0);

          v17 = v122;
LABEL_125:

          id v18 = v119;
          goto LABEL_39;
        }
      }
      else
      {
        id v119 = v18;
      }
      v124 = [(SQLiteMemoryEntity *)self->_install databaseID];
      v118 = v17;
      self;
      uint64_t v32 = (uint64_t)sub_1003AB218((id *)[AppInstallPreambleResponse alloc], v124, (void *)1, v118, 0);
      goto LABEL_125;
    }
    if ([v17 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithPlaceholderPromise]
      && [v17 creatorIdentifier] == (id)1
      && (sub_100279094(v17) & 1) == 0)
    {
      v75 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v77 = self->_installInfo;
        if (v77) {
          v77 = objc_getProperty(v77, v76, 80, 1);
        }
        id v78 = v77;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v78;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "[%@] Setting a placeholder promise in Preamble because the coordinator doesn't already have one", buf, 0xCu);
      }
      v79 = self->_install;
      package = self->_package;
      id v148 = v18;
      sub_10032B5F0(v79, package, &v148);
      id v81 = (id)objc_claimAutoreleasedReturnValue();
      id v82 = v148;

      id v147 = v82;
      v83 = sub_10032A178((uint64_t)v81, &v147);
      id v84 = v147;

      if (v83)
      {
        id v146 = v84;
        unsigned __int8 v85 = sub_10027A504(v17, v83, &v146);
        id v18 = v146;

        if (v85)
        {

          goto LABEL_83;
        }
        [v83 cancelForReason:v18 client:1 error:0];
      }
      else
      {
        id v18 = v84;
      }
      uint64_t v32 = sub_1003A9EB8((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v17, v18);

      goto LABEL_147;
    }
LABEL_83:
    if (![v17 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithInitialODRAssetPromises])goto LABEL_115; {
    if ((uint64_t)sub_10026E91C(self->_package, @"initial_odr_size") >= 1)
    }
    {
      v86 = self->_install;
      id v145 = 0;
      sub_1004253D0(v86, &v145);
      id v81 = (id)objc_claimAutoreleasedReturnValue();
      id v87 = v145;
      if (!v87)
      {
        sub_10029F878((uint64_t)ODRInstallContext, v81);
        v98 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        v99 = sub_10026E95C(self->_install, @"log_code");
        unsigned __int8 v100 = [v99 isEqualToString:@"APR"];
        if (v98) {
          v98[16] = v100;
        }

        v102 = sub_10026E95C(self->_install, @"client_id");
        if (v98) {
          objc_setProperty_atomic_copy(v98, v101, v102, 80);
        }

        v103 = [v17 uniqueIdentifier];
        v105 = v103;
        if (v98)
        {
          objc_setProperty_atomic_copy(v98, v104, v103, 40);

          v98[19] = self->_restoreType != 0;
        }
        else
        {
        }
        v107 = sub_10026E95C(self->_package, @"variant_id");
        if (v98) {
          objc_setProperty_atomic_copy(v98, v106, v107, 96);
        }

        v108 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v110 = self->_installInfo;
          if (v110) {
            v110 = objc_getProperty(v110, v109, 80, 1);
          }
          id v112 = v110;
          if (v98) {
            id v113 = objc_getProperty(v98, v111, 64, 1);
          }
          else {
            id v113 = 0;
          }
          id v114 = v113;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v112;
          __int16 v152 = 2114;
          id v153 = v114;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "[%@] Checking for initial/prefetch downloads with key %{public}@", buf, 0x16u);

          v11 = v34;
        }

        v115 = sub_10040EBA8();
        sub_100412F84((uint64_t)v115, v98);

LABEL_114:
LABEL_115:
        if ([v17 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithDeviceSecurityPromise])
        {
          id v144 = v18;
          unsigned __int8 v116 = sub_100279C2C(v17, &v144);
          id v49 = v144;

          if ((v116 & 1) == 0)
          {
            uint64_t v50 = sub_1003A9EB8((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v17, v49);
            goto LABEL_38;
          }
          id v18 = v49;
        }
        goto LABEL_118;
      }
      v88 = v87;
      v89 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        v138 = self->_installInfo;
        if (v138) {
          v138 = objc_getProperty(v138, v90, 80, 1);
        }
        id v139 = v138;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v139;
        __int16 v152 = 2114;
        id v153 = v88;
        _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "[%@] Error getting store metadata: %{public}@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    unsigned __int8 v91 = sub_100279A74(v17, buf);
    id v81 = *(id *)buf;
    if ((v91 & 1) == 0)
    {
      uint64_t v32 = sub_1003A9E40((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v81);
LABEL_147:

      goto LABEL_39;
    }
    goto LABEL_114;
  }
  v31 = ASDErrorWithDescription();
  uint64_t v32 = sub_1003A9DB8((uint64_t)AppInstallPreambleResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], 0, v31);

LABEL_40:
  v51 = self;
  objc_sync_enter(v51);
  response = v51->_response;
  v51->_response = (AppInstallPreambleResponse *)v32;

  objc_sync_exit(v51);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_installInfo, 0);
  objc_storeStrong((id *)&self->_install, 0);
}

@end