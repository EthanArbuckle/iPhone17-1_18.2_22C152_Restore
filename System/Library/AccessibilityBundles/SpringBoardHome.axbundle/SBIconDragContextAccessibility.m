@interface SBIconDragContextAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setRecipientIconView:(id)a3;
@end

@implementation SBIconDragContextAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconDragContext";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"recipientIconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"setRecipientIconView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isFolderIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isWidgetIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isWidgetStackIcon", "B", 0);
}

- (void)setRecipientIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconDragContextAccessibility *)self safeValueForKey:@"recipientIconView"];
  v27.receiver = self;
  v27.super_class = (Class)SBIconDragContextAccessibility;
  [(SBIconDragContextAccessibility *)&v27 setRecipientIconView:v4];
  if (!(SBAXIconCreatingFolder | SBAXPerformingAXDrag))
  {
    v6 = AXSBIconControllerSharedInstance();
    v7 = [v6 _axDragManager];
    int v8 = [v7 _axIsIconDragging];

    if (v8)
    {
      if (v5 != v4)
      {
        if (v4 || !v5)
        {
          if (!v4) {
            goto LABEL_22;
          }
          v18 = [v4 safeValueForKey:@"icon"];
          if ([v18 safeBoolForKey:@"isWidgetStackIcon"])
          {
            v19 = accessibilityLocalizedString(@"will.add.to.stack");
          }
          else
          {
            if ([v18 safeBoolForKey:@"isWidgetIcon"])
            {
              v22 = NSString;
              v23 = @"will.create.stack";
            }
            else
            {
              if ([v18 safeBoolForKey:@"isFolderIcon"]) {
                v23 = @"will.open.folder";
              }
              else {
                v23 = @"will.create.folder";
              }
              v22 = NSString;
            }
            v24 = accessibilityLocalizedString(v23);
            v25 = [v4 accessibilityLabel];
            v19 = objc_msgSend(v22, "stringWithFormat:", v24, v25);
          }
          v21 = [MEMORY[0x263F21660] axAttributedStringWithString:v19];
          [v21 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
        }
        else
        {
          [(id)SBAXIconFolderOpeningTimer invalidate];
          v9 = [v5 safeValueForKey:@"icon"];
          int v10 = [v9 safeBoolForKey:@"isFolderIcon"];
          v11 = @"dragged.off.app";
          if (v10) {
            v11 = @"dragged.off.folder";
          }
          v12 = v11;

          v13 = NSString;
          v14 = accessibilityLocalizedString(v12);

          v15 = [v5 accessibilityLabel];
          v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);

          v17 = NSString;
          v18 = accessibilityLocalizedString(@"finished.moving.app");
          v19 = MEMORY[0x245663CF0](SBAXIconMovedY);
          v20 = MEMORY[0x245663CF0](SBAXIconMovedX);
          v26 = objc_msgSend(v17, "stringWithFormat:", v18, v19, v20);
          v21 = __UIAXStringForVariables();
        }
        if (v21)
        {
          UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v21);
        }
      }
    }
  }
LABEL_22:
  if (v4) {
    SBHAXCancelSBAXIconMoveSpeakTimer();
  }
}

@end