@interface CTGeofenceProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)cellularDataPreferred;
- (BOOL)enableNRStandalone;
- (CTGeofenceProfile)initWithCoder:(id)a3;
- (NSArray)geofenceList;
- (NSString)csgNetworkIdentifier;
- (NSString)dataSetName;
- (NSString)networkIdentifier;
- (NSString)versionNumber;
- (id)description;
- (int64_t)NRStandaloneMode;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularDataPreferred:(BOOL)a3;
- (void)setCsgNetworkIdentifier:(id)a3;
- (void)setDataSetName:(id)a3;
- (void)setEnableNRStandalone:(BOOL)a3;
- (void)setGeofenceList:(id)a3;
- (void)setNRStandaloneMode:(int64_t)a3;
- (void)setNetworkIdentifier:(id)a3;
- (void)setVersionNumber:(id)a3;
@end

@implementation CTGeofenceProfile

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTGeofenceProfile *)self dataSetName];
  [v3 appendFormat:@", dataSetName=%@", v4];

  v5 = [(CTGeofenceProfile *)self versionNumber];
  [v3 appendFormat:@", versionNumber=%@", v5];

  v6 = [(CTGeofenceProfile *)self csgNetworkIdentifier];
  [v3 appendFormat:@", csgNetworkIdentifier=%@", v6];

  v7 = [(CTGeofenceProfile *)self networkIdentifier];
  [v3 appendFormat:@", networkIdentifier=%@", v7];

  v8 = [(CTGeofenceProfile *)self geofenceList];
  [v3 appendFormat:@", geofenceList=%@", v8];

  [v3 appendFormat:@", cellularDataPreferred=%d", -[CTGeofenceProfile cellularDataPreferred](self, "cellularDataPreferred")];
  [v3 appendFormat:@", enableNRStandalone=%d", -[CTGeofenceProfile enableNRStandalone](self, "enableNRStandalone")];
  int64_t v9 = [(CTGeofenceProfile *)self NRStandaloneMode];
  v10 = "CTNRStandaloneModeEnabled";
  if (v9 == 2) {
    v10 = "CTNRStandaloneModeDisabled";
  }
  if (!v9) {
    v10 = "CTNRStandaloneModeUnknown";
  }
  [v3 appendFormat:@", NRStandalonemode=%s", v10];
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(CTGeofenceProfile *)self dataSetName];
  [v9 encodeObject:v4 forKey:@"dataSetName"];

  v5 = [(CTGeofenceProfile *)self versionNumber];
  [v9 encodeObject:v5 forKey:@"versionNumber"];

  v6 = [(CTGeofenceProfile *)self csgNetworkIdentifier];
  [v9 encodeObject:v6 forKey:@"csgNetworkIdentifier"];

  v7 = [(CTGeofenceProfile *)self networkIdentifier];
  [v9 encodeObject:v7 forKey:@"networkIdentifier"];

  v8 = [(CTGeofenceProfile *)self geofenceList];
  [v9 encodeObject:v8 forKey:@"geofenceList"];

  objc_msgSend(v9, "encodeBool:forKey:", -[CTGeofenceProfile cellularDataPreferred](self, "cellularDataPreferred"), @"cellularDataPreferred");
  objc_msgSend(v9, "encodeBool:forKey:", -[CTGeofenceProfile enableNRStandalone](self, "enableNRStandalone"), @"enableNRStandalone");
  objc_msgSend(v9, "encodeInteger:forKey:", -[CTGeofenceProfile NRStandaloneMode](self, "NRStandaloneMode"), @"NRStandaloneMode");
}

- (CTGeofenceProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CTGeofenceProfile;
  v5 = [(CTGeofenceProfile *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataSetName"];
    dataSetName = v5->_dataSetName;
    v5->_dataSetName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"versionNumber"];
    versionNumber = v5->_versionNumber;
    v5->_versionNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"csgNetworkIdentifier"];
    csgNetworkIdentifier = v5->_csgNetworkIdentifier;
    v5->_csgNetworkIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkIdentifier"];
    networkIdentifier = v5->_networkIdentifier;
    v5->_networkIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"geofenceList"];
    geofenceList = v5->_geofenceList;
    v5->_geofenceList = (NSArray *)v17;

    v5->_cellularDataPreferred = [v4 decodeBoolForKey:@"cellularDataPreferred"];
    v5->_enableNRStandalone = [v4 decodeBoolForKey:@"enableNRStandalone"];
    v5->_NRStandaloneMode = [v4 decodeIntegerForKey:@"NRStandaloneMode"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)dataSetName
{
  return self->_dataSetName;
}

- (void)setDataSetName:(id)a3
{
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
}

- (NSString)csgNetworkIdentifier
{
  return self->_csgNetworkIdentifier;
}

- (void)setCsgNetworkIdentifier:(id)a3
{
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
}

- (NSArray)geofenceList
{
  return self->_geofenceList;
}

- (void)setGeofenceList:(id)a3
{
}

- (BOOL)cellularDataPreferred
{
  return self->_cellularDataPreferred;
}

- (void)setCellularDataPreferred:(BOOL)a3
{
  self->_cellularDataPreferred = a3;
}

- (BOOL)enableNRStandalone
{
  return self->_enableNRStandalone;
}

- (void)setEnableNRStandalone:(BOOL)a3
{
  self->_enableNRStandalone = a3;
}

- (int64_t)NRStandaloneMode
{
  return self->_NRStandaloneMode;
}

- (void)setNRStandaloneMode:(int64_t)a3
{
  self->_NRStandaloneMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geofenceList, 0);
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);

  objc_storeStrong((id *)&self->_dataSetName, 0);
}

@end