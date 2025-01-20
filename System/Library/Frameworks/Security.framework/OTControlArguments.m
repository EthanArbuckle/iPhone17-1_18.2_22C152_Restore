@interface OTControlArguments
+ (BOOL)supportsSecureCoding;
- (NSString)altDSID;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)deviceSessionID;
- (NSString)flowID;
- (OTControlArguments)init;
- (OTControlArguments)initWithAltDSID:(id)a3;
- (OTControlArguments)initWithAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5;
- (OTControlArguments)initWithCoder:(id)a3;
- (OTControlArguments)initWithConfiguration:(id)a3;
- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5;
- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5 flowID:(id)a6 deviceSessionID:(id)a7;
- (id)description;
- (id)makeConfigurationContext;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setFlowID:(id)a3;
@end

@implementation OTControlArguments

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);

  objc_storeStrong((id *)&self->_contextID, 0);
}

- (void)setDeviceSessionID:(id)a3
{
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFlowID:(id)a3
{
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContextID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)makeConfigurationContext
{
  v3 = objc_alloc_init(OTConfigurationContext);
  v4 = [(OTControlArguments *)self containerName];
  [(OTConfigurationContext *)v3 setContainerName:v4];

  v5 = [(OTControlArguments *)self contextID];
  [(OTConfigurationContext *)v3 setContext:v5];

  v6 = [(OTControlArguments *)self altDSID];
  [(OTConfigurationContext *)v3 setAltDSID:v6];

  v7 = [(OTControlArguments *)self flowID];
  [(OTConfigurationContext *)v3 setFlowID:v7];

  v8 = [(OTControlArguments *)self deviceSessionID];
  [(OTConfigurationContext *)v3 setDeviceSessionID:v8];

  return v3;
}

- (OTControlArguments)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OTControlArguments;
  v5 = [(OTControlArguments *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextID"];
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerName"];
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowID"];
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSessionID"];
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(OTControlArguments *)self contextID];
  [v4 encodeObject:v5 forKey:@"contextID"];

  uint64_t v6 = [(OTControlArguments *)self containerName];
  [v4 encodeObject:v6 forKey:@"containerName"];

  v7 = [(OTControlArguments *)self altDSID];
  [v4 encodeObject:v7 forKey:@"altDSID"];

  uint64_t v8 = [(OTControlArguments *)self flowID];
  [v4 encodeObject:v8 forKey:@"flowID"];

  id v9 = [(OTControlArguments *)self deviceSessionID];
  [v4 encodeObject:v9 forKey:@"deviceSessionID"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(OTControlArguments *)self containerName];
  v5 = [(OTControlArguments *)self contextID];
  uint64_t v6 = [(OTControlArguments *)self altDSID];
  v7 = [(OTControlArguments *)self flowID];
  uint64_t v8 = [(OTControlArguments *)self deviceSessionID];
  id v9 = [v3 stringWithFormat:@"<OTControlArguments: container:%@, context:%@, altDSID:%@, flowID: %@, deviceSessionID: %@>", v4, v5, v6, v7, v8];

  return v9;
}

- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5 flowID:(id)a6 deviceSessionID:(id)a7
{
  uint64_t v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTControlArguments;
  objc_super v17 = [(OTControlArguments *)&v21 init];
  v18 = v17;
  if (v17)
  {
    if (v12) {
      v19 = v12;
    }
    else {
      v19 = @"com.apple.security.keychain";
    }
    objc_storeStrong((id *)&v17->_containerName, v19);
    objc_storeStrong((id *)&v18->_contextID, a4);
    objc_storeStrong((id *)&v18->_altDSID, a5);
    objc_storeStrong((id *)&v18->_flowID, a6);
    objc_storeStrong((id *)&v18->_deviceSessionID, a7);
  }

  return v18;
}

- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5
{
  return [(OTControlArguments *)self initWithContainerName:a3 contextID:a4 altDSID:a5 flowID:0 deviceSessionID:0];
}

- (OTControlArguments)initWithAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5
{
  return [(OTControlArguments *)self initWithContainerName:@"com.apple.security.keychain" contextID:OTDefaultContext altDSID:a3 flowID:a4 deviceSessionID:a5];
}

- (OTControlArguments)initWithAltDSID:(id)a3
{
  return [(OTControlArguments *)self initWithContainerName:@"com.apple.security.keychain" contextID:OTDefaultContext altDSID:a3 flowID:0 deviceSessionID:0];
}

- (OTControlArguments)initWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerName];
  uint64_t v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"com.apple.security.keychain";
  }
  uint64_t v8 = [v4 context];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = OTDefaultContext;
  }
  v11 = [v4 altDSID];
  uint64_t v12 = [v4 flowID];
  id v13 = [v4 deviceSessionID];

  id v14 = [(OTControlArguments *)self initWithContainerName:v7 contextID:v10 altDSID:v11 flowID:v12 deviceSessionID:v13];
  return v14;
}

- (OTControlArguments)init
{
  return [(OTControlArguments *)self initWithContainerName:@"com.apple.security.keychain" contextID:OTDefaultContext altDSID:0 flowID:0 deviceSessionID:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end