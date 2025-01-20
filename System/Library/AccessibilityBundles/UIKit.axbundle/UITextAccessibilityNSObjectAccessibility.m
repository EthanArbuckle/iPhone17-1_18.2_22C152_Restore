@interface UITextAccessibilityNSObjectAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (uint64_t)_accessibilityFontTraitEnabled:(void *)a3 enabledValue:;
- (void)_accessibilityBold;
- (void)_accessibilityCopy;
- (void)_accessibilityCut;
- (void)_accessibilityDefine;
- (void)_accessibilityDelete;
- (void)_accessibilityItalic;
- (void)_accessibilityMoveDown;
- (void)_accessibilityMoveUp;
- (void)_accessibilityPaste;
- (void)_accessibilityPostStyleOptionStatus:(uint64_t)a1;
- (void)_accessibilityRedo;
- (void)_accessibilityReplace;
- (void)_accessibilityScanText;
- (void)_accessibilitySelect;
- (void)_accessibilitySelectAll;
- (void)_accessibilityShare;
- (void)_accessibilityShowWritingTools;
- (void)_accessibilitySpeak;
- (void)_accessibilitySpeakSentence;
- (void)_accessibilitySpeakSpellOut;
- (void)_accessibilityUnderline;
- (void)_accessibilityUndo;
@end

@implementation UITextAccessibilityNSObjectAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityCopy
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_copy_ withSender:0] & 1) != 0)
  {
    [location[0] copy:0];
  }
  else
  {
    id v2 = (id)[MEMORY[0x263F1C738] activeInstance];
    [v2 copyOperation];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityScanText
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_captureTextFromCamera_ withSender:0] & 1) != 0)
  {
    [location[0] captureTextFromCamera:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityCut
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_cut_ withSender:0] & 1) != 0)
  {
    [location[0] cut:0];
  }
  else
  {
    id v2 = (id)[MEMORY[0x263F1C738] activeInstance];
    [v2 cutOperation];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySelect
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_select_ withSender:0] & 1) != 0)
  {
    [location[0] select:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityDelete
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_delete_ withSender:0] & 1) != 0)
  {
    [location[0] delete:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityReplace
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    [location[0] _promptForReplace:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityPaste
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_paste_ withSender:0] & 1) != 0)
  {
    [location[0] paste:0];
  }
  else
  {
    id v2 = (id)[MEMORY[0x263F1C738] activeInstance];
    [v2 pasteOperation];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityDefine
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_lookup_ withSender:0] & 1) != 0)
  {
    [location[0] performSelector:sel_lookup_ withObject:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityShare
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel__share_ withSender:0] & 1) != 0)
  {
    [location[0] performSelector:sel__share_ withObject:0];
  }
  objc_storeStrong(location, 0);
}

- (uint64_t)_accessibilityFontTraitEnabled:(void *)a3 enabledValue:
{
  id v30 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v28 = 0;
  objc_storeStrong(&v28, a3);
  if (v30)
  {
    id v26 = (id)[v30 _accessibilityTextViewTextOperationResponder];
    id v25 = 0;
    if ([v26 _accessibilityIsWebDocumentView])
    {
      id v3 = (id)[v26 safeValueForKey:@"_webView"];
      id v4 = v25;
      id v25 = v3;

      id v14 = (id)[v25 typingStyle];
      id v7 = (id)[v14 getPropertyValue:location];
      char v31 = [v7 isEqualToString:v28] & 1;

      int v27 = 1;
      objc_storeStrong(&v14, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v23 = 0;
        objc_opt_class();
        id v12 = (id)[v26 safeValueForKey:@"attributedText"];
        id v22 = (id)__UIAccessibilityCastAsClass();

        id v21 = v22;
        objc_storeStrong(&v22, 0);
        id v24 = v21;
        id v5 = objc_alloc(MEMORY[0x263F21660]);
        id v20 = (id)[v5 initWithStringOrAttributedString:v24];
        id v19 = (id)[v20 coalescedFontAttributes];
        char v17 = 0;
        objc_opt_class();
        id v11 = (id)[v19 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
        id v16 = (id)__UIAccessibilityCastAsClass();

        id v15 = v16;
        objc_storeStrong(&v16, 0);
        id v18 = v15;
        if ([v28 isEqualToString:@"bold"])
        {
          id v10 = (id)[v18 fontDescriptor];
          char v31 = ([v10 symbolicTraits] & 2) == 2;

          int v27 = 1;
        }
        else if ([v28 isEqualToString:@"italic"])
        {
          id v9 = (id)[v18 fontDescriptor];
          char v31 = ([v9 symbolicTraits] & 1) == 1;

          int v27 = 1;
        }
        else
        {
          if ([v28 isEqualToString:@"underline"])
          {
            id v8 = (id)[v19 objectForKeyedSubscript:*MEMORY[0x263F815F8]];
            char v31 = (int)[v8 intValue] > 0;
          }
          else
          {
            char v31 = 0;
          }
          int v27 = 1;
        }
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v24, 0);
      }
      else
      {
        char v31 = 0;
        int v27 = 1;
      }
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    char v31 = 0;
    int v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&location, 0);
  return v31 & 1;
}

- (void)_accessibilityPostStyleOptionStatus:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    id argument = (id)[MEMORY[0x263F21660] axAttributedStringWithString:location];
    [argument setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21828]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
    objc_storeStrong(&argument, 0);
    int v3 = 0;
  }
  else
  {
    int v3 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (void)_accessibilityBold
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8[0] canPerformAction:sel_toggleBoldface_ withSender:0] & 1) != 0)
  {
    [v8[0] performSelector:sel_toggleBoldface_ withObject:0];
    char v5 = 0;
    char v3 = 0;
    if (-[UITextAccessibilityNSObjectAccessibility _accessibilityFontTraitEnabled:enabledValue:](v9, @"font-weight", @"bold"))
    {
      id v6 = accessibilityLocalizedString(@"bold.enabled");
      char v5 = 1;
      id v2 = v6;
    }
    else
    {
      id v4 = accessibilityLocalizedString(@"bold.disabled");
      char v3 = 1;
      id v2 = v4;
    }
    id v7 = v2;
    if (v3) {

    }
    if (v5) {
    -[UITextAccessibilityNSObjectAccessibility _accessibilityPostStyleOptionStatus:]((uint64_t)v9, v7);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)_accessibilityItalic
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8[0] canPerformAction:sel_toggleItalics_ withSender:0] & 1) != 0)
  {
    [v8[0] performSelector:sel_toggleItalics_ withObject:0];
    char v5 = 0;
    char v3 = 0;
    if (-[UITextAccessibilityNSObjectAccessibility _accessibilityFontTraitEnabled:enabledValue:](v9, @"font-style", @"italic"))
    {
      id v6 = accessibilityLocalizedString(@"italic.enabled");
      char v5 = 1;
      id v2 = v6;
    }
    else
    {
      id v4 = accessibilityLocalizedString(@"italic.disabled");
      char v3 = 1;
      id v2 = v4;
    }
    id v7 = v2;
    if (v3) {

    }
    if (v5) {
    -[UITextAccessibilityNSObjectAccessibility _accessibilityPostStyleOptionStatus:]((uint64_t)v9, v7);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)_accessibilitySpeakSentence
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel__accessibilitySpeakSentence_ withSender:0] & 1) != 0)
  {
    [location[0] performSelector:sel__accessibilitySpeakSentence_ withObject:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySpeakSpellOut
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel__accessibilitySpeakSpellOut_ withSender:0] & 1) != 0)
  {
    [location[0] performSelector:sel__accessibilitySpeakSpellOut_ withObject:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySpeak
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel__accessibilitySpeak_ withSender:0] & 1) != 0)
  {
    [location[0] performSelector:sel__accessibilitySpeak_ withObject:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityUnderline
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8[0] canPerformAction:sel_toggleUnderline_ withSender:0] & 1) != 0)
  {
    [v8[0] performSelector:sel_toggleUnderline_ withObject:0];
    char v5 = 0;
    char v3 = 0;
    if (-[UITextAccessibilityNSObjectAccessibility _accessibilityFontTraitEnabled:enabledValue:](v9, @"-webkit-text-decorations-in-effect", @"underline"))
    {
      id v6 = accessibilityLocalizedString(@"underline.enabled");
      char v5 = 1;
      id v2 = v6;
    }
    else
    {
      id v4 = accessibilityLocalizedString(@"underline.disabled");
      char v3 = 1;
      id v2 = v4;
    }
    id v7 = v2;
    if (v3) {

    }
    if (v5) {
    -[UITextAccessibilityNSObjectAccessibility _accessibilityPostStyleOptionStatus:]((uint64_t)v9, v7);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)_accessibilitySelectAll
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_selectAll_ withSender:0] & 1) != 0)
  {
    [location[0] selectAll:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityMoveUp
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel__moveUp_withHistory_ withSender:0] & 1) != 0)
  {
    AXPerformSafeBlock();
  }
  objc_storeStrong(location, 0);
}

void __64__UITextAccessibilityNSObjectAccessibility__accessibilityMoveUp__block_invoke()
{
  id v0 = (id)[MEMORY[0x263F1C738] activeInstance];
  [v0 performTextOperationActionSelector:NSSelectorFromString(&cfstr_Moveup.isa)];
}

- (void)_accessibilityMoveDown
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel__moveDown_withHistory_ withSender:0] & 1) != 0)
  {
    AXPerformSafeBlock();
  }
  objc_storeStrong(location, 0);
}

void __66__UITextAccessibilityNSObjectAccessibility__accessibilityMoveDown__block_invoke()
{
  id v0 = (id)[MEMORY[0x263F1C738] activeInstance];
  [v0 performTextOperationActionSelector:NSSelectorFromString(&cfstr_Movedown.isa)];
}

- (void)_accessibilityUndo
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[location[0] undoManager];
    [v2 undo];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityRedo
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[location[0] undoManager];
    [v2 redo];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityShowWritingTools
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextAccessibilityNSObjectAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([location[0] canPerformAction:sel_showWritingTools_ withSender:0] & 1) != 0)
  {
    [location[0] showWritingTools:0];
  }
  objc_storeStrong(location, 0);
}

@end