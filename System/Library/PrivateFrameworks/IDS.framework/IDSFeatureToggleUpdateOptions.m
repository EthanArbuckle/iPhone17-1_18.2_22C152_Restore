@interface IDSFeatureToggleUpdateOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsWithFeatureID:(id)a3 state:(unint64_t)a4;
- (IDSFeatureToggleUpdateOptions)initWithCoder:(id)a3;
- (IDSFeatureToggleUpdateOptions)initWithFeatureID:(id)a3 state:(unint64_t)a4;
- (NSString)featureID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureID:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation IDSFeatureToggleUpdateOptions

+ (id)optionsWithFeatureID:(id)a3 state:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[IDSFeatureToggleUpdateOptions alloc] initWithFeatureID:v5 state:a4];

  return v6;
}

- (IDSFeatureToggleUpdateOptions)initWithFeatureID:(id)a3 state:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSFeatureToggleUpdateOptions;
  v8 = [(IDSFeatureToggleUpdateOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_featureID, a3);
    v9->_state = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [IDSFeatureToggleUpdateOptions alloc];
  id v5 = [(IDSFeatureToggleUpdateOptions *)self featureID];
  v6 = [(IDSFeatureToggleUpdateOptions *)v4 initWithFeatureID:v5 state:[(IDSFeatureToggleUpdateOptions *)self state]];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleUpdateOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fid"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"st"];

  id v7 = [(IDSFeatureToggleUpdateOptions *)self initWithFeatureID:v5 state:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(IDSFeatureToggleUpdateOptions *)self featureID];
  [v5 encodeObject:v4 forKey:@"fid"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[IDSFeatureToggleUpdateOptions state](self, "state"), @"st");
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end