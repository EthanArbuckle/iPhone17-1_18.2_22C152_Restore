@interface EKCalendarEditItem
- (BOOL)becomeFirstResponder;
- (BOOL)calendarEditor:(id)a3 shouldSelectSubitem:(unint64_t)a4;
- (BOOL)configureWithCalendar:(id)a3;
- (BOOL)configureWithCalendar:(id)a3 store:(id)a4;
- (BOOL)saveStateToCalendar:(id)a3;
- (EKCalendar)calendar;
- (EKCalendarEditItemDelegate)delegate;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)footerTitle;
- (id)headerTitle;
- (unint64_t)numberOfSubitems;
- (void)setCalendar:(id)a3 store:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EKCalendarEditItem

- (void)setCalendar:(id)a3 store:(id)a4
{
  v9 = (EKCalendar *)a3;
  v7 = (EKEventStore *)a4;
  if (self->_calendar != v9)
  {
    objc_storeStrong((id *)&self->_calendar, a3);
    if (!self->_calendar) {
      [(EKCalendarEditItem *)self reset];
    }
  }
  store = self->_store;
  self->_store = v7;
}

- (BOOL)configureWithCalendar:(id)a3
{
  return 1;
}

- (BOOL)configureWithCalendar:(id)a3 store:(id)a4
{
  v6 = (EKCalendar *)a3;
  v7 = (EKEventStore *)a4;
  calendar = self->_calendar;
  self->_calendar = v6;
  v9 = v6;

  store = self->_store;
  self->_store = v7;

  LOBYTE(v7) = [(EKCalendarEditItem *)self configureWithCalendar:v9];
  return (char)v7;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (id)headerTitle
{
  return 0;
}

- (id)footerTitle
{
  return 0;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  return -1.0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)calendarEditor:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (EKCalendarEditItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKCalendarEditItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end