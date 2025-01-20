@interface LACDTOFeatureEnablementMode
+ (id)disabled;
+ (id)enabled;
+ (id)enabledWithGracePeriod;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGracePeriodEnabled;
- (LACDTOFeatureEnablementMode)initWithIsEnabled:(BOOL)a3 isGracePeriodEnabled:(BOOL)a4 rawValue:(int64_t)a5;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LACDTOFeatureEnablementMode

- (LACDTOFeatureEnablementMode)initWithIsEnabled:(BOOL)a3 isGracePeriodEnabled:(BOOL)a4 rawValue:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)LACDTOFeatureEnablementMode;
  result = [(LACDTOFeatureEnablementMode *)&v9 init];
  if (result)
  {
    result->_isEnabled = a3;
    result->_isGracePeriodEnabled = a4;
    result->_rawValue = a5;
  }
  return result;
}

+ (id)disabled
{
  v2 = [[LACDTOFeatureEnablementMode alloc] initWithIsEnabled:0 isGracePeriodEnabled:0 rawValue:0];
  return v2;
}

+ (id)enabled
{
  v2 = [[LACDTOFeatureEnablementMode alloc] initWithIsEnabled:1 isGracePeriodEnabled:0 rawValue:1];
  return v2;
}

+ (id)enabledWithGracePeriod
{
  v2 = [[LACDTOFeatureEnablementMode alloc] initWithIsEnabled:1 isGracePeriodEnabled:1 rawValue:2];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(LACDTOFeatureEnablementMode *)self isEnabled];
    if (v6 == [v5 isEnabled]
      && (int v7 = [(LACDTOFeatureEnablementMode *)self isGracePeriodEnabled],
          v7 == [v5 isGracePeriodEnabled]))
    {
      int64_t v9 = [(LACDTOFeatureEnablementMode *)self rawValue];
      BOOL v8 = v9 == [v5 rawValue];
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
  v18[3] = *MEMORY[0x263EF8340];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = NSString;
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOFeatureEnablementMode isEnabled](self, "isEnabled"));
  int v6 = [v4 stringWithFormat:@"isEnabled: %@", v5];
  v18[0] = v6;
  int v7 = NSString;
  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOFeatureEnablementMode isGracePeriodEnabled](self, "isGracePeriodEnabled"));
  int64_t v9 = [v7 stringWithFormat:@"isGracePeriodEnabled: %@", v8];
  v18[1] = v9;
  v10 = NSString;
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[LACDTOFeatureEnablementMode rawValue](self, "rawValue"));
  v12 = [v10 stringWithFormat:@"rawValue: %@", v11];
  v18[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v14 = [v13 componentsJoinedByString:@"; "];
  v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return v15;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isGracePeriodEnabled
{
  return self->_isGracePeriodEnabled;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

@end