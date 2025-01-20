@interface RecentsCallServices
- (_TtC11MobilePhone19RecentsCallServices)init;
- (_TtC11MobilePhone19RecentsCallServices)initWithGroupConversationsEnabled:(BOOL)a3 recentsCallServicesDialer:(id)a4;
- (void)placeCallWithRecentCall:(id)a3;
@end

@implementation RecentsCallServices

- (_TtC11MobilePhone19RecentsCallServices)initWithGroupConversationsEnabled:(BOOL)a3 recentsCallServicesDialer:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();

  return (_TtC11MobilePhone19RecentsCallServices *)specialized RecentsCallServices.init(groupConversationsEnabled:recentsCallServicesDialer:)(a3, (uint64_t)a4, self);
}

- (void)placeCallWithRecentCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  RecentsCallServices.placeCall(with:)(v4);
}

- (_TtC11MobilePhone19RecentsCallServices)init
{
  result = (_TtC11MobilePhone19RecentsCallServices *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobilePhone19RecentsCallServices____lazy_storage___eventSignal);
}

@end