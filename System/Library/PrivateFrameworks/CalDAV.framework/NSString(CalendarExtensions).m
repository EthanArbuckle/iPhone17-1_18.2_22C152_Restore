@interface NSString(CalendarExtensions)
+ (id)stringWithFileSystemRepresentation:()CalendarExtensions;
- (id)appendSlashIfNeeded;
- (id)quote;
- (id)removeSlashIfNeeded;
- (id)searchAndReplaceString:()CalendarExtensions withString:;
- (id)trimChar:()CalendarExtensions;
- (id)trimCommas;
- (id)trimFinalChar:()CalendarExtensions;
- (id)trimFinalComma;
- (id)trimFirstChar:()CalendarExtensions;
- (id)trimFirstComma;
- (id)trimWhiteSpace;
- (id)unquote;
@end

@implementation NSString(CalendarExtensions)

- (id)quote
{
  if ([a1 rangeOfString:@"\""] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [MEMORY[0x263F089D8] stringWithString:a1];
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\", @"'", 2, 0, objc_msgSend(v2, "length""));
  }
  return v2;
}

- (id)trimWhiteSpace
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTrimWhitespace(v1);
  id v2 = (void *)[(__CFString *)v1 copy];

  return v2;
}

- (id)trimFinalComma
{
  if ([a1 length]
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)trimFirstComma
{
  if ([a1 length] && objc_msgSend(a1, "characterAtIndex:", 0) == 44)
  {
    id v2 = [a1 substringFromIndex:1];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)trimCommas
{
  v1 = [a1 trimFirstComma];
  id v2 = [v1 trimFinalComma];

  return v2;
}

- (id)trimFinalChar:()CalendarExtensions
{
  if ([a1 length]
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == a3)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (id)trimFirstChar:()CalendarExtensions
{
  if ([a1 length] && objc_msgSend(a1, "characterAtIndex:", 0) == a3)
  {
    id v5 = [a1 substringFromIndex:1];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (id)trimChar:()CalendarExtensions
{
  v4 = objc_msgSend(a1, "trimFirstChar:");
  id v5 = [v4 trimFinalChar:a3];

  return v5;
}

- (id)unquote
{
  if ([a1 rangeOfString:@"\\\""] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [MEMORY[0x263F089D8] stringWithString:a1];
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\\\", @"\", 2, 0, objc_msgSend(v2, "length"));
  }
  return v2;
}

- (id)searchAndReplaceString:()CalendarExtensions withString:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v8 setCharactersToBeSkipped:0];
  if ([v8 scanString:v6 intoString:0]) {
    [v9 appendString:v7];
  }
  id v16 = 0;
  int v10 = [v8 scanUpToString:v6 intoString:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {
    do
    {
      [v9 appendString:v12];
      if ([v8 scanString:v6 intoString:0]) {
        [v9 appendString:v7];
      }
      id v16 = v12;
      char v13 = [v8 scanUpToString:v6 intoString:&v16];
      id v14 = v16;

      v12 = v14;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    id v14 = v11;
  }

  return v9;
}

+ (id)stringWithFileSystemRepresentation:()CalendarExtensions
{
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v4 stringWithFileSystemRepresentation:a3 length:strlen(a3)];

  return v5;
}

- (id)removeSlashIfNeeded
{
  if ([a1 hasSuffix:@"/"])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)appendSlashIfNeeded
{
  if ([a1 hasSuffix:@"/"])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 stringByAppendingString:@"/"];
  }
  return v2;
}

@end