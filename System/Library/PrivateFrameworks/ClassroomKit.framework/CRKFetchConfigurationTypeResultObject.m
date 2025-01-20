@interface CRKFetchConfigurationTypeResultObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isSignedInToStudentMAID;
- (CRKFetchConfigurationTypeResultObject)initWithCoder:(id)a3;
- (unint64_t)configurationType;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationType:(unint64_t)a3;
- (void)setSignedInToStudentMAID:(BOOL)a3;
@end

@implementation CRKFetchConfigurationTypeResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchConfigurationTypeResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchConfigurationTypeResultObject;
  v5 = [(CATTaskResultObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationType"];
    v5->_configurationType = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedInToStudentMAID"];
    v5->_signedInToStudentMAID = [v7 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchConfigurationTypeResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKFetchConfigurationTypeResultObject configurationType](self, "configurationType", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"configurationType"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKFetchConfigurationTypeResultObject isSignedInToStudentMAID](self, "isSignedInToStudentMAID"));
  [v4 encodeObject:v6 forKey:@"signedInToStudentMAID"];
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (BOOL)isSignedInToStudentMAID
{
  return self->_signedInToStudentMAID;
}

- (void)setSignedInToStudentMAID:(BOOL)a3
{
  self->_signedInToStudentMAID = a3;
}

@end