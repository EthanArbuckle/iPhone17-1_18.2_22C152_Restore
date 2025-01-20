@interface HFShortcutActionBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)isAffectedByEndEvents;
- (id)commitItem;
- (id)containedAccessoryRepresentables;
- (id)performValidation;
- (id)validationError;
@end

@implementation HFShortcutActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (id)commitItem
{
  return (id)[MEMORY[0x263F58190] futureWithNoResult];
}

- (BOOL)isAffectedByEndEvents
{
  return 0;
}

- (id)containedAccessoryRepresentables
{
  if (qword_2676B6A20 != -1) {
    dispatch_once(&qword_2676B6A20, &__block_literal_global_122_0);
  }
  v2 = (void *)qword_2676B6A28;
  return v2;
}

uint64_t __59__HFShortcutActionBuilder_containedAccessoryRepresentables__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFF8C0] array];
  uint64_t v1 = qword_2676B6A28;
  qword_2676B6A28 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)performValidation
{
  v2 = [(HFShortcutActionBuilder *)self validationError];
  if (v2) {
    [MEMORY[0x263F58190] futureWithError:v2];
  }
  else {
  v3 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v3;
}

- (id)validationError
{
  v9[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  v3 = [(HFActionBuilder *)self action];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }

  v5 = 0;
  if (!v4)
  {
    v8 = @"HFActionBuilderFailureReason";
    v9[0] = @"Shortcut action builder has invalid shortcut action";
    v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F58160] code:2 userInfo:v6];
  }
  return v5;
}

@end