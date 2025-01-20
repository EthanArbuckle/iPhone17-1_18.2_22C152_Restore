@interface WKDateTimePicker
- (BOOL)shouldForceGregorianCalendar;
- (NSString)calendarType;
- (RetainPtr<NSDateFormatter>)dateFormatterForPicker;
- (RetainPtr<NSISO8601DateFormatter>)iso8601DateFormatterForCalendarView;
- (WKDatePickerPopoverController)datePickerController;
- (WKDateTimePicker)initWithView:(id)a3 inputType:(unsigned __int8)a4;
- (double)hour;
- (double)minute;
- (id).cxx_construct;
- (id)_sanitizeInputValueForFormatter:(id)a3;
- (id)controlView;
- (void)_dateChanged;
- (void)controlBeginEditing;
- (void)controlEndEditing;
- (void)datePickerPopoverControllerDidReset:(id)a3;
- (void)dealloc;
- (void)handleDatePickerPresentationDismissal;
- (void)removeDatePickerPresentation;
- (void)setDateTimePickerToInitialValue;
- (void)setHour:(int64_t)a3 minute:(int64_t)a4;
- (void)setWeekPickerToInitialValue;
- (void)showDateTimePicker;
- (void)weekOfYearSelection:(id)a3 didSelectWeekOfYear:(id)a4;
@end

@implementation WKDateTimePicker

- (WKDateTimePicker)initWithView:(id)a3 inputType:(unsigned __int8)a4
{
  int v4 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WKDateTimePicker;
  v6 = [(WKDateTimePicker *)&v23 init];
  v7 = v6;
  if (v6)
  {
    v6->_view = (WKContentView *)a3;
    [a3 lastInteractionLocation];
    v7->_interactionPoint.x = v8;
    v7->_interactionPoint.y = v9;
    int v10 = v4 - 11;
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = 1;
    v14 = @"yyyy-MM-dd";
    switch(v10)
    {
      case 0:
        goto LABEL_12;
      case 1:
        int v11 = 0;
        int v12 = 0;
        uint64_t v13 = 2;
        v14 = @"yyyy-MM-dd'T'HH:mm";
        goto LABEL_12;
      case 2:
        int v11 = 0;
        int v12 = 1;
        uint64_t v13 = 4269;
        v14 = @"yyyy-MM";
        goto LABEL_12;
      case 3:
        v7->_formatString = (NSString *)@"yyyy-'W'ww";
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4F427F8]) initWithDelegate:v7];
        m_ptr = v7->_selectionWeekOfYear.m_ptr;
        v7->_selectionWeekOfYear.m_ptr = (void *)v15;
        if (m_ptr) {
          CFRelease(m_ptr);
        }
        id v17 = objc_alloc_init(MEMORY[0x1E4F42800]);
        v18 = v7->_calendarView.m_ptr;
        v7->_calendarView.m_ptr = v17;
        if (v18)
        {
          CFRelease(v18);
          id v17 = v7->_calendarView.m_ptr;
        }
        objc_msgSend(v17, "setCalendar:", objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C328]));
        [v7->_calendarView.m_ptr setSelectionBehavior:v7->_selectionWeekOfYear.m_ptr];
        return v7;
      case 4:
        int v12 = 0;
        uint64_t v13 = 0;
        int v11 = 1;
        v14 = @"HH:mm";
LABEL_12:
        v7->_formatString = &v14->isa;
        id v19 = objc_alloc_init(MEMORY[0x1E4F42928]);
        v20 = v7->_datePicker.m_ptr;
        v7->_datePicker.m_ptr = v19;
        if (v20)
        {
          CFRelease(v20);
          id v19 = v7->_datePicker.m_ptr;
        }
        [v19 addTarget:v7 action:sel__dateChanged forControlEvents:4096];
        if ([(WKDateTimePicker *)v7 shouldForceGregorianCalendar]) {
          objc_msgSend(v7->_datePicker.m_ptr, "setCalendar:", objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C318]));
        }
        [v7->_datePicker.m_ptr setDatePickerMode:v13];
        if (v11 | v12) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = 3;
        }
        [v7->_datePicker.m_ptr setPreferredDatePickerStyle:v21];
        v7->_isDismissingDatePicker = 0;
        break;
      default:

        v7 = 0;
        break;
    }
  }
  return v7;
}

