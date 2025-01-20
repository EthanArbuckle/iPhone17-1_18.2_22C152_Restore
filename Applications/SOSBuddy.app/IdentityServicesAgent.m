@interface IdentityServicesAgent
- (_TtC8SOSBuddy21IdentityServicesAgent)init;
- (void)dealloc;
- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6;
@end

@implementation IdentityServicesAgent

- (void)dealloc
{
  v2 = self;
  sub_10025DB10();
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy21IdentityServicesAgent__manager);
}

- (_TtC8SOSBuddy21IdentityServicesAgent)init
{
  result = (_TtC8SOSBuddy21IdentityServicesAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = self;
  sub_100260708(a4, a5);
}

@end