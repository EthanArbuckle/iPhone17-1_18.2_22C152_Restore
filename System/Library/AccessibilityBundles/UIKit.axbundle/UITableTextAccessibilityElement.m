@interface UITableTextAccessibilityElement
- (BOOL)_accessibilityElementServesAsHeadingLandmark;
- (BOOL)_accessibilityImplementsDefaultRowRange;
- (BOOL)_accessibilityIsAwayAlertElement;
- (BOOL)_accessibilityIsInTableCell;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityUseElementAtPositionAfterActivation;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)canBecomeFocused;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (_NSRange)_accessibilityIndexPathAsRange;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)accessibilityRowRange;
- (double)_accessibilityDelayBeforeUpdatingOnActivation;
- (id)_accessibilityAllDragSourceDescriptors;
- (id)_accessibilityAllDropPointDescriptors;
- (id)_accessibilityCapturedImages;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilityEquivalenceTag;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_accessibilityUserTestingVisibleAncestor;
- (id)_tableViewCellAttributeDelegate;
- (id)_tableViewCellTextDelegate;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)attributeDelegate;
- (id)description;
- (id)setAttributeDelegate:(id *)result;
- (id)setTextDelegate:(id *)result;
- (id)textDelegate;
- (int64_t)_accessibilityScannerActivateBehavior;
- (unint64_t)_accessibilityScanningBehaviorTraits;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityGetBlockForAttribute:(int64_t)a3;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
@end

@implementation UITableTextAccessibilityElement

- (id)_tableViewCellTextDelegate
{
  if (a1)
  {
    id v3 = -[UITableTextAccessibilityElement textDelegate](a1);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v2 = -[UITableTextAccessibilityElement textDelegate](a1);
      id v6 = (id)[v2 safeValueForKey:@"tableViewCell"];
    }
    else
    {
      id v6 = -[UITableTextAccessibilityElement textDelegate](a1);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)textDelegate
{
  if (a1) {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (BOOL)_accessibilityElementServesAsHeadingLandmark
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v4 = [v3 _accessibilityElementServesAsHeadingLandmark];

  return v4 & 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  [v2 accessibilityElementDidBecomeFocused];
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  id v4 = (id)[v3 _accessibilityCustomActionGroupIdentifier];

  return v4;
}

- (id)_accessibilityScrollStatus
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  id v4 = (id)[v3 _accessibilityScrollStatus];

  return v4;
}

- (void)accessibilityElementDidLoseFocus
{
  id v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  [v2 accessibilityElementDidLoseFocus];
}

- (id)_tableViewCellAttributeDelegate
{
  if (a1)
  {
    id v3 = -[UITableTextAccessibilityElement attributeDelegate](a1);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v2 = -[UITableTextAccessibilityElement attributeDelegate](a1);
      id v6 = (id)[v2 tableViewCell];
    }
    else
    {
      id v6 = -[UITableTextAccessibilityElement attributeDelegate](a1);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)attributeDelegate
{
  if (a1) {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (!v4[0])
  {
    v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)v5);
  }
  id v3 = (id)[v4[0] _accessibilityTextViewTextOperationResponder];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)accessibilityLabel
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    id v7 = (id)[location[0] tableTextAccessibleLabel:v6];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v7 = [(UITableTextAccessibilityElement *)&v4 accessibilityLabel];
  }
  objc_storeStrong(location, 0);
  id v2 = v7;

  return v2;
}

- (BOOL)_accessibilityUseElementAtPositionAfterActivation
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0]) {
    char v4 = [location[0] _accessibilityUseElementAtPositionAfterActivation] & 1;
  }
  else {
    char v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)accessibilityValue
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    id v8 = (id)[location[0] accessibilityValue];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v8 = [(UITableTextAccessibilityElement *)&v4 accessibilityValue];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (id)accessibilityHint
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    id v8 = (id)[location[0] accessibilityHint];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v8 = [(UITableTextAccessibilityElement *)&v4 accessibilityHint];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (id)accessibilityIdentifier
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    id v8 = (id)[location[0] accessibilityIdentifier];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v8 = [(UITableTextAccessibilityElement *)&v4 accessibilityIdentifier];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (CGRect)accessibilityFrame
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    if (objc_opt_respondsToSelector())
    {
      [location[0] tableTextAccessibleFrame:v18];
    }
    else
    {
      v14.receiver = v18;
      v14.super_class = (Class)UITableTextAccessibilityElement;
      [(UITableTextAccessibilityElement *)&v14 accessibilityFrame];
    }
    double v19 = v6;
    double v20 = v7;
    double v21 = v8;
    double v22 = v9;
    int v15 = 1;
  }
  else
  {
    v16.receiver = v18;
    v16.super_class = (Class)UITableTextAccessibilityElement;
    [(UITableTextAccessibilityElement *)&v16 accessibilityFrame];
    double v19 = v2;
    double v20 = v3;
    double v21 = v4;
    double v22 = v5;
    int v15 = 1;
  }
  objc_storeStrong(location, 0);
  double v10 = v19;
  double v11 = v20;
  double v12 = v21;
  double v13 = v22;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)accessibilityLocalizedStringKey
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    id v7 = (id)[location[0] tableTextAccessibleStringKey:v6];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v7 = [(UITableTextAccessibilityElement *)&v4 accessibilityLocalizedStringKey];
  }
  objc_storeStrong(location, 0);
  double v2 = v7;

  return v2;
}

