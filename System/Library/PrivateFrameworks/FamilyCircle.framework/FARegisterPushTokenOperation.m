@interface FARegisterPushTokenOperation
- (FARegisterPushTokenOperation)initWithNetworkService:(id)a3 pushToken:(id)a4;
- (NSData)pushToken;
- (id)pushTokenString;
- (id)registerToken;
@end

@implementation FARegisterPushTokenOperation

- (FARegisterPushTokenOperation)initWithNetworkService:(id)a3 pushToken:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FARegisterPushTokenOperation;
  v8 = [(FANetworkClient *)&v11 initWithNetworkService:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_pushToken, a4);
  }

  return v9;
}

- (id)pushTokenString
{
  v3 = +[NSMutableString stringWithCapacity:64];
  size_t v4 = [(NSData *)self->_pushToken length];
  v5 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
  [(NSData *)self->_pushToken getBytes:v5 length:v4];
  if (v4)
  {
    v6 = v5;
    do
    {
      uint64_t v7 = *v6++;
      objc_msgSend(v3, "appendFormat:", @"%02.2hhX", v7);
      --v4;
    }
    while (v4);
  }
  free(v5);
  v8 = [v3 lowercaseString];

  return v8;
}

- (id)registerToken
{
  v3 = [(FANetworkClient *)self networkService];
  size_t v4 = [v3 ensureDeviceUnlockedSinceBoot];
  v5 = [v4 then];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001FD68;
  v16[3] = &unk_10004D0F8;
  v16[4] = self;
  v6 = ((void (**)(void, void *))v5)[2](v5, v16);
  uint64_t v7 = [v6 then];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001FDB8;
  v15[3] = &unk_10004D930;
  v15[4] = self;
  v8 = ((void (**)(void, void *))v7)[2](v7, v15);
  v9 = [v8 then];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001FE88;
  v14[3] = &unk_10004D5B0;
  v14[4] = self;
  v10 = ((void (**)(void, void *))v9)[2](v9, v14);
  objc_super v11 = [v10 then];
  v12 = ((void (**)(void, Block_layout *))v11)[2](v11, &stru_10004E698);

  return v12;
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end