@interface CLTimerWeakHolder
+ (id)holderWithTimer:(id)a3;
- (CLTimer)timer;
- (CLTimerWeakHolder)initWithTimer:(id)a3;
@end

@implementation CLTimerWeakHolder

+ (id)holderWithTimer:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTimer:v4];

  return v5;
}

- (CLTimerWeakHolder)initWithTimer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLTimerWeakHolder;
  v5 = [(CLTimerWeakHolder *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_timer, v4);
  }

  return v6;
}

- (CLTimer)timer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timer);
  return (CLTimer *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end