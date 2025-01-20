@interface GCGamepadEventSourceDescription
@end

@implementation GCGamepadEventSourceDescription

void ___GCGamepadEventSourceDescription_Classes_block_invoke()
{
  id v0 = objc_alloc((Class)&off_26D2B4E80);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)_GCGamepadEventSourceDescription_Classes_Classes;
  _GCGamepadEventSourceDescription_Classes_Classes = v3;
}

@end