- (void)weekOfYearSelection:(id)a3 didSelectWeekOfYear:(id)a4
{
  id v4 = a3;
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_selectionWeekOfYear.m_ptr;
  self->_selectionWeekOfYear.m_ptr = v4;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    id v4 = self->_selectionWeekOfYear.m_ptr;
  }
  objc_msgSend(self->_calendarView.m_ptr, "setSelectionBehavior:", v4, a4);

  [(WKDateTimePicker *)self _dateChanged];
}

- (void)datePickerPopoverControllerDidReset:(id)a3
{
  [(WKDateTimePicker *)self setDateTimePickerToInitialValue];
  id v4 = [(WKContentView *)self->_view page];
  v5 = [(WKContentView *)self->_view focusedElementInformation];
  CGFloat v9 = 0;
  v10[0] = v5 + 16;
  uint64_t v6 = v4[32];
  v10[1] = &v9;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetFocusedElementValue>(v6, (uint64_t)v10, *(void *)(v4[4] + 1928), 0);
  CGFloat v8 = v9;
  CGFloat v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
}

- (void)handleDatePickerPresentationDismissal
{
  if (!self->_isDismissingDatePicker)
  {
    self->_isDismissingDatePicker = 1;
    [(WKContentView *)self->_view accessoryDone];
    self->_isDismissingDatePicker = 0;
  }
}

- (void)removeDatePickerPresentation
{
  m_ptr = self->_datePickerController.m_ptr;
  if (!m_ptr) {
    return;
  }
  if (self->_isDismissingDatePicker)
  {
    self->_datePickerController.m_ptr = 0;
LABEL_6:
    CFRelease(m_ptr);
    goto LABEL_7;
  }
  self->_isDismissingDatePicker = 1;
  [m_ptr dismissViewControllerAnimated:0 completion:0];
  self->_isDismissingDatePicker = 0;
  m_ptr = self->_datePickerController.m_ptr;
  self->_datePickerController.m_ptr = 0;
  if (m_ptr) {
    goto LABEL_6;
  }
LABEL_7:
  id v4 = [(WKContentView *)self->_view webView];

  [v4 _didDismissContextMenu];
}

- (WKDatePickerPopoverController)datePickerController
{
  return (WKDatePickerPopoverController *)self->_datePickerController.m_ptr;
}

- (void)showDateTimePicker
{
  int v3 = *(unsigned __int8 *)([(WKContentView *)self->_view focusedElementInformation] + 185);
  id v4 = [WKDatePickerPopoverController alloc];
  if (v3 == 14) {
    uint64_t v5 = [(WKDatePickerPopoverController *)v4 initWithCalendarView:self->_calendarView.m_ptr selectionWeekOfYear:self->_selectionWeekOfYear.m_ptr delegate:self];
  }
  else {
    uint64_t v5 = [(WKDatePickerPopoverController *)v4 initWithDatePicker:self->_datePicker.m_ptr delegate:self];
  }
  uint64_t v6 = (void *)v5;
  m_ptr = self->_datePickerController.m_ptr;
  self->_datePickerController.m_ptr = v6;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v6 = self->_datePickerController.m_ptr;
  }
  view = self->_view;
  [(WKContentView *)view focusedElementInformation];
  WebCore::IntRect::operator CGRect();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3321888768;
  v18[2] = __38__WKDateTimePicker_showDateTimePicker__block_invoke;
  v18[3] = &__block_descriptor_40_e8_32c51_ZTSKZ38__WKDateTimePicker_showDateTimePicker_E3__2_e5_v8__0l;
  CFRetain(self);
  CFTypeRef cf = self;
  CFRetain(self);
  objc_msgSend(v6, "presentInView:sourceRect:completion:", view, v18, v10, v12, v14, v16);
  CFRelease(self);
  CFTypeRef v17 = cf;
  CFTypeRef cf = 0;
  if (v17) {
    CFRelease(v17);
  }
}

