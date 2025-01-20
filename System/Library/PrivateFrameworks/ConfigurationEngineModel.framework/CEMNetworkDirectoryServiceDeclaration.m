@interface CEMNetworkDirectoryServiceDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withHostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withHostName:(id)a4 withUserName:(id)a5 withPassword:(id)a6 withClientID:(id)a7 withDescription:(id)a8 withADOrganizationalUnit:(id)a9 withADMountStyle:(id)a10 withADCreateMobileAccountAtLoginFlag:(id)a11 withADCreateMobileAccountAtLogin:(id)a12 withADWarnUserBeforeCreatingMAFlag:(id)a13 withADWarnUserBeforeCreatingMA:(id)a14 withADForceHomeLocalFlag:(id)a15 withADForceHomeLocal:(id)a16 withADUseWindowsUNCPathFlag:(id)a17 withADUseWindowsUNCPath:(id)a18 withADAllowMultiDomainAuthFlag:(id)a19 withADAllowMultiDomainAuth:(id)a20 withADDefaultUserShellFlag:(id)a21 withADDefaultUserShell:(id)a22 withADMapUIDAttributeFlag:(id)a23 withADMapUIDAttribute:(id)a24 withADMapGIDAttributeFlag:(id)a25 withADMapGIDAttribute:(id)a26 withADMapGGIDAttributeFlag:(id)a27 withADMapGGIDAttribute:(id)a28 withADPreferredDCServerFlag:(id)a29 withADPreferredDCServer:(id)a30 withADDomainAdminGroupListFlag:(id)a31 withADDomainAdminGroupList:(id)a32 withADNamespaceFlag:(id)a33 withADNamespace:(id)a34 withADPacketSignFlag:(id)a35 withADPacketSign:(id)a36 withADPacketEncryptFlag:(id)a37 withADPacketEncrypt:(id)a38 withADRestrictDDNSFlag:(id)a39 withADRestrictDDNS:(id)a40 withADTrustChangePassIntervalDaysFlag:(id)a41 withADTrustChangePassIntervalDays:(id)a42;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadADDomainAdminGroupList;
- (NSArray)payloadADRestrictDDNS;
- (NSNumber)payloadADAllowMultiDomainAuth;
- (NSNumber)payloadADAllowMultiDomainAuthFlag;
- (NSNumber)payloadADCreateMobileAccountAtLogin;
- (NSNumber)payloadADCreateMobileAccountAtLoginFlag;
- (NSNumber)payloadADDefaultUserShellFlag;
- (NSNumber)payloadADDomainAdminGroupListFlag;
- (NSNumber)payloadADForceHomeLocal;
- (NSNumber)payloadADForceHomeLocalFlag;
- (NSNumber)payloadADMapGGIDAttributeFlag;
- (NSNumber)payloadADMapGIDAttributeFlag;
- (NSNumber)payloadADMapUIDAttributeFlag;
- (NSNumber)payloadADNamespaceFlag;
- (NSNumber)payloadADPacketEncryptFlag;
- (NSNumber)payloadADPacketSignFlag;
- (NSNumber)payloadADPreferredDCServerFlag;
- (NSNumber)payloadADRestrictDDNSFlag;
- (NSNumber)payloadADTrustChangePassIntervalDays;
- (NSNumber)payloadADTrustChangePassIntervalDaysFlag;
- (NSNumber)payloadADUseWindowsUNCPath;
- (NSNumber)payloadADUseWindowsUNCPathFlag;
- (NSNumber)payloadADWarnUserBeforeCreatingMA;
- (NSNumber)payloadADWarnUserBeforeCreatingMAFlag;
- (NSString)payloadADDefaultUserShell;
- (NSString)payloadADMapGGIDAttribute;
- (NSString)payloadADMapGIDAttribute;
- (NSString)payloadADMapUIDAttribute;
- (NSString)payloadADMountStyle;
- (NSString)payloadADNamespace;
- (NSString)payloadADOrganizationalUnit;
- (NSString)payloadADPacketEncrypt;
- (NSString)payloadADPacketSign;
- (NSString)payloadADPreferredDCServer;
- (NSString)payloadClientID;
- (NSString)payloadDescription;
- (NSString)payloadHostName;
- (NSString)payloadPassword;
- (NSString)payloadUserName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadADAllowMultiDomainAuth:(id)a3;
- (void)setPayloadADAllowMultiDomainAuthFlag:(id)a3;
- (void)setPayloadADCreateMobileAccountAtLogin:(id)a3;
- (void)setPayloadADCreateMobileAccountAtLoginFlag:(id)a3;
- (void)setPayloadADDefaultUserShell:(id)a3;
- (void)setPayloadADDefaultUserShellFlag:(id)a3;
- (void)setPayloadADDomainAdminGroupList:(id)a3;
- (void)setPayloadADDomainAdminGroupListFlag:(id)a3;
- (void)setPayloadADForceHomeLocal:(id)a3;
- (void)setPayloadADForceHomeLocalFlag:(id)a3;
- (void)setPayloadADMapGGIDAttribute:(id)a3;
- (void)setPayloadADMapGGIDAttributeFlag:(id)a3;
- (void)setPayloadADMapGIDAttribute:(id)a3;
- (void)setPayloadADMapGIDAttributeFlag:(id)a3;
- (void)setPayloadADMapUIDAttribute:(id)a3;
- (void)setPayloadADMapUIDAttributeFlag:(id)a3;
- (void)setPayloadADMountStyle:(id)a3;
- (void)setPayloadADNamespace:(id)a3;
- (void)setPayloadADNamespaceFlag:(id)a3;
- (void)setPayloadADOrganizationalUnit:(id)a3;
- (void)setPayloadADPacketEncrypt:(id)a3;
- (void)setPayloadADPacketEncryptFlag:(id)a3;
- (void)setPayloadADPacketSign:(id)a3;
- (void)setPayloadADPacketSignFlag:(id)a3;
- (void)setPayloadADPreferredDCServer:(id)a3;
- (void)setPayloadADPreferredDCServerFlag:(id)a3;
- (void)setPayloadADRestrictDDNS:(id)a3;
- (void)setPayloadADRestrictDDNSFlag:(id)a3;
- (void)setPayloadADTrustChangePassIntervalDays:(id)a3;
- (void)setPayloadADTrustChangePassIntervalDaysFlag:(id)a3;
- (void)setPayloadADUseWindowsUNCPath:(id)a3;
- (void)setPayloadADUseWindowsUNCPathFlag:(id)a3;
- (void)setPayloadADWarnUserBeforeCreatingMA:(id)a3;
- (void)setPayloadADWarnUserBeforeCreatingMAFlag:(id)a3;
- (void)setPayloadClientID:(id)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadUserName:(id)a3;
@end

@implementation CEMNetworkDirectoryServiceDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.directoryservice";
}

+ (id)profileType
{
  return @"com.apple.DirectoryService.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[39] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"HostName";
  v6[1] = @"UserName";
  v6[2] = @"Password";
  v6[3] = @"ClientID";
  v6[4] = @"Description";
  v6[5] = @"ADOrganizationalUnit";
  v6[6] = @"ADMountStyle";
  v6[7] = @"ADCreateMobileAccountAtLoginFlag";
  v6[8] = @"ADCreateMobileAccountAtLogin";
  v6[9] = @"ADWarnUserBeforeCreatingMAFlag";
  v6[10] = @"ADWarnUserBeforeCreatingMA";
  v6[11] = @"ADForceHomeLocalFlag";
  v6[12] = @"ADForceHomeLocal";
  v6[13] = @"ADUseWindowsUNCPathFlag";
  v6[14] = @"ADUseWindowsUNCPath";
  v6[15] = @"ADAllowMultiDomainAuthFlag";
  v6[16] = @"ADAllowMultiDomainAuth";
  v6[17] = @"ADDefaultUserShellFlag";
  v6[18] = @"ADDefaultUserShell";
  v6[19] = @"ADMapUIDAttributeFlag";
  v6[20] = @"ADMapUIDAttribute";
  v6[21] = @"ADMapGIDAttributeFlag";
  v6[22] = @"ADMapGIDAttribute";
  v6[23] = @"ADMapGGIDAttributeFlag";
  v6[24] = @"ADMapGGIDAttribute";
  v6[25] = @"ADPreferredDCServerFlag";
  v6[26] = @"ADPreferredDCServer";
  v6[27] = @"ADDomainAdminGroupListFlag";
  v6[28] = @"ADDomainAdminGroupList";
  v6[29] = @"ADNamespaceFlag";
  v6[30] = @"ADNamespace";
  v6[31] = @"ADPacketSignFlag";
  v6[32] = @"ADPacketSign";
  v6[33] = @"ADPacketEncryptFlag";
  v6[34] = @"ADPacketEncrypt";
  v6[35] = @"ADRestrictDDNSFlag";
  v6[36] = @"ADRestrictDDNS";
  v6[37] = @"ADTrustChangePassIntervalDaysFlag";
  v6[38] = @"ADTrustChangePassIntervalDays";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:39];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withHostName:(id)a4 withUserName:(id)a5 withPassword:(id)a6 withClientID:(id)a7 withDescription:(id)a8 withADOrganizationalUnit:(id)a9 withADMountStyle:(id)a10 withADCreateMobileAccountAtLoginFlag:(id)a11 withADCreateMobileAccountAtLogin:(id)a12 withADWarnUserBeforeCreatingMAFlag:(id)a13 withADWarnUserBeforeCreatingMA:(id)a14 withADForceHomeLocalFlag:(id)a15 withADForceHomeLocal:(id)a16 withADUseWindowsUNCPathFlag:(id)a17 withADUseWindowsUNCPath:(id)a18 withADAllowMultiDomainAuthFlag:(id)a19 withADAllowMultiDomainAuth:(id)a20 withADDefaultUserShellFlag:(id)a21 withADDefaultUserShell:(id)a22 withADMapUIDAttributeFlag:(id)a23 withADMapUIDAttribute:(id)a24 withADMapGIDAttributeFlag:(id)a25 withADMapGIDAttribute:(id)a26 withADMapGGIDAttributeFlag:(id)a27 withADMapGGIDAttribute:(id)a28 withADPreferredDCServerFlag:(id)a29 withADPreferredDCServer:(id)a30 withADDomainAdminGroupListFlag:(id)a31 withADDomainAdminGroupList:(id)a32 withADNamespaceFlag:(id)a33 withADNamespace:(id)a34 withADPacketSignFlag:(id)a35 withADPacketSign:(id)a36 withADPacketEncryptFlag:(id)a37 withADPacketEncrypt:(id)a38 withADRestrictDDNSFlag:(id)a39 withADRestrictDDNS:(id)a40 withADTrustChangePassIntervalDaysFlag:(id)a41 withADTrustChangePassIntervalDays:(id)a42
{
  id v42 = a3;
  id v113 = a42;
  id v112 = a41;
  id v111 = a40;
  id v110 = a39;
  id v109 = a38;
  id v43 = a37;
  id v44 = a36;
  id v45 = a35;
  id v46 = a34;
  id v108 = a33;
  id v107 = a32;
  id v106 = a31;
  id v105 = a30;
  id v104 = a29;
  id v103 = a28;
  id v102 = a27;
  id v101 = a26;
  id v100 = a25;
  id v99 = a24;
  id v98 = a23;
  id v97 = a22;
  id v96 = a21;
  id v95 = a20;
  id v94 = a19;
  id v93 = a18;
  id v89 = a17;
  id v84 = a16;
  id v81 = a15;
  id v78 = a14;
  id v77 = a13;
  id v79 = a12;
  id v80 = a11;
  id v82 = a10;
  id v83 = a9;
  id v86 = a8;
  id v47 = a7;
  id v48 = a6;
  id v49 = a5;
  id v50 = a4;
  v51 = objc_opt_new();
  [v51 setDeclarationType:@"com.apple.configuration.network.directoryservice"];
  if (v42)
  {
    [v51 setDeclarationIdentifier:v42];
  }
  else
  {
    [MEMORY[0x263F08C38] UUID];
    v52 = id v92 = v45;
    v53 = [v52 UUIDString];
    [v51 setDeclarationIdentifier:v53];

    id v42 = 0;
    id v45 = v92;
  }
  [v51 setPayloadHostName:v50];

  [v51 setPayloadUserName:v49];
  [v51 setPayloadPassword:v48];

  [v51 setPayloadClientID:v47];
  [v51 setPayloadDescription:v86];

  [v51 setPayloadADOrganizationalUnit:v83];
  [v51 setPayloadADMountStyle:v82];

  v54 = (void *)MEMORY[0x263EFFA80];
  if (v80) {
    id v55 = v80;
  }
  else {
    id v55 = (id)MEMORY[0x263EFFA80];
  }
  [v51 setPayloadADCreateMobileAccountAtLoginFlag:v55];

  if (v79) {
    id v56 = v79;
  }
  else {
    id v56 = v54;
  }
  [v51 setPayloadADCreateMobileAccountAtLogin:v56];

  if (v77) {
    id v57 = v77;
  }
  else {
    id v57 = v54;
  }
  [v51 setPayloadADWarnUserBeforeCreatingMAFlag:v57];

  if (v78) {
    id v58 = v78;
  }
  else {
    id v58 = v54;
  }
  [v51 setPayloadADWarnUserBeforeCreatingMA:v58];

  if (v81) {
    id v59 = v81;
  }
  else {
    id v59 = v54;
  }
  [v51 setPayloadADForceHomeLocalFlag:v59];

  if (v84) {
    id v60 = v84;
  }
  else {
    id v60 = v54;
  }
  [v51 setPayloadADForceHomeLocal:v60];

  if (v89) {
    id v61 = v89;
  }
  else {
    id v61 = v54;
  }
  [v51 setPayloadADUseWindowsUNCPathFlag:v61];

  if (v93) {
    id v62 = v93;
  }
  else {
    id v62 = v54;
  }
  [v51 setPayloadADUseWindowsUNCPath:v62];

  if (v94) {
    id v63 = v94;
  }
  else {
    id v63 = v54;
  }
  [v51 setPayloadADAllowMultiDomainAuthFlag:v63];

  if (v95) {
    id v64 = v95;
  }
  else {
    id v64 = v54;
  }
  [v51 setPayloadADAllowMultiDomainAuth:v64];

  if (v96) {
    id v65 = v96;
  }
  else {
    id v65 = v54;
  }
  [v51 setPayloadADDefaultUserShellFlag:v65];

  [v51 setPayloadADDefaultUserShell:v97];
  if (v98) {
    id v66 = v98;
  }
  else {
    id v66 = v54;
  }
  [v51 setPayloadADMapUIDAttributeFlag:v66];

  [v51 setPayloadADMapUIDAttribute:v99];
  if (v100) {
    id v67 = v100;
  }
  else {
    id v67 = v54;
  }
  [v51 setPayloadADMapGIDAttributeFlag:v67];

  [v51 setPayloadADMapGIDAttribute:v101];
  if (v102) {
    id v68 = v102;
  }
  else {
    id v68 = v54;
  }
  [v51 setPayloadADMapGGIDAttributeFlag:v68];

  [v51 setPayloadADMapGGIDAttribute:v103];
  if (v104) {
    id v69 = v104;
  }
  else {
    id v69 = v54;
  }
  [v51 setPayloadADPreferredDCServerFlag:v69];

  [v51 setPayloadADPreferredDCServer:v105];
  if (v106) {
    id v70 = v106;
  }
  else {
    id v70 = v54;
  }
  [v51 setPayloadADDomainAdminGroupListFlag:v70];

  [v51 setPayloadADDomainAdminGroupList:v107];
  if (v108) {
    id v71 = v108;
  }
  else {
    id v71 = v54;
  }
  [v51 setPayloadADNamespaceFlag:v71];

  [v51 setPayloadADNamespace:v46];
  if (v45) {
    id v72 = v45;
  }
  else {
    id v72 = v54;
  }
  [v51 setPayloadADPacketSignFlag:v72];

  [v51 setPayloadADPacketSign:v44];
  if (v43) {
    id v73 = v43;
  }
  else {
    id v73 = v54;
  }
  [v51 setPayloadADPacketEncryptFlag:v73];

  [v51 setPayloadADPacketEncrypt:v109];
  if (v110) {
    id v74 = v110;
  }
  else {
    id v74 = v54;
  }
  [v51 setPayloadADRestrictDDNSFlag:v74];

  [v51 setPayloadADRestrictDDNS:v111];
  if (v112) {
    id v75 = v112;
  }
  else {
    id v75 = v54;
  }
  [v51 setPayloadADTrustChangePassIntervalDaysFlag:v75];

  [v51 setPayloadADTrustChangePassIntervalDays:v113];
  [v51 updateServerHash];

  return v51;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withHostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.network.directoryservice"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadHostName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkDirectoryServiceDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v131 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HostName" isRequired:1 defaultValue:0 error:&v131];
  id v14 = v131;
  payloadHostName = self->_payloadHostName;
  self->_payloadHostName = v13;

  if (!v14)
  {
    id v130 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserName" isRequired:0 defaultValue:0 error:&v130];
    id v14 = v130;
    payloadUserName = self->_payloadUserName;
    self->_payloadUserName = v16;

    if (!v14)
    {
      id v129 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v129];
      id v14 = v129;
      payloadPassword = self->_payloadPassword;
      self->_payloadPassword = v18;

      if (!v14)
      {
        id v128 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ClientID" isRequired:0 defaultValue:0 error:&v128];
        id v14 = v128;
        payloadClientID = self->_payloadClientID;
        self->_payloadClientID = v20;

        if (!v14)
        {
          id v127 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Description" isRequired:0 defaultValue:0 error:&v127];
          id v14 = v127;
          payloadDescription = self->_payloadDescription;
          self->_payloadDescription = v22;

          if (!v14)
          {
            id v126 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADOrganizationalUnit" isRequired:0 defaultValue:0 error:&v126];
            id v14 = v126;
            payloadADOrganizationalUnit = self->_payloadADOrganizationalUnit;
            self->_payloadADOrganizationalUnit = v24;

            if (!v14)
            {
              id v125 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADMountStyle" isRequired:0 defaultValue:0 error:&v125];
              id v14 = v125;
              payloadADMountStyle = self->_payloadADMountStyle;
              self->_payloadADMountStyle = v26;

              if (!v14)
              {
                id v124 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADCreateMobileAccountAtLoginFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v124];
                id v14 = v124;
                payloadADCreateMobileAccountAtLoginFlag = self->_payloadADCreateMobileAccountAtLoginFlag;
                self->_payloadADCreateMobileAccountAtLoginFlag = v28;

                if (!v14)
                {
                  id v123 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADCreateMobileAccountAtLogin" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v123];
                  id v14 = v123;
                  payloadADCreateMobileAccountAtLogin = self->_payloadADCreateMobileAccountAtLogin;
                  self->_payloadADCreateMobileAccountAtLogin = v30;

                  if (!v14)
                  {
                    id v122 = 0;
                    v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADWarnUserBeforeCreatingMAFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v122];
                    id v14 = v122;
                    payloadADWarnUserBeforeCreatingMAFlag = self->_payloadADWarnUserBeforeCreatingMAFlag;
                    self->_payloadADWarnUserBeforeCreatingMAFlag = v32;

                    if (!v14)
                    {
                      id v121 = 0;
                      v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADWarnUserBeforeCreatingMA" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v121];
                      id v14 = v121;
                      payloadADWarnUserBeforeCreatingMA = self->_payloadADWarnUserBeforeCreatingMA;
                      self->_payloadADWarnUserBeforeCreatingMA = v34;

                      if (!v14)
                      {
                        id v120 = 0;
                        v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADForceHomeLocalFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v120];
                        id v14 = v120;
                        payloadADForceHomeLocalFlag = self->_payloadADForceHomeLocalFlag;
                        self->_payloadADForceHomeLocalFlag = v36;

                        if (!v14)
                        {
                          id v119 = 0;
                          v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADForceHomeLocal" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v119];
                          id v14 = v119;
                          payloadADForceHomeLocal = self->_payloadADForceHomeLocal;
                          self->_payloadADForceHomeLocal = v38;

                          if (!v14)
                          {
                            id v118 = 0;
                            v40 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADUseWindowsUNCPathFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v118];
                            id v14 = v118;
                            payloadADUseWindowsUNCPathFlag = self->_payloadADUseWindowsUNCPathFlag;
                            self->_payloadADUseWindowsUNCPathFlag = v40;

                            if (!v14)
                            {
                              id v117 = 0;
                              id v42 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADUseWindowsUNCPath" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v117];
                              id v14 = v117;
                              payloadADUseWindowsUNCPath = self->_payloadADUseWindowsUNCPath;
                              self->_payloadADUseWindowsUNCPath = v42;

                              if (!v14)
                              {
                                id v116 = 0;
                                id v44 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADAllowMultiDomainAuthFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v116];
                                id v14 = v116;
                                payloadADAllowMultiDomainAuthFlag = self->_payloadADAllowMultiDomainAuthFlag;
                                self->_payloadADAllowMultiDomainAuthFlag = v44;

                                if (!v14)
                                {
                                  id v115 = 0;
                                  id v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADAllowMultiDomainAuth" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v115];
                                  id v14 = v115;
                                  payloadADAllowMultiDomainAuth = self->_payloadADAllowMultiDomainAuth;
                                  self->_payloadADAllowMultiDomainAuth = v46;

                                  if (!v14)
                                  {
                                    id v114 = 0;
                                    id v48 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADDefaultUserShellFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v114];
                                    id v14 = v114;
                                    payloadADDefaultUserShellFlag = self->_payloadADDefaultUserShellFlag;
                                    self->_payloadADDefaultUserShellFlag = v48;

                                    if (!v14)
                                    {
                                      id v113 = 0;
                                      id v50 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADDefaultUserShell" isRequired:0 defaultValue:0 error:&v113];
                                      id v14 = v113;
                                      payloadADDefaultUserShell = self->_payloadADDefaultUserShell;
                                      self->_payloadADDefaultUserShell = v50;

                                      if (!v14)
                                      {
                                        id v112 = 0;
                                        v52 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADMapUIDAttributeFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v112];
                                        id v14 = v112;
                                        payloadADMapUIDAttributeFlag = self->_payloadADMapUIDAttributeFlag;
                                        self->_payloadADMapUIDAttributeFlag = v52;

                                        if (!v14)
                                        {
                                          id v111 = 0;
                                          v54 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADMapUIDAttribute" isRequired:0 defaultValue:0 error:&v111];
                                          id v14 = v111;
                                          payloadADMapUIDAttribute = self->_payloadADMapUIDAttribute;
                                          self->_payloadADMapUIDAttribute = v54;

                                          if (!v14)
                                          {
                                            id v110 = 0;
                                            id v56 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADMapGIDAttributeFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v110];
                                            id v14 = v110;
                                            payloadADMapGIDAttributeFlag = self->_payloadADMapGIDAttributeFlag;
                                            self->_payloadADMapGIDAttributeFlag = v56;

                                            if (!v14)
                                            {
                                              id v109 = 0;
                                              id v58 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADMapGIDAttribute" isRequired:0 defaultValue:0 error:&v109];
                                              id v14 = v109;
                                              payloadADMapGIDAttribute = self->_payloadADMapGIDAttribute;
                                              self->_payloadADMapGIDAttribute = v58;

                                              if (!v14)
                                              {
                                                id v108 = 0;
                                                id v60 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADMapGGIDAttributeFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v108];
                                                id v14 = v108;
                                                payloadADMapGGIDAttributeFlag = self->_payloadADMapGGIDAttributeFlag;
                                                self->_payloadADMapGGIDAttributeFlag = v60;

                                                if (!v14)
                                                {
                                                  id v107 = 0;
                                                  id v62 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADMapGGIDAttribute" isRequired:0 defaultValue:0 error:&v107];
                                                  id v14 = v107;
                                                  payloadADMapGGIDAttribute = self->_payloadADMapGGIDAttribute;
                                                  self->_payloadADMapGGIDAttribute = v62;

                                                  if (!v14)
                                                  {
                                                    id v106 = 0;
                                                    id v64 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADPreferredDCServerFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v106];
                                                    id v14 = v106;
                                                    payloadADPreferredDCServerFlag = self->_payloadADPreferredDCServerFlag;
                                                    self->_payloadADPreferredDCServerFlag = v64;

                                                    if (!v14)
                                                    {
                                                      id v105 = 0;
                                                      id v66 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADPreferredDCServer" isRequired:0 defaultValue:0 error:&v105];
                                                      id v14 = v105;
                                                      payloadADPreferredDCServer = self->_payloadADPreferredDCServer;
                                                      self->_payloadADPreferredDCServer = v66;

                                                      if (!v14)
                                                      {
                                                        id v104 = 0;
                                                        id v68 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADDomainAdminGroupListFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v104];
                                                        id v14 = v104;
                                                        payloadADDomainAdminGroupListFlag = self->_payloadADDomainAdminGroupListFlag;
                                                        self->_payloadADDomainAdminGroupListFlag = v68;

                                                        if (!v14)
                                                        {
                                                          id v103 = 0;
                                                          id v70 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ADDomainAdminGroupList" validator:&__block_literal_global_19 isRequired:0 defaultValue:0 error:&v103];
                                                          id v14 = v103;
                                                          payloadADDomainAdminGroupList = self->_payloadADDomainAdminGroupList;
                                                          self->_payloadADDomainAdminGroupList = v70;

                                                          if (!v14)
                                                          {
                                                            id v102 = 0;
                                                            id v72 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADNamespaceFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v102];
                                                            id v14 = v102;
                                                            payloadADNamespaceFlag = self->_payloadADNamespaceFlag;
                                                            self->_payloadADNamespaceFlag = v72;

                                                            if (!v14)
                                                            {
                                                              id v101 = 0;
                                                              id v74 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADNamespace" isRequired:0 defaultValue:0 error:&v101];
                                                              id v14 = v101;
                                                              payloadADNamespace = self->_payloadADNamespace;
                                                              self->_payloadADNamespace = v74;

                                                              if (!v14)
                                                              {
                                                                id v100 = 0;
                                                                v76 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADPacketSignFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v100];
                                                                id v14 = v100;
                                                                payloadADPacketSignFlag = self->_payloadADPacketSignFlag;
                                                                self->_payloadADPacketSignFlag = v76;

                                                                if (!v14)
                                                                {
                                                                  id v99 = 0;
                                                                  id v78 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADPacketSign" isRequired:0 defaultValue:0 error:&v99];
                                                                  id v14 = v99;
                                                                  payloadADPacketSign = self->_payloadADPacketSign;
                                                                  self->_payloadADPacketSign = v78;

                                                                  if (!v14)
                                                                  {
                                                                    id v98 = 0;
                                                                    id v80 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADPacketEncryptFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v98];
                                                                    id v14 = v98;
                                                                    payloadADPacketEncryptFlag = self->_payloadADPacketEncryptFlag;
                                                                    self->_payloadADPacketEncryptFlag = v80;

                                                                    if (!v14)
                                                                    {
                                                                      id v97 = 0;
                                                                      id v82 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ADPacketEncrypt" isRequired:0 defaultValue:0 error:&v97];
                                                                      id v14 = v97;
                                                                      payloadADPacketEncrypt = self->_payloadADPacketEncrypt;
                                                                      self->_payloadADPacketEncrypt = v82;

                                                                      if (!v14)
                                                                      {
                                                                        id v96 = 0;
                                                                        id v84 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADRestrictDDNSFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v96];
                                                                        id v14 = v96;
                                                                        payloadADRestrictDDNSFlag = self->_payloadADRestrictDDNSFlag;
                                                                        self->_payloadADRestrictDDNSFlag = v84;

                                                                        if (!v14)
                                                                        {
                                                                          id v95 = 0;
                                                                          id v86 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ADRestrictDDNS" validator:&__block_literal_global_131 isRequired:0 defaultValue:0 error:&v95];
                                                                          id v14 = v95;
                                                                          payloadADRestrictDDNS = self->_payloadADRestrictDDNS;
                                                                          self->_payloadADRestrictDDNS = v86;

                                                                          if (!v14)
                                                                          {
                                                                            id v94 = 0;
                                                                            v88 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ADTrustChangePassIntervalDaysFlag" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v94];
                                                                            id v14 = v94;
                                                                            payloadADTrustChangePassIntervalDaysFlag = self->_payloadADTrustChangePassIntervalDaysFlag;
                                                                            self->_payloadADTrustChangePassIntervalDaysFlag = v88;

                                                                            if (!v14)
                                                                            {
                                                                              id v93 = 0;
                                                                              v90 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ADTrustChangePassIntervalDays" isRequired:0 defaultValue:0 error:&v93];
                                                                              id v14 = v93;
                                                                              payloadADTrustChangePassIntervalDays = self->_payloadADTrustChangePassIntervalDays;
                                                                              self->_payloadADTrustChangePassIntervalDays = v90;
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __59__CEMNetworkDirectoryServiceDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __59__CEMNetworkDirectoryServiceDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"HostName" withValue:self->_payloadHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"UserName" withValue:self->_payloadUserName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ClientID" withValue:self->_payloadClientID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Description" withValue:self->_payloadDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADOrganizationalUnit" withValue:self->_payloadADOrganizationalUnit isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADMountStyle" withValue:self->_payloadADMountStyle isRequired:0 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADCreateMobileAccountAtLoginFlag" withValue:self->_payloadADCreateMobileAccountAtLoginFlag isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADCreateMobileAccountAtLogin" withValue:self->_payloadADCreateMobileAccountAtLogin isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADWarnUserBeforeCreatingMAFlag" withValue:self->_payloadADWarnUserBeforeCreatingMAFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADWarnUserBeforeCreatingMA" withValue:self->_payloadADWarnUserBeforeCreatingMA isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADForceHomeLocalFlag" withValue:self->_payloadADForceHomeLocalFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADForceHomeLocal" withValue:self->_payloadADForceHomeLocal isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADUseWindowsUNCPathFlag" withValue:self->_payloadADUseWindowsUNCPathFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADUseWindowsUNCPath" withValue:self->_payloadADUseWindowsUNCPath isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADAllowMultiDomainAuthFlag" withValue:self->_payloadADAllowMultiDomainAuthFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADAllowMultiDomainAuth" withValue:self->_payloadADAllowMultiDomainAuth isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADDefaultUserShellFlag" withValue:self->_payloadADDefaultUserShellFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADDefaultUserShell" withValue:self->_payloadADDefaultUserShell isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADMapUIDAttributeFlag" withValue:self->_payloadADMapUIDAttributeFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADMapUIDAttribute" withValue:self->_payloadADMapUIDAttribute isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADMapGIDAttributeFlag" withValue:self->_payloadADMapGIDAttributeFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADMapGIDAttribute" withValue:self->_payloadADMapGIDAttribute isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADMapGGIDAttributeFlag" withValue:self->_payloadADMapGGIDAttributeFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADMapGGIDAttribute" withValue:self->_payloadADMapGGIDAttribute isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADPreferredDCServerFlag" withValue:self->_payloadADPreferredDCServerFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADPreferredDCServer" withValue:self->_payloadADPreferredDCServer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADDomainAdminGroupListFlag" withValue:self->_payloadADDomainAdminGroupListFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"ADDomainAdminGroupList" withValue:self->_payloadADDomainAdminGroupList itemSerializer:&__block_literal_global_135 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADNamespaceFlag" withValue:self->_payloadADNamespaceFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADNamespace" withValue:self->_payloadADNamespace isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADPacketSignFlag" withValue:self->_payloadADPacketSignFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADPacketSign" withValue:self->_payloadADPacketSign isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADPacketEncryptFlag" withValue:self->_payloadADPacketEncryptFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ADPacketEncrypt" withValue:self->_payloadADPacketEncrypt isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADRestrictDDNSFlag" withValue:self->_payloadADRestrictDDNSFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"ADRestrictDDNS" withValue:self->_payloadADRestrictDDNS itemSerializer:&__block_literal_global_137 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ADTrustChangePassIntervalDaysFlag" withValue:self->_payloadADTrustChangePassIntervalDaysFlag isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ADTrustChangePassIntervalDays" withValue:self->_payloadADTrustChangePassIntervalDays isRequired:0 defaultValue:0];
  id v6 = (void *)[v4 copy];

  return v6;
}

id __76__CEMNetworkDirectoryServiceDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __76__CEMNetworkDirectoryServiceDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v84.receiver = self;
  v84.super_class = (Class)CEMNetworkDirectoryServiceDeclaration;
  v4 = [(CEMDeclarationBase *)&v84 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadHostName copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadUserName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadPassword copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadClientID copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadDescription copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadADOrganizationalUnit copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadADMountStyle copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadADCreateMobileAccountAtLoginFlag copy];
  v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadADCreateMobileAccountAtLogin copy];
  v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadADWarnUserBeforeCreatingMAFlag copy];
  v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadADWarnUserBeforeCreatingMA copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadADForceHomeLocalFlag copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadADForceHomeLocal copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadADUseWindowsUNCPathFlag copy];
  v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadADUseWindowsUNCPath copy];
  v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadADAllowMultiDomainAuthFlag copy];
  v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadADAllowMultiDomainAuth copy];
  v38 = (void *)v4[25];
  v4[25] = v37;

  uint64_t v39 = [(NSNumber *)self->_payloadADDefaultUserShellFlag copy];
  v40 = (void *)v4[26];
  v4[26] = v39;

  uint64_t v41 = [(NSString *)self->_payloadADDefaultUserShell copy];
  id v42 = (void *)v4[27];
  v4[27] = v41;

  uint64_t v43 = [(NSNumber *)self->_payloadADMapUIDAttributeFlag copy];
  id v44 = (void *)v4[28];
  v4[28] = v43;

  uint64_t v45 = [(NSString *)self->_payloadADMapUIDAttribute copy];
  id v46 = (void *)v4[29];
  v4[29] = v45;

  uint64_t v47 = [(NSNumber *)self->_payloadADMapGIDAttributeFlag copy];
  id v48 = (void *)v4[30];
  v4[30] = v47;

  uint64_t v49 = [(NSString *)self->_payloadADMapGIDAttribute copy];
  id v50 = (void *)v4[31];
  v4[31] = v49;

  uint64_t v51 = [(NSNumber *)self->_payloadADMapGGIDAttributeFlag copy];
  v52 = (void *)v4[32];
  v4[32] = v51;

  uint64_t v53 = [(NSString *)self->_payloadADMapGGIDAttribute copy];
  v54 = (void *)v4[33];
  v4[33] = v53;

  uint64_t v55 = [(NSNumber *)self->_payloadADPreferredDCServerFlag copy];
  id v56 = (void *)v4[34];
  v4[34] = v55;

  uint64_t v57 = [(NSString *)self->_payloadADPreferredDCServer copy];
  id v58 = (void *)v4[35];
  v4[35] = v57;

  uint64_t v59 = [(NSNumber *)self->_payloadADDomainAdminGroupListFlag copy];
  id v60 = (void *)v4[36];
  v4[36] = v59;

  uint64_t v61 = [(NSArray *)self->_payloadADDomainAdminGroupList copy];
  id v62 = (void *)v4[37];
  v4[37] = v61;

  uint64_t v63 = [(NSNumber *)self->_payloadADNamespaceFlag copy];
  id v64 = (void *)v4[38];
  v4[38] = v63;

  uint64_t v65 = [(NSString *)self->_payloadADNamespace copy];
  id v66 = (void *)v4[39];
  v4[39] = v65;

  uint64_t v67 = [(NSNumber *)self->_payloadADPacketSignFlag copy];
  id v68 = (void *)v4[40];
  v4[40] = v67;

  uint64_t v69 = [(NSString *)self->_payloadADPacketSign copy];
  id v70 = (void *)v4[41];
  v4[41] = v69;

  uint64_t v71 = [(NSNumber *)self->_payloadADPacketEncryptFlag copy];
  id v72 = (void *)v4[42];
  v4[42] = v71;

  uint64_t v73 = [(NSString *)self->_payloadADPacketEncrypt copy];
  id v74 = (void *)v4[43];
  v4[43] = v73;

  uint64_t v75 = [(NSNumber *)self->_payloadADRestrictDDNSFlag copy];
  v76 = (void *)v4[44];
  v4[44] = v75;

  uint64_t v77 = [(NSArray *)self->_payloadADRestrictDDNS copy];
  id v78 = (void *)v4[45];
  v4[45] = v77;

  uint64_t v79 = [(NSNumber *)self->_payloadADTrustChangePassIntervalDaysFlag copy];
  id v80 = (void *)v4[46];
  v4[46] = v79;

  uint64_t v81 = [(NSNumber *)self->_payloadADTrustChangePassIntervalDays copy];
  id v82 = (void *)v4[47];
  v4[47] = v81;

  return v4;
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSString)payloadClientID
{
  return self->_payloadClientID;
}

- (void)setPayloadClientID:(id)a3
{
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (NSString)payloadADOrganizationalUnit
{
  return self->_payloadADOrganizationalUnit;
}

- (void)setPayloadADOrganizationalUnit:(id)a3
{
}

- (NSString)payloadADMountStyle
{
  return self->_payloadADMountStyle;
}

- (void)setPayloadADMountStyle:(id)a3
{
}

- (NSNumber)payloadADCreateMobileAccountAtLoginFlag
{
  return self->_payloadADCreateMobileAccountAtLoginFlag;
}

- (void)setPayloadADCreateMobileAccountAtLoginFlag:(id)a3
{
}

- (NSNumber)payloadADCreateMobileAccountAtLogin
{
  return self->_payloadADCreateMobileAccountAtLogin;
}

- (void)setPayloadADCreateMobileAccountAtLogin:(id)a3
{
}

- (NSNumber)payloadADWarnUserBeforeCreatingMAFlag
{
  return self->_payloadADWarnUserBeforeCreatingMAFlag;
}

- (void)setPayloadADWarnUserBeforeCreatingMAFlag:(id)a3
{
}

- (NSNumber)payloadADWarnUserBeforeCreatingMA
{
  return self->_payloadADWarnUserBeforeCreatingMA;
}

- (void)setPayloadADWarnUserBeforeCreatingMA:(id)a3
{
}

- (NSNumber)payloadADForceHomeLocalFlag
{
  return self->_payloadADForceHomeLocalFlag;
}

- (void)setPayloadADForceHomeLocalFlag:(id)a3
{
}

- (NSNumber)payloadADForceHomeLocal
{
  return self->_payloadADForceHomeLocal;
}

- (void)setPayloadADForceHomeLocal:(id)a3
{
}

- (NSNumber)payloadADUseWindowsUNCPathFlag
{
  return self->_payloadADUseWindowsUNCPathFlag;
}

- (void)setPayloadADUseWindowsUNCPathFlag:(id)a3
{
}

- (NSNumber)payloadADUseWindowsUNCPath
{
  return self->_payloadADUseWindowsUNCPath;
}

- (void)setPayloadADUseWindowsUNCPath:(id)a3
{
}

- (NSNumber)payloadADAllowMultiDomainAuthFlag
{
  return self->_payloadADAllowMultiDomainAuthFlag;
}

- (void)setPayloadADAllowMultiDomainAuthFlag:(id)a3
{
}

- (NSNumber)payloadADAllowMultiDomainAuth
{
  return self->_payloadADAllowMultiDomainAuth;
}

- (void)setPayloadADAllowMultiDomainAuth:(id)a3
{
}

- (NSNumber)payloadADDefaultUserShellFlag
{
  return self->_payloadADDefaultUserShellFlag;
}

- (void)setPayloadADDefaultUserShellFlag:(id)a3
{
}

- (NSString)payloadADDefaultUserShell
{
  return self->_payloadADDefaultUserShell;
}

- (void)setPayloadADDefaultUserShell:(id)a3
{
}

- (NSNumber)payloadADMapUIDAttributeFlag
{
  return self->_payloadADMapUIDAttributeFlag;
}

- (void)setPayloadADMapUIDAttributeFlag:(id)a3
{
}

- (NSString)payloadADMapUIDAttribute
{
  return self->_payloadADMapUIDAttribute;
}

- (void)setPayloadADMapUIDAttribute:(id)a3
{
}

- (NSNumber)payloadADMapGIDAttributeFlag
{
  return self->_payloadADMapGIDAttributeFlag;
}

- (void)setPayloadADMapGIDAttributeFlag:(id)a3
{
}

- (NSString)payloadADMapGIDAttribute
{
  return self->_payloadADMapGIDAttribute;
}

- (void)setPayloadADMapGIDAttribute:(id)a3
{
}

- (NSNumber)payloadADMapGGIDAttributeFlag
{
  return self->_payloadADMapGGIDAttributeFlag;
}

- (void)setPayloadADMapGGIDAttributeFlag:(id)a3
{
}

- (NSString)payloadADMapGGIDAttribute
{
  return self->_payloadADMapGGIDAttribute;
}

- (void)setPayloadADMapGGIDAttribute:(id)a3
{
}

- (NSNumber)payloadADPreferredDCServerFlag
{
  return self->_payloadADPreferredDCServerFlag;
}

- (void)setPayloadADPreferredDCServerFlag:(id)a3
{
}

- (NSString)payloadADPreferredDCServer
{
  return self->_payloadADPreferredDCServer;
}

- (void)setPayloadADPreferredDCServer:(id)a3
{
}

- (NSNumber)payloadADDomainAdminGroupListFlag
{
  return self->_payloadADDomainAdminGroupListFlag;
}

- (void)setPayloadADDomainAdminGroupListFlag:(id)a3
{
}

- (NSArray)payloadADDomainAdminGroupList
{
  return self->_payloadADDomainAdminGroupList;
}

- (void)setPayloadADDomainAdminGroupList:(id)a3
{
}

- (NSNumber)payloadADNamespaceFlag
{
  return self->_payloadADNamespaceFlag;
}

- (void)setPayloadADNamespaceFlag:(id)a3
{
}

- (NSString)payloadADNamespace
{
  return self->_payloadADNamespace;
}

- (void)setPayloadADNamespace:(id)a3
{
}

- (NSNumber)payloadADPacketSignFlag
{
  return self->_payloadADPacketSignFlag;
}

- (void)setPayloadADPacketSignFlag:(id)a3
{
}

- (NSString)payloadADPacketSign
{
  return self->_payloadADPacketSign;
}

- (void)setPayloadADPacketSign:(id)a3
{
}

- (NSNumber)payloadADPacketEncryptFlag
{
  return self->_payloadADPacketEncryptFlag;
}

- (void)setPayloadADPacketEncryptFlag:(id)a3
{
}

- (NSString)payloadADPacketEncrypt
{
  return self->_payloadADPacketEncrypt;
}

- (void)setPayloadADPacketEncrypt:(id)a3
{
}

- (NSNumber)payloadADRestrictDDNSFlag
{
  return self->_payloadADRestrictDDNSFlag;
}

- (void)setPayloadADRestrictDDNSFlag:(id)a3
{
}

- (NSArray)payloadADRestrictDDNS
{
  return self->_payloadADRestrictDDNS;
}

- (void)setPayloadADRestrictDDNS:(id)a3
{
}

- (NSNumber)payloadADTrustChangePassIntervalDaysFlag
{
  return self->_payloadADTrustChangePassIntervalDaysFlag;
}

- (void)setPayloadADTrustChangePassIntervalDaysFlag:(id)a3
{
}

- (NSNumber)payloadADTrustChangePassIntervalDays
{
  return self->_payloadADTrustChangePassIntervalDays;
}

- (void)setPayloadADTrustChangePassIntervalDays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadADTrustChangePassIntervalDays, 0);
  objc_storeStrong((id *)&self->_payloadADTrustChangePassIntervalDaysFlag, 0);
  objc_storeStrong((id *)&self->_payloadADRestrictDDNS, 0);
  objc_storeStrong((id *)&self->_payloadADRestrictDDNSFlag, 0);
  objc_storeStrong((id *)&self->_payloadADPacketEncrypt, 0);
  objc_storeStrong((id *)&self->_payloadADPacketEncryptFlag, 0);
  objc_storeStrong((id *)&self->_payloadADPacketSign, 0);
  objc_storeStrong((id *)&self->_payloadADPacketSignFlag, 0);
  objc_storeStrong((id *)&self->_payloadADNamespace, 0);
  objc_storeStrong((id *)&self->_payloadADNamespaceFlag, 0);
  objc_storeStrong((id *)&self->_payloadADDomainAdminGroupList, 0);
  objc_storeStrong((id *)&self->_payloadADDomainAdminGroupListFlag, 0);
  objc_storeStrong((id *)&self->_payloadADPreferredDCServer, 0);
  objc_storeStrong((id *)&self->_payloadADPreferredDCServerFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMapGGIDAttribute, 0);
  objc_storeStrong((id *)&self->_payloadADMapGGIDAttributeFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMapGIDAttribute, 0);
  objc_storeStrong((id *)&self->_payloadADMapGIDAttributeFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMapUIDAttribute, 0);
  objc_storeStrong((id *)&self->_payloadADMapUIDAttributeFlag, 0);
  objc_storeStrong((id *)&self->_payloadADDefaultUserShell, 0);
  objc_storeStrong((id *)&self->_payloadADDefaultUserShellFlag, 0);
  objc_storeStrong((id *)&self->_payloadADAllowMultiDomainAuth, 0);
  objc_storeStrong((id *)&self->_payloadADAllowMultiDomainAuthFlag, 0);
  objc_storeStrong((id *)&self->_payloadADUseWindowsUNCPath, 0);
  objc_storeStrong((id *)&self->_payloadADUseWindowsUNCPathFlag, 0);
  objc_storeStrong((id *)&self->_payloadADForceHomeLocal, 0);
  objc_storeStrong((id *)&self->_payloadADForceHomeLocalFlag, 0);
  objc_storeStrong((id *)&self->_payloadADWarnUserBeforeCreatingMA, 0);
  objc_storeStrong((id *)&self->_payloadADWarnUserBeforeCreatingMAFlag, 0);
  objc_storeStrong((id *)&self->_payloadADCreateMobileAccountAtLogin, 0);
  objc_storeStrong((id *)&self->_payloadADCreateMobileAccountAtLoginFlag, 0);
  objc_storeStrong((id *)&self->_payloadADMountStyle, 0);
  objc_storeStrong((id *)&self->_payloadADOrganizationalUnit, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadClientID, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);

  objc_storeStrong((id *)&self->_payloadHostName, 0);
}

@end