@interface SGModelMappingHelper
+ (id)loadMappingsForType:(id)a3 andLanguage:(id)a4;
+ (id)mappingsForType:(id)a3 andLanguage:(id)a4;
@end

@implementation SGModelMappingHelper

+ (id)loadMappingsForType:(id)a3 andLanguage:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F5DFA8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 mappings];
  v9 = [v8 objectForKey:v7];

  v10 = [v9 objectForKey:v6];

  return v10;
}

+ (id)mappingsForType:(id)a3 andLanguage:(id)a4
{
  id v6 = a3;
  id v7 = [a1 loadMappingsForType:v6 andLanguage:a4];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__SGModelMappingHelper_mappingsForType_andLanguage___block_invoke;
  v14[3] = &unk_1E65B9728;
  id v9 = v8;
  id v15 = v9;
  id v16 = v6;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v14];
  v11 = v16;
  id v12 = v9;

  return v12;
}

uint64_t __52__SGModelMappingHelper_mappingsForType_andLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

@end