@interface NSTimeZone(SGCalendarAttachmentDissector)
+ (id)gmtOffsetTimeZoneFromString:()SGCalendarAttachmentDissector forDate:;
+ (id)gmtOffsetTimeZoneWithHour:()SGCalendarAttachmentDissector withMinute:forDate:;
+ (id)systemTimeZoneFromString:()SGCalendarAttachmentDissector;
+ (id)systemTimeZoneWithWindowsName:()SGCalendarAttachmentDissector;
@end

@implementation NSTimeZone(SGCalendarAttachmentDissector)

+ (id)gmtOffsetTimeZoneFromString:()SGCalendarAttachmentDissector forDate:
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_20;
  }
  v7 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v8 = [v5 rangeOfString:@"GMT"];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL || (uint64_t v8 = [v5 rangeOfString:@"UTC"], v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (v8 + 4 < (unint64_t)[v5 length])
    {
      int v10 = [v5 characterAtIndex:v8 + 3];
      if (v10 == 45 || v10 == 43)
      {
        unint64_t v11 = [v5 length];
        v12 = (void *)MEMORY[0x1CB79B230]();
        if (v8 + 8 >= v11)
        {
          if (v8 + 5 >= (unint64_t)[v5 length]) {
            uint64_t v18 = 2;
          }
          else {
            uint64_t v18 = 3;
          }
          v19 = objc_msgSend(v5, "substringWithRange:", v8 + 3, v18);
          uint64_t v20 = [v19 integerValue];

          v9 = [MEMORY[0x1E4F1CAF0] gmtOffsetTimeZoneWithHour:v20 withMinute:0 forDate:v6];
        }
        else
        {
          v13 = objc_msgSend(v5, "substringWithRange:", v8 + 3, 3);
          uint64_t v14 = [v13 integerValue];

          v15 = objc_msgSend(v5, "substringWithRange:", v8 + 7, 2);
          uint64_t v16 = [v15 integerValue];

          uint64_t v17 = [MEMORY[0x1E4F1CAF0] gmtOffsetTimeZoneWithHour:v14 withMinute:v16 forDate:v6];
          if (v17)
          {
            v9 = (void *)v17;
            goto LABEL_19;
          }
          v21 = (void *)MEMORY[0x1E4F1CAF0];
          v22 = objc_msgSend(v5, "substringWithRange:", v8, 9);
          v9 = [v21 timeZoneWithName:v22];
        }
        if (v9) {
          goto LABEL_19;
        }
      }
    }
    v9 = [MEMORY[0x1E4F1CAF0] gmtOffsetTimeZoneWithHour:0 withMinute:0 forDate:v6];
    goto LABEL_19;
  }
  v9 = 0;
LABEL_19:
LABEL_20:

  return v9;
}

+ (id)gmtOffsetTimeZoneWithHour:()SGCalendarAttachmentDissector withMinute:forDate:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = v8;
  if (a3 >= 0) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = -a4;
  }
  uint64_t v11 = v10 + 60 * a3;
  uint64_t v12 = 60 * v11;
  v13 = [v8 dateByAddingTimeInterval:(double)(-60 * v11)];
  uint64_t v14 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v15 = [v14 secondsFromGMTForDate:v13];

  if (v12 == v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  }
  else
  {
    if (a4)
    {
      uint64_t v32 = a1;
      v34 = v9;
      context = (void *)MEMORY[0x1CB79B230]();
      uint64_t v17 = [MEMORY[0x1E4F1CAF0] knownTimeZoneNames];
      uint64_t v18 = [&unk_1F25366F8 arrayByAddingObjectsFromArray:v17];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v16 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:*(void *)(*((void *)&v36 + 1) + 8 * i)];
            if (v12 == [v16 secondsFromGMTForDate:v13])
            {

              v9 = v34;
              goto LABEL_22;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      v9 = v34;
      a1 = v32;
    }
    uint64_t v16 = 0;
    if ((unint64_t)(a3 + 12) <= 0x1A && !v10)
    {
      v24 = (void *)MEMORY[0x1CB79B230]();
      v25 = objc_opt_new();
      [v25 setNumberStyle:1];
      [v25 setMaximumFractionDigits:0];
      [v25 setPositivePrefix:@"+"];
      [v25 setNegativePrefix:@"-"];
      v26 = [NSNumber numberWithInteger:-a3];
      v27 = [v25 stringFromNumber:v26];

      if (!v27)
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2, a1, @"SGCalendarAttachmentDissector.m", 404, @"Invalid parameter not satisfying: %@", @"hourString" object file lineNumber description];
      }
      v28 = (void *)MEMORY[0x1E4F1CAF0];
      v29 = [@"Etc/GMT" stringByAppendingString:v27];
      uint64_t v16 = [v28 timeZoneWithName:v29];
    }
  }
LABEL_22:

  return v16;
}

+ (id)systemTimeZoneFromString:()SGCalendarAttachmentDissector
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = 0;
LABEL_12:
    v7 = [MEMORY[0x1E4F1CAF0] systemTimeZoneWithWindowsName:v4];
    goto LABEL_16;
  }
  id v5 = v3;
  while (1)
  {
    id v6 = (void *)MEMORY[0x1CB79B230]();
    v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v5];
    uint64_t v8 = [v5 rangeOfString:@"/"];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    v9 = [v5 substringFromIndex:v8 + 1];

    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v9 == 0;
    }
    id v5 = v9;
    if (v10)
    {
      if (v7) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }
  if (v7
    || ([MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:v5],
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    v9 = 0;
    goto LABEL_16;
  }
  v7 = [MEMORY[0x1E4F1CAF0] systemTimeZoneWithWindowsName:v5];

  v9 = 0;
  if (!v7) {
    goto LABEL_12;
  }
LABEL_16:

  return v7;
}

+ (id)systemTimeZoneWithWindowsName:()SGCalendarAttachmentDissector
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1CB79B230]();
    id v5 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v3, @"/");

    id v6 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v5, @"\\"");

    v7 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v6, @", ");

    uint64_t v8 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v7, @" ");;

    v9 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v8, @"- ");

    BOOL v10 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v9, @": ");

    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v3 = [v10 stringByTrimmingCharactersInSet:v11];

    uint64_t v12 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v3);
    if (v12) {
      goto LABEL_9;
    }
    unint64_t v13 = [v3 rangeOfString:@""]);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v14 = v13;
      if (v13 < [v3 length] - 3)
      {
        uint64_t v15 = [v3 substringFromIndex:v14 + 2];

        id v3 = (id)v15;
      }
    }
    uint64_t v12 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v3);
    if (v12) {
      goto LABEL_9;
    }
    uint64_t v16 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v3, @" (");

    uint64_t v12 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v16);
    if (v12)
    {
      id v3 = v16;
LABEL_9:
      id v17 = v12;
      goto LABEL_12;
    }
    uint64_t v20 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v16, @" Standard Time");

    uint64_t v21 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v20, @" Daylight Time");

    uint64_t v22 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v21, @" Summer Time");

    __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v22, @" Time");
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v3);
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v17 = v18;
LABEL_12:

  return v17;
}

@end