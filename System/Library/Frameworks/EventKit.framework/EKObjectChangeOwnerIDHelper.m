@interface EKObjectChangeOwnerIDHelper
+ (id)createOwnerIDWithRowID:(id)a3 objectType:(int64_t)a4 databaseID:(int)a5;
@end

@implementation EKObjectChangeOwnerIDHelper

+ (id)createOwnerIDWithRowID:(id)a3 objectType:(int64_t)a4 databaseID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (a4 <= 0)
    {
      v11 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](v11, a4);
      }
    }
    else if ([v7 integerValue] < 0)
    {
      v12 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:]((uint64_t)v8, v12);
      }
    }
    else
    {
      if ((v5 & 0x80000000) == 0)
      {
        v9 = +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", a4, [v8 intValue], v5);
        goto LABEL_15;
      }
      v13 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:].cold.4(v5, v13);
      }
    }
  }
  else
  {
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](v10);
    }
  }
  v9 = 0;
LABEL_15:

  return v9;
}

+ (void)createOwnerIDWithRowID:(os_log_t)log objectType:databaseID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Nil rowID passed in to createOwnerIDWithRowID:objectType:", v1, 2u);
}

+ (void)createOwnerIDWithRowID:(void *)a1 objectType:(uint64_t)a2 databaseID:.cold.2(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = NSNumber;
  v4 = a1;
  uint64_t v5 = [v3 numberWithInteger:a2];
  int v6 = 138412290;
  id v7 = v5;
  _os_log_error_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_ERROR, "Invalid owner object type. Type: %@", (uint8_t *)&v6, 0xCu);
}

+ (void)createOwnerIDWithRowID:(uint64_t)a1 objectType:(NSObject *)a2 databaseID:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Invalid rowID passed in. rowID: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)createOwnerIDWithRowID:(int)a1 objectType:(NSObject *)a2 databaseID:.cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Invalid databaseID: %d", (uint8_t *)v2, 8u);
}

@end