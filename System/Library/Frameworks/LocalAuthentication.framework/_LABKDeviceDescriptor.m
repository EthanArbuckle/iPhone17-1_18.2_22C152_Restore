@interface _LABKDeviceDescriptor
+ (id)deviceDescriptorForType:(int64_t)a3;
- (int64_t)type;
@end

@implementation _LABKDeviceDescriptor

+ (id)deviceDescriptorForType:(int64_t)a3
{
  v4 = objc_alloc_init(_LABKDeviceDescriptor);
  v4->_type = a3;

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

@end