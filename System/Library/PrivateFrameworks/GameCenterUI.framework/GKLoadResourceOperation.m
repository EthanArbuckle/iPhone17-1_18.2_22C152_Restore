@interface GKLoadResourceOperation
- (id)outputBlock;
- (int64_t)_loadReason;
- (void)_setLoadReason:(int64_t)a3;
- (void)didCompleteWithResource:(id)a3 error:(id)a4;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation GKLoadResourceOperation

- (void)didCompleteWithResource:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(GKLoadResourceOperation *)self outputBlock];
  if (v7)
  {
    [(GKLoadResourceOperation *)self setOutputBlock:0];
    ((void (**)(void, id, id))v7)[2](v7, v8, v6);
  }
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