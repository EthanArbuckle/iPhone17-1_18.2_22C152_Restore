@interface AMSUIMessagingTemporaryActionDataProvider
+ (id)parametersForAppStoreOptInNotificationWithDeeplink:(id)a3;
- (AMSUIMessagingTemporaryActionDataProvider)init;
@end

@implementation AMSUIMessagingTemporaryActionDataProvider

+ (id)parametersForAppStoreOptInNotificationWithDeeplink:(id)a3
{
  uint64_t v3 = sub_21C2BD740();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2BD6F0();
  uint64_t v7 = static ActionDataProvider.parametersForAppStoreOptInNotification(deeplink:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    v8 = (void *)sub_21C2BF1F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (AMSUIMessagingTemporaryActionDataProvider)init
{
  return (AMSUIMessagingTemporaryActionDataProvider *)ActionDataProvider.init()();
}

@end