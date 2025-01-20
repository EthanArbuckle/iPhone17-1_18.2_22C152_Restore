@interface IMMessageAcknowledgmentChatItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForAcknowledgmentFromSomeone;
- (id)_axLabelForAcknowledgmentFromYou;
- (id)accessibilityLabel;
@end

@implementation IMMessageAcknowledgmentChatItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IMMessageAcknowledgmentChatItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"IMMessageAcknowledgmentChatItem" isKindOfClass:@"IMAssociatedMessageChatItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMAssociatedMessageChatItem", @"isFromMe", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMAssociatedMessageChatItem", @"sender", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMAssociatedMessageChatItem", @"tapback", "@", 0);
  [v3 validateClass:@"IMTapback"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMTapback", @"associatedMessageType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMHandle", @"name", "@", 0);
}

- (id)accessibilityLabel
{
  if ([(IMMessageAcknowledgmentChatItemAccessibility *)self safeBoolForKey:@"isFromMe"])[(IMMessageAcknowledgmentChatItemAccessibility *)self _axLabelForAcknowledgmentFromYou]; {
  else
  }
  id v3 = [(IMMessageAcknowledgmentChatItemAccessibility *)self _axLabelForAcknowledgmentFromSomeone];

  return v3;
}

- (id)_axLabelForAcknowledgmentFromYou
{
  v2 = [(IMMessageAcknowledgmentChatItemAccessibility *)self safeValueForKey:@"tapback"];
  switch([v2 safeUnsignedIntegerForKey:@"associatedMessageType"])
  {
    case 2000:
      id v3 = @"acknowledgment.you.loved";
      goto LABEL_9;
    case 2001:
      id v3 = @"acknowledgment.you.liked";
      goto LABEL_9;
    case 2002:
      id v3 = @"acknowledgment.you.disliked";
      goto LABEL_9;
    case 2003:
      id v3 = @"acknowledgment.you.laughed";
      goto LABEL_9;
    case 2004:
      id v3 = @"acknowledgment.you.emphasized";
      goto LABEL_9;
    case 2005:
      id v3 = @"acknowledgment.you.questioned";
LABEL_9:
      v4 = accessibilityLocalizedString(v3);
      break;
    case 2006:
      v5 = NSString;
      v6 = accessibilityLocalizedString(@"acknowledgment.you.generic");
      uint64_t v7 = [v2 safeStringForKey:@"associatedMessageEmoji"];
      goto LABEL_12;
    case 2007:
      v5 = NSString;
      v6 = accessibilityLocalizedString(@"acknowledgment.you.generic");
      uint64_t v7 = accessibilityLocalizedString(@"default.tapback");
LABEL_12:
      v8 = (void *)v7;
      v4 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);

      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

- (id)_axLabelForAcknowledgmentFromSomeone
{
  id v3 = [(IMMessageAcknowledgmentChatItemAccessibility *)self safeValueForKey:@"sender"];
  v4 = [v3 safeValueForKey:@"name"];

  v5 = [(IMMessageAcknowledgmentChatItemAccessibility *)self safeValueForKey:@"tapback"];
  switch([v5 safeUnsignedIntegerForKey:@"associatedMessageType"])
  {
    case 2000:
      v6 = NSString;
      uint64_t v7 = @"acknowledgment.someone.loved";
      goto LABEL_9;
    case 2001:
      v6 = NSString;
      uint64_t v7 = @"acknowledgment.someone.liked";
      goto LABEL_9;
    case 2002:
      v6 = NSString;
      uint64_t v7 = @"acknowledgment.someone.disliked";
      goto LABEL_9;
    case 2003:
      v6 = NSString;
      uint64_t v7 = @"acknowledgment.someone.laughed";
      goto LABEL_9;
    case 2004:
      v6 = NSString;
      uint64_t v7 = @"acknowledgment.someone.emphasized";
      goto LABEL_9;
    case 2005:
      v6 = NSString;
      uint64_t v7 = @"acknowledgment.someone.questioned";
LABEL_9:
      v9 = accessibilityLocalizedString(v7);
      v8 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v4);
      goto LABEL_13;
    case 2006:
      v10 = NSString;
      v9 = accessibilityLocalizedString(@"acknowledgment.someone.generic");
      v11 = [v5 safeStringForKey:@"associatedMessageEmoji"];
      uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", v9, v4, v11);
      goto LABEL_12;
    case 2007:
      v13 = NSString;
      v9 = accessibilityLocalizedString(@"acknowledgment.someone.generic");
      v11 = accessibilityLocalizedString(@"default.tapback");
      uint64_t v12 = objc_msgSend(v13, "localizedStringWithFormat:", v9, v4, v11);
LABEL_12:
      v8 = (void *)v12;

LABEL_13:
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

@end