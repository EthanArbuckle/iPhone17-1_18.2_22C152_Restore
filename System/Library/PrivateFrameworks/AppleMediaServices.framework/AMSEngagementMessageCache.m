@interface AMSEngagementMessageCache
- (AMSEngagementMessageCache)init;
- (BOOL)isBlockedWithMessageRequest:(id)a3 placement:(id)a4 serviceType:(id)a5;
- (id)filterWithMessage:(id)a3;
- (void)addWithCachePolicy:(int64_t)a3 placement:(id)a4 serviceType:(id)a5;
@end

@implementation AMSEngagementMessageCache

- (void).cxx_destruct
{
}

- (AMSEngagementMessageCache)init
{
  return (AMSEngagementMessageCache *)EngagementMessageCache.init()();
}

- (id)filterWithMessage:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D70D584(v4);

  v6 = (void *)sub_18DD4E0F0();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)addWithCachePolicy:(int64_t)a3 placement:(id)a4 serviceType:(id)a5
{
  sub_18DD4DEB0();
  sub_18DD4DEB0();
  v6 = self;
  sub_18D79BB1C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)isBlockedWithMessageRequest:(id)a3 placement:(id)a4 serviceType:(id)a5
{
  sub_18DD4DEB0();
  sub_18DD4DEB0();
  id v7 = a3;
  v8 = self;
  char v9 = sub_18D79BC48();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

@end