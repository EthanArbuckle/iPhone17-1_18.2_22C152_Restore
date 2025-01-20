@interface CUHomeKitResolvableAccessory
- (HMAccessory)accessory;
- (NSData)irkData;
- (void)setAccessory:(id)a3;
- (void)setIrkData:(id)a3;
@end

@implementation CUHomeKitResolvableAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setIrkData:(id)a3
{
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setAccessory:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

@end