@interface _MKFDurationEvent
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFDurationEventDatabaseID)databaseID;
- (MKFHome)home;
@end

@implementation _MKFDurationEvent

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E490C70;
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
  v2 = [(_MKFDurationEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFDurationEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFDurationEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFDurationEvent"];
}

@end