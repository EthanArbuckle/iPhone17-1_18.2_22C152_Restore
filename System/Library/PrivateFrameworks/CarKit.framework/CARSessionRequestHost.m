@interface CARSessionRequestHost
+ (BOOL)supportsSecureCoding;
- (BOOL)isWiredCarPlaySimulator;
- (BOOL)supportsMutualAuthentication;
- (CARSessionRequestHost)initWithCoder:(id)a3;
- (CARSessionRequestHost)initWithDisplayName:(id)a3 wiredIPv6Addresses:(id)a4 wirelessIPv6Addresses:(id)a5 port:(int64_t)a6 carplayWiFiUUID:(id)a7 deviceIdentifier:(id)a8 publicKey:(id)a9 sourceVersion:(id)a10 supportsMutualAuthentication:(BOOL)a11 authenticationCertificateSerial:(id)a12 pairedVehicleIdentifier:(id)a13 wiredCarPlaySimulator:(BOOL)a14;
- (CARSessionRequestHost)initWithHostProperties:(id)a3;
- (NSArray)wiredIPv6Addresses;
- (NSArray)wirelessIPv6Addresses;
- (NSData)authenticationCertificateSerial;
- (NSString)carplayWiFiUUID;
- (NSString)deviceIdentifier;
- (NSString)displayName;
- (NSString)publicKey;
- (NSString)sourceVersion;
- (NSUUID)pairedVehicleIdentifier;
- (id)description;
- (int64_t)port;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationCertificateSerial:(id)a3;
- (void)setCarplayWiFiUUID:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPairedVehicleIdentifier:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setPublicKey:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setSupportsMutualAuthentication:(BOOL)a3;
- (void)setWiredCarPlaySimulator:(BOOL)a3;
- (void)setWiredIPv6Addresses:(id)a3;
- (void)setWirelessIPv6Addresses:(id)a3;
@end

@implementation CARSessionRequestHost

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARSessionRequestHost)initWithDisplayName:(id)a3 wiredIPv6Addresses:(id)a4 wirelessIPv6Addresses:(id)a5 port:(int64_t)a6 carplayWiFiUUID:(id)a7 deviceIdentifier:(id)a8 publicKey:(id)a9 sourceVersion:(id)a10 supportsMutualAuthentication:(BOOL)a11 authenticationCertificateSerial:(id)a12 pairedVehicleIdentifier:(id)a13 wiredCarPlaySimulator:(BOOL)a14
{
  id v34 = a3;
  id v33 = a4;
  id v27 = a5;
  id v32 = a5;
  id v31 = a7;
  id v29 = a8;
  id v30 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a12;
  id v23 = a13;
  v35.receiver = self;
  v35.super_class = (Class)CARSessionRequestHost;
  v24 = [(CARSessionRequestHost *)&v35 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_displayName, a3);
    objc_storeStrong((id *)&v25->_wiredIPv6Addresses, a4);
    objc_storeStrong((id *)&v25->_wirelessIPv6Addresses, v27);
    v25->_port = a6;
    objc_storeStrong((id *)&v25->_carplayWiFiUUID, a7);
    objc_storeStrong((id *)&v25->_deviceIdentifier, v29);
    objc_storeStrong((id *)&v25->_publicKey, a9);
    objc_storeStrong((id *)&v25->_sourceVersion, a10);
    v25->_supportsMutualAuthentication = a11;
    objc_storeStrong((id *)&v25->_authenticationCertificateSerial, a12);
    objc_storeStrong((id *)&v25->_pairedVehicleIdentifier, a13);
    v25->_wiredCarPlaySimulator = a14;
  }

  return v25;
}

- (CARSessionRequestHost)initWithHostProperties:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"displayName"];
  v5 = CARVerifyString(v4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    CRLocalizedStringForKey(@"CARPLAY");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v39 = v7;

  v8 = [v3 objectForKeyedSubscript:@"wiredIPAddresses"];
  v36 = CARVerifyStringArray(v8);

  v9 = [v3 objectForKeyedSubscript:@"wirelessIPAddresses"];
  objc_super v35 = CARVerifyStringArray(v9);

  v10 = [v3 objectForKeyedSubscript:@"port"];
  objc_opt_class();
  v11 = CARVerifyClass(v10);

  id v34 = v11;
  uint64_t v12 = [v11 integerValue];
  v13 = [v3 objectForKeyedSubscript:@"carplayWiFiUUID"];
  id v33 = v13;
  if (v13)
  {
    id v32 = CARVerifyString(v13);
  }
  else
  {
    id v32 = 0;
  }
  v14 = [v3 objectForKeyedSubscript:@"deviceID"];
  id v31 = CARVerifyString(v14);

  v15 = [v3 objectForKeyedSubscript:@"publicKey"];
  v16 = CARVerifyString(v15);

  v17 = [v3 objectForKeyedSubscript:@"sourceVersion"];
  v18 = CARVerifyString(v17);

  v19 = [v3 objectForKeyedSubscript:@"supportsMutualAuth"];
  char v20 = CARVerifyBool(v19);

  id v21 = [v3 objectForKeyedSubscript:@"authenticationCertificateSerial"];
  objc_opt_class();
  id v22 = CARVerifyClass(v21);

  uint64_t v23 = [v3 objectForKeyedSubscript:@"pairedVehicleIdentifier"];
  if (v23)
  {
    v24 = (void *)v23;
    objc_opt_class();
    v25 = CARVerifyClass(v24);
  }
  else
  {
    v25 = 0;
  }
  v26 = [v3 objectForKeyedSubscript:@"wiredCarPlaySimulator"];
  char v27 = CARVerifyBool(v26);

  LOBYTE(v30) = v27;
  LOBYTE(v29) = v20;
  v38 = [(CARSessionRequestHost *)self initWithDisplayName:v39 wiredIPv6Addresses:v36 wirelessIPv6Addresses:v35 port:v12 carplayWiFiUUID:v32 deviceIdentifier:v31 publicKey:v16 sourceVersion:v18 supportsMutualAuthentication:v29 authenticationCertificateSerial:v22 pairedVehicleIdentifier:v25 wiredCarPlaySimulator:v30];

  return v38;
}

- (CARSessionRequestHost)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CARSessionRequestHost;
  v5 = [(CARSessionRequestHost *)&v34 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"displayName"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
      id v7 = (void *)v6;
      if (v6) {
        v8 = (__CFString *)v6;
      }
      else {
        v8 = &stru_1F03060C0;
      }
      objc_storeStrong((id *)&v5->_displayName, v8);
    }
    if ([v4 containsValueForKey:@"wiredIPAddresses"])
    {
      v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"wiredIPAddresses"];
      wiredIPv6Addresses = v5->_wiredIPv6Addresses;
      v5->_wiredIPv6Addresses = (NSArray *)v12;
    }
    if ([v4 containsValueForKey:@"wirelessIPAddresses"])
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"wirelessIPAddresses"];
      wirelessIPv6Addresses = v5->_wirelessIPv6Addresses;
      v5->_wirelessIPv6Addresses = (NSArray *)v17;
    }
    if ([v4 containsValueForKey:@"port"]) {
      v5->_port = [v4 decodeIntegerForKey:@"port"];
    }
    if ([v4 containsValueForKey:@"carplayWiFiUUID"])
    {
      uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carplayWiFiUUID"];
      carplayWiFiUUID = v5->_carplayWiFiUUID;
      v5->_carplayWiFiUUID = (NSString *)v19;
    }
    if ([v4 containsValueForKey:@"deviceID"])
    {
      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
      deviceIdentifier = v5->_deviceIdentifier;
      v5->_deviceIdentifier = (NSString *)v21;
    }
    if ([v4 containsValueForKey:@"publicKey"])
    {
      uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
      publicKey = v5->_publicKey;
      v5->_publicKey = (NSString *)v23;
    }
    if ([v4 containsValueForKey:@"sourceVersion"])
    {
      uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceVersion"];
      sourceVersion = v5->_sourceVersion;
      v5->_sourceVersion = (NSString *)v25;
    }
    if ([v4 containsValueForKey:@"supportsMutualAuth"])
    {
      char v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsMutualAuth"];
      v28 = v27;
      if (v27) {
        v5->_supportsMutualAuthentication = [v27 BOOLValue];
      }
    }
    if ([v4 containsValueForKey:@"authenticationCertificateSerial"])
    {
      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationCertificateSerial"];
      if (v29) {
        objc_storeStrong((id *)&v5->_authenticationCertificateSerial, v29);
      }
    }
    if ([v4 containsValueForKey:@"pairedVehicleIdentifier"])
    {
      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedVehicleIdentifier"];
      if (v30) {
        objc_storeStrong((id *)&v5->_pairedVehicleIdentifier, v30);
      }
    }
    if ([v4 containsValueForKey:@"wiredCarPlaySimulator"])
    {
      id v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wiredCarPlaySimulator"];
      id v32 = v31;
      if (v31) {
        v5->_wiredCarPlaySimulator = [v31 BOOLValue];
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v24 = a3;
  id v4 = [(CARSessionRequestHost *)self displayName];

  if (v4)
  {
    v5 = [(CARSessionRequestHost *)self displayName];
    [v24 encodeObject:v5 forKey:@"displayName"];
  }
  uint64_t v6 = [(CARSessionRequestHost *)self wiredIPv6Addresses];

  if (v6)
  {
    id v7 = [(CARSessionRequestHost *)self wiredIPv6Addresses];
    [v24 encodeObject:v7 forKey:@"wiredIPAddresses"];
  }
  v8 = [(CARSessionRequestHost *)self wirelessIPv6Addresses];

  if (v8)
  {
    v9 = [(CARSessionRequestHost *)self wirelessIPv6Addresses];
    [v24 encodeObject:v9 forKey:@"wirelessIPAddresses"];
  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[CARSessionRequestHost port](self, "port"), @"port");
  uint64_t v10 = [(CARSessionRequestHost *)self carplayWiFiUUID];

  if (v10)
  {
    v11 = [(CARSessionRequestHost *)self carplayWiFiUUID];
    [v24 encodeObject:v11 forKey:@"carplayWiFiUUID"];
  }
  uint64_t v12 = [(CARSessionRequestHost *)self deviceIdentifier];

  if (v12)
  {
    v13 = [(CARSessionRequestHost *)self deviceIdentifier];
    [v24 encodeObject:v13 forKey:@"deviceID"];
  }
  v14 = [(CARSessionRequestHost *)self publicKey];

  if (v14)
  {
    uint64_t v15 = [(CARSessionRequestHost *)self publicKey];
    [v24 encodeObject:v15 forKey:@"publicKey"];
  }
  v16 = [(CARSessionRequestHost *)self sourceVersion];

  if (v16)
  {
    uint64_t v17 = [(CARSessionRequestHost *)self sourceVersion];
    [v24 encodeObject:v17 forKey:@"sourceVersion"];
  }
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[CARSessionRequestHost supportsMutualAuthentication](self, "supportsMutualAuthentication"));
  [v24 encodeObject:v18 forKey:@"supportsMutualAuth"];

  uint64_t v19 = [(CARSessionRequestHost *)self authenticationCertificateSerial];

  if (v19)
  {
    char v20 = [(CARSessionRequestHost *)self authenticationCertificateSerial];
    [v24 encodeObject:v20 forKey:@"authenticationCertificateSerial"];
  }
  uint64_t v21 = [(CARSessionRequestHost *)self pairedVehicleIdentifier];

  if (v21)
  {
    id v22 = [(CARSessionRequestHost *)self pairedVehicleIdentifier];
    [v24 encodeObject:v22 forKey:@"pairedVehicleIdentifier"];
  }
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[CARSessionRequestHost isWiredCarPlaySimulator](self, "isWiredCarPlaySimulator"));
  [v24 encodeObject:v23 forKey:@"wiredCarPlaySimulator"];
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CARSessionRequestHost;
  id v4 = [(CARSessionRequestHost *)&v13 description];
  v5 = [(CARSessionRequestHost *)self displayName];
  uint64_t v6 = [(CARSessionRequestHost *)self wiredIPv6Addresses];
  id v7 = [(CARSessionRequestHost *)self wirelessIPv6Addresses];
  int64_t v8 = [(CARSessionRequestHost *)self port];
  BOOL v9 = [(CARSessionRequestHost *)self supportsMutualAuthentication];
  uint64_t v10 = @"NO";
  if (v9) {
    uint64_t v10 = @"YES";
  }
  v11 = [v3 stringWithFormat:@"%@ [name: %@, wired IPs: %@, wireless IPs: %@, port: %ld, supportsMutualAuth: %@]", v4, v5, v6, v7, v8, v10];

  return v11;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)wiredIPv6Addresses
{
  return self->_wiredIPv6Addresses;
}

- (void)setWiredIPv6Addresses:(id)a3
{
}

- (NSArray)wirelessIPv6Addresses
{
  return self->_wirelessIPv6Addresses;
}

- (void)setWirelessIPv6Addresses:(id)a3
{
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (NSString)carplayWiFiUUID
{
  return self->_carplayWiFiUUID;
}

- (void)setCarplayWiFiUUID:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
}

- (BOOL)supportsMutualAuthentication
{
  return self->_supportsMutualAuthentication;
}

- (void)setSupportsMutualAuthentication:(BOOL)a3
{
  self->_supportsMutualAuthentication = a3;
}

- (NSData)authenticationCertificateSerial
{
  return self->_authenticationCertificateSerial;
}

- (void)setAuthenticationCertificateSerial:(id)a3
{
}

- (NSUUID)pairedVehicleIdentifier
{
  return self->_pairedVehicleIdentifier;
}

- (void)setPairedVehicleIdentifier:(id)a3
{
}

- (BOOL)isWiredCarPlaySimulator
{
  return self->_wiredCarPlaySimulator;
}

- (void)setWiredCarPlaySimulator:(BOOL)a3
{
  self->_wiredCarPlaySimulator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticationCertificateSerial, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_carplayWiFiUUID, 0);
  objc_storeStrong((id *)&self->_wirelessIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_wiredIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end