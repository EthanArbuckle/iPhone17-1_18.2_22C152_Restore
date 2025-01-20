@interface HUStringDisplayFormatter
+ (id)_stringByApplyingHomeKit8DigitFormatToString:(id)a3;
+ (id)_stringByApplyingMatter11DigitFormatToString:(id)a3;
+ (id)_stringByApplyingMatter21DigitFormatToString:(id)a3;
+ (id)stringByApplyingCodeFormatToString:(id)a3;
@end

@implementation HUStringDisplayFormatter

+ (id)stringByApplyingCodeFormatToString:(id)a3
{
  v3 = objc_msgSend(a3, "hf_extractDecimalDigits");
  if ((unint64_t)[v3 length] > 8)
  {
    if ((unint64_t)[v3 length] > 0xB) {
      +[HUStringDisplayFormatter _stringByApplyingMatter21DigitFormatToString:v3];
    }
    else {
    uint64_t v4 = +[HUStringDisplayFormatter _stringByApplyingMatter11DigitFormatToString:v3];
    }
  }
  else
  {
    uint64_t v4 = +[HUStringDisplayFormatter _stringByApplyingHomeKit8DigitFormatToString:v3];
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)_stringByApplyingHomeKit8DigitFormatToString:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] > 4)
  {
    id v4 = (id)[v3 mutableCopy];
    [v4 insertString:@"-" atIndex:4];
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

+ (id)_stringByApplyingMatter11DigitFormatToString:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] > 4)
  {
    id v4 = (id)[v3 mutableCopy];
    [v4 insertString:@"-" atIndex:4];
    if ((unint64_t)[v4 length] >= 9) {
      [v4 insertString:@"-" atIndex:8];
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

+ (id)_stringByApplyingMatter21DigitFormatToString:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] > 4)
  {
    id v4 = (id)[v3 mutableCopy];
    [v4 insertString:@"-" atIndex:4];
    if ((unint64_t)[v4 length] >= 9) {
      [v4 insertString:@"-" atIndex:8];
    }
    if ((unint64_t)[v4 length] >= 0xE) {
      [v4 insertString:@" " atIndex:13];
    }
    if ((unint64_t)[v4 length] >= 0x13) {
      [v4 insertString:@"-" atIndex:18];
    }
    if ((unint64_t)[v4 length] >= 0x17) {
      [v4 insertString:@"-" atIndex:22];
    }
    if ((unint64_t)[v4 length] >= 0x1A) {
      [v4 insertString:@"-" atIndex:25];
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

@end