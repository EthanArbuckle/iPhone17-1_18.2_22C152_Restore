@interface EventKitTCCUIFactory
- (EventKitTCCUIFactory)initWithBundleIdentifier:(id)a3;
- (id)previewTableView;
- (id)previewViewController;
- (id)settingsPreviewViewController;
- (id)settingsViewSubtitle;
- (int)countEventsInTheNextYear;
@end

@implementation EventKitTCCUIFactory

- (EventKitTCCUIFactory)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EventKitTCCUIFactory;
  v5 = [(EventKitTCCUIFactory *)&v18 init];
  uint64_t v6 = [objc_alloc(MEMORY[0x263F04B98]) initWithEKOptions:132];
  eventStore = v5->_eventStore;
  v5->_eventStore = (EKEventStore *)v6;

  if (v4) {
    [(EKEventStore *)v5->_eventStore setSourceAccountManagement:0 withBundleID:v4];
  }
  uint64_t v8 = [(EKEventStore *)v5->_eventStore calendarsForEntityType:0];
  allCalendars = v5->_allCalendars;
  v5->_allCalendars = (NSArray *)v8;

  v10 = [(EKEventStore *)v5->_eventStore nextEventsWithCalendars:0 limit:1 exclusionOptions:13];
  v11 = [v10 firstObject];

  if (!v11)
  {
    v12 = logHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[EventKitTCCUIFactory initWithBundleIdentifier:](v12);
    }

    v13 = [(EKEventStore *)v5->_eventStore nextEventsWithCalendars:0 limit:1 exclusionOptions:12];
    v11 = [v13 firstObject];

    if (!v11)
    {
      v14 = logHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[EventKitTCCUIFactory initWithBundleIdentifier:](v14);
      }

      v11 = 0;
    }
  }
  v15 = [[_TtC13EventKitTCCUI19EventPreviewWrapper alloc] initWithEvent:v11];
  previewWrapper = v5->_previewWrapper;
  v5->_previewWrapper = v15;

  return v5;
}

- (id)previewViewController
{
  return [(EventPreviewWrapper *)self->_previewWrapper getPreviewControllerForPrompt:1];
}

- (id)settingsPreviewViewController
{
  return [(EventPreviewWrapper *)self->_previewWrapper getPreviewControllerForPrompt:0];
}

- (int)countEventsInTheNextYear
{
  v3 = [MEMORY[0x263EFF910] CalDateForBeginningOfToday];
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  v5 = [v3 dateByAddingYears:1 inCalendar:v4];

  LODWORD(self) = [(EKEventStore *)self->_eventStore countOfEventsFromStartDate:v3 toEndDate:v5];
  return (int)self;
}

- (id)settingsViewSubtitle
{
  v3 = NSString;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"x_calendars_x_events" value:&stru_26FF80D30 table:0];
  uint64_t v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, -[NSArray count](self->_allCalendars, "count"), -[EventKitTCCUIFactory countEventsInTheNextYear](self, "countEventsInTheNextYear"));

  return v6;
}

- (id)previewTableView
{
  v2 = [(EventKitTCCUIFactory *)self settingsPreviewViewController];
  v3 = [v2 view];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewWrapper, 0);
  objc_storeStrong((id *)&self->_allCalendars, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)initWithBundleIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24D29C000, log, OS_LOG_TYPE_DEBUG, "Couldn't find any event in the next year to show in the preview.", v1, 2u);
}

- (void)initWithBundleIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24D29C000, log, OS_LOG_TYPE_DEBUG, "Couldn't find a timed event. Looking for all-day event instead.", v1, 2u);
}

@end