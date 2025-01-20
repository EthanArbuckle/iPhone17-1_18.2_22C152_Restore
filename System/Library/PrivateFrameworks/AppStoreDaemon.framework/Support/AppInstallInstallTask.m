@interface AppInstallInstallTask
- (void)main;
@end

@implementation AppInstallInstallTask

- (void)main
{
  if ((unint64_t)sub_10026E91C(self->_package, @"archive_type") > 1)
  {
    v13 = ASDErrorWithDescription();
    sub_100406234((uint64_t)AppInstallInstallResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v13);
    v14 = (AppInstallInstallResponse *)objc_claimAutoreleasedReturnValue();

    installResponse = self->_installResponse;
    self->_installResponse = v14;
    goto LABEL_114;
  }
  if (self->_coordinator)
  {
    id v3 = 0;
    goto LABEL_4;
  }
  v21 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138412290;
    v106 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@] Looking for existing coordinator to resynchronize installation", buf, 0xCu);
  }

  v23 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"coordinator_id"];
  if (!v23)
  {
    v39 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v73 = self->_logKey;
      *(_DWORD *)buf = 138412290;
      v106 = v73;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "[%@] No coordinator identifier was set", buf, 0xCu);
    }

    ASDErrorWithDescription();
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    sub_1004061B4((uint64_t)self);
    sub_100406234((uint64_t)AppInstallInstallResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v40);
    v38 = (AppInstallInstallResponse *)objc_claimAutoreleasedReturnValue();
    goto LABEL_113;
  }
  v24 = v23;
  id v103 = 0;
  sub_100278A30((uint64_t)IXAppInstallCoordinator, v23, (uint64_t)&v103);
  v25 = (IXAppInstallCoordinator *)objc_claimAutoreleasedReturnValue();
  id v3 = v103;
  coordinator = self->_coordinator;
  self->_coordinator = v25;

  if (self->_coordinator)
  {
LABEL_4:
    if (+[AMSDevice deviceIsAppleTV])
    {
      if (self->_coordinator)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(IXAppInstallCoordinator *)self->_coordinator conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithUserDataPromise])
          {
            v4 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
            {
              v5 = self->_logKey;
              *(_DWORD *)buf = 138412290;
              v106 = v5;
              _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@] Completing screen sync data promise", buf, 0xCu);
            }

            v6 = self->_coordinator;
            id v102 = v3;
            sub_100279B34(v6, &v102);
            id v7 = v102;

            id v3 = v7;
          }
        }
      }
    }
    id v8 = objc_alloc_init((Class)MIInstallOptions);
    [v8 setInstallTargetType:1];
    v9 = &OBJC_IVAR___XDCAppMetadata__bundleID;
    [v8 setAutoInstallOverride:sub_10026E91C(self->_install, @"auto_install_override")];
    v10 = -[SQLiteMemoryEntity valueForProperty:](self->_install, "valueForProperty:");
    unint64_t v11 = (unint64_t)[v10 integerValue];

    if (v11 == 1)
    {
      [v8 setSystemAppInstall:1];
      id v12 = 0;
      goto LABEL_66;
    }
    install = self->_install;
    id v104 = 0;
    v17 = sub_1004253D0(install, &v104);
    id v12 = v104;
    if ((v11 | 2) == 2)
    {
      if (!v17)
      {
        v49 = 0;
        goto LABEL_64;
      }
      v18 = [(SQLiteMemoryEntity *)self->_package valueForProperty:@"sinf"];
      v19 = v18;
      if (v18 && [v18 length])
      {
        [v8 setSinfData:v19];
        BOOL v20 = sub_10026E91C(self->_install, @"client_type") == (id)1;
        sub_1004019C4(v17, v19, v20);
      }
      else
      {
        v45 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          v76 = self->_logKey;
          *(_DWORD *)buf = 138412290;
          v106 = v76;
          _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "[%@] Refusing to install without required SINF", buf, 0xCu);
        }

        uint64_t v46 = ASDErrorWithDescription();

        id v8 = 0;
        id v12 = (id)v46;
      }
      v44 = sub_10026E95C(self->_install, @"alternate_icon_name");
      if ([v44 length])
      {
        v47 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = self->_logKey;
          *(_DWORD *)buf = 138412546;
          v106 = v48;
          __int16 v107 = 2114;
          v108 = v44;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[%@] Setting alternate icon: %{public}@", buf, 0x16u);
        }

        [v8 setAlternateIconName:v44];
      }
    }
    else
    {
      v41 = sub_1003DA6D4();
      unsigned int v42 = [v41 isHRNMode];

      if (!v42)
      {
LABEL_48:
        v49 = v8;
        if (!v8)
        {
          v9 = &OBJC_IVAR___XDCAppMetadata__bundleID;
LABEL_65:

          id v8 = v49;
LABEL_66:
          id v58 = v3;
          if (!v8) {
            id v58 = v12;
          }

          id v40 = v58;
          if (!v8) {
            goto LABEL_76;
          }
          v59 = self->_coordinator;
          id v104 = v40;
          unsigned __int8 v60 = sub_10027A3F4(v59, v8, &v104);
          id v61 = v104;

          if (v60)
          {
            if (sub_10026E7EC(*(id *)((char *)&self->super.super.super.isa + v9[900]), @"approved"))
            {
              v62 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                v63 = self->_logKey;
                *(_DWORD *)buf = 138412290;
                v106 = v63;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "[%@] Completing device security promise", buf, 0xCu);
              }

              v64 = self->_coordinator;
              if (v64
                && [(IXAppInstallCoordinator *)v64 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithDeviceSecurityPromise])
              {
                v65 = self->_coordinator;
                id v101 = v61;
                unsigned int v66 = sub_100279F30(v65, &v101);
                id v40 = v101;

                if (!v66)
                {
LABEL_76:
                  sub_1004061B4((uint64_t)self);
                  sub_100406234((uint64_t)AppInstallInstallResponse, [*(id *)((char *)&self->super.super.super.isa + v9[900]) databaseID], v40);
                  v38 = (AppInstallInstallResponse *)objc_claimAutoreleasedReturnValue();
LABEL_112:

                  goto LABEL_113;
                }
              }
              else
              {
                id v40 = v61;
              }
              v83 = sub_10027A614(self->_coordinator, 0);
              v84 = v83;
              if (v83 && [v83 count])
              {
                v85 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  v86 = self->_logKey;
                  *(_DWORD *)buf = 138412290;
                  v106 = v86;
                  _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "[%@] Found essential asset promises on the coordinator, presuming this is a restored coordinator that was previously paused during post-processing", buf, 0xCu);
                }

                v87 = *(Class *)((char *)&self->super.super.super.isa + v9[900]);
                if (v87)
                {
                  BOOL v88 = sub_10026E91C(v87, @"source_type") == (id)2;
                  v87 = *(Class *)((char *)&self->super.super.super.isa + v9[900]);
                }
                else
                {
                  BOOL v88 = 0;
                }
                v89 = sub_100424D84(v87);
                v90 = sub_100424DF4(*(void **)((char *)&self->super.super.super.isa + v9[900]));
                v91 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v89 appBundleURL:v90 event:21 client:v88];

                [v91 setUserInitiated:sub_100424B7C(*(id *)((char *)&self->super.super.super.isa + v9[900])) ^ 1];
                v92 = *(Class *)((char *)&self->super.super.super.isa + v9[900]);
                if (v92) {
                  BOOL v93 = sub_10026E91C(v92, @"automatic_type") != 0;
                }
                else {
                  BOOL v93 = 0;
                }
                [v91 setAutomaticInstall:v93];
                v94 = sub_10028E50C();
                sub_10028F004((uint64_t)v94, v91, self->_logKey);

                v95 = [(SQLiteMemoryEntity *)self->_install databaseID];
                self;
                v38 = (AppInstallInstallResponse *)sub_10040638C((id *)[AppInstallInstallResponse alloc], v95, (void *)4, 0);
              }
              else
              {
                id v96 = sub_10027A14C(self->_coordinator, 0);
                v97 = [(SQLiteMemoryEntity *)self->_install databaseID];
                self;
                v98 = [AppInstallInstallResponse alloc];
                if (v96 == (id)4) {
                  uint64_t v99 = 6;
                }
                else {
                  uint64_t v99 = 1;
                }
                v38 = (AppInstallInstallResponse *)sub_10040638C((id *)&v98->super.isa, v97, (void *)v99, 0);
              }

              goto LABEL_112;
            }
            sub_1004061B4((uint64_t)self);
            id v68 = [*(id *)((char *)&self->super.super.super.isa + v9[900]) databaseID];
            self;
            uint64_t v67 = (uint64_t)sub_10040638C((id *)[AppInstallInstallResponse alloc], v68, 0, 0);
          }
          else
          {
            sub_1004061B4((uint64_t)self);
            uint64_t v67 = sub_100406234((uint64_t)AppInstallInstallResponse, [*(id *)((char *)&self->super.super.super.isa + v9[900]) databaseID], v61);
          }
          v38 = (AppInstallInstallResponse *)v67;
          id v40 = v61;
          goto LABEL_112;
        }
        v50 = sub_10026E95C(self->_package, @"variant_id");
        [v17 setVariantID:v50];

        v9 = &OBJC_IVAR___XDCAppMetadata__bundleID;
        if (!v17)
        {
          v51 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            v78 = self->_logKey;
            *(_DWORD *)buf = 138412546;
            v106 = v78;
            __int16 v107 = 2114;
            v108 = 0;
            _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "[%@] Failed to process store metadata: %{public}@", buf, 0x16u);
          }
        }
        [v49 setITunesMetadata:v17];
        if (v11 == 2)
        {
          v52 = [(SQLiteMemoryEntity *)self->_package valueForProperty:@"provisioning_profiles"];
          id v53 = [v52 count];
          v54 = ASDLogHandleForCategory();
          v55 = v54;
          if (v53)
          {
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v56 = self->_logKey;
              v57 = [v52 count];
              *(_DWORD *)buf = 138412546;
              v106 = v56;
              __int16 v107 = 2048;
              v108 = v57;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[%@] Provided %lu provisioning profiles", buf, 0x16u);
            }

            v55 = sub_1003923F8(v52, &stru_10052D1D8);
            [v49 setProvisioningProfiles:v55];
          }
          else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v79 = self->_logKey;
            *(_DWORD *)buf = 138412290;
            v106 = v79;
            _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "[%@] No provisioning profiles were provided", buf, 0xCu);
          }
          v9 = &OBJC_IVAR___XDCAppMetadata__bundleID;
        }
        id v8 = 0;
