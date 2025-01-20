@interface HKInspectableValue(Display)
- (__CFString)displayString;
- (id)_displayStringForCodedValueCollection:()Display;
- (id)_stringForMedicalCodings:()Display;
- (id)_stringForMedicalDateInterval;
- (id)_stringForQuantity:()Display;
- (id)_stringForTimeSinceMidnight;
- (uint64_t)_joinValueStrings:()Display;
@end

@implementation HKInspectableValue(Display)

- (__CFString)displayString
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = &stru_1F3B9CF20;
  switch([a1 valueType])
  {
    case 0:
      uint64_t v3 = [a1 stringValue];
      goto LABEL_7;
    case 1:
      v4 = [a1 ratioValue];
      v5 = [v4 numerator];
      v6 = [v5 localizedValue];
      v21[0] = v6;
      v7 = [a1 ratioValue];
      v8 = [v7 denominator];
      v9 = [v8 localizedValue];
      v21[1] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      v2 = [a1 _joinValueStrings:v10];

      goto LABEL_15;
    case 2:
      v11 = [a1 medicalDateValue];
      goto LABEL_9;
    case 3:
      uint64_t v3 = [a1 _stringForMedicalDateInterval];
      goto LABEL_7;
    case 4:
      uint64_t v3 = [a1 _stringForTimeSinceMidnight];
LABEL_7:
      v2 = (__CFString *)v3;
      break;
    case 6:
      v11 = [a1 codedQuantityValue];
LABEL_9:
      v12 = v11;
      uint64_t v13 = [v11 displayString];
      goto LABEL_17;
    case 7:
      uint64_t v14 = [a1 medicalCodings];
      goto LABEL_13;
    case 8:
      v4 = [a1 codedValueCollection];
      uint64_t v15 = [a1 _displayStringForCodedValueCollection:v4];
      goto LABEL_14;
    case 9:
      uint64_t v14 = [a1 dataAbsentReasonCodings];
LABEL_13:
      v4 = (void *)v14;
      uint64_t v15 = [a1 _stringForMedicalCodings:v14];
LABEL_14:
      v2 = (__CFString *)v15;
LABEL_15:

      break;
    case 10:
      v12 = [a1 inspectableIntegerValue];
      uint64_t v13 = [v12 stringValue];
LABEL_17:
      v2 = (__CFString *)v13;
      goto LABEL_22;
    case 11:
      v12 = [a1 BOOLeanValue];
      int v16 = [v12 BOOLValue];
      v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v18 = v17;
      if (v16) {
        v19 = @"YES";
      }
      else {
        v19 = @"NO";
      }
      v2 = [v17 localizedStringForKey:v19 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

LABEL_22:
      break;
    default:
      break;
  }
  return v2;
}

- (id)_stringForMedicalCodings:()Display
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 medicalCodings];
  v6 = [v5 firstObject];
  v7 = [v6 displayString];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "codingSystem", (void)v19);
        uint64_t v15 = [MEMORY[0x1E4F2B180] textSystem];
        int v16 = [v14 isEqual:v15];

        if (v16)
        {
          uint64_t v17 = [v13 displayString];

          v7 = (void *)v17;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_stringForMedicalDateInterval
{
  v1 = [a1 medicalDateIntervalValue];
  v2 = [v1 startDate];

  if (v2)
  {
    uint64_t v3 = [v1 startDate];
    id v4 = [v3 displayString];
  }
  else
  {
    id v4 = &stru_1F3B9CF20;
  }
  v5 = [v1 endDate];

  if (v5)
  {
    v6 = [v1 endDate];
    v7 = [v6 displayString];
  }
  else
  {
    v7 = &stru_1F3B9CF20;
  }
  id v8 = NSString;
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v10 = [v9 localizedStringForKey:@"DATE_RANGE %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", v10, v4, v7);

  return v11;
}

- (id)_stringForTimeSinceMidnight
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [a1 dateComponentsValue];
  id v4 = [v2 dateFromComponents:v3];

  v5 = HKLocalizedStringForDateAndTemplate(v4, 27);

  return v5;
}

- (id)_stringForQuantity:()Display
{
  id v3 = a3;
  id v4 = [v3 _unit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v7 setNumberStyle:1];
  id v8 = [NSNumber numberWithDouble:v6];
  uint64_t v9 = [v7 stringFromNumber:v8];

  return v9;
}

- (uint64_t)_joinValueStrings:()Display
{
  return [a3 componentsJoinedByString:@"/"];
}

- (id)_displayStringForCodedValueCollection:()Display
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 codedValues];
  double v6 = [v5 firstObject];
  id v7 = [v6 value];
  v34 = [v7 unitString];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = [v4 codedValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
  v32 = a1;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v41 + 1) + 8 * i) value];
        uint64_t v14 = [v13 unitString];

        LODWORD(v13) = [v14 isEqualToString:v34];
        if (!v13)
        {
          uint64_t v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 1;
LABEL_11:

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v33 = v4;
  id obj = [v4 codedValues];
  uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      uint64_t v20 = 0;
      uint64_t v35 = v18;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v37 + 1) + 8 * v20);
        long long v22 = [v21 value];
        uint64_t v23 = [v22 displayString];
        uint64_t v24 = (void *)v23;
        if (v15)
        {
          [v16 addObject:v23];
        }
        else
        {
          v45[0] = v23;
          v25 = [v21 value];
          v26 = [v25 unitString];
          v45[1] = v26;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
          v28 = uint64_t v27 = v15;
          uint64_t v29 = [v28 componentsJoinedByString:@" "];

          uint64_t v15 = v27;
          [v16 addObject:v29];
          long long v22 = (void *)v29;
          uint64_t v18 = v35;
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v18);
  }

  v30 = [v32 _joinValueStrings:v16];

  return v30;
}

@end