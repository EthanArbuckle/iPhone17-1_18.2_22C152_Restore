@interface _BMCancellableClientSubscriber
- (BMComputeXPCPublisherClient)client;
- (NSString)identifier;
- (_BMCancellableClientSubscriber)initWithClient:(id)a3 identifier:(id)a4;
- (void)cancel;
- (void)setClient:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _BMCancellableClientSubscriber

- (_BMCancellableClientSubscriber)initWithClient:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_BMCancellableClientSubscriber;
  v9 = [(_BMCancellableClientSubscriber *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;
  }
  return v10;
}

- (void)cancel
{
  v4 = self;
  v2 = [(_BMCancellableClientSubscriber *)v4 client];
  v3 = [(_BMCancellableClientSubscriber *)v4 identifier];
  [v2 unsubscribeWithIdentifier:v3];
}

- (BMComputeXPCPublisherClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end