@interface EMTAlternativeDescription
- (BOOL)isEqual:(id)a3;
- (EMTAlternativeDescription)initWithGenderDescription:(id)a3;
- (EMTAlternativeDescription)initWithMeaningDescription:(id)a3;
- (EMTGenderDescription)genderDescription;
- (EMTMeaningDescription)meaningDescription;
- (unint64_t)alternativeType;
@end

@implementation EMTAlternativeDescription

- (EMTAlternativeDescription)initWithGenderDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMTAlternativeDescription;
  v6 = [(EMTAlternativeDescription *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_alternativeType = 0;
    objc_storeStrong((id *)&v6->_genderDescription, a3);
  }

  return v7;
}

- (EMTAlternativeDescription)initWithMeaningDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMTAlternativeDescription;
  v6 = [(EMTAlternativeDescription *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_alternativeType = 1;
    objc_storeStrong((id *)&v6->_meaningDescription, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = v5;
    unint64_t alternativeType = self->_alternativeType;
    if (alternativeType == 1)
    {
      meaningDescription = self->_meaningDescription;
      objc_super v9 = [v5 meaningDescription];
      BOOL v10 = [(EMTMeaningDescription *)meaningDescription isEqual:v9];
    }
    else
    {
      if (alternativeType)
      {
        BOOL v11 = 0;
        goto LABEL_9;
      }
      genderDescription = self->_genderDescription;
      objc_super v9 = [v5 genderDescription];
      BOOL v10 = [(EMTGenderDescription *)genderDescription isEqual:v9];
    }
    BOOL v11 = v10;

LABEL_9:
    goto LABEL_10;
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)alternativeType
{
  return self->_alternativeType;
}

- (EMTGenderDescription)genderDescription
{
  return self->_genderDescription;
}

- (EMTMeaningDescription)meaningDescription
{
  return self->_meaningDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningDescription, 0);
  objc_storeStrong((id *)&self->_genderDescription, 0);
}

@end