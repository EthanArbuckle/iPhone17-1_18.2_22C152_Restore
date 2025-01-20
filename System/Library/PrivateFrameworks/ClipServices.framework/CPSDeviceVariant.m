@interface CPSDeviceVariant
- (NSNumber)size;
- (NSString)device;
- (NSString)osVersion;
- (void)setDevice:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation CPSDeviceVariant

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_osVersion, 0);
}

@end