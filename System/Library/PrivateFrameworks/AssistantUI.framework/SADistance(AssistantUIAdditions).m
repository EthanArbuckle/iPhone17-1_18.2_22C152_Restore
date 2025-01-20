@interface SADistance(AssistantUIAdditions)
- (id)afui_abbreviatedUnit;
- (id)afui_metersValue;
- (uint64_t)afui_compare:()AssistantUIAdditions;
- (void)afui_abbreviatedUnit;
@end

@implementation SADistance(AssistantUIAdditions)

- (id)afui_abbreviatedUnit
{
  id v1 = [a1 unit];
  if ([v1 isEqualToString:*MEMORY[0x263F651D0]])
  {
    v2 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v3 = v2;
    v4 = @"FEET_ABBREVIATION";
LABEL_9:
    v5 = [v2 assistantUILocalizedStringForKey:v4 table:@"Localizable"];

    goto LABEL_10;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F651E8]])
  {
    v2 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v3 = v2;
    v4 = @"MILES_ABBREVIATION";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F651E0]])
  {
    v2 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v3 = v2;
    v4 = @"METERS_ABBREVIATION";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F651D8]])
  {
    v2 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v3 = v2;
    v4 = @"KILOMETERS_ABBREVIATION";
    goto LABEL_9;
  }
  v7 = *MEMORY[0x263F28348];
  v5 = v1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    [(SADistance(AssistantUIAdditions) *)(uint64_t)v1 afui_abbreviatedUnit];
    v5 = v1;
  }
LABEL_10:

  return v5;
}

- (id)afui_metersValue
{
  v15[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F651D8];
  v14[0] = *MEMORY[0x263F651D0];
  v14[1] = v2;
  v15[0] = &unk_26D62A880;
  v15[1] = &unk_26D62A890;
  uint64_t v3 = *MEMORY[0x263F651E8];
  v14[2] = *MEMORY[0x263F651E0];
  v14[3] = v3;
  v15[2] = &unk_26D62A8A0;
  v15[3] = &unk_26D62A8B0;
  v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v5 = [a1 unit];
  v6 = [v4 objectForKey:v5];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [a1 value];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [NSNumber numberWithDouble:v8 * v11];

  return v12;
}

- (uint64_t)afui_compare:()AssistantUIAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "afui_metersValue");
  v6 = objc_msgSend(v4, "afui_metersValue");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)afui_abbreviatedUnit
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SADistance(AssistantUIAdditions) afui_abbreviatedUnit]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_223099000, a2, OS_LOG_TYPE_ERROR, "%s Unknown distance unit %{public}@; returning full unit as abbreviation",
    (uint8_t *)&v2,
    0x16u);
}

@end