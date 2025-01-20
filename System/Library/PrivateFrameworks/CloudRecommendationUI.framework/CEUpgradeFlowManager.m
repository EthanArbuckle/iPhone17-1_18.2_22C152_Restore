@interface CEUpgradeFlowManager
- (CEUpgradeFlowManager)init;
- (CEUpgradeFlowManagerDelegate)delegate;
- (ICQOffer)offer;
- (ICQUpgradeFlowManager)upgradeFlowManager;
- (void)beginAppleOneUpgradeFlowWithPresenter:(id)a3 url:(id)a4;
- (void)beginLiftUIUpgradeFlowWithPresenter:(id)a3 url:(id)a4;
- (void)beginRemoteUIUpgradeFlowWithPresenter:(id)a3 url:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setOffer:(id)a3;
- (void)setUpgradeFlowManager:(id)a3;
- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4;
@end

@implementation CEUpgradeFlowManager

- (CEUpgradeFlowManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CEUpgradeFlowManager;
  v2 = [(CEUpgradeFlowManager *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getICQOfferClass_softClass;
    uint64_t v13 = getICQOfferClass_softClass;
    if (!getICQOfferClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getICQOfferClass_block_invoke;
      v9[3] = &unk_265285CA0;
      v9[4] = &v10;
      __getICQOfferClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (ICQOffer *)objc_alloc_init(v4);
    offer = v2->_offer;
    v2->_offer = v5;
  }
  return v2;
}

- (void)beginLiftUIUpgradeFlowWithPresenter:(id)a3 url:(id)a4
{
  if (a4)
  {
    offer = self->_offer;
    id v7 = a4;
    id v8 = a3;
    [(ICQOffer *)offer _updateRequestedServerUIURLWithURL:v7];
    upgradeFlowManager = self->_upgradeFlowManager;
    if (!upgradeFlowManager)
    {
      uint64_t v10 = (ICQUpgradeFlowManager *)[objc_alloc((Class)getICQUpgradeFlowManagerClass()) initWithOffer:self->_offer];
      v11 = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v10;

      upgradeFlowManager = self->_upgradeFlowManager;
    }
    [(ICQUpgradeFlowManager *)upgradeFlowManager setDelegate:self];
    id v12 = (id)[objc_alloc((Class)getICQLinkClass()) initWithAction:115 url:v7];

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager beginRemoteUpgradeFlowWithICQLink:v12 presenter:v8];
  }
}

- (void)beginRemoteUIUpgradeFlowWithPresenter:(id)a3 url:(id)a4
{
  if (a4)
  {
    offer = self->_offer;
    id v7 = a4;
    id v8 = a3;
    [(ICQOffer *)offer _updateRequestedServerUIURLWithURL:v7];
    upgradeFlowManager = self->_upgradeFlowManager;
    if (!upgradeFlowManager)
    {
      uint64_t v10 = (ICQUpgradeFlowManager *)[objc_alloc((Class)getICQUpgradeFlowManagerClass()) initWithOffer:self->_offer];
      v11 = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v10;

      upgradeFlowManager = self->_upgradeFlowManager;
    }
    [(ICQUpgradeFlowManager *)upgradeFlowManager setDelegate:self];
    id v12 = (id)[objc_alloc((Class)getICQLinkClass()) initWithAction:112 url:v7];

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager beginRemoteUpgradeFlowWithICQLink:v12 presenter:v8];
  }
}

- (void)beginAppleOneUpgradeFlowWithPresenter:(id)a3 url:(id)a4
{
  if (a4)
  {
    offer = self->_offer;
    id v7 = a4;
    id v8 = a3;
    [(ICQOffer *)offer _updateRequestedServerUIURLWithURL:v7];
    upgradeFlowManager = self->_upgradeFlowManager;
    if (!upgradeFlowManager)
    {
      uint64_t v10 = (ICQUpgradeFlowManager *)[objc_alloc((Class)getICQUpgradeFlowManagerClass()) initWithOffer:self->_offer];
      v11 = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v10;

      upgradeFlowManager = self->_upgradeFlowManager;
    }
    [(ICQUpgradeFlowManager *)upgradeFlowManager setDelegate:self];
    id v12 = (id)[objc_alloc((Class)getICQLinkClass()) initWithAction:122 url:v7];

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager beginRemoteUpgradeFlowWithICQLink:v12 presenter:v8];
  }
}

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(CEUpgradeFlowManager *)self delegate];
  [v6 upgradeFlowManager:self didPresentViewController:v5];
}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(CEUpgradeFlowManager *)self delegate];
  [v6 upgradeFlowManagerDidFail:self error:v5];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = [(CEUpgradeFlowManager *)self delegate];
  [v4 upgradeFlowManagerDidComplete:self];
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = [(CEUpgradeFlowManager *)self delegate];
  [v4 upgradeFlowManagerDidCancel:self];
}

- (CEUpgradeFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEUpgradeFlowManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (ICQUpgradeFlowManager)upgradeFlowManager
{
  return self->_upgradeFlowManager;
}

- (void)setUpgradeFlowManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end