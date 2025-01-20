@interface HFLogStateDumpNode
@end

@implementation HFLogStateDumpNode

void ___HFLogStateDumpNode_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  v9 = a3;
  v10 = HFLogForCategory(0x41uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v15 = 138412546;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v15, 0x16u);
  }

  v12 = [*(id *)(a1 + 40) stringByAppendingString:@"  "];
  v9[2](v9, v12);

  v13 = HFLogForCategory(0x41uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138412546;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v15, 0x16u);
  }
}

void ___HFLogStateDumpNode_block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        _HFLogStateDumpNode(*(void *)(*((void *)&v9 + 1) + 8 * v8++), v3, 0);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void ___HFLogStateDumpNode_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_98_0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v4 objectForKeyedSubscript:v12];
        uint64_t v14 = [NSString stringWithFormat:@"%@: ", v12];
        _HFLogStateDumpNode(v13, v3, v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

uint64_t ___HFLogStateDumpNode_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v6 = [v4 caseInsensitiveCompare:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

void ___HFLogStateDumpNode_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = HFLogForCategory(0x41uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = 40;
    if (!a3) {
      uint64_t v7 = 32;
    }
    uint64_t v8 = *(void *)(a1 + v7);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v9, 0x16u);
  }
}

@end