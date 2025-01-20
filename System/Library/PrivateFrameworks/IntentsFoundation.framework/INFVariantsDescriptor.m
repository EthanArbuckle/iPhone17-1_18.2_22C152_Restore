@interface INFVariantsDescriptor
+ (id)variant;
+ (id)variantWithVariants:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (INFVariantsDescriptor)init;
- (INFVariantsDescriptor)initWithVariants:(unint64_t)a3;
- (NSString)dictionaryKey;
- (id)append:(id)a3 toString:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)variantByRemovingOneAttribute;
- (unint64_t)gender;
- (unint64_t)plurality;
- (void)setGender:(unint64_t)a3;
- (void)setPlurality:(unint64_t)a3;
@end

@implementation INFVariantsDescriptor

- (void)setGender:(unint64_t)a3
{
  self->_gender = a3;
}

- (unint64_t)gender
{
  return self->_gender;
}

- (void)setPlurality:(unint64_t)a3
{
  self->_plurality = a3;
}

- (unint64_t)plurality
{
  return self->_plurality;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INFVariantsDescriptor *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t gender = self->_gender;
    if (gender != [(INFVariantsDescriptor *)v4 gender])
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }
    unint64_t plurality = self->_plurality;
    BOOL v7 = plurality == [(INFVariantsDescriptor *)v4 plurality];
  }
  else
  {
    BOOL v7 = self == v4;
  }
  BOOL v8 = v7;
LABEL_9:

  return v8;
}

- (id)variantByRemovingOneAttribute
{
  v2 = (void *)[(INFVariantsDescriptor *)self copy];
  if ([v2 gender])
  {
    [v2 setGender:0];
  }
  else if ([v2 plurality])
  {
    [v2 setPlurality:0];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    [v4 setPlurality:self->_plurality];
    [v5 setGender:self->_gender];
  }
  return v5;
}

- (INFVariantsDescriptor)initWithVariants:(unint64_t)a3
{
  char v3 = a3;
  result = [(INFVariantsDescriptor *)self init];
  if (result)
  {
    if (v3)
    {
      result->_unint64_t plurality = 1;
      if ((v3 & 2) == 0)
      {
LABEL_4:
        if ((v3 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_10;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_4;
    }
    result->_unint64_t plurality = 2;
    if ((v3 & 4) == 0)
    {
LABEL_5:
      if ((v3 & 8) == 0) {
        return result;
      }
      goto LABEL_6;
    }
LABEL_10:
    result->_unint64_t gender = 2;
    if ((v3 & 8) == 0) {
      return result;
    }
LABEL_6:
    result->_unint64_t gender = 1;
  }
  return result;
}

- (INFVariantsDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)INFVariantsDescriptor;
  result = [(INFVariantsDescriptor *)&v3 init];
  if (result)
  {
    result->_unint64_t plurality = 0;
    result->_unint64_t gender = 0;
  }
  return result;
}

- (id)append:(id)a3 toString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [NSString stringWithFormat:@"%@, %@", v6, v5];
  }
  else
  {
    id v7 = v5;
  }
  BOOL v8 = v7;

  return v8;
}

- (NSString)dictionaryKey
{
  unint64_t plurality = self->_plurality;
  if (plurality)
  {
    v4 = @"LOCPluralityNone";
    if (plurality == 1) {
      v4 = @"LOCPluralityOne";
    }
    if (plurality == 2) {
      id v5 = @"LOCPluralityOther";
    }
    else {
      id v5 = v4;
    }
    id v6 = v5;
    id v7 = [(INFVariantsDescriptor *)self append:v6 toString:&stru_1F37C4EF0];
  }
  else
  {
    id v7 = &stru_1F37C4EF0;
  }
  unint64_t gender = self->_gender;
  if (gender)
  {
    v9 = @"LOCGenderNone";
    if (gender == 1) {
      v9 = @"LOCGenderFeminine";
    }
    if (gender == 2) {
      v10 = @"LOCGenderMasculine";
    }
    else {
      v10 = v9;
    }
    v11 = v10;
    uint64_t v12 = [(INFVariantsDescriptor *)self append:v11 toString:v7];

    id v7 = (__CFString *)v12;
  }
  if ([(__CFString *)v7 isEqualToString:&stru_1F37C4EF0])
  {
    v13 = @"LOCVariantsNone";

    id v7 = @"LOCVariantsNone";
  }
  return (NSString *)v7;
}

+ (id)variant
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)variantWithVariants:(unint64_t)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithVariants:a3];
  return v3;
}

@end