@interface _MKFCharacteristicValueEvent
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)validateEventValue:(id *)a3 error:(id *)a4;
- (MKFCharacteristicValueEventDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFCharacteristicValueEvent

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5146F0;
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

- (MKFHome)home
{
  v2 = [(_MKFCharacteristicValueEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFCharacteristicValueEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFCharacteristicValueEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)validateEventValue:(id *)a3 error:(id *)a4
{
  return [(NSManagedObject *)self hmd_validateCharacteristicValue:*a3 key:@"eventValue" error:a4];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCharacteristicValueEvent"];
}

@end