@interface CUIKAvailabilityDescriptionGenerator
+ (id)allInviteesCanAttendString;
+ (id)attendeeProposedANewTime:(id)a3 attendeeName:(id)a4;
+ (id)failedString;
+ (id)proposeANewTimePlaceholderString;
+ (id)showMoreString;
+ (id)someInviteesCanAttendString;
+ (id)timeRangeStringWithStartDate:(id)a3 withEndDate:(id)a4;
+ (id)waitingForAvailabilityQueryString;
+ (id)weekdayMonthDayString:(id)a3;
+ (id)youProposedString;
@end

@implementation CUIKAvailabilityDescriptionGenerator

+ (id)waitingForAvailabilityQueryString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"Waiting for availability results…" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)failedString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"Unable to get availability" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)allInviteesCanAttendString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"All Invitees Can Attend" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)someInviteesCanAttendString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"Some Invitees Can Attend" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)youProposedString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"You proposed" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)showMoreString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"Show more…" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)proposeANewTimePlaceholderString
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"Propose a New Time" value:&stru_1F187C430 table:0];

  return v3;
}

+ (id)attendeeProposedANewTime:(id)a3 attendeeName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CUIKDateDescriptionGenerator sharedGenerator];
  v8 = [v7 dateStringForDate:v6 allDay:0 standalone:0 shortFormat:0];

  v9 = NSString;
  v10 = CUIKBundle();
  v11 = [v10 localizedStringForKey:@"%@ proposed %@." value:&stru_1F187C430 table:0];
  v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v5, v8);

  return v12;
}

+ (id)weekdayMonthDayString:(id)a3
{
  return (id)[a3 localizedWeekdayMonthDayStringShortened:0];
}

+ (id)timeRangeStringWithStartDate:(id)a3 withEndDate:(id)a4
{
  id v5 = a4;
  id v6 = [a3 timeStringAlwaysIncludeMinutes:1];
  v7 = [v5 timeStringAlwaysIncludeMinutes:1];

  v8 = [NSString stringWithFormat:@"%@ - %@", v6, v7];

  return v8;
}

@end