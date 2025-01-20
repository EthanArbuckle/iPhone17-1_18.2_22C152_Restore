@interface LCSSessionFinalizer
+ (BOOL)removeContentsOfExtensionDataContainerForBundleProvider:(id)a3;
+ (id)finalizeTemporarySessionAtURL:(id)a3 forBundleProvider:(id)a4;
@end

@implementation LCSSessionFinalizer

+ (id)finalizeTemporarySessionAtURL:(id)a3 forBundleProvider:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F08850] defaultManager];
  id v54 = 0;
  v8 = [v7 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:&v54];
  id v9 = v54;
  v10 = 0;
  if ([v8 count]) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    v12 = [v5 pathComponents];
    if ([v12 count] < 2)
    {
      v10 = 0;
LABEL_43:

      goto LABEL_44;
    }
    v49 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v12, "count") - 2);
    v13 = [[LCSSessionURLBuilder alloc] initWithTypeIdentifier:v49];
    v14 = [(LCSSessionURLBuilder *)v13 finalizationStagingSessionURLForBundleProvider:v6 fromTemporaryURL:v5];
    v15 = v14;
    if (!v14)
    {
      v16 = LCSLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:](v16);
      }
      v10 = 0;
      goto LABEL_42;
    }
    v16 = [v14 URLByDeletingLastPathComponent];
    id v53 = 0;
    char v17 = [v7 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v53];
    id v48 = v53;
    if ((v17 & 1) == 0)
    {
      v47 = LCSLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.7();
      }
      v10 = 0;
      goto LABEL_41;
    }
    id v52 = 0;
    char v18 = [v7 copyItemAtURL:v5 toURL:v15 error:&v52];
    v47 = v52;
    if ((v18 & 1) == 0)
    {
      v23 = LCSLogCommon();
      v46 = v23;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.6((uint64_t)v47, v23, v24, v25, v26, v27, v28, v29);
      }
      v10 = 0;
      goto LABEL_40;
    }
    v19 = [(LCSSessionURLBuilder *)v13 finalizedSessionURLForBundleProvider:v6 fromSessionURL:v15];
    v46 = v19;
    if (!v19)
    {
      v30 = LCSLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:](v30);
      }

      id v51 = 0;
      char v45 = [v7 removeItemAtURL:v15 error:&v51];
      id v31 = v51;
      if (v45)
      {
        v10 = 0;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      id v44 = v31;
      v43 = LCSLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:]((uint64_t)v44, v43, v32, v33, v34, v35, v36, v37);
      }
      v10 = 0;
LABEL_38:

      id v31 = v44;
      goto LABEL_39;
    }
    [v19 URLByDeletingLastPathComponent];
    v50[1] = 0;
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    char v20 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
    v43 = 0;
    if (v20)
    {
      v50[0] = 0;
      char v21 = [v7 moveItemAtURL:v15 toURL:v46 error:v50];
      v42 = v50[0];
      v22 = LCSLogCommon();
      if (v21)
      {
        v41 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.4();
        }

        v10 = v46;
        goto LABEL_37;
      }
      v38 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v40 = @"no error returned";
        *(_DWORD *)buf = 138412802;
        if (v42) {
          v40 = (__CFString *)v42;
        }
        v56 = v15;
        __int16 v57 = 2112;
        v58 = v46;
        __int16 v59 = 2112;
        v60 = v40;
        _os_log_error_impl(&dword_255087000, v38, OS_LOG_TYPE_ERROR, "Failed moving from %@ to %@: %@", buf, 0x20u);
      }
    }
    else
    {
      v42 = LCSLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.5();
      }
    }
    v10 = 0;
LABEL_37:

    goto LABEL_38;
  }
LABEL_44:

  return v10;
}

+ (BOOL)removeContentsOfExtensionDataContainerForBundleProvider:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F645D8];
  id v5 = [v3 bundleIdentifier];
  id v6 = [v4 predicateMatchingBundleIdentifier:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263F64638]) initWithExplanation:@"LockedContentServices deleting contents of extension data container"];
  v8 = (void *)[objc_alloc(MEMORY[0x263F64648]) initWithPredicate:v6 context:v7];
  id v23 = 0;
  char v9 = [v8 acquireWithError:&v23];
  id v10 = v23;
  if (v9)
  {
    id v11 = [v3 bundleIdentifier];
    [v11 cStringUsingEncoding:4];
    uint64_t v12 = container_delete_all_data_container_content_for_current_user();

    BOOL v13 = v12 == 1;
    if (v12 != 1)
    {
      v14 = LCSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[LCSSessionFinalizer removeContentsOfExtensionDataContainerForBundleProvider:](v12, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    [v8 invalidate];
  }
  else
  {
    char v21 = LCSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionFinalizer removeContentsOfExtensionDataContainerForBundleProvider:v21];
    }

    BOOL v13 = 0;
  }

  return v13;
}

+ (void)finalizeTemporarySessionAtURL:(os_log_t)log forBundleProvider:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_255087000, log, OS_LOG_TYPE_ERROR, "Failed to resolve a staging URL, will not finalize contents.", v1, 2u);
}

+ (void)finalizeTemporarySessionAtURL:(uint64_t)a3 forBundleProvider:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)finalizeTemporarySessionAtURL:(os_log_t)log forBundleProvider:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_255087000, log, OS_LOG_TYPE_ERROR, "Failed to resolve a finalized URL, will not finalize contents, attempting to remove staging dir.", v1, 2u);
}

+ (void)finalizeTemporarySessionAtURL:forBundleProvider:.cold.4()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_255087000, v1, OS_LOG_TYPE_DEBUG, "Finalized %@ to %@", v2, 0x16u);
}

+ (void)finalizeTemporarySessionAtURL:forBundleProvider:.cold.5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_0(&dword_255087000, v0, v1, "Failed creating finalized Library container directory %@:%@");
}

+ (void)finalizeTemporarySessionAtURL:(uint64_t)a3 forBundleProvider:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)finalizeTemporarySessionAtURL:forBundleProvider:.cold.7()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_0(&dword_255087000, v0, v1, "Failed creating staging container directory %@:%@");
}

+ (void)removeContentsOfExtensionDataContainerForBundleProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)removeContentsOfExtensionDataContainerForBundleProvider:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_255087000, a3, OS_LOG_TYPE_ERROR, "Unable to acquire termination assertion for %@: %@", v6, 0x16u);
}

@end