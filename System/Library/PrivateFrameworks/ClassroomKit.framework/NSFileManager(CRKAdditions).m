@interface NSFileManager(CRKAdditions)
+ (id)crk_nonContainerizedHomeDirectoryURL;
+ (uint64_t)crk_computeNonContainerizedHomeDirectoryURL;
- (id)crk_collisionAvoidingURLForURL:()CRKAdditions;
- (id)crk_deepContentsOfDirectoryAtPath:()CRKAdditions options:error:;
- (uint64_t)crk_isStudentdInstalled;
- (uint64_t)crk_safeRemoveItemAtURL:()CRKAdditions error:;
@end

@implementation NSFileManager(CRKAdditions)

- (uint64_t)crk_isStudentdInstalled
{
  return [a1 fileExistsAtPath:@"/usr/libexec/studentd"];
}

+ (id)crk_nonContainerizedHomeDirectoryURL
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NSFileManager_CRKAdditions__crk_nonContainerizedHomeDirectoryURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (crk_nonContainerizedHomeDirectoryURL_onceToken != -1) {
    dispatch_once(&crk_nonContainerizedHomeDirectoryURL_onceToken, block);
  }
  v1 = (void *)crk_nonContainerizedHomeDirectoryURL_URL;

  return v1;
}

+ (uint64_t)crk_computeNonContainerizedHomeDirectoryURL
{
  return [NSURL fileURLWithPath:@"/var/mobile"];
}

- (uint64_t)crk_safeRemoveItemAtURL:()CRKAdditions error:
{
  id v12 = 0;
  char v5 = [a1 removeItemAtURL:a3 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5) {
    goto LABEL_5;
  }
  v8 = [v6 domain];
  if ([v8 isEqualToString:*MEMORY[0x263F07F70]])
  {
    uint64_t v9 = [v7 code];

    if (v9 == 4)
    {

      id v7 = 0;
LABEL_5:
      uint64_t v10 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (a4)
  {
    id v7 = v7;
    uint64_t v10 = 0;
    *a4 = v7;
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_10:

  return v10;
}

- (id)crk_deepContentsOfDirectoryAtPath:()CRKAdditions options:error:
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!v8)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"NSFileManager+CRKAdditions.m", 75, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

    id v8 = 0;
  }
  v24 = v8;
  v26 = [NSURL fileURLWithPath:v8];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  id v38 = 0;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __79__NSFileManager_CRKAdditions__crk_deepContentsOfDirectoryAtPath_options_error___block_invoke;
  v32[3] = &unk_2646F5BC0;
  v32[4] = &v33;
  uint64_t v9 = [a1 enumeratorAtURL:v26 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:a4 errorHandler:v32];
  uint64_t v10 = [v26 path];
  v11 = [v10 stringByStandardizingPath];

  id v12 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) path];
        v17 = [v16 stringByStandardizingPath];
        v18 = objc_msgSend(v17, "crk_substringAfterString:", v11);
        v19 = objc_msgSend(v18, "crk_stringByRemovingPrefix:", @"/");

        [v12 addObject:v19];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v13);
  }

  v20 = (void *)v34[5];
  if (v20)
  {
    v21 = 0;
    if (a5) {
      *a5 = v20;
    }
  }
  else
  {
    v21 = (void *)[v12 copy];
  }

  _Block_object_dispose(&v33, 8);

  return v21;
}

- (id)crk_collisionAvoidingURLForURL:()CRKAdditions
{
  id v4 = a3;
  char v5 = [v4 filePathURL];
  id v6 = [v5 path];

  if ([a1 fileExistsAtPath:v6])
  {
    uint64_t v7 = 2;
    id v8 = v4;
    while (1)
    {
      uint64_t v9 = v6;
      uint64_t v10 = [v4 path];
      v11 = [v10 stringByDeletingPathExtension];

      id v12 = NSString;
      uint64_t v13 = [NSNumber numberWithInt:v7];
      uint64_t v14 = [v4 pathExtension];
      v15 = [v12 stringWithFormat:@"%@ %@.%@", v11, v13, v14];

      v16 = [NSURL fileURLWithPath:v15];

      v17 = [v16 filePathURL];
      id v6 = [v17 path];

      if (!v16) {
        break;
      }
      uint64_t v7 = (v7 + 1);

      id v8 = v16;
      if (([a1 fileExistsAtPath:v6] & 1) == 0) {
        goto LABEL_12;
      }
    }
    if (_CRKLogGeneral_onceToken_45 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_45, &__block_literal_global_120);
    }
    v18 = _CRKLogGeneral_logObj_45;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_45, OS_LOG_TYPE_ERROR)) {
      [(NSFileManager(CRKAdditions) *)(uint64_t)v4 crk_collisionAvoidingURLForURL:v18];
    }
    v19 = [MEMORY[0x263F08C38] UUID];
    v20 = [v19 UUIDString];
    v16 = [v4 URLByAppendingPathComponent:v20];
  }
  else
  {
    v16 = v4;
  }
LABEL_12:

  return v16;
}

- (void)crk_collisionAvoidingURLForURL:()CRKAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Unable to create non-colliding URL for %{public}@ using %{public}@", (uint8_t *)&v3, 0x16u);
}

@end