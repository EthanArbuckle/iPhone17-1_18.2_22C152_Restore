@interface LoadStoreQueueRequestEncoder
- (LoadStoreQueueRequestEncoder)initWithBag:(id)a3;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation LoadStoreQueueRequestEncoder

- (LoadStoreQueueRequestEncoder)initWithBag:(id)a3
{
  id v4 = a3;
  v5 = sub_1003DA6D4();
  id v6 = v5;
  if (self)
  {
    v9.receiver = self;
    v9.super_class = (Class)LoadStoreQueueRequestEncoder;
    v7 = [(LoadStoreQueueRequestEncoder *)&v9 initWithBag:v4];
    self = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_device, v5);
    }
  }

  return self;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  [v7 setCachePolicy:1];
  sub_1003DAA90(v7, 1, self->_device);
  v10.receiver = self;
  v10.super_class = (Class)LoadStoreQueueRequestEncoder;
  v8 = [(LoadStoreQueueRequestEncoder *)&v10 requestByEncodingRequest:v7 parameters:v6];

  return v8;
}

- (void).cxx_destruct
{
}

@end