LABEL_64:

        goto LABEL_65;
      }
      v19 = sub_10026E95C(self->_install, @"client_id");
      if (sub_10026E91C(self->_install, @"source_type") == (id)3
        && (([@"dmd" isEqualToString:v19] & 1) != 0
         || os_variant_has_internal_content()
         && [@"asclient" isEqualToString:v19]))
      {
        v43 = [(SQLiteMemoryEntity *)self->_package valueForProperty:@"sinf"];
        v44 = v43;
        if (v43) {
          BOOL v100 = [v43 length] != 0;
        }
        else {
          BOOL v100 = 0;
        }
        v74 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = self->_logKey;
          *(_DWORD *)buf = 138412802;
          v106 = v75;
          __int16 v107 = 2114;
          v108 = v19;
          __int16 v109 = 1024;
          LODWORD(v110) = v100;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "[%@] Configuring VPP manifest install for clientID: %{public}@ hasSINF: %{BOOL}d", buf, 0x1Cu);
        }

        if (v100)
        {
          [v8 setSinfData:v44];
          sub_1004019C4(v17, v44, 1);
        }
      }
      else
      {
        v44 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v72 = self->_logKey;
          *(_DWORD *)buf = 138412546;
          v106 = v72;
          __int16 v107 = 2114;
          v108 = v19;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[%@] SKippping configuration of non-VPP install for clientID: %{public}@", buf, 0x16u);
        }
      }
    }

    goto LABEL_48;
  }
  v27 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->_logKey;
    *(_DWORD *)buf = 138412290;
    v106 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] Coordinator is missing - checking if application is installed", buf, 0xCu);
  }

  v29 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"bundle_id"];
  if (!v29) {
    goto LABEL_84;
  }
  id v30 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v29 allowPlaceholder:0 error:0];
  if (!v30)
  {
LABEL_83:

LABEL_84:
    v70 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v77 = self->_logKey;
      *(_DWORD *)buf = 138412546;
      v106 = v77;
      __int16 v107 = 2114;
      v108 = v29;
    }

    v71 = ASDErrorWithUnderlyingErrorAndDescription();

    sub_1004061B4((uint64_t)self);
    sub_100406234((uint64_t)AppInstallInstallResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v71);
    v38 = (AppInstallInstallResponse *)objc_claimAutoreleasedReturnValue();
    id v3 = v71;
    goto LABEL_87;
  }
  v31 = sub_10026E82C(self->_install, @"evid");
  v32 = [v31 unsignedLongLongValue];
  if (!v32
    || ([v30 iTunesMetadata],
        v33 = objc_claimAutoreleasedReturnValue(),
        v34 = [v33 versionIdentifier],
        v33,
        v32 != v34))
  {
    v69 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v80 = self->_logKey;
      v81 = [v30 iTunesMetadata];
      id v82 = [v81 versionIdentifier];
      *(_DWORD *)buf = 138412802;
      v106 = v80;
      __int16 v107 = 2048;
      v108 = v32;
      __int16 v109 = 2048;
      id v110 = v82;
      _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "[%@] Expected application with evid: %llu not installed. Installed version is: %llu", buf, 0x20u);
    }
    goto LABEL_83;
  }
  v35 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = self->_logKey;
    *(_DWORD *)buf = 138412546;
    v106 = v36;
    __int16 v107 = 2114;
    v108 = v31;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%@] Expected application appears to be installed with evid: %{public}@, proceeding to postamble", buf, 0x16u);
  }

  v37 = [(SQLiteMemoryEntity *)self->_install databaseID];
  self;
  v38 = (AppInstallInstallResponse *)sub_10040638C((id *)[AppInstallInstallResponse alloc], v37, (void *)3, 0);

LABEL_87:
  id v40 = v3;
LABEL_113:

  installResponse = self->_installResponse;
  self->_installResponse = v38;
LABEL_114:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installResponse, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_install, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end