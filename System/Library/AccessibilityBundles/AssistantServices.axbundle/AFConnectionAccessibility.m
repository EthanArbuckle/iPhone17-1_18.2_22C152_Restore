@interface AFConnectionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)rollbackRequest;
@end

@implementation AFConnectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFConnection";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)rollbackRequest
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(AFConnectionAccessibility *)self _accessibilityBoolValueForKey:@"VoiceOverCancelRequestInProgress"])
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = AXIsInternalInstall();
      v5 = &stru_26F6297D0;
      if (v4) {
        v5 = @"rdar://80384131";
      }
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_241F34000, v3, OS_LOG_TYPE_DEFAULT, "VoiceOver issued this cancel request - not acting on the rollback %@", buf, 0xCu);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AFConnectionAccessibility;
    [(AFConnectionAccessibility *)&v6 rollbackRequest];
  }
}

@end