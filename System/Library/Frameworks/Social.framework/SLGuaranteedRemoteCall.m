@interface SLGuaranteedRemoteCall
- (id)block;
- (id)proxy;
- (void)setBlock:(id)a3;
- (void)setProxy:(id)a3;
@end

@implementation SLGuaranteedRemoteCall

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setBlock:(id)a3
{
}

- (id)proxy
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxy, 0);

  objc_storeStrong(&self->_block, 0);
}

@end