uint64_t __38__WKDateTimePicker_showDateTimePicker__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) webView];

  return [v1 _didShowContextMenu];
}

- (BOOL)shouldForceGregorianCalendar
{
  return *(unsigned __int8 *)([(WKContentView *)self->_view focusedElementInformation]+ 296)- 29 < 3;
}

- (void)dealloc
{
  [(WKDateTimePicker *)self removeDatePickerPresentation];
  v3.receiver = self;
  v3.super_class = (Class)WKDateTimePicker;
  [(WKDateTimePicker *)&v3 dealloc];
}

- (id)_sanitizeInputValueForFormatter:(id)a3
{
  if (*(unsigned char *)([(WKContentView *)self->_view focusedElementInformation] + 185) == 15)
  {
    uint64_t v5 = [@"HH:mm" length];
    return (id)[a3 substringToIndex:v5];
  }
  else if (*(unsigned char *)([(WKContentView *)self->_view focusedElementInformation] + 185) == 12)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", @"T"), "objectAtIndex:", 1);
    uint64_t v8 = [v7 substringToIndex:objc_msgSend(@"HH:mm", "length")];
    return (id)[a3 stringByReplacingOccurrencesOfString:v7 withString:v8];
  }
  else
  {
    return a3;
  }
}

- (RetainPtr<NSISO8601DateFormatter>)iso8601DateFormatterForCalendarView
{
  objc_super v3 = v2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  *objc_super v3 = v4;
  objc_msgSend(v4, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "localTimeZone"));
  return (RetainPtr<NSISO8601DateFormatter>)[v4 setFormatOptions:261];
}

- (RetainPtr<NSDateFormatter>)dateFormatterForPicker
{
  id v4 = v2;
  uint64_t v5 = (const void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  *id v4 = v6;
  objc_msgSend(v6, "setTimeZone:", objc_msgSend(self->_datePicker.m_ptr, "timeZone"));
  [v6 setDateFormat:self->_formatString];
  v7.var0 = (void *)[v6 setLocale:v5];
  if (v5)
  {
    CFRelease(v5);
  }
  return v7;
}

- (void)_dateChanged
{
  if (*(unsigned char *)([(WKContentView *)self->_view focusedElementInformation] + 185) == 14)
  {
    [(WKDateTimePicker *)self iso8601DateFormatterForCalendarView];
    -[WKContentView updateFocusedElementValue:](self->_view, "updateFocusedElementValue:", objc_msgSend(cf, "stringFromDate:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C328]), "dateFromComponents:", objc_msgSend(self->_selectionWeekOfYear.m_ptr, "selectedWeekOfYear"))));
  }
  else
  {
    [(WKDateTimePicker *)self dateFormatterForPicker];
    -[WKContentView updateFocusedElementValue:](self->_view, "updateFocusedElementValue:", objc_msgSend(cf, "stringFromDate:", objc_msgSend(self->_datePicker.m_ptr, "date")));
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)setWeekPickerToInitialValue
{
  if ([self->_initialValue.m_ptr length])
  {
    [(WKDateTimePicker *)self iso8601DateFormatterForCalendarView];
    objc_super v3 = (const void *)objc_msgSend(cf, "dateFromString:", -[WKDateTimePicker _sanitizeInputValueForFormatter:](self, "_sanitizeInputValueForFormatter:", self->_initialValue.m_ptr));
    id v4 = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (!v4
      || (objc_msgSend((id)objc_msgSend(self->_calendarView.m_ptr, "availableDateRange"), "containsDate:", v4) & 1) == 0)
    {
      uint64_t v5 = (const void *)[MEMORY[0x1E4F1C9C8] date];
      id v6 = v5;
      if (v5) {
        CFRetain(v5);
      }
      if (v4) {
        CFRelease(v4);
      }
      id v4 = v6;
    }
    RetainPtr<NSDateFormatter> v7 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C328]), "components:fromDate:", 25088, v4);
    uint64_t v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    [self->_selectionWeekOfYear.m_ptr setSelectedWeekOfYear:v8 animated:1];
    if (v8) {
      CFRelease(v8);
    }
    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    m_ptr = self->_selectionWeekOfYear.m_ptr;
    double v10 = (void *)[MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C328]];
    objc_msgSend(m_ptr, "setSelectedWeekOfYear:", objc_msgSend(v10, "components:fromDate:", 25088, objc_msgSend(MEMORY[0x1E4F1C9C8], "date")));
    [(WKDateTimePicker *)self _dateChanged];
  }
}

