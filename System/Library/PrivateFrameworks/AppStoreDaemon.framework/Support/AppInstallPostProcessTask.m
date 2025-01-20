@interface AppInstallPostProcessTask
- (void)main;
@end

@implementation AppInstallPostProcessTask

- (void)main
{
  if (self)
  {
    id v3 = objc_alloc_init((Class)BAAppStoreClient);
    id v4 = sub_10026E91C(self->_install, @"restore_type");
    install = self->_install;
    if (install)
    {
      BOOL v6 = sub_10026E91C(install, @"source_type") == (id)2;
      if (v4)
      {
LABEL_4:
        v7 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = sub_100424C14(&self->_install->super.super.isa);
          v9 = sub_100424DF4(self->_install);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that a restore is ready for processing: %{public}@", buf, 0x16u);
        }
        v10 = sub_100424D84(self->_install);
        v11 = sub_100424DF4(self->_install);
        v12 = v10;
        v13 = v11;
        uint64_t v14 = 12;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v6 = 0;
      if (v4) {
        goto LABEL_4;
      }
    }
    v15 = self->_install;
    if (v15) {
      BOOL v16 = sub_10026E91C(v15, @"update_type") != 0;
    }
    else {
      BOOL v16 = 0;
    }
    v17 = ASDLogHandleForCategory();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v18)
      {
        v33 = sub_100424C14(&self->_install->super.super.isa);
        v34 = sub_100424DF4(self->_install);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v34;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that an install is ready for processing: %{public}@", buf, 0x16u);
      }
      v35 = sub_100424D84(self->_install);
      v36 = sub_100424DF4(self->_install);
      v37 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v35 appBundleURL:v36 event:10 client:v6];

      [v37 setUserInitiated:sub_100424B7C(self->_install) ^ 1];
      v38 = self->_install;
      if (v38) {
        BOOL v39 = sub_10026E91C(v38, @"automatic_type") != 0;
      }
      else {
        BOOL v39 = 0;
      }
      [v37 setAutomaticInstall:v39];
      id v45 = 0;
      unsigned int v40 = [v3 performEventWithDescriptor:v37 error:&v45];
      id v25 = v45;

      if (v40) {
        goto LABEL_17;
      }
      goto LABEL_23;
    }
    if (v18)
    {
      v19 = sub_100424C14(&self->_install->super.super.isa);
      v20 = sub_100424DF4(self->_install);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] About to tell Background Assets that an update is ready for processing: %{public}@", buf, 0x16u);
    }
    v10 = sub_100424D84(self->_install);
    v11 = sub_100424DF4(self->_install);
    v12 = v10;
    v13 = v11;
    uint64_t v14 = 11;
LABEL_14:
    v21 = +[BAAppStoreEventDescriptor descriptorWithAppBundleIdentifier:v12 appBundleURL:v13 event:v14 client:v6];

    [v21 setUserInitiated:sub_100424B7C(self->_install) ^ 1];
    v22 = self->_install;
    if (v22) {
      BOOL v23 = sub_10026E91C(v22, @"automatic_type") != 0;
    }
    else {
      BOOL v23 = 0;
    }
    [v21 setAutomaticInstall:v23];
    id v45 = 0;
    unsigned __int8 v24 = [v3 performEventWithDescriptor:v21 error:&v45];
    id v25 = v45;

    if (v24)
    {
LABEL_17:
      v26 = sub_10028E50C();
      v27 = sub_100424D84(self->_install);
      v28 = sub_100424C14(&self->_install->super.super.isa);
      sub_10028F198((uint64_t)v26, v27, v28);

      v29 = sub_1003E0BA4();
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10038ED40;
      v47 = &unk_1005236D0;
      v48 = self;
      [v29 modifyUsingTransaction:buf];

      v30 = [(SQLiteMemoryEntity *)self->_install databaseID];
      self;
      v31 = (AppInstallPostProcessResponse *)sub_10038EE74((id *)[AppInstallPostProcessResponse alloc], v30, 0, 0);
      taskResponse = self->_taskResponse;
      self->_taskResponse = v31;
LABEL_26:

      return;
    }
LABEL_23:
    v41 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v44 = sub_100424C14(&self->_install->super.super.isa);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[%@] Failed to tell Background Assets that an install/update/restore was ready for processing: %{public}@", buf, 0x16u);
    }
    v42 = [(SQLiteMemoryEntity *)self->_install databaseID];
    id v25 = v25;
    self;
    v43 = (AppInstallPostProcessResponse *)sub_10038EE74((id *)[AppInstallPostProcessResponse alloc], v42, (void *)1, v25);

    taskResponse = self->_taskResponse;
    self->_taskResponse = v43;
    goto LABEL_26;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskResponse, 0);
  objc_storeStrong((id *)&self->_install, 0);
}

@end