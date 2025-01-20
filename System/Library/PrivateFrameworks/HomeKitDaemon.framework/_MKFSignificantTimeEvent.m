@interface _MKFSignificantTimeEvent
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFSignificantTimeEventDatabaseID)databaseID;
- (void)awakeFromFetch;
@end

@implementation _MKFSignificantTimeEvent

- (MKFHome)home
{
  v2 = [(_MKFSignificantTimeEvent *)self trigger];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFSignificantTimeEventDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFSignificantTimeEventDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (void)awakeFromFetch
{
  v8.receiver = self;
  v8.super_class = (Class)_MKFSignificantTimeEvent;
  [(_MKFSignificantTimeEvent *)&v8 awakeFromFetch];
  v3 = [(_MKFSignificantTimeEvent *)self offsetSeconds];
  if (!v3)
  {
    v4 = [(_MKFSignificantTimeEvent *)self offset];

    if (!v4) {
      return;
    }
    v5 = NSNumber;
    v3 = [(_MKFSignificantTimeEvent *)self offset];
    v6 = [v3 decodeDateComponents];
    v7 = objc_msgSend(v5, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v6, 0));
    [(_MKFSignificantTimeEvent *)self setPrimitiveValue:v7 forKey:@"offsetSeconds"];
  }
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4C92D8;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  objc_super v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFSignificantTimeEvent"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end