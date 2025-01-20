@interface HAP2CoAPIOConsumerWeakHolder
+ (id)new;
- (HAP2CoAPIOConsumer)consumer;
- (HAP2CoAPIOConsumerWeakHolder)init;
- (HAP2CoAPIOConsumerWeakHolder)initWithConsumer:(id)a3;
@end

@implementation HAP2CoAPIOConsumerWeakHolder

- (void).cxx_destruct
{
}

- (HAP2CoAPIOConsumer)consumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);

  return (HAP2CoAPIOConsumer *)WeakRetained;
}

- (HAP2CoAPIOConsumerWeakHolder)initWithConsumer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HAP2CoAPIOConsumerWeakHolder;
  v5 = [(HAP2CoAPIOConsumerWeakHolder *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_consumer, v4);
  }

  return v6;
}

- (HAP2CoAPIOConsumerWeakHolder)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end