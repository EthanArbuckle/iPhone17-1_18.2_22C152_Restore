@interface AACustodianRecoveryRequestContext
+ (BOOL)supportsSecureCoding;
- (AACustodianRecoveryRequestContext)init;
- (AACustodianRecoveryRequestContext)initWithCoder:(id)a3;
- (BOOL)CLIMode;
- (BOOL)isDataOnlyRecovery;
- (NSString)altDSID;
- (NSString)custodianRecoveryToken;
- (NSString)ownerAppleID;
- (NSString)recordBuildVersion;
- (NSString)recoveryCode;
- (NSString)recoverySessionID;
- (NSString)telemetryFlowID;
- (NSUUID)custodianUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCLIMode:(BOOL)a3;
- (void)setCustodianRecoveryToken:(id)a3;
- (void)setCustodianUUID:(id)a3;
- (void)setDataOnlyRecovery:(BOOL)a3;
- (void)setOwnerAppleID:(id)a3;
- (void)setRecordBuildVersion:(id)a3;
- (void)setRecoveryCode:(id)a3;
- (void)setRecoverySessionID:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
@end

@implementation AACustodianRecoveryRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianRecoveryRequestContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)AACustodianRecoveryRequestContext;
  v2 = [(AACustodianRecoveryRequestContext *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    telemetryFlowID = v2->_telemetryFlowID;
    v2->_telemetryFlowID = (NSString *)v4;
  }
  return v2;
}

- (AACustodianRecoveryRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AACustodianRecoveryRequestContext;
  v5 = [(AACustodianRecoveryRequestContext *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerAppleID"];
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recoverySessionID"];
    recoverySessionID = v5->_recoverySessionID;
    v5->_recoverySessionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_code"];
    recoveryCode = v5->_recoveryCode;
    v5->_recoveryCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianUUID"];
    custodianUUID = v5->_custodianUUID;
    v5->_custodianUUID = (NSUUID *)v12;

    v5->_CLIMode = [v4 decodeBoolForKey:@"_cliMode"];
    v5->_dataOnlyRecovery = [v4 decodeBoolForKey:@"_dataOnlyRecovery"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianRecoveryToken"];
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordBuildVersion"];
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryFlowID"];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ownerAppleID = self->_ownerAppleID;
  id v5 = a3;
  [v5 encodeObject:ownerAppleID forKey:@"_ownerAppleID"];
  [v5 encodeObject:self->_recoverySessionID forKey:@"_recoverySessionID"];
  [v5 encodeObject:self->_recoveryCode forKey:@"_code"];
  [v5 encodeObject:self->_custodianUUID forKey:@"_custodianUUID"];
  [v5 encodeBool:self->_CLIMode forKey:@"_cliMode"];
  [v5 encodeBool:self->_dataOnlyRecovery forKey:@"_dataOnlyRecovery"];
  [v5 encodeObject:self->_custodianRecoveryToken forKey:@"_custodianRecoveryToken"];
  [v5 encodeObject:self->_recordBuildVersion forKey:@"_recordBuildVersion"];
  [v5 encodeObject:self->_telemetryFlowID forKey:@"_telemetryFlowID"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AACustodianRecoveryRequestContext allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_ownerAppleID copy];
  ownerAppleID = v4->_ownerAppleID;
  v4->_ownerAppleID = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_recoverySessionID copy];
  recoverySessionID = v4->_recoverySessionID;
  v4->_recoverySessionID = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_recoveryCode copy];
  recoveryCode = v4->_recoveryCode;
  v4->_recoveryCode = (NSString *)v9;

  uint64_t v11 = [(NSUUID *)self->_custodianUUID copy];
  custodianUUID = v4->_custodianUUID;
  v4->_custodianUUID = (NSUUID *)v11;

  v4->_CLIMode = self->_CLIMode;
  v4->_dataOnlyRecovery = self->_dataOnlyRecovery;
  uint64_t v13 = [(NSString *)self->_custodianRecoveryToken copy];
  custodianRecoveryToken = v4->_custodianRecoveryToken;
  v4->_custodianRecoveryToken = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_recordBuildVersion copy];
  recordBuildVersion = v4->_recordBuildVersion;
  v4->_recordBuildVersion = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_telemetryFlowID copy];
  telemetryFlowID = v4->_telemetryFlowID;
  v4->_telemetryFlowID = (NSString *)v17;

  uint64_t v19 = [(NSString *)self->_altDSID copy];
  altDSID = v4->_altDSID;
  v4->_altDSID = (NSString *)v19;

  return v4;
}

- (id)description
{
  if (self->_dataOnlyRecovery) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"CustodianRecoveryRequestContext with ownerAppleID: %@ \nsessionID: %@ \nrecoveryCode: %@ \ncustodianUUID: %@ \nrecoveryToken: %@ \ncliMode: %i \ndataOnly: %@, recordBuildVersion: %@, flowID: %@, altDSID: %@", self->_ownerAppleID, self->_recoverySessionID, self->_recoveryCode, self->_custodianUUID, self->_custodianRecoveryToken, self->_CLIMode, v2, self->_recordBuildVersion, self->_telemetryFlowID, self->_altDSID];
}

- (NSString)recoverySessionID
{
  return self->_recoverySessionID;
}

- (void)setRecoverySessionID:(id)a3
{
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
}

- (NSString)recoveryCode
{
  return self->_recoveryCode;
}

- (void)setRecoveryCode:(id)a3
{
}

- (NSUUID)custodianUUID
{
  return self->_custodianUUID;
}

- (void)setCustodianUUID:(id)a3
{
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void)setRecordBuildVersion:(id)a3
{
}

- (BOOL)CLIMode
{
  return self->_CLIMode;
}

- (void)setCLIMode:(BOOL)a3
{
  self->_CLIMode = a3;
}

- (BOOL)isDataOnlyRecovery
{
  return self->_dataOnlyRecovery;
}

- (void)setDataOnlyRecovery:(BOOL)a3
{
  self->_dataOnlyRecovery = a3;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_custodianUUID, 0);
  objc_storeStrong((id *)&self->_recoveryCode, 0);
  objc_storeStrong((id *)&self->_ownerAppleID, 0);

  objc_storeStrong((id *)&self->_recoverySessionID, 0);
}

@end