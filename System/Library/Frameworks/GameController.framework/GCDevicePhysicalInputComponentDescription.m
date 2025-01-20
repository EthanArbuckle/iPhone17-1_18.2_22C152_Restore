@interface GCDevicePhysicalInputComponentDescription
@end

@implementation GCDevicePhysicalInputComponentDescription

void __60___GCDevicePhysicalInputComponentDescription_initWithCoder___block_invoke()
{
  id v6 = +[NSMutableSet set];
  [v6 addObject:objc_opt_class()];
  v0 = _GCHIDEventSourceDescription_Classes();
  [v6 unionSet:v0];

  v1 = _GCGamepadEventSourceDescription_Classes();
  [v6 unionSet:v1];

  v2 = _GCKeyboardEventSourceDescription_Classes();
  [v6 unionSet:v2];

  v3 = _GCMotionEventSourceDescription_Classes();
  [v6 unionSet:v3];

  [v6 addObject:objc_opt_class()];
  uint64_t v4 = [v6 copy];
  v5 = (void *)initWithCoder__BindingClasses_1;
  initWithCoder__BindingClasses_1 = v4;
}

@end