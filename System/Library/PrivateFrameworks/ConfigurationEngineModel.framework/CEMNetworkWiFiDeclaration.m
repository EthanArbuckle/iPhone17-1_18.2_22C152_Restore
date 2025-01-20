@interface CEMNetworkWiFiDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAutoJoin:(id)a4 withSSIDSTR:(id)a5 withHIDDENNETWORK:(id)a6 withProxyType:(id)a7 withEncryptionType:(id)a8 withPassword:(id)a9 withPayloadCertificateUUID:(id)a10 withEAPClientConfiguration:(id)a11 withDisplayedOperatorName:(id)a12 withDomainName:(id)a13 withRoamingConsortiumOIs:(id)a14 withServiceProviderRoamingEnabled:(id)a15 withIsHotspot:(id)a16 withHESSID:(id)a17 withNAIRealmNames:(id)a18 withMCCAndMNCs:(id)a19 withCaptiveBypass:(id)a20 withQoSMarkingPolicy:(id)a21 withInterface:(id)a22 withSetupModes:(id)a23 withPriority:(id)a24 withEnableIPv6:(id)a25 withTLSCertificateRequired:(id)a26 withProxyServer:(id)a27 withProxyServerPort:(id)a28 withProxyUsername:(id)a29 withProxyPassword:(id)a30 withProxyPACURL:(id)a31 withProxyPACFallbackAllowed:(id)a32;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMNetworkWiFiDeclaration_EAPClientConfiguration)payloadEAPClientConfiguration;
- (CEMNetworkWiFiDeclaration_QoSMarkingPolicy)payloadQoSMarkingPolicy;
- (NSArray)payloadMCCAndMNCs;
- (NSArray)payloadNAIRealmNames;
- (NSArray)payloadRoamingConsortiumOIs;
- (NSArray)payloadSetupModes;
- (NSNumber)payloadAutoJoin;
- (NSNumber)payloadCaptiveBypass;
- (NSNumber)payloadEnableIPv6;
- (NSNumber)payloadHIDDENNETWORK;
- (NSNumber)payloadIsHotspot;
- (NSNumber)payloadPriority;
- (NSNumber)payloadProxyPACFallbackAllowed;
- (NSNumber)payloadProxyServerPort;
- (NSNumber)payloadServiceProviderRoamingEnabled;
- (NSNumber)payloadTLSCertificateRequired;
- (NSString)payloadDisplayedOperatorName;
- (NSString)payloadDomainName;
- (NSString)payloadEncryptionType;
- (NSString)payloadHESSID;
- (NSString)payloadInterface;
- (NSString)payloadPassword;
- (NSString)payloadPayloadCertificateUUID;
- (NSString)payloadProxyPACURL;
- (NSString)payloadProxyPassword;
- (NSString)payloadProxyServer;
- (NSString)payloadProxyType;
- (NSString)payloadProxyUsername;
- (NSString)payloadSSIDSTR;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAutoJoin:(id)a3;
- (void)setPayloadCaptiveBypass:(id)a3;
- (void)setPayloadDisplayedOperatorName:(id)a3;
- (void)setPayloadDomainName:(id)a3;
- (void)setPayloadEAPClientConfiguration:(id)a3;
- (void)setPayloadEnableIPv6:(id)a3;
- (void)setPayloadEncryptionType:(id)a3;
- (void)setPayloadHESSID:(id)a3;
- (void)setPayloadHIDDENNETWORK:(id)a3;
- (void)setPayloadInterface:(id)a3;
- (void)setPayloadIsHotspot:(id)a3;
- (void)setPayloadMCCAndMNCs:(id)a3;
- (void)setPayloadNAIRealmNames:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadPayloadCertificateUUID:(id)a3;
- (void)setPayloadPriority:(id)a3;
- (void)setPayloadProxyPACFallbackAllowed:(id)a3;
- (void)setPayloadProxyPACURL:(id)a3;
- (void)setPayloadProxyPassword:(id)a3;
- (void)setPayloadProxyServer:(id)a3;
- (void)setPayloadProxyServerPort:(id)a3;
- (void)setPayloadProxyType:(id)a3;
- (void)setPayloadProxyUsername:(id)a3;
- (void)setPayloadQoSMarkingPolicy:(id)a3;
- (void)setPayloadRoamingConsortiumOIs:(id)a3;
- (void)setPayloadSSIDSTR:(id)a3;
- (void)setPayloadServiceProviderRoamingEnabled:(id)a3;
- (void)setPayloadSetupModes:(id)a3;
- (void)setPayloadTLSCertificateRequired:(id)a3;
@end

