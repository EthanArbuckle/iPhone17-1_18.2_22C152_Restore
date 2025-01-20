@interface CalDAVRecurrenceSplitAction
- (BOOL)isAllDay;
- (BOOL)isFloating;
- (CalDAVRecurrenceSplitAction)initWithResourceURL:(id)a3 recurrenceDate:(id)a4 uidForCreatedSeries:(id)a5 floating:(BOOL)a6 allday:(BOOL)a7;
- (NSDate)recurrenceDate;
- (NSString)uidForCreatedSeries;
- (NSURL)resourceURL;
- (id)changeContext;
- (void)setChangeContext:(id)a3;
@end

@implementation CalDAVRecurrenceSplitAction

- (CalDAVRecurrenceSplitAction)initWithResourceURL:(id)a3 recurrenceDate:(id)a4 uidForCreatedSeries:(id)a5 floating:(BOOL)a6 allday:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CalDAVRecurrenceSplitAction;
  v16 = [(CalDAVRecurrenceSplitAction *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_resourceURL, a3);
    objc_storeStrong((id *)&v17->_recurrenceDate, a4);
    objc_storeStrong((id *)&v17->_uidForCreatedSeries, a5);
    v17->_isFloating = a6;
    v17->_isAllDay = a7;
  }

  return v17;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (NSDate)recurrenceDate
{
  return self->_recurrenceDate;
}

- (NSString)uidForCreatedSeries
{
  return self->_uidForCreatedSeries;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (id)changeContext
{
  return self->_changeContext;
}

- (void)setChangeContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeContext, 0);
  objc_storeStrong((id *)&self->_uidForCreatedSeries, 0);
  objc_storeStrong((id *)&self->_recurrenceDate, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end