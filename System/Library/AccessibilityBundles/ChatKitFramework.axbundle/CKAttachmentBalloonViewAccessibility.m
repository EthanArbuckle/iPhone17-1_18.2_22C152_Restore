@interface CKAttachmentBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CKAttachmentBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAttachmentBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObject", @"UTIType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObject", @"mediaType", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentBalloonView", @"attachmentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentBalloonView", @"mediaObject", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKAttachmentBalloonViewAccessibility *)self safeValueForKey:@"attachmentView"];
  v4 = [(CKAttachmentBalloonViewAccessibility *)self safeValueForKey:@"mediaObject"];
  v19 = [v4 safeValueForKey:@"UTIType"];
  LOBYTE(v17) = 1;
  _AXLogWithFacility();
  v5 = _AXCKStringForMediaType([v4 safeIntForKey:@"mediaType", v17, @"icon: %@", v19]);
  if ([v5 length])
  {
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"attachment.with.type");
    uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);

    v5 = (void *)v8;
  }
  v9 = __UIAXStringForVariables();
  objc_opt_class();
  v10 = __UIAccessibilityCastAsSafeCategory();
  v11 = objc_msgSend(v10, "_axMessageSender", v3, @"__AXStringForVariablesSentinel");
  v12 = [v10 _axReplyDescription];
  v13 = [v10 _axStickerDescription];
  v14 = [v10 _axAcknowledgmentDescription];
  v18 = [v10 _axMessageTime];
  v15 = __UIAXStringForVariables();

  return v15;
}

@end