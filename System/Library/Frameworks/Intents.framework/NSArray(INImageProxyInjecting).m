@interface NSArray(INImageProxyInjecting)
- (void)_injectProxiesForImages:()INImageProxyInjecting completion:;
@end

@implementation NSArray(INImageProxyInjecting)

- (void)_injectProxiesForImages:()INImageProxyInjecting completion:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = INImageProxyInjectionQueue();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([a1 count])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      v23 = v7;
      [v9 setUnderlyingQueue:v7];
      [v9 setMaxConcurrentOperationCount:1];
      [v9 setSuspended:1];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = a1;
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v12 = 0;
        uint64_t v13 = *(void *)v34;
        do
        {
          uint64_t v14 = 0;
          v15 = v12;
          do
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
            if ([v16 conformsToProtocol:&unk_1EDBB20D0])
            {
              v12 = objc_alloc_init(INImageProxyInjectionOperation);
              [(INImageProxyInjectionOperation *)v12 setInjector:v16];
              [(INImageProxyInjectionOperation *)v12 setImageProxyRequestBlock:v24];
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
              v31[3] = &unk_1E551E178;
              id v32 = v8;
              [(INImageProxyInjectionOperation *)v12 setCopyReturnBlock:v31];
              v17 = &v32;
            }
            else
            {
              v18 = (void *)MEMORY[0x1E4F28B48];
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
              v29[3] = &unk_1E551F790;
              v30[0] = v8;
              v30[1] = v16;
              v12 = [v18 blockOperationWithBlock:v29];
              v17 = (id *)v30;
            }

            if (v15) {
              [(INImageProxyInjectionOperation *)v12 addDependency:v15];
            }
            [v9 addOperation:v12];

            ++v14;
            v15 = v12;
          }
          while (v11 != v14);
          uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      v19 = (void *)MEMORY[0x1E4F28B48];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_4;
      v26[3] = &unk_1E551F740;
      id v27 = v8;
      id v28 = v6;
      id v20 = v8;
      v21 = [v19 blockOperationWithBlock:v26];
      v22 = v21;
      if (v12) {
        [v21 addDependency:v12];
      }
      [v9 addOperation:v22];
      [v9 setSuspended:0];

      v7 = v23;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      block[3] = &unk_1E551F740;
      id v38 = v8;
      v39 = (INImageProxyInjectionOperation *)v6;
      id v9 = v8;
      dispatch_async(v7, block);

      v12 = v39;
    }
  }
}

@end