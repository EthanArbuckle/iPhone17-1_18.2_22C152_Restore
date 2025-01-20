@interface HFActionBuilder
+ (Class)homeKitRepresentationClass;
+ (id)actionBuilderForAction:(id)a3 inHome:(id)a4;
- (BOOL)canUpdateWithActionBuilder:(id)a3;
- (BOOL)hasSameTargetAsAction:(id)a3;
- (BOOL)hasSameTargetAsActionBuilder:(id)a3;
- (BOOL)isAffectedByEndEvents;
- (BOOL)isEquivalentToAction:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (BOOL)updateWithActionBuilder:(id)a3;
- (NSArray)containedAccessoryRepresentables;
- (NSString)debugDescription;
- (id)asGeneric;
- (id)compareToObject:(id)a3;
- (id)copyForCreatingNewAction;
- (id)createNewAction;
- (id)getOrCreateAction;
- (id)performValidation;
- (id)validationError;
- (unint64_t)hash;
@end

@implementation HFActionBuilder

- (id)asGeneric
{
  sub_20BA97E4C();
  id v2 = HFActionBuilder.asGeneric()();
  return v2;
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

+ (id)actionBuilderForAction:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = HFCharacteristicWriteActionBuilder;
LABEL_11:
    v8 = (void *)[[v7 alloc] initWithExistingObject:v5 inHome:v6];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = HFMediaPlaybackActionBuilder;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = HFShortcutActionBuilder;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = HFNaturalLightingActionBuilder;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = HFMatterCommandActionBuilder;
    goto LABEL_11;
  }
  uint64_t v10 = objc_opt_class();
  NSLog(&cfstr_UnknownActionT.isa, v10);
  v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  return 0;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  return 0;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (id)copyForCreatingNewAction
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 94, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder copyForCreatingNewAction]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)getOrCreateAction
{
  v3 = [(HFActionBuilder *)self action];
  if (!v3)
  {
    v3 = [(HFActionBuilder *)self createNewAction];
  }
  return v3;
}

- (id)createNewAction
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 111, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder createNewAction]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)isAffectedByEndEvents
{
  id v2 = (void *)MEMORY[0x263F0E310];
  v3 = [(HFActionBuilder *)self createNewAction];
  LOBYTE(v2) = [v2 isActionAffectedByEndEvents:v3];

  return (char)v2;
}

- (BOOL)isEquivalentToAction:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 122, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder isEquivalentToAction:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 128, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder hasSameTargetAsAction:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)hasSameTargetAsActionBuilder:(id)a3
{
  id v4 = a3;
  id v5 = __48__HFActionBuilder_hasSameTargetAsActionBuilder___block_invoke(self);
  id v6 = __48__HFActionBuilder_hasSameTargetAsActionBuilder___block_invoke(v4);

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

id __48__HFActionBuilder_hasSameTargetAsActionBuilder___block_invoke(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  objc_opt_class();
  id v5 = v2;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v4)
  {
    v8 = [v4 lightProfile];
    uint64_t v9 = [v8 services];
LABEL_11:
    v11 = (void *)v9;

    goto LABEL_12;
  }
  if (v7)
  {
    uint64_t v10 = [v7 characteristic];
    v8 = [v10 service];

    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "na_arrayWithSafeObject:", v8);
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)performValidation
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 162, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder performValidation]", objc_opt_class() object file lineNumber description];

  id v5 = (void *)MEMORY[0x263F58190];
  return (id)[v5 futureWithNoResult];
}

- (id)validationError
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 168, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder validationError]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSArray)containedAccessoryRepresentables
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFActionBuilder.m", 174, @"%s is an abstract method that must be overriden by subclass %@", "-[HFActionBuilder containedAccessoryRepresentables]", objc_opt_class() object file lineNumber description];

  if (_MergedGlobals_6_1 != -1) {
    dispatch_once(&_MergedGlobals_6_1, &__block_literal_global_30_2);
  }
  id v5 = (void *)qword_2676B6A18;
  return (NSArray *)v5;
}

uint64_t __51__HFActionBuilder_containedAccessoryRepresentables__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFF8C0] array];
  uint64_t v1 = qword_2676B6A18;
  qword_2676B6A18 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HFActionBuilder *)self description];
  id v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  id v5 = [[HFComparisonResult alloc] initWithObjectA:self objectB:v4];

  if (!v4)
  {
    id v6 = +[HFDifference difference:@"comparedToNil" priority:4];
    [(HFComparisonResult *)v5 add:v6];
  }
  return v5;
}

- (unint64_t)hash
{
  id v2 = objc_opt_class();
  return [v2 hash];
}

@end