@interface BBAppProtectionMonitor
- (APSubjectMonitorSubscription)subscription;
- (BBAppProtectionMonitor)initWithDelegate:(id)a3;
- (BBAppProtectionMonitorDelegate)delegate;
- (BOOL)isApplicationHidden:(id)a3;
- (BOOL)isApplicationLocked:(id)a3;
- (BOOL)shouldHideContentPreview:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation BBAppProtectionMonitor

- (BBAppProtectionMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBAppProtectionMonitor;
  v5 = [(BBAppProtectionMonitor *)&v10 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F25220] subjectMonitorRegistry];
    uint64_t v7 = [v6 addMonitor:v5 subjectMask:1];
    subscription = v5->_subscription;
    v5->_subscription = (APSubjectMonitorSubscription *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  [(APSubjectMonitorSubscription *)self->_subscription invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBAppProtectionMonitor;
  [(BBAppProtectionMonitor *)&v3 dealloc];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_14, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained protectionStateChangedForBundleIdentifiers:v6];
}

id __71__BBAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 bundleIdentifier];

  return v7;
}

- (BOOL)isApplicationLocked:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  char v4 = [v3 isLocked];

  return v4;
}

- (BOOL)isApplicationHidden:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  char v4 = [v3 isHidden];

  return v4;
}

- (BOOL)shouldHideContentPreview:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  if ([v3 isHidden]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isLocked];
  }

  return v4;
}

- (BBAppProtectionMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BBAppProtectionMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end