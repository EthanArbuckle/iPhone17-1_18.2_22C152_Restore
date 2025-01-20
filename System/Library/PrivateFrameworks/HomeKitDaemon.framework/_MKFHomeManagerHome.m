@interface _MKFHomeManagerHome
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHomeManagerHomeDatabaseID)databaseID;
- (id)hmd_modelsWithChangeType:(unint64_t)a3 detached:(BOOL)a4 error:(id *)a5;
@end

@implementation _MKFHomeManagerHome

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4B1518;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (MKFHomeManagerHomeDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeManagerHomeDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeManagerHome"];
}

- (id)hmd_modelsWithChangeType:(unint64_t)a3 detached:(BOOL)a4 error:(id *)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [(HMDBackingStoreModelObject *)[HMDHomeManagerHomeModel alloc] initWithManagedObject:self changeType:a3 detached:a4 error:a5];
  if (v6)
  {
    v7 = [(_MKFHomeManagerHome *)self handle];
    [(HMDHomeManagerHomeModel *)v6 setHandle:v7];

    v10[0] = v6;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end