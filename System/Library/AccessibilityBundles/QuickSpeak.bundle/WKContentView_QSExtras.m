@interface WKContentView_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldShowSpeakBubble;
- (BOOL)_accessibilityShouldShowSpeakLanguageBubble;
- (BOOL)_accessibilityShouldShowSpeakSpellOut;
- (BOOL)_accessibilityShouldUpdateQuickSpeakContent;
- (BOOL)_accessibilitySystemShouldShowSpeakBubble;
- (id)_accessibilityQuickSpeakContent;
- (id)_accessibilityRetrieveRectsForGuanularity:(int64_t)a3 atSelectionOffset:(int64_t)a4 wordText:(id)a5;
- (id)_webTextRectsFromWKTextRects:(id)a3;
- (id)accessibilityQSSentenceRects;
- (id)accessibilityQSWordRects;
- (unint64_t)_axSelectedTextLength;
- (void)_accessibilityDidGetSelectionRects:(id)a3 withGranularity:(int64_t)a4 atOffset:(int64_t)a5;
- (void)_accessibilityQuickSpeakContent;
- (void)_axWaitForSpeakSelectionContentResults;
- (void)_axWaitForSpeakSelectionRectResultsForGuanularity:(int64_t)a3 atSelectionOffset:(int64_t)a4 wordText:(id)a5;
- (void)_selectionChanged;
- (void)accessibilitySetQSSentenceRects:(id)a3;
- (void)accessibilitySetQSWordRects:(id)a3;
- (void)accessibilitySpeakSelectionSetContent:(id)a3;
@end

@implementation WKContentView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"WKContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"selectedText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"accessibilityRetrieveSpeakSelectionContent", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebSelectionRect", @"rect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_accessibilityRetrieveRectsEnclosingSelectionOffset:withGranularity:", "v", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_accessibilityRetrieveRectsAtSelectionOffset:withText:", "v", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_selectionChanged", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_accessibilityStoreSelection", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_accessibilityClearSelection", "v", 0);
  [v3 validateClass:@"WKTextRange"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"selectedTextRange", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKTextRange", @"selectedTextLength", "Q", 0);
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubble
{
  if (![(WKContentView_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon])return 0; {
  id v3 = +[AXQuickSpeak sharedInstance];
  }
  BOOL v4 = ([v3 isPaused] & 1) != 0
    || [(WKContentView_QSExtras *)self _accessibilityShouldShowSpeakBubble];

  return v4;
}

- (void)_selectionChanged
{
  v7.receiver = self;
  v7.super_class = (Class)WKContentView_QSExtras;
  [(WKContentView_QSExtras *)&v7 _selectionChanged];
  id v3 = [(WKContentView_QSExtras *)self _accessibilityValueForKey:@"AXSelectionRange"];
  objc_opt_class();
  BOOL v4 = [(WKContentView_QSExtras *)self safeValueForKey:@"selectedTextRange"];
  v5 = __UIAccessibilityCastAsClass();

  char v6 = [v3 isEqual:v5];
  if (!v5)
  {
    [(WKContentView_QSExtras *)self _accessibilityRemoveValueForKey:@"AXSelectionRange"];
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [(WKContentView_QSExtras *)self _accessibilitySetValue:v5 forKey:@"AXSelectionRange" storageMode:0];
  if ((v6 & 1) == 0) {
LABEL_3:
  }
    [(WKContentView_QSExtras *)self _accessibilityRemoveValueForKey:@"AXSpeakSelectionString"];
LABEL_4:
}

- (void)_axWaitForSpeakSelectionContentResults
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_240270000, v0, v1, "WKContentView: will wait for speak selection content", v2, v3, v4, v5, v6);
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  uint64_t v3 = [(WKContentView_QSExtras *)self safeValueForKey:@"selectedTextRange"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  LOBYTE(v3) = [v4 isEmpty];
  if (v3) {
    return 0;
  }
  else {
    return [(WKContentView_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon];
  }
}

- (BOOL)_accessibilityShouldShowSpeakSpellOut
{
  uint64_t v3 = [(WKContentView_QSExtras *)self safeValueForKey:@"selectedTextRange"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  LOBYTE(v3) = [v4 isEmpty];
  if (v3) {
    return 0;
  }
  else {
    return [(WKContentView_QSExtras *)self _accessibilitySystemShouldShowSpeakSpellOut];
  }
}

- (BOOL)_accessibilityShouldShowSpeakLanguageBubble
{
  uint64_t v3 = [(WKContentView_QSExtras *)self safeValueForKey:@"selectedTextRange"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  LOBYTE(v3) = [v4 isEmpty];
  if (v3) {
    return 0;
  }
  else {
    return [(WKContentView_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon];
  }
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  uint64_t v2 = [(WKContentView_QSExtras *)self _accessibilityQuickSpeakContent];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (void)accessibilitySpeakSelectionSetContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogSpeakSelection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WKContentView_QSExtras accessibilitySpeakSelectionSetContent:]((uint64_t)v4, v5);
  }

  [(WKContentView_QSExtras *)self _accessibilitySetRetainedValue:v4 forKey:@"AXSpeakSelectionString"];
  id v6 = (id)[(WKContentView_QSExtras *)self safeValueForKey:@"_accessibilityCacheContentIfNecessary"];
  [(WKContentView_QSExtras *)self _accessibilitySetBoolValue:0 forKey:@"AXRetrievingContent"];
}

- (id)_accessibilityQuickSpeakContent
{
  if ([(WKContentView_QSExtras *)self _accessibilityBoolValueForKey:@"AXIsCachingContent"])
  {
    BOOL v3 = 0;
  }
  else
  {
    [(WKContentView_QSExtras *)self _accessibilitySetBoolValue:1 forKey:@"AXIsCachingContent"];
    [(WKContentView_QSExtras *)self _axWaitForSpeakSelectionContentResults];
    [(WKContentView_QSExtras *)self _accessibilitySetBoolValue:0 forKey:@"AXIsCachingContent"];
    BOOL v3 = [(WKContentView_QSExtras *)self _accessibilityValueForKey:@"AXSpeakSelectionString"];
    id v4 = AXLogSpeakSelection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(WKContentView_QSExtras *)(uint64_t)v3 _accessibilityQuickSpeakContent];
    }
  }

  return v3;
}

- (id)accessibilityQSSentenceRects
{
  return objc_getAssociatedObject(self, &__WKContentView_QSExtras__accessibilityQSSentenceRects);
}

- (void)accessibilitySetQSSentenceRects:(id)a3
{
}

- (id)accessibilityQSWordRects
{
  return objc_getAssociatedObject(self, &__WKContentView_QSExtras__accessibilityQSWordRects);
}

- (void)accessibilitySetQSWordRects:(id)a3
{
}

- (id)_webTextRectsFromWKTextRects:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "safeValueForKey:", @"rect", (void)v12);
        [v4 axSafelyAddObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_accessibilityRetrieveRectsForGuanularity:(int64_t)a3 atSelectionOffset:(int64_t)a4 wordText:(id)a5
{
  [(WKContentView_QSExtras *)self _axWaitForSpeakSelectionRectResultsForGuanularity:a3 atSelectionOffset:a4 wordText:a5];
  if (a3 == 1)
  {
    uint64_t v7 = [(WKContentView_QSExtras *)self accessibilityQSWordRects];
  }
  else if (a3 == 2)
  {
    uint64_t v7 = [(WKContentView_QSExtras *)self accessibilityQSSentenceRects];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_axWaitForSpeakSelectionRectResultsForGuanularity:(int64_t)a3 atSelectionOffset:(int64_t)a4 wordText:(id)a5
{
  id v6 = a5;
  [(WKContentView_QSExtras *)self _accessibilitySetBoolValue:1 forKey:@"AXRetrievingRects"];
  id v7 = v6;
  AXPerformSafeBlock();
  double Current = CFAbsoluteTimeGetCurrent();
  for (CFStringRef i = (const __CFString *)*MEMORY[0x263EFFE88];
        [(WKContentView_QSExtras *)self _accessibilityBoolValueForKey:@"AXRetrievingRects"];
        CFRunLoopRunInMode(i, 0.025, 1u))
  {
    double v10 = CFAbsoluteTimeGetCurrent();
    double v11 = _AXSInUnitTestMode() ? 1.0 : 0.2;
    if (v10 - Current >= v11) {
      break;
    }
  }
}

- (void)_accessibilityDidGetSelectionRects:(id)a3 withGranularity:(int64_t)a4 atOffset:(int64_t)a5
{
  id v7 = a3;
  [(WKContentView_QSExtras *)self _accessibilitySetBoolValue:0 forKey:@"AXRetrievingRects"];
  id v8 = [(WKContentView_QSExtras *)self _webTextRectsFromWKTextRects:v7];

  if (a4 == 1)
  {
    [(WKContentView_QSExtras *)self accessibilitySetQSWordRects:v8];
  }
  else if (a4 == 2)
  {
    [(WKContentView_QSExtras *)self accessibilitySetQSSentenceRects:v8];
  }
}

- (unint64_t)_axSelectedTextLength
{
  uint64_t v2 = [(WKContentView_QSExtras *)self safeValueForKey:@"selectedTextRange"];
  unint64_t v3 = [v2 safeUnsignedIntegerForKey:@"selectedTextLength"];

  return v3;
}

- (void)accessibilitySpeakSelectionSetContent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_240270000, a2, OS_LOG_TYPE_DEBUG, "WebKit content setting AXSpeakSelectionString '%{private}@'", (uint8_t *)&v2, 0xCu);
}

- (void)_accessibilityQuickSpeakContent
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_240270000, a2, OS_LOG_TYPE_DEBUG, "WebKit content requesting AXSpeakSelectionString: '%{private}@'", (uint8_t *)&v2, 0xCu);
}

@end