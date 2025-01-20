@interface _MKFPerson
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFPersonDatabaseID)databaseID;
- (id)createHMPerson;
- (void)updateWithHMPerson:(id)a3;
@end

@implementation _MKFPerson

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E492308;
}

- (MKFPersonDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFPersonDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)createHMPerson
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)updateWithHMPerson:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFPerson"];
}

@end