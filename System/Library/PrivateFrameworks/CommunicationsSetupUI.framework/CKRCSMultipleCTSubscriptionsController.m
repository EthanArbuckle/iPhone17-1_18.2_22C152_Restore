@interface CKRCSMultipleCTSubscriptionsController
- (CKLazuliEnablementProtocol)lazuliEnablementManager;
- (CKRCSMultipleCTSubscriptionsController)init;
- (id)isEnabledForSubscription:(id)a3;
- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4;
- (void)setLazuliEnablementManager:(id)a3;
@end

@implementation CKRCSMultipleCTSubscriptionsController

- (CKRCSMultipleCTSubscriptionsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKRCSMultipleCTSubscriptionsController;
  v2 = [(CKRCSMultipleCTSubscriptionsController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CKLazuliEnablementManager);
    lazuliEnablementManager = v2->_lazuliEnablementManager;
    v2->_lazuliEnablementManager = (CKLazuliEnablementProtocol *)v3;
  }
  return v2;
}

- (id)isEnabledForSubscription:(id)a3
{
  id v4 = a3;
  v5 = [(CKRCSMultipleCTSubscriptionsController *)self lazuliEnablementManager];
  objc_super v6 = [v5 isRCSEnabled:v4];

  return v6;
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(CKRCSMultipleCTSubscriptionsController *)self lazuliEnablementManager];
    [v8 setRCSEnabled:v6 specifier:v7];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "Ignoring attempt to set RCS enablement to NULL", v9, 2u);
    }
  }

LABEL_4:
}

- (CKLazuliEnablementProtocol)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end