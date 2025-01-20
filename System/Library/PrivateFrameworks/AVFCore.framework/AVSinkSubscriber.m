@interface AVSinkSubscriber
- (AVSinkSubscriber)initWithPublisher:(id)a3 requestingInitialValue:(BOOL)a4 sink:(id)a5;
- (NSString)description;
- (void)cancel;
- (void)dealloc;
@end

@implementation AVSinkSubscriber

- (AVSinkSubscriber)initWithPublisher:(id)a3 requestingInitialValue:(BOOL)a4 sink:(id)a5
{
  BOOL v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVSinkSubscriber;
  v8 = [(AVSinkSubscriber *)&v11 init];
  if (v8)
  {
    v8->_publisher = (AVPublisher *)a3;
    uint64_t v9 = [a5 copy];
    v8->_sink = (id)v9;
    v8->_token = (AVCancellable *)[(AVPublisher *)v8->_publisher subscribeRequestingInitialValue:v6 block:v9];
    v8->_cancelMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v8;
}

- (void)dealloc
{
  [(AVSinkSubscriber *)self cancel];
  if (self->_cancelMutex) {
    FigSimpleMutexDestroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)AVSinkSubscriber;
  [(AVSinkSubscriber *)&v3 dealloc];
}

- (void)cancel
{
  MEMORY[0x199715030](self->_cancelMutex, a2);
  [(AVCancellable *)self->_token cancel];

  self->_token = 0;
  self->_publisher = 0;

  self->_sink = 0;
  JUMPOUT(0x199715040);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p publisher=%@>", objc_opt_class(), self, self->_publisher];
}

@end