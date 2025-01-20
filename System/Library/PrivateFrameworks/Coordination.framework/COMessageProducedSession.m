@interface COMessageProducedSession
- (BOOL)isEqual:(id)a3;
- (COMessageProducedSession)initWithMember:(id)a3 producer:(id)a4;
- (COMessageSessionProducer)producer;
- (id)description;
- (unint64_t)hash;
@end

@implementation COMessageProducedSession

- (COMessageProducedSession)initWithMember:(id)a3 producer:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)COMessageProducedSession;
  v7 = [(COMessageSession *)&v10 initWithMember:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_producer, v6);
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(COMessageProducedSession *)self producer];
  v7 = [(COMessageSession *)self member];
  v8 = [v3 stringWithFormat:@"<%@: %p, producer = %@>, member = %@", v5, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageProducedSession;
  return [(COMessageSession *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COMessageProducedSession;
  return [(COMessageSession *)&v4 isEqual:a3];
}

- (COMessageSessionProducer)producer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_producer);

  return (COMessageSessionProducer *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end