@interface BKSHIDEventKeyboardDescriptor
+ (id)descriptorWithPage:(unsigned int)a3 usage:(unsigned int)a4;
- (BKSHIDEventKeyboardDescriptor)init;
@end

@implementation BKSHIDEventKeyboardDescriptor

- (BKSHIDEventKeyboardDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventKeyboardDescriptor;
  return (BKSHIDEventKeyboardDescriptor *)[(BKSHIDEventDescriptor *)&v3 _initWithEventType:3];
}

+ (id)descriptorWithPage:(unsigned int)a3 usage:(unsigned int)a4
{
  v4 = (void *)[objc_alloc((Class)a1) _initWithPage:*(void *)&a3 usage:*(void *)&a4 eventType:3];
  return v4;
}

@end