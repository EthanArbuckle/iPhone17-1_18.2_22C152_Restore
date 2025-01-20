@interface _MXExtensionRequestReceipt
- (_MXExtensionRequestReceipt)initWithCompletion:(id)a3;
- (void)cancel;
- (void)cancelWithTimeInterval:(double)a3;
- (void)dealloc;
@end

@implementation _MXExtensionRequestReceipt

- (_MXExtensionRequestReceipt)initWithCompletion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MXExtensionRequestReceipt;
  v5 = [(_MXExtensionRequestReceipt *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    [(NSTimer *)timer invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)_MXExtensionRequestReceipt;
  [(_MXExtensionRequestReceipt *)&v4 dealloc];
}

- (void)cancel
{
  id completion = self->_completion;
  if (completion)
  {
    v5 = (void (**)(void))MEMORY[0x18C139AE0](completion, a2);
    id v4 = self->_completion;
    self->_id completion = 0;

    if (v5)
    {
      v5[2](v5);
    }
  }
}

- (void)cancelWithTimeInterval:(double)a3
{
  timer = self->_timer;
  if (timer) {
    [(NSTimer *)timer invalidate];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_cancel selector:0 userInfo:0 repeats:a3];
  v7 = self->_timer;
  self->_timer = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end