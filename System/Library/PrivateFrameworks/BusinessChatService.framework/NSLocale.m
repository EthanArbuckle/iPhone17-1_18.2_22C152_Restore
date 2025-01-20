@interface NSLocale
+ (id)currentLanguage;
- (BOOL)isDevice24HourTime;
- (id)country;
- (id)language;
@end

@implementation NSLocale

- (id)language
{
  if (a1)
  {
    a1 = [a1 objectForKey:*MEMORY[0x263EFF508]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)country
{
  if (a1)
  {
    a1 = [a1 objectForKey:*MEMORY[0x263EFF4D0]];
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)currentLanguage
{
  self;
  if (![(id)currentLanguage_language length])
  {
    v0 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v1 = -[NSLocale language](v0);
    v2 = (void *)currentLanguage_language;
    currentLanguage_language = v1;
  }
  v3 = (void *)currentLanguage_language;

  return v3;
}

- (BOOL)isDevice24HourTime
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"j" options:0 locale:a1];
  BOOL v2 = [v1 rangeOfString:@"a"] == 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end