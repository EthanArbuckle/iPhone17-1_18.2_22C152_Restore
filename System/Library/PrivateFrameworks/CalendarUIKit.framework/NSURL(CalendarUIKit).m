@interface NSURL(CalendarUIKit)
- (id)cal_ShortDisplayStringForURL;
@end

@implementation NSURL(CalendarUIKit)

- (id)cal_ShortDisplayStringForURL
{
  if (objc_msgSend(a1, "cal_hasSchemeTel"))
  {
    v2 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
    uint64_t v3 = [v2 formattedStringForTelURL:a1];
  }
  else
  {
    v4 = objc_msgSend(a1, "cal_hostAfterGoogleRedirects");
    if (v4)
    {
      v2 = v4;
      v5 = [v4 lowercaseString];
      int v6 = [v5 hasPrefix:@"www."];

      if (v6)
      {
        uint64_t v7 = [v2 substringFromIndex:4];

        v2 = (void *)v7;
      }
      v8 = v2;
    }
    else
    {
      v8 = [a1 absoluteString];
      v2 = v8;
    }
    uint64_t v3 = [v8 stringByURLUnescapingAllReservedCharacters];
  }
  v9 = (void *)v3;

  return v9;
}

@end