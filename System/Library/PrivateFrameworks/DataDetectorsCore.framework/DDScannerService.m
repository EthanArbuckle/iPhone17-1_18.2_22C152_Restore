@interface DDScannerService
+ (id)scanQuery:(__DDScanQuery *)a3 configuration:(id)a4;
+ (id)scanString:(id)a3;
+ (id)scanString:(id)a3 range:(_NSRange)a4 configuration:(id)a5;
+ (int64_t)scanQuery:(__DDScanQuery *)a3 configuration:(id)a4 completionBlock:(id)a5;
+ (int64_t)scanString:(id)a3 completionBlock:(id)a4;
+ (int64_t)scanString:(id)a3 range:(_NSRange)a4 configuration:(id)a5 completionBlock:(id)a6;
+ (void)appendWatchOSLinksToString:(id)a3;
+ (void)cancelJob:(int64_t)a3;
@end

@implementation DDScannerService

+ (id)scanQuery:(__DDScanQuery *)a3 configuration:(id)a4
{
  id v5 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v6 = _getSharedDispatcher();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__DDScannerService_scanQuery_configuration___block_invoke;
  v9[3] = &unk_1E5984D08;
  v9[4] = &v10;
  v9[5] = a3;
  -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v6, v5, 1, 0, v9);
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __44__DDScannerService_scanQuery_configuration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1;
  if (a2)
  {
    a1 = [(DDScannerObject *)a2 scanString:0 range:0 query:*(void **)(a1 + 40) configuration:a3 completionBlock:0];
    uint64_t v4 = *(void *)(*(void *)(v3 + 32) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = a1;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void *)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x1E4F1CBF0];
  }

  return MEMORY[0x1F41817F8](a1, v5);
}

+ (void)cancelJob:(int64_t)a3
{
  if (a3 >= 1)
  {
    block[8] = v3;
    uint64_t v11 = v4;
    uint64_t v6 = _getSharedDispatcher();
    uint64_t v7 = v6;
    if (v6)
    {
      v8 = *(NSObject **)(v6 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__DDScanServerDispatcher_cancelJob___block_invoke;
      block[3] = &unk_1E5984C40;
      block[4] = v7;
      block[5] = a3;
      uint64_t v9 = v7;
      dispatch_async(v8, block);
      uint64_t v7 = v9;
    }
    MEMORY[0x1F41817F8](v6, v7);
  }
}

+ (int64_t)scanString:(id)a3 completionBlock:(id)a4
{
  return objc_msgSend(a1, "scanString:range:configuration:completionBlock:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0, a4);
}

+ (int64_t)scanQuery:(__DDScanQuery *)a3 configuration:(id)a4 completionBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  _getSharedDispatcher();
  uint64_t v9 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v7 completionQueue];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    -[DDScanServerDispatcher reportQueue](v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke;
  v18[3] = &unk_1E5984DA8;
  id v20 = v8;
  v21 = a3;
  id v19 = v13;
  id v14 = v8;
  id v15 = v13;
  int64_t v16 = -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v9, v7, 0, 0, v18);

  return v16;
}

void __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v6 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_2;
    v12[3] = &unk_1E5984D58;
    id v7 = &v13;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    id v8 = [(DDScannerObject *)a2 scanString:0 range:0 query:v6 configuration:a3 completionBlock:v12];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_4;
    block[3] = &unk_1E5985448;
    id v7 = &v11;
    uint64_t v9 = *(NSObject **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
}

void __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_3;
  v7[3] = &unk_1E5984D30;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (int64_t)scanString:(id)a3 range:(_NSRange)a4 configuration:(id)a5 completionBlock:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = _getSharedDispatcher();
  id v14 = [v11 completionQueue];
  id v15 = v14;
  if (v14)
  {
    int64_t v16 = v14;
  }
  else
  {
    int64_t v16 = -[DDScanServerDispatcher reportQueue]((id *)v13);
  }
  v17 = v16;

  uint64_t v18 = [v10 length];
  if (v18)
  {
    NSUInteger v19 = v18;
    id v20 = (void *)[v10 copy];

    v43.NSUInteger location = location;
    v43.NSUInteger length = length;
    NSUInteger v21 = validateRangeOfString(v19, v43);
    uint64_t v23 = v22;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_2;
    v30[3] = &unk_1E5984D80;
    v24 = &v31;
    id v10 = v20;
    id v31 = v10;
    NSUInteger v34 = v21;
    uint64_t v35 = v23;
    v32 = v17;
    id v33 = v12;
    id v25 = v12;
    int64_t v26 = -[DDScanServerDispatcher scannerConf:sync:string:runTask:](v13, v11, 0, v10, v30);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke;
    block[3] = &unk_1E5985448;
    v24 = &v37;
    id v37 = v12;
    id v27 = v12;
    dispatch_async(v17, block);
    if (v13)
    {
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      uint64_t v42 = 0;
      v28 = *(NSObject **)(v13 + 8);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __41__DDScanServerDispatcher_emptyIdentifier__block_invoke;
      v38[3] = &unk_1E59853D8;
      v38[4] = v13;
      v38[5] = &v39;
      dispatch_sync(v28, v38);
      int64_t v26 = v40[3];
      _Block_object_dispose(&v39, 8);
    }
    else
    {
      int64_t v26 = 0;
    }
  }

  return v26;
}

