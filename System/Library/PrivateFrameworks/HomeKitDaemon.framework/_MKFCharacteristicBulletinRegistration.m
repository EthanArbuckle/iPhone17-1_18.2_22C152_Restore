@interface _MKFCharacteristicBulletinRegistration
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFCharacteristicBulletinRegistrationDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFCharacteristicBulletinRegistration

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCharacteristicBulletinRegistration"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5A60D0;
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
  v2 = [(_MKFCharacteristicBulletinRegistration *)self user];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFCharacteristicBulletinRegistrationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFCharacteristicBulletinRegistrationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end