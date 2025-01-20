@interface HPRFSessionTrackerAppSettingsContext
- (HPRFSessionTrackerAppSettingsContext)init;
- (HPRFSessionTrackerAppSettingsContext)initWithWheelchairUseCache:(id)a3;
- (void)fetchSubscriptionStatusWithCompletion:(id)a3;
@end

@implementation HPRFSessionTrackerAppSettingsContext

- (HPRFSessionTrackerAppSettingsContext)initWithWheelchairUseCache:(id)a3
{
  return (HPRFSessionTrackerAppSettingsContext *)sub_1DDC8(a3);
}

- (void)fetchSubscriptionStatusWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1DF58((uint64_t)sub_1F86C, v5);

  swift_release();
}

- (HPRFSessionTrackerAppSettingsContext)init
{
  result = (HPRFSessionTrackerAppSettingsContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end