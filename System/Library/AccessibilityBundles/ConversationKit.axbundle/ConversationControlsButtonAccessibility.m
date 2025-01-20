@interface ConversationControlsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axGetLabelSubview;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ConversationControlsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ConversationControlsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(ConversationControlsButtonAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"joinButton"])
  {
    v4 = @"join.call";
  }
  else if ([v3 isEqualToString:@"cancelButton"])
  {
    v4 = @"cancel.join.call";
  }
  else if ([v3 isEqualToString:@"leaveButton"])
  {
    v4 = @"leave.call";
  }
  else if ([v3 isEqualToString:@"openMessagesButton"])
  {
    v4 = @"open.messages";
  }
  else if ([v3 isEqualToString:@"toggleAudioRouteMenuButton"])
  {
    v4 = @"audio.route";
  }
  else if ([v3 isEqualToString:@"toggleMicMenuButton"])
  {
    v4 = @"mute";
  }
  else if ([v3 isEqualToString:@"toggleVideoButton"])
  {
    v4 = @"camera";
  }
  else
  {
    if (![v3 isEqualToString:@"shareMenuButton"])
    {
      v9.receiver = self;
      v9.super_class = (Class)ConversationControlsButtonAccessibility;
      v7 = [(ConversationControlsButtonAccessibility *)&v9 accessibilityLabel];
      if ([v7 length])
      {
        id v5 = v7;
      }
      else
      {
        v8 = [(ConversationControlsButtonAccessibility *)self _axGetLabelSubview];
        id v5 = [v8 text];
      }
      goto LABEL_18;
    }
    v4 = @"share.content";
  }
  accessibilityLocalizedString(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(ConversationControlsButtonAccessibility *)self accessibilityIdentifier];
  if (([v3 isEqualToString:@"toggleVideoButton"] & 1) != 0
    || [v3 isEqualToString:@"toggleMicMenuButton"])
  {
    if ([(ConversationControlsButtonAccessibility *)self safeBoolForKey:@"isSelected"])v4 = @"on"; {
    else
    }
      v4 = @"off";
    id v5 = accessibilityLocalizedString(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)ConversationControlsButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(ConversationControlsButtonAccessibility *)&v6 accessibilityTraits];
  v4 = [(ConversationControlsButtonAccessibility *)self accessibilityIdentifier];
  if (([v4 isEqualToString:@"toggleVideoButton"] & 1) != 0
    || [v4 isEqualToString:@"toggleMicMenuButton"])
  {
    v3 &= ~*MEMORY[0x263F1CF38];
  }

  return v3;
}

- (id)accessibilityPath
{
  unint64_t v3 = [(ConversationControlsButtonAccessibility *)self accessibilityIdentifier];
  v14.receiver = self;
  v14.super_class = (Class)ConversationControlsButtonAccessibility;
  v4 = [(ConversationControlsButtonAccessibility *)&v14 accessibilityPath];
  if (([v3 isEqualToString:@"joinButton"] & 1) != 0
    || [v3 isEqualToString:@"leaveButton"])
  {
    [v4 bounds];
    AX_CGRectGetCenter();
    double v6 = v5;
    double v8 = v7;
    CGAffineTransformMakeScale(&v13, 1.3, 1.3);
    [v4 applyTransform:&v13];
    [v4 bounds];
    AX_CGRectGetCenter();
    CGAffineTransformMakeTranslation(&v12, v6 - v9, v8 - v10);
    [v4 applyTransform:&v12];
  }

  return v4;
}

- (id)_axGetLabelSubview
{
  uint64_t v3 = objc_opt_class();

  return (id)[(ConversationControlsButtonAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end