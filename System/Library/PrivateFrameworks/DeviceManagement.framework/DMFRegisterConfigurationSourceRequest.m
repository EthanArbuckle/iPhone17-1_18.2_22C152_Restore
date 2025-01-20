@interface DMFRegisterConfigurationSourceRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFRegisterConfigurationSourceRequest)initWithCoder:(id)a3;
- (DMFReportingRequirements)reportingRequirements;
- (NSString)configurationSourceName;
- (NSString)machServiceName;
- (NSString)organizationIdentifier;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationSourceName:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setReportingRequirements:(id)a3;
@end

@implementation DMFRegisterConfigurationSourceRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABA78;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRegisterConfigurationSourceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFRegisterConfigurationSourceRequest;
  v5 = [(CATTaskRequest *)&v22 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"configurationSourceName"];
    configurationSourceName = v5->_configurationSourceName;
    v5->_configurationSourceName = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"machServiceName"];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"listenerEndpoint"];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"reportingRequirements"];
    reportingRequirements = v5->_reportingRequirements;
    v5->_reportingRequirements = (DMFReportingRequirements *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DMFRegisterConfigurationSourceRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v10 encodeWithCoder:v4];
  v5 = [(DMFRegisterConfigurationSourceRequest *)self configurationSourceName];
  [v4 encodeObject:v5 forKey:@"configurationSourceName"];

  v6 = [(DMFRegisterConfigurationSourceRequest *)self organizationIdentifier];
  [v4 encodeObject:v6 forKey:@"organizationIdentifier"];

  uint64_t v7 = [(DMFRegisterConfigurationSourceRequest *)self machServiceName];
  [v4 encodeObject:v7 forKey:@"machServiceName"];

  v8 = [(DMFRegisterConfigurationSourceRequest *)self listenerEndpoint];
  [v4 encodeObject:v8 forKey:@"listenerEndpoint"];

  v9 = [(DMFRegisterConfigurationSourceRequest *)self reportingRequirements];
  [v4 encodeObject:v9 forKey:@"reportingRequirements"];
}

- (NSString)configurationSourceName
{
  return self->_configurationSourceName;
}

- (void)setConfigurationSourceName:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationSourceName, 0);
}

@end