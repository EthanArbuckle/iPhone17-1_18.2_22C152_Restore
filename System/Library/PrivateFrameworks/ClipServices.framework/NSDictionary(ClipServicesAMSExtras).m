@interface NSDictionary(ClipServicesAMSExtras)
- (double)maxAge;
@end

@implementation NSDictionary(ClipServicesAMSExtras)

- (double)maxAge
{
  v1 = [a1 objectForKey:@"Cache-Control"];
  if (v1)
  {
    v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v3 = [v1 componentsSeparatedByString:@","];
    uint64_t v4 = [v3 count];
    double v5 = 0.0;
    if (v4)
    {
      uint64_t v6 = v4;
      v16 = v1;
      uint64_t v7 = 0;
      while (1)
      {
        v8 = [v3 objectAtIndex:v7];
        v9 = [v8 stringByTrimmingCharactersInSet:v2];

        v10 = [v9 componentsSeparatedByString:@"="];
        if ([v10 count] == 2)
        {
          v11 = [v10 objectAtIndex:0];
          int v12 = [v11 hasPrefix:@"max-age"];

          if (v12) {
            break;
          }
        }

        if (v6 == ++v7) {
          goto LABEL_10;
        }
      }
      v13 = [v10 objectAtIndex:1];
      [v13 doubleValue];
      double v5 = v14;

LABEL_10:
      v1 = v16;
    }
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

@end