@interface NSString(DAExtensions)
+ (id)da_new64ByteGUID;
+ (id)da_newGUID;
- (BOOL)da_hasPrefixCaseInsensitive:()DAExtensions;
- (__CFString)da_stringByAddingPercentEscapesForUsername;
- (__CFString)da_stringByRemovingPercentEscapesForUsername;
- (__CFString)da_stringByURLEscapingPathComponent;
- (id)da_appendSlashIfNeeded;
- (id)da_removeSlashIfNeeded;
- (id)da_trimWhiteSpace;
@end

@implementation NSString(DAExtensions)

- (__CFString)da_stringByAddingPercentEscapesForUsername
{
  v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], originalString, &stru_1F13DB4B0, @"@?/:", 0x8000100u);
  return v1;
}

- (__CFString)da_stringByRemovingPercentEscapesForUsername
{
  v1 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], originalString, &stru_1F13DB4B0);
  return v1;
}

- (id)da_removeSlashIfNeeded
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

- (id)da_appendSlashIfNeeded
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

- (__CFString)da_stringByURLEscapingPathComponent
{
  CFStringRef v2 = CFURLCreateStringByAddingPercentEscapes(0, originalString, &stru_1F13DB4B0, @"@?/", 0x8000100u);
  v3 = (__CFString *)v2;
  if (v2) {
    v4 = (__CFString *)v2;
  }
  else {
    v4 = originalString;
  }
  v5 = v4;

  return v5;
}

- (BOOL)da_hasPrefixCaseInsensitive:()DAExtensions
{
  return [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)da_trimWhiteSpace
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTrimWhitespace(v1);
  CFStringRef v2 = (void *)[(__CFString *)v1 copy];

  return v2;
}

+ (id)da_newGUID
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  v1 = [v0 UUIDString];

  return v1;
}

+ (id)da_new64ByteGUID
{
  v0 = objc_msgSend(NSString, "da_newGUID");
  v1 = (void *)[v0 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"-", &stru_1F13DB4B0, 0, 0, objc_msgSend(v1, "length"));
  CFStringRef v2 = objc_msgSend(v1, "stringByAppendingFormat:", @"%0.*d", 64 - objc_msgSend(v1, "length"), 0);

  return v2;
}

@end