@interface TTRComplicationReminder
- (NSDate)creationDate;
- (NSString)title;
- (TTRComplicationReminder)initWithCreationDate:(id)a3 dueDate:(id)a4 title:(id)a5;
- (TTRComplicationReminderDueDate)dueDate;
- (id)debugDescription;
- (id)makeDueTimeTextProviderUsingCalendar:(id)a3 dropMinutesForRoundHours:(BOOL)a4;
- (id)makeTitleAndExactDueDateTextProviderUsingCalendar:(id)a3 dropMinutesForRoundHours:(BOOL)a4;
- (id)makeTitleTextProvider;
@end

@implementation TTRComplicationReminder

- (id)makeDueTimeTextProviderUsingCalendar:(id)a3 dropMinutesForRoundHours:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(TTRComplicationReminder *)self dueDate];
  v8 = [v7 date];
  v9 = +[CLKTimeTextProvider textProviderWithDate:v8];

  [v9 setPrefersDesignatorToMinutes:1];
  if (v4)
  {
    v10 = [v9 date];
    objc_msgSend(v9, "setDisallowBothMinutesAndDesignator:", objc_msgSend(v6, "ttr_isDateAtARoundHour:", v10));
  }

  return v9;
}

- (id)makeTitleTextProvider
{
  uint64_t v2 = [(TTRComplicationReminder *)self title];
  v3 = (void *)v2;
  if (v2) {
    CFStringRef v4 = (const __CFString *)v2;
  }
  else {
    CFStringRef v4 = &stru_10780;
  }
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];

  return v5;
}

- (id)makeTitleAndExactDueDateTextProviderUsingCalendar:(id)a3 dropMinutesForRoundHours:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(TTRComplicationReminder *)self dueDate];
  v8 = (char *)[v7 precision];

  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    v9 = [(TTRComplicationReminder *)self makeDueTimeTextProviderUsingCalendar:v6 dropMinutesForRoundHours:v4];
    v10 = [(TTRComplicationReminder *)self makeTitleTextProvider];
    v11 = RemindersUICoreBundleGet();
    v12 = [v11 localizedStringForKey:@"%@ %@" value:@"%@ %@" table:@"Localizable"];
    uint64_t v4 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v12, v9, v10);
  }
  else if (!v8)
  {
    uint64_t v4 = [(TTRComplicationReminder *)self makeTitleTextProvider];
  }

  return (id)v4;
}

- (TTRComplicationReminder)initWithCreationDate:(id)a3 dueDate:(id)a4 title:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TTRComplicationReminder;
  v11 = [(TTRComplicationReminder *)&v17 init];
  if (v11)
  {
    v12 = (NSDate *)[v8 copy];
    creationDate = v11->_creationDate;
    v11->_creationDate = v12;

    objc_storeStrong((id *)&v11->_dueDate, a4);
    v14 = (NSString *)[v10 copy];
    title = v11->_title;
    v11->_title = v14;
  }
  return v11;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(TTRComplicationReminder *)self title];
  v5 = [(TTRComplicationReminder *)self creationDate];
  id v6 = [(TTRComplicationReminder *)self dueDate];
  v7 = +[NSString stringWithFormat:@"<%@ %p: title=\"%@\", creationDate=%@, dueDate=%@>", v3, self, v4, v5, v6];

  return v7;
}

- (TTRComplicationReminderDueDate)dueDate
{
  return self->_dueDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end