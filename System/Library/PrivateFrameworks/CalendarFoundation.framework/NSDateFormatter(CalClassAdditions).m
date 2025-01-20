@interface NSDateFormatter(CalClassAdditions)
+ (id)CalSharedDateFormatter;
@end

@implementation NSDateFormatter(CalClassAdditions)

+ (id)CalSharedDateFormatter
{
  v0 = [MEMORY[0x1E4F29060] currentThread];
  v1 = [v0 threadDictionary];
  v2 = [v1 objectForKey:@"CalSharedDateFormatterKey"];
  if (!v2)
  {
    v2 = objc_opt_new();
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v2 setLocale:v3];

    [v1 setObject:v2 forKey:@"CalSharedDateFormatterKey"];
  }
  [v2 setDateFormat:0];

  return v2;
}

@end