@interface BYODDomain
- (BOOL)catchAllEnabled;
- (BOOL)dnsRecordGenerated;
- (BOOL)isDomainConnect;
- (BOOL)isDomainModeSet;
- (BOOL)isDomainPurchased;
- (BOOL)isOwner;
- (BOOL)isShared;
- (BOOL)withEmailAddress;
- (BOOL)withFamily;
- (BYODDomain)initWithDictionary:(id)a3;
- (BYODUser)owner;
- (NSString)applyTemplateUrl;
- (NSString)dnsProviderName;
- (NSString)domainConnectServerUrl;
- (NSString)domainPurchaseProviderName;
- (NSString)ef_publicDescription;
- (NSString)introScreenIndicator;
- (NSString)invitationStatus;
- (NSString)name;
- (NSString)reverificationStatus;
- (NSString)status;
- (NSString)verificationStatus;
- (int64_t)pendingVerifyEmailCount;
- (int64_t)transferTimestamp;
- (void)setApplyTemplateUrl:(id)a3;
- (void)setCatchAllEnabled:(BOOL)a3;
- (void)setDnsProviderName:(id)a3;
- (void)setDnsRecordGenerated:(BOOL)a3;
- (void)setDomainConnectServerUrl:(id)a3;
- (void)setDomainPurchaseProviderName:(id)a3;
- (void)setIntroScreenIndicator:(id)a3;
- (void)setInvitationStatus:(id)a3;
- (void)setIsDomainConnect:(BOOL)a3;
- (void)setIsDomainModeSet:(BOOL)a3;
- (void)setIsDomainPurchased:(BOOL)a3;
- (void)setIsOwner:(BOOL)a3;
- (void)setIsShared:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPendingVerifyEmailCount:(int64_t)a3;
- (void)setReverificationStatus:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTransferTimestamp:(int64_t)a3;
- (void)setVerificationStatus:(id)a3;
- (void)setWithEmailAddress:(BOOL)a3;
- (void)setWithFamily:(BOOL)a3;
@end

@implementation BYODDomain

- (BYODDomain)initWithDictionary:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BYODDomain;
  v5 = [(BYODDomain *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isOwner"];
    v5->_isOwner = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"isShared"];
    v5->_isShared = [v7 BOOLValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v10;

    v12 = [v4 objectForKeyedSubscript:@"transferTimestamp"];
    v5->_transferTimestamp = (int64_t)[v12 integerValue];

    v13 = [BYODUser alloc];
    v14 = [v4 objectForKeyedSubscript:@"owner"];
    v15 = [(BYODUser *)v13 initWithDictionary:v14];
    owner = v5->_owner;
    v5->_owner = v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"dnsProviderName"];
    dnsProviderName = v5->_dnsProviderName;
    v5->_dnsProviderName = (NSString *)v17;

    v19 = [v4 objectForKeyedSubscript:@"dnsRecordsGenerated"];
    v5->_dnsRecordGenerated = [v19 BOOLValue];

    v20 = [v4 objectForKeyedSubscript:@"isDomainConnect"];
    v5->_isDomainConnect = [v20 BOOLValue];

    uint64_t v21 = [v4 objectForKeyedSubscript:@"verificationStatus"];
    verificationStatus = v5->_verificationStatus;
    v5->_verificationStatus = (NSString *)v21;

    uint64_t v23 = [v4 objectForKeyedSubscript:@"invitationStatus"];
    invitationStatus = v5->_invitationStatus;
    v5->_invitationStatus = (NSString *)v23;

    uint64_t v25 = [v4 objectForKeyedSubscript:@"applyTemplateUrl"];
    applyTemplateUrl = v5->_applyTemplateUrl;
    v5->_applyTemplateUrl = (NSString *)v25;

    v27 = [v4 objectForKeyedSubscript:@"withFamily"];
    v5->_withFamily = [v27 BOOLValue];

    v28 = [v4 objectForKeyedSubscript:@"withEmailAddress"];
    v5->_withEmailAddress = [v28 BOOLValue];

    uint64_t v29 = [v4 objectForKeyedSubscript:@"introScreenIndicator"];
    introScreenIndicator = v5->_introScreenIndicator;
    v5->_introScreenIndicator = (NSString *)v29;

    uint64_t v31 = [v4 objectForKeyedSubscript:@"reverificationStatus"];
    reverificationStatus = v5->_reverificationStatus;
    v5->_reverificationStatus = (NSString *)v31;

    uint64_t v33 = [v4 objectForKeyedSubscript:@"domainConnectServerUrl"];
    domainConnectServerUrl = v5->_domainConnectServerUrl;
    v5->_domainConnectServerUrl = (NSString *)v33;

    v35 = [v4 objectForKeyedSubscript:@"pendingVerifyEmailCount"];
    v5->_pendingVerifyEmailCount = (int64_t)[v35 integerValue];

    v36 = [v4 objectForKeyedSubscript:@"catchAllEnabled"];
    v5->_catchAllEnabled = [v36 BOOLValue];

    v37 = [v4 objectForKeyedSubscript:@"isDomainPurchased"];
    v5->_isDomainPurchased = [v37 BOOLValue];

    uint64_t v38 = [v4 objectForKeyedSubscript:@"domainPurchaseProviderName"];
    domainPurchaseProviderName = v5->_domainPurchaseProviderName;
    v5->_domainPurchaseProviderName = (NSString *)v38;

    v40 = [v4 objectForKeyedSubscript:@"isDomainModeSet"];
    v5->_isDomainModeSet = [v40 BOOLValue];
  }
  return v5;
}

- (NSString)ef_publicDescription
{
  BOOL v3 = [(BYODDomain *)self isOwner];
  BOOL v4 = [(BYODDomain *)self isShared];
  v14 = [(BYODDomain *)self name];
  v13 = [(BYODDomain *)self dnsProviderName];
  BOOL v5 = [(BYODDomain *)self isDomainConnect];
  v12 = [(BYODDomain *)self status];
  v11 = [(BYODDomain *)self verificationStatus];
  v6 = [(BYODDomain *)self introScreenIndicator];
  v7 = [(BYODDomain *)self reverificationStatus];
  uint64_t v8 = [(BYODDomain *)self domainConnectServerUrl];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"isOwner %d isShared %d domainName %@ dnsProviderName %@ isDomainConnect %d domainStatus %@ verificationStatus %@ introScreen %@ reverificationStatus %@ hasDomainConnectURL %d withEmail %d withFamily %d", v3, v4, v14, v13, v5, v12, v11, v6, v7, [v8 length] != 0, -[BYODDomain withEmailAddress](self, "withEmailAddress"), -[BYODDomain withFamily](self, "withFamily"));

  return (NSString *)v9;
}

- (BYODUser)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(BOOL)a3
{
  self->_isOwner = a3;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (int64_t)transferTimestamp
{
  return self->_transferTimestamp;
}

- (void)setTransferTimestamp:(int64_t)a3
{
  self->_transferTimestamp = a3;
}

- (BOOL)dnsRecordGenerated
{
  return self->_dnsRecordGenerated;
}

- (void)setDnsRecordGenerated:(BOOL)a3
{
  self->_dnsRecordGenerated = a3;
}

- (BOOL)isDomainConnect
{
  return self->_isDomainConnect;
}

- (void)setIsDomainConnect:(BOOL)a3
{
  self->_isDomainConnect = a3;
}

- (NSString)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(id)a3
{
}

- (NSString)dnsProviderName
{
  return self->_dnsProviderName;
}

- (void)setDnsProviderName:(id)a3
{
}

- (NSString)invitationStatus
{
  return self->_invitationStatus;
}

- (void)setInvitationStatus:(id)a3
{
}

- (NSString)applyTemplateUrl
{
  return self->_applyTemplateUrl;
}

- (void)setApplyTemplateUrl:(id)a3
{
}

- (BOOL)withFamily
{
  return self->_withFamily;
}

- (void)setWithFamily:(BOOL)a3
{
  self->_withFamily = a3;
}

- (BOOL)withEmailAddress
{
  return self->_withEmailAddress;
}

- (void)setWithEmailAddress:(BOOL)a3
{
  self->_withEmailAddress = a3;
}

- (NSString)introScreenIndicator
{
  return self->_introScreenIndicator;
}

- (void)setIntroScreenIndicator:(id)a3
{
}

- (NSString)reverificationStatus
{
  return self->_reverificationStatus;
}

- (void)setReverificationStatus:(id)a3
{
}

- (NSString)domainConnectServerUrl
{
  return self->_domainConnectServerUrl;
}

- (void)setDomainConnectServerUrl:(id)a3
{
}

- (int64_t)pendingVerifyEmailCount
{
  return self->_pendingVerifyEmailCount;
}

- (void)setPendingVerifyEmailCount:(int64_t)a3
{
  self->_pendingVerifyEmailCount = a3;
}

- (BOOL)isDomainPurchased
{
  return self->_isDomainPurchased;
}

- (void)setIsDomainPurchased:(BOOL)a3
{
  self->_isDomainPurchased = a3;
}

- (NSString)domainPurchaseProviderName
{
  return self->_domainPurchaseProviderName;
}

- (void)setDomainPurchaseProviderName:(id)a3
{
}

- (BOOL)isDomainModeSet
{
  return self->_isDomainModeSet;
}

- (void)setIsDomainModeSet:(BOOL)a3
{
  self->_isDomainModeSet = a3;
}

- (BOOL)catchAllEnabled
{
  return self->_catchAllEnabled;
}

- (void)setCatchAllEnabled:(BOOL)a3
{
  self->_catchAllEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPurchaseProviderName, 0);
  objc_storeStrong((id *)&self->_domainConnectServerUrl, 0);
  objc_storeStrong((id *)&self->_reverificationStatus, 0);
  objc_storeStrong((id *)&self->_introScreenIndicator, 0);
  objc_storeStrong((id *)&self->_applyTemplateUrl, 0);
  objc_storeStrong((id *)&self->_invitationStatus, 0);
  objc_storeStrong((id *)&self->_dnsProviderName, 0);
  objc_storeStrong((id *)&self->_verificationStatus, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_owner, 0);
}

@end