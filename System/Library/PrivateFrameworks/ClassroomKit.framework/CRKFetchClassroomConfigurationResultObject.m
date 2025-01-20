@interface CRKFetchClassroomConfigurationResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchClassroomConfigurationResultObject)initWithCoder:(id)a3;
- (NSDictionary)configuration;
- (NSDictionary)configurationsByType;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationsByType:(id)a3;
@end

@implementation CRKFetchClassroomConfigurationResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchClassroomConfigurationResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKFetchClassroomConfigurationResultObject;
  v5 = [(CATTaskResultObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodePropertyListForKey:@"configurationsByType"];
    configurationsByType = v5->_configurationsByType;
    v5->_configurationsByType = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchClassroomConfigurationResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchClassroomConfigurationResultObject *)self configuration];
  [v4 encodeObject:v5 forKey:@"configuration"];

  uint64_t v6 = [(CRKFetchClassroomConfigurationResultObject *)self configurationsByType];
  [v4 encodeObject:v6 forKey:@"configurationsByType"];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)configurationsByType
{
  return self->_configurationsByType;
}

- (void)setConfigurationsByType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByType, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end