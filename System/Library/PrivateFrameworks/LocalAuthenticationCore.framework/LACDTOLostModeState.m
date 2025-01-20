@interface LACDTOLostModeState
+ (id)nullInstance;
- (BOOL)confirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInLostMode;
- (BOOL)isValid:(id)a3;
- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3;
- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4;
- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4 createdAt:(id)a5;
- (NSDate)createdAt;
- (id)description;
@end

@implementation LACDTOLostModeState

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263EFF910] now];
  v6 = [(LACDTOLostModeState *)self initWithIsInLostMode:v3 confirmed:0 createdAt:v5];

  return v6;
}

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [MEMORY[0x263EFF910] now];
  v8 = [(LACDTOLostModeState *)self initWithIsInLostMode:v5 confirmed:v4 createdAt:v7];

  return v8;
}

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4 createdAt:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOLostModeState;
  v10 = [(LACDTOLostModeState *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_isInLostMode = a3;
    objc_storeStrong((id *)&v10->_createdAt, a5);
    v11->_confirmed = a4;
  }

  return v11;
}

+ (id)nullInstance
{
  v2 = [[LACDTOLostModeState alloc] initWithIsInLostMode:1];
  return v2;
}

- (BOOL)isValid:(id)a3
{
  id v4 = a3;
  if (self->_confirmed && [(NSDate *)self->_createdAt compare:v4] != NSOrderedDescending)
  {
    uint64_t v6 = [v4 timeIntervalSinceDate:self->_createdAt];
    BOOL v5 = v7 <= LACDTOLostModeStateMaxAgeSeconds(v6);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 isInLostMode];
    if (v6 == [(LACDTOLostModeState *)self isInLostMode]
      && (int v7 = [v5 confirmed], v7 == -[LACDTOLostModeState confirmed](self, "confirmed")))
    {
      id v9 = [v5 createdAt];
      v10 = [(LACDTOLostModeState *)self createdAt];
      BOOL v8 = v9 == v10;
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

- (id)description
{
  v29[6] = *MEMORY[0x263EF8340];
  int v3 = os_variant_allows_internal_security_policies();
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    int v7 = NSString;
    if ([(LACDTOLostModeState *)self isInLostMode]) {
      BOOL v8 = @"YES";
    }
    else {
      BOOL v8 = @"NO";
    }
    v28 = [v7 stringWithFormat:@"isInLostMode: %@", v8];
    v29[0] = v28;
    id v9 = NSString;
    if ([(LACDTOLostModeState *)self confirmed]) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    v27 = [v9 stringWithFormat:@"confirmed: %@", v10];
    v29[1] = v27;
    v11 = NSString;
    v26 = [(LACDTOLostModeState *)self createdAt];
    v25 = [v11 stringWithFormat:@"createdAt: %@", v26];
    v29[2] = v25;
    v12 = NSString;
    objc_super v13 = [(LACDTOLostModeState *)self createdAt];
    [v13 timeIntervalSince1970];
    v15 = [v12 stringWithFormat:@"createdAtTimestamp: %.2f", v14];
    v29[3] = v15;
    v16 = NSString;
    v17 = [MEMORY[0x263EFF910] now];
    if ([(LACDTOLostModeState *)self isValid:v17]) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    v19 = [v16 stringWithFormat:@"isValid: %@", v18];
    v29[4] = v19;
    v20 = [NSString stringWithFormat:@"maxAge: %.2f", LACDTOLostModeStateMaxAgeSeconds((uint64_t)v19)];
    v29[5] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:6];
    v22 = [v21 componentsJoinedByString:@"; "];
    v23 = [v4 stringWithFormat:@"<%@ %p; %@>", v6, self, v22];
  }
  else
  {
    v23 = [v4 stringWithFormat:@"<%@ %p>", v5, self];
  }
  return v23;
}

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void).cxx_destruct
{
}

@end