@interface NSDataCreateDispatchDataFromData
@end

@implementation NSDataCreateDispatchDataFromData

void ___NSDataCreateDispatchDataFromData_block_invoke(uint64_t a1, void *buffer, int a3, size_t size)
{
  v13[5] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48) || (id v7 = *(id *)(a1 + 32), *(unsigned char *)(a1 + 48)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___NSDataCreateDispatchDataFromData_block_invoke_2;
    v13[3] = &unk_1E51F71D0;
    v13[4] = *(void *)(a1 + 32);
  }
  v9 = dispatch_data_create(buffer, size, 0, v8);
  v10 = v9;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(NSObject **)(v11 + 40);
  if (v12)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = dispatch_data_create_concat(*(dispatch_data_t *)(v11 + 40), v9);
    dispatch_release(v12);
    dispatch_release(v10);
  }
  else
  {
    *(void *)(v11 + 40) = v9;
  }
}

void ___NSDataCreateDispatchDataFromData_block_invoke_2(uint64_t a1)
{
}

@end