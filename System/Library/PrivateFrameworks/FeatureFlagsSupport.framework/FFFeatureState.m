@interface FFFeatureState
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5;
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 buildVersion:(id)a6;
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8;
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8 buildVersion:(id)a9;
- (NSDictionary)attributes;
- (NSString)buildVersion;
- (NSString)disclosurerequired;
- (NSString)domain;
- (NSString)feature;
- (NSString)phase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)value;
- (void)setAttributes:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDisclosurerequired:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFeature:(id)a3;
- (void)setPhase:(id)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation FFFeatureState

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[FFFeatureState alloc] initWithDomain:v9 feature:v8 value:a5 phase:0 disclosureRequired:0 attributes:0 buildVersion:0];

  return v10;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 buildVersion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [[FFFeatureState alloc] initWithDomain:v12 feature:v11 value:a5 phase:0 disclosureRequired:0 attributes:0 buildVersion:v10];

  return v13;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  v19 = [[FFFeatureState alloc] initWithDomain:v18 feature:v17 value:a5 phase:v16 disclosureRequired:v15 attributes:v14 buildVersion:0];

  return v19;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8 buildVersion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v24.receiver = self;
  v24.super_class = (Class)FFFeatureState;
  v21 = [(FFFeatureState *)&v24 init];
  v22 = v21;
  if (v21)
  {
    [(FFFeatureState *)v21 setAttributes:v19];
    [(FFFeatureState *)v22 setDomain:v15];
    [(FFFeatureState *)v22 setFeature:v16];
    [(FFFeatureState *)v22 setValue:a5];
    [(FFFeatureState *)v22 setPhase:v17];
    [(FFFeatureState *)v22 setDisclosurerequired:v18];
    [(FFFeatureState *)v22 setBuildVersion:v20];
  }

  return v22;
}

- (id)description
{
  unint64_t v3 = [(FFFeatureState *)self value];
  if (v3 >= 3) {
    v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"invalid (%d)", -[FFFeatureState value](self, "value"));
  }
  else {
    v4 = off_1E6CC61B8[v3];
  }
  id v5 = [NSString alloc];
  v6 = [(FFFeatureState *)self domain];
  v7 = [(FFFeatureState *)self feature];
  id v8 = (void *)[v5 initWithFormat:@"Feature %@/%@ state %@", v6, v7, v4];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FFFeatureState alloc];
  id v5 = [(FFFeatureState *)self domain];
  v6 = [(FFFeatureState *)self feature];
  int64_t v7 = [(FFFeatureState *)self value];
  id v8 = [(FFFeatureState *)self phase];
  id v9 = [(FFFeatureState *)self disclosurerequired];
  id v10 = [(FFFeatureState *)self attributes];
  id v11 = [(FFFeatureState *)v4 initWithDomain:v5 feature:v6 value:v7 phase:v8 disclosureRequired:v9 attributes:v10];

  return v11;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (NSString)disclosurerequired
{
  return self->_disclosurerequired;
}

- (void)setDisclosurerequired:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosurerequired, 0);
  objc_storeStrong((id *)&self->_phase, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end