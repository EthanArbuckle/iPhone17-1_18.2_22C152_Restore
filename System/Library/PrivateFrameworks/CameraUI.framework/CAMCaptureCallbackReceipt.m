@interface CAMCaptureCallbackReceipt
- (CAMCaptureCallbackReceipt)initWithCallback:(int64_t)a3 duration:(double)a4;
- (double)secondsSinceBegin;
- (int64_t)callback;
@end

@implementation CAMCaptureCallbackReceipt

- (CAMCaptureCallbackReceipt)initWithCallback:(int64_t)a3 duration:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMCaptureCallbackReceipt;
  v6 = [(CAMCaptureCallbackReceipt *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_callback = a3;
    v6->_secondsSinceBegin = a4;
    v8 = v6;
  }

  return v7;
}

- (int64_t)callback
{
  return self->_callback;
}

- (double)secondsSinceBegin
{
  return self->_secondsSinceBegin;
}

@end