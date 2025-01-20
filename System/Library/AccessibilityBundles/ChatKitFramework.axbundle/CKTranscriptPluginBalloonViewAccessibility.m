@interface CKTranscriptPluginBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsAppClip;
- (BOOL)_axIsAttachedHandwritingPlugin;
- (BOOL)_axIsAttachedPlugin;
- (BOOL)_axIsAttachedRichLinkPlugin;
- (BOOL)_axIsHandwriting;
- (BOOL)_axIsURL;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityMediaAnalysisFrame;
- (id)_axAppClipDescriptionForMetadata:(id)a3;
- (id)_axBalloonViewCustomActions;
- (id)_axHandwritingDescriptionForDataSource:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_axAppClipOpenInSafari;
- (void)_axClear;
@end

@implementation CKTranscriptPluginBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptPluginBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKTranscriptPluginBalloonView" isKindOfClass:@"CKBalloonView"];
  [v3 validateClass:@"CKTranscriptPluginBalloonView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"LPCollaborationFooterView"];
  if (NSClassFromString(&cfstr_Richlinkplugin.isa)) {
    [v3 validateClass:@"RichLinkPluginDataSource"];
  }
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMTranscriptPluginChatItem", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptPluginBalloonView", @"pluginView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkMetadata", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkMetadata", @"associatedApplication", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPAssociatedApplicationMetadata", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPAssociatedApplicationMetadata", @"caption", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPAssociatedApplicationMetadata", @"clipAction", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkView", @"_captionTapRecognized:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkView", @"_mediaTapRecognized:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
  v4 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_1035];
  if (NSClassFromString(&cfstr_Richlinkview.isa) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_1040];
    BOOL v6 = v5 == 0;

    goto LABEL_16;
  }
  if (!NSClassFromString(&cfstr_Msmessageexten_1.isa))
  {
    if (!NSClassFromString(&cfstr_Msmessageexten_0.isa)) {
      goto LABEL_11;
    }
    char isKindOfClass = 0;
LABEL_9:
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  if (NSClassFromString(&cfstr_Msmessageexten_0.isa)) {
    goto LABEL_9;
  }
LABEL_10:
  if ((isKindOfClass & 1) == 0)
  {
LABEL_11:
    if (v4)
    {
      BOOL v6 = 0;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v6 = 1;
    goto LABEL_16;
  }
LABEL_13:
  BOOL v8 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAttachedPlugin];
  BOOL v6 = 0;
  if (v8 && !v4) {
    goto LABEL_15;
  }
LABEL_16:

  return v6;
}

uint64_t __68__CKTranscriptPluginBalloonViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Lpcollaboratio.isa);
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  return (v2 != 0) & isKindOfClass;
}

uint64_t __68__CKTranscriptPluginBalloonViewAccessibility_isAccessibilityElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Lpcaptionbarbu.isa);
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  return (v2 != 0) & isKindOfClass;
}

- (id)accessibilityValue
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  id v3 = [(CKTranscriptPluginBalloonViewAccessibility *)&v8 accessibilityValue];
  if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL]
    || [(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAttachedPlugin])
  {
    v4 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    v7 = [v4 accessibilityValue];
    uint64_t v5 = __UIAXStringForVariables();

    id v3 = (void *)v5;
  }

  return v3;
}

- (id)accessibilityLabel
{
  if (![(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAttachedPlugin])
  {
    if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsHandwriting])
    {
      v7 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axChatItemForBalloon];
      objc_super v8 = __UIAccessibilitySafeClass();

      v9 = [v8 safeValueForKeyPath:@"IMChatItem.dataSource"];
      uint64_t v10 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axHandwritingDescriptionForDataSource:v9];
LABEL_9:
      BOOL v6 = (void *)v10;

