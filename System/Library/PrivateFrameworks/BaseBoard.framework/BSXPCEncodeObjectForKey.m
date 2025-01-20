@interface BSXPCEncodeObjectForKey
@end

@implementation BSXPCEncodeObjectForKey

void ___BSXPCEncodeObjectForKey_block_invoke_2(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) encodeWithBSXPCCoder:*(void *)(a1 + 40)];
  NSStringFromClass((Class)[*(id *)(a1 + 32) classForCoder]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeStringToXPCDictionaryWithKey(v4, a2, "bsx_class");
}

id ___BSXPCEncodeObjectForKey_block_invoke_3(uint64_t a1, void *a2)
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionary(*(void **)(a1 + 32), a2);
}

void ___BSXPCEncodeObjectForKey_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = [*(id *)(a1 + 32) objectForKey:v7];
          _BSXPCEncodeObjectForKey(*(void *)(a1 + 40), v8, v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v5, @"Dictionary keys must be of type NSString", (void)v9);
        }
        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

@end