- (id)accessibilityLocalizationBundleID
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    id v7 = (id)[location[0] tableTextAccessibleLocalizationBundleID:v6];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v7 = [(UITableTextAccessibilityElement *)&v4 accessibilityLocalizationBundleID];
  }
  objc_storeStrong(location, 0);
  double v2 = v7;

  return v2;
}

- (id)accessibilityLocalizationBundlePath
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    id v7 = (id)[location[0] tableTextAccessibleLocalizationBundlePath:v6];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v7 = [(UITableTextAccessibilityElement *)&v4 accessibilityLocalizationBundlePath];
  }
  objc_storeStrong(location, 0);
  double v2 = v7;

  return v2;
}

- (id)accessibilityLocalizedStringTableName
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    id v7 = (id)[location[0] tableTextAccessibleLocalizedTableName:v6];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v7 = [(UITableTextAccessibilityElement *)&v4 accessibilityLocalizedStringTableName];
  }
  objc_storeStrong(location, 0);
  double v2 = v7;

  return v2;
}

- (id)accessibilityLanguage
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    id v8 = (id)[location[0] accessibilityLanguage];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v8 = [(UITableTextAccessibilityElement *)&v4 accessibilityLanguage];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  double v2 = v8;

  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  double v9 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    [location[0] accessibilityActivationPoint];
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)UITableTextAccessibilityElement;
    [(UITableTextAccessibilityElement *)&v6 accessibilityActivationPoint];
  }
  double v10 = v2;
  double v11 = v3;
  int v7 = 1;
  objc_storeStrong(location, 0);
  double v4 = v10;
  double v5 = v11;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_accessibilityUserTestingVisibleAncestor
{
  return -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
}

- (unint64_t)accessibilityTraits
{
  int v7 = self;
  SEL v6 = a2;
  uint64_t v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UITableTextAccessibilityElement;
  uint64_t v5 = [(UITableTextAccessibilityElement *)&v4 accessibilityTraits];
  id location = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)v7);
  if (location)
  {
    uint64_t v5 = [location accessibilityTraits];
    v5 |= *MEMORY[0x263F1CF48];
    unint64_t v8 = v5;
  }
  else
  {
    [(UITableTextAccessibilityElement *)v7 accessibilityFrame];
    if (CGRectGetHeight(v9) == 0.0) {
      v5 |= *MEMORY[0x263F813E8];
    }
    unint64_t v8 = v5;
  }
  objc_storeStrong(&location, 0);
  return v8;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  unint64_t v2 = [(UITableTextAccessibilityElement *)self accessibilityTraits];
  return (v2 & *MEMORY[0x263F813E8]) != *MEMORY[0x263F813E8];
}

- (_NSRange)accessibilityRowRange
{
  id v5 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  uint64_t v6 = [v5 accessibilityRowRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v4 = [v3 _accessibilityImplementsDefaultRowRange];

  return v4 & 1;
}

- (BOOL)_accessibilityIsInTableCell
{
  return 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  id v5 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  uint64_t v6 = [v5 _accessibilityIndexPathAsRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  id v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v3 = [v4[0] _accessibilityRetainsCustomRotorActionSetting];
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v3 = [v4[0] _accessibilitySupportsActivateAction];
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)accessibilityActivate
{
  id v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v3 = [v4[0] accessibilityActivate];
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  id v4 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  [v4 _accessibilityDelayBeforeUpdatingOnActivation];
  double v5 = v2;

  return v5;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v3, "_accessibilitySetSelectedTextRange:", a3.location, a3.length);
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v4 = [v3 _accessibilityIsAwayAlertElement];

  return v4 & 1;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v5 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  uint64_t v6 = [v5 _accessibilitySelectedTextRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (id)_accessibilityEquivalenceTag
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  id v4 = (id)[v3 _accessibilityEquivalenceTag];

  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  char v4 = [v3 _accessibilityIsSpeakThisElement];

  return v4 & 1;
}

- (void)_accessibilityGetBlockForAttribute:(int64_t)a3
{
  unint64_t v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  if (a3 == 5)
  {
    id v4 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)v8);
    CGRect v9 = (void *)[v4 _accessibilityGetBlockForAttribute:5];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)UITableTextAccessibilityElement;
    return [(UITableTextAccessibilityElement *)&v5 _accessibilityGetBlockForAttribute:v6];
  }
  return v9;
}

