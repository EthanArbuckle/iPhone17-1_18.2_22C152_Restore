@interface EKEventPrivacyLevelDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)_switchChanged:(id)a3;
- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5;
@end

@implementation EKEventPrivacyLevelDetailItem

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventPrivacyLevelDetailItem;
  [(EKEventDetailItem *)&v6 setEvent:a3 reminder:a4 store:a5];
  self->_switchStateIsOn = [(EKEvent *)self->super._event privacyLevel] != 0;
  -[UISwitch setOn:](self->_control, "setOn:");
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return [(EKEvent *)self->super._event allowsPrivacyLevelModifications];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if (!self->_cell)
  {
    v4 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    cell = self->_cell;
    self->_cell = &v4->super;

    objc_super v6 = EventKitUIBundle();
    v7 = [v6 localizedStringForKey:@"Private" value:&stru_1F0CC2140 table:0];
    v8 = [(UITableViewCell *)self->_cell textLabel];
    [v8 setText:v7];

    v9 = [MEMORY[0x1E4FB1618] labelColor];
    v10 = [(UITableViewCell *)self->_cell textLabel];
    [v10 setTextColor:v9];

    [(UITableViewCell *)self->_cell setSelectionStyle:0];
    v11 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    control = self->_control;
    self->_control = v11;

    [(UISwitch *)self->_control addTarget:self action:sel__switchChanged_ forControlEvents:4096];
    [(UITableViewCell *)self->_cell setAccessoryView:self->_control];
  }
  [(UISwitch *)self->_control setOn:self->_switchStateIsOn];
  v13 = self->_cell;

  return v13;
}

- (void)_switchChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 isOn];
  self->_switchStateIsOn = v4;
  if (v4)
  {
    v5 = [(EKEvent *)self->super._event calendar];
    objc_super v6 = [v5 source];
    uint64_t v7 = [v6 preferredEventPrivateValue];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(EKEvent *)self->super._event setPrivacyLevel:v7];
  v8 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    event = self->super._event;
    v10 = v8;
    v11 = [(EKEvent *)event privacyLevelString];
    v12 = self->super._event;
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_INFO, "Setting the event's privacy level to [%@].  Event: [%@]", (uint8_t *)&v13, 0x16u);
  }
  [(EKEventDetailItem *)self notifySubitemDidSave:0];
  [(EKEventDetailItem *)self editItemViewController:0 didCompleteWithAction:2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end