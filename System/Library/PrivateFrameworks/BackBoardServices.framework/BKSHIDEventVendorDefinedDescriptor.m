@interface BKSHIDEventVendorDefinedDescriptor
+ (id)descriptorWithPage:(unsigned int)a3 usage:(unsigned int)a4;
- (BKSHIDEventVendorDefinedDescriptor)init;
@end

@implementation BKSHIDEventVendorDefinedDescriptor

+ (id)descriptorWithPage:(unsigned int)a3 usage:(unsigned int)a4
{
  v4 = (void *)[objc_alloc((Class)a1) _initWithPage:*(void *)&a3 usage:*(void *)&a4 eventType:1];
  return v4;
}

- (BKSHIDEventVendorDefinedDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventVendorDefinedDescriptor;
  return (BKSHIDEventVendorDefinedDescriptor *)[(BKSHIDEventDescriptor *)&v3 _initWithEventType:1];
}

@end