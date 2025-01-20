@interface AppInstallPostambleTask
- (void)main;
@end

@implementation AppInstallPostambleTask

- (void)main
{
  if (sub_10026E91C(self->_install, @"coordinator_intent") == (id)6)
  {
    v3 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = sub_100424C14(&self->_install->super.super.isa);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@] Skipping postamble - installation is occurring on another device", buf, 0xCu);
    }
    return;
  }
  v5 = sub_10026E82C(self->_install, @"previous_galette_mode");
  v6 = v5;
  if (v5 && ![v5 integerValue])
  {
    id v7 = objc_alloc((Class)LSApplicationRecord);
    v8 = sub_100424D84(self->_install);
    v120 = 0;
    id v9 = [v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v120];
    v10 = v120;

    if (v9)
    {
      if (objc_msgSend(v9, "asd_galetteMode"))
      {
        v11 = +[GaletteStore shared];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100408544;
        v126 = (void **)&unk_10052A230;
        v127 = self;
        [v11 modifyUsingTransaction:buf];
      }
    }
    else
    {
      v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v112 = sub_100424C14(&self->_install->super.super.isa);
        v113 = sub_100424D84(self->_install);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v112;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v113;
        *(_WORD *)&buf[22] = 2114;
        v126 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%@] Error looking up record %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  v13 = sub_1003DA6D4();
  unsigned int v14 = [v13 isHRNMode];

  if (v14)
  {
    v15 = sub_10026E95C(self->_install, @"client_id");
    int64_t sourceType = self->_sourceType;
    if (sourceType != 3 && sourceType != 0) {
      goto LABEL_24;
    }
    if ([@"dmd" isEqualToString:v15])
    {
      unsigned int v14 = 1;
    }
    else
    {
      if (!os_variant_has_internal_content())
      {
LABEL_24:
        unsigned int v14 = 0;
        goto LABEL_25;
      }
      unsigned int v14 = [@"asclient" isEqualToString:v15];
    }
LABEL_25:
  }
  id v18 = sub_10026E91C(self->_package, @"archive_type");
  if (self->_sourceType) {
    int v19 = v14;
  }
  else {
    int v19 = 1;
  }
  if (v19 == 1 && (unint64_t)v18 <= 1)
  {
    id v21 = objc_alloc((Class)ASDBundle);
    v22 = sub_100424D84(self->_install);
    id v23 = [v21 initWithIdentifier:v22];

    if (!v23
      || (v24 = [[ApplicationProxy alloc] initWithBundle:v23],
          [(ApplicationProxy *)v24 validLocationProxy],
          v25 = objc_claimAutoreleasedReturnValue(),
          v24,
          !v25))
    {
      v29 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = sub_100424C14(&self->_install->super.super.isa);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v33;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%@] Failed to write receipt - application was not found!", buf, 0xCu);
      }
      goto LABEL_55;
    }
    v26 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"receipt"];
    v27 = sub_100424C14(&self->_install->super.super.isa);
    v120 = 0;
    int v28 = sub_1003D5530((uint64_t)WriteReceipt, v26, v25, v27, &v120);
    v29 = v120;

    if (v28)
    {
      uint64_t v30 = ASDLogHandleForCategory();
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = sub_100424C14(&self->_install->super.super.isa);
        id v32 = [v26 length];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v32;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "[%@] Sucessfully wrote receipt (%{bytes}lu)", buf, 0x16u);
      }
    }
    else
    {
      v34 = sub_1003DA6D4();
      int v35 = [v34 isHRNMode];

      if (v35)
      {
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      v36 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v114 = sub_100424C14(&self->_install->super.super.isa);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v114;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "[%@] Receipt was missing or invalid, attempting to request new receipt", buf, 0xCu);
      }
      uint64_t v30 = (uint64_t)sub_100224624((id *)[AppReceiptTask alloc], v25);
      v37 = +[ACAccountStore ams_sharedAccountStore];
      v38 = objc_msgSend(v37, "ams_activeiTunesAccount");
      v40 = v38;
      if (v30)
      {
        objc_setProperty_nonatomic_copy((id)v30, v39, v38, 56);

        *(unsigned char *)(v30 + 48) = 1;
      }
      else
      {
      }
      v41 = sub_100424C14(&self->_install->super.super.isa);
      v43 = v41;
      if (v30)
      {
        objc_setProperty_nonatomic_copy((id)v30, v42, v41, 64);

        if ([v25 hasMIDBasedSINF]) {
          *(void *)(v30 + 72) = 8;
        }
      }
      else
      {

        [v25 hasMIDBasedSINF];
      }
      v119 = v29;
      unsigned __int8 v44 = [(Task *)self runSubTask:v30 returningError:&v119];
      v45 = v119;

      if ((v44 & 1) == 0)
      {
        v46 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v115 = sub_100424C14(&self->_install->super.super.isa);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v115;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v45;
          _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "[%@] Failed fetching receipt with error: %{public}@", buf, 0x16u);
        }
      }
      v29 = v45;
    }

    goto LABEL_54;
  }
