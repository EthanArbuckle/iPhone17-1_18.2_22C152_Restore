@interface _NSPersonNameComponentsStyleFormatterNicknameVariant
- (id)abbreviatedKeys;
- (id)keysOfInterest;
- (id)orderedTemplate;
@end

@implementation _NSPersonNameComponentsStyleFormatterNicknameVariant

- (id)orderedTemplate
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"nickname";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"nickname", 0);
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)abbreviatedKeys
{
  return 0;
}

@end