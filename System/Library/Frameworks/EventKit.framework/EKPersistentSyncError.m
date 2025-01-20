@interface EKPersistentSyncError
+ (Class)meltedClass;
+ (id)relations;
- (id)userInfoData;
- (int)entityType;
- (int)errorCode;
- (int)errorType;
- (void)setErrorCode:(int)a3;
- (void)setErrorType:(int)a3;
- (void)setUserInfoData:(id)a3;
@end

@implementation EKPersistentSyncError

+ (id)relations
{
  if (relations_onceToken_1 != -1) {
    dispatch_once(&relations_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)relations_relations_1;

  return v2;
}

void __34__EKPersistentSyncError_relations__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F56F00];
  v0 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56D28]];
  v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v0 ownsRelated:0];
  v9[0] = v1;
  v8[1] = *MEMORY[0x1E4F56F08];
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56ED0]];
  v3 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:v2 ownsRelated:0];
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E4F56F20];
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F573D8]];
  v5 = +[EKRelation relationWithEntityName:@"Store" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v7 = (void *)relations_relations_1;
  relations_relations_1 = v6;
}

- (int)entityType
{
  return 24;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (void)setErrorType:(int)a3
{
}

- (int)errorType
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56F18]];
}

- (void)setErrorCode:(int)a3
{
}

- (int)errorCode
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56F10]];
}

- (void)setUserInfoData:(id)a3
{
}

- (id)userInfoData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56F28]];
}

@end