LABEL_56:
  v47 = sub_1004253D0(&self->_install->super.super.isa, 0);
  unsigned int v48 = [v47 isGameCenterEnabled];

  if (v48)
  {
    v49 = sub_100424C14(&self->_install->super.super.isa);
    v50 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v49;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying Game Center of app install", buf, 0xCu);
    }

    v120 = 0;
    uint64_t v121 = (uint64_t)&v120;
    uint64_t v122 = 0x2050000000;
    v51 = (void *)qword_1005B13C0;
    v123 = (void *)qword_1005B13C0;
    if (!qword_1005B13C0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100408C64;
      v126 = (void **)&unk_1005243D0;
      v127 = (AppInstallPostambleTask *)&v120;
      sub_100408C64((uint64_t)buf);
      v51 = *(void **)(v121 + 24);
    }
    id v52 = v51;
    _Block_object_dispose(&v120, 8);
    v53 = sub_10026E95C(self->_install, @"bundle_id");
    v120 = _NSConcreteStackBlock;
    uint64_t v121 = 3221225472;
    uint64_t v122 = (uint64_t)sub_1004085AC;
    v123 = &unk_100521910;
    id v124 = v49;
    id v54 = v49;
    [v52 gameCenterEnabledGameInstalled:v53 withCompletionHandler:&v120];
  }
  if (!sub_10026E7EC(self->_install, @"has_background_assets_extension")) {
    goto LABEL_96;
  }
  id v55 = objc_alloc_init((Class)BAAppStoreClient);
  if ((sub_10026E91C(self->_install, @"post_processing_state") & 2) == 0)
  {
    id v56 = sub_10026E91C(self->_install, @"restore_type");
    install = self->_install;
    if (install) {
      install = sub_10026E91C(install, @"source_type");
    }
    BOOL v58 = install == (void *)2;
    if (v56)
    {
      v59 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = sub_100424C14(&self->_install->super.super.isa);
        v61 = sub_100424DF4(self->_install);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v61;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that a restore is ready for processing (Postamble): %{public}@", buf, 0x16u);
      }
      v62 = sub_100424D84(self->_install);
      v63 = sub_100424DF4(self->_install);
      v64 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v62 appBundleURL:v63 event:12 client:v58];

      [v64 setUserInitiated:sub_100424B7C(self->_install) ^ 1];
      v65 = self->_install;
      if (v65)
      {
LABEL_82:
        BOOL v79 = sub_10026E91C(v65, @"automatic_type") != 0;
        goto LABEL_83;
      }
      BOOL v79 = 0;
    }
    else
    {
      v67 = self->_install;
      if (v67) {
        BOOL v68 = sub_10026E91C(v67, @"update_type") != 0;
      }
      else {
        BOOL v68 = 0;
      }
      v69 = ASDLogHandleForCategory();
      BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
      if (v68)
      {
        if (v70)
        {
          v71 = sub_100424C14(&self->_install->super.super.isa);
          v72 = sub_100424DF4(self->_install);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v71;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v72;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that an update is ready for processing (Postamble): %{public}@", buf, 0x16u);
        }
        v73 = sub_100424D84(self->_install);
        v74 = sub_100424DF4(self->_install);
        v64 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v73 appBundleURL:v74 event:11 client:v58];

        [v64 setUserInitiated:sub_100424B7C(self->_install) ^ 1];
        v65 = self->_install;
        if (v65) {
          goto LABEL_82;
        }
        BOOL v79 = 0;
      }
      else
      {
        if (v70)
        {
          v75 = sub_100424C14(&self->_install->super.super.isa);
          v76 = sub_100424DF4(self->_install);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v75;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v76;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that an install is ready for processing (Postamble): %{public}@", buf, 0x16u);
        }
        v77 = sub_100424D84(self->_install);
        v78 = sub_100424DF4(self->_install);
        v64 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v77 appBundleURL:v78 event:10 client:v58];

        [v64 setUserInitiated:sub_100424B7C(self->_install) ^ 1];
        v65 = self->_install;
        if (v65) {
          goto LABEL_82;
        }
        BOOL v79 = 0;
      }
    }
