@interface LACSharedMode
+ (id)defaultSharedMode;
- (BOOL)isActive;
- (BOOL)isConfirmed;
- (BOOL)isEqual:(id)a3;
- (LACSharedMode)initWithActive:(BOOL)a3;
- (LACSharedMode)initWithActive:(BOOL)a3 confirmed:(BOOL)a4;
- (id)description;
@end

@implementation LACSharedMode

- (id)description
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v10[0] = @"isActive";
  if ([(LACSharedMode *)self isActive]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v10[1] = @"isConfirmed";
  v11[0] = v5;
  if ([(LACSharedMode *)self isConfirmed]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v11[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v7];

  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (LACSharedMode)initWithActive:(BOOL)a3 confirmed:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LACSharedMode;
  result = [(LACSharedMode *)&v7 init];
  if (result)
  {
    result->_active = a3;
    result->_confirmed = a4;
  }
  return result;
}

- (LACSharedMode)initWithActive:(BOOL)a3
{
  return [(LACSharedMode *)self initWithActive:a3 confirmed:1];
}

+ (id)defaultSharedMode
{
  v2 = [[LACSharedMode alloc] initWithActive:0 confirmed:0];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(LACSharedMode *)self isActive];
    if (v6 == [v5 isActive])
    {
      BOOL v8 = [(LACSharedMode *)self isConfirmed];
      int v7 = v8 ^ [v5 isConfirmed] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

@end