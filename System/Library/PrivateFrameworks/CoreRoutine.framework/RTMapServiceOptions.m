@interface RTMapServiceOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)useBackgroundTraits;
- (NSString)analyticsIdentifier;
- (NSString)clientIdentifier;
- (RTMapServiceOptions)init;
- (RTMapServiceOptions)initWithCoder:(id)a3;
- (RTMapServiceOptions)initWithUseBackgroundTraits:(BOOL)a3 analyticsIdentifier:(id)a4;
- (RTMapServiceOptions)initWithUseBackgroundTraits:(BOOL)a3 analyticsIdentifier:(id)a4 clientIdentifier:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTMapServiceOptions

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)useBackgroundTraits
{
  return self->_useBackgroundTraits;
}

- (RTMapServiceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"useBackgroundTraits"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];

  v8 = [(RTMapServiceOptions *)self initWithUseBackgroundTraits:v5 analyticsIdentifier:v6 clientIdentifier:v7];
  return v8;
}

- (RTMapServiceOptions)initWithUseBackgroundTraits:(BOOL)a3 analyticsIdentifier:(id)a4 clientIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RTMapServiceOptions;
  v11 = [(RTMapServiceOptions *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_useBackgroundTraits = a3;
    objc_storeStrong((id *)&v11->_analyticsIdentifier, a4);
    objc_storeStrong((id *)&v12->_clientIdentifier, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL useBackgroundTraits = self->_useBackgroundTraits;
  id v5 = a3;
  [v5 encodeBool:useBackgroundTraits forKey:@"useBackgroundTraits"];
  [v5 encodeObject:self->_analyticsIdentifier forKey:@"analyticsIdentifier"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
}

- (RTMapServiceOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithUseBackgroundTraits_analyticsIdentifier_clientIdentifier_);
}

- (RTMapServiceOptions)initWithUseBackgroundTraits:(BOOL)a3 analyticsIdentifier:(id)a4
{
  return [(RTMapServiceOptions *)self initWithUseBackgroundTraits:a3 analyticsIdentifier:a4 clientIdentifier:0];
}

@end