@interface WPStringUtils
+ (id)escapedStringWithString:(id)a3;
+ (id)unescapedStringWithString:(id)a3;
@end

@implementation WPStringUtils

+ (id)escapedStringWithString:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:");
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&#38;",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @">", @"&#62;",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&#60;",
      2,
      0,
      [v3 length]);
    v4 = [NSString stringWithString:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)unescapedStringWithString:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:");
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&quot;",
      @"\"",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&#x27;",
      @"'",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&#x39;",
      @"'",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&#x92;",
      @"'",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&#x96;",
      @"'",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
      @">",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
      @"<",
      2,
      0,
      [v3 length]);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
      @"&",
      2,
      0,
      [v3 length]);
    v4 = [NSString stringWithString:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end