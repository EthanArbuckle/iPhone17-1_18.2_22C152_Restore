@interface LACDTOMutableFeatureState
+ (id)nullInstance;
- (BOOL)isAvailable;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStrictModeEnabled;
- (BOOL)isSupported;
- (LACDTOFeatureRequirements)requirements;
- (NSString)description;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsStrictModeEnabled:(BOOL)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setRequirements:(id)a3;
@end

@implementation LACDTOMutableFeatureState

+ (id)nullInstance
{
  v2 = objc_alloc_init(LACDTOMutableFeatureState);
  [(LACDTOMutableFeatureState *)v2 setIsSupported:0];
  [(LACDTOMutableFeatureState *)v2 setIsAvailable:0];
  [(LACDTOMutableFeatureState *)v2 setIsEnabled:0];
  [(LACDTOMutableFeatureState *)v2 setIsStrictModeEnabled:0];
  v3 = +[LACDTOMutableFeatureRequirements nullInstance];
  [(LACDTOMutableFeatureState *)v2 setRequirements:v3];

  return v2;
}

- (NSString)description
{
  v24[5] = *MEMORY[0x263EF8340];
  v23 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = NSString;
  if ([(LACDTOMutableFeatureState *)self isSupported]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v6 = [v4 stringWithFormat:@"isSupported: %@", v5];
  v24[0] = v6;
  v7 = NSString;
  if ([(LACDTOMutableFeatureState *)self isAvailable]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [v7 stringWithFormat:@"isAvailable: %@", v8];
  v24[1] = v9;
  v10 = NSString;
  if ([(LACDTOMutableFeatureState *)self isEnabled]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = [v10 stringWithFormat:@"isEnabled: %@", v11];
  v24[2] = v12;
  v13 = NSString;
  if ([(LACDTOMutableFeatureState *)self isStrictModeEnabled]) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  v15 = [v13 stringWithFormat:@"isStrictModeEnabled: %@", v14];
  v24[3] = v15;
  v16 = NSString;
  v17 = [(LACDTOMutableFeatureState *)self requirements];
  v18 = [v16 stringWithFormat:@"requirements: %@", v17];
  v24[4] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];
  v20 = [v19 componentsJoinedByString:@"; "];
  v21 = [v23 stringWithFormat:@"<%@ %p; %@>", v3, self, v20];

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(LACDTOMutableFeatureState *)self isSupported];
    if (v6 == [v5 isSupported]
      && (int v7 = [(LACDTOMutableFeatureState *)self isAvailable],
          v7 == [v5 isAvailable])
      && (int v8 = [(LACDTOMutableFeatureState *)self isEnabled],
          v8 == [v5 isEnabled])
      && (int v9 = [(LACDTOMutableFeatureState *)self isStrictModeEnabled],
          v9 == [v5 isStrictModeEnabled]))
    {
      v12 = [(LACDTOMutableFeatureState *)self requirements];
      uint64_t v13 = [v5 requirements];
      if (v12 == (void *)v13)
      {
        char v10 = 1;
        v14 = v12;
      }
      else
      {
        v14 = (void *)v13;
        v15 = [(LACDTOMutableFeatureState *)self requirements];
        v16 = [v5 requirements];
        char v10 = [v15 isEqual:v16];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isStrictModeEnabled
{
  return self->_isStrictModeEnabled;
}

- (void)setIsStrictModeEnabled:(BOOL)a3
{
  self->_isStrictModeEnabled = a3;
}

- (LACDTOFeatureRequirements)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end