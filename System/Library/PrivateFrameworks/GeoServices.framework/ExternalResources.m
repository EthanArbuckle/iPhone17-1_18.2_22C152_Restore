@interface ExternalResources
@end

@implementation ExternalResources

uint64_t __logs_ExternalResources_Enumerate_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_step(a2);
  while (v4 == 100)
  {
    v5 = [*(id *)(a1 + 32) stringForColumn:0 inStatment:a2];
    v6 = externalFileBaseURL(*(void **)(a1 + 32));
    v7 = [v6 URLByAppendingPathComponent:v5];

    if (!v7)
    {

      return 0;
    }
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
    {

      return 1;
    }
    uint64_t v4 = sqlite3_step(a2);
  }
  if (v4 != 101)
  {
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v9 + 40);
    [v8 reportSQLiteErrorCode:v4 method:@"step" error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    return 0;
  }
  return 1;
}

@end