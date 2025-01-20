@interface RecordingHelperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityDidStartListening;
- (void)_accessibilityDidStopListening;
@end

@implementation RecordingHelperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.RecordingHelper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.RecordingHelper", @"_accessibilityDidStartListening", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.RecordingHelper", @"_accessibilityDidStopListening", "v", 0);
}

- (void)_accessibilityDidStartListening
{
  v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_242680000, v2, OS_LOG_TYPE_DEFAULT, "Marking VO to be quiet since we are recording for Translation", v3, 2u);
  }

  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:MEMORY[0x263EFFA88]];
}

- (void)_accessibilityDidStopListening
{
  v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_242680000, v2, OS_LOG_TYPE_DEFAULT, "Finished recording for Translation. Resetting VO quiet state.", v3, 2u);
  }

  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:0];
}

@end