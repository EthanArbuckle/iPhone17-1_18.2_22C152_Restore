@interface GSGenerationRow
+ (BOOL)rowExists:(id)a3 withStorageID:(int64_t)a4 andName:(id)a5 andClientID:(id)a6;
+ (BOOL)setGenerationConflictResolved:(id)a3 rowID:(int64_t)a4 conflictResolved:(BOOL)a5 error:(id *)a6;
+ (BOOL)setGenerationOptions:(id)a3 rowID:(int64_t)a4 options:(unint64_t)a5 error:(id *)a6;
+ (BOOL)setGenerationStatus:(id)a3 rowID:(int64_t)a4 status:(int)a5 error:(id *)a6;
+ (BOOL)thinningPrecompute:(id)a3 kept:(id)a4;
+ (id)enumerate:(id)a3 withOptions:(const GSGenerationEnumeratorOptions *)a4;
+ (id)generationRow:(id)a3 storageID:(int64_t)a4 name:(id)a5 clientID:(id)a6 error:(id *)a7;
+ (int64_t)countOfGenerations:(id)a3 storageID:(int64_t)a4 clientID:(id)a5;
+ (int64_t)deleteRow:(id)a3 rowID:(int64_t)a4;
+ (int64_t)deleteRowsWithoutData:(id)a3 atRoot:(id)a4;
+ (int64_t)deleteRowsWithoutStorage:(id)a3;
+ (int64_t)fixPendingRowsWithData:(id)a3 atRoot:(id)a4;
+ (int64_t)fixupGenerationOptions:(id)a3;
+ (int64_t)tableRowCount:(id)a3;
+ (unint64_t)computeNumberOfPruneableStorages:(id)a3;
+ (unint64_t)computePrunableSpace:(id)a3;
+ (unint64_t)computePruneableNumberOfGenerations:(id)a3;
- (BOOL)isAccessibleByUID:(unsigned int)a3 error:(id *)a4;
- (BOOL)saveToDB:(id)a3;
- (id)fullPath:(id)a3;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
@end

@implementation GSGenerationRow

+ (id)generationRow:(id)a3 storageID:(int64_t)a4 name:(id)a5 clientID:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = [v11 fetchObjectOfClass:objc_opt_class(), @"SELECT generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size, generation_conflict_resolved FROM generations WHERE generation_storage_id = %lld   AND generation_name = %@   AND generation_client_id = %@", a4, v13, v12 sql];

  if (!v14)
  {
    v15 = [v11 lastError];
    if ([v15 isSqliteErrorCode:12])
    {
      v16 = +[NSString stringWithFormat:@"Generation not found"];
      v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100027B10();
      }

      if (a7)
      {
        sub_100003600(105, v16, 0);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a7)
    {
      *a7 = v15;
    }
  }
  return v14;
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GSGenerationRow;
  v6 = [(GSGenerationRow *)&v14 init];
  if (v6)
  {
    v6->generation_id = (int64_t)[v5 longLongAtIndex:0];
    v6->generation_storage_id = (int64_t)[v5 longLongAtIndex:1];
    uint64_t v7 = [v5 stringAtIndex:2];
    generation_name = v6->generation_name;
    v6->generation_name = (NSString *)v7;

    uint64_t v9 = [v5 stringAtIndex:3];
    generation_client_id = v6->generation_client_id;
    v6->generation_client_id = (NSString *)v9;

    uint64_t v11 = [v5 stringAtIndex:4];
    generation_path = v6->generation_path;
    v6->generation_path = (NSString *)v11;

    v6->generation_options = (unint64_t)[v5 longLongAtIndex:5];
    v6->generation_status = [v5 intAtIndex:6];
    v6->generation_add_time = (int64_t)[v5 longLongAtIndex:7];
    v6->generation_size = (int64_t)[v5 longLongAtIndex:8];
    v6->generation_conflict_resolved = [v5 BOOLAtIndex:9];
  }

  return v6;
}

- (BOOL)saveToDB:(id)a3
{
  id v4 = a3;
  id v5 = sub_100002D4C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100027A1C((uint64_t)self, v5);
  }

  int64_t generation_id = self->generation_id;
  int64_t generation_storage_id = self->generation_storage_id;
  generation_name = self->generation_name;
  generation_client_id = self->generation_client_id;
  generation_path = self->generation_path;
  unint64_t generation_options = self->generation_options;
  uint64_t generation_status = self->generation_status;
  int64_t generation_add_time = self->generation_add_time;
  if (generation_id)
  {
    unsigned __int8 v14 = [v4 execute:@"UPDATE generations SET   generation_storage_id = %lld, generation_name = %@, generation_client_id = %@, generation_path = %@, generation_options = %lld, generation_status = %d, generation_add_time = %lld, generation_size = %lld, generation_conflict_resolved = %d WHERE generation_id = %lld", generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, self->generation_size, self->generation_conflict_resolved, generation_id];
  }
  else if ([v4 execute:@"INSERT INTO generations (generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size, generation_conflict_resolved) VALUES (NULL, %lld, %@, %@, %@, %lld, %d, %lld, %lld, %d)", generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, self->generation_size, self->generation_conflict_resolved])
  {
    self->int64_t generation_id = (int64_t)[v4 lastInsertedRowID];
    unsigned __int8 v14 = 1;
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)isAccessibleByUID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v7 = [(NSString *)self->generation_path pathComponents];
  v8 = [v7 objectAtIndexedSubscript:0];
  BOOL v9 = 1;
  v10 = [v7 objectAtIndexedSubscript:1];
  if (([v8 isEqualToString:@"AllUIDs"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"PerUID"])
    {
      if (a3) {
        BOOL v9 = [v10 intValue] == a3;
      }
      else {
        BOOL v9 = 1;
      }
    }
    else
    {
      uint64_t v11 = +[NSString stringWithFormat:@"Generation %@ for client %@ has a corrupt path %@", self->generation_name, self->generation_client_id, self->generation_path];
      id v12 = sub_100002D4C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100027A94();
      }

      if (a4)
      {
        sub_100003600(101, v11, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)fullPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSString);
  v6 = [v4 libraryRoot];

  id v7 = [v5 initWithFormat:@"%@/%@", v6, self->generation_path];
  return v7;
}

