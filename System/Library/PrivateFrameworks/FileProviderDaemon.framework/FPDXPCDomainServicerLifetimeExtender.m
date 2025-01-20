@interface FPDXPCDomainServicerLifetimeExtender
- (NSString)prettyDescription;
- (id)stopBlock;
- (int)requestEffectivePID;
- (void)setPrettyDescription:(id)a3;
- (void)setRequestEffectivePID:(int)a3;
- (void)setStopBlock:(id)a3;
- (void)stopExtendingLifetime;
@end

@implementation FPDXPCDomainServicerLifetimeExtender

- (int)requestEffectivePID
{
  return self->_requestEffectivePID;
}

- (void)setRequestEffectivePID:(int)a3
{
  self->_requestEffectivePID = a3;
}

- (void)setPrettyDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong((id *)&self->_prettyDescription, 0);
}

- (void)stopExtendingLifetime
{
  obj = self;
  objc_sync_enter(obj);
  stopBlock = (void (**)(id, FPDXPCDomainServicerLifetimeExtender *))obj->_stopBlock;
  if (stopBlock)
  {
    stopBlock[2](stopBlock, obj);
    id v3 = obj->_stopBlock;
    obj->_stopBlock = 0;
  }
  objc_sync_exit(obj);
}

- (NSString)prettyDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)stopBlock
{
  return self->_stopBlock;
}

- (void)setStopBlock:(id)a3
{
}

@end