@interface DEDAEAEncryptor
- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withMetadata:(id)a5;
- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withPublicKey:(id)a5;
@end

@implementation DEDAEAEncryptor

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withMetadata:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[DEDConfiguration sharedInstance];
  v11 = os_log_create((const char *)[v10 loggingSubsystem], "ded-encryptor");

  v12 = [v9 objectForKey:@"publicKey"];

  if (v12)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
    if ([MEMORY[0x263F3A0A0] isValidDirectory:v7])
    {
      id v14 = [v7 path];
      v15 = (const char *)[v14 fileSystemRepresentation];

      AAPathList v16 = AAPathListCreateWithDirectoryContents(v15, 0, 0, 0, 0, 0);
      if (!v16)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:]();
        }
LABEL_24:
        v17 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      v18 = [v7 URLByDeletingLastPathComponent];
      id v19 = [v18 path];
      v15 = (const char *)[v19 fileSystemRepresentation];

      id v20 = [v7 lastPathComponent];
      v21 = (const char *)[v20 fileSystemRepresentation];

      AAPathList v16 = AAPathListCreateWithPath(v15, v21);
      if (!v16)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.7();
        }
        goto LABEL_24;
      }
    }
    v22 = v16;
    v23 = [v7 lastPathComponent];
    uint64_t v24 = [v23 stringByAppendingPathExtension:@"aea"];

    v41 = (void *)v24;
    id v25 = [v8 URLByAppendingPathComponent:v24];
    id v26 = [v25 path];
    v27 = AAFileStreamOpenWithPath((const char *)[v26 fileSystemRepresentation], 513, 0x1A4u);

    if (v27)
    {
      id v40 = v8;
      AEAContext v28 = AEAContextCreateWithProfile(3u);
      v29 = v13;
      v30 = v28;
      v39 = v29;
      id v31 = v29;
      AEAContextSetFieldBlob(v30, 0xAu, 1u, (const uint8_t *)[v31 bytes], objc_msgSend(v31, "length"));
      AEAContextSetFieldUInt(v30, 3u, 0x801uLL);
      v32 = AEAEncryptionOutputStreamOpen(v27, v30, 0, 0);
      if (v32)
      {
        v33 = v32;
        v34 = AAEncodeArchiveOutputStreamOpen(v32, 0, 0, 0, 0);
        v35 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,UID,GID,CLC,HLC,XAT");
        if (v34)
        {
          v36 = v35;
          if (v35)
          {
            v37 = v41;
            if (AAArchiveStreamWritePathList(v34, v22, v35, v15, 0, 0, 0, 0) < 0)
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.6();
              }

              id v25 = 0;
            }
            AEAContextDestroy(v30);
            AAArchiveStreamClose(v34);
            AAFieldKeySetDestroy(v36);
            AAPathListDestroy(v22);
            id v25 = v25;
            v17 = v25;
            v13 = v39;
            id v8 = v40;
            goto LABEL_33;
          }
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.5();
        }
        AAByteStreamClose(v33);
        AEAContextDestroy(v30);
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.4();
        }
        AEAContextDestroy(v30);
        AAByteStreamClose(v27);
      }
      AAPathListDestroy(v22);
      v17 = 0;
      v13 = v39;
      id v8 = v40;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:]();
      }
      AAPathListDestroy(v22);
      v17 = 0;
    }
    v37 = v41;
LABEL_33:

    goto LABEL_34;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:](v11);
  }
  v17 = 0;
LABEL_35:

  return v17;
}

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withPublicKey:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  v15 = @"publicKey";
  v16[0] = a5;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v13 = [(DEDAEAEncryptor *)self encryptLogsAtPath:v11 outputDirectory:v10 withMetadata:v12];

  return v13;
}

- (void)encryptLogsAtPath:(os_log_t)log outputDirectory:withMetadata:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "No key found in encryptor meta data", v1, 2u);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not open directory contents of %@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not open AppleArchive output byte stream at %@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not open AppleArchive encryption stream at %@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not create encoder stream for the archive at %@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Writing directory contents to archive failed %@", v2, v3, v4, v5, v6);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.7()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not open file at %@", v2, v3, v4, v5, v6);
}

@end