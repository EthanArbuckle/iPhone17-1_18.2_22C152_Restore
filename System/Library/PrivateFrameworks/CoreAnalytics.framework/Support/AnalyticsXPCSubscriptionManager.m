@interface AnalyticsXPCSubscriptionManager
+ (id)AnalyticsQueryValuesWrapperWithArguments:(id)a3;
+ (void)subscribeToUserDataChangesWithArguments:(id)a3;
- (_TtC10analyticsd31AnalyticsXPCSubscriptionManager)init;
@end

@implementation AnalyticsXPCSubscriptionManager

+ (void)subscribeToUserDataChangesWithArguments:(id)a3
{
  id v3 = a3;
  _s10analyticsd31AnalyticsXPCSubscriptionManagerC26subscribeToUserDataChanges9argumentsySo5NSSetC_tFZ_0();
}

+ (id)AnalyticsQueryValuesWrapperWithArguments:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = AnalyticsQueryValuesFor(arguments:)();

  return v4;
}

- (_TtC10analyticsd31AnalyticsXPCSubscriptionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnalyticsXPCSubscriptionManager();
  return [(AnalyticsXPCSubscriptionManager *)&v3 init];
}

@end