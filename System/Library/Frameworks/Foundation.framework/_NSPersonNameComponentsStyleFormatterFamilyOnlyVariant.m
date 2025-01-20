@interface _NSPersonNameComponentsStyleFormatterFamilyOnlyVariant
- (BOOL)fullComponentsAreValid:(id)a3;
- (id)abbreviatedKeys;
- (id)keysOfInterest;
- (int64_t)shortNameFormat;
@end

@implementation _NSPersonNameComponentsStyleFormatterFamilyOnlyVariant

- (int64_t)shortNameFormat
{
  return 4;
}

- (id)keysOfInterest
{
  id result = self->super.super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"familyName", 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)abbreviatedKeys
{
  return 0;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_NSPersonNameComponentsStyleFormatterFamilyOnlyVariant;
  BOOL v4 = -[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](&v6, sel_fullComponentsAreValid_);
  if (v4) {
    LOBYTE(v4) = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "familyName"), "length") > 1;
  }
  return v4;
}

@end