- (id)_accessibilitySpeakThisString
{
  int v15 = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  if (!_accessibilitySpeakThisString_BaseNSObjectMethod)
  {
    NSUInteger v2 = (objc_class *)objc_opt_class();
    _accessibilitySpeakThisString_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, (SEL)0x1F7D9BCDELL);
    id v3 = (objc_class *)objc_opt_class();
    _accessibilitySpeakThisString_BaseUIResponderMethod = (uint64_t)class_getInstanceMethod(v3, (SEL)0x1F7D9BCDELL);
  }
  id location = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)v15);
  if (location)
  {
    id v4 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v4, sel__accessibilitySpeakThisString);
    if (InstanceMethod != (Method)_accessibilitySpeakThisString_BaseNSObjectMethod
      && InstanceMethod != (Method)_accessibilitySpeakThisString_BaseUIResponderMethod)
    {
      id v5 = (id)[location _accessibilitySpeakThisString];
      id v6 = v14[0];
      v14[0] = v5;
    }
  }
  if (!v14[0])
  {
    v11.receiver = v15;
    v11.super_class = (Class)UITableTextAccessibilityElement;
    id v7 = [(UITableTextAccessibilityElement *)&v11 _accessibilitySpeakThisString];
    id v8 = v14[0];
    v14[0] = v7;
  }
  id v10 = v14[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);

  return v10;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  id v3 = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  int64_t v4 = [v3 _accessibilityScannerActivateBehavior];

  return v4;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 8;
}

- (id)accessibilityUserInputLabels
{
  objc_super v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  id location = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location)
  {
    id v4 = (id)[location accessibilityUserInputLabels];
    id v5 = v13[0];
    v13[0] = v4;

    if (![v13[0] count])
    {
      id v10 = (id)[location tableTextAccessibleLabel:v14];
      id v6 = (id)MEMORY[0x2455E6530]();
      id v7 = v13[0];
      v13[0] = v6;
    }
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)UITableTextAccessibilityElement;
    id v2 = [(UITableTextAccessibilityElement *)&v11 accessibilityUserInputLabels];
    id v3 = v13[0];
    v13[0] = v2;
  }
  id v9 = v13[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);

  return v9;
}

- (void)accessibilityDecrement
{
  id v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  [v2 accessibilityDecrement];
}

- (void)accessibilityIncrement
{
  id v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  [v2 accessibilityIncrement];
}

- (id)description
{
  id v9 = self;
  SEL v8 = a2;
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)UITableTextAccessibilityElement;
  id v5 = [(UITableTextAccessibilityElement *)&v7 description];
  id v4 = (id)[(UITableTextAccessibilityElement *)v9 accessibilityContainer];
  id v6 = (id)[v3 stringWithFormat:@"%@ < %@", v5, v4];

  return v6;
}

- (id)_accessibilityAllDragSourceDescriptors
{
  id v3 = -[UITableTextAccessibilityElement textDelegate]((uint64_t)self);
  id v4 = (id)[v3 accessibilityDragSourceDescriptors];

  return v4;
}

- (id)_accessibilityAllDropPointDescriptors
{
  id v3 = -[UITableTextAccessibilityElement textDelegate]((uint64_t)self);
  id v4 = (id)[v3 accessibilityDropPointDescriptors];

  return v4;
}

- (id)_accessibilityCapturedImages
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    id v8 = (id)[location[0] _accessibilityCapturedImages];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableTextAccessibilityElement;
    id v8 = [(UITableTextAccessibilityElement *)&v4 _accessibilityCapturedImages];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)setTextDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 8, a2);
  }
  return result;
}

- (id)setAttributeDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 9, a2);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end