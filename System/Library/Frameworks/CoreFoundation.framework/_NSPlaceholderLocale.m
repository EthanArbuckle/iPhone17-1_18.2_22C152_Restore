@interface _NSPlaceholderLocale
- (_NSPlaceholderLocale)initWithLocaleIdentifier:(id)a3;
@end

@implementation _NSPlaceholderLocale

- (_NSPlaceholderLocale)initWithLocaleIdentifier:(id)a3
{
  if (a3) {
    return (_NSPlaceholderLocale *)CFLocaleCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleIdentifier)a3);
  }
  else {
    return 0;
  }
}

@end