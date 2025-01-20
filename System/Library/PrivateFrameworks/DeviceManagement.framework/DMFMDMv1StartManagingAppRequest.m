@interface DMFMDMv1StartManagingAppRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (DMFMDMv1StartManagingAppRequest)initWithCoder:(id)a3;
- (NSArray)associatedDomains;
- (NSDictionary)configuration;
- (NSNumber)allowUserToHide;
- (NSNumber)allowUserToLock;
- (NSNumber)associatedDomainsEnableDirectDownloads;
- (NSNumber)internal;
- (NSNumber)removable;
- (NSNumber)tapToPayScreenLock;
- (NSString)DNSProxyUUIDString;
- (NSString)VPNUUIDString;
- (NSString)cellularSliceUUIDString;
- (NSString)contentFilterUUIDString;
- (NSString)originator;
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
- (void)setInternal:(id)a3;
- (void)setManagementOptions:(unint64_t)a3;
- (void)setOriginator:(id)a3;
- (void)setRelayUUIDString:(id)a3;
- (void)setRemovable:(id)a3;
- (void)setTapToPayScreenLock:(id)a3;
- (void)setVPNUUIDString:(id)a3;
@end

@implementation DMFMDMv1StartManagingAppRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB9D0;
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

- (DMFMDMv1StartManagingAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)DMFMDMv1StartManagingAppRequest;
  v5 = [(DMFAppRequest *)&v63 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"originator"];
    originator = v5->_originator;
    v5->_originator = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementOptions"];
    v5->_managementOptions = [v9 integerValue];

    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"VPNUUIDString"];
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v11;

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"cellularSliceUUIDString"];
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v14;

    v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"contentFilterUUIDString"];
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v17;

    v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"DNSProxyUUIDString"];
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v20;

    v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"relayUUIDString"];
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"associatedDomains"];
    associatedDomains = v5->_associatedDomains;
    v5->_associatedDomains = (NSArray *)v28;

    v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"associatedDomainsEnableDirectDownloads"];
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v31;

    v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"removable"];
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v34;

    v36 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"tapToPayScreenLock"];
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v37;

    v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"allowUserToHide"];
    allowUserToHide = v5->_allowUserToHide;
    v5->_allowUserToHide = (NSNumber *)v40;

    v42 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"allowUserToLock"];
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v43;

    v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v61 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v62, "setWithObjects:", v61, v60, v45, v46, v47, v48, v49, v50, v51, v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v54;

    v56 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"internal"];
    internal = v5->_internal;
    v5->_internal = (NSNumber *)v57;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)DMFMDMv1StartManagingAppRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v20 encodeWithCoder:v4];
  v5 = [(DMFMDMv1StartManagingAppRequest *)self originator];
  [v4 encodeObject:v5 forKey:@"originator"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFMDMv1StartManagingAppRequest managementOptions](self, "managementOptions"));
  [v4 encodeObject:v6 forKey:@"managementOptions"];

  uint64_t v7 = [(DMFMDMv1StartManagingAppRequest *)self VPNUUIDString];
  [v4 encodeObject:v7 forKey:@"VPNUUIDString"];

  v8 = [(DMFMDMv1StartManagingAppRequest *)self cellularSliceUUIDString];
  [v4 encodeObject:v8 forKey:@"cellularSliceUUIDString"];

  v9 = [(DMFMDMv1StartManagingAppRequest *)self contentFilterUUIDString];
  [v4 encodeObject:v9 forKey:@"contentFilterUUIDString"];

  v10 = [(DMFMDMv1StartManagingAppRequest *)self DNSProxyUUIDString];
  [v4 encodeObject:v10 forKey:@"DNSProxyUUIDString"];

  uint64_t v11 = [(DMFMDMv1StartManagingAppRequest *)self relayUUIDString];
  [v4 encodeObject:v11 forKey:@"relayUUIDString"];

  v12 = [(DMFMDMv1StartManagingAppRequest *)self associatedDomains];
  [v4 encodeObject:v12 forKey:@"associatedDomains"];

  v13 = [(DMFMDMv1StartManagingAppRequest *)self associatedDomainsEnableDirectDownloads];
  [v4 encodeObject:v13 forKey:@"associatedDomainsEnableDirectDownloads"];

  uint64_t v14 = [(DMFMDMv1StartManagingAppRequest *)self removable];
  [v4 encodeObject:v14 forKey:@"removable"];

  v15 = [(DMFMDMv1StartManagingAppRequest *)self tapToPayScreenLock];
  [v4 encodeObject:v15 forKey:@"tapToPayScreenLock"];

  v16 = [(DMFMDMv1StartManagingAppRequest *)self allowUserToHide];
  [v4 encodeObject:v16 forKey:@"allowUserToHide"];

  uint64_t v17 = [(DMFMDMv1StartManagingAppRequest *)self allowUserToLock];
  [v4 encodeObject:v17 forKey:@"allowUserToLock"];

  v18 = [(DMFMDMv1StartManagingAppRequest *)self configuration];
  [v4 encodeObject:v18 forKey:@"configuration"];

  v19 = [(DMFMDMv1StartManagingAppRequest *)self internal];
  [v4 encodeObject:v19 forKey:@"internal"];
}

- (id)description
{
  v6[19] = *MEMORY[0x1E4F143B8];
  v6[0] = @"bundleIdentifier";
  v6[1] = @"storeItemIdentifier";
  v6[2] = @"manifestURL";
  v6[3] = @"personaIdentifier";
  v6[4] = @"sourceIdentifier";
  v6[5] = @"originator";
  v6[6] = @"managementOptions";
  v6[7] = @"VPNUUIDString";
  v6[8] = @"cellularSliceUUIDString";
  v6[9] = @"contentFilterUUIDString";
  v6[10] = @"DNSProxyUUIDString";
  v6[11] = @"relayUUIDString";
  v6[12] = @"associatedDomains";
  v6[13] = @"associatedDomainsEnableDirectDownloads";
  v6[14] = @"removable";
  v6[15] = @"tapToPayScreenLock";
  v6[16] = @"allowUserToHide";
  v6[17] = @"allowUserToLock";
  v6[18] = @"configuration";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:19];
  id v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
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

- (NSNumber)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
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
}

@end