@interface EKCalendarAccountEditItem
- (BOOL)calendarEditor:(id)a3 shouldSelectSubitem:(unint64_t)a4;
- (BOOL)canAddCalendarToMoreThanOneAccount;
- (BOOL)editable;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)currentSource;
- (id)initLimitedToSource:(id)a3;
- (void)accountTableViewController:(id)a3 selectedSourceChanged:(id)a4;
- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)setEditable:(BOOL)a3;
@end

@implementation EKCalendarAccountEditItem

- (id)initLimitedToSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKCalendarAccountEditItem;
  v6 = [(EKCalendarAccountEditItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_limitedToSource, a3);
  }

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"EKCalendarAccountEditItem"];
  id v5 = EventKitUIBundle();
  v6 = [v5 localizedStringForKey:@"Account" value:&stru_1F0CC2140 table:0];
  v7 = [v4 textLabel];
  [v7 setText:v6];

  [v4 setAccessibilityIdentifier:@"calendar-account-cell"];
  v8 = [(EKCalendarAccountEditItem *)self currentSource];
  objc_super v9 = CalDisplayedTitleForSourceAsCalendarTarget(v8);
  v10 = [v4 detailTextLabel];
  [v10 setText:v9];

  v11 = [v4 detailTextLabel];
  [v11 setAccessibilityIdentifier:@"calendar-current-selected-account"];

  if ([(EKCalendarAccountEditItem *)self canAddCalendarToMoreThanOneAccount]
    && [(EKCalendarAccountEditItem *)self editable])
  {
    [v4 setAccessoryType:1];
  }
  else
  {
    [v4 setSelectionStyle:0];
  }

  return v4;
}

- (BOOL)canAddCalendarToMoreThanOneAccount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(EKCalendarEditItem *)self delegate];
  if (![v3 isNewCalendar])
  {

    return 0;
  }
  limitedToSource = self->_limitedToSource;

  if (limitedToSource) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(EKEventStore *)self->super._store sources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if ([(EKCalendar *)self->super._calendar isSubscribed])
      {
        if ([v11 isDelegate]) {
          continue;
        }
        v12 = [v11 constraints];
        if ([v12 supportsSubscribedCalendars])
        {
        }
        else
        {
          uint64_t v13 = [v11 sourceType];

          if (v13 != 4) {
            continue;
          }
        }
        ++v8;
      }
      else if ([v11 supportsCalendarCreation])
      {
        if ([v11 sourceType] != 4) {
          v8 += [v11 isDelegate] ^ 1;
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v7);
LABEL_23:

  return v8 > 1;
}

- (id)currentSource
{
  v3 = [(EKCalendar *)self->super._calendar source];

  if (!v3)
  {
    v4 = +[EKCalendarEditor fetchInitialSourceWithLimitedToSource:self->_limitedToSource calendar:self->super._calendar store:self->super._store];
    [(EKCalendar *)self->super._calendar setSource:v4];
    -[EKCalendar setDisplayOrder:](self->super._calendar, "setDisplayOrder:", [v4 displayOrderForNewCalendar]);
  }
  calendar = self->super._calendar;

  return [(EKCalendar *)calendar source];
}

- (BOOL)calendarEditor:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  BOOL v5 = [(EKCalendarAccountEditItem *)self canAddCalendarToMoreThanOneAccount];
  if (v5)
  {
    LOBYTE(v5) = [(EKCalendarAccountEditItem *)self editable];
  }
  return v5;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  if ([(EKCalendarAccountEditItem *)self canAddCalendarToMoreThanOneAccount])
  {
    uint64_t v9 = [[EKCalendarAccountTableViewController alloc] initWithCalendar:self->super._calendar andStore:self->super._store];
    [(EKCalendarAccountTableViewController *)v9 setDelegate:self];
    BOOL v5 = [(EKCalendarAccountEditItem *)self currentSource];
    uint64_t v6 = [v5 sourceIdentifier];
    [(EKCalendarAccountTableViewController *)v9 setCurrentSourceIdentifier:v6];

    uint64_t v7 = [(EKCalendarEditItem *)self delegate];
    uint64_t v8 = [v7 owningNavigationController];
    [v8 pushViewController:v9 animated:1];
  }
}

- (void)accountTableViewController:(id)a3 selectedSourceChanged:(id)a4
{
  id v8 = a4;
  BOOL v5 = [(EKCalendarEditItem *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(EKCalendarEditItem *)self delegate];
    [v7 accountEditItem:self selectedSourceChanged:v8];
  }
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
}

@end