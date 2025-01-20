@interface SecItemAddAndNotifyOnSync
@end

@implementation SecItemAddAndNotifyOnSync

BOOL ___SecItemAddAndNotifyOnSync_block_invoke(uint64_t a1, __CFString **a2)
{
  v4 = (CFDictionaryRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___SecItemAddAndNotifyOnSync_block_invoke_2;
  v9[3] = &unk_1E547F690;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  BOOL v7 = SecItemAuthDoQuery(v4, 0, SecItemAdd, a2, v9);

  return v7;
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_2(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4, const __CFDictionary *a5, __CFString **a6)
{
  id v10 = a2;
  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = ___SecItemAddAndNotifyOnSync_block_invoke_3;
    v26[3] = &unk_1E547F618;
    id v27 = *(id *)(a1 + 32);
    v12 = SecuritydXPCProxyObject(0, v26);
    if (v12)
    {
      v13 = [SecuritydXPCCallback alloc];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = ___SecItemAddAndNotifyOnSync_block_invoke_4;
      v24[3] = &unk_1E547F640;
      id v25 = *(id *)(a1 + 32);
      v14 = [(SecuritydXPCCallback *)v13 initWithCallback:v24];
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = ___SecItemAddAndNotifyOnSync_block_invoke_5;
      v20[3] = &unk_1E547F668;
      v22 = &v32;
      v23 = &v28;
      v16 = v15;
      v21 = v16;
      [v12 SecItemAddAndNotifyOnSync:a3 syncCallback:v14 complete:v20];
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = v29;
      if (a6) {
        *a6 = (__CFString *)v29[3];
      }
      if (v17[3]) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = SecItemResultProcess(a3, a5, 0, (const void *)v33[3], *(CFTypeRef **)(a1 + 40), a6);
      }
      v18 = (const void *)v33[3];
      if (v18)
      {
        v33[3] = 0;
        CFRelease(v18);
      }
    }
    else
    {
      uint64_t v11 = 0;
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }

  return v11;
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___SecItemAddAndNotifyOnSync_block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = v12;
  if (v12 || (v9 = v7) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  id v11 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end