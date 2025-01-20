@interface SCATModernMenuEditingSheet
+ (BOOL)isValidForElement:(id)a3;
- (BOOL)_adjustSelectionForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5 selectedRange:(_NSRange)a6 startingRangeForSelection:(_NSRange)a7;
- (BOOL)selectionModeOn;
- (BOOL)shouldIncludeBackItem;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (SCATModernMenuEditingSheet)initWithMenu:(id)a3;
- (SCATModernMenuItem)selectWordOrNoneItem;
- (SCATModernMenuItem)selectionModeToggleItem;
- (_NSRange)startingRangeForSelection;
- (id)_identifierForTextMovementDirection:(unint64_t)a3 unit:(unint64_t)a4;
- (id)alternateTipElement;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (void)_handleCompletedCutCopyPasteOperationForTextElement:(id)a3;
- (void)_moveCursorForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5;
- (void)_selectNoneForTextElement:(id)a3;
- (void)_selectWordForTextElement:(id)a3;
- (void)menuItemWasActivated:(id)a3;
- (void)setSelectWordOrNoneItem:(id)a3;
- (void)setSelectionModeOn:(BOOL)a3;
- (void)setSelectionModeToggleItem:(id)a3;
- (void)setStartingRangeForSelection:(_NSRange)a3;
@end

@implementation SCATModernMenuEditingSheet

+ (BOOL)isValidForElement:(id)a3
{
  return 1;
}

- (SCATModernMenuEditingSheet)initWithMenu:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCATModernMenuEditingSheet;
  v5 = [(SCATModernMenuSheet *)&v7 initWithMenu:v4];
  if (v5) {
    [v4 slidePopoverToPosition:6];
  }

  return v5;
}

- (BOOL)shouldIncludeBackItem
{
  return 0;
}

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  id v4 = [(SCATModernMenuSheet *)self menu];
  v5 = [v4 textElement];

  unint64_t v6 = (unint64_t)[v5 traits];
  unint64_t v7 = kAXIsEditingTrait & v6;
  v8 = [(SCATModernMenuSheet *)self menu];
  v9 = [v8 textElement];
  v10 = [v9 textOperations];

  if (([v10 containsObject:kAXTextOperationActionSelectAll] & 1) != 0
    || ([v5 selectedTextRange], v11))
  {
    v12 = sub_100040EC8(@"EDIT-SELECT-ALL");
    v13 = +[SCATModernMenuItem itemWithIdentifier:@"edit_selectAll" delegate:self title:v12 imageName:0 activateBehavior:3];
    [v3 addObject:v13];

    v14 = sub_100040EC8(@"EDIT_SELECT_WORD");
    v15 = +[SCATModernMenuItem itemWithIdentifier:@"select_word_or_none" delegate:self title:v14 imageName:0 activateBehavior:3];

    [v3 addObject:v15];
    [(SCATModernMenuEditingSheet *)self setSelectWordOrNoneItem:v15];

    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  if (v7) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 1;
  }
  if (v7 || [v10 containsObject:kAXTextOperationActionCut])
  {
    v18 = sub_100040EC8(@"EDIT-CUT");
    v19 = +[SCATModernMenuItem itemWithIdentifier:@"edit_cut" delegate:self title:v18 imageName:0 activateBehavior:v17];
    [v3 addObject:v19];
  }
  if ((v16 & 1) != 0 || [v10 containsObject:kAXTextOperationActionCopy])
  {
    v20 = sub_100040EC8(@"EDIT-COPY");
    v21 = +[SCATModernMenuItem itemWithIdentifier:@"edit_copy" delegate:self title:v20 imageName:0 activateBehavior:v17];
    [v3 addObject:v21];
  }
  if (v7 || [v10 containsObject:kAXTextOperationActionPaste])
  {
    v22 = sub_100040EC8(@"EDIT-PASTE");
    v23 = +[SCATModernMenuItem itemWithIdentifier:@"edit_paste" delegate:self title:v22 imageName:0 activateBehavior:v17];
    [v3 addObject:v23];

    char v24 = v16 ^ 1;
    if (!v7) {
      char v24 = 1;
    }
    if ((v24 & 1) == 0)
    {
      v25 = +[SCATModernMenuItem itemWithIdentifier:@"selection_mode_toggle" delegate:self title:0 imageName:0 activateBehavior:3];
      [v3 addObject:v25];
      [(SCATModernMenuEditingSheet *)self setSelectionModeToggleItem:v25];

LABEL_23:
      v27 = [(SCATModernMenuEditingSheet *)self _identifierForTextMovementDirection:1 unit:0];
      v28 = sub_100040EC8(@"EDIT_BACKWARD_CHAR");
      v29 = +[SCATModernMenuItem itemWithIdentifier:v27 delegate:self title:v28 imageName:@"SCATIcon_edit_previousCharacter" activateBehavior:3];
      [v3 addObject:v29];

      v30 = [(SCATModernMenuEditingSheet *)self _identifierForTextMovementDirection:0 unit:0];
      v31 = sub_100040EC8(@"EDIT_FORWARD_CHAR");
      v32 = +[SCATModernMenuItem itemWithIdentifier:v30 delegate:self title:v31 imageName:@"SCATIcon_edit_nextCharacter" activateBehavior:3];
      [v3 addObject:v32];

      v33 = [(SCATModernMenuEditingSheet *)self _identifierForTextMovementDirection:1 unit:1];
      v34 = sub_100040EC8(@"EDIT_BACKWARD_WORD");
      v35 = +[SCATModernMenuItem itemWithIdentifier:v33 delegate:self title:v34 imageName:@"SCATIcon_edit_previousWord" activateBehavior:3];
      [v3 addObject:v35];

      v36 = [(SCATModernMenuEditingSheet *)self _identifierForTextMovementDirection:0 unit:1];
      v37 = sub_100040EC8(@"EDIT_FORWARD_WORD");
      v38 = +[SCATModernMenuItem itemWithIdentifier:v36 delegate:self title:v37 imageName:@"SCATIcon_edit_nextWord" activateBehavior:3];
      [v3 addObject:v38];

      v39 = [(SCATModernMenuEditingSheet *)self _identifierForTextMovementDirection:1 unit:2];
      v40 = sub_100040EC8(@"EDIT_BACKWARD_LINE");
      v41 = +[SCATModernMenuItem itemWithIdentifier:v39 delegate:self title:v40 imageName:@"SCATIcon_edit_previousLine" activateBehavior:3];
      [v3 addObject:v41];

      v42 = [(SCATModernMenuEditingSheet *)self _identifierForTextMovementDirection:0 unit:2];
      v43 = sub_100040EC8(@"EDIT_FORWARD_LINE");
      v44 = +[SCATModernMenuItem itemWithIdentifier:v42 delegate:self title:v43 imageName:@"SCATIcon_edit_nextLine" activateBehavior:3];
      [v3 addObject:v44];

      if (!v7)
      {
        [(SCATModernMenuEditingSheet *)self setSelectionModeOn:1];
        -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", 0, 0);
      }
      goto LABEL_25;
    }
  }
  char v26 = v16 ^ 1;
  if (v7) {
    char v26 = 0;
  }
  if ((v26 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_25:

  return v3;
}

- (int64_t)preferredTipObject
{
  return 2;
}

- (id)alternateTipElement
{
  v2 = [(SCATModernMenuSheet *)self menu];
  v3 = [v2 textElement];

  return v3;
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"selection_mode_toggle"])
  {
    unsigned int v6 = [(SCATModernMenuEditingSheet *)self selectionModeOn];
    BOOL v7 = v6 == 0;
    if (v6) {
      v8 = @"EDIT_DISABLE_SELECT";
    }
    else {
      v8 = @"EDIT_ENABLE_SELECT";
    }
    if (v7) {
      CFStringRef v9 = @"SCATIcon_edit_startSelection";
    }
    else {
      CFStringRef v9 = @"SCATIcon_edit_endSelection";
    }
LABEL_15:
    v14 = sub_100040EC8(v8);
    [v4 setTitle:v14];
    [v4 setImageName:v9];

    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"select_word_or_none"])
  {
    v10 = [(SCATModernMenuSheet *)self menu];
    uint64_t v11 = [v10 textElement];
    [v11 selectedTextRange];
    uint64_t v13 = v12;

    if (v13) {
      v8 = @"EDIT_SELECT_NONE";
    }
    else {
      v8 = @"EDIT_SELECT_WORD";
    }
    if (v13) {
      CFStringRef v9 = @"SCATIcon_edit_deselect";
    }
    else {
      CFStringRef v9 = @"SCATIcon_edit_selectWord";
    }
    goto LABEL_15;
  }
LABEL_16:

  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  unsigned int v6 = [(SCATModernMenuSheet *)self menu];
  BOOL v7 = [v6 textElement];

  if ([v5 isEqualToString:@"edit_cut"])
  {
    v8 = &kAXTextOperationActionCut;
LABEL_5:
    [v7 performAction:2012 withValue:*v8];
    [(SCATModernMenuEditingSheet *)self _handleCompletedCutCopyPasteOperationForTextElement:v7];
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"edit_copy"])
  {
    v8 = &kAXTextOperationActionCopy;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"edit_paste"])
  {
    CFStringRef v9 = +[UIPasteboard generalPasteboard];
    v10 = [v7 uiElement];
    uint64_t v11 = [v10 numberWithAXAttribute:3065];
    id v12 = [v11 longLongValue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000A4F6C;
    v24[3] = &unk_1001ADBD8;
    id v25 = v7;
    char v26 = self;
    [v9 _requestSecurePasteAuthenticationMessageWithContext:0x7EC07AF570CAADBCLL forClientVersionedPID:v12 completionBlock:v24];
  }
  else if ([v5 isEqualToString:@"edit_selectAll"])
  {
    [(SCATModernMenuEditingSheet *)self _selectNoneForTextElement:v7];
    [v7 performAction:2012 withValue:kAXTextOperationActionSelectAll];
    uint64_t v13 = [(SCATModernMenuEditingSheet *)self selectWordOrNoneItem];
    [v13 updateItem];
  }
  else if ([v5 isEqualToString:@"select_word_or_none"])
  {
    [v7 selectedTextRange];
    if (v14) {
      [(SCATModernMenuEditingSheet *)self _selectNoneForTextElement:v7];
    }
    else {
      [(SCATModernMenuEditingSheet *)self _selectWordForTextElement:v7];
    }
  }
  else if ([v5 hasPrefix:@"move_"])
  {
    v15 = [v5 substringWithRange:objc_msgSend(@"move_", "length"), 1];
    id v16 = [v15 integerValue];

    uint64_t v17 = [v5 substringWithRange:(char *)objc_msgSend(@"move_", "length") + 2, 1];
    id v18 = [v17 integerValue];

    [(SCATModernMenuEditingSheet *)self _moveCursorForTextElement:v7 direction:v16 unit:v18];
  }
  else if ([v5 isEqualToString:@"selection_mode_toggle"])
  {
    [(SCATModernMenuEditingSheet *)self setSelectionModeOn:[(SCATModernMenuEditingSheet *)self selectionModeOn] ^ 1];
    if ([(SCATModernMenuEditingSheet *)self selectionModeOn])
    {
      v19 = [(SCATModernMenuSheet *)self menu];
      v20 = [v19 textElement];
      id v21 = [v20 selectedTextRange];
      -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", v21, v22);

      if ([(SCATModernMenuEditingSheet *)self startingRangeForSelection] == (id)0x7FFFFFFF) {
        -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", 0, 0);
      }
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)SCATModernMenuEditingSheet;
    [(SCATModernMenuSheet *)&v23 menuItemWasActivated:v4];
  }
LABEL_6:
}

- (BOOL)_adjustSelectionForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5 selectedRange:(_NSRange)a6 startingRangeForSelection:(_NSRange)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  if (a7.location == 0x7FFFFFFF) {
    _AXAssert();
  }
  if (location + length > a7.location) {
    location += length;
  }
  id v12 = [v11 uiElement];
  id v13 = objc_msgSend(v12, "nextCursorRangeInDirection:unit:outputRange:currentCursorRange:", a4, a5, 0, location, 0);
  uint64_t v15 = v14;

  if (v13 != (id)0x7FFFFFFF)
  {
    NSUInteger v16 = (NSUInteger)v13 + v15 - a7.location;
    if ((unint64_t)v13 >= a7.location) {
      NSUInteger v17 = a7.location;
    }
    else {
      NSUInteger v17 = (NSUInteger)v13;
    }
    if ((unint64_t)v13 >= a7.location) {
      NSUInteger v18 = v16;
    }
    else {
      NSUInteger v18 = a7.location + a7.length - (void)v13;
    }
    [v11 performAction:2012 withValue:kAXTextOperationActionSelect];
    objc_msgSend(v11, "setSelectedTextRange:", v17, v18);
  }

  return v13 != (id)0x7FFFFFFF;
}

- (void)_moveCursorForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5
{
  id v18 = a3;
  if ([(SCATModernMenuEditingSheet *)self selectionModeOn])
  {
    if ([(SCATModernMenuEditingSheet *)self selectionModeOn])
    {
      id v8 = [v18 selectedTextRange];
      uint64_t v10 = v9;
      id v11 = [(SCATModernMenuEditingSheet *)self startingRangeForSelection];
      -[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:](self, "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:", v18, a4, a5, v8, v10, v11, v12);
    }
  }
  else
  {
    id v13 = [v18 uiElement];
    id v14 = [v13 nextCursorRangeInDirection:a4 unit:a5 outputRange:0];
    uint64_t v16 = v15;

    if (v14 != (id)0x7FFFFFFF) {
      objc_msgSend(v18, "setSelectedTextRange:", v14, v16);
    }
  }
  NSUInteger v17 = [(SCATModernMenuEditingSheet *)self selectWordOrNoneItem];
  [v17 updateItem];
}

- (void)_selectNoneForTextElement:(id)a3
{
  id v7 = a3;
  id v4 = [v7 selectedTextRange];
  if (v5)
  {
    id v6 = v4;
    if ([(SCATModernMenuEditingSheet *)self selectionModeOn]) {
      -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", v6, 0);
    }
    objc_msgSend(v7, "setSelectedTextRange:", v6, 0);
  }
}

- (void)_selectWordForTextElement:(id)a3
{
  id v6 = a3;
  unint64_t v4 = (unint64_t)[v6 traits];
  if ((kAXIsEditingTrait & v4) != 0) {
    id v5 = [v6 selectedTextRange];
  }
  else {
    id v5 = 0;
  }
  if (!-[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:](self, "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:", v6, 0, 1, v5, 0, v5, 0))-[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:](self, "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:", v6, 1, 1, v5, 0, v5, 0); {
}
  }

- (void)_handleCompletedCutCopyPasteOperationForTextElement:(id)a3
{
  if ([(SCATModernMenuEditingSheet *)self selectionModeOn])
  {
    [(SCATModernMenuEditingSheet *)self setSelectionModeOn:0];
    id v4 = [(SCATModernMenuEditingSheet *)self selectionModeToggleItem];
    [v4 updateItem];
  }
}

- (id)_identifierForTextMovementDirection:(unint64_t)a3 unit:(unint64_t)a4
{
  return +[NSString stringWithFormat:@"move_%lu_%lu", a3, a4];
}

- (BOOL)selectionModeOn
{
  return self->_selectionModeOn;
}

- (void)setSelectionModeOn:(BOOL)a3
{
  self->_selectionModeOn = a3;
}

- (_NSRange)startingRangeForSelection
{
  p_startingRangeForSelection = &self->_startingRangeForSelection;
  NSUInteger location = self->_startingRangeForSelection.location;
  NSUInteger length = p_startingRangeForSelection->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartingRangeForSelection:(_NSRange)a3
{
  self->_startingRangeForSelection = a3;
}

- (SCATModernMenuItem)selectionModeToggleItem
{
  return self->_selectionModeToggleItem;
}

- (void)setSelectionModeToggleItem:(id)a3
{
}

- (SCATModernMenuItem)selectWordOrNoneItem
{
  return self->_selectWordOrNoneItem;
}

- (void)setSelectWordOrNoneItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectWordOrNoneItem, 0);

  objc_storeStrong((id *)&self->_selectionModeToggleItem, 0);
}

@end