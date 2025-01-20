@interface CKPhotoStackBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityStackView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CKPhotoStackBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPhotoStackBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAggregateAttachmentMessagePartChatItem", @"aggregateChatItems", "@", 0);
  [v3 validateClass:@"CKPhotoStackBalloonView" isKindOfClass:@"CKGenericPhotoStackBalloonView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGenericPhotoStackBalloonView", @"stackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagePartChatItem", @"visibleAssociatedMessageChatItems", "@", 0);
  [v3 validateClass:@"CKAggregateAcknowledgmentChatItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXMessagesStackItemsLayout", @"primaryItemIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXMessagesStackView", @"currentAssetReference", "@", 0);
  [v3 validateClass:@"PXMessagesStackView" isKindOfClass:@"PXBaseMessagesStackView"];
  [v3 validateClass:@"PXBaseMessagesStackView" hasInstanceVariable:@"_layout" withType:"PXMessagesStackItemsLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXAssetReference", @"asset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObjectBackedAsset", @"playbackStyle", "q", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsSafeCategory();
  v4 = [(CKPhotoStackBalloonViewAccessibility *)self _axChatItemForBalloon];
  v5 = [v4 safeArrayForKey:@"aggregateChatItems"];

  v6 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  v7 = [v6 safeValueForKey:@"layout"];
  unint64_t v8 = [v7 safeIntegerForKey:@"primaryItemIndex"];

  v9 = 0;
  if (v8 < [v5 count])
  {
    v10 = [v5 objectAtIndex:v8];
    v11 = [v10 safeArrayForKey:@"visibleAssociatedMessageChatItems"];
    v12 = objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &__block_literal_global_1261);
    v9 = [v12 firstObject];
  }
  uint64_t v13 = [v5 count];
  v14 = NSString;
  v15 = accessibilityLocalizedString(@"attachment.count");
  v16 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v13);

  v17 = [v3 _axMessageSender];
  v18 = [v3 _axReplyDescription];
  v19 = [v3 _axStickerDescription];
  v20 = [v9 accessibilityLabel];
  v23 = [v3 _axMessageTime];
  v21 = __UIAXStringForVariables();

  return v21;
}

uint64_t __58__CKPhotoStackBalloonViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Ckaggregateack_2.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityValue
{
  id v3 = [(CKPhotoStackBalloonViewAccessibility *)self _axChatItemForBalloon];
  v4 = [v3 safeArrayForKey:@"aggregateChatItems"];

  uint64_t v5 = [v4 count];
  v6 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  v7 = [v6 safeValueForKey:@"layout"];
  uint64_t v8 = [v7 safeIntegerForKey:@"primaryItemIndex"];

  v9 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  v10 = [v9 safeValueForKeyPath:@"currentAssetReference.asset"];

  if ([v10 safeIntegerForKey:@"playbackStyle"] == 4) {
    v11 = @"video.attachment";
  }
  else {
    v11 = @"image.attachment";
  }
  v12 = accessibilityLocalizedString(v11);
  uint64_t v13 = v8 + 1;
  v14 = NSString;
  v15 = accessibilityLocalizedString(@"messages.attachment.stack.view.format");
  v18 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v13, v5);
  v16 = __UIAXStringForVariables();

  return v16;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CED8];
}

- (void)accessibilityIncrement
{
  id v2 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  [v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  id v2 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  [v2 accessibilityDecrement];
}

- (CGPoint)accessibilityActivationPoint
{
  id v2 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityCustomActions
{
  double v3 = [MEMORY[0x263EFF980] array];
  v8.receiver = self;
  v8.super_class = (Class)CKPhotoStackBalloonViewAccessibility;
  double v4 = [(CKPhotoStackBalloonViewAccessibility *)&v8 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  double v5 = [(CKPhotoStackBalloonViewAccessibility *)self _accessibilityStackView];
  double v6 = [v5 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v6];

  return v3;
}

- (id)_accessibilityStackView
{
  return (id)[(CKPhotoStackBalloonViewAccessibility *)self safeValueForKey:@"stackView"];
}

@end