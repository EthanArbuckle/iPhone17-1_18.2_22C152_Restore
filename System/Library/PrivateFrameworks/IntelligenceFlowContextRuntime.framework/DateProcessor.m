@interface DateProcessor
+ (id)processDateMatch:(id)a3 originalString:(id)a4;
@end

@implementation DateProcessor

+ (id)processDateMatch:(id)a3 originalString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = [v5 date];
    if (v9 && [v5 underlyingResult])
    {
      v10 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      if ([v7 rangeOfCharacterFromSet:v10] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
      }
      else
      {
        [v5 underlyingResult];
        v11 = DDResultGetType();
        uint64_t v12 = [v11 rangeOfString:@"Date"];
        uint64_t v13 = [v11 rangeOfString:@"Time"];
        uint64_t v14 = [v11 rangeOfString:@"Duration"];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL && v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = 0;
        }
        else
        {
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v16 = 0;
          }
          else
          {
            int v15 = [v5 timeIsSignificant];
            uint64_t v16 = 224;
            if (!v15) {
              uint64_t v16 = 0;
            }
          }
          if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = v16 | 0x1C;
          }
          v18 = [MEMORY[0x263EFF8F0] currentCalendar];
          v19 = [v18 components:v17 fromDate:v9];
          if (v14 == 0x7FFFFFFFFFFFFFFFLL || ([v5 duration], v20 <= 0.0))
          {
            v23 = 0;
          }
          else
          {
            v21 = (void *)MEMORY[0x263EFF910];
            [v5 duration];
            v22 = objc_msgSend(v21, "dateWithTimeInterval:sinceDate:", v9);
            v23 = [v18 components:v17 fromDate:v22];
          }
          v24 = [v5 timeZone];

          if (v24)
          {
            v25 = [v5 timeZone];
            [v19 setTimeZone:v25];

            v26 = [v5 timeZone];
            [v23 setTimeZone:v26];
          }
          v27 = [MEMORY[0x263EFF9A0] dictionary];
          [v27 setObject:v9 forKeyedSubscript:@"date"];
          [v27 setObject:v19 forKeyedSubscript:@"startDateComponents"];
          [v27 setObject:v23 forKeyedSubscript:@"endDateComponents"];
          v8 = (void *)[v27 copy];
        }
      }
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

@end