@implementation CEMNetworkWiFiDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.wifi";
}

+ (id)profileType
{
  return @"com.apple.wifi.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[29] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AutoJoin";
  v6[1] = @"SSID_STR";
  v6[2] = @"HIDDEN_NETWORK";
  v6[3] = @"ProxyType";
  v6[4] = @"EncryptionType";
  v6[5] = @"Password";
  v6[6] = @"PayloadCertificateUUID";
  v6[7] = @"EAPClientConfiguration";
  v6[8] = @"DisplayedOperatorName";
  v6[9] = @"DomainName";
  v6[10] = @"RoamingConsortiumOIs";
  v6[11] = @"ServiceProviderRoamingEnabled";
  v6[12] = @"IsHotspot";
  v6[13] = @"HESSID";
  v6[14] = @"NAIRealmNames";
  v6[15] = @"MCCAndMNCs";
  v6[16] = @"CaptiveBypass";
  v6[17] = @"QoSMarkingPolicy";
  v6[18] = @"Interface";
  v6[19] = @"SetupModes";
  v6[20] = @"Priority";
  v6[21] = @"EnableIPv6";
  v6[22] = @"TLSCertificateRequired";
  v6[23] = @"ProxyServer";
  v6[24] = @"ProxyServerPort";
  v6[25] = @"ProxyUsername";
  v6[26] = @"ProxyPassword";
  v6[27] = @"ProxyPACURL";
  v6[28] = @"ProxyPACFallbackAllowed";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:29];
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

