@interface AKSegmentedCtrlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4;
@end

@implementation AKSegmentedCtrlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKSegmentedCtrl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSegmentedCtrl", @"setTag: forSegment:", "v", "q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSegmentedCtrl", @"segmentAtIndex:", "@", "Q", 0);
}

- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)AKSegmentedCtrlAccessibility;
  -[AKSegmentedCtrlAccessibility setTag:forSegment:](&v14, sel_setTag_forSegment_);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  AXPerformSafeBlock();
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  if ((unint64_t)a3 < 4)
  {
    uint64_t v6 = accessibilityLocalizedString(off_265104058[a3]);
    if (v6)
    {
      v7 = (void *)v6;
      [v5 setAccessibilityLabel:v6];
    }
  }
}

uint64_t __50__AKSegmentedCtrlAccessibility_setTag_forSegment___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) segmentAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

@end