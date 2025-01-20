@interface PXFocusTimelineEventAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityFocusEventTimeString;
- (id)accessibilityFocusEventTypeString;
@end

@implementation PXFocusTimelineEventAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXFocusTimelineEvent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFocusTimelineEvent", @"time", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFocusTimelineEvent", @"type", "Q", 0);
}

- (id)accessibilityFocusEventTimeString
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3810000000;
  v7 = "";
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  AXPerformSafeBlock();
  CMTime time = *(CMTime *)(v5 + 4);
  _Block_object_dispose(&v4, 8);
  CMTimeGetSeconds(&time);
  v2 = UIAXTimeStringForDuration();

  return v2;
}

double __70__PXFocusTimelineEventAccessibility_accessibilityFocusEventTimeString__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) time];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

- (id)accessibilityFocusEventTypeString
{
  uint64_t v2 = [(PXFocusTimelineEventAccessibility *)self safeUnsignedIntegerForKey:@"type"];
  if (v2 == 1)
  {
    id v3 = @"manual.focus.event";
    goto LABEL_5;
  }
  if (!v2)
  {
    id v3 = @"auto.focus.event";
LABEL_5:
    long long v4 = accessibilityPhotosUICoreLocalizedString(v3);
    goto LABEL_7;
  }
  long long v4 = 0;
LABEL_7:

  return v4;
}

@end