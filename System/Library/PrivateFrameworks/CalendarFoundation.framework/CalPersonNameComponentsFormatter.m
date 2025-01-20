@interface CalPersonNameComponentsFormatter
+ (id)personNameComponentsFromString:(id)a3;
@end

@implementation CalPersonNameComponentsFormatter

+ (id)personNameComponentsFromString:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F29060] currentThread];
  v5 = [v4 threadDictionary];
  v6 = [v5 objectForKey:@"kCalThreadLocalPersonNameComponentsFormatterKey"];

  if (!v6)
  {
    v6 = objc_opt_new();
    v7 = [MEMORY[0x1E4F29060] currentThread];
    v8 = [v7 threadDictionary];
    [v8 setObject:v6 forKey:@"kCalThreadLocalPersonNameComponentsFormatterKey"];
  }
  v9 = [v6 personNameComponentsFromString:v3];

  return v9;
}

@end