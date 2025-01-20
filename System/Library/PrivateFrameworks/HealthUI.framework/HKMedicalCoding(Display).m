@interface HKMedicalCoding(Display)
- (id)formattedDescription;
- (id)formattedTitle;
@end

@implementation HKMedicalCoding(Display)

- (id)formattedDescription
{
  v2 = NSString;
  v3 = [a1 codingSystem];
  v4 = [v3 name];
  v5 = [a1 code];
  v6 = [a1 displayString];
  v7 = [v2 stringWithFormat:@"%@\n%@\n%@", v4, v5, v6];

  return v7;
}

- (id)formattedTitle
{
  v2 = [a1 codingSystem];
  v3 = [MEMORY[0x1E4F2B180] textSystem];
  char v4 = [v2 isEqual:v3];

  v5 = [a1 codingSystem];
  v6 = [v5 name];
  v7 = v6;
  if ((v4 & 1) == 0)
  {

    if (v7)
    {
      v8 = [a1 code];

      if (v8)
      {
        v9 = NSString;
        v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v10 = [v5 localizedStringForKey:@"%@_CODE_SEPARATOR_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];
        v11 = [a1 codingSystem];
        v12 = [v11 name];
        v13 = [a1 code];
        v7 = objc_msgSend(v9, "stringWithFormat:", v10, v12, v13);

        goto LABEL_8;
      }
      v5 = [a1 codingSystem];
      uint64_t v14 = [v5 name];
    }
    else
    {
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v14 = [v5 localizedStringForKey:@"OTHER_CODE_SYSTEM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];
    }
    v7 = (void *)v14;
  }
LABEL_8:

  return v7;
}

@end