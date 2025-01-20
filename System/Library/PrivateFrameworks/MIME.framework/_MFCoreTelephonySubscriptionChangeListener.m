@interface _MFCoreTelephonySubscriptionChangeListener
- (_MFCoreTelephonySubscriptionChangeListener)init;
- (void)carrierBundleChange:(id)a3;
@end

@implementation _MFCoreTelephonySubscriptionChangeListener

- (_MFCoreTelephonySubscriptionChangeListener)init
{
  v9.receiver = self;
  v9.super_class = (Class)_MFCoreTelephonySubscriptionChangeListener;
  v2 = [(_MFCoreTelephonySubscriptionChangeListener *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.email.telephony", v3);
    telephonyQueue = v2->_telephonyQueue;
    v2->_telephonyQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_telephonyQueue];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v6;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
  }
  return v2;
}

- (void)carrierBundleChange:(id)a3
{
  dispatch_queue_t v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1AFB03000, v4, OS_LOG_TYPE_INFO, "SoftBank: Carrier bundle change.", v6, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_telephonyQueue);
  sInnerCanUseCodePoints = 0;
  v5 = (void *)sSoftBankTransform;
  sSoftBankTransform = 0;

  atomic_store(0, (unsigned __int8 *)&sCanUseCodePoints);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
}

@end