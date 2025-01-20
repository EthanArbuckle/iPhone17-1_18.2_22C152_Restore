@interface CCDatabaseEmptyAccess
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)reset:(id *)a3;
- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4;
@end

@implementation CCDatabaseEmptyAccess

- (BOOL)reset:(id *)a3
{
  return 1;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_249B92000, v6, OS_LOG_TYPE_DEFAULT, "Returning empty results.", v8, 2u);
  }

  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_249B92000, v5, OS_LOG_TYPE_DEFAULT, "Returning empty results.", v7, 2u);
  }

  return 1;
}

- (id)enumeratorForRowResultsOfSelect:(id)a3 error:(id *)a4
{
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_249B92000, v4, OS_LOG_TYPE_DEFAULT, "Returning empty results.", v6, 2u);
  }

  return 0;
}

@end