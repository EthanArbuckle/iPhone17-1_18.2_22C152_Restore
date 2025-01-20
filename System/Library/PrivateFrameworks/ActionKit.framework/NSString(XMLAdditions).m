@interface NSString(XMLAdditions)
- (id)stringByEscapingCriticalXMLEntities;
- (id)stringByUnescapingCrititcalXMLEntities;
@end

@implementation NSString(XMLAdditions)

- (id)stringByUnescapingCrititcalXMLEntities
{
  v1 = [MEMORY[0x263F089D8] stringWithString:a1];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
    @"&",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
    @"<",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
    @">",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&#x27;",
    @"'",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&quot;",
    @"\"",
    2,
    0,
    [v1 length]);
  return v1;
}

- (id)stringByEscapingCriticalXMLEntities
{
  v1 = [MEMORY[0x263F089D8] stringWithString:a1];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"'", @"&#x27;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\", @"&quot;"",
    2,
    0,
    [v1 length]);
  return v1;
}

@end