+ (BOOL)thinningPrecompute:(id)a3 kept:(id)a4
{
  return [a3 execute:@"UPDATE generations SET generation_prunable = gs_is_prunable(generation_id, %p)", a4];
}

+ (unint64_t)computePrunableSpace:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fetchObjectOfClass:objc_opt_class() sql:@"SELECT SUM(generation_size) FROM generations WHERE generation_prunable = 1"];

  id v5 = [v4 unsignedLongLongValue];
  return (unint64_t)v5;
}

+ (unint64_t)computeNumberOfPruneableStorages:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fetchObjectOfClass:objc_opt_class() sql:@"SELECT COUNT(*) FROM generations  WHERE generations.generation_prunable = 1 GROUP BY generations.generation_storage_id"];

  id v5 = [v4 unsignedLongLongValue];
  return (unint64_t)v5;
}

+ (unint64_t)computePruneableNumberOfGenerations:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fetchObjectOfClass:objc_opt_class() sql:@"SELECT COUNT(*) FROM generations WHERE generation_prunable = 1"];

  id v5 = [v4 unsignedLongLongValue];
  return (unint64_t)v5;
}

+ (BOOL)rowExists:(id)a3 withStorageID:(int64_t)a4 andName:(id)a5 andClientID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 fetchObjectOfClass:objc_opt_class(), @"SELECT COUNT(*) FROM generations WHERE generation_storage_id = %lld   AND generation_name = %@   AND generation_client_id = %@", a4, v10, v9 sql];

  LOBYTE(v10) = [v12 BOOLValue];
  return (char)v10;
}

+ (int64_t)tableRowCount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fetchObjectOfClass:objc_opt_class() sql:@"SELECT COUNT(*) FROM generations"];

  id v5 = [v4 longLongValue];
  return (int64_t)v5;
}

+ (int64_t)countOfGenerations:(id)a3 storageID:(int64_t)a4 clientID:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  if (v7) {
    v10 = [v8 fetchObjectOfClass:v9, @"SELECT COUNT(*) FROM generations WHERE int64_t generation_storage_id = %lld AND generation_client_id = %@", a4, v7 sql];
  }
  else {
    v10 = objc_msgSend(v8, "fetchObjectOfClass:sql:", v9, @"SELECT COUNT(*) FROM generations WHERE int64_t generation_storage_id = %lld", a4, v14);
  }
  id v11 = v10;

  id v12 = [v11 longLongValue];
  return (int64_t)v12;
}

