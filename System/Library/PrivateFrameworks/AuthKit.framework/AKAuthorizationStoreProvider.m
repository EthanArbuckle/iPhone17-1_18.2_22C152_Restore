@interface AKAuthorizationStoreProvider
- (AKDataSeparatedContainerContext)sandboxContainerForPersona:(id)a3;
- (id)storeForAltDSID:(id)a3;
@end

@implementation AKAuthorizationStoreProvider

- (id)storeForAltDSID:(id)a3
{
  id v4 = a3;
  v5 = NSHomeDirectory();
  v6 = [v5 stringByAppendingString:@"/Library/Application Support/com.apple.akd/authorization.db"];

  v7 = +[AKAccountManager sharedInstance];
  unsigned int v8 = [v7 isDataSeparatedAccountForAltDSID:v4];

  v9 = +[AKAccountManager sharedInstance];
  v10 = [v9 personaUniqueStringForAltDSID:v4];

  if (v10) {
    unsigned int v11 = v8;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v11 == 1)
  {
    id v12 = [(AKAuthorizationStoreProvider *)self sandboxContainerForPersona:v10];
    v14 = v12;
    if (v12 && (uint64_t v15 = v13) != 0)
    {
      v16 = [v12 stringByAppendingString:@"/com.apple.akd/authorization.db"];
      v17 = [[AKDataSeparatedAuthorizationStore alloc] initWithContainerPath:v16 withSandboxToken:v15];
    }
    else
    {
      v19 = _AKLogSiwa();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10017CC04(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v17 = 0;
    }
  }
  else
  {
    v18 = _AKLogSiwa();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DS:Creating store located at %@", (uint8_t *)&v28, 0xCu);
    }

    v17 = [[AKAuthorizationStore alloc] initWithPath:v6];
  }

  return v17;
}

- (AKDataSeparatedContainerContext)sandboxContainerForPersona:(id)a3
{
  id v3 = a3;
  container_query_create();
  container_query_set_class();
  container_query_operation_set_flags();
  id v4 = v3;
  [v4 UTF8String];
  container_query_set_persona_unique_string();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v6 = container_error_copy_unlocalized_description();
    v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10017CC3C((uint64_t)v6, v10);
    }

    free(v6);
    goto LABEL_11;
  }
  uint64_t v5 = container_copy_sandbox_token();
  if (!v5)
  {
    v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10017CCB4(v6, v11, v12, v13, v14, v15, v16, v17);
    }

LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  v6 = v5;
  uint64_t path = container_get_path();
  if (path)
  {
    unsigned int v8 = +[NSURL fileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
    uint64_t v9 = [v8 path];
  }
  else
  {
    uint64_t v20 = _AKLogSiwa();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10017CCEC(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    uint64_t v9 = 0;
  }
LABEL_12:

  v18 = (void *)v9;
  v19 = (char *)v6;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

@end