@interface DMFMDMv1InstallAppRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)manage;
- (DMFMDMv1InstallAppRequest)initWithCoder:(id)a3;
- (NSArray)associatedDomains;
- (NSDictionary)configuration;
- (NSNumber)allowUserToHide;
- (NSNumber)allowUserToLock;
- (NSNumber)associatedDomainsEnableDirectDownloads;
- (NSNumber)removable;
- (NSNumber)tapToPayScreenLock;
- (NSString)DNSProxyUUIDString;
- (NSString)VPNUUIDString;
- (NSString)cellularSliceUUIDString;
- (NSString)contentFilterUUIDString;
- (NSString)originator;
- (NSString)redemptionCode;
- (NSString)relayUUIDString;
- (id)description;
- (unint64_t)managementOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowUserToHide:(id)a3;
- (void)setAllowUserToLock:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3;
- (void)setCellularSliceUUIDString:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentFilterUUIDString:(id)a3;
- (void)setDNSProxyUUIDString:(id)a3;
- (void)setManage:(BOOL)a3;
- (void)setManagementOptions:(unint64_t)a3;
- (void)setOriginator:(id)a3;
- (void)setRedemptionCode:(id)a3;
- (void)setRelayUUIDString:(id)a3;
- (void)setRemovable:(id)a3;
- (void)setTapToPayScreenLock:(id)a3;
- (void)setVPNUUIDString:(id)a3;
@end

@implementation DMFMDMv1InstallAppRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB9B8;
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

- (DMFMDMv1InstallAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)DMFMDMv1InstallAppRequest;
  v5 = [(DMFInstallAppRequest *)&v64 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"redemptionCode"];
    redemptionCode = v5->_redemptionCode;
    v5->_redemptionCode = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manage"];
    v5->_manage = [v9 BOOLValue];

    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"originator"];
    originator = v5->_originator;
    v5->_originator = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementOptions"];
    v5->_managementOptions = [v13 integerValue];

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"VPNUUIDString"];
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v15;

    v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"cellularSliceUUIDString"];
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v18;

    v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"contentFilterUUIDString"];
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v21;

    v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"DNSProxyUUIDString"];
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v24;

    v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"relayUUIDString"];
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"associatedDomains"];
    associatedDomains = v5->_associatedDomains;
    v5->_associatedDomains = (NSArray *)v32;

    v34 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"associatedDomainsEnableDirectDownloads"];
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v35;

    v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"removable"];
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v38;

    v40 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"tapToPayScreenLock"];
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v41;

    v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"allowUserToHide"];
    allowUserToHide = v5->_allowUserToHide;
    v5->_allowUserToHide = (NSNumber *)v44;

    v46 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"allowUserToLock"];
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v47;

    v63 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v63, "setWithObjects:", v62, v61, v49, v50, v51, v52, v53, v54, v55, v56, objc_opt_class(), 0);
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v58;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)DMFMDMv1InstallAppRequest;
  id v4 = a3;
  [(DMFInstallAppRequest *)&v21 encodeWithCoder:v4];
  v5 = [(DMFMDMv1InstallAppRequest *)self redemptionCode];
  [v4 encodeObject:v5 forKey:@"redemptionCode"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFMDMv1InstallAppRequest manage](self, "manage"));
  [v4 encodeObject:v6 forKey:@"manage"];

  uint64_t v7 = [(DMFMDMv1InstallAppRequest *)self originator];
  [v4 encodeObject:v7 forKey:@"originator"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFMDMv1InstallAppRequest managementOptions](self, "managementOptions"));
  [v4 encodeObject:v8 forKey:@"managementOptions"];

  v9 = [(DMFMDMv1InstallAppRequest *)self VPNUUIDString];
  [v4 encodeObject:v9 forKey:@"VPNUUIDString"];

  v10 = [(DMFMDMv1InstallAppRequest *)self cellularSliceUUIDString];
  [v4 encodeObject:v10 forKey:@"cellularSliceUUIDString"];

  uint64_t v11 = [(DMFMDMv1InstallAppRequest *)self contentFilterUUIDString];
  [v4 encodeObject:v11 forKey:@"contentFilterUUIDString"];

  v12 = [(DMFMDMv1InstallAppRequest *)self DNSProxyUUIDString];
  [v4 encodeObject:v12 forKey:@"DNSProxyUUIDString"];

  v13 = [(DMFMDMv1InstallAppRequest *)self relayUUIDString];
  [v4 encodeObject:v13 forKey:@"relayUUIDString"];

  v14 = [(DMFMDMv1InstallAppRequest *)self associatedDomains];
  [v4 encodeObject:v14 forKey:@"associatedDomains"];

  uint64_t v15 = [(DMFMDMv1InstallAppRequest *)self associatedDomainsEnableDirectDownloads];
  [v4 encodeObject:v15 forKey:@"associatedDomainsEnableDirectDownloads"];

  v16 = [(DMFMDMv1InstallAppRequest *)self removable];
  [v4 encodeObject:v16 forKey:@"removable"];

  v17 = [(DMFMDMv1InstallAppRequest *)self tapToPayScreenLock];
  [v4 encodeObject:v17 forKey:@"tapToPayScreenLock"];

  uint64_t v18 = [(DMFMDMv1InstallAppRequest *)self allowUserToHide];
  [v4 encodeObject:v18 forKey:@"allowUserToHide"];

  v19 = [(DMFMDMv1InstallAppRequest *)self allowUserToLock];
  [v4 encodeObject:v19 forKey:@"allowUserToLock"];

  v20 = [(DMFMDMv1InstallAppRequest *)self configuration];
  [v4 encodeObject:v20 forKey:@"configuration"];
}