LABEL_21:
LABEL_22:
      objc_opt_class();
      v4 = __UIAccessibilityCastAsSafeCategory();
      v19 = [v4 _axMessageSender];
      v20 = [v4 _axHighlightedDescription];
      v21 = [v4 _axReplyDescription];
      v22 = [v4 _axStickerDescription];
      v23 = [v4 _axAcknowledgmentDescription];
      v27 = [v4 _axMessageTime];
      v24 = __UIAXStringForVariables();

      goto LABEL_30;
    }
    if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAppClip])
    {
      objc_super v8 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKeyPath:@"pluginView._metadata"];
      uint64_t v18 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axAppClipDescriptionForMetadata:v8];
    }
    else
    {
      if (![(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL])
      {
        if (![(CKTranscriptPluginBalloonViewAccessibility *)self _axIsDigitalTouch])
        {
          BOOL v6 = 0;
          goto LABEL_22;
        }
        objc_super v8 = accessibilityLocalizedString(@"digital.touch.label");
        v9 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axDigitalTouchDescription];
        uint64_t v10 = __UIAXStringForVariables();
        goto LABEL_9;
      }
      objc_super v8 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
      uint64_t v18 = [v8 accessibilityLabel];
    }
    BOOL v6 = (void *)v18;
    goto LABEL_21;
  }
  if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAttachedRichLinkPlugin]) {
    id v3 = @"attached.plugin.rich.link.label";
  }
  else {
    id v3 = @"attached.plugin.label";
  }
  v4 = accessibilityLocalizedString(v3);
  if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAttachedHandwritingPlugin])
  {
    uint64_t v5 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"dataSource"];
    BOOL v6 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axHandwritingDescriptionForDataSource:v5];
  }
  else
  {
    v11 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    BOOL v6 = [v11 accessibilityLabel];
    Class v12 = NSClassFromString(&cfstr_Msmessageexten_1.isa);
    if (![v6 length])
    {
      if (v12)
      {
        if (objc_opt_isKindOfClass())
        {
          Class v13 = NSClassFromString(&cfstr_Msmessageexten_2.isa);
          if (objc_opt_respondsToSelector())
          {
            objc_opt_class();
            v14 = [v11 safeValueForKey:@"payload"];
            v15 = [(objc_class *)v13 messagePayloadFromPluginPayload:v14];
            v16 = __UIAccessibilityCastAsClass();

            v17 = [v16 accessibilityLabel];
            if (v17) {
              [v16 accessibilityLabel];
            }
            else {
            uint64_t v25 = [v16 summaryText];
            }

            BOOL v6 = (void *)v25;
          }
        }
      }
    }
  }
  v24 = __AXStringForVariables();
LABEL_30:

  return v24;
}

- (id)accessibilityHint
{
  if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL])
  {
    id v3 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    v4 = [v3 accessibilityHint];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)accessibilityContainerType
{
  if (![(CKTranscriptPluginBalloonViewAccessibility *)self isAccessibilityElement]) {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  return [(CKTranscriptPluginBalloonViewAccessibility *)&v4 accessibilityContainerType];
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  unint64_t v3 = [(CKTranscriptPluginBalloonViewAccessibility *)&v6 accessibilityTraits];
  if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL])
  {
    objc_super v4 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    v3 |= [v4 accessibilityTraits];
  }
  return v3;
}

- (id)_axBalloonViewCustomActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  objc_super v4 = [(CKTranscriptPluginBalloonViewAccessibility *)&v11 _axBalloonViewCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  uint64_t v5 = [(CKTranscriptPluginBalloonViewAccessibility *)self _accessibilityValueForKey:@"AXPluginClearActionProvider"];
  if (v5)
  {
    objc_super v6 = accessibilityLocalizedString(@"plugin.clear.action.title");
    v7 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v6 target:self selector:sel__axClear];
    [v3 addObject:v7];
  }
  else if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAppClip])
  {
    objc_super v6 = accessibilityLocalizedString(@"plugin.appClip.OpenInSafari.title");
    v7 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    objc_super v8 = [v7 accessibilityCustomActions];
    [v3 addObjectsFromArray:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v6 target:self selector:sel__axAppClipOpenInSafari];
    [v3 addObject:v9];
  }
  else
  {
    if (![(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL]) {
      goto LABEL_8;
    }
    objc_super v6 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    v7 = [v6 accessibilityCustomActions];
    [v3 addObjectsFromArray:v7];
  }

LABEL_8:

  return v3;
}

