@interface EMTGenderDescription
- (BOOL)isEqual:(id)a3;
- (EMTGenderDescription)initWithGender:(unint64_t)a3 defaultGender:(unint64_t)a4;
- (unint64_t)defaultGender;
- (unint64_t)gender;
@end

@implementation EMTGenderDescription

- (EMTGenderDescription)initWithGender:(unint64_t)a3 defaultGender:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EMTGenderDescription;
  result = [(EMTGenderDescription *)&v7 init];
  if (result)
  {
    result->_gender = a3;
    result->_defaultGender = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t gender = self->_gender;
    if (gender == [v5 gender])
    {
      unint64_t defaultGender = self->_defaultGender;
      BOOL v8 = defaultGender == [v5 defaultGender];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)gender
{
  return self->_gender;
}

- (unint64_t)defaultGender
{
  return self->_defaultGender;
}

@end