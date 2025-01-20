@interface CRXUFormatters
+ (id)BOOLAsString:(BOOL)a3;
+ (id)timeIntervalAsString:(double)a3;
@end

@implementation CRXUFormatters

+ (id)BOOLAsString:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

+ (id)timeIntervalAsString:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  v5 = v4;
  if (a3 < 0.0)
  {
    [v4 appendString:@"-"];
    a3 = -a3;
  }
  unint64_t v6 = (unint64_t)a3;
  double v7 = (a3 - (double)(unint64_t)a3) * 1000.0;
  unint64_t v8 = v6 % 0xE10;
  unint64_t v9 = v6 % 0xE10 / 0x3C;
  unint64_t v10 = v6 % 0xE10 % 0x3C;
  if (v6 >= 0xE10) {
    objc_msgSend(v5, "appendFormat:", @"%lu:", v6 / 0xE10);
  }
  if ([v5 length])
  {
    v11 = @"%02lu:";
  }
  else
  {
    if (v8 < 0x3C) {
      goto LABEL_10;
    }
    v11 = @"%lu:";
  }
  objc_msgSend(v5, "appendFormat:", v11, v9);
LABEL_10:
  if ([v5 length]) {
    v12 = @"%02lu";
  }
  else {
    v12 = @"%lu";
  }
  objc_msgSend(v5, "appendFormat:", v12, v10);
  if ((unint64_t)v7) {
    objc_msgSend(v5, "appendFormat:", @".%03lu", (unint64_t)v7);
  }
  v13 = [NSString stringWithString:v5];

  return v13;
}

@end