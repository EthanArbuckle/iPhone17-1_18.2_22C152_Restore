@interface WFHealthKitUnitPlistCompiler
+ (void)compileUnitDataIntoPlistAtPath:(id)a3;
@end

@implementation WFHealthKitUnitPlistCompiler

+ (void)compileUnitDataIntoPlistAtPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[&unk_26F076680 mutableCopy];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke;
  v23[3] = &unk_264E5ABC8;
  id v24 = &unk_26F0766C8;
  v5 = objc_msgSend(&unk_26F076680, "if_map:", v23);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }
  v10 = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(@"si");
  id v11 = (id)objc_msgSend(v4, "if_map:", v10);

  v12 = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(@"non_si");
  id v13 = (id)objc_msgSend(&unk_26F076698, "if_map:", v12);

  v14 = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(@"compound");
  id v15 = (id)objc_msgSend(&unk_26F0766B0, "if_map:", v14);

  v16 = objc_opt_new();
  [v16 addObjectsFromArray:v4];
  [v16 addObjectsFromArray:&unk_26F076698];
  [v16 addObjectsFromArray:&unk_26F0766B0];
  uint64_t v18 = 0;
  v17 = [MEMORY[0x263F08AC0] dataWithPropertyList:v16 format:100 options:0 error:&v18];
  [v17 writeToFile:v3 atomically:1];
}

id __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_2;
  v8[3] = &unk_264E57C80;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "if_map:", v8);

  return v6;
}

id __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_4;
  aBlock[3] = &unk_264E57CA8;
  id v6 = v1;
  id v2 = v1;
  id v3 = _Block_copy(aBlock);

  return v3;
}

id __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_4(uint64_t a1, void *a2)
{
  v7[3] = *MEMORY[0x263EF8340];
  v6[0] = @"unitString";
  v6[1] = @"important";
  v7[0] = a2;
  v7[1] = MEMORY[0x263EFFA80];
  v6[2] = @"group";
  v7[2] = *(void *)(a1 + 32);
  id v2 = NSDictionary;
  id v3 = a2;
  v4 = [v2 dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

uint64_t __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringByAppendingString:*(void *)(a1 + 32)];
}

@end