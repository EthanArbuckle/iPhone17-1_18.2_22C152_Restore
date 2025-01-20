@interface NSError(CATVerboseDescription)
+ (id)formattedCode:()CATVerboseDescription;
- (id)verboseDescriptionWithIdentation:()CATVerboseDescription;
- (uint64_t)formattedCode;
- (uint64_t)verboseDescription;
@end

@implementation NSError(CATVerboseDescription)

- (id)verboseDescriptionWithIdentation:()CATVerboseDescription
{
  v4 = [&stru_26C4A6940 stringByPaddingToLength:a3 withString:@" " startingAtIndex:0];
  v5 = [a1 userInfo];
  v6 = (void *)[v5 mutableCopy];

  v7 = [MEMORY[0x263F089D8] stringWithFormat:@"%@%@: %p\n", v4, objc_opt_class(), a1];
  uint64_t v8 = [a1 localizedDescription];
  v9 = (void *)v8;
  if (v8) {
    [v7 appendFormat:@"%@Desc   : %@\n", v4, v8];
  }
  uint64_t v10 = [a1 localizedRecoverySuggestion];
  v11 = (void *)v10;
  if (v10) {
    [v7 appendFormat:@"%@Sugg   : %@\n", v4, v10];
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"NSDescription"];
  v13 = (void *)v12;
  if (v12) {
    [v7 appendFormat:@"%@US Desc: %@\n", v4, v12];
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"NSRecoverySuggestion"];
  v15 = (void *)v14;
  if (v14) {
    [v7 appendFormat:@"%@US Sugg: %@\n", v4, v14];
  }
  v16 = [a1 domain];
  [v7 appendFormat:@"%@Domain : %@\n", v4, v16];

  v17 = [a1 formattedCode];
  [v7 appendFormat:@"%@Code   : %@\n", v4, v17];

  v18 = [a1 userInfo];
  uint64_t v19 = *MEMORY[0x263F08608];
  v20 = [v18 objectForKey:*MEMORY[0x263F08608]];

  if (v20)
  {
    v21 = [v20 verboseDescriptionWithIdentation:a3 + 2];
    [v7 appendFormat:@"%@...Underlying error:\n%@", v4, v21];
  }
  [v6 removeObjectForKey:*MEMORY[0x263F08320]];
  [v6 removeObjectForKey:@"NSDescription"];
  [v6 removeObjectForKey:*MEMORY[0x263F08348]];
  [v6 removeObjectForKey:@"NSRecoverySuggestion"];
  [v6 removeObjectForKey:v19];
  if ([v6 count]) {
    [v7 appendFormat:@"%@Extra info:\n%@", v4, v6];
  }

  return v7;
}

- (uint64_t)verboseDescription
{
  return [a1 verboseDescriptionWithIdentation:0];
}

+ (id)formattedCode:()CATVerboseDescription
{
  uint64_t v4 = a3 >> 26;
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"0x%lX (%ld)", a3, a3);
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 stringByAppendingFormat:@" [sys = 0x%1$lX, sub = 0x%2$lX, code = 0x%3$lX (%3$ld)]", v4, (a3 >> 14) & 0xFFF, a3 & 0x3FFF];

    v6 = (void *)v7;
  }

  return v6;
}

- (uint64_t)formattedCode
{
  v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v2 = [a1 code];

  return [v1 formattedCode:v2];
}

@end