+ (id)enumerate:(id)a3 withOptions:(const GSGenerationEnumeratorOptions *)a4
{
  id v5 = a3;
  int64_t var8 = a4->var8;
  int var5 = a4->var5;
  id v28 = v5;
  if (var5 < 0)
  {
    if (var8) {
      int64_t var9 = a4->var9;
    }
    else {
      int64_t var9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    +[PQLFormatInjection formatInjection:@"generation_id <= %lld ORDER BY generation_id DESC", var9];
  }
  else
  {
    if (!var5)
    {
      uint64_t v10 = +[PQLRawInjection rawInjection:"1" length:1];
      goto LABEL_13;
    }
    if (var8) {
      int64_t v8 = a4->var9;
    }
    else {
      int64_t v8 = 0;
    }
    +[PQLFormatInjection formatInjection:@"generation_id >= %lld ORDER BY generation_id ASC", v8];
  uint64_t v10 = };
LABEL_13:
  id v11 = (void *)v10;
  if (a4->var0) {
    +[PQLFormatInjection formatInjection:@"int64_t generation_storage_id = %lld AND", a4->var0];
  }
  else {
  id v12 = +[PQLRawInjection rawInjection:"" length:0];
  }
  if (a4->var1) {
    +[PQLFormatInjection formatInjection:@"generation_options & %lld AND", a4->var1];
  }
  else {
  id v13 = +[PQLRawInjection rawInjection:"" length:0];
  }
  if (a4->var2) {
    +[PQLFormatInjection formatInjection:@"NOT (generation_options & %lld) AND", a4->var2];
  }
  else {
  uint64_t v14 = +[PQLRawInjection rawInjection:"" length:0];
  }
  if (a4->var3) {
    +[PQLFormatInjection formatInjection:@"uint64_t generation_status = %d AND", a4->var3];
  }
  else {
  v15 = +[PQLRawInjection rawInjection:"" length:0];
  }
  if (a4->var4) {
    +[PQLFormatInjection formatInjection:@"generation_client_id = %s AND", a4->var4];
  }
  else {
  v16 = +[PQLRawInjection rawInjection:"" length:0];
  }
  if (a4->var6)
  {
    v17 = "generation_prunable AND";
    uint64_t v18 = 23;
  }
  else
  {
    v17 = "";
    uint64_t v18 = 0;
  }
  v19 = +[PQLRawInjection rawInjection:v17 length:v18];
  if (a4->var7)
  {
    v20 = "generation_conflict_resolved AND";
    uint64_t v21 = 32;
  }
  else
  {
    v20 = "";
    uint64_t v21 = 0;
  }
  uint64_t v22 = +[PQLRawInjection rawInjection:v20 length:v21];
  v23 = (void *)v22;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  if (var8) {
    uint64_t v24 = var8;
  }
  id v25 = [v28 fetch:@"SELECT generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size, generation_conflict_resolved FROM generations WHERE %@ %@ %@ %@ %@ %@ %@ %@ LIMIT %lld", v12, v13, v14, v15, v16, v19, v22, v11, v24];

  v26 = [v25 enumerateObjectsOfClass:objc_opt_class()];

  return v26;
}

+ (BOOL)setGenerationStatus:(id)a3 rowID:(int64_t)a4 status:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  v10 = objc_msgSend(v9, "execute:", @"UPDATE generations SET generation_status = %d WHERE int64_t generation_id = %lld", v7, a4);
  BOOL v11 = v10;
  if (a6 && (v10 & 1) == 0)
  {
    *a6 = [v9 translatedError];
  }

  return v11;
}

+ (BOOL)setGenerationOptions:(id)a3 rowID:(int64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = objc_msgSend(v9, "execute:", @"UPDATE generations SET generation_options = %lld WHERE int64_t generation_id = %lld", a5, a4);
  BOOL v11 = v10;
  if (a6 && (v10 & 1) == 0)
  {
    *a6 = [v9 translatedError];
  }

  return v11;
}

+ (BOOL)setGenerationConflictResolved:(id)a3 rowID:(int64_t)a4 conflictResolved:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  v10 = objc_msgSend(v9, "execute:", @"UPDATE generations SET generation_conflict_resolved = %d WHERE int64_t generation_id = %lld", v7, a4);
  BOOL v11 = v10;
  if (a6 && (v10 & 1) == 0)
  {
    *a6 = [v9 translatedError];
  }

  return v11;
}

+ (int64_t)deleteRow:(id)a3 rowID:(int64_t)a4
{
  id v5 = a3;
  if (objc_msgSend(v5, "execute:", @"DELETE FROM generations WHERE int64_t generation_id = %lld", a4)) {
    int64_t v6 = (int64_t)[v5 changes];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

+ (int64_t)deleteRowsWithoutStorage:(id)a3
{
  id v3 = a3;
  if ([v3 execute:@"DELETE FROM generations WHERE generation_id IN (SELECT generation_id FROM generations  LEFT JOIN storage ON generation_storage_id = storage_id  WHERE storage_id IS NULL)"])int64_t v4 = (int64_t)objc_msgSend(v3, "changes"); {
  else
  }
    int64_t v4 = -1;

  return v4;
}

+ (int64_t)deleteRowsWithoutData:(id)a3 atRoot:(id)a4
{
  id v5 = a3;
  if ([v5 execute:@"DELETE FROM generations WHERE gs_path_not_exists(%@ || \"/\" || generation_path)", a4])int64_t v6 = (int64_t)objc_msgSend(v5, "changes"); {
  else
  }
    int64_t v6 = -1;

  return v6;
}

+ (int64_t)fixPendingRowsWithData:(id)a3 atRoot:(id)a4
{
  id v5 = a3;
  if ([v5 execute:@"UPDATE generations SET uint64_t generation_status = %d WHERE uint64_t generation_status = %d AND gs_path_exists(%@ || \"/\" || generation_path)", 1, 1000, a4])v6 = (int64_t)objc_msgSend(v5, "changes"); {
  else
  }
    int64_t v6 = -1;

  return v6;
}

+ (int64_t)fixupGenerationOptions:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "execute:", @"UPDATE generations SET generation_options = (generation_options | %lld) & %lld WHERE (generation_options & %lld) = 0 OR (generation_options & %lld)", 1, 13, 1, -14))int64_t v4 = (int64_t)objc_msgSend(v3, "changes"); {
  else
  }
    int64_t v4 = -1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->generation_path, 0);
  objc_storeStrong((id *)&self->generation_client_id, 0);
  objc_storeStrong((id *)&self->generation_name, 0);
}

@end