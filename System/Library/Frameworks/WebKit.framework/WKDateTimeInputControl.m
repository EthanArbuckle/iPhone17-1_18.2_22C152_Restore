@interface WKDateTimeInputControl
- (BOOL)dismissWithAnimationForTesting;
- (NSString)dateTimePickerCalendarType;
- (WKDateTimeInputControl)initWithView:(id)a3;
- (double)timePickerValueHour;
- (double)timePickerValueMinute;
- (void)setTimePickerHour:(int64_t)a3 minute:(int64_t)a4;
@end

@implementation WKDateTimeInputControl

- (WKDateTimeInputControl)initWithView:(id)a3
{
  uint64_t v5 = *(unsigned __int8 *)([a3 focusedElementInformation] + 185);
  if ((v5 - 11) > 4)
  {

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WKDateTimeInputControl;
    CFTypeRef cf = [[WKDateTimePicker alloc] initWithView:a3 inputType:v5];
    v6 = [(WKFormPeripheralBase *)&v9 initWithView:a3 control:&cf];
    CFTypeRef v7 = cf;
    CFTypeRef cf = 0;
    if (v7) {
      CFRelease(v7);
    }
  }
  return v6;
}

- (void)setTimePickerHour:(int64_t)a3 minute:(int64_t)a4
{
  v6 = [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    [(WKFormControl *)v6 setHour:a3 minute:a4];
  }
}

- (NSString)dateTimePickerCalendarType
{
  v2 = [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2) {
    return 0;
  }

  return (NSString *)[(WKFormControl *)v2 calendarType];
}

- (double)timePickerValueHour
{
  v2 = [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2) {
    return -1.0;
  }

  [(WKFormControl *)v2 hour];
  return result;
}

- (double)timePickerValueMinute
{
  v2 = [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2) {
    return -1.0;
  }

  [(WKFormControl *)v2 minute];
  return result;
}

- (BOOL)dismissWithAnimationForTesting
{
  v2 = [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v2 = 0;
  }
  if (v2)
  {
    objc_msgSend((id)-[WKFormControl datePickerController](v2, "datePickerController"), "assertAccessoryViewCanBeHitTestedForTesting");
    objc_msgSend((id)-[WKFormControl datePickerController](v2, "datePickerController"), "dismissDatePicker");
  }
  return v2 != 0;
}

@end