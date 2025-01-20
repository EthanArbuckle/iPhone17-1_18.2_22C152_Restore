@interface _NSPersonNameComponentsStyleFormatterAvatar
- (BOOL)shouldFallBack;
- (id)fallbackStyleFormatter;
@end

@implementation _NSPersonNameComponentsStyleFormatterAvatar

- (id)fallbackStyleFormatter
{
  int64_t v3 = [(_NSPersonNameComponentsStyleFormatter *)self ordering];
  v4 = off_1E51F4770;
  if (v3 != 1) {
    v4 = off_1E51F4780;
  }
  v5 = objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));

  return v5;
}

- (BOOL)shouldFallBack
{
  return 1;
}

@end