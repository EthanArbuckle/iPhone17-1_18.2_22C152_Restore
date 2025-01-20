@interface CalendarColors
+ (id)birthdayCalendarColor;
+ (id)colorForName:(id)a3;
+ (id)colorNamesOrderedForAssignment;
+ (id)defaultCalendarColorNames;
+ (id)facebookCalendarColor;
+ (id)grayColor;
+ (id)localizedColorNameForColorName:(id)a3;
+ (id)nameOfColor:(id)a3;
+ (id)symbolicColorForNewCalendarWithExistingSymbolicNames:(id)a3;
+ (id)textColorForName:(id)a3;
+ (int)countOfColor:(id)a3 inArray:(id)a4;
+ (void)_bootstrapColorNameMapping;
+ (void)_rebuildColors;
+ (void)initialize;
@end

@implementation CalendarColors

+ (id)symbolicColorForNewCalendarWithExistingSymbolicNames:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [a1 colorNamesOrderedForAssignment];
  v7 = [v5 arrayWithArray:v6];

  if ([v4 count])
  {
    v8 = [v4 lastObject];
    [v7 removeObject:v8];
  }
  v9 = [v7 firstObject];
  int v10 = [a1 countOfColor:v9 inArray:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v17 = objc_msgSend(a1, "countOfColor:inArray:", v16, v4, (void)v21);
        if (v17 < v10)
        {
          int v18 = v17;
          id v19 = v16;

          int v10 = v18;
          v9 = v19;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v9;
}

+ (int)countOfColor:(id)a3 inArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    int v10 = 0;
    do
    {
      id v11 = [v6 objectAtIndex:v9];
      int v12 = [v11 isEqual:v5];

      v10 += v12;
      ++v9;
    }
    while (v8 != v9);
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

+ (id)colorNamesOrderedForAssignment
{
  [a1 _bootstrapColorNameMapping];
  v2 = (void *)_colorNamesOrderedForAssignment;

  return v2;
}

+ (id)defaultCalendarColorNames
{
  [a1 _bootstrapColorNameMapping];
  v2 = (void *)_defaultCalendarColorNames;

  return v2;
}

+ (void)_bootstrapColorNameMapping
{
  if (!_colorNameMapping) {
    [a1 _rebuildColors];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 _bootstrapColorNameMapping];
  }
}

+ (void)_rebuildColors
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v33 = [MEMORY[0x1E4F1CA60] dictionary];
  v34 = [MEMORY[0x1E4F1CA60] dictionary];
  v32 = v2;
  v31 = [v2 pathForResource:@"CalendarColors" ofType:@"plist"];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithContentsOfFile:");
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    v35 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
        id v6 = [v5 objectForKey:@"name"];
        if ([v6 length])
        {
          if ([v3 containsObject:v6]) {
            NSLog(&cfstr_SErrorColorAlr.isa, "+[CalendarColors _rebuildColors]", v6);
          }
          uint64_t v7 = [v5 objectForKey:@"tile"];
          if ([v7 count] == 3)
          {
            uint64_t v8 = [v7 objectAtIndex:0];
            uint64_t v9 = [v8 unsignedIntValue];
            int v10 = [v7 objectAtIndex:1];
            uint64_t v11 = [v10 unsignedIntValue];
            int v12 = [v7 objectAtIndex:2];
            uint64_t v13 = [v12 unsignedIntValue];
            uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X%02X", v9, v11, v13, 255);
          }
          else
          {
            uint64_t v14 = 0;
          }
          v15 = [v5 objectForKey:@"text"];
          if ([v15 count] == 3)
          {
            v16 = [v15 objectAtIndex:0];
            uint64_t v17 = [v16 unsignedIntValue];
            int v18 = [v15 objectAtIndex:1];
            uint64_t v19 = [v18 unsignedIntValue];
            v20 = [v15 objectAtIndex:2];
            uint64_t v21 = [v20 unsignedIntValue];
            long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X%02X", v17, v19, v21, 255);

            if (v14)
            {
              v3 = v35;
              if (v22)
              {
                [v35 addObject:v6];
                [v33 setObject:v14 forKey:v6];
                [v34 setObject:v22 forKey:v6];
LABEL_18:

                goto LABEL_19;
              }
            }
            else
            {
              v3 = v35;
            }
          }
          else
          {
            long long v22 = 0;
          }
          NSLog(&cfstr_SErrorIncorrec.isa, "+[CalendarColors _rebuildColors]", v6);
          goto LABEL_18;
        }
LABEL_19:

        ++v4;
      }
      while (v38 != v4);
      uint64_t v23 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v38 = v23;
    }
    while (v23);
  }
  long long v24 = (void *)_defaultCalendarColorNames;
  _defaultCalendarColorNames = (uint64_t)v3;
  id v25 = v3;

  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4FB82E8], *MEMORY[0x1E4FB8310], *MEMORY[0x1E4FB8308], *MEMORY[0x1E4FB8300], *MEMORY[0x1E4FB8318], *MEMORY[0x1E4FB8320], *MEMORY[0x1E4FB82F0], 0);
  v27 = (void *)_colorNamesOrderedForAssignment;
  _colorNamesOrderedForAssignment = v26;

  v28 = (void *)_colorNameMapping;
  _colorNameMapping = (uint64_t)v33;
  id v29 = v33;

  v30 = (void *)_textColorNameMapping;
  _textColorNameMapping = (uint64_t)v34;
}

+ (id)nameOfColor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 _bootstrapColorNameMapping];
  id v5 = [MEMORY[0x1E4FB7F10] symbolicColorForLegacyRGB:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = objc_msgSend((id)_colorNameMapping, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = [(id)_colorNameMapping objectForKey:v13];
          if (CalColorsAreAlmostEqual(v4, v14))
          {
            id v7 = v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
  }
LABEL_13:

  return v7;
}

+ (id)colorForName:(id)a3
{
  id v4 = a3;
  [a1 _bootstrapColorNameMapping];
  id v5 = [(id)_colorNameMapping objectForKey:v4];

  return v5;
}

+ (id)birthdayCalendarColor
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X%02X", 130, 149, 175, 255);
}

+ (id)facebookCalendarColor
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X%02X", 49, 66, 133, 255);
}

+ (id)grayColor
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X%02X", 128, 128, 128, 255);
}

+ (id)textColorForName:(id)a3
{
  id v4 = a3;
  [a1 _bootstrapColorNameMapping];
  id v5 = [(id)_textColorNameMapping objectForKey:v4];

  return v5;
}

+ (id)localizedColorNameForColorName:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
  id v5 = v3;
  id v6 = [v5 lowercaseString];
  if ([v6 isEqualToString:*MEMORY[0x1E4FB82E8]])
  {
    id v7 = @"Blue";
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FB8300]])
  {
    id v7 = @"Green";
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FB8318]])
  {
    id v7 = @"Red";
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FB8308]])
  {
    id v7 = @"Orange";
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FB8320]])
  {
    id v7 = @"Yellow";
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4FB8310]])
  {
    id v7 = @"Purple";
  }
  else
  {
    uint64_t v8 = v5;
    if (![v6 isEqualToString:*MEMORY[0x1E4FB82F0]]) {
      goto LABEL_16;
    }
    id v7 = @"Brown";
  }
  uint64_t v8 = [v4 localizedStringForKey:v7 value:&stru_1EE0C39E0 table:0];

LABEL_16:

  return v8;
}

@end