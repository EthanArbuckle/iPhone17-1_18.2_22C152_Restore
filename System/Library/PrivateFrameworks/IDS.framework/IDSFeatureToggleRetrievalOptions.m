@interface IDSFeatureToggleRetrievalOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsWithFeatureID:(id)a3;
- (IDSFeatureToggleRetrievalOptions)initWithCoder:(id)a3;
- (IDSFeatureToggleRetrievalOptions)initWithFeatureID:(id)a3;
- (NSString)featureID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureID:(id)a3;
@end

@implementation IDSFeatureToggleRetrievalOptions

+ (id)optionsWithFeatureID:(id)a3
{
  id v3 = a3;
  v4 = [[IDSFeatureToggleRetrievalOptions alloc] initWithFeatureID:v3];

  return v4;
}

- (IDSFeatureToggleRetrievalOptions)initWithFeatureID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSFeatureToggleRetrievalOptions;
  v6 = [(IDSFeatureToggleRetrievalOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureID, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [IDSFeatureToggleRetrievalOptions alloc];
  id v5 = [(IDSFeatureToggleRetrievalOptions *)self featureID];
  v6 = [(IDSFeatureToggleRetrievalOptions *)v4 initWithFeatureID:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleRetrievalOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fid"];

  v6 = [(IDSFeatureToggleRetrievalOptions *)self initWithFeatureID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSFeatureToggleRetrievalOptions *)self featureID];
  [v4 encodeObject:v5 forKey:@"fid"];
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end