LABEL_83:
    [v64 setAutomaticInstall:v79];
    v119 = 0;
    unsigned __int8 v80 = [v55 performEventWithDescriptor:v64 error:&v119];
    v66 = v119;

    if ((v80 & 1) == 0)
    {
      v81 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v111 = sub_100424C14(&self->_install->super.super.isa);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v111;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v66;
        _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "[%@] Failed to tell Background Assets that an install/update/restore was ready for processing (Postamble): %{public}@", buf, 0x16u);
      }
    }
    goto LABEL_87;
  }
  v66 = 0;
LABEL_87:
  v82 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    v83 = sub_100424C14(&self->_install->super.super.isa);
    v84 = sub_100424DF4(self->_install);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v83;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v84;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that our install job is complete: %{public}@", buf, 0x16u);
  }
  v85 = sub_100424D84(self->_install);
  v86 = sub_100424DF4(self->_install);
  v87 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v85 appBundleURL:v86 event:30 client:0];

  [v87 setUserInitiated:sub_100424B7C(self->_install) ^ 1];
  v88 = self->_install;
  if (v88) {
    BOOL v89 = sub_10026E91C(v88, @"automatic_type") != 0;
  }
  else {
    BOOL v89 = 0;
  }
  [v87 setAutomaticInstall:v89];
  v118 = v66;
  unsigned __int8 v90 = [v55 performEventWithDescriptor:v87 error:&v118];
  v91 = v118;

  if ((v90 & 1) == 0)
  {
    v92 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      v109 = sub_100424C14(&self->_install->super.super.isa);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v109;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v91;
      _os_log_error_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "[%@] Failed to tell Background Assets that our install job was complete: %{public}@", buf, 0x16u);
    }
  }

LABEL_96:
  if (sub_10026E7EC(self->_install, @"default_browser"))
  {
    uint64_t v117 = 0;
    id v93 = objc_alloc((Class)LSApplicationRecord);
    v94 = sub_100424D84(self->_install);
    id v95 = [v93 initForInstallMachineryWithBundleIdentifier:v94 placeholder:0 error:&v117];

    v96 = ASDLogHandleForCategory();
    v97 = v96;
    if (v95)
    {
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        v98 = sub_100424C14(&self->_install->super.super.isa);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v98;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "[%@] Configuring as default web browser", buf, 0xCu);
      }
      v99 = +[LSApplicationWorkspace defaultWorkspace];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10040867C;
      v126 = (void **)&unk_1005274D8;
      v127 = self;
      id v128 = v95;
      [v99 setDefaultWebBrowserToApplicationRecord:v128 completionHandler:buf];
    }
    else
    {
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
      {
        v110 = sub_100424C14(&self->_install->super.super.isa);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v110;
        _os_log_fault_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_FAULT, "[%@] Failed to retrieve app record for default browser just installed!", buf, 0xCu);
      }
    }
  }
  v100 = sub_10026E82C(self->_install, @"metrics_install_type");
  char v101 = [v100 unsignedCharValue];

  v102 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"bundle_id"];
  if (v102)
  {
    v103 = sub_1002E1CF4();
    *(void *)buf = v102;
    v104 = +[NSArray arrayWithObjects:buf count:1];
    sub_1002E50AC((uint64_t)v103, v104, v101, 1);
  }
  if (self->_sourceType == 1)
  {
    id v105 = objc_alloc_init((Class)AMSUniversalLinks);
    v106 = [v105 updateUniversalLinks];
    [v106 addFinishBlock:&stru_10052D268];
  }
  v107 = sub_100424D84(self->_install);
  unsigned int v108 = [v107 isEqualToString:@"com.apple.AppStore"];

  if (v108)
  {
    sub_1002B3410();
    id v116 = (id)objc_claimAutoreleasedReturnValue();
    sub_1002B7774((uint64_t)v116);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_install, 0);
}

@end