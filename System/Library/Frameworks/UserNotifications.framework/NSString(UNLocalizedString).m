@interface NSString(UNLocalizedString)
- (uint64_t)un_localizedStringArguments;
- (uint64_t)un_localizedStringKey;
- (uint64_t)un_localizedStringValue;
@end

@implementation NSString(UNLocalizedString)

- (uint64_t)un_localizedStringArguments
{
  return 0;
}

- (uint64_t)un_localizedStringKey
{
  return 0;
}

- (uint64_t)un_localizedStringValue
{
  return 0;
}

@end