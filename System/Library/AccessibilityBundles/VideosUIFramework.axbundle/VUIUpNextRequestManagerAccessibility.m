@interface VUIUpNextRequestManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)sendRequestForCanonicalID:(id)a3 action:(unint64_t)a4 confirmationShouldWaitCompletion:(BOOL)a5;
@end

@implementation VUIUpNextRequestManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIUpNextRequestManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)sendRequestForCanonicalID:(id)a3 action:(unint64_t)a4 confirmationShouldWaitCompletion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = *MEMORY[0x263F1CE68];
  id v9 = a3;
  MEMORY[0x245669840](v8);
  v10.receiver = self;
  v10.super_class = (Class)VUIUpNextRequestManagerAccessibility;
  [(VUIUpNextRequestManagerAccessibility *)&v10 sendRequestForCanonicalID:v9 action:a4 confirmationShouldWaitCompletion:v5];
}

@end