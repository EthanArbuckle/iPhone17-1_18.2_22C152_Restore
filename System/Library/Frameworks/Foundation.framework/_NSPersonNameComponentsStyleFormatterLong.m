@interface _NSPersonNameComponentsStyleFormatterLong
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
@end

@implementation _NSPersonNameComponentsStyleFormatterLong

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = +[NSPersonNameComponents _allComponents];
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)fallbackStyleFormatter
{
  v2 = [[_NSPersonNameComponentsStyleFormatterNicknameVariant alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];

  return v2;
}

@end