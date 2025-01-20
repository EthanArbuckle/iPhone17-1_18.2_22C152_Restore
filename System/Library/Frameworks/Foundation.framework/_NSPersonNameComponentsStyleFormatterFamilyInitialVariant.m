@interface _NSPersonNameComponentsStyleFormatterFamilyInitialVariant
- (BOOL)fullComponentsAreValid:(id)a3;
- (id)abbreviatedKeys;
- (id)keysOfInterest;
- (int64_t)shortNameFormat;
@end

@implementation _NSPersonNameComponentsStyleFormatterFamilyInitialVariant

- (int64_t)shortNameFormat
{
  return 1;
}

- (id)keysOfInterest
{
  id result = self->super.super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"familyName", @"givenName", 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)abbreviatedKeys
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id result = self->super.super._abbreviatedKeys;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v5[0] = @"familyName";
    id result = (id)objc_msgSend(v4, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 1));
    self->super.super._abbreviatedKeys = (NSSet *)result;
  }
  return result;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_NSPersonNameComponentsStyleFormatterFamilyInitialVariant;
  LODWORD(v4) = -[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](&v6, sel_fullComponentsAreValid_);
  if (v4)
  {
    uint64_t v4 = [a3 familyName];
    if (v4) {
      LOBYTE(v4) = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "givenName"), "length") > 1;
    }
  }
  return v4;
}

@end