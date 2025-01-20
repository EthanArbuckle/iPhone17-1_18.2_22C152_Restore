@interface VMMessageMetadataViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsVoiceMailUnread;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation VMMessageMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VMMessageMetadataView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"shortDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"shortDurationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"currentViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailMessageTableViewCell", @"isExpanded", "B", 0);
  [v3 validateClass:@"PHVoicemailMessageTableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailMessageTableViewCell", @"unreadIndicatorImageView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  v2 = [(VMMessageMetadataViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Phvoicemailmes_1.isa)];
  if ([v2 safeBoolForKey:@"isExpanded"]) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (id)accessibilityLabel
{
  if ([(VMMessageMetadataViewAccessibility *)self _axIsVoiceMailUnread])
  {
    int64_t v3 = accessibilityLocalizedString(@"voicemail.unread");
  }
  else
  {
    int64_t v3 = 0;
  }
  v4 = [(VMMessageMetadataViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = [v4 accessibilityLabel];

  v6 = [(VMMessageMetadataViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v7 = [v6 accessibilityLabel];

  objc_opt_class();
  v8 = [(VMMessageMetadataViewAccessibility *)self safeValueForKey:@"shortDateLabel"];
  v9 = __UIAccessibilityCastAsClass();

  v10 = [v9 date];

  v11 = objc_msgSend(MEMORY[0x263F08790], "localizedStringFromDate:dateStyle:timeStyle:", v10, 3, -[VMMessageMetadataViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"isExpanded"));
  if ([(VMMessageMetadataViewAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    v12 = 0;
  }
  else
  {
    v13 = [(VMMessageMetadataViewAccessibility *)self safeValueForKey:@"shortDurationLabel"];
    v14 = [v13 accessibilityLabel];
    v12 = AXLocalizeDurationTime();
  }
  objc_opt_class();
  v15 = [(VMMessageMetadataViewAccessibility *)self safeValueForKey:@"currentViewModel"];
  v16 = __UIAccessibilityCastAsSafeCategory();

  v19 = [v16 _axLocalizedSenderIdentityFullName];
  v17 = __UIAXStringForVariables();

  return v17;
}

- (BOOL)_axIsVoiceMailUnread
{
  v2 = [(VMMessageMetadataViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Phvoicemailmes_1.isa)];
  int64_t v3 = [v2 safeUIViewForKey:@"unreadIndicatorImageView"];
  [v3 alpha];
  BOOL v5 = v4 > 0.0;

  return v5;
}

@end