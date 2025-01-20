@interface IDSEventReportingManager
- (BOOL)serverEnabledEventReporting;
- (void)reportClientEvent:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSEventReportingManager

- (void)reportClientEvent:(id)a3 withCompletion:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(IDSEventReportingManager *)self serverEnabledEventReporting])
    {
      if (_os_feature_enabled_impl())
      {
        v8 = [MEMORY[0x1E4F6C3B8] registration];
        v9 = v8;
        if (v6)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v10 = [v6 reportType];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Reporting event of type %@ to server with completion", (uint8_t *)&buf, 0xCu);
          }
          uint64_t v39 = MEMORY[0x1E4F143A8];
          uint64_t v40 = 3221225472;
          v41 = sub_19194C888;
          v42 = &unk_1E572A348;
          v43 = v6;
          id v11 = v7;
          id v44 = v11;
          v12 = &v39;
          id v13 = v11;
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v52 = sub_19194C91C;
          v53 = &unk_1E572A398;
          id v54 = v13;
          v55 = v12;
          +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", &buf, v39, v40, v41, v42);

          v14 = v43;
          goto LABEL_18;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_191A2DCA4(v9, v31, v32, v33, v34, v35, v36, v37);
        }

        v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v45 = *MEMORY[0x1E4F28228];
        v46 = @"Missing event parameter";
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v28 = v38;
        uint64_t v29 = 200;
LABEL_17:
        v30 = [v28 errorWithDomain:@"IDSEventReportingManagerErrorDomain" code:v29 userInfo:v14];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v30);

        goto LABEL_18;
      }
      v27 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_191A2DD1C(v27);
      }

      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28228];
      v48 = @"Event reporting disabled by feature flag";
      v24 = (void *)MEMORY[0x1E4F1C9E8];
      v25 = &v48;
      v26 = &v47;
    }
    else
    {
      v22 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_191A2DD60(v22);
      }

      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28228];
      v50 = @"Event reporting dsiabled by server";
      v24 = (void *)MEMORY[0x1E4F1C9E8];
      v25 = &v50;
      v26 = &v49;
    }
    v14 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    v28 = v23;
    uint64_t v29 = 100;
    goto LABEL_17;
  }
  v14 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_191A2DC2C(v14, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_18:
}

- (BOOL)serverEnabledEventReporting
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"client-report-ckv-reliability-enabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

@end