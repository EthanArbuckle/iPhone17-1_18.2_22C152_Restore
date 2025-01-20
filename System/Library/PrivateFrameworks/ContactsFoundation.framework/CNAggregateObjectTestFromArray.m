@interface CNAggregateObjectTestFromArray
@end

@implementation CNAggregateObjectTestFromArray

uint64_t ___CNAggregateObjectTestFromArray_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___CNAggregateObjectTestFromArray_block_invoke_2;
  v8[3] = &unk_1E56A1460;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_cn_all:", v8);

  return v6;
}

uint64_t ___CNAggregateObjectTestFromArray_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

@end