+ (id)buildWithIdentifier:(id)a3 withAutoJoin:(id)a4 withSSIDSTR:(id)a5 withHIDDENNETWORK:(id)a6 withProxyType:(id)a7 withEncryptionType:(id)a8 withPassword:(id)a9 withPayloadCertificateUUID:(id)a10 withEAPClientConfiguration:(id)a11 withDisplayedOperatorName:(id)a12 withDomainName:(id)a13 withRoamingConsortiumOIs:(id)a14 withServiceProviderRoamingEnabled:(id)a15 withIsHotspot:(id)a16 withHESSID:(id)a17 withNAIRealmNames:(id)a18 withMCCAndMNCs:(id)a19 withCaptiveBypass:(id)a20 withQoSMarkingPolicy:(id)a21 withInterface:(id)a22 withSetupModes:(id)a23 withPriority:(id)a24 withEnableIPv6:(id)a25 withTLSCertificateRequired:(id)a26 withProxyServer:(id)a27 withProxyServerPort:(id)a28 withProxyUsername:(id)a29 withProxyPassword:(id)a30 withProxyPACURL:(id)a31 withProxyPACFallbackAllowed:(id)a32
{
  id v32 = a3;
  id v82 = a32;
  id v81 = a31;
  id v80 = a30;
  id v79 = a29;
  id v78 = a28;
  id v33 = a27;
  id v34 = a26;
  id v77 = a25;
  id v76 = a24;
  id v75 = a23;
  id v74 = a22;
  id v73 = a21;
  id v72 = a20;
  id v71 = a19;
  id v70 = a18;
  id v69 = a17;
  id v68 = a16;
  id v67 = a15;
  id v66 = a14;
  id v64 = a13;
  id v60 = a12;
  id v58 = a11;
  id v56 = a10;
  id v57 = a9;
  v35 = (__CFString *)a8;
  v36 = (__CFString *)a7;
  id v37 = a6;
  id v38 = a5;
  id v39 = a4;
  v40 = objc_opt_new();
  [v40 setDeclarationType:@"com.apple.configuration.network.wifi"];
  if (v32)
  {
    [v40 setDeclarationIdentifier:v32];
  }
  else
  {
    v41 = [MEMORY[0x263F08C38] UUID];
    v42 = [v41 UUIDString];
    [v40 setDeclarationIdentifier:v42];

    id v32 = 0;
  }
  v43 = (void *)MEMORY[0x263EFFA80];
  if (v39) {
    id v44 = v39;
  }
  else {
    id v44 = (id)MEMORY[0x263EFFA80];
  }
  [v40 setPayloadAutoJoin:v44];

  [v40 setPayloadSSIDSTR:v38];
  if (v37) {
    id v45 = v37;
  }
  else {
    id v45 = v43;
  }
  [v40 setPayloadHIDDENNETWORK:v45];

  if (v36) {
    v46 = v36;
  }
  else {
    v46 = @"None";
  }
  [v40 setPayloadProxyType:v46];

  if (v35) {
    v47 = v35;
  }
  else {
    v47 = @"Any";
  }
  [v40 setPayloadEncryptionType:v47];

  [v40 setPayloadPassword:v57];
  [v40 setPayloadPayloadCertificateUUID:v56];

  [v40 setPayloadEAPClientConfiguration:v58];
  [v40 setPayloadDisplayedOperatorName:v60];

  [v40 setPayloadDomainName:v64];
  [v40 setPayloadRoamingConsortiumOIs:v66];

  if (v67) {
    id v48 = v67;
  }
  else {
    id v48 = v43;
  }
  [v40 setPayloadServiceProviderRoamingEnabled:v48];

  if (v68) {
    id v49 = v68;
  }
  else {
    id v49 = v43;
  }
  [v40 setPayloadIsHotspot:v49];

  [v40 setPayloadHESSID:v69];
  [v40 setPayloadNAIRealmNames:v70];

  [v40 setPayloadMCCAndMNCs:v71];
  if (v72) {
    id v50 = v72;
  }
  else {
    id v50 = v43;
  }
  [v40 setPayloadCaptiveBypass:v50];

  [v40 setPayloadQoSMarkingPolicy:v73];
  [v40 setPayloadInterface:v74];

  [v40 setPayloadSetupModes:v75];
  if (v76) {
    v51 = v76;
  }
  else {
    v51 = &unk_26C8948C8;
  }
  [v40 setPayloadPriority:v51];

  if (v77) {
    id v52 = v77;
  }
  else {
    id v52 = (id)MEMORY[0x263EFFA88];
  }
  [v40 setPayloadEnableIPv6:v52];

  if (v34) {
    id v53 = v34;
  }
  else {
    id v53 = v43;
  }
  [v40 setPayloadTLSCertificateRequired:v53];

  [v40 setPayloadProxyServer:v33];
  [v40 setPayloadProxyServerPort:v78];

  [v40 setPayloadProxyUsername:v79];
  [v40 setPayloadProxyPassword:v80];

  [v40 setPayloadProxyPACURL:v81];
  if (v82) {
    id v54 = v82;
  }
  else {
    id v54 = v43;
  }
  [v40 setPayloadProxyPACFallbackAllowed:v54];

  [v40 updateServerHash];

  return v40;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.wifi"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkWiFiDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v101 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutoJoin" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v101];
  id v14 = v101;
  payloadAutoJoin = self->_payloadAutoJoin;
  self->_payloadAutoJoin = v13;

  if (!v14)
  {
    id v100 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SSID_STR" isRequired:0 defaultValue:0 error:&v100];
    id v14 = v100;
    payloadSSIDSTR = self->_payloadSSIDSTR;
    self->_payloadSSIDSTR = v16;

    if (!v14)
    {
      id v99 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"HIDDEN_NETWORK" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v99];
      id v14 = v99;
      payloadHIDDENNETWORK = self->_payloadHIDDENNETWORK;
      self->_payloadHIDDENNETWORK = v18;

      if (!v14)
      {
        id v98 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyType" isRequired:0 defaultValue:@"None" error:&v98];
        id v14 = v98;
        payloadProxyType = self->_payloadProxyType;
        self->_payloadProxyType = v20;

        if (!v14)
        {
          id v97 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EncryptionType" isRequired:0 defaultValue:@"Any" error:&v97];
          id v14 = v97;
          payloadEncryptionType = self->_payloadEncryptionType;
          self->_payloadEncryptionType = v22;

          if (!v14)
          {
            id v96 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v96];
            id v14 = v96;
            payloadPassword = self->_payloadPassword;
            self->_payloadPassword = v24;

            if (!v14)
            {
              id v95 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PayloadCertificateUUID" isRequired:0 defaultValue:0 error:&v95];
              id v14 = v95;
              payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
              self->_payloadPayloadCertificateUUID = v26;

              if (!v14)
              {
                id v94 = 0;
                v28 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"EAPClientConfiguration" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v94];
                id v14 = v94;
                payloadEAPClientConfiguration = self->_payloadEAPClientConfiguration;
                self->_payloadEAPClientConfiguration = v28;

                if (!v14)
                {
                  id v93 = 0;
                  v30 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DisplayedOperatorName" isRequired:0 defaultValue:0 error:&v93];
                  id v14 = v93;
                  payloadDisplayedOperatorName = self->_payloadDisplayedOperatorName;
                  self->_payloadDisplayedOperatorName = v30;

                  if (!v14)
                  {
                    id v92 = 0;
                    id v32 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DomainName" isRequired:0 defaultValue:0 error:&v92];
                    id v14 = v92;
                    payloadDomainName = self->_payloadDomainName;
                    self->_payloadDomainName = v32;

                    if (!v14)
                    {
                      id v91 = 0;
                      id v34 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"RoamingConsortiumOIs" validator:&__block_literal_global_25 isRequired:0 defaultValue:0 error:&v91];
                      id v14 = v91;
                      payloadRoamingConsortiumOIs = self->_payloadRoamingConsortiumOIs;
                      self->_payloadRoamingConsortiumOIs = v34;

                      if (!v14)
                      {
                        id v90 = 0;
                        v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ServiceProviderRoamingEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v90];
                        id v14 = v90;
                        payloadServiceProviderRoamingEnabled = self->_payloadServiceProviderRoamingEnabled;
                        self->_payloadServiceProviderRoamingEnabled = v36;

                        if (!v14)
                        {
                          id v89 = 0;
                          id v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsHotspot" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v89];
                          id v14 = v89;
                          payloadIsHotspot = self->_payloadIsHotspot;
                          self->_payloadIsHotspot = v38;

                          if (!v14)
                          {
                            id v88 = 0;
                            v40 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HESSID" isRequired:0 defaultValue:0 error:&v88];
                            id v14 = v88;
                            payloadHESSID = self->_payloadHESSID;
                            self->_payloadHESSID = v40;

                            if (!v14)
                            {
                              id v87 = 0;
                              v42 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"NAIRealmNames" validator:&__block_literal_global_124 isRequired:0 defaultValue:0 error:&v87];
                              id v14 = v87;
                              payloadNAIRealmNames = self->_payloadNAIRealmNames;
                              self->_payloadNAIRealmNames = v42;

                              if (!v14)
                              {
                                id v86 = 0;
                                id v44 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"MCCAndMNCs" validator:&__block_literal_global_126 isRequired:0 defaultValue:0 error:&v86];
                                id v14 = v86;
                                payloadMCCAndMNCs = self->_payloadMCCAndMNCs;
                                self->_payloadMCCAndMNCs = v44;

                                if (!v14)
                                {
                                  id v85 = 0;
                                  v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"CaptiveBypass" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v85];
                                  id v14 = v85;
                                  payloadCaptiveBypass = self->_payloadCaptiveBypass;
                                  self->_payloadCaptiveBypass = v46;

                                  if (!v14)
                                  {
                                    id v84 = 0;
                                    id v48 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"QoSMarkingPolicy" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v84];
                                    id v14 = v84;
                                    payloadQoSMarkingPolicy = self->_payloadQoSMarkingPolicy;
                                    self->_payloadQoSMarkingPolicy = v48;

                                    if (!v14)
                                    {
                                      id v83 = 0;
                                      id v50 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Interface" isRequired:0 defaultValue:0 error:&v83];
                                      id v14 = v83;
                                      payloadInterface = self->_payloadInterface;
                                      self->_payloadInterface = v50;

                                      if (!v14)
                                      {
                                        id v82 = 0;
                                        id v52 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SetupModes" validator:&__block_literal_global_129 isRequired:0 defaultValue:0 error:&v82];
                                        id v14 = v82;
                                        payloadSetupModes = self->_payloadSetupModes;
                                        self->_payloadSetupModes = v52;

                                        if (!v14)
                                        {
                                          id v81 = 0;
                                          id v54 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Priority" isRequired:0 defaultValue:&unk_26C8948C8 error:&v81];
                                          id v14 = v81;
                                          payloadPriority = self->_payloadPriority;
                                          self->_payloadPriority = v54;

                                          if (!v14)
                                          {
                                            id v80 = 0;
                                            id v56 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableIPv6" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v80];
                                            id v14 = v80;
                                            payloadEnableIPid v6 = self->_payloadEnableIPv6;
                                            self->_payloadEnableIPid v6 = v56;

                                            if (!v14)
                                            {
                                              id v79 = 0;
                                              id v58 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"TLSCertificateRequired" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v79];
                                              id v14 = v79;
                                              payloadTLSCertificateRequired = self->_payloadTLSCertificateRequired;
                                              self->_payloadTLSCertificateRequired = v58;

                                              if (!v14)
                                              {
                                                id v78 = 0;
                                                id v60 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyServer" isRequired:0 defaultValue:0 error:&v78];
                                                id v14 = v78;
                                                payloadProxyServer = self->_payloadProxyServer;
                                                self->_payloadProxyServer = v60;

                                                if (!v14)
                                                {
                                                  id v77 = 0;
                                                  v62 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ProxyServerPort" isRequired:0 defaultValue:0 error:&v77];
                                                  id v14 = v77;
                                                  payloadProxyServerPort = self->_payloadProxyServerPort;
                                                  self->_payloadProxyServerPort = v62;

                                                  if (!v14)
                                                  {
                                                    id v76 = 0;
                                                    id v64 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyUsername" isRequired:0 defaultValue:0 error:&v76];
                                                    id v14 = v76;
                                                    payloadProxyUsername = self->_payloadProxyUsername;
                                                    self->_payloadProxyUsername = v64;

                                                    if (!v14)
                                                    {
                                                      id v75 = 0;
                                                      id v66 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyPassword" isRequired:0 defaultValue:0 error:&v75];
                                                      id v14 = v75;
                                                      payloadProxyPassword = self->_payloadProxyPassword;
                                                      self->_payloadProxyPassword = v66;

                                                      if (!v14)
                                                      {
                                                        id v74 = 0;
                                                        id v68 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyPACURL" isRequired:0 defaultValue:0 error:&v74];
                                                        id v14 = v74;
                                                        payloadProxyPACURL = self->_payloadProxyPACURL;
                                                        self->_payloadProxyPACURL = v68;

                                                        if (!v14)
                                                        {
                                                          id v73 = 0;
                                                          id v70 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ProxyPACFallbackAllowed" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v73];
                                                          id v14 = v73;
                                                          payloadProxyPACFallbackAllowed = self->_payloadProxyPACFallbackAllowed;
                                                          self->_payloadProxyPACFallbackAllowed = v70;
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

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __47__CEMNetworkWiFiDeclaration_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AutoJoin" withValue:self->_payloadAutoJoin isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SSID_STR" withValue:self->_payloadSSIDSTR isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"HIDDEN_NETWORK" withValue:self->_payloadHIDDENNETWORK isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProxyType" withValue:self->_payloadProxyType isRequired:0 defaultValue:@"None"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"EncryptionType" withValue:self->_payloadEncryptionType isRequired:0 defaultValue:@"Any"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"PayloadCertificateUUID" withValue:self->_payloadPayloadCertificateUUID isRequired:0 defaultValue:0];
  payloadEAPClientConfiguration = self->_payloadEAPClientConfiguration;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_2642C87E8;
  id v8 = v4;
  id v19 = v8;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"EAPClientConfiguration" withValue:payloadEAPClientConfiguration dictSerializer:v18 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DisplayedOperatorName" withValue:self->_payloadDisplayedOperatorName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DomainName" withValue:self->_payloadDomainName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"RoamingConsortiumOIs" withValue:self->_payloadRoamingConsortiumOIs itemSerializer:&__block_literal_global_134 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"ServiceProviderRoamingEnabled" withValue:self->_payloadServiceProviderRoamingEnabled isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"IsHotspot" withValue:self->_payloadIsHotspot isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"HESSID" withValue:self->_payloadHESSID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"NAIRealmNames" withValue:self->_payloadNAIRealmNames itemSerializer:&__block_literal_global_136 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"MCCAndMNCs" withValue:self->_payloadMCCAndMNCs itemSerializer:&__block_literal_global_138_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"CaptiveBypass" withValue:self->_payloadCaptiveBypass isRequired:0 defaultValue:v6];
  payloadQoSMarkingPolicy = self->_payloadQoSMarkingPolicy;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_5;
  v16 = &unk_2642C87E8;
  id v17 = v8;
  id v10 = v8;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"QoSMarkingPolicy" withValue:payloadQoSMarkingPolicy dictSerializer:&v13 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5, @"Interface", self->_payloadInterface, 0, 0, v13, v14, v15, v16 withKey withValue isRequired defaultValue];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"SetupModes" withValue:self->_payloadSetupModes itemSerializer:&__block_literal_global_140_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"Priority" withValue:self->_payloadPriority isRequired:0 defaultValue:&unk_26C8948C8];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"EnableIPv6" withValue:self->_payloadEnableIPv6 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"TLSCertificateRequired" withValue:self->_payloadTLSCertificateRequired isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProxyServer" withValue:self->_payloadProxyServer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"ProxyServerPort" withValue:self->_payloadProxyServerPort isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProxyUsername" withValue:self->_payloadProxyUsername isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProxyPassword" withValue:self->_payloadProxyPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProxyPACURL" withValue:self->_payloadProxyPACURL isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"ProxyPACFallbackAllowed" withValue:self->_payloadProxyPACFallbackAllowed isRequired:0 defaultValue:v6];
  v11 = (void *)[v5 copy];

  return v11;
}

uint64_t __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __64__CEMNetworkWiFiDeclaration_serializePayloadWithAssetProviders___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v64.receiver = self;
  v64.super_class = (Class)CEMNetworkWiFiDeclaration;
  id v4 = [(CEMDeclarationBase *)&v64 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAutoJoin copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadSSIDSTR copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadHIDDENNETWORK copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadProxyType copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadEncryptionType copy];
  uint64_t v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadPassword copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadPayloadCertificateUUID copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(CEMNetworkWiFiDeclaration_EAPClientConfiguration *)self->_payloadEAPClientConfiguration copy];
  v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSString *)self->_payloadDisplayedOperatorName copy];
  v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSString *)self->_payloadDomainName copy];
  v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSArray *)self->_payloadRoamingConsortiumOIs copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadServiceProviderRoamingEnabled copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadIsHotspot copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSString *)self->_payloadHESSID copy];
  id v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSArray *)self->_payloadNAIRealmNames copy];
  id v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSArray *)self->_payloadMCCAndMNCs copy];
  v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadCaptiveBypass copy];
  id v38 = (void *)v4[25];
  v4[25] = v37;

  uint64_t v39 = [(CEMNetworkWiFiDeclaration_QoSMarkingPolicy *)self->_payloadQoSMarkingPolicy copy];
  v40 = (void *)v4[26];
  v4[26] = v39;

  uint64_t v41 = [(NSString *)self->_payloadInterface copy];
  v42 = (void *)v4[27];
  v4[27] = v41;

  uint64_t v43 = [(NSArray *)self->_payloadSetupModes copy];
  id v44 = (void *)v4[28];
  v4[28] = v43;

  uint64_t v45 = [(NSNumber *)self->_payloadPriority copy];
  v46 = (void *)v4[29];
  v4[29] = v45;

  uint64_t v47 = [(NSNumber *)self->_payloadEnableIPv6 copy];
  id v48 = (void *)v4[30];
  v4[30] = v47;

  uint64_t v49 = [(NSNumber *)self->_payloadTLSCertificateRequired copy];
  id v50 = (void *)v4[31];
  v4[31] = v49;

  uint64_t v51 = [(NSString *)self->_payloadProxyServer copy];
  id v52 = (void *)v4[32];
  v4[32] = v51;

  uint64_t v53 = [(NSNumber *)self->_payloadProxyServerPort copy];
  id v54 = (void *)v4[33];
  v4[33] = v53;

  uint64_t v55 = [(NSString *)self->_payloadProxyUsername copy];
  id v56 = (void *)v4[34];
  v4[34] = v55;

  uint64_t v57 = [(NSString *)self->_payloadProxyPassword copy];
  id v58 = (void *)v4[35];
  v4[35] = v57;

  uint64_t v59 = [(NSString *)self->_payloadProxyPACURL copy];
  id v60 = (void *)v4[36];
  v4[36] = v59;

  uint64_t v61 = [(NSNumber *)self->_payloadProxyPACFallbackAllowed copy];
  v62 = (void *)v4[37];
  v4[37] = v61;

  return v4;
}