- (void)setDateTimePickerToInitialValue
{
  if (*(unsigned char *)([(WKContentView *)self->_view focusedElementInformation] + 185) == 14)
  {
    [(WKDateTimePicker *)self setWeekPickerToInitialValue];
  }
  else if ([self->_initialValue.m_ptr length])
  {
    [(WKDateTimePicker *)self dateFormatterForPicker];
    uint64_t v3 = objc_msgSend(cf, "dateFromString:", -[WKDateTimePicker _sanitizeInputValueForFormatter:](self, "_sanitizeInputValueForFormatter:", self->_initialValue.m_ptr));
    if (cf) {
      CFRelease(cf);
    }
    m_ptr = self->_datePicker.m_ptr;
    if (!v3) {
      uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    }
    [m_ptr setDate:v3];
  }
  else
  {
    objc_msgSend(self->_datePicker.m_ptr, "setDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
    [(WKDateTimePicker *)self _dateChanged];
  }
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  int v3 = *(unsigned __int8 *)([(WKContentView *)self->_view focusedElementInformation] + 185);
  if (v3 == 15 || v3 == 12) {
    [(WKContentView *)self->_view startRelinquishingFirstResponderToFocusedElement];
  }
  objc_msgSend(self->_datePicker.m_ptr, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "localTimeZone"));
  if (*(void *)([(WKContentView *)self->_view focusedElementInformation] + 224))
  {
    uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    p_initialValue = &self->_initialValue;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    p_initialValue = &self->_initialValue;
    uint64_t v5 = &stru_1EEA10550;
  }
  CFRetain(v5);
LABEL_10:
  m_ptr = p_initialValue->m_ptr;
  p_initialValue->m_ptr = v5;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  [(WKDateTimePicker *)self setDateTimePickerToInitialValue];

  [(WKDateTimePicker *)self showDateTimePicker];
}

- (void)controlEndEditing
{
  [(WKContentView *)self->_view stopRelinquishingFirstResponderToFocusedElement];

  [(WKDateTimePicker *)self removeDatePickerPresentation];
}

- (NSString)calendarType
{
  v2 = (void *)[self->_datePicker.m_ptr calendar];

  return (NSString *)[v2 calendarIdentifier];
}

- (double)hour
{
  return (double)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "components:fromDate:", 32, objc_msgSend(self->_datePicker.m_ptr, "date")), "hour");
}

- (double)minute
{
  return (double)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "components:fromDate:", 64, objc_msgSend(self->_datePicker.m_ptr, "date")), "minute");
}

- (void)setHour:(int64_t)a3 minute:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%.2ld:%.2ld", a3, a4);
  m_ptr = self->_datePicker.m_ptr;
  [(WKDateTimePicker *)self dateFormatterForPicker];
  objc_msgSend(m_ptr, "setDate:", objc_msgSend(cf, "dateFromString:", v5));
  if (cf) {
    CFRelease(cf);
  }
  [(WKDateTimePicker *)self _dateChanged];
}

- (void).cxx_destruct
{
  m_ptr = self->_datePickerController.m_ptr;
  self->_datePickerController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v4 = self->_selectionWeekOfYear.m_ptr;
  self->_selectionWeekOfYear.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_calendarView.m_ptr;
  self->_calendarView.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  id v6 = self->_datePicker.m_ptr;
  self->_datePicker.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  RetainPtr<NSDateFormatter> v7 = self->_initialValue.m_ptr;
  self->_initialValue.m_ptr = 0;
  if (v7)
  {
    CFRelease(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end