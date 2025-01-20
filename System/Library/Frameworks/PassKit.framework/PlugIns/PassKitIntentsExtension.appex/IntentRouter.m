@interface IntentRouter
- (IntentRouter)init;
- (NSMutableDictionary)intentHandlerCache;
- (OS_dispatch_queue)intentQueue;
- (id)handlerForIntent:(id)a3;
- (void)pk_didFinishInteractionForIntent:(id)a3;
- (void)setIntentHandlerCache:(id)a3;
- (void)setIntentQueue:(id)a3;
- (void)transactionDidCompleteForIntentIdentifier:(id)a3;
@end

@implementation IntentRouter

- (IntentRouter)init
{
  kdebug_trace();
  v11.receiver = self;
  v11.super_class = (Class)IntentRouter;
  v3 = [(IntentRouter *)&v11 init];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    intentHandlerCache = v3->_intentHandlerCache;
    v3->_intentHandlerCache = v4;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.PassKit.IntentRouter", v7, 0);
    intentQueue = v3->_intentQueue;
    v3->_intentQueue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5 = [v4 identifier];
  v6 = [(NSMutableDictionary *)self->_intentHandlerCache objectForKey:v5];
  if (!v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = [(PKPeerPaymentIntentHandler *)[PKSendPaymentIntentHandler alloc] initWithDelegate:self intentQueue:self->_intentQueue];
    }
    else {
      v6 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(PKPeerPaymentIntentHandler *)[PKRequestPaymentIntentHandler alloc] initWithDelegate:self intentQueue:self->_intentQueue];

      v6 = (PKSendPaymentIntentHandler *)v7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_queue_t v8 = [(PKPeerPaymentIntentHandler *)[PKSearchForAccountsIntentHandler alloc] initWithDelegate:self intentQueue:self->_intentQueue];

      v6 = (PKSendPaymentIntentHandler *)v8;
    }
    if (v6)
    {
      [(NSMutableDictionary *)self->_intentHandlerCache setObject:v6 forKey:v5];
    }
    else
    {
      v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000DE64((uint64_t)v4, v9);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (void)transactionDidCompleteForIntentIdentifier:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_intentHandlerCache, "removeObjectForKey:");
  }
}

- (void)pk_didFinishInteractionForIntent:(id)a3
{
  uint64_t v4 = [a3 identifier];
  if (v4) {
    [(NSMutableDictionary *)self->_intentHandlerCache removeObjectForKey:v4];
  }

  _objc_release_x1();
}

- (NSMutableDictionary)intentHandlerCache
{
  return self->_intentHandlerCache;
}

- (void)setIntentHandlerCache:(id)a3
{
}

- (OS_dispatch_queue)intentQueue
{
  return self->_intentQueue;
}

- (void)setIntentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentQueue, 0);

  objc_storeStrong((id *)&self->_intentHandlerCache, 0);
}

@end