@interface AMSDeviceUpdateHandlerInfo
- (AMSDeviceMessengerFilter)filter;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation AMSDeviceUpdateHandlerInfo

- (AMSDeviceMessengerFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end