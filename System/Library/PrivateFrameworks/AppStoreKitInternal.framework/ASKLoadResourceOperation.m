@interface ASKLoadResourceOperation
+ (id)supportedScheme;
- (ASKLoadResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4;
- (id)outputBlock;
- (int64_t)_loadReason;
- (void)_setLoadReason:(int64_t)a3;
- (void)didCompleteWithResource:(id)a3 error:(id)a4;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation ASKLoadResourceOperation

- (ASKLoadResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASKLoadResourceOperation;
  return [(ASKLoadResourceOperation *)&v5 init];
}

- (void)didCompleteWithResource:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(ASKLoadResourceOperation *)self outputBlock];
  if (v7)
  {
    [(ASKLoadResourceOperation *)self setOutputBlock:0];
    ((void (**)(void, id, id))v7)[2](v7, v8, v6);
  }
}

+ (id)supportedScheme
{
  return 0;
}

- (void)main
{
}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setOutputBlock:(id)a3
{
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
}

@end