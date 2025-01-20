@interface TelephonyProvider
- (TelephonyProvider)initWithRegistry:(const void *)a3;
- (TelephonyProviderDelegate)telephonyProviderDelegate;
- (id).cxx_construct;
- (void)setTelephonyProviderDelegate:(id)a3;
@end

@implementation TelephonyProvider

- (TelephonyProvider)initWithRegistry:(const void *)a3
{
  id v5 = objc_alloc_init((Class)CXProviderConfiguration);
  [v5 setSupportsEmergency:1];
  [v5 setSupportsVoicemail:1];
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_101AE63E8, 0);
  [v5 setSupportedHandleTypes:v6];

  v17.receiver = self;
  v17.super_class = (Class)TelephonyProvider;
  v7 = [(TelephonyProvider *)&v17 initWithConfiguration:v5];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("TelephonyProvider", v8);
    fObj = v7->fQueue.fObj.fObj;
    v7->fQueue.fObj.fObj = (dispatch_object_s *)v9;
    if (fObj) {
      dispatch_release(fObj);
    }
    v11 = [TelephonyProviderDelegate alloc];
    v12 = v7->fQueue.fObj.fObj;
    dispatch_object_t object = v12;
    if (v12) {
      dispatch_retain(v12);
    }
    v13 = [(TelephonyProviderDelegate *)v11 initWithProvider:v7 registry:a3 queue:&object];
    if (object) {
      dispatch_release(object);
    }
    [(TelephonyProvider *)v7 setDelegate:v13 queue:0];
    telephonyProviderDelegate = v7->_telephonyProviderDelegate;
    v7->_telephonyProviderDelegate = v13;
  }
  return v7;
}

- (TelephonyProviderDelegate)telephonyProviderDelegate
{
  return self->_telephonyProviderDelegate;
}

- (void)setTelephonyProviderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyProviderDelegate, 0);
  fObj = self->fQueue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end