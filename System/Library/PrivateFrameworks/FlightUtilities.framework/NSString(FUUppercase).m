@interface NSString(FUUppercase)
- (id)FU_uppercaseStringUsingCurrentLocale:()FUUppercase;
@end

@implementation NSString(FUUppercase)

- (id)FU_uppercaseStringUsingCurrentLocale:()FUUppercase
{
  if (a3)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 preferredLocalizations];
    v6 = [v5 firstObject];

    v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v6];
    if (v7)
    {
      v8 = [a1 uppercaseStringWithLocale:v7];
    }
    else
    {
      v9 = [MEMORY[0x263EFF960] currentLocale];
      v8 = [a1 uppercaseStringWithLocale:v9];
    }
  }
  else
  {
    v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
    v8 = [a1 uppercaseStringWithLocale:v6];
  }

  return v8;
}

@end