@interface JSRandomObject
- (_TtC9JetEngine14JSRandomObject)init;
- (id)nextBoolean;
- (id)nextNumber;
- (id)nextUUID;
@end

@implementation JSRandomObject

- (_TtC9JetEngine14JSRandomObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSRandomObject *)&v3 init];
}

- (id)nextUUID
{
  v2 = (void *)sub_19EE5F250();
  return v2;
}

- (id)nextBoolean
{
  v2 = (void *)sub_19F0E211C();
  return v2;
}

- (id)nextNumber
{
  v2 = (void *)sub_19F0E220C();
  return v2;
}

@end