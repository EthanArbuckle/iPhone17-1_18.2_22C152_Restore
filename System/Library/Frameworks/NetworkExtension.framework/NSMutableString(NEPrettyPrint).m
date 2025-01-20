@interface NSMutableString(NEPrettyPrint)
- (uint64_t)appendToStringAtColumnWithContent:()NEPrettyPrint column:content:appendAsNewLine:addNewLine:;
- (void)appendPrettyBOOL:()NEPrettyPrint withName:andIndent:options:;
- (void)appendPrettyHex:()NEPrettyPrint withName:andIndent:options:;
- (void)appendPrettyInt:()NEPrettyPrint withName:andIndent:options:;
- (void)appendPrettyObject:()NEPrettyPrint withName:andIndent:options:;
@end

@implementation NSMutableString(NEPrettyPrint)

- (uint64_t)appendToStringAtColumnWithContent:()NEPrettyPrint column:content:appendAsNewLine:addNewLine:
{
  uint64_t v11 = a4;
  if (a4 && a6)
  {
    v12 = a3;
    uint64_t v13 = a4;
    do
    {
      unsigned int v14 = *v12++;
      objc_msgSend(a1, "appendFormat:", @"%-*s", v14, "");
      --v13;
    }
    while (v13);
  }
  uint64_t result = objc_msgSend(a1, "appendFormat:", @"%-*s", a3[v11], a5);
  if (a7)
  {
    return [a1 appendString:@"\n"];
  }
  return result;
}

- (void)appendPrettyHex:()NEPrettyPrint withName:andIndent:options:
{
  if ((a6 & 0xC) != 4) {
    return (void *)[result appendFormat:@"\n%*s%@ = %llX", (4 * a5 + 4), " ", a4, a3, v6, v7];
  }
  return result;
}

- (void)appendPrettyInt:()NEPrettyPrint withName:andIndent:options:
{
  if ((a6 & 0xC) != 4) {
    return (void *)[result appendFormat:@"\n%*s%@ = %lld", (4 * a5 + 4), " ", a4, a3, v6, v7];
  }
  return result;
}

- (void)appendPrettyBOOL:()NEPrettyPrint withName:andIndent:options:
{
  if ((a6 & 0xC) != 4)
  {
    v8 = @"NO";
    if (a3) {
      v8 = @"YES";
    }
    return (void *)[result appendFormat:@"\n%*s%@ = %@", (4 * a5 + 4), " ", a4, v8, v6, v7];
  }
  return result;
}

- (void)appendPrettyObject:()NEPrettyPrint withName:andIndent:options:
{
  if (a3)
  {
    if ((a6 & 0xC) != 4) {
      -[NSMutableString appendPrettyObject:withName:andIndent:options:depth:](a1, a3, a4, a5, a6, 1uLL);
    }
  }
}

@end