@interface EKEventPrivacyLevelInlineEditItem
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)isInline;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)shouldAppear;
- (double)footerHeightForWidth:(double)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)footerTitle;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)_switchChanged:(id)a3;
- (void)refreshFromCalendarItemAndStore;
@end

@implementation EKEventPrivacyLevelInlineEditItem

- (BOOL)isInline
{
  return 1;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 2;
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  id v3 = a3;
  v4 = [v3 source];
  v5 = [v4 constraints];
  char v6 = [v5 supportsPrivateEvents];

  uint64_t v7 = [v3 sharingStatus];
  if (v7 == 2) {
    return 0;
  }
  else {
    return v6;
  }
}

- (BOOL)shouldAppear
{
  v2 = [(EKEventEditItem *)self event];
  char v3 = [v2 allowsPrivacyLevelModifications];

  return v3;
}

- (void)refreshFromCalendarItemAndStore
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v3 = [(EKEventEditItem *)self event];
  uint64_t v4 = [v3 privacyLevel];

  self->_originalSwitchState = v4 != 0;
  self->_currentSwitchState = v4 != 0;
  v5 = (void *)kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_INFO))
  {
    char v6 = v5;
    uint64_t v7 = objc_opt_class();
    if (self->_currentSwitchState) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    int v10 = 138412546;
    v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    id v9 = v7;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "Refreshed [%@].  Original toggle state: [%@]", (uint8_t *)&v10, 0x16u);
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  [v5 addTarget:self action:sel__switchChanged_ forControlEvents:4096];
  [v5 setOn:self->_originalSwitchState];
  [(EKUITableViewCell *)v4 setAccessoryView:v5];
  char v6 = EventKitUIBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"Private" value:&stru_1F0CC2140 table:0];
  v8 = [(EKUITableViewCell *)v4 textLabel];
  [v8 setText:v7];

  return v4;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_currentSwitchState != self->_originalSwitchState)
  {
    if (self->_currentSwitchState)
    {
      uint64_t v4 = [(EKEventEditItem *)self event];
      id v5 = [v4 calendar];
      char v6 = [v5 source];
      uint64_t v7 = [v6 preferredEventPrivateValue];
    }
    else
    {
      uint64_t v7 = 0;
    }
    v8 = [(EKEventEditItem *)self event];
    [v8 setPrivacyLevel:v7];

    id v9 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      int v10 = v9;
      v11 = [(EKEventEditItem *)self event];
      __int16 v12 = [v11 privacyLevelString];
      v13 = [(EKEventEditItem *)self event];
      int v15 = 138412546;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_INFO, "Setting the event's privacy level to [%@].  Event: [%@]", (uint8_t *)&v15, 0x16u);
    }
    self->_originalSwitchState = self->_currentSwitchState;
  }
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  return 1;
}

- (double)footerHeightForWidth:(double)a3
{
  double result = *MEMORY[0x1E4FB2F28];
  if (!self->_currentSwitchState) {
    return 0.0;
  }
  return result;
}

- (id)footerTitle
{
  if (self->_currentSwitchState)
  {
    v2 = EventKitUIBundle();
    char v3 = [v2 localizedStringForKey:@"The title, location, and details of private events are not visible to others sharing this calendar.", &stru_1F0CC2140, 0 value table];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)_switchChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_currentSwitchState = [a3 isOn];
  [(EKCalendarItemEditItem *)self notifyDidStartEditing];
  [(EKCalendarItemEditItem *)self notifyDidEndEditing];
  uint64_t v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    char v6 = objc_opt_class();
    if (self->_currentSwitchState) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    id v8 = v6;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_INFO, "[%@] toggle switched to [%@].", (uint8_t *)&v9, 0x16u);
  }
}

@end