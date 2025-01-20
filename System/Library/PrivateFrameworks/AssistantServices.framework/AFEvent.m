@interface AFEvent
- (AFEvent)initWithBMEvent:(id)a3;
- (id)bmEvent;
- (void)setBmEvent:(id)a3;
@end

@implementation AFEvent

- (void).cxx_destruct
{
}

- (void)setBmEvent:(id)a3
{
}

- (id)bmEvent
{
  return self->_bmEvent;
}

- (AFEvent)initWithBMEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFEvent;
  v6 = [(AFEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_bmEvent, a3);
  }

  return v7;
}

@end