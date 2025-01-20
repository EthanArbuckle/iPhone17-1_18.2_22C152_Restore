@interface RPCompanionLinkClient(Coordination)
+ (id)co_companionLinkClientForDiscovery;
+ (id)co_companionLinkClientForDiscoveryOnDispatchQueue:()Coordination;
+ (id)co_companionLinkClientToDevice:()Coordination;
+ (id)co_companionLinkClientToDevice:()Coordination dispatchQueue:;
@end

@implementation RPCompanionLinkClient(Coordination)

+ (id)co_companionLinkClientForDiscovery
{
  id v1 = objc_alloc_init(a1);
  [v1 setControlFlags:2052];
  return v1;
}

+ (id)co_companionLinkClientForDiscoveryOnDispatchQueue:()Coordination
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "co_companionLinkClientForDiscovery");
  [v5 setDispatchQueue:v4];

  return v5;
}

+ (id)co_companionLinkClientToDevice:()Coordination
{
  id v4 = a3;
  id v5 = objc_alloc_init(a1);
  [v5 setControlFlags:0x20000400800];
  [v5 setDestinationDevice:v4];

  return v5;
}

+ (id)co_companionLinkClientToDevice:()Coordination dispatchQueue:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "co_companionLinkClientToDevice:", a3);
  [v7 setDispatchQueue:v6];

  return v7;
}

@end