- (BOOL)accessibilityActivate
{
  if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsAppClip])
  {
    unint64_t v3 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    if (v3)
    {
      objc_super v4 = v3;
      [v3 _captionTapRecognized:0];

      return 1;
    }
  }
  else if ([(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL])
  {
    objc_super v6 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    char v7 = [v6 accessibilityActivate];

    return v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  return [(CKTranscriptPluginBalloonViewAccessibility *)&v8 accessibilityActivate];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  unsigned int result = [(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL];
  if (result)
  {
    v4.receiver = self;
    v4.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
    return [(CKTranscriptPluginBalloonViewAccessibility *)&v4 _accessibilityMediaAnalysisOptions] | 0x10000;
  }
  return result;
}

- (CGRect)_accessibilityMediaAnalysisFrame
{
  id v2 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
  unint64_t v3 = [v2 safeArrayForKey:@"_axMediaViews"];
  if ([v3 count] == 1)
  {
    objc_super v4 = [v3 firstObject];
    [v4 _accessibilityVisibleFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [v2 _accessibilityVisibleFrame];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }

  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)automationElements
{
  char v9 = 0;
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  objc_super v4 = [v3 subviews];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
    id v5 = [(CKTranscriptPluginBalloonViewAccessibility *)&v8 automationElements];
  }
  double v6 = v5;

  return v6;
}

- (BOOL)_axIsAttachedPlugin
{
  unint64_t v3 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axChatItemForBalloon];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)_axIsHandwriting
{
  return [(CKTranscriptPluginBalloonViewAccessibility *)self _axIsBalloonOfType:@"com.apple.Handwriting.HandwritingProvider"];
}

- (BOOL)_axIsURL
{
  return [(CKTranscriptPluginBalloonViewAccessibility *)self _axIsBalloonOfType:@"com.apple.messages.URLBalloonProvider"];
}

- (BOOL)_axIsAppClip
{
  unint64_t v3 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
  NSClassFromString(&cfstr_Lplinkview.isa);
  if (objc_opt_isKindOfClass())
  {
    char v4 = [NSClassFromString(&cfstr_Cpsclipurl.isa) safeBoolForKey:@"isSupported"];
    id v5 = [v3 safeValueForKeyPath:@"_metadata.associatedApplication"];
    double v6 = [v5 safeValueForKey:@"bundleIdentifier"];

    BOOL v7 = [(CKTranscriptPluginBalloonViewAccessibility *)self _axIsURL];
    if (v6) {
      BOOL v8 = v4;
    }
    else {
      BOOL v8 = 0;
    }
    BOOL v9 = v7 && v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_axAppClipDescriptionForMetadata:(id)a3
{
  id v3 = a3;
  char v4 = [v3 safeValueForKey:@"associatedApplication"];
  id v5 = [v3 safeStringForKey:@"title"];

  double v6 = [v4 safeStringForKey:@"_caption"];
  unint64_t v7 = [v4 safeIntegerForKey:@"clipAction"];
  if (v7 > 2)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = accessibilityLocalizedString(off_265113208[v7]);
  }
  BOOL v9 = __UIAXStringForVariables();

  return v9;
}

- (BOOL)_axIsAttachedHandwritingPlugin
{
  id v2 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKeyPath:@"pluginView.dataSource"];
  NSClassFromString(&cfstr_Hwballoondatas.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsAttachedRichLinkPlugin
{
  id v2 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKeyPath:@"pluginView.dataSource"];
  NSClassFromString(&cfstr_Richlinkplugin.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axHandwritingDescriptionForDataSource:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 safeValueForKeyPath:@"handwritingFromPayload.drawing"];
    objc_opt_class();
    id v5 = [v4 safeValueForKey:@"strokes"];
    double v6 = __UIAccessibilityCastAsClass();

    if (v6)
    {
      unint64_t v7 = NSString;
      BOOL v8 = accessibilityLocalizedString(@"handwriting.stroke.description");
      BOOL v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, objc_msgSend(v6, "count"));

      double v10 = accessibilityLocalizedString(@"handwriting.label");
      double v11 = __UIAXStringForVariables();
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)_axAppClipOpenInSafari
{
  id v2 = [(CKTranscriptPluginBalloonViewAccessibility *)self safeValueForKey:@"pluginView"];
  [v2 _mediaTapRecognized:0];
}

- (void)_axClear
{
  id v3 = [(CKTranscriptPluginBalloonViewAccessibility *)self _accessibilityValueForKey:@"AXPluginClearActionProvider"];
  if (objc_opt_respondsToSelector()) {
    id v2 = (id)[v3 safeValueForKey:@"_accessibilityClearPlugin"];
  }
}

@end