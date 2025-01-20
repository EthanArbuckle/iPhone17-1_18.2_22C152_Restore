@interface CPDistributedMessagingCallout
- (BOOL)returnsVoid;
- (CPDistributedMessagingCallout)initWithTarget:(id)a3 selector:(SEL)a4;
- (SEL)selector;
- (id)target;
- (void)dealloc;
@end

@implementation CPDistributedMessagingCallout

- (CPDistributedMessagingCallout)initWithTarget:(id)a3 selector:(SEL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CPDistributedMessagingCallout;
  v6 = [(CPDistributedMessagingCallout *)&v11 init];
  if (v6)
  {
    id v7 = a3;
    v6->_target = v7;
    p_selector = &v6->_selector;
    if (a4)
    {
      SEL *p_selector = a4;
      SEL v9 = a4;
    }
    else
    {
      SEL v9 = 0;
      SEL *p_selector = 0;
    }
    v6->_returnsVoid = objc_msgSend((id)objc_msgSend(v7, "methodSignatureForSelector:", v9), "methodReturnLength") == 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPDistributedMessagingCallout;
  [(CPDistributedMessagingCallout *)&v3 dealloc];
}

- (id)target
{
  return self->_target;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (BOOL)returnsVoid
{
  return self->_returnsVoid;
}

@end