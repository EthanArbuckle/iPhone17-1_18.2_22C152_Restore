@interface AMSCampaignAttributor
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSCampaignAttributor)init;
- (AMSCampaignAttributor)initWithAppBag:(id)a3;
- (AMSCampaignAttributor)initWithBag:(id)a3;
- (void)processURL:(NSURL *)a3 ignoreMarketing:(BOOL)a4 completionHandler:(id)a5;
- (void)setAccount:(id)a3;
@end

@implementation AMSCampaignAttributor

- (AMSBagProtocol)bag
{
  v2 = (void *)CampaignAttributor.bag.getter();
  return (AMSBagProtocol *)v2;
}

- (ACAccount)account
{
  v2 = CampaignAttributor.account.getter();
  return (ACAccount *)v2;
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  v6 = self;
  CampaignAttributor.account.setter(a3);
}

- (AMSCampaignAttributor)initWithAppBag:(id)a3
{
  return (AMSCampaignAttributor *)CampaignAttributor.init(appBag:)((uint64_t)a3);
}

- (AMSCampaignAttributor)initWithBag:(id)a3
{
  return (AMSCampaignAttributor *)CampaignAttributor.init(bag:)((uint64_t)a3);
}

- (void)processURL:(NSURL *)a3 ignoreMarketing:(BOOL)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_18D677FD0((uint64_t)&unk_1E91BAC90, v9);
}

- (AMSCampaignAttributor)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSCampaignAttributor_account);
}

@end