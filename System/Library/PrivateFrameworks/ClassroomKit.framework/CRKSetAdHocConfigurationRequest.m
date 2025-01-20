@interface CRKSetAdHocConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)merge;
- (CRKSetAdHocConfigurationRequest)initWithCoder:(id)a3;
- (NSDictionary)configuration;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setMerge:(BOOL)a3;
@end

@implementation CRKSetAdHocConfigurationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetAdHocConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSetAdHocConfigurationRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merge"];
    v5->_merge = [v8 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKSetAdHocConfigurationRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKSetAdHocConfigurationRequest *)self configuration];
  [v4 encodeObject:v5 forKey:@"configuration"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKSetAdHocConfigurationRequest merge](self, "merge"));
  [v4 encodeObject:v6 forKey:@"merge"];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)merge
{
  return self->_merge;
}

- (void)setMerge:(BOOL)a3
{
  self->_merge = a3;
}

- (void).cxx_destruct
{
}

@end