@interface TPSDialAssistController
- (BOOL)supportsDialAssistForSubscriptionContext:(id)a3;
- (NSOrderedSet)subscriptions;
- (TPSCarrierBundleController)carrierBundleController;
- (TPSDialAssistController)init;
@end

@implementation TPSDialAssistController

- (TPSDialAssistController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TPSDialAssistController;
  v2 = [(TPSDialAssistController *)&v6 init];
  if (v2)
  {
    v3 = (TPSCarrierBundleController *)objc_alloc_init((Class)TPSCarrierBundleController);
    carrierBundleController = v2->_carrierBundleController;
    v2->_carrierBundleController = v3;
  }
  return v2;
}

- (BOOL)supportsDialAssistForSubscriptionContext:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(TPSDialAssistController *)self carrierBundleController];
  id v15 = 0;
  v7 = [v6 objectForKey:@"ShowDialAssist" subscriptionContext:v5 error:&v15];

  id v8 = v15;
  if (v8)
  {
    v9 = TPSDialAssistLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v14;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
  }
  else
  {
    if (!v7)
    {
      unsigned __int8 v10 = 1;
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v10 = [v7 BOOLValue];
      goto LABEL_6;
    }
  }
  unsigned __int8 v10 = 0;
LABEL_6:

  return v10;
}

- (NSOrderedSet)subscriptions
{
  return self->_subscriptions;
}

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleController, 0);

  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end