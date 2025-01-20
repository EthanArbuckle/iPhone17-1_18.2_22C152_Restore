@interface HFOutgoingHomeInvitationItemProvider
- (HFOutgoingHomeInvitationItemProvider)init;
- (HFOutgoingHomeInvitationItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)outgoingInvites;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setOutgoingInvites:(id)a3;
@end

@implementation HFOutgoingHomeInvitationItemProvider

- (HFOutgoingHomeInvitationItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFOutgoingHomeInvitationItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    outgoingInvites = v7->_outgoingInvites;
    v7->_outgoingInvites = v8;
  }
  return v7;
}

- (HFOutgoingHomeInvitationItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFOutgoingHomeInvitationItemProvider.m", 37, @"%s is unavailable; use %@ instead",
    "-[HFOutgoingHomeInvitationItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFOutgoingHomeInvitationItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HFOutgoingHomeInvitationItemProvider *)self home];
  id v4 = [v3 outgoingInvitations];

  objc_initWeak(&location, self);
  id v5 = [(HFOutgoingHomeInvitationItemProvider *)self filter];
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v4 filter:v5 itemMap:&__block_literal_global_53];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__HFOutgoingHomeInvitationItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, &location);
  v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

HFOutgoingHomeInvitationItem *__51__HFOutgoingHomeInvitationItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = [[HFOutgoingHomeInvitationItem alloc] initWithOutgoingInvitation:v5];
  return v6;
}

id __51__HFOutgoingHomeInvitationItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained outgoingInvites];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained outgoingInvites];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFOutgoingHomeInvitationItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"outgoinginvitations"];

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)outgoingInvites
{
  return self->_outgoingInvites;
}

- (void)setOutgoingInvites:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingInvites, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end