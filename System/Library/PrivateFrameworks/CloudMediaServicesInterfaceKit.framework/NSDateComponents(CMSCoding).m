@interface NSDateComponents(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation NSDateComponents(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      id v10 = v3;
      objc_msgSend(v4, "setEra:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"era", objc_msgSend(v4, "era")));
      objc_msgSend(v4, "setYear:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"year", objc_msgSend(v4, "year")));
      objc_msgSend(v4, "setMonth:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"month", objc_msgSend(v4, "month")));
      objc_msgSend(v4, "setDay:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"day", objc_msgSend(v4, "day")));
      objc_msgSend(v4, "setHour:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"hour", objc_msgSend(v4, "hour")));
      objc_msgSend(v4, "setMinute:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"minute", objc_msgSend(v4, "minute")));
      objc_msgSend(v4, "setSecond:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", @"second", objc_msgSend(v4, "second")));
      v11 = (void *)MEMORY[0x263EFFA18];
      id v5 = [v10 cmsOptionalStringForKey:@"timeZone"];

      v7 = [v11 timeZoneWithName:v5];
      [v4 setTimeZone:v7];
      goto LABEL_15;
    }
    id v5 = v3;
    v6 = cmsDateFormatter();
    v7 = [v6 dateFromString:v5];

    if (v7)
    {
      v8 = cmsDateCalender();
      [v8 components:2130174 fromDate:v7];
      v9 = v4;
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = [v5 componentsSeparatedByString:@"-"];
      uint64_t v12 = [v8 count];
      if (v12 != 1)
      {
        if (v12 != 2)
        {
          if (v12 != 3)
          {
LABEL_14:

LABEL_15:
            goto LABEL_16;
          }
          v13 = [v8 objectAtIndexedSubscript:2];
          objc_msgSend(v4, "setDay:", objc_msgSend(v13, "integerValue"));
        }
        v14 = [v8 objectAtIndexedSubscript:1];
        objc_msgSend(v4, "setMonth:", objc_msgSend(v14, "integerValue"));
      }
      v9 = [v8 objectAtIndexedSubscript:0];
      objc_msgSend(v4, "setYear:", objc_msgSend(v9, "integerValue"));
    }

    goto LABEL_14;
  }
LABEL_16:
  v15 = cmsDateCalender();
  [v4 setCalendar:v15];

  return v4;
}

- (id)cmsCoded
{
  uint64_t v28 = [a1 era];
  uint64_t v2 = [a1 year];
  uint64_t v31 = [a1 month];
  uint64_t v30 = [a1 day];
  uint64_t v29 = [a1 hour];
  uint64_t v26 = [a1 minute];
  uint64_t v27 = [a1 second];
  uint64_t v3 = [a1 nanosecond];
  unint64_t v4 = (2 * (v28 != 0x7FFFFFFFFFFFFFFFLL)) | (4 * (v2 != 0x7FFFFFFFFFFFFFFFLL)) | (8
                                                                                     * (v31 != 0x7FFFFFFFFFFFFFFFLL)) | (16 * (v30 != 0x7FFFFFFFFFFFFFFFLL)) | (32 * (v29 != 0x7FFFFFFFFFFFFFFFLL)) | ((unint64_t)(v26 != 0x7FFFFFFFFFFFFFFFLL) << 6);
  unint64_t v5 = v4 | ((unint64_t)(v27 != 0x7FFFFFFFFFFFFFFFLL) << 7);
  unint64_t v6 = v5 | ((unint64_t)(v3 != 0x7FFFFFFFFFFFFFFFLL) << 15);
  switch(v6)
  {
    case 0x1CuLL:
      objc_msgSend(NSString, "stringWithFormat:", @"%04d-%02d-%02d", v2, v31, v30);
      goto LABEL_7;
    case 0xCuLL:
      objc_msgSend(NSString, "stringWithFormat:", @"%04d-%02d", v2, v31, v25);
      goto LABEL_7;
    case 4uLL:
      objc_msgSend(NSString, "stringWithFormat:", @"%04d", v2, v24, v25);
      v7 = LABEL_7:;
      goto LABEL_8;
  }
  if ((v5 & 0xFFFFFFFFFFFF7FFFLL) == 0xFC)
  {
    v9 = cmsDateFormatter();
    id v10 = [a1 date];
    v7 = [v9 stringFromDate:v10];

    goto LABEL_8;
  }
  uint64_t v11 = v3;
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  uint64_t v12 = [a1 calendar];
  v13 = [a1 timeZone];
  if (v12)
  {
    v14 = [v12 calendarIdentifier];
    [v7 setValue:v14 forKey:@"calendarIdentifier"];
  }
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v7 setValue:v15 forKey:@"era"];
  }
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [NSNumber numberWithInteger:v2];
    [v7 setValue:v16 forKey:@"year"];
  }
  if (v31 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v7 setValue:v17 forKey:@"month"];
  }
  if (v30 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v7 setValue:v18 forKey:@"day"];
  }
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v7 setValue:v19 forKey:@"hour"];
  }
  if (v4 >= 0x40)
  {
    v20 = [NSNumber numberWithInteger:v26];
    [v7 setValue:v20 forKey:@"minute"];
  }
  if (v5 < 0x80)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_29;
    }
LABEL_32:
    v23 = [NSNumber numberWithInteger:v11];
    [v7 setValue:v23 forKey:@"nanosecond"];

    if (v13) {
      goto LABEL_30;
    }
LABEL_33:
    [v7 setValue:@"UTC" forKey:@"timeZone"];
    goto LABEL_34;
  }
  v22 = [NSNumber numberWithInteger:v27];
  [v7 setValue:v22 forKey:@"second"];

  if ((v6 & 0x8000) != 0) {
    goto LABEL_32;
  }
LABEL_29:
  if (!v13) {
    goto LABEL_33;
  }
LABEL_30:
  v21 = [v13 name];
  [v7 setValue:v21 forKey:@"timeZone"];

LABEL_34:
LABEL_8:
  return v7;
}

@end