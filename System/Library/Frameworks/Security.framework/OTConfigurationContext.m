@interface OTConfigurationContext
- (BOOL)isGuitarfish;
- (BOOL)octagonCapableRecordsExist;
- (BOOL)overrideEscrowCache;
- (BOOL)overrideForJoinAfterRestore;
- (BOOL)overrideForSetupAccountScript;
- (BOOL)testsEnabled;
- (CKKSControl)ckksControl;
- (NSString)altDSID;
- (NSString)authenticationAppleID;
- (NSString)containerName;
- (NSString)context;
- (NSString)deviceSessionID;
- (NSString)dsid;
- (NSString)flowID;
- (NSString)passwordEquivalentToken;
- (OTConfigurationContext)init;
- (OTControl)otControl;
- (id)description;
- (id)makeCKKSControl:(id *)a3;
- (id)makeOTControl:(id *)a3;
- (id)sbd;
- (int64_t)escrowFetchSource;
- (void)setAltDSID:(id)a3;
- (void)setAuthenticationAppleID:(id)a3;
- (void)setCkksControl:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEscrowFetchSource:(int64_t)a3;
- (void)setFlowID:(id)a3;
- (void)setIsGuitarfish:(BOOL)a3;
- (void)setOctagonCapableRecordsExist:(BOOL)a3;
- (void)setOtControl:(id)a3;
- (void)setOverrideEscrowCache:(BOOL)a3;
- (void)setOverrideForJoinAfterRestore:(BOOL)a3;
- (void)setOverrideForSetupAccountScript:(BOOL)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setSbd:(id)a3;
- (void)setTestsEnabled:(BOOL)a3;
@end

@implementation OTConfigurationContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sbd, 0);
  objc_storeStrong((id *)&self->_ckksControl, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_authenticationAppleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_containerName, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setTestsEnabled:(BOOL)a3
{
  self->_testsEnabled = a3;
}

- (BOOL)testsEnabled
{
  return self->_testsEnabled;
}

- (void)setSbd:(id)a3
{
}

- (id)sbd
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCkksControl:(id)a3
{
}

- (CKKSControl)ckksControl
{
  return (CKKSControl *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOtControl:(id)a3
{
}

- (OTControl)otControl
{
  return (OTControl *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceSessionID:(id)a3
{
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setFlowID:(id)a3
{
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setIsGuitarfish:(BOOL)a3
{
  self->_isGuitarfish = a3;
}

- (BOOL)isGuitarfish
{
  return self->_isGuitarfish;
}

- (void)setOverrideForJoinAfterRestore:(BOOL)a3
{
  self->_overrideForJoinAfterRestore = a3;
}

- (BOOL)overrideForJoinAfterRestore
{
  return self->_overrideForJoinAfterRestore;
}

- (void)setOverrideForSetupAccountScript:(BOOL)a3
{
  self->_overrideForSetupAccountScript = a3;
}

- (BOOL)overrideForSetupAccountScript
{
  return self->_overrideForSetupAccountScript;
}

- (void)setOctagonCapableRecordsExist:(BOOL)a3
{
  self->_octagonCapableRecordsExist = a3;
}

- (BOOL)octagonCapableRecordsExist
{
  return self->_octagonCapableRecordsExist;
}

- (void)setEscrowFetchSource:(int64_t)a3
{
  self->_escrowFetchSource = a3;
}

- (int64_t)escrowFetchSource
{
  return self->_escrowFetchSource;
}

- (void)setPasswordEquivalentToken:(id)a3
{
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setAuthenticationAppleID:(id)a3
{
}

- (NSString)authenticationAppleID
{
  return self->_authenticationAppleID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setDsid:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (id)description
{
  v3 = NSString;
  v4 = [(OTConfigurationContext *)self context];
  v5 = [(OTConfigurationContext *)self containerName];
  v6 = [(OTConfigurationContext *)self altDSID];
  v7 = [v3 stringWithFormat:@"<OTConfigurationContext %@, %@, %@>", v4, v5, v6];

  return v7;
}

- (OTConfigurationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)OTConfigurationContext;
  v2 = [(OTConfigurationContext *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_context, (id)OTDefaultContext);
  }
  return v3;
}

- (id)makeCKKSControl:(id *)a3
{
  objc_super v5 = [(OTConfigurationContext *)self ckksControl];

  if (v5) {
    [(OTConfigurationContext *)self ckksControl];
  }
  else {
  v6 = +[CKKSControl CKKSControlObject:1 error:a3];
  }

  return v6;
}

- (id)makeOTControl:(id *)a3
{
  objc_super v5 = [(OTConfigurationContext *)self otControl];

  if (v5) {
    [(OTConfigurationContext *)self otControl];
  }
  else {
  v6 = +[OTControl controlObject:1 error:a3];
  }

  return v6;
}

- (void)setOverrideEscrowCache:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(OTConfigurationContext *)self setEscrowFetchSource:v3];
}

- (BOOL)overrideEscrowCache
{
  return [(OTConfigurationContext *)self escrowFetchSource] == 2;
}

@end