@interface EventStoreManager
- (_TtC18ASMessagesProvider17EventStoreManager)init;
@end

@implementation EventStoreManager

- (_TtC18ASMessagesProvider17EventStoreManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC18ASMessagesProvider17EventStoreManager_eventStore;
  id v5 = objc_allocWithZone((Class)EKEventStore);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 init];

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(EventStoreManager *)&v8 init];
}

- (void).cxx_destruct
{
}

@end