@interface LACDTOLocationState
+ (id)nullInstance;
+ (id)strictLocationState;
- (BOOL)confirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInFamiliarLocation;
- (BOOL)isValid:(id)a3;
- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4;
- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4 createdAt:(id)a5;
- (NSDate)createdAt;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LACDTOLocationState

- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [MEMORY[0x263EFF910] now];
  v8 = [(LACDTOLocationState *)self initWithRawValue:a3 confirmed:v4 createdAt:v7];

  return v8;
}

- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4 createdAt:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOLocationState;
  v10 = [(LACDTOLocationState *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_rawValue = a3;
    v10->_confirmed = a4;
    objc_storeStrong((id *)&v10->_createdAt, a5);
  }

  return v11;
}

+ (id)nullInstance
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRawValue:0 confirmed:0];
  return v2;
}

+ (id)strictLocationState
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRawValue:0 confirmed:0];
  return v2;
}

- (BOOL)isValid:(id)a3
{
  id v4 = a3;
  if ([(NSDate *)self->_createdAt compare:v4] == NSOrderedDescending)
  {
    BOOL v5 = 0;
  }
  else
  {
    [v4 timeIntervalSinceDate:self->_createdAt];
    BOOL v5 = v6 <= 5.0;
  }

  return v5;
}

- (BOOL)isInFamiliarLocation
{
  return self->_rawValue == 1;
}

- (id)description
{
  v35[6] = *MEMORY[0x263EF8340];
  int v3 = os_variant_allows_internal_security_policies();
  v32 = NSString;
  uint64_t v31 = objc_opt_class();
  id v4 = NSString;
  if (v3)
  {
    BOOL v5 = [(LACDTOLocationState *)self isInFamiliarLocation];
    double v6 = @"OFF";
    if (v5) {
      double v6 = @"ON";
    }
  }
  else
  {
    double v6 = @"<private>";
  }
  v33 = [v4 stringWithFormat:@"DSLMode: %@", v6];
  v35[0] = v33;
  v7 = NSString;
  int v34 = v3;
  if (v3)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", -[LACDTOLocationState rawValue](self, "rawValue"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = @"<private>";
  }
  v29 = v8;
  v30 = [v7 stringWithFormat:@"rawValue: %@", v8];
  v35[1] = v30;
  id v9 = NSString;
  BOOL v10 = [(LACDTOLocationState *)self confirmed];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  v12 = [v9 stringWithFormat:@"confirmed: %@", v11];
  v35[2] = v12;
  objc_super v13 = NSString;
  v14 = [(LACDTOLocationState *)self createdAt];
  v15 = [v13 stringWithFormat:@"createdAt: %@", v14];
  v35[3] = v15;
  v16 = NSString;
  v17 = [(LACDTOLocationState *)self createdAt];
  [v17 timeIntervalSince1970];
  v19 = [v16 stringWithFormat:@"createdAtTimestamp: %.2f", v18];
  v35[4] = v19;
  v20 = NSString;
  v21 = [MEMORY[0x263EFF910] now];
  BOOL v22 = [(LACDTOLocationState *)self isValid:v21];
  v23 = @"NO";
  if (v22) {
    v23 = @"YES";
  }
  v24 = [v20 stringWithFormat:@"isValid: %@", v23];
  v35[5] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:6];
  v26 = [v25 componentsJoinedByString:@"; "];
  v27 = [v32 stringWithFormat:@"<%@ %p; %@>", v31, self, v26];

  if (v34) {
  return v27;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(LACDTOLocationState *)self isInFamiliarLocation];
    if (v6 == [v5 isInFamiliarLocation])
    {
      v8 = [(LACDTOLocationState *)self createdAt];
      id v9 = [v5 createdAt];
      BOOL v7 = v8 == v9;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (void).cxx_destruct
{
}

@end