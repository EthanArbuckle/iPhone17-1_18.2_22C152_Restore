@interface EKCalendarAbstractSwitchEditItem
- (BOOL)allowEventAlerts;
- (BOOL)cellWrapsLongText;
- (BOOL)saveStateToCalendar:(id)a3;
- (BOOL)shouldHideSwitch;
- (BOOL)switchState;
- (BOOL)underlyingCalendarState;
- (NSMutableArray)cells;
- (UISwitch)toggleSwitch;
- (id)cell;
- (id)cellAccessibilityIdentifierText;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)cellText;
- (id)descriptionLabelText;
- (unint64_t)numberOfSubitems;
- (void)_switchStateChanged:(id)a3;
- (void)reset;
- (void)setAllowEventAlerts:(BOOL)a3;
- (void)setCalendar:(id)a3 store:(id)a4;
- (void)setCells:(id)a3;
- (void)setSwitchState:(BOOL)a3;
- (void)setToggleSwitch:(id)a3;
- (void)setUnderlyingCalendarState:(BOOL)a3;
@end

@implementation EKCalendarAbstractSwitchEditItem

- (void)setCalendar:(id)a3 store:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarAbstractSwitchEditItem;
  [(EKCalendarEditItem *)&v5 setCalendar:a3 store:a4];
  [(EKCalendarAbstractSwitchEditItem *)self setCells:0];
}

- (void)reset
{
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = 0;

  cells = self->_cells;
  self->_cells = 0;
}

- (void)_switchStateChanged:(id)a3
{
  -[EKCalendarAbstractSwitchEditItem setSwitchState:](self, "setSwitchState:", [a3 isOn]);
  v4 = [(EKCalendarEditItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKCalendarEditItem *)self delegate];
    [v6 calendarItemStartedEditing:self];
  }
}

- (id)cell
{
  [(EKCalendarAbstractSwitchEditItem *)self setSwitchState:[(EKCalendarAbstractSwitchEditItem *)self underlyingCalendarState]];
  v3 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
  v4 = NSString;
  char v5 = [(EKCalendarAbstractSwitchEditItem *)self cellAccessibilityIdentifierText];
  id v6 = [v4 stringWithFormat:@"calendar-switch-cell:%@", v5];
  [(EKUITableViewCell *)v3 setAccessibilityIdentifier:v6];

  LODWORD(v6) = [(EKCalendarAbstractSwitchEditItem *)self cellWrapsLongText];
  v7 = [(EKCalendarAbstractSwitchEditItem *)self cellText];
  v8 = [(EKUITableViewCell *)v3 textLabel];
  [v8 setText:v7];

  v9 = [(EKUITableViewCell *)v3 textLabel];
  [v9 setNumberOfLines:v6 ^ 1];

  [(EKUITableViewCell *)v3 setSelectionStyle:0];
  if (![(EKCalendarAbstractSwitchEditItem *)self shouldHideSwitch])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v10 addTarget:self action:sel__switchStateChanged_ forControlEvents:4096];
    objc_msgSend(v10, "setOn:animated:", -[EKCalendarAbstractSwitchEditItem switchState](self, "switchState"), 0);
    v11 = NSString;
    v12 = [(EKCalendarAbstractSwitchEditItem *)self cellAccessibilityIdentifierText];
    v13 = [v11 stringWithFormat:@"calendar-switch:%@", v12];
    [v10 setAccessibilityIdentifier:v13];

    [(EKUITableViewCell *)v3 setAccessoryView:v10];
  }

  return v3;
}

- (NSMutableArray)cells
{
  cells = self->_cells;
  if (!cells)
  {
    v4 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    char v5 = self->_cells;
    self->_cells = v4;

    id v6 = self->_cells;
    v7 = [(EKCalendarAbstractSwitchEditItem *)self cell];
    [(NSMutableArray *)v6 addObject:v7];

    cells = self->_cells;
  }

  return cells;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v4 = [(EKCalendarAbstractSwitchEditItem *)self cells];
  char v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (unint64_t)numberOfSubitems
{
  v2 = [(EKCalendarAbstractSwitchEditItem *)self cells];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  BOOL v4 = [(EKCalendarAbstractSwitchEditItem *)self switchState];
  BOOL v5 = v4 ^ [(EKCalendarAbstractSwitchEditItem *)self underlyingCalendarState];
  if (v5) {
    [(EKCalendarAbstractSwitchEditItem *)self setUnderlyingCalendarState:v4];
  }
  return v5;
}

- (id)cellText
{
  return 0;
}

- (id)cellAccessibilityIdentifierText
{
  return 0;
}

- (id)descriptionLabelText
{
  return 0;
}

- (BOOL)cellWrapsLongText
{
  return 0;
}

- (BOOL)shouldHideSwitch
{
  return 0;
}

- (BOOL)underlyingCalendarState
{
  return self->_underlyingCalendarState;
}

- (void)setUnderlyingCalendarState:(BOOL)a3
{
  self->_underlyingCalendarState = a3;
}

- (BOOL)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(BOOL)a3
{
  self->_switchState = a3;
}

- (BOOL)allowEventAlerts
{
  return self->_allowEventAlerts;
}

- (void)setAllowEventAlerts:(BOOL)a3
{
  self->_allowEventAlerts = a3;
}

- (void)setCells:(id)a3
{
}

- (UISwitch)toggleSwitch
{
  return self->_toggleSwitch;
}

- (void)setToggleSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleSwitch, 0);
  objc_storeStrong((id *)&self->_cells, 0);

  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end