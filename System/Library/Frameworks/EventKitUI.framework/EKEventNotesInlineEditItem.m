@interface EKEventNotesInlineEditItem
- (BOOL)isInline;
- (BOOL)isSaveable;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)searchStringForEventAutocomplete;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)reset;
- (void)tableViewDidScroll;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation EKEventNotesInlineEditItem

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:183.0];
  return result;
}

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
}

- (BOOL)isInline
{
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[CalendarNotesCell alloc] initWithStyle:0 reuseIdentifier:0];
    v6 = self->_cell;
    self->_cell = v5;

    v7 = EventKitUIBundle();
    v8 = [v7 localizedStringForKey:@"Notes" value:&stru_1F0CC2140 table:0];
    [(CalendarNotesCell *)self->_cell setPlaceholder:v8];

    v9 = [(EKEventEditItem *)self event];
    v10 = [v9 displayNotes];

    v11 = [(EKEventEditItem *)self event];
    v12 = [v11 calendar];
    if ([v12 type] == 2)
    {
      int HasInlineExchangeAttachments = CUIKNotesFieldHasInlineExchangeAttachments();

      if (!HasInlineExchangeAttachments)
      {
LABEL_7:
        v15 = [(CalendarNotesCell *)self->_cell textView];
        [v15 setText:v10];

        v16 = [(CalendarNotesCell *)self->_cell textView];
        [v16 setDelegate:self];

        v17 = [(CalendarNotesCell *)self->_cell textView];
        CalDisableFocusRingForView();

        v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v18 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
        [v18 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

        cell = self->_cell;
        goto LABEL_8;
      }
      v14 = [(CalendarNotesCell *)self->_cell textView];
      [v14 setEditable:0];

      CUIKStripInlineExchangeAttachmentsFromNotes();
      v10 = v11 = v10;
    }
    else
    {
    }
    goto LABEL_7;
  }
LABEL_8:

  return cell;
}

- (void)_keyboardWillShow:(id)a3
{
  p_keyboardRect = &self->_keyboardRect;
  id v9 = [a3 userInfo];
  id v4 = [v9 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  p_keyboardRect->origin.x = v5;
  p_keyboardRect->origin.y = v6;
  p_keyboardRect->size.width = v7;
  p_keyboardRect->size.height = v8;
}

- (void)_keyboardWillHide:(id)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_keyboardRect.size = v4;
  CGFloat v5 = [(CalendarNotesCell *)self->_cell textView];
  [v5 contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CalendarNotesCell *)self->_cell textView];
  objc_msgSend(v12, "setContentInset:", v7, v9, 0.0, v11);
}

- (void)tableViewDidScroll
{
  v3 = [(CalendarNotesCell *)self->_cell textView];
  int v4 = [v3 isEditing];

  if (v4)
  {
    CGFloat v5 = [(CalendarNotesCell *)self->_cell textView];
    [v5 contentInset];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    v14 = [(CalendarNotesCell *)self->_cell textView];
    v15 = [v14 window];
    v16 = [(CalendarNotesCell *)self->_cell textView];
    objc_msgSend(v15, "convertRect:toView:", v16, self->_keyboardRect.origin.x, self->_keyboardRect.origin.y, self->_keyboardRect.size.width, self->_keyboardRect.size.height);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v25 = [(CalendarNotesCell *)self->_cell textView];
    [v25 bounds];
    v35.origin.CGFloat x = v18;
    v35.origin.CGFloat y = v20;
    v35.size.CGFloat width = v22;
    v35.size.double height = v24;
    CGRect v33 = CGRectIntersection(v32, v35);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    double height = v33.size.height;

    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.double height = height;
    if (!CGRectIsEmpty(v34)) {
      double v11 = height;
    }
    id v30 = [(CalendarNotesCell *)self->_cell textView];
    objc_msgSend(v30, "setContentInset:", v7, v9, v11, v13);
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  cell = self->_cell;
  if (cell && self->_textViewDirty)
  {
    CGFloat v5 = [(CalendarNotesCell *)cell textView];
    double v6 = [v5 text];
    double v7 = [(EKEventEditItem *)self event];
    [v7 setDisplayNotes:v6];

    self->_textViewDirtCGFloat y = 0;
  }
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  return 1;
}

- (BOOL)isSaveable
{
  lastTextChange = self->_lastTextChange;
  v3 = [(EKEventEditItem *)self event];
  int v4 = [v3 displayNotes];
  LOBYTE(lastTextChange) = ![(NSString *)lastTextChange isEqualToString:v4];

  return (char)lastTextChange;
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void)textViewDidBeginEditing:(id)a3
{
  [(EKCalendarItemEditItem *)self setSelectedResponder:a3];

  [(EKCalendarItemEditItem *)self notifyDidStartEditing];
}

- (void)textViewDidEndEditing:(id)a3
{
  [(EKCalendarItemEditItem *)self notifyDidEndEditing];

  [(EKCalendarItemEditItem *)self setSelectedResponder:0];
}

- (void)textViewDidChange:(id)a3
{
  int v4 = [a3 text];
  lastTextChange = self->_lastTextChange;
  self->_lastTextChange = v4;

  self->_textViewDirtCGFloat y = 1;

  [(EKCalendarItemEditItem *)self notifyTextChanged];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTextChange, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end