@interface NSError(AEAdditions)
+ (id)formattedCode:()AEAdditions;
- (id)verboseDescriptionWithIndentation:()AEAdditions;
- (uint64_t)ae_verboseDescription;
@end

@implementation NSError(AEAdditions)

- (uint64_t)ae_verboseDescription
{
  return [a1 verboseDescriptionWithIndentation:0];
}

- (id)verboseDescriptionWithIndentation:()AEAdditions
{
  v5 = [&stru_26F13DFF8 stringByPaddingToLength:a3 withString:@" " startingAtIndex:0];
  v6 = [a1 userInfo];
  v7 = (void *)[v6 mutableCopy];

  v8 = [MEMORY[0x263F089D8] stringWithFormat:@"%@%@: %@\n", v5, objc_opt_class(), a1];
  v9 = [a1 localizedDescription];

  if (v9)
  {
    v10 = [a1 localizedDescription];
    [v8 appendFormat:@"%@Desc   : %@\n", v5, v10];

    [v7 removeObjectForKey:*MEMORY[0x263F08320]];
  }
  v11 = [a1 localizedRecoverySuggestion];

  if (v11)
  {
    v12 = [a1 localizedRecoverySuggestion];
    [v8 appendFormat:@"%@Sugg   : %@\n", v5, v12];

    [v7 removeObjectForKey:*MEMORY[0x263F08348]];
  }
  v13 = [a1 userInfo];
  v14 = [v13 objectForKeyedSubscript:@"NSDescription"];

  if (v14)
  {
    v15 = [a1 userInfo];
    v16 = [v15 objectForKeyedSubscript:@"NSDescription"];
    [v8 appendFormat:@"%@US Desc: %@\n", v5, v16];

    [v7 removeObjectForKey:@"NSDescription"];
  }
  v17 = [a1 userInfo];
  v18 = [v17 objectForKeyedSubscript:@"NSRecoverySuggestion"];

  if (v18)
  {
    v19 = [a1 userInfo];
    v20 = [v19 objectForKeyedSubscript:@"NSRecoverySuggestion"];
    [v8 appendFormat:@"%@US Sugg: %@\n", v5, v20];

    [v7 removeObjectForKey:@"NSRecoverySuggestion"];
  }
  v21 = [a1 domain];
  [v8 appendFormat:@"%@Domain : %@\n", v5, v21];

  v22 = objc_msgSend((id)objc_opt_class(), "formattedCode:", objc_msgSend(a1, "code"));
  [v8 appendFormat:@"%@Code   : %@\n", v5, v22];

  v23 = [a1 userInfo];
  uint64_t v24 = *MEMORY[0x263F08608];
  v25 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v25)
  {
    v26 = [v25 verboseDescriptionWithIndentation:a3 + 2];
    [v8 appendFormat:@"%@...Underlying error:\n%@", v5, v26];

    [v7 removeObjectForKey:v24];
  }
  if ([v7 count]) {
    [v8 appendFormat:@"%@Extra info:\n%@", v5, v7];
  }

  return v8;
}

+ (id)formattedCode:()AEAdditions
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

@end