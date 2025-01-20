@interface DKObject
@end

@implementation DKObject

void __55___DKObject_MOConversion__fetchObjectWithUUID_context___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v3 = (void *)MEMORY[0x1E4F1C0A8];
  v4 = +[_DKObject entityName];
  v5 = [v3 entityForName:v4 inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v5];

  v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = [*(id *)(a1 + 40) UUIDString];
  v8 = [v6 predicateWithFormat:@"UUID == %@", v7];
  [v2 setPredicate:v8];

  v9 = *(void **)(a1 + 32);
  id v16 = 0;
  v10 = [v9 executeFetchRequest:v2 error:&v16];
  id v11 = v16;
  v12 = [v10 lastObject];

  if (v12)
  {
    uint64_t v13 = [v12 objectID];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

void __55___DKObject_MOConversion__fetchObjectWithUUID_context___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "Fetched object not found:%@", v1, 0xCu);
}

@end