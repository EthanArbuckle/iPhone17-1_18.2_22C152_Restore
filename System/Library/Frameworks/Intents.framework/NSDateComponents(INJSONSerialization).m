@interface NSDateComponents(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSDateComponents(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  if ([a1 year] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"year");
  }
  else
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "year"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v7, @"year");
  }
  if ([a1 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"month");
  }
  else
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "month"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, @"month");
  }
  if ([a1 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"day");
  }
  else
  {
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "day"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, @"day");
  }
  if ([a1 weekday] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"weekday");
  }
  else
  {
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "weekday"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, @"weekday");
  }
  if ([a1 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"hour");
  }
  else
  {
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "hour"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, @"hour");
  }
  if ([a1 minute] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"minute");
  }
  else
  {
    v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "minute"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, @"minute");
  }
  if ([a1 second] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"second");
  }
  else
  {
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "second"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v13, @"second");
  }
  if ([a1 nanosecond] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"nanosecond");
  }
  else
  {
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "nanosecond"));
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, @"nanosecond");
  }
  v15 = [a1 calendar];
  v16 = [v5 encodeObject:v15];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v16, @"calendar");

  v17 = [a1 timeZone];
  v18 = [v5 encodeObject:v17];

  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v18, @"timeZone");
  v19 = (void *)[v6 copy];

  return v19;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v11 = [v9 objectForKeyedSubscript:@"year"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v11, @"year");

    v12 = [v9 objectForKeyedSubscript:@"month"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v12, @"month");

    v13 = [v9 objectForKeyedSubscript:@"day"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v13, @"day");

    v14 = [v9 objectForKeyedSubscript:@"weekday"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v14, @"weekday");

    v15 = [v9 objectForKeyedSubscript:@"hour"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v15, @"hour");

    v16 = [v9 objectForKeyedSubscript:@"minute"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v16, @"minute");

    v17 = [v9 objectForKeyedSubscript:@"second"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v17, @"second");

    v18 = [v9 objectForKeyedSubscript:@"nanosecond"];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v18, @"nanosecond");

    uint64_t v19 = objc_opt_class();
    v20 = [v9 objectForKeyedSubscript:@"calendar"];
    v21 = [v7 decodeObjectOfClass:v19 from:v20];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v21, @"calendar");

    uint64_t v22 = objc_opt_class();
    v23 = [v9 objectForKeyedSubscript:@"timeZone"];
    v24 = [v7 decodeObjectOfClass:v22 from:v23];
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v24, @"timeZone");
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end