@interface DMTPerformAutomatedDeviceEnrollmentRequest
+ (BOOL)supportsSecureCoding;
- (DMTNetworkCredential)networkCredential;
- (DMTPerformAutomatedDeviceEnrollmentRequest)initWithCoder:(id)a3;
- (NSData)networkPayload;
- (NSString)mdmServerName;
- (NSString)nonce;
- (NSString)organizationName;
- (int64_t)automationBehavior;
- (int64_t)effectiveNetworkConfiguration;
- (int64_t)networkConfiguration;
- (int64_t)organizationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomationBehavior:(int64_t)a3;
- (void)setMdmServerName:(id)a3;
- (void)setNetworkConfiguration:(int64_t)a3;
- (void)setNetworkCredential:(id)a3;
- (void)setNetworkPayload:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationType:(int64_t)a3;
@end

@implementation DMTPerformAutomatedDeviceEnrollmentRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DMTPerformAutomatedDeviceEnrollmentRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v13 encodeWithCoder:v4];
  v5 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self nonce];
  [v4 encodeObject:v5 forKey:@"nonce"];

  v6 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkCredential];
  [v4 encodeObject:v6 forKey:@"networkCredential"];

  v7 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkPayload];
  [v4 encodeObject:v7 forKey:@"networkPayload"];

  v8 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self organizationName];
  [v4 encodeObject:v8 forKey:@"organizationName"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMTPerformAutomatedDeviceEnrollmentRequest organizationType](self, "organizationType"));
  [v4 encodeObject:v9 forKey:@"organizationType"];

  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMTPerformAutomatedDeviceEnrollmentRequest automationBehavior](self, "automationBehavior"));
  [v4 encodeObject:v10 forKey:@"automationBehavior"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMTPerformAutomatedDeviceEnrollmentRequest networkConfiguration](self, "networkConfiguration"));
  [v4 encodeObject:v11 forKey:@"networkConfiguration"];

  v12 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self mdmServerName];
  [v4 encodeObject:v12 forKey:@"mdmServerName"];
}

- (DMTPerformAutomatedDeviceEnrollmentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DMTPerformAutomatedDeviceEnrollmentRequest;
  v5 = [(CATTaskRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"networkCredential"];
    networkCredential = v5->_networkCredential;
    v5->_networkCredential = (DMTNetworkCredential *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"networkPayload"];
    networkPayload = v5->_networkPayload;
    v5->_networkPayload = (NSData *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"organizationName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationType"];
    v5->_organizationType = [v18 integerValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automationBehavior"];
    v5->_automationBehavior = [v19 integerValue];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkConfiguration"];
    v5->_networkConfiguration = [v20 integerValue];

    v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"mdmServerName"];
    mdmServerName = v5->_mdmServerName;
    v5->_mdmServerName = (NSString *)v22;
  }
  return v5;
}

- (int64_t)effectiveNetworkConfiguration
{
  if ([(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkConfiguration])
  {
    return [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkConfiguration];
  }
  else
  {
    id v4 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkPayload];

    if (v4)
    {
      return 2;
    }
    else
    {
      v5 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkCredential];
      v6 = [v5 networkName];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        return 1;
      }
      else
      {
        int64_t result = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkCredential];
        if (result)
        {
          v8 = (void *)result;
          v9 = [(DMTPerformAutomatedDeviceEnrollmentRequest *)self networkCredential];
          uint64_t v10 = [v9 networkName];
          uint64_t v11 = [v10 length];

          if (v11) {
            return 0;
          }
          else {
            return 3;
          }
        }
      }
    }
  }
  return result;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (DMTNetworkCredential)networkCredential
{
  return self->_networkCredential;
}

- (void)setNetworkCredential:(id)a3
{
}

- (NSData)networkPayload
{
  return self->_networkPayload;
}

- (void)setNetworkPayload:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (int64_t)organizationType
{
  return self->_organizationType;
}

- (void)setOrganizationType:(int64_t)a3
{
  self->_organizationType = a3;
}

- (NSString)mdmServerName
{
  return self->_mdmServerName;
}

- (void)setMdmServerName:(id)a3
{
}

- (int64_t)automationBehavior
{
  return self->_automationBehavior;
}

- (void)setAutomationBehavior:(int64_t)a3
{
  self->_automationBehavior = a3;
}

- (int64_t)networkConfiguration
{
  return self->_networkConfiguration;
}

- (void)setNetworkConfiguration:(int64_t)a3
{
  self->_networkConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmServerName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_networkPayload, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end