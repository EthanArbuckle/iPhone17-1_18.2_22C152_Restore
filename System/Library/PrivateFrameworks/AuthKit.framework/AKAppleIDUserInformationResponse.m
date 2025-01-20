@interface AKAppleIDUserInformationResponse
- (AKAppleIDUserInformationResponse)initWithResponseBody:(id)a3;
- (AKUserInformation)userInformationRepresentation;
- (NSArray)allAccountNames;
- (NSDictionary)dictionaryRepresentation;
- (void)setUserInformationRepresentation:(id)a3;
@end

@implementation AKAppleIDUserInformationResponse

- (AKAppleIDUserInformationResponse)initWithResponseBody:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDUserInformationResponse;
  v5 = [(AKAppleIDUserInformationResponse *)&v9 init];
  if (v5)
  {
    v6 = (AKUserInformation *)[objc_alloc((Class)AKUserInformation) initWithResponseBody:v4];
    userInformationRepresentation = v5->_userInformationRepresentation;
    v5->_userInformationRepresentation = v6;
  }
  return v5;
}

- (NSArray)allAccountNames
{
  allAccountNames = self->_allAccountNames;
  if (allAccountNames) {
    goto LABEL_11;
  }
  id v4 = +[NSMutableArray array];
  uint64_t v5 = [(AKUserInformation *)self->_userInformationRepresentation primaryEmailAddress];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(AKUserInformation *)self->_userInformationRepresentation vettedPrimaryEmail];
    if (([v7 BOOLValue] & 1) == 0)
    {

      goto LABEL_7;
    }
    v8 = [(AKUserInformation *)self->_userInformationRepresentation phoneAsAppleID];
    unsigned __int8 v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0)
    {
      v6 = [(AKUserInformation *)self->_userInformationRepresentation primaryEmailAddress];
      [v4 addObject:v6];
LABEL_7:
    }
  }
  v10 = [(AKUserInformation *)self->_userInformationRepresentation accountAliases];

  if (v10)
  {
    v11 = [(AKUserInformation *)self->_userInformationRepresentation accountAliases];
    [v4 addObjectsFromArray:v11];
  }
  v12 = (NSArray *)[v4 copy];
  v13 = self->_allAccountNames;
  self->_allAccountNames = v12;

  allAccountNames = self->_allAccountNames;
LABEL_11:

  return allAccountNames;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(AKUserInformation *)self->_userInformationRepresentation appleIDSecurityLevel])
  {
    id v4 = +[NSNumber numberWithUnsignedInteger:[(AKUserInformation *)self->_userInformationRepresentation appleIDSecurityLevel]];
    [v3 setObject:v4 forKeyedSubscript:AKAuthenticationSecurityLevelKey];
  }
  if ([(AKUserInformation *)self->_userInformationRepresentation authMode])
  {
    uint64_t v5 = +[NSNumber numberWithUnsignedInteger:[(AKUserInformation *)self->_userInformationRepresentation authMode]];
    [v3 setObject:v5 forKeyedSubscript:AKAuthenticationAppleIDAuthModeKey];
  }
  v6 = [(AKUserInformation *)self->_userInformationRepresentation isUnderage];
  [v3 setObject:v6 forKeyedSubscript:AKAuthenticationIsUnderageKey];

  v7 = [(AKUserInformation *)self->_userInformationRepresentation isLegacyStudent];
  [v3 setObject:v7 forKeyedSubscript:AKAuthenticationIsLegacyStudentKey];

  v8 = [(AKUserInformation *)self->_userInformationRepresentation masterKeyID];

  if (v8)
  {
    unsigned __int8 v9 = [(AKUserInformation *)self->_userInformationRepresentation masterKeyID];
    [v3 setObject:v9 forKeyedSubscript:AKAuthenticationMasterKeyIDKey];
  }
  if ([(AKUserInformation *)self->_userInformationRepresentation repairState])
  {
    v10 = +[NSNumber numberWithUnsignedInteger:[(AKUserInformation *)self->_userInformationRepresentation repairState]];
    [v3 setObject:v10 forKeyedSubscript:AKAuthenticationRepairStateKey];
  }
  v11 = [(AKUserInformation *)self->_userInformationRepresentation vettedPrimaryEmail];

  if (v11)
  {
    v12 = [(AKUserInformation *)self->_userInformationRepresentation vettedPrimaryEmail];
    [v3 setObject:v12 forKeyedSubscript:AKAuthenticationPrimaryVettedEmailKey];
  }
  v13 = [(AKUserInformation *)self->_userInformationRepresentation forwardingEmail];

  if (v13)
  {
    v14 = [(AKUserInformation *)self->_userInformationRepresentation forwardingEmail];
    [v3 setObject:v14 forKeyedSubscript:AKAuthenticationForwardingEmailKey];
  }
  v15 = [(AKUserInformation *)self->_userInformationRepresentation reachableEmails];

  if (v15)
  {
    v16 = [(AKUserInformation *)self->_userInformationRepresentation reachableEmails];
    [v3 setObject:v16 forKeyedSubscript:AKAuthenticationReachableEmailsKey];
  }
  v17 = [(AKUserInformation *)self->_userInformationRepresentation familyName];

  if (v17)
  {
    v18 = [(AKUserInformation *)self->_userInformationRepresentation familyName];
    [v3 setObject:v18 forKeyedSubscript:AKAuthenticationFamilyNameKey];
  }
  v19 = [(AKUserInformation *)self->_userInformationRepresentation givenName];

  if (v19)
  {
    v20 = [(AKUserInformation *)self->_userInformationRepresentation givenName];
    [v3 setObject:v20 forKeyedSubscript:AKAuthenticationGivenNameKey];
  }
  v21 = [(AKUserInformation *)self->_userInformationRepresentation previouslySelectedEmail];

  if (v21)
  {
    v22 = [(AKUserInformation *)self->_userInformationRepresentation previouslySelectedEmail];
    [v3 setObject:v22 forKeyedSubscript:AKAuthenticationSelectedAuthorizationEmailKey];
  }
  v23 = [(AKUserInformation *)self->_userInformationRepresentation hasSOSActiveDevice];

  if (v23)
  {
    v24 = [(AKUserInformation *)self->_userInformationRepresentation hasSOSActiveDevice];
    [v3 setObject:v24 forKeyedSubscript:AKAuthenticationHasSOSActiveDeviceKey];
  }
  v25 = [(AKUserInformation *)self->_userInformationRepresentation SOSNeeded];

  if (v25)
  {
    v26 = [(AKUserInformation *)self->_userInformationRepresentation SOSNeeded];
    [v3 setObject:v26 forKeyedSubscript:AKAuthenticationSOSNeededKey];
  }
  v27 = [(AKUserInformation *)self->_userInformationRepresentation hasModernRecoveryKey];

  if (v27)
  {
    v28 = [(AKUserInformation *)self->_userInformationRepresentation hasModernRecoveryKey];
    [v3 setObject:v28 forKeyedSubscript:AKAuthenticationHasModernRKKey];
  }
  v29 = [(AKUserInformation *)self->_userInformationRepresentation thirdPartyRegulatoryOverride];

  if (v29)
  {
    v30 = [(AKUserInformation *)self->_userInformationRepresentation thirdPartyRegulatoryOverride];
    [v3 setObject:v30 forKeyedSubscript:AK3PRegulatoryOverrideKey];
  }
  v31 = [(AKUserInformation *)self->_userInformationRepresentation previouslyWantedPrivateEmail];
  [v3 setObject:v31 forKeyedSubscript:AKAuthenticationSelectedPrivateEmailKey];

  v32 = [(AKUserInformation *)self->_userInformationRepresentation additionalInfo];
  [v3 setObject:v32 forKeyedSubscript:AKAuthenticationAdditionalInfoKey];

  v33 = [(AKUserInformation *)self->_userInformationRepresentation adpCohort];
  [v3 setObject:v33 forKeyedSubscript:AKAuthenticationADPCohortKey];

  v34 = [(AKUserInformation *)self->_userInformationRepresentation edpState];
  [v3 setObject:v34 forKeyedSubscript:AKEDPStateKey];

  v35 = [(AKUserInformation *)self->_userInformationRepresentation passwordVersion];
  [v3 setObject:v35 forKeyedSubscript:AKPasswordVersionKey];

  v36 = [(AKUserInformation *)self->_userInformationRepresentation srpProtocol];
  [v3 setObject:v36 forKeyedSubscript:AKSRPProtocolKey];

  v37 = [(AKUserInformation *)self->_userInformationRepresentation idmsEDPTokenId];
  [v3 setObject:v37 forKeyedSubscript:AKIdMSEDPTokenIdKey];

  id v38 = [v3 copy];

  return (NSDictionary *)v38;
}

- (AKUserInformation)userInformationRepresentation
{
  return self->_userInformationRepresentation;
}

- (void)setUserInformationRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformationRepresentation, 0);

  objc_storeStrong((id *)&self->_allAccountNames, 0);
}

@end