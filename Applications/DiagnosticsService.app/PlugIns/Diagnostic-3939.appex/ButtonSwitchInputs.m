@interface ButtonSwitchInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (DAButtonParameters)buttonParameters;
- (DAButtonSwitchSpecification)buttonSwitchSpecification;
- (DASwitchParameters)switchParameters;
- (DATouchButtonParameters)touchButtonParameters;
- (NSDictionary)parameters;
- (NSDictionary)predicates;
- (NSDictionary)specifications;
- (NSString)identifier;
- (NSString)type;
- (void)setButtonParameters:(id)a3;
- (void)setButtonSwitchSpecification:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPredicates:(id)a3;
- (void)setSpecifications:(id)a3;
- (void)setSwitchParameters:(id)a3;
- (void)setTouchButtonParameters:(id)a3;
- (void)setType:(id)a3;
@end

@implementation ButtonSwitchInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  id v4 = a3;
  char v26 = 0;
  [(ButtonSwitchInputs *)self setPredicates:v4];
  v5 = +[NSSet setWithObjects:@"Button", @"TouchButton", @"Switch", 0];
  v6 = [v4 dk_stringFromRequiredKey:@"type" inSet:v5 failed:&v26];
  [(ButtonSwitchInputs *)self setType:v6];

  v7 = +[NSSet set];
  v8 = [(ButtonSwitchInputs *)self type];
  unsigned int v9 = [v8 isEqualToString:@"Button"];

  if (v9)
  {
    +[NSSet setWithObjects:@"Home", @"Sleep", @"VolumeIncrement", @"VolumeDecrement", @"DigitalCrown", @"Side", @"App", @"RingerButton", 0];
    uint64_t v15 = LABEL_8:;

    v7 = (void *)v15;
    goto LABEL_9;
  }
  v10 = [(ButtonSwitchInputs *)self type];
  unsigned int v11 = [v10 isEqualToString:@"TouchButton"];

  if (v11)
  {
    v12 = DAIdentifierCamera;
LABEL_7:
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", *v12, 0, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_8;
  }
  v13 = [(ButtonSwitchInputs *)self type];
  unsigned int v14 = [v13 isEqualToString:@"Switch"];

  if (v14)
  {
    v12 = DAIdentifierRingerSwitch;
    goto LABEL_7;
  }
LABEL_9:
  v16 = [v4 dk_stringFromRequiredKey:@"identifier" inSet:v7 failed:&v26];
  [(ButtonSwitchInputs *)self setIdentifier:v16];

  BOOL v17 = v26 == 0;
  return v17;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4 = a3;
  [(ButtonSwitchInputs *)self setSpecifications:v4];
  v5 = [[DAButtonSwitchSpecification alloc] initWithDictionary:v4];

  [(ButtonSwitchInputs *)self setButtonSwitchSpecification:v5];
  v6 = [(ButtonSwitchInputs *)self buttonSwitchSpecification];
  LOBYTE(self) = v6 != 0;

  return (char)self;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  [(ButtonSwitchInputs *)self setParameters:v4];
  v5 = [(ButtonSwitchInputs *)self type];
  unsigned int v6 = [v5 isEqualToString:@"Button"];

  if (v6)
  {
    v7 = [[DAButtonParameters alloc] initWithDictionary:v4];
    [(ButtonSwitchInputs *)self setButtonParameters:v7];

    v8 = [(ButtonSwitchInputs *)self buttonParameters];
  }
  else
  {
    unsigned int v9 = [(ButtonSwitchInputs *)self type];
    unsigned int v10 = [v9 isEqualToString:@"TouchButton"];

    if (v10)
    {
      unsigned int v11 = [[DATouchButtonParameters alloc] initWithDictionary:v4];
      [(ButtonSwitchInputs *)self setTouchButtonParameters:v11];

      v8 = [(ButtonSwitchInputs *)self touchButtonParameters];
    }
    else
    {
      v12 = [(ButtonSwitchInputs *)self type];
      unsigned int v13 = [v12 isEqualToString:@"Switch"];

      if (!v13)
      {
        BOOL v15 = 1;
        goto LABEL_8;
      }
      unsigned int v14 = [[DASwitchParameters alloc] initWithDictionary:v4];
      [(ButtonSwitchInputs *)self setSwitchParameters:v14];

      v8 = [(ButtonSwitchInputs *)self switchParameters];
    }
  }
  BOOL v15 = v8 != 0;

LABEL_8:
  return v15;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (DAButtonParameters)buttonParameters
{
  return self->_buttonParameters;
}

- (void)setButtonParameters:(id)a3
{
}

- (DATouchButtonParameters)touchButtonParameters
{
  return self->_touchButtonParameters;
}

- (void)setTouchButtonParameters:(id)a3
{
}

- (DASwitchParameters)switchParameters
{
  return self->_switchParameters;
}

- (void)setSwitchParameters:(id)a3
{
}

- (DAButtonSwitchSpecification)buttonSwitchSpecification
{
  return self->_buttonSwitchSpecification;
}

- (void)setButtonSwitchSpecification:(id)a3
{
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
}

- (NSDictionary)specifications
{
  return self->_specifications;
}

- (void)setSpecifications:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_specifications, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_buttonSwitchSpecification, 0);
  objc_storeStrong((id *)&self->_switchParameters, 0);
  objc_storeStrong((id *)&self->_touchButtonParameters, 0);
  objc_storeStrong((id *)&self->_buttonParameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end