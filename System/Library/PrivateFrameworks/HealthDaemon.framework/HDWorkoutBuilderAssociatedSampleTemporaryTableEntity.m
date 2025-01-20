@interface HDWorkoutBuilderAssociatedSampleTemporaryTableEntity
+ (BOOL)isTemporary;
+ (BOOL)withLocalTableName:(id)a3 error:(id *)a4 block:(id)a5;
+ (id)disambiguatedDatabaseTable;
@end

@implementation HDWorkoutBuilderAssociatedSampleTemporaryTableEntity

+ (BOOL)withLocalTableName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a3;
  v8 = (uint64_t (**)(id, id *))a5;
  v9 = [MEMORY[0x1E4F29060] currentThread];
  v10 = [v9 threadDictionary];
  v11 = [v10 objectForKeyedSubscript:@"HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"];

  v12 = (void *)[v7 copy];
  v13 = [MEMORY[0x1E4F29060] currentThread];
  v14 = [v13 threadDictionary];
  [v14 setObject:v12 forKeyedSubscript:@"HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"];

  char v15 = v8[2](v8, a4);
  v16 = [MEMORY[0x1E4F29060] currentThread];
  v17 = [v16 threadDictionary];
  if (v11) {
    [v17 setObject:v11 forKeyedSubscript:@"HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"];
  }
  else {
    [v17 removeObjectForKey:@"HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"];
  }

  return v15;
}

+ (id)disambiguatedDatabaseTable
{
  v4 = [MEMORY[0x1E4F29060] currentThread];
  v5 = [v4 threadDictionary];
  v6 = [v5 objectForKeyedSubscript:@"HDWorkoutBuilderAssociatedSampleTemporaryTableEntityLocalTableKey"];

  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"HDWorkoutBuilderEntity.mm" lineNumber:1200 description:@"Must have set the current thread's local table name."];
  }

  return v6;
}

+ (BOOL)isTemporary
{
  return 1;
}

@end