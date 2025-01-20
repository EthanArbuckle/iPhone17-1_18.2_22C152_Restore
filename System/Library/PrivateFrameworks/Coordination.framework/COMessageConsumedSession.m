@interface COMessageConsumedSession
- (BOOL)isEqual:(id)a3;
- (COMessageConsumedSession)initWithMember:(id)a3 consumer:(id)a4;
- (COMessageSessionConsumer)consumer;
- (id)description;
- (unint64_t)hash;
@end

@implementation COMessageConsumedSession

- (COMessageConsumedSession)initWithMember:(id)a3 consumer:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)COMessageConsumedSession;
  v7 = [(COMessageSession *)&v10 initWithMember:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_consumer, v6);
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(COMessageConsumedSession *)self consumer];
  v7 = [(COMessageSession *)self member];
  v8 = [v3 stringWithFormat:@"<%@: %p, consumer = %@>, member = %@", v5, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageConsumedSession;
  return [(COMessageSession *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COMessageConsumedSession;
  return [(COMessageSession *)&v4 isEqual:a3];
}

- (COMessageSessionConsumer)consumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);

  return (COMessageSessionConsumer *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end