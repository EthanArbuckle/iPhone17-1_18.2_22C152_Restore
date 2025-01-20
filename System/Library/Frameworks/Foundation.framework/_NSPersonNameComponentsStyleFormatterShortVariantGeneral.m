@interface _NSPersonNameComponentsStyleFormatterShortVariantGeneral
- (id)fallbackStyleFormatter;
- (int64_t)shortNameFormat;
@end

@implementation _NSPersonNameComponentsStyleFormatterShortVariantGeneral

- (int64_t)shortNameFormat
{
  return 0;
}

- (id)fallbackStyleFormatter
{
  v2 = [[_NSPersonNameComponentsStyleFormatterShortNameSimpleFallback alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];

  return v2;
}

@end