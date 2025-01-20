@interface _MKFCharacteristicEvent
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFCharacteristicEventDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFCharacteristicEvent

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCharacteristicEvent"];
}

- (MKFHome)home
{
  v2 = [(_MKFCharacteristicEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFCharacteristicEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFCharacteristicEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_MKFCharacteristicEvent;
  BOOL v5 = -[_MKFModel validateForInsertOrUpdate:](&v9, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(_MKFCharacteristicEvent *)self service];

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

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5145D0;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  objc_super v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end