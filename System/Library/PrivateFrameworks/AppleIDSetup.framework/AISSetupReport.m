@interface AISSetupReport
- (AISSetupReportLocaleInfo)peerDeviceLocaleInfo;
- (NSArray)childReports;
- (NSDictionary)accountAltDSIDsByService;
- (NSString)altDSID;
- (NSString)createdPersonaID;
- (void)setAccountAltDSIDsByService:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setChildReports:(id)a3;
- (void)setCreatedPersonaID:(id)a3;
- (void)setPeerDeviceLocaleInfo:(id)a3;
@end

@implementation AISSetupReport

- (NSDictionary)accountAltDSIDsByService
{
  return self->_accountAltDSIDsByService;
}

- (void)setAccountAltDSIDsByService:(id)a3
{
}

- (NSString)createdPersonaID
{
  return self->_createdPersonaID;
}

- (void)setCreatedPersonaID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (AISSetupReportLocaleInfo)peerDeviceLocaleInfo
{
  return self->_peerDeviceLocaleInfo;
}

- (void)setPeerDeviceLocaleInfo:(id)a3
{
}

- (NSArray)childReports
{
  return self->_childReports;
}

- (void)setChildReports:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childReports, 0);
  objc_storeStrong((id *)&self->_peerDeviceLocaleInfo, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_createdPersonaID, 0);
  objc_storeStrong((id *)&self->_accountAltDSIDsByService, 0);
}

@end