@interface _NSPersonNameComponentsStyleFormatterMedium
- (id)keysOfInterest;
@end

@implementation _NSPersonNameComponentsStyleFormatterMedium

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"givenName", @"familyName", 0);
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

@end