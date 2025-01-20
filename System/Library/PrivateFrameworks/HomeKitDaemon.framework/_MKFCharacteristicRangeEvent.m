@interface _MKFCharacteristicRangeEvent
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (BOOL)validateMax:(id *)a3 error:(id *)a4;
- (BOOL)validateMin:(id *)a3 error:(id *)a4;
- (MKFCharacteristicRangeEventDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFCharacteristicRangeEvent

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCharacteristicRangeEvent"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (MKFHome)home
{
  v2 = [(_MKFCharacteristicRangeEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFCharacteristicRangeEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFCharacteristicRangeEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_MKFCharacteristicRangeEvent;
  BOOL v5 = -[_MKFCharacteristicEvent validateForInsertOrUpdate:](&v10, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(_MKFCharacteristicRangeEvent *)self max];
    if (v6)
    {

LABEL_5:
      LOBYTE(v5) = 1;
      return v5;
    }
    v7 = [(_MKFCharacteristicRangeEvent *)self min];

    if (v7) {
      goto LABEL_5;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"Must have at least one of min or max");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v8;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)validateMax:(id *)a3 error:(id *)a4
{
  return [(NSManagedObject *)self hmd_validateCharacteristicValue:*a3 key:@"max" error:a4];
}

- (BOOL)validateMin:(id *)a3 error:(id *)a4
{
  return [(NSManagedObject *)self hmd_validateCharacteristicValue:*a3 key:@"min" error:a4];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5C57C8;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end