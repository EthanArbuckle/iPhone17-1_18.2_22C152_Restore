@interface GCControllerInputComponentDescription
@end

@implementation GCControllerInputComponentDescription

void __56___GCControllerInputComponentDescription_initWithCoder___block_invoke()
{
  id v3 = +[NSMutableSet set];
  v0 = _GCGamepadEventSourceDescription_Classes();
  [v3 unionSet:v0];

  [v3 addObject:objc_opt_class()];
  uint64_t v1 = [v3 copy];
  v2 = (void *)initWithCoder__BindingClasses_0;
  initWithCoder__BindingClasses_0 = v1;
}

id __60___GCControllerInputComponentDescription_createWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 makeParameters];

  return v2;
}

@end