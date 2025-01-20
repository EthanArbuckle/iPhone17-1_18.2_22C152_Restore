@interface _MKFCharacteristicWriteAction
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (BOOL)validateTargetValue:(id *)a3 error:(id *)a4;
- (MKFCharacteristicWriteActionDatabaseID)databaseID;
- (MKFHome)home;
- (void)willSave;
@end

@implementation _MKFCharacteristicWriteAction

- (MKFHome)home
{
  v2 = [(_MKFCharacteristicWriteAction *)self actionSet];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFCharacteristicWriteActionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFCharacteristicWriteActionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_MKFCharacteristicWriteAction;
  BOOL v5 = -[_MKFModel validateForInsertOrUpdate:](&v9, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(_MKFCharacteristicWriteAction *)self service];

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"service is required");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v7;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)willSave
{
  v7.receiver = self;
  v7.super_class = (Class)_MKFCharacteristicWriteAction;
  [(_MKFModel *)&v7 willSave];
  v3 = [(_MKFCharacteristicWriteAction *)self service];
  v4 = [v3 accessory];

  if (v4)
  {
    BOOL v5 = [(_MKFCharacteristicWriteAction *)self accessory];
    char v6 = HMFEqualObjects();

    if ((v6 & 1) == 0) {
      [(_MKFCharacteristicWriteAction *)self setAccessory:v4];
    }
  }
}

- (BOOL)validateTargetValue:(id *)a3 error:(id *)a4
{
  return [(NSManagedObject *)self hmd_validateCharacteristicValue:*a3 key:@"targetValue" error:a4];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E48BE48;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  objc_super v7 = NSString;
  v8 = NSStringFromSelector(a2);
  objc_super v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCharacteristicWriteAction"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end