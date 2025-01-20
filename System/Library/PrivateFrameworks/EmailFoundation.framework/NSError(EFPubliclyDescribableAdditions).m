@interface NSError(EFPubliclyDescribableAdditions)
+ (void)ef_setDecoder:()EFPubliclyDescribableAdditions forDomain:;
- (id)ef_publicDescription;
@end

@implementation NSError(EFPubliclyDescribableAdditions)

- (id)ef_publicDescription
{
  if (initErrorDecodersOnce_onceToken != -1) {
    dispatch_once(&initErrorDecodersOnce_onceToken, &__block_literal_global_16);
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NSError_EFPubliclyDescribableAdditions__ef_publicDescription__block_invoke;
  block[3] = &unk_1E6121C80;
  block[4] = a1;
  block[5] = &v25;
  dispatch_sync((dispatch_queue_t)sErrorDecodeQueue, block);
  uint64_t v2 = v26[5];
  if (v2) {
    [NSString stringWithFormat:@"Code=%@(%ld)", v2, objc_msgSend(a1, "code")];
  }
  else {
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"Code=%ld", objc_msgSend(a1, "code"));
  }
  v4 = [a1 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"EFPublicErrorInfoKey"];
  v6 = [MEMORY[0x1E4F28E78] string];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __stringForPublicInfo_block_invoke;
    v31[3] = &unk_1E61226B8;
    id v32 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v31];
  }
  v7 = +[EFDevice currentDevice];
  int v8 = [v7 isInternal];

  if (v8)
  {
    v9 = [a1 description];
    if (v26[5])
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Code=%ld", objc_msgSend(a1, "code"));
      uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:v10 withString:v3];

      v9 = (void *)v11;
    }
    truncatedDescriptionToMaxAllowableSize(v6, 0x96uLL);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = [v9 stringByAppendingString:v12];
  }
  else
  {
    v14 = [a1 userInfo];
    v9 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v9)
    {
      v15 = NSString;
      v16 = objc_msgSend(v9, "ef_publicDescription");
      [v15 stringWithFormat:@" UnderlyingError=%@", v16];
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &stru_1F0EAE5A8;
    }
    if ([v6 length])
    {
      if ([(__CFString *)v12 length]) {
        unint64_t v17 = 75;
      }
      else {
        unint64_t v17 = 150;
      }
    }
    else
    {
      unint64_t v17 = 150;
    }
    v18 = NSString;
    uint64_t v19 = objc_opt_class();
    v20 = [a1 domain];
    v21 = truncatedDescriptionToMaxAllowableSize(v6, v17);
    v22 = truncatedDescriptionToMaxAllowableSize(v12, v17);
    v13 = [v18 stringWithFormat:@"%@ Domain=%@ %@%@%@", v19, v20, v3, v21, v22];
  }
  _Block_object_dispose(&v25, 8);

  return v13;
}

+ (void)ef_setDecoder:()EFPubliclyDescribableAdditions forDomain:
{
  id v5 = a3;
  id v6 = a4;
  if (initErrorDecodersOnce_onceToken != -1) {
    dispatch_once(&initErrorDecodersOnce_onceToken, &__block_literal_global_16);
  }
  v7 = sErrorDecodeQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__NSError_EFPubliclyDescribableAdditions__ef_setDecoder_forDomain___block_invoke;
  v10[3] = &unk_1E6122690;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

@end