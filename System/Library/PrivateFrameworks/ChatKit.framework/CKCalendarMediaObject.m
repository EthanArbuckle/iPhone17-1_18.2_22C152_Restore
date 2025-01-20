@interface CKCalendarMediaObject
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
- (BOOL)shouldBeQuickLooked;
- (id)attachmentSummary:(unint64_t)a3;
- (id)subtitle;
- (int)mediaType;
@end

@implementation CKCalendarMediaObject

+ (id)UTITypes
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.ical.vcs";
  v4[1] = @"com.apple.ical.ics";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)fallbackFilenamePrefix
{
  return @"CAL";
}

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Calendars" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 6;
}

- (id)subtitle
{
  return 0;
}

- (BOOL)shouldBeQuickLooked
{
  return 1;
}

@end