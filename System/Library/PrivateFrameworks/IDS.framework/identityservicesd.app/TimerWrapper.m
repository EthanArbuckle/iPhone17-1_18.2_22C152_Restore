@interface TimerWrapper
- (TimerWrapper)initWithTimer:(id)a3;
@end

@implementation TimerWrapper

- (TimerWrapper)initWithTimer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TimerWrapper;
  v6 = [(TimerWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timer, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end