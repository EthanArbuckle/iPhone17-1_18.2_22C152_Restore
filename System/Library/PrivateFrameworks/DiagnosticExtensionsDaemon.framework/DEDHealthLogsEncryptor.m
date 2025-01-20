@interface DEDHealthLogsEncryptor
- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withMetadata:(id)a5;
- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withPublicKey:(id)a5;
@end

@implementation DEDHealthLogsEncryptor

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withPublicKey:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = +[DEDConfiguration sharedInstance];
  v11 = os_log_create((const char *)[v10 loggingSubsystem], "ded-encryptor");

  v12 = HKHealthWrapCertificateFromString();
  id v13 = objc_alloc(MEMORY[0x263F0A430]);
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [MEMORY[0x263F08C38] UUID];
  v16 = (void *)[v13 initWithSubjectUUID:v14 studyUUID:v15 channel:@"v1-timberlorry_archive" payloadType:@"timberlorry_archive" certificate:v12];

  v17 = [MEMORY[0x263EFF910] date];
  [v16 setStartDate:v17];

  v18 = [MEMORY[0x263EFF910] date];
  [v16 setEndDate:v18];

  v19 = (void *)[objc_alloc(MEMORY[0x263F0A428]) initWithConfiguration:v16];
  v20 = (void *)[MEMORY[0x263F0A428] newOutputFileURLInDirectory:v9];

  id v30 = 0;
  LODWORD(v9) = [v19 startWithOutputFileURL:v20 error:&v30];
  id v21 = v30;
  v22 = v21;
  if (v9)
  {
    id v29 = v21;
    int v23 = [v19 appendDataFromFileURL:v7 error:&v29];
    id v24 = v29;

    if (v23 && !v24)
    {
      id v28 = 0;
      v25 = [v19 finalizeWithError:&v28];
      id v24 = v28;
      if (v24)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:]();
        }
        id v26 = 0;
      }
      else
      {
        id v26 = v25;
      }

      goto LABEL_14;
    }
  }
  else
  {
    id v24 = v21;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:]();
  }
  id v26 = 0;
LABEL_14:

  return v26;
}

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withMetadata:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v57 = a4;
  id v8 = a5;
  id v9 = +[DEDConfiguration sharedInstance];
  oslog = os_log_create((const char *)[v9 loggingSubsystem], "ded-encryptor");

  v10 = [v8 objectForKey:@"cloudKitEnv"];
  v11 = [v8 objectForKey:@"publicKey"];
  if (!v11 && v10) {
    [v10 BOOLValue];
  }
  uint64_t v12 = HKHealthWrapCertificateFromString();
  id v13 = (void *)v12;
  if (v12)
  {
    v54 = (void *)v12;
    v50 = v11;
    v14 = [MEMORY[0x263F08850] defaultManager];
    v15 = [v7 path];
    int v16 = [v14 fileExistsAtPath:v15];

    v17 = [v7 path];
    id v62 = 0;
    v52 = v14;
    v53 = [v14 attributesOfItemAtPath:v17 error:&v62];
    id v18 = v62;

    v19 = oslog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v7 path];
      *(_DWORD *)buf = 138543618;
      v66 = v20;
      __int16 v67 = 1026;
      LODWORD(v68) = v16;
      _os_log_impl(&dword_21FE04000, v19, OS_LOG_TYPE_DEFAULT, "Does file exist at path: %{public}@ (Y/N): %{public}d", buf, 0x12u);
    }
    if (v18)
    {
      id v21 = v19;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.5(v7, (uint64_t)v18, v21);
      }
    }
    v51 = v18;
    v22 = v19;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v7 path];
      *(_DWORD *)buf = 138543618;
      v66 = v23;
      __int16 v67 = 2114;
      v68 = v53;
      _os_log_impl(&dword_21FE04000, v22, OS_LOG_TYPE_DEFAULT, "File Attributes of file: %{public}@ Attributes Dict: %{public}@", buf, 0x16u);
    }
    id v24 = [v8 objectForKeyedSubscript:@"channel"];
    v25 = [v8 objectForKeyedSubscript:@"payloadType"];
    uint64_t v26 = [v8 objectForKeyedSubscript:@"timberLorryUUID"];
    [MEMORY[0x263F08C38] UUID];
    v56 = v55 = (void *)v26;
    if (!v26)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withMetadata:]();
      }
      id v30 = 0;
      v11 = v50;
      id v13 = v54;
      goto LABEL_38;
    }
    v27 = [v8 objectForKey:@"studyID"];

    v49 = v10;
    if (v27)
    {
      id v28 = [v8 objectForKey:@"studyID"];
      uint64_t v29 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v28];
    }
    else
    {
      uint64_t v29 = (uint64_t)v56;
    }
    id v31 = objc_alloc(MEMORY[0x263F0A430]);
    v32 = [MEMORY[0x263F08C38] UUID];
    v56 = (void *)v29;
    v47 = v25;
    v48 = v24;
    v33 = (void *)[v31 initWithSubjectUUID:v32 studyUUID:v29 channel:v24 payloadType:v25 certificate:v54];

    v34 = [MEMORY[0x263EFF910] date];
    [v33 setStartDate:v34];

    v35 = [MEMORY[0x263EFF910] date];
    [v33 setEndDate:v35];

    v63 = @"caseID";
    v64 = v55;
    v36 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    [v33 setKeyValuePairs:v36];

    v37 = (void *)[objc_alloc(MEMORY[0x263F0A428]) initWithConfiguration:v33];
    v38 = (void *)[MEMORY[0x263F0A428] newOutputFileURLInDirectory:v57];
    id v61 = 0;
    LODWORD(v36) = [v37 startWithOutputFileURL:v38 error:&v61];
    id v39 = v61;
    v40 = v39;
    if (v36)
    {
      v41 = v38;
      id v60 = v39;
      id v42 = v7;
      int v43 = [v37 appendDataFromFileURL:v7 error:&v60];
      id v44 = v60;

      if (v43)
      {
        id v7 = v42;
        id v24 = v48;
        v38 = v41;
        if (!v44)
        {
          id v59 = 0;
          v45 = [v37 finalizeWithError:&v59];
          id v44 = v59;
          v11 = v50;
          if (v44)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:]();
            }
            id v30 = 0;
          }
          else
          {
            id v30 = v45;
          }

LABEL_37:
          v10 = v49;
          id v13 = v54;
          v25 = v47;
LABEL_38:

          goto LABEL_39;
        }
      }
      else
      {
        id v7 = v42;
        id v24 = v48;
        v38 = v41;
      }
    }
    else
    {
      id v44 = v39;
      id v24 = v48;
    }
    v11 = v50;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:]();
    }
    id v30 = 0;
    goto LABEL_37;
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
    -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withMetadata:](oslog);
  }
  id v30 = 0;
LABEL_39:

  return v30;
}

- (void)encryptLogsAtPath:outputDirectory:withPublicKey:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Error: Unable to finalize the files error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:outputDirectory:withPublicKey:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Error: Unable to encrypt the files error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:(os_log_t)log outputDirectory:withMetadata:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Error: No cert generated from the publicKey provided.", v1, 2u);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Tried to use HealthWrapEncryptor without a caseID specified. The files at path: %@ will be skipped.", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:(void *)a1 outputDirectory:(uint64_t)a2 withMetadata:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 path];
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "Unable to get file attributes at path: %{public}@ with Error: %{public}@", v6, 0x16u);
}

@end