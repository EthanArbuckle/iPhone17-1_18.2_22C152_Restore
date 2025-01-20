@interface PKPaymentAuthorizationFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
@end

@implementation PKPaymentAuthorizationFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentAuthorizationFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationFooterViewAccessibility;
  [(PKPaymentAuthorizationFooterViewAccessibility *)&v11 setState:a3 string:a4 animated:a5 withCompletion:a6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__PKPaymentAuthorizationFooterViewAccessibility_setState_string_animated_withCompletion___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a3;
  uint64_t v8 = MEMORY[0x24565A620](v10);
  v9 = (void *)v8;
  if (v6) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

void __89__PKPaymentAuthorizationFooterViewAccessibility_setState_string_animated_withCompletion___block_invoke(uint64_t a1)
{
  v4[2] = *MEMORY[0x263EF8340];
  v3[1] = @"PKPaymentProgressState";
  v4[0] = @"ViewDidAppear";
  v3[0] = @"event";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v4[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  UIAccessibilityPostNotification(0xFA2u, v2);
}

@end