@interface IDSDXPCGroupSessionKeyValueDeliveryProvider
- (IDSDXPCGroupSessionKeyValueDeliveryProvider)initWithQueue:(id)a3 connection:(id)a4;
- (OS_dispatch_queue)queue;
- (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation IDSDXPCGroupSessionKeyValueDeliveryProvider

- (IDSDXPCGroupSessionKeyValueDeliveryProvider)initWithQueue:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasEntitlement:kIDSGroupSessionKeyValueDeliveryEntitlement])
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSDXPCGroupSessionKeyValueDeliveryProvider;
    v9 = [(IDSDXPCGroupSessionKeyValueDeliveryProvider *)&v14 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_queue, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Missing IDS Group Session Key Value Delivery entitlement -- failing creation of IDSDXPCGroupSessionKeyValueDeliveryProvider collaborator {connection: %@}", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  v6 = +[IDSDSessionController sharedInstance];
  id v7 = [v6 sessionWithUniqueID:v5];

  if (!v7) {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
  id v8 = [v7 keyValueDelivery];
  (*((void (**)(id, void *, void))v9 + 2))(v9, v8, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end