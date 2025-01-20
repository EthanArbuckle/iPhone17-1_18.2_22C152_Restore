id sub_6014(uint64_t a1, void *a2)
{
  void (**v3)(id, void *, void);
  void *v4;
  void *v5;
  uint64_t vars8;

  v3 = a2;
  v4 = +[NSProgress progressWithTotalUnitCount:1];
  [v4 setCompletedUnitCount:1];
  v5 = [*(id *)(a1 + 32) exportToICS];
  v3[2](v3, v5, 0);

  return v4;
}

id sub_60AC(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = +[NSProgress progressWithTotalUnitCount:1];
  [v4 setCompletedUnitCount:1];
  v5 = [*(id *)(a1 + 32) exportToICS];
  v3[2](v3, v5, 0);

  return v4;
}

id sub_6144(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.calendar.continuity.event_selection"];
  id v5 = [objc_alloc((Class)CUIKUserActivityCalendarEvent) initWithEvent:*(void *)(a1 + 32) view:0];
  [v5 updateActivity:v4];
  v6 = [v4 loadDataWithTypeIdentifier:kUINSUserActivityInternalType forItemProviderCompletionHandler:v3];

  return v6;
}

id sub_61F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSProgress progressWithTotalUnitCount:1];
  [v4 setCompletedUnitCount:1];
  id v5 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  v3[2](v3, v5, 0);

  return v4;
}

id sub_6294(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSProgress progressWithTotalUnitCount:1];
  [v4 setCompletedUnitCount:1];
  id v5 = [*(id *)(a1 + 32) dataUsingEncoding:10];
  v3[2](v3, v5, 0);

  return v4;
}

uint64_t CUIKGetOverlayCalendar()
{
  return _CUIKGetOverlayCalendar();
}

uint64_t CUIKInvalidateToday()
{
  return _CUIKInvalidateToday();
}

uint64_t CUIKLongDayLongMonthStringForDate()
{
  return _CUIKLongDayLongMonthStringForDate();
}

uint64_t CUIKStringForDateAndDayOfWeekInCalendarTimezone()
{
  return _CUIKStringForDateAndDayOfWeekInCalendarTimezone();
}

uint64_t CUIKStringForSystemTime()
{
  return _CUIKStringForSystemTime();
}

uint64_t CalAbsoluteTimeAddGregorianUnits()
{
  return _CalAbsoluteTimeAddGregorianUnits();
}

uint64_t CalCeilToScreenScale()
{
  return _CalCeilToScreenScale();
}

uint64_t CalCopyTimeZone()
{
  return _CalCopyTimeZone();
}

uint64_t CalOnePixelInPoints()
{
  return _CalOnePixelInPoints();
}

uint64_t CalRoundToScreenScale()
{
  return _CalRoundToScreenScale();
}

void NSLog(NSString *format, ...)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__buildEvents(void *a1, const char *a2, ...)
{
  return [a1 _buildEvents];
}

id objc_msgSend__buildSections(void *a1, const char *a2, ...)
{
  return [a1 _buildSections];
}

id objc_msgSend__createSeparators(void *a1, const char *a2, ...)
{
  return [a1 _createSeparators];
}

id objc_msgSend__primaryFont(void *a1, const char *a2, ...)
{
  return [a1 _primaryFont];
}

id objc_msgSend__setUpBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _setUpBackgroundView];
}

id objc_msgSend_alerts(void *a1, const char *a2, ...)
{
  return [a1 alerts];
}

id objc_msgSend_allDay(void *a1, const char *a2, ...)
{
  return [a1 allDay];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attendees(void *a1, const char *a2, ...)
{
  return [a1 attendees];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calTextLabel(void *a1, const char *a2, ...)
{
  return [a1 calTextLabel];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_calendarDateForDay(void *a1, const char *a2, ...)
{
  return [a1 calendarDateForDay];
}

id objc_msgSend_calendarId(void *a1, const char *a2, ...)
{
  return [a1 calendarId];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_closeEventStore(void *a1, const char *a2, ...)
{
  return [a1 closeEventStore];
}

id objc_msgSend_confirmationOptions(void *a1, const char *a2, ...)
{
  return [a1 confirmationOptions];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCalendarForNewEvents(void *a1, const char *a2, ...)
{
  return [a1 defaultCalendarForNewEvents];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_disambiguationItem(void *a1, const char *a2, ...)
{
  return [a1 disambiguationItem];
}

id objc_msgSend_displayText(void *a1, const char *a2, ...)
{
  return [a1 displayText];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_enableDragAndDrop(void *a1, const char *a2, ...)
{
  return [a1 enableDragAndDrop];
}

id objc_msgSend_endCount(void *a1, const char *a2, ...)
{
  return [a1 endCount];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_eventStore(void *a1, const char *a2, ...)
{
  return [a1 eventStore];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_exportToICS(void *a1, const char *a2, ...)
{
  return [a1 exportToICS];
}

id objc_msgSend_externalURL(void *a1, const char *a2, ...)
{
  return [a1 externalURL];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_headerHeight(void *a1, const char *a2, ...)
{
  return [a1 headerHeight];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return [a1 isAllDay];
}

id objc_msgSend_isDefaultSchedulingCalendar(void *a1, const char *a2, ...)
{
  return [a1 isDefaultSchedulingCalendar];
}

id objc_msgSend_isDraft(void *a1, const char *a2, ...)
{
  return [a1 isDraft];
}

id objc_msgSend_isManaged(void *a1, const char *a2, ...)
{
  return [a1 isManaged];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_notes(void *a1, const char *a2, ...)
{
  return [a1 notes];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_openEventStore(void *a1, const char *a2, ...)
{
  return [a1 openEventStore];
}

id objc_msgSend_overlayLabel(void *a1, const char *a2, ...)
{
  return [a1 overlayLabel];
}

id objc_msgSend_recurrences(void *a1, const char *a2, ...)
{
  return [a1 recurrences];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_requiresOutgoingInvitationsInDefaultCalendar(void *a1, const char *a2, ...)
{
  return [a1 requiresOutgoingInvitationsInDefaultCalendar];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_sharedGenerator(void *a1, const char *a2, ...)
{
  return [a1 sharedGenerator];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return [a1 snippet];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startCalendarDate(void *a1, const char *a2, ...)
{
  return [a1 startCalendarDate];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_supportsOutgoingInvitations(void *a1, const char *a2, ...)
{
  return [a1 supportsOutgoingInvitations];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}