@interface NSArray
@end

@implementation NSArray

void __49__NSArray_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = 0;
  v5 = [a2 objectWithNoNSNulls:&v13];
  id v6 = v13;
  if (!v5)
  {
    v12 = *(void **)(a1 + 40);
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    v9 = [v8 stringValue];
    id v11 = (id)MEMORY[0x263EFFA88];
    v10 = v12;
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) addObject:v5];
  if ([v6 count])
  {
    v7 = *(void **)(a1 + 40);
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    v9 = [v8 stringValue];
    v10 = v7;
    id v11 = v6;
LABEL_5:
    [v10 setObject:v11 forKeyedSubscript:v9];
  }
}

uint64_t __47__NSArray_BLTNSNullRemoval__objectWithNSNulls___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 integerValue];
  if (v6 <= [v5 integerValue])
  {
    uint64_t v8 = [v4 integerValue];
    if (v8 >= [v5 integerValue]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __32__NSArray_BLTSizeOf__blt_sizeof__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "blt_sizeof");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

@end