- (NSNumber)payloadAutoJoin
{
  return self->_payloadAutoJoin;
}

- (void)setPayloadAutoJoin:(id)a3
{
}

- (NSString)payloadSSIDSTR
{
  return self->_payloadSSIDSTR;
}

- (void)setPayloadSSIDSTR:(id)a3
{
}

- (NSNumber)payloadHIDDENNETWORK
{
  return self->_payloadHIDDENNETWORK;
}

- (void)setPayloadHIDDENNETWORK:(id)a3
{
}

- (NSString)payloadProxyType
{
  return self->_payloadProxyType;
}

- (void)setPayloadProxyType:(id)a3
{
}

- (NSString)payloadEncryptionType
{
  return self->_payloadEncryptionType;
}

- (void)setPayloadEncryptionType:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
}

- (CEMNetworkWiFiDeclaration_EAPClientConfiguration)payloadEAPClientConfiguration
{
  return self->_payloadEAPClientConfiguration;
}

- (void)setPayloadEAPClientConfiguration:(id)a3
{
}

- (NSString)payloadDisplayedOperatorName
{
  return self->_payloadDisplayedOperatorName;
}

- (void)setPayloadDisplayedOperatorName:(id)a3
{
}

- (NSString)payloadDomainName
{
  return self->_payloadDomainName;
}

- (void)setPayloadDomainName:(id)a3
{
}

- (NSArray)payloadRoamingConsortiumOIs
{
  return self->_payloadRoamingConsortiumOIs;
}

- (void)setPayloadRoamingConsortiumOIs:(id)a3
{
}

- (NSNumber)payloadServiceProviderRoamingEnabled
{
  return self->_payloadServiceProviderRoamingEnabled;
}

- (void)setPayloadServiceProviderRoamingEnabled:(id)a3
{
}

- (NSNumber)payloadIsHotspot
{
  return self->_payloadIsHotspot;
}

- (void)setPayloadIsHotspot:(id)a3
{
}

- (NSString)payloadHESSID
{
  return self->_payloadHESSID;
}

- (void)setPayloadHESSID:(id)a3
{
}

- (NSArray)payloadNAIRealmNames
{
  return self->_payloadNAIRealmNames;
}

- (void)setPayloadNAIRealmNames:(id)a3
{
}

- (NSArray)payloadMCCAndMNCs
{
  return self->_payloadMCCAndMNCs;
}

- (void)setPayloadMCCAndMNCs:(id)a3
{
}

- (NSNumber)payloadCaptiveBypass
{
  return self->_payloadCaptiveBypass;
}

- (void)setPayloadCaptiveBypass:(id)a3
{
}

- (CEMNetworkWiFiDeclaration_QoSMarkingPolicy)payloadQoSMarkingPolicy
{
  return self->_payloadQoSMarkingPolicy;
}

- (void)setPayloadQoSMarkingPolicy:(id)a3
{
}

- (NSString)payloadInterface
{
  return self->_payloadInterface;
}

- (void)setPayloadInterface:(id)a3
{
}

- (NSArray)payloadSetupModes
{
  return self->_payloadSetupModes;
}

- (void)setPayloadSetupModes:(id)a3
{
}

- (NSNumber)payloadPriority
{
  return self->_payloadPriority;
}

- (void)setPayloadPriority:(id)a3
{
}

- (NSNumber)payloadEnableIPv6
{
  return self->_payloadEnableIPv6;
}

- (void)setPayloadEnableIPv6:(id)a3
{
}

- (NSNumber)payloadTLSCertificateRequired
{
  return self->_payloadTLSCertificateRequired;
}

- (void)setPayloadTLSCertificateRequired:(id)a3
{
}

- (NSString)payloadProxyServer
{
  return self->_payloadProxyServer;
}

- (void)setPayloadProxyServer:(id)a3
{
}

- (NSNumber)payloadProxyServerPort
{
  return self->_payloadProxyServerPort;
}

- (void)setPayloadProxyServerPort:(id)a3
{
}

- (NSString)payloadProxyUsername
{
  return self->_payloadProxyUsername;
}

- (void)setPayloadProxyUsername:(id)a3
{
}

- (NSString)payloadProxyPassword
{
  return self->_payloadProxyPassword;
}

- (void)setPayloadProxyPassword:(id)a3
{
}

- (NSString)payloadProxyPACURL
{
  return self->_payloadProxyPACURL;
}

- (void)setPayloadProxyPACURL:(id)a3
{
}

- (NSNumber)payloadProxyPACFallbackAllowed
{
  return self->_payloadProxyPACFallbackAllowed;
}

- (void)setPayloadProxyPACFallbackAllowed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProxyPACFallbackAllowed, 0);
  objc_storeStrong((id *)&self->_payloadProxyPACURL, 0);
  objc_storeStrong((id *)&self->_payloadProxyPassword, 0);
  objc_storeStrong((id *)&self->_payloadProxyUsername, 0);
  objc_storeStrong((id *)&self->_payloadProxyServerPort, 0);
  objc_storeStrong((id *)&self->_payloadProxyServer, 0);
  objc_storeStrong((id *)&self->_payloadTLSCertificateRequired, 0);
  objc_storeStrong((id *)&self->_payloadEnableIPv6, 0);
  objc_storeStrong((id *)&self->_payloadPriority, 0);
  objc_storeStrong((id *)&self->_payloadSetupModes, 0);
  objc_storeStrong((id *)&self->_payloadInterface, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingPolicy, 0);
  objc_storeStrong((id *)&self->_payloadCaptiveBypass, 0);
  objc_storeStrong((id *)&self->_payloadMCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_payloadNAIRealmNames, 0);
  objc_storeStrong((id *)&self->_payloadHESSID, 0);
  objc_storeStrong((id *)&self->_payloadIsHotspot, 0);
  objc_storeStrong((id *)&self->_payloadServiceProviderRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_payloadRoamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_payloadDomainName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayedOperatorName, 0);
  objc_storeStrong((id *)&self->_payloadEAPClientConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadEncryptionType, 0);
  objc_storeStrong((id *)&self->_payloadProxyType, 0);
  objc_storeStrong((id *)&self->_payloadHIDDENNETWORK, 0);
  objc_storeStrong((id *)&self->_payloadSSIDSTR, 0);

  objc_storeStrong((id *)&self->_payloadAutoJoin, 0);
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__CEMNetworkWiFiDeclaration_EAPClientConfiguration_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __87__CEMNetworkWiFiDeclaration_EAPClientConfiguration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __64__CEMNetworkWiFiDeclaration_QoSMarkingPolicy_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __81__CEMNetworkWiFiDeclaration_QoSMarkingPolicy_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end