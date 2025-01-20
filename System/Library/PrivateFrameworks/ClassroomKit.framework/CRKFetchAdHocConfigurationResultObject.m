@interface CRKFetchAdHocConfigurationResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchAdHocConfigurationResultObject)initWithCoder:(id)a3;
- (NSDictionary)configuration;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation CRKFetchAdHocConfigurationResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchAdHocConfigurationResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchAdHocConfigurationResultObject;
  v5 = [(CATTaskResultObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchAdHocConfigurationResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchAdHocConfigurationResultObject *)self configuration];
  [v4 encodeObject:v5 forKey:@"configuration"];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end