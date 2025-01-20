@interface NSDateComponents(ABSimplePropertyCell)
- (id)displayString;
- (uint64_t)contactViewControllerCellClassForPropertyType:()ABSimplePropertyCell;
@end

@implementation NSDateComponents(ABSimplePropertyCell)

- (id)displayString
{
  if (displayString_onceToken != -1) {
    dispatch_once(&displayString_onceToken, &__block_literal_global_43640);
  }
  v2 = +[CNUIDate dateFromComponents:a1 destinationCalendar:0];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [a1 calendar];

  if (v4)
  {
    v4 = [a1 calendar];
    v5 = (void *)MEMORY[0x1E4F70FE8];
    v6 = [v4 calendarIdentifier];
    uint64_t v7 = [v5 localeForCalendarID:v6];

    v3 = (void *)v7;
  }
  if (+[CNUIDate isYearlessComponents:a1])
  {
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"MMMMd" options:0 locale:v3];
    v9 = &yearlessFormatter_43642;
    [(id)yearlessFormatter_43642 setDateFormat:v8];
  }
  else
  {
    v9 = &fullFormatter_43643;
  }
  id v10 = (id)*v9;
  [v10 setLocale:v3];
  [v10 setCalendar:v4];
  v11 = [v10 stringFromDate:v2];

  return v11;
}

- (uint64_t)contactViewControllerCellClassForPropertyType:()ABSimplePropertyCell
{
  return objc_opt_class();
}

@end