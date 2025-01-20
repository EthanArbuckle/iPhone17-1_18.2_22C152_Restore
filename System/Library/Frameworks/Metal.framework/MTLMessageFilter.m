@interface MTLMessageFilter
+ (id)filter:(unint64_t)a3 device:(id)a4;
- (MTLDevice)device;
- (id)init:(unint64_t)a3 device:(id)a4;
- (unint64_t)messageType;
- (void)setDevice:(id)a3;
@end

@implementation MTLMessageFilter

- (id)init:(unint64_t)a3 device:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLMessageFilter;
  id result = [(MTLMessageFilter *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = a4;
    *((void *)result + 2) = a3;
  }
  return result;
}

+ (id)filter:(unint64_t)a3 device:(id)a4
{
  id v4 = [[MTLMessageFilter alloc] init:a3 device:a4];

  return v4;
}

- (void)setDevice:(id)a3
{
  self->_device = (MTLDevice *)a3;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

@end