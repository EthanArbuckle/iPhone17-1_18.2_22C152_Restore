@interface SwitchAppOwnerTask
- (void)main;
@end

@implementation SwitchAppOwnerTask

- (void)main
{
  v3 = sub_10030B11C();
  id v157 = 0;
  v4 = sub_10030B9EC((uint64_t)v3, @"switch-arcade-user", &v157);
  id v5 = v157;

  if (v5)
  {
    v6 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v162 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[SwitchArcade]: Error reading switch bag key. Error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    v6 = sub_10030B11C();
    v7 = [v6 URLForKey:@"switch-arcade-user"];
    swithUserBagUrl = self->_swithUserBagUrl;
    self->_swithUserBagUrl = v7;
  }
LABEL_7:
  id newValue = v5;
  v9 = self->_swithUserBagUrl;
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(ApplicationProxy *)self->_proxy bundleID];
    fromUserName = self->_fromUserName;
    v13 = [(ACAccount *)self->_account username];
    v14 = [(ACAccount *)self->_account ams_DSID];
    *(_DWORD *)buf = 138544643;
    id v162 = v11;
    __int16 v163 = 2113;
    *(void *)v164 = fromUserName;
    *(_WORD *)&v164[8] = 2113;
    *(void *)&v164[10] = v13;
    __int16 v165 = 2114;
    v166 = v14;
    __int16 v167 = 1024;
    BOOL v168 = v9 != 0;
    __int16 v169 = 1024;
    BOOL v170 = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Starting switch bundleID: %{public}@ fromUserName: %{private}@ toUserName: %{private}@/%{public}@ usingSwithArcadeUserEndpoint: %d hadURL: %d", buf, 0x36u);
  }
  v156 = v4;

  v15 = &OBJC_IVAR___XDCAppMetadata__bundleID;
  if (!v9)
  {
    v32 = sub_1003D4A3C();
    sub_1003D4C80((uint64_t)v32, 3);
    sub_1003D4D3C((uint64_t)v32, 4);
    sub_1003D4B04((uint64_t)v32, 60);
    v33 = [RestoreAppInstall alloc];
    v34 = [(ApplicationProxy *)self->_proxy storeMetadata];
    if (v33) {
      id v35 = sub_1003B7A80(v33, v34, 1, -1, v32);
    }
    else {
      id v35 = 0;
    }

    v36 = [(ApplicationProxy *)self->_proxy deviceIdentifierForVendor];
    if (v36)
    {
      id v37 = [objc_alloc((Class)NSUUID) initWithUUIDString:v36];
      if (v37 && v35) {
        [v35 setValue:v37 forProperty:@"vid"];
      }
    }
    v38 = [ContentRestoreTask alloc];
    id v171 = v35;
    v39 = +[NSArray arrayWithObjects:&v171 count:1];
    v40 = sub_10025D64C((id *)&v38->super.super.super.isa, v39, self->_account);

    id v160 = 0;
    BOOL v41 = [(Task *)self runSubTask:v40 returningError:&v160];
    v42 = v160;
    if (v42)
    {
      os_log_t v44 = v42;
      v45 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v138 = [(ApplicationProxy *)self->_proxy bundleID];
        *(_DWORD *)buf = 138543618;
        id v162 = v138;
        __int16 v163 = 2112;
        *(void *)v164 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "[SwitchArcade] [%{public}@] Content restore call resulted in error: %@", buf, 0x16u);
      }
      goto LABEL_130;
    }
    if (v40) {
      id Property = objc_getProperty(v40, v43, 56, 1);
    }
    else {
      id Property = 0;
    }
    id v48 = Property;
    v45 = [v48 firstObject];

    if (v45)
    {
      id v50 = objc_getProperty(v45, v49, 72, 1);
      v52 = v50;
      if (v50) {
        id v50 = objc_getProperty(v50, v51, 144, 1);
      }
    }
    else
    {
      v52 = 0;
      id v50 = 0;
    }
    id v53 = v50;

    if (!v53)
    {
      v154 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
      {
        v143 = [(ApplicationProxy *)self->_proxy bundleID];
        *(_DWORD *)buf = 138543362;
        id v162 = v143;
        _os_log_error_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "[SwitchArcade]: Unable to find SINF in server response for bundleID: %{public}@", buf, 0xCu);
      }
      os_log_t v44 = 0;
      goto LABEL_129;
    }
    v151 = v36;
    v54 = [(ApplicationProxy *)self->_proxy applicationIdentity];
    v55 = [(ApplicationProxy *)self->_proxy bundleURL];
    id v159 = 0;
    id v153 = v53;
    unsigned int v56 = sub_100279608((uint64_t)IXAppInstallCoordinator, v54, (uint64_t)v55, v53, (uint64_t)&v159);
    v57 = v159;

    v58 = ASDLogHandleForCategory();
    v59 = v58;
    if (!v56)
    {
      v154 = v58;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v144 = [(ApplicationProxy *)self->_proxy bundleID];
        *(_DWORD *)buf = 138543618;
        id v162 = v144;
        __int16 v163 = 2114;
        *(void *)v164 = v57;
        _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "[SwitchArcade]: Unable to swap SINF for bundleID: %{public}@ error: %{public}@", buf, 0x16u);
      }
      BOOL v41 = 0;
      os_log_t v44 = v57;
      v36 = v151;
      id v53 = v153;
      goto LABEL_129;
    }
    os_log_t log = v57;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v60 = [(ApplicationProxy *)self->_proxy bundleID];
      v61 = [(ACAccount *)self->_account ams_DSID];
      *(_DWORD *)buf = 138543618;
      id v162 = v60;
      __int16 v163 = 2114;
      *(void *)v164 = v61;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Updated SINF for bundleID: %{public}@ to account: %{public}@", buf, 0x16u);
    }
    v36 = v151;
    if (!v45 || (v62 = sub_1003A77CC(v45, self->_account, 1)) == 0)
    {
      v134 = ASDLogHandleForCategory();
      v148 = v134;
      if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
      {
        v145 = [(ApplicationProxy *)self->_proxy bundleID];
        *(_DWORD *)buf = 138543362;
        id v162 = v145;
        _os_log_error_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_ERROR, "[SwitchArcade]: Unable to generate new metadata for bundleID: %{public}@", buf, 0xCu);
      }
      v154 = 0;
      BOOL v41 = 1;
      os_log_t v44 = log;
      goto LABEL_128;
    }
    v63 = v62;
    v64 = [(ApplicationProxy *)self->_proxy bundleID];
    uint64_t v65 = [(ApplicationProxy *)self->_proxy bundleURL];
    v66 = v63;
    v67 = (void *)v65;
    os_log_t v158 = log;
    v154 = v66;
    unsigned int v147 = sub_100401B48(v66, v64, v65, &v158);
    os_log_t v44 = v158;

    if (!v147)
    {
      BOOL v41 = 0;
      id v53 = v153;
LABEL_129:

LABEL_130:
      buf[0] = v41;

      goto LABEL_131;
    }
    v69 = objc_getProperty(v45, v68, 40, 1);
    if (v69) {
      sub_1003EBD14((uint64_t)self, self->_proxy, v69);
    }
    v148 = v69;
    v70 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = [(ApplicationProxy *)self->_proxy bundleID];
      v72 = [(ACAccount *)self->_account ams_DSID];
      *(_DWORD *)buf = 138543618;
      id v162 = v71;
      __int16 v163 = 2114;
      *(void *)v164 = v72;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Updated metadata for bundleID: %{public}@ to account: %{public}@", buf, 0x16u);
    }
    id v73 = [(ApplicationProxy *)self->_proxy canonicalExecutablePath];
    [v73 fileSystemRepresentation];
    sub_10014C990();
    int v75 = v74;

    BOOL v41 = v75 == 0;
    v76 = ASDLogHandleForCategory();
    BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
    if (v75)
    {
      int v146 = v75;
      v4 = v156;
      if (v77)
      {
        [(ApplicationProxy *)self->_proxy bundleID];
        v78 = loga = v76;
        *(_DWORD *)buf = 138543618;
        id v162 = v78;
        __int16 v163 = 2048;
        *(void *)v164 = v146;
        _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Not launching following SINF update for bundleID: %{public}@ subscription status: %ld", buf, 0x16u);
LABEL_126:

        v76 = loga;
      }
    }
    else
    {
      v4 = v156;
      if (v77)
      {
        [(ApplicationProxy *)self->_proxy bundleID];
        v78 = loga = v76;
        v141 = [(ACAccount *)self->_account ams_DSID];
        *(_DWORD *)buf = 138543618;
        id v162 = v78;
        __int16 v163 = 2114;
        *(void *)v164 = v141;
        _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Launching for bundleID: %{public}@ to account: %{public}@", buf, 0x16u);

        v4 = v156;
        goto LABEL_126;
      }
    }

LABEL_128:
    id v53 = v153;

    goto LABEL_129;
  }
  v16 = [SwitchAppOwnerURLRequestEncoder alloc];
  v17 = sub_10030B11C();
  v18 = [(SwitchAppOwnerURLRequestEncoder *)v16 initWithBag:v17];

  if (self->_account) {
    -[SwitchAppOwnerURLRequestEncoder setAccount:](v18, "setAccount:");
  }
  v152 = v18;
  v19 = objc_opt_new();
  v20 = +[AMSDevice deviceGUID];
  if (v20) {
    [v19 setObject:v20 forKeyedSubscript:@"guid"];
  }
  id v21 = objc_alloc((Class)LSApplicationRecord);
  v22 = [(ApplicationProxy *)self->_proxy bundleID];
  id v23 = [v21 initWithBundleIdentifier:v22 allowPlaceholder:0 error:0];

  if (!v23)
  {
    v46 = 0;
    id v31 = 0;
LABEL_56:

    goto LABEL_58;
  }
  v24 = [v23 URL];
  v25 = [v24 path];

  v26 = [v23 executableURL];
  v27 = [v26 lastPathComponent];
  v28 = [v27 stringByAppendingPathExtension:@"sinf"];

  if ([v25 length] && objc_msgSend(v28, "length"))
  {
    id v29 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v25, @"SC_Info", v28, 0);
    v30 = +[NSString pathWithComponents:v29];
    if (v30) {
      id v31 = [objc_alloc((Class)NSData) initWithContentsOfFile:v30];
    }
    else {
      id v31 = 0;
    }
  }
  else
  {
    id v31 = 0;
  }

  if (v31)
  {
    v46 = [v31 base64EncodedStringWithOptions:0];
    v15 = &OBJC_IVAR___XDCAppMetadata__bundleID;
    if (v46) {
      [v19 setObject:v46 forKeyedSubscript:@"existingSinf"];
    }
    goto LABEL_56;
  }
  v15 = &OBJC_IVAR___XDCAppMetadata__bundleID;
LABEL_58:
  id v79 = objc_alloc((Class)LSApplicationRecord);
  v80 = [*(id *)((char *)&self->super.super.super.isa + v15[755]) bundleID];
  id v81 = [v79 initWithBundleIdentifier:v80 allowPlaceholder:0 error:0];

  if (!v81)
  {
    v87 = 0;
    id v86 = 0;
    v85 = v152;
LABEL_66:

    goto LABEL_68;
  }
  v82 = [v81 dataContainerURL];
  v83 = [v82 URLByAppendingPathComponent:@"StoreKit"];
  v84 = [v83 URLByAppendingPathComponent:@"receipt"];

  v85 = v152;
  if (v84) {
    id v86 = [objc_alloc((Class)NSData) initWithContentsOfURL:v84];
  }
  else {
    id v86 = 0;
  }

  if (v86)
  {
    v87 = [v86 base64EncodedStringWithOptions:0];
    v15 = &OBJC_IVAR___XDCAppMetadata__bundleID;
    if (v87) {
      [v19 setObject:v87 forKeyedSubscript:@"existingReceipt"];
    }
    goto LABEL_66;
  }
  v15 = &OBJC_IVAR___XDCAppMetadata__bundleID;
LABEL_68:
  v88 = [*(id *)((char *)&self->super.super.super.isa + v15[755]) deviceIdentifierForVendor];
  if (v88) {
    [v19 setObject:v88 forKeyedSubscript:@"vid"];
  }

  v89 = [(SwitchAppOwnerURLRequestEncoder *)v85 requestWithMethod:4 bagURL:self->_swithUserBagUrl parameters:v19];
  id v171 = 0;
  v90 = [v89 resultWithError:&v171];
  id v91 = v171;

  v92 = sub_1000169A4();
  v93 = sub_100223974((uint64_t)AMSURLSession, v92);

  v94 = [v93 dataTaskPromiseWithRequest:v90];
  id v160 = v91;
  v95 = [v94 resultWithError:&v160];
  id v96 = v160;

  if (v96)
  {
    v97 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v162 = v96;
      _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "[SwitchArcade]: Resulted with error: %{public}@", buf, 0xCu);
    }

    id v98 = v96;
    v99 = 0;
  }
  else
  {
    v99 = [v95 object];
  }

  id v100 = v96;
  v101 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v162 = v99;
    _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Result: %{public}@", buf, 0xCu);
  }

  v102 = [v99 objectForKeyedSubscript:@"sinfs"];
  v4 = v156;
  if ([v102 count])
  {
    v103 = [v102 firstObject];
    v104 = [v103 objectForKeyedSubscript:@"sinf"];

    id v105 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v104 options:0];
    if (!v105)
    {
      v114 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        v140 = [(ApplicationProxy *)self->_proxy bundleID];
        *(_DWORD *)buf = 138543362;
        id v162 = v140;
        _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "[SwitchArcade]: Unable to decode SINF on app with bundleID: %{public}@", buf, 0xCu);
      }
      uint8_t v113 = 0;
      goto LABEL_119;
    }
    v106 = v105;
    v107 = [(ApplicationProxy *)self->_proxy applicationIdentity];
    v108 = [(ApplicationProxy *)self->_proxy bundleURL];
    id v171 = v100;
    unsigned int v109 = sub_100279608((uint64_t)IXAppInstallCoordinator, v107, (uint64_t)v108, v106, (uint64_t)&v171);
    id v110 = v171;

    v111 = ASDLogHandleForCategory();
    v112 = v111;
    if (v110)
    {
      v4 = v156;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        v139 = [(ApplicationProxy *)self->_proxy bundleID];
        *(_DWORD *)buf = 138543874;
        id v162 = v139;
        __int16 v163 = 1024;
        *(_DWORD *)v164 = v109;
        *(_WORD *)&v164[4] = 2114;
        *(void *)&v164[6] = v110;
        _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "[SwitchArcade]:Replaced SINF on app with bundleID: %{public}@ result: %d error: %{public}@", buf, 0x1Cu);
      }
      if ((v109 & 1) == 0)
      {
        uint8_t v113 = 0;
LABEL_121:
        id v100 = v110;
        goto LABEL_122;
      }
LABEL_90:
      v116 = [v99 objectForKeyedSubscript:@"replacementReceipt"];
      if (v116)
      {
        id v117 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v116 options:0];
        int v118 = sub_1003EBD14((uint64_t)self, self->_proxy, v117);
        v119 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          v120 = [(ApplicationProxy *)self->_proxy bundleID];
          *(_DWORD *)buf = 138543618;
          id v162 = v120;
          __int16 v163 = 1024;
          *(_DWORD *)v164 = v118;
          _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Replaced receipt on app with bundleID: %{public}@ result: %d", buf, 0x12u);
        }
      }

      v121 = [(ApplicationProxy *)self->_proxy storeMetadata];
      v104 = v121;
      if (v121)
      {
        sub_100401854(v121, self->_account);
        v122 = [(ACAccount *)self->_account ams_DSID];
        [v104 setPurchaserID:v122];

        v123 = [(ApplicationProxy *)self->_proxy bundleID];
        v124 = [(ApplicationProxy *)self->_proxy bundleURL];
        id v160 = v110;
        unsigned int v125 = sub_100401B48(v104, v123, (uint64_t)v124, &v160);
        id v100 = v160;

        if (v125)
        {
          v126 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            v127 = [(ApplicationProxy *)self->_proxy bundleID];
            v128 = [(ACAccount *)self->_account ams_DSID];
            *(_DWORD *)buf = 138543618;
            id v162 = v127;
            __int16 v163 = 2114;
            *(void *)v164 = v128;
            _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: Updated metadata for bundleID: %{public}@ to account: %{public}@", buf, 0x16u);
          }
          id v129 = [(ApplicationProxy *)self->_proxy canonicalExecutablePath];
          [v129 fileSystemRepresentation];
          sub_10014C990();
          int v131 = v130;

          v114 = ASDLogHandleForCategory();
          BOOL v132 = os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
          if (v131)
          {
            if (v132)
            {
              v133 = [(ApplicationProxy *)self->_proxy bundleID];
              *(_DWORD *)buf = 138543618;
              id v162 = v133;
              __int16 v163 = 2048;
              *(void *)v164 = v131;
              _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: App with bundleID: %{public}@ not launchable following SINF update. Launch status: %ld", buf, 0x16u);
            }
            uint8_t v113 = 0;
          }
          else
          {
            if (v132)
            {
              v135 = [(ApplicationProxy *)self->_proxy bundleID];
              v136 = [(ACAccount *)self->_account ams_DSID];
              *(_DWORD *)buf = 138543618;
              id v162 = v135;
              __int16 v163 = 2114;
              *(void *)v164 = v136;
              _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]: App with bundleID: %{public}@ launchable with account: %{public}@", buf, 0x16u);
            }
            uint8_t v113 = 1;
          }
          v4 = v156;
LABEL_119:

          id v110 = v100;
          goto LABEL_120;
        }
        uint8_t v113 = 0;
        id v110 = v100;
        v4 = v156;
      }
      else
      {
        uint8_t v113 = 1;
      }
LABEL_120:

      goto LABEL_121;
    }
    v4 = v156;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v115 = [(ApplicationProxy *)self->_proxy bundleID];
      *(_DWORD *)buf = 138543618;
      id v162 = v115;
      __int16 v163 = 1024;
      *(_DWORD *)v164 = v109;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "[SwitchArcade]:Replaced SINF on app with bundleID: %{public}@ result: %d", buf, 0x12u);
    }
    if (v109) {
      goto LABEL_90;
    }
    id v100 = 0;
  }
  uint8_t v113 = 0;
LABEL_122:
  buf[0] = v113;

LABEL_131:
  uint8_t v142 = buf[0];
  objc_setProperty_atomic_copy(self, v137, newValue, 32);
  self->super._success = v142;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swithUserBagUrl, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_fromUserName, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end