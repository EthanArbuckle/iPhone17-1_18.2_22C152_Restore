@interface EKEventURLInlineEditItem
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)isInline;
- (BOOL)isSaveable;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)searchStringForEventAutocomplete;
- (void)_setTokenized:(BOOL)a3;
- (void)refreshFromCalendarItemAndStore;
- (void)reset;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation EKEventURLInlineEditItem

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  v3 = [a3 source];
  v4 = [v3 constraints];
  char v5 = [v4 supportsURLField];

  return v5;
}

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    char v5 = [[EKUITableViewCell alloc] initWithStyle:1000 reuseIdentifier:0];
    v6 = self->_cell;
    self->_cell = &v5->super;

    [(UITableViewCell *)self->_cell setSelectionStyle:0];
    [(UITableViewCell *)self->_cell setTextFieldOffset:0.0];
    v7 = [(UITableViewCell *)self->_cell editableTextField];
    [v7 setDelegate:self];

    v8 = EventKitUIBundle();
    v9 = [v8 localizedStringForKey:@"URL" value:&stru_1F0CC2140 table:0];
    v10 = [(UITableViewCell *)self->_cell editableTextField];
    [v10 setPlaceholder:v9];

    v11 = [MEMORY[0x1E4FB1618] clearColor];
    v12 = [(UITableViewCell *)self->_cell editableTextField];
    [v12 setBackgroundColor:v11];

    v13 = [(UITableViewCell *)self->_cell editableTextField];
    [v13 setClearButtonMode:1];

    v14 = [(UITableViewCell *)self->_cell editableTextField];
    [v14 setKeyboardType:3];

    v15 = [(UITableViewCell *)self->_cell editableTextField];
    [v15 setAutocorrectionType:1];

    v16 = [(UITableViewCell *)self->_cell editableTextField];
    [v16 setAutocapitalizationType:0];

    v17 = [(UITableViewCell *)self->_cell editableTextField];
    [v17 setReturnKeyType:9];

    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v19 = [(UITableViewCell *)self->_cell editableTextField];
    [v19 setFont:v18];

    v20 = [MEMORY[0x1E4FB1618] labelColor];
    v21 = [(UITableViewCell *)self->_cell editableTextField];
    [v21 setTextColor:v20];

    v22 = [(UITableViewCell *)self->_cell editableTextField];
    CalDisableFocusRingForView();

    [(EKEventURLInlineEditItem *)self refreshFromCalendarItemAndStore];
    cell = self->_cell;
  }

  return cell;
}

- (BOOL)isInline
{
  return 1;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  cell = self->_cell;
  if (cell && !self->_tokenized)
  {
    char v5 = [(UITableViewCell *)cell editableTextField];
    v6 = [v5 text];

    v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "_lp_URLWithUserTypedString:relativeToURL:", v6, 0);
    if (!v7)
    {
      v8 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "Failed to create NSURL from user-entered URL %@. This data will not be saved.", (uint8_t *)&v11, 0xCu);
      }
    }
    v9 = [(EKEventEditItem *)self event];
    [v9 setURL:v7];
  }
  self->_hasChanges = 0;
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  return 1;
}

- (void)refreshFromCalendarItemAndStore
{
  v16.receiver = self;
  v16.super_class = (Class)EKEventURLInlineEditItem;
  [(EKCalendarItemEditItem *)&v16 refreshFromCalendarItemAndStore];
  v3 = [(EKEventEditItem *)self event];
  v4 = [v3 URL];

  char v5 = [v4 scheme];
  v6 = [v4 absoluteString];
  if (v5)
  {
    uint64_t v7 = [v5 caseInsensitiveCompare:@"message"];
    uint64_t v8 = [v5 caseInsensitiveCompare:@"sms"];
    int v9 = objc_msgSend(v6, "cal_isWalletURL");
    if (!v7)
    {
      v10 = EventKitUIBundle();
      int v11 = v10;
      v12 = @"Show in Mail";
      goto LABEL_9;
    }
    if (!v8)
    {
      v10 = EventKitUIBundle();
      int v11 = v10;
      v12 = @"Show in Messages";
      goto LABEL_9;
    }
    if (v9)
    {
      v10 = EventKitUIBundle();
      int v11 = v10;
      v12 = @"Show in Wallet";
LABEL_9:
      uint64_t v13 = [v10 localizedStringForKey:v12 value:&stru_1F0CC2140 table:0];

      uint64_t v14 = 1;
      goto LABEL_10;
    }
  }
  uint64_t v13 = [v4 absoluteString];
  uint64_t v14 = 0;
LABEL_10:
  v15 = [(UITableViewCell *)self->_cell editableTextField];
  [v15 setText:v13];

  [(EKEventURLInlineEditItem *)self _setTokenized:v14];
}

- (void)_setTokenized:(BOOL)a3
{
  if (self->_tokenized != a3)
  {
    BOOL v3 = a3;
    self->_tokenized = a3;
    char v5 = [(UITableViewCell *)self->_cell editableTextField];
    v6 = v5;
    if (v3)
    {
      [v5 setClearButtonMode:3];

      [(UITableViewCell *)self->_cell tintColor];
    }
    else
    {
      [v5 setClearButtonMode:1];

      [MEMORY[0x1E4FB1618] labelColor];
    }
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [(UITableViewCell *)self->_cell editableTextField];
    [v7 setTextColor:v8];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !self->_tokenized;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  self->_hasChanges = 1;
  [(EKEventURLInlineEditItem *)self _setTokenized:0];
  [(EKCalendarItemEditItem *)self notifyTextChanged];
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(EKCalendarItemEditItem *)self setSelectedResponder:a3];

  [(EKCalendarItemEditItem *)self notifyDidStartEditing];
}

- (void)textFieldDidEndEditing:(id)a3
{
  [(EKCalendarItemEditItem *)self notifyDidEndEditing];

  [(EKCalendarItemEditItem *)self setSelectedResponder:0];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  self->_hasChanges = 1;
  [(EKCalendarItemEditItem *)self notifyTextChanged];
  return 1;
}

- (BOOL)isSaveable
{
  return self->_hasChanges;
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void).cxx_destruct
{
}

@end