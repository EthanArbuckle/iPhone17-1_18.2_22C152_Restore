@interface CHTextInputGestureAccessibility
+ (BOOL)isEditGestureForDrawing:(id)a3 targetContentInfo:(id)a4 tentativeResultType:(int64_t)a5;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation CHTextInputGestureAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHTextInputGesture";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (BOOL)isEditGestureForDrawing:(id)a3 targetContentInfo:(id)a4 tentativeResultType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___CHTextInputGestureAccessibility;
    unsigned __int8 v10 = objc_msgSendSuper2(&v12, sel_isEditGestureForDrawing_targetContentInfo_tentativeResultType_, v8, v9, a5);
  }

  return v10;
}

@end