- (id)description
{
  v6[23] = *MEMORY[0x1E4F143B8];
  v6[0] = @"bundleIdentifier";
  v6[1] = @"storeItemIdentifier";
  v6[2] = @"manifestURL";
  v6[3] = @"personaIdentifier";
  v6[4] = @"sourceIdentifier";
  v6[5] = @"licenseType";
  v6[6] = @"allowFreePurchases";
  v6[7] = @"redemptionCode";
  v6[8] = @"manage";
  v6[9] = @"originator";
  v6[10] = @"managementOptions";
  v6[11] = @"VPNUUIDString";
  v6[12] = @"cellularSliceUUIDString";
  v6[13] = @"contentFilterUUIDString";
  v6[14] = @"DNSProxyUUIDString";
  v6[15] = @"relayUUIDString";
  v6[16] = @"associatedDomains";
  v6[17] = @"associatedDomainsEnableDirectDownloads";
  v6[18] = @"removable";
  v6[19] = @"tapToPayScreenLock";
  v6[20] = @"allowUserToHide";
  v6[21] = @"allowUserToLock";
  v6[22] = @"configuration";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:23];
  id v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

- (NSString)redemptionCode
{
  return self->_redemptionCode;
}

- (void)setRedemptionCode:(id)a3
{
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (BOOL)manage
{
  return self->_manage;
}

- (void)setManage:(BOOL)a3
{
  self->_manage = a3;
}

- (unint64_t)managementOptions
{
  return self->_managementOptions;
}

- (void)setManagementOptions:(unint64_t)a3
{
  self->_managementOptions = a3;
}

- (NSString)VPNUUIDString
{
  return self->_VPNUUIDString;
}

- (void)setVPNUUIDString:(id)a3
{
}

- (NSString)cellularSliceUUIDString
{
  return self->_cellularSliceUUIDString;
}

- (void)setCellularSliceUUIDString:(id)a3
{
}

- (NSString)contentFilterUUIDString
{
  return self->_contentFilterUUIDString;
}

- (void)setContentFilterUUIDString:(id)a3
{
}

- (NSString)DNSProxyUUIDString
{
  return self->_DNSProxyUUIDString;
}

- (void)setDNSProxyUUIDString:(id)a3
{
}

- (NSString)relayUUIDString
{
  return self->_relayUUIDString;
}

- (void)setRelayUUIDString:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
}

- (NSNumber)tapToPayScreenLock
{
  return self->_tapToPayScreenLock;
}

- (void)setTapToPayScreenLock:(id)a3
{
}

- (NSNumber)allowUserToHide
{
  return self->_allowUserToHide;
}

- (void)setAllowUserToHide:(id)a3
{
}

- (NSNumber)allowUserToLock
{
  return self->_allowUserToLock;
}

- (void)setAllowUserToLock:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_allowUserToLock, 0);
  objc_storeStrong((id *)&self->_allowUserToHide, 0);
  objc_storeStrong((id *)&self->_tapToPayScreenLock, 0);
  objc_storeStrong((id *)&self->_removable, 0);
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_relayUUIDString, 0);
  objc_storeStrong((id *)&self->_DNSProxyUUIDString, 0);
  objc_storeStrong((id *)&self->_contentFilterUUIDString, 0);
  objc_storeStrong((id *)&self->_cellularSliceUUIDString, 0);
  objc_storeStrong((id *)&self->_VPNUUIDString, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_redemptionCode, 0);
}

@end