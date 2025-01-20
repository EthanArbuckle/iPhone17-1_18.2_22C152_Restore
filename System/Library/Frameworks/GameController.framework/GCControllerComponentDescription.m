@interface GCControllerComponentDescription
@end

@implementation GCControllerComponentDescription

void __51___GCControllerComponentDescription_initWithCoder___block_invoke()
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
  v5 = (void *)initWithCoder__BindingClasses;
  initWithCoder__BindingClasses = v4;
}

void ___GCControllerComponentDescription_Classes_block_invoke()
{
  id v12 = objc_alloc((Class)&off_26D2B4E80);
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v12, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = (void *)_GCControllerComponentDescription_Classes_Classes;
  _GCControllerComponentDescription_Classes_Classes = v10;
}

@end