@interface CMContinuityCaptureUIConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isDedicated;
- (BOOL)isEqual:(id)a3;
- (CMContinuityCaptureUIConfiguration)initWithCoder:(id)a3;
- (NSNumber)placementStepSkipped;
- (NSString)applicationIdentifier;
- (NSString)clientName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)clientDeviceModel;
- (int64_t)compositeState;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setClientDeviceModel:(int64_t)a3;
- (void)setClientName:(id)a3;
- (void)setCompositeState:(int64_t)a3;
- (void)setIsDedicated:(BOOL)a3;
- (void)setPlacementStepSkipped:(id)a3;
@end

@implementation CMContinuityCaptureUIConfiguration

- (CMContinuityCaptureUIConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMContinuityCaptureUIConfiguration;
  v5 = [(CMContinuityCaptureUIConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientName"];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v8;

    v5->_clientDeviceModel = [v4 decodeIntegerForKey:@"clientDeviceModel"];
    v5->_compositeState = [v4 decodeIntegerForKey:@"compositeState"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placementStepSkipped"];
    placementStepSkipped = v5->_placementStepSkipped;
    v5->_placementStepSkipped = (NSNumber *)v10;

    v5->_isDedicated = [v4 decodeBoolForKey:@"isDedicated"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CMContinuityCaptureUIConfiguration *)self applicationIdentifier];
  [v7 encodeObject:v4 forKey:@"applicationIdentifier"];

  v5 = [(CMContinuityCaptureUIConfiguration *)self clientName];
  [v7 encodeObject:v5 forKey:@"clientName"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel"), @"clientDeviceModel");
  objc_msgSend(v7, "encodeInteger:forKey:", -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState"), @"compositeState");
  uint64_t v6 = [(CMContinuityCaptureUIConfiguration *)self placementStepSkipped];
  [v7 encodeObject:v6 forKey:@"placementStepSkipped"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated"), @"isDedicated");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  id v7 = [(CMContinuityCaptureUIConfiguration *)self applicationIdentifier];
  [v6 appendFormat:@", applicationIdentifier=%@", v7];

  uint64_t v8 = [(CMContinuityCaptureUIConfiguration *)self clientName];
  [v6 appendFormat:@", clientName=%@", v8];

  [v6 appendFormat:@", clientDeviceModel=%ld", -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel")];
  [v6 appendFormat:@", compositeState=%ld", -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState")];
  v9 = [(CMContinuityCaptureUIConfiguration *)self placementStepSkipped];
  [v6 appendFormat:@", placementSkipped=%@", v9];

  [v6 appendFormat:@", isDedicated=%d", -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated")];
  [v6 appendString:@">"];
  uint64_t v10 = [NSString stringWithString:v6];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CMContinuityCaptureUIConfiguration *)self applicationIdentifier];
  [v4 setApplicationIdentifier:v5];

  uint64_t v6 = [(CMContinuityCaptureUIConfiguration *)self clientName];
  [v4 setClientName:v6];

  objc_msgSend(v4, "setClientDeviceModel:", -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel"));
  objc_msgSend(v4, "setCompositeState:", -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState"));
  id v7 = [(CMContinuityCaptureUIConfiguration *)self placementStepSkipped];
  [v4 setPlacementStepSkipped:v7];

  objc_msgSend(v4, "setIsDedicated:", -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CMContinuityCaptureUIConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v16) = 1;
  }
  else if ([(CMContinuityCaptureUIConfiguration *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    uint64_t v6 = [(CMContinuityCaptureUIConfiguration *)v5 applicationIdentifier];
    id v7 = [(CMContinuityCaptureUIConfiguration *)self applicationIdentifier];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_8;
    }
    v9 = [(CMContinuityCaptureUIConfiguration *)v5 clientName];
    uint64_t v10 = [(CMContinuityCaptureUIConfiguration *)self clientName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
    uint64_t v12 = [(CMContinuityCaptureUIConfiguration *)v5 clientDeviceModel];
    if (v12 != [(CMContinuityCaptureUIConfiguration *)self clientDeviceModel]) {
      goto LABEL_8;
    }
    uint64_t v13 = [(CMContinuityCaptureUIConfiguration *)v5 compositeState];
    if (v13 == [(CMContinuityCaptureUIConfiguration *)self compositeState]
      && ([(CMContinuityCaptureUIConfiguration *)v5 placementStepSkipped],
          v14 = objc_claimAutoreleasedReturnValue(),
          [(CMContinuityCaptureUIConfiguration *)self placementStepSkipped],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v14 == v15))
    {
      BOOL v18 = [(CMContinuityCaptureUIConfiguration *)v5 isDedicated];
      int v16 = v18 ^ [(CMContinuityCaptureUIConfiguration *)self isDedicated] ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (int64_t)clientDeviceModel
{
  return self->_clientDeviceModel;
}

- (void)setClientDeviceModel:(int64_t)a3
{
  self->_clientDeviceModel = a3;
}

- (int64_t)compositeState
{
  return self->_compositeState;
}

- (void)setCompositeState:(int64_t)a3
{
  self->_compositeState = a3;
}

- (NSNumber)placementStepSkipped
{
  return self->_placementStepSkipped;
}

- (void)setPlacementStepSkipped:(id)a3
{
}

- (BOOL)isDedicated
{
  return self->_isDedicated;
}

- (void)setIsDedicated:(BOOL)a3
{
  self->_isDedicated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementStepSkipped, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end