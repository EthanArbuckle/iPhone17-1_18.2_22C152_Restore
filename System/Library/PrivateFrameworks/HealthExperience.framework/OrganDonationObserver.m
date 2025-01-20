@interface OrganDonationObserver
- (OrganDonationObserver)init;
- (OrganDonationObserverDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startObservingChanges;
@end

@implementation OrganDonationObserver

- (OrganDonationObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)OrganDonationObserver;
  result = [(OrganDonationObserver *)&v3 init];
  if (result) {
    result->_organDonationChangedToken = -1;
  }
  return result;
}

- (void)startObservingChanges
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)*MEMORY[0x1E4F67930];
  v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__OrganDonationObserver_startObservingChanges__block_invoke;
  v6[3] = &unk_1E6456858;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_organDonationChangedToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__OrganDonationObserver_startObservingChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 organDonationDidChange];

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  int organDonationChangedToken = self->_organDonationChangedToken;
  if (organDonationChangedToken != -1) {
    notify_cancel(organDonationChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)OrganDonationObserver;
  [(OrganDonationObserver *)&v4 dealloc];
}

- (OrganDonationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OrganDonationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end