uint64_t __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_3;
    v12[3] = &unk_1E5984D58;
    id v6 = &v13;
    id v7 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v8 = [(DDScannerObject *)a2 scanString:*(void *)(a1 + 56) range:*(void *)(a1 + 64) query:0 configuration:a3 completionBlock:v12];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_5;
    block[3] = &unk_1E5985448;
    id v6 = &v11;
    id v9 = *(NSObject **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
}

void __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_4;
  v7[3] = &unk_1E5984D30;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)scanString:(id)a3
{
  return (id)objc_msgSend(a1, "scanString:range:configuration:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

+ (id)scanString:(id)a3 range:(_NSRange)a4 configuration:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  NSUInteger v10 = [v8 length];
  if (v10)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy_;
    int64_t v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    v29.NSUInteger location = location;
    v29.NSUInteger length = length;
    NSUInteger v11 = validateRangeOfString(v10, v29);
    uint64_t v13 = v12;
    id v14 = _getSharedDispatcher();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__DDScannerService_scanString_range_configuration___block_invoke;
    v17[3] = &unk_1E5984CE0;
    NSUInteger v19 = &v22;
    id v18 = v8;
    NSUInteger v20 = v11;
    uint64_t v21 = v13;
    -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v14, v9, 1, v18, v17);
    id v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

uint64_t __51__DDScannerService_scanString_range_configuration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1;
  if (a2)
  {
    a1 = [(DDScannerObject *)a2 scanString:*(void *)(a1 + 48) range:*(void *)(a1 + 56) query:0 configuration:a3 completionBlock:0];
    uint64_t v4 = *(void *)(*(void *)(v3 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = a1;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x1E4F1CBF0];
  }

  return MEMORY[0x1F41817F8](a1, v5);
}

+ (void)appendWatchOSLinksToString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 string];
  if ([v4 length])
  {
    uint64_t v5 = _getSharedDispatcher();
    uint64_t v6 = [v3 string];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__DDScannerService_appendWatchOSLinksToString___block_invoke;
    v7[3] = &unk_1E5984CB8;
    id v8 = v4;
    id v9 = v3;
    -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v5, 0, 1, v6, v7);
  }
}

void __47__DDScannerService_appendWatchOSLinksToString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v6 setNoObjC:1];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = v5;
  uint64_t v22 = v6;
  id v7 = -[DDScannerObject scanString:range:query:configuration:completionBlock:]((uint64_t)v5, *(void **)(a1 + 32), 0, [*(id *)(a1 + 32) length], 0, v6, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (DDResultGetCategory(v11) - 1 <= 2)
        {
          CFStringRef v12 = DDResultCopyExtractedURLWithOptions(v11, 2);
          if (v12)
          {
            uint64_t v13 = (__CFString *)v12;
            id v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v12, v21, v22);

            if (v14)
            {
              id v15 = [v14 scheme];
              int64_t v16 = [v15 lowercaseString];

              if (([v16 isEqualToString:@"maps"] & 1) != 0
                || ([v16 isEqualToString:@"tel"] & 1) != 0)
              {

                uint64_t RangeForURLification = DDResultGetRangeForURLification(v11);
                uint64_t v19 = v18;
                uint64_t v24 = 0;
                id v25 = &v24;
                uint64_t v26 = 0x2020000000;
                char v27 = 0;
                NSUInteger v20 = *(void **)(a1 + 40);
                v23[0] = MEMORY[0x1E4F143A8];
                v23[1] = 3221225472;
                v23[2] = __47__DDScannerService_appendWatchOSLinksToString___block_invoke_2;
                v23[3] = &unk_1E5984C90;
                v23[4] = &v24;
                objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", @"NSLink", RangeForURLification, v18, 0x100000, v23);
                if (!*((unsigned char *)v25 + 24)) {
                  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"NSLink", v14, RangeForURLification, v19);
                }
                _Block_object_dispose(&v24, 8);
              }
              else
              {

                id v14 = v16;
              }
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }
}

uint64_t __47__DDScannerService_appendWatchOSLinksToString___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    if (a4)
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

@end