@interface UIResponder(UITextAccessibilityUtilities)
- (id)_accessibilityTextOperations;
- (uint64_t)_accessibilityBeginUndoableTextInsertion;
- (uint64_t)_accessibilityEndUndoableTextInsertion;
- (uint64_t)_accessibilityHasTextOperations;
@end

@implementation UIResponder(UITextAccessibilityUtilities)

- (uint64_t)_accessibilityHasTextOperations
{
  v11 = a1;
  uint64_t v10 = a2;
  if (AXIgnoresTextOperations())
  {
    char v12 = 0;
  }
  else
  {
    BOOL v9 = 0;
    BOOL v5 = 1;
    if (AXRequestingClient() != 3) {
      BOOL v5 = AXRequestingClient() == 4;
    }
    BOOL v9 = v5;
    id v8 = (id)[v11 _accessibilityTextViewTextOperationResponder];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (([v8 canPerformAction:sel_copy_ withSender:0] & 1) != 0
       || ([v8 canPerformAction:sel_select_ withSender:0] & 1) != 0
       || ([v8 canPerformAction:sel_captureTextFromCamera_ withSender:0] & 1) != 0
       || ([v8 canPerformAction:sel_cut_ withSender:0] & 1) != 0
       || ([v8 canPerformAction:sel_selectAll_ withSender:0] & 1) != 0
       || ([v8 canPerformAction:sel__define_ withSender:0] & 1) != 0
       || ([v8 canPerformAction:sel__share_ withSender:0] & 1) != 0
       || v9 && ([v8 canPerformAction:sel_paste_ withSender:0] & 1) != 0
       || !v9 && (objc_opt_respondsToSelector() & 1) != 0))
    {
      char v12 = 1;
      int v7 = 1;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 {
           && (-[UIResponder _accessibilitySupportsRichTextEditing](v11) & 1) != 0
    }
           && (([v8 canPerformAction:sel_toggleItalics_ withSender:0] & 1) != 0
            || ([v8 canPerformAction:sel_toggleBoldface_ withSender:0] & 1) != 0
            || ([v8 canPerformAction:sel_toggleUnderline_ withSender:0] & 1) != 0))
    {
      char v12 = 1;
      int v7 = 1;
    }
    else
    {
      id v3 = (id)[v8 accessibilityMenuActions];
      BOOL v4 = [v3 count] == 0;

      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ((id location = (id)[v8 undoManager],
               ([location canUndo] & 1) == 0)
           && ([location canRedo] & 1) == 0
            ? (int v7 = 0)
            : (v12 = 1, int v7 = 1),
              objc_storeStrong(&location, 0),
              !v7))
        {
          char v12 = 0;
          int v7 = 1;
        }
      }
      else
      {
        char v12 = 1;
        int v7 = 1;
      }
    }
    objc_storeStrong(&v8, 0);
  }
  return v12 & 1;
}

- (id)_accessibilityTextOperations
{
  char v12 = a1;
  v11[1] = a2;
  v11[0] = (id)[a1 _accessibilityTextViewTextOperationResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (id v2 = (id)[v11[0] _accessibilityTextViewTextOperationResponder],
        id v3 = v11[0],
        v11[0] = v2,
        v3,
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    id v9 = (id)[MEMORY[0x263EFF980] array];
    id v8 = (id)[v11[0] accessibilityMenuActions];
    if ([v8 count]) {
      [v9 addObjectsFromArray:v8];
    }
    if ([v11[0] canPerformAction:sel_captureTextFromCamera_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21BD8]];
    }
    if ([v11[0] canPerformAction:sel_copy_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21B78]];
    }
    if ([v11[0] canPerformAction:sel_select_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21BE0]];
    }
    if ([v11[0] canPerformAction:sel_cut_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21B80]];
    }
    if ([v11[0] canPerformAction:sel_paste_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21BC0]];
    }
    if ([v11[0] canPerformAction:sel_delete_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21B98]];
    }
    if ([v11[0] canPerformAction:sel__promptForReplace_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21BD0]];
    }
    if ([v11[0] canPerformAction:sel_selectAll_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21BE8]];
    }
    if ([v11[0] canPerformAction:sel__define_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21B90]];
    }
    if ([v11[0] canPerformAction:sel__share_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21BF0]];
    }
    char v7 = -[UIResponder _accessibilitySupportsRichTextEditing](v12) & 1;
    if (v7 && ([v11[0] canPerformAction:sel_toggleItalics_ withSender:0] & 1) != 0) {
      [v9 addObject:*MEMORY[0x263F21BA8]];
    }
    if (v7 & 1) != 0 && ([v11[0] canPerformAction:sel_toggleBoldface_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21B70]];
    }
    if (v7 & 1) != 0 && ([v11[0] canPerformAction:sel_toggleUnderline_ withSender:0]) {
      [v9 addObject:*MEMORY[0x263F21C10]];
    }
    if (([MEMORY[0x263F1C8F8] _isWritingToolsAvailable] & 1) != 0
      && ([v11[0] canPerformAction:sel_showWritingTools_ withSender:0] & 1) != 0)
    {
      [v9 addObject:*MEMORY[0x263F21C20]];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id location = (id)[v11[0] undoManager];
      if ([location canUndo]) {
        [v9 addObject:*MEMORY[0x263F21C18]];
      }
      if ([location canRedo]) {
        [v9 addObject:*MEMORY[0x263F21BC8]];
      }
      objc_storeStrong(&location, 0);
    }
    if (_AXSQuickSpeakEnabled())
    {
      if (([v11[0] canPerformAction:sel__accessibilitySpeak_ withSender:0] & 1) != 0
        || ([v11[0] canPerformAction:sel__accessibilitySpeakLanguageSelection_ withSender:0] & 1) != 0)
      {
        [v9 addObject:*MEMORY[0x263F21BF8]];
      }
      else if ([v11[0] canPerformAction:sel__accessibilitySpeakSentence_ withSender:0])
      {
        [v9 addObject:*MEMORY[0x263F21C00]];
      }
      else if ([v11[0] canPerformAction:sel__accessibilitySpeakSpellOut_ withSender:0])
      {
        [v9 addObject:*MEMORY[0x263F21C08]];
      }
    }
    id v13 = v9;
    int v10 = 1;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    id v13 = 0;
    int v10 = 1;
  }
  objc_storeStrong(v11, 0);
  BOOL v4 = v13;

  return v4;
}

- (uint64_t)_accessibilityBeginUndoableTextInsertion
{
  id v8 = a1;
  uint64_t v7 = a2;
  char v6 = 0;
  id v5 = (id)[a1 _accessibilityTextViewTextOperationResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id location = (id)[v5 undoManager];
    NSClassFromString(&cfstr_Uitextundomana.isa);
    if (objc_opt_isKindOfClass())
    {
      [location beginUndoGrouping];
      char v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  char v3 = v6;
  objc_storeStrong(&v5, 0);
  return v3 & 1;
}

- (uint64_t)_accessibilityEndUndoableTextInsertion
{
  id v8 = a1;
  uint64_t v7 = a2;
  char v6 = 0;
  id v5 = (id)[a1 _accessibilityTextViewTextOperationResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id location = (id)[v5 undoManager];
    NSClassFromString(&cfstr_Uitextundomana.isa);
    if (objc_opt_isKindOfClass())
    {
      [location endUndoGrouping];
      char v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  char v3 = v6;
  objc_storeStrong(&v5, 0);
  return v3 & 1;
}

@end