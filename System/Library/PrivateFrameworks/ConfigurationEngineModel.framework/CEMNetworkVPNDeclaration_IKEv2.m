@interface CEMNetworkVPNDeclaration_IKEv2
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6;
+ (id)buildWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withPayloadCertificateUUID:(id)a7 withSharedSecret:(id)a8 withExtendedAuthEnabled:(id)a9 withAuthName:(id)a10 withDisableRedirect:(id)a11 withDisableMOBIKE:(id)a12 withUseConfigurationAttributeInternalIPSubnet:(id)a13 withEnablePFS:(id)a14 withEnableCertificateRevocationCheck:(id)a15 withAuthPassword:(id)a16 withDeadPeerDetectionRate:(id)a17 withCertificateType:(id)a18 withServerCertificateIssuerCommonName:(id)a19 withServerCertificateCommonName:(id)a20 withIKESecurityAssociationParameters:(id)a21 withChildSecurityAssociationParameters:(id)a22 withTLSMinimumVersion:(id)a23 withTLSMaximumVersion:(id)a24 withNATKeepAliveOffloadEnable:(id)a25 withNATKeepAliveInterval:(id)a26;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadChildSecurityAssociationParameters;
- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadIKESecurityAssociationParameters;
- (NSNumber)payloadDisableMOBIKE;
- (NSNumber)payloadDisableRedirect;
- (NSNumber)payloadEnableCertificateRevocationCheck;
- (NSNumber)payloadEnablePFS;
- (NSNumber)payloadExtendedAuthEnabled;
- (NSNumber)payloadNATKeepAliveInterval;
- (NSNumber)payloadNATKeepAliveOffloadEnable;
- (NSNumber)payloadUseConfigurationAttributeInternalIPSubnet;
- (NSString)payloadAuthName;
- (NSString)payloadAuthPassword;
- (NSString)payloadAuthenticationMethod;
- (NSString)payloadCertificateType;
- (NSString)payloadDeadPeerDetectionRate;
- (NSString)payloadLocalIdentifier;
- (NSString)payloadPayloadCertificateUUID;
- (NSString)payloadRemoteAddress;
- (NSString)payloadRemoteIdentifier;
- (NSString)payloadServerCertificateCommonName;
- (NSString)payloadServerCertificateIssuerCommonName;
- (NSString)payloadSharedSecret;
- (NSString)payloadTLSMaximumVersion;
- (NSString)payloadTLSMinimumVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAuthName:(id)a3;
- (void)setPayloadAuthPassword:(id)a3;
- (void)setPayloadAuthenticationMethod:(id)a3;
- (void)setPayloadCertificateType:(id)a3;
- (void)setPayloadChildSecurityAssociationParameters:(id)a3;
- (void)setPayloadDeadPeerDetectionRate:(id)a3;
- (void)setPayloadDisableMOBIKE:(id)a3;
- (void)setPayloadDisableRedirect:(id)a3;
- (void)setPayloadEnableCertificateRevocationCheck:(id)a3;
- (void)setPayloadEnablePFS:(id)a3;
- (void)setPayloadExtendedAuthEnabled:(id)a3;
- (void)setPayloadIKESecurityAssociationParameters:(id)a3;
- (void)setPayloadLocalIdentifier:(id)a3;
- (void)setPayloadNATKeepAliveInterval:(id)a3;
- (void)setPayloadNATKeepAliveOffloadEnable:(id)a3;
- (void)setPayloadPayloadCertificateUUID:(id)a3;
- (void)setPayloadRemoteAddress:(id)a3;
- (void)setPayloadRemoteIdentifier:(id)a3;
- (void)setPayloadServerCertificateCommonName:(id)a3;
- (void)setPayloadServerCertificateIssuerCommonName:(id)a3;
- (void)setPayloadSharedSecret:(id)a3;
- (void)setPayloadTLSMaximumVersion:(id)a3;
- (void)setPayloadTLSMinimumVersion:(id)a3;
- (void)setPayloadUseConfigurationAttributeInternalIPSubnet:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_IKEv2

+ (NSSet)allowedPayloadKeys
{
  v6[24] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RemoteAddress";
  v6[1] = @"LocalIdentifier";
  v6[2] = @"RemoteIdentifier";
  v6[3] = @"AuthenticationMethod";
  v6[4] = @"PayloadCertificateUUID";
  v6[5] = @"SharedSecret";
  v6[6] = @"ExtendedAuthEnabled";
  v6[7] = @"AuthName";
  v6[8] = @"DisableRedirect";
  v6[9] = @"DisableMOBIKE";
  v6[10] = @"UseConfigurationAttributeInternalIPSubnet";
  v6[11] = @"EnablePFS";
  v6[12] = @"EnableCertificateRevocationCheck";
  v6[13] = @"AuthPassword";
  v6[14] = @"DeadPeerDetectionRate";
  v6[15] = @"CertificateType";
  v6[16] = @"ServerCertificateIssuerCommonName";
  v6[17] = @"ServerCertificateCommonName";
  v6[18] = @"IKESecurityAssociationParameters";
  v6[19] = @"ChildSecurityAssociationParameters";
  v6[20] = @"TLSMinimumVersion";
  v6[21] = @"TLSMaximumVersion";
  v6[22] = @"NATKeepAliveOffloadEnable";
  v6[23] = @"NATKeepAliveInterval";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:24];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withPayloadCertificateUUID:(id)a7 withSharedSecret:(id)a8 withExtendedAuthEnabled:(id)a9 withAuthName:(id)a10 withDisableRedirect:(id)a11 withDisableMOBIKE:(id)a12 withUseConfigurationAttributeInternalIPSubnet:(id)a13 withEnablePFS:(id)a14 withEnableCertificateRevocationCheck:(id)a15 withAuthPassword:(id)a16 withDeadPeerDetectionRate:(id)a17 withCertificateType:(id)a18 withServerCertificateIssuerCommonName:(id)a19 withServerCertificateCommonName:(id)a20 withIKESecurityAssociationParameters:(id)a21 withChildSecurityAssociationParameters:(id)a22 withTLSMinimumVersion:(id)a23 withTLSMaximumVersion:(id)a24 withNATKeepAliveOffloadEnable:(id)a25 withNATKeepAliveInterval:(id)a26
{
  id v69 = a26;
  id v68 = a25;
  v67 = (__CFString *)a24;
  v66 = (__CFString *)a23;
  id v65 = a22;
  id v64 = a21;
  id v63 = a20;
  id v62 = a19;
  v61 = (__CFString *)a18;
  v60 = (__CFString *)a17;
  id v59 = a16;
  id v58 = a15;
  id v57 = a14;
  id v56 = a13;
  id v26 = a12;
  id v27 = a11;
  id v49 = a10;
  id v28 = a9;
  id v29 = a8;
  id v30 = a7;
  id v31 = a6;
  id v32 = a5;
  id v33 = a4;
  id v34 = a3;
  v35 = objc_opt_new();
  [v35 setPayloadRemoteAddress:v34];

  [v35 setPayloadLocalIdentifier:v33];
  [v35 setPayloadRemoteIdentifier:v32];

  [v35 setPayloadAuthenticationMethod:v31];
  [v35 setPayloadPayloadCertificateUUID:v30];

  [v35 setPayloadSharedSecret:v29];
  if (v28) {
    v36 = v28;
  }
  else {
    v36 = &unk_26C894850;
  }
  [v35 setPayloadExtendedAuthEnabled:v36];

  [v35 setPayloadAuthName:v49];
  if (v27) {
    v37 = v27;
  }
  else {
    v37 = &unk_26C894850;
  }
  [v35 setPayloadDisableRedirect:v37];

  if (v26) {
    v38 = v26;
  }
  else {
    v38 = &unk_26C894850;
  }
  [v35 setPayloadDisableMOBIKE:v38];

  if (v56) {
    v39 = v56;
  }
  else {
    v39 = &unk_26C894850;
  }
  [v35 setPayloadUseConfigurationAttributeInternalIPSubnet:v39];

  if (v57) {
    v40 = v57;
  }
  else {
    v40 = &unk_26C894850;
  }
  [v35 setPayloadEnablePFS:v40];

  if (v58) {
    v41 = v58;
  }
  else {
    v41 = &unk_26C894850;
  }
  [v35 setPayloadEnableCertificateRevocationCheck:v41];

  [v35 setPayloadAuthPassword:v59];
  if (v60) {
    v42 = v60;
  }
  else {
    v42 = @"Medium";
  }
  [v35 setPayloadDeadPeerDetectionRate:v42];

  if (v61) {
    v43 = v61;
  }
  else {
    v43 = @"RSA";
  }
  [v35 setPayloadCertificateType:v43];

  [v35 setPayloadServerCertificateIssuerCommonName:v62];
  [v35 setPayloadServerCertificateCommonName:v63];

  [v35 setPayloadIKESecurityAssociationParameters:v64];
  [v35 setPayloadChildSecurityAssociationParameters:v65];

  if (v66) {
    v44 = v66;
  }
  else {
    v44 = @"1.0";
  }
  [v35 setPayloadTLSMinimumVersion:v44];

  if (v67) {
    v45 = v67;
  }
  else {
    v45 = @"1.2";
  }
  [v35 setPayloadTLSMaximumVersion:v45];

  if (v68) {
    v46 = v68;
  }
  else {
    v46 = &unk_26C894868;
  }
  [v35 setPayloadNATKeepAliveOffloadEnable:v46];

  if (v69) {
    v47 = v69;
  }
  else {
    v47 = &unk_26C894880;
  }
  [v35 setPayloadNATKeepAliveInterval:v47];

  return v35;
}

+ (id)buildRequiredOnlyWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadRemoteAddress:v12];

  [v13 setPayloadLocalIdentifier:v11];
  [v13 setPayloadRemoteIdentifier:v10];

  [v13 setPayloadAuthenticationMethod:v9];

  return v13;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkVPNDeclaration_IKEv2 allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v86 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RemoteAddress" isRequired:1 defaultValue:0 error:&v86];
  id v14 = v86;
  payloadRemoteAddress = self->_payloadRemoteAddress;
  self->_payloadRemoteAddress = v13;

  if (!v14)
  {
    id v85 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LocalIdentifier" isRequired:1 defaultValue:0 error:&v85];
    id v14 = v85;
    payloadLocalIdentifier = self->_payloadLocalIdentifier;
    self->_payloadLocalIdentifier = v16;

    if (!v14)
    {
      id v84 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RemoteIdentifier" isRequired:1 defaultValue:0 error:&v84];
      id v14 = v84;
      payloadRemoteIdentifier = self->_payloadRemoteIdentifier;
      self->_payloadRemoteIdentifier = v18;

      if (!v14)
      {
        id v83 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthenticationMethod" isRequired:1 defaultValue:0 error:&v83];
        id v14 = v83;
        payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
        self->_payloadAuthenticationMethod = v20;

        if (!v14)
        {
          id v82 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PayloadCertificateUUID" isRequired:0 defaultValue:0 error:&v82];
          id v14 = v82;
          payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
          self->_payloadPayloadCertificateUUID = v22;

          if (!v14)
          {
            id v81 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SharedSecret" isRequired:0 defaultValue:0 error:&v81];
            id v14 = v81;
            payloadSharedSecret = self->_payloadSharedSecret;
            self->_payloadSharedSecret = v24;

            if (!v14)
            {
              id v80 = 0;
              id v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ExtendedAuthEnabled" isRequired:0 defaultValue:&unk_26C894850 error:&v80];
              id v14 = v80;
              payloadExtendedAuthEnabled = self->_payloadExtendedAuthEnabled;
              self->_payloadExtendedAuthEnabled = v26;

              if (!v14)
              {
                id v79 = 0;
                id v28 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthName" isRequired:0 defaultValue:0 error:&v79];
                id v14 = v79;
                payloadAuthName = self->_payloadAuthName;
                self->_payloadAuthName = v28;

                if (!v14)
                {
                  id v78 = 0;
                  id v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisableRedirect" isRequired:0 defaultValue:&unk_26C894850 error:&v78];
                  id v14 = v78;
                  payloadDisableRedirect = self->_payloadDisableRedirect;
                  self->_payloadDisableRedirect = v30;

                  if (!v14)
                  {
                    id v77 = 0;
                    id v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisableMOBIKE" isRequired:0 defaultValue:&unk_26C894850 error:&v77];
                    id v14 = v77;
                    payloadDisableMOBIKE = self->_payloadDisableMOBIKE;
                    self->_payloadDisableMOBIKE = v32;

                    if (!v14)
                    {
                      id v76 = 0;
                      id v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"UseConfigurationAttributeInternalIPSubnet" isRequired:0 defaultValue:&unk_26C894850 error:&v76];
                      id v14 = v76;
                      payloadUseConfigurationAttributeInternalIPSubnet = self->_payloadUseConfigurationAttributeInternalIPSubnet;
                      self->_payloadUseConfigurationAttributeInternalIPSubnet = v34;

                      if (!v14)
                      {
                        id v75 = 0;
                        v36 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"EnablePFS" isRequired:0 defaultValue:&unk_26C894850 error:&v75];
                        id v14 = v75;
                        payloadEnablePFS = self->_payloadEnablePFS;
                        self->_payloadEnablePFS = v36;

                        if (!v14)
                        {
                          id v74 = 0;
                          v38 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"EnableCertificateRevocationCheck" isRequired:0 defaultValue:&unk_26C894850 error:&v74];
                          id v14 = v74;
                          payloadEnableCertificateRevocationCheck = self->_payloadEnableCertificateRevocationCheck;
                          self->_payloadEnableCertificateRevocationCheck = v38;

                          if (!v14)
                          {
                            id v73 = 0;
                            v40 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthPassword" isRequired:0 defaultValue:0 error:&v73];
                            id v14 = v73;
                            payloadAuthPassword = self->_payloadAuthPassword;
                            self->_payloadAuthPassword = v40;

                            if (!v14)
                            {
                              id v72 = 0;
                              v42 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeadPeerDetectionRate" isRequired:0 defaultValue:@"Medium" error:&v72];
                              id v14 = v72;
                              payloadDeadPeerDetectionRate = self->_payloadDeadPeerDetectionRate;
                              self->_payloadDeadPeerDetectionRate = v42;

                              if (!v14)
                              {
                                id v71 = 0;
                                v44 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CertificateType" isRequired:0 defaultValue:@"RSA" error:&v71];
                                id v14 = v71;
                                payloadCertificateType = self->_payloadCertificateType;
                                self->_payloadCertificateType = v44;

                                if (!v14)
                                {
                                  id v70 = 0;
                                  v46 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerCertificateIssuerCommonName" isRequired:0 defaultValue:0 error:&v70];
                                  id v14 = v70;
                                  payloadServerCertificateIssuerCommonName = self->_payloadServerCertificateIssuerCommonName;
                                  self->_payloadServerCertificateIssuerCommonName = v46;

                                  if (!v14)
                                  {
                                    id v69 = 0;
                                    v48 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerCertificateCommonName" isRequired:0 defaultValue:0 error:&v69];
                                    id v14 = v69;
                                    payloadServerCertificateCommonName = self->_payloadServerCertificateCommonName;
                                    self->_payloadServerCertificateCommonName = v48;

                                    if (!v14)
                                    {
                                      id v68 = 0;
                                      v50 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"IKESecurityAssociationParameters" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v68];
                                      id v14 = v68;
                                      payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
                                      self->_payloadIKESecurityAssociationParameters = v50;

                                      if (!v14)
                                      {
                                        id v67 = 0;
                                        v52 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"ChildSecurityAssociationParameters" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v67];
                                        id v14 = v67;
                                        payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
                                        self->_payloadChildSecurityAssociationParameters = v52;

                                        if (!v14)
                                        {
                                          id v66 = 0;
                                          v54 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TLSMinimumVersion" isRequired:0 defaultValue:@"1.0" error:&v66];
                                          id v14 = v66;
                                          payloadTLSMinimumVersion = self->_payloadTLSMinimumVersion;
                                          self->_payloadTLSMinimumVersion = v54;

                                          if (!v14)
                                          {
                                            id v65 = 0;
                                            id v56 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TLSMaximumVersion" isRequired:0 defaultValue:@"1.2" error:&v65];
                                            id v14 = v65;
                                            payloadTLSMaximumVersion = self->_payloadTLSMaximumVersion;
                                            self->_payloadTLSMaximumVersion = v56;

                                            if (!v14)
                                            {
                                              id v64 = 0;
                                              id v58 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"NATKeepAliveOffloadEnable" isRequired:0 defaultValue:&unk_26C894868 error:&v64];
                                              id v14 = v64;
                                              payloadNATKeepAliveOffloadEnable = self->_payloadNATKeepAliveOffloadEnable;
                                              self->_payloadNATKeepAliveOffloadEnable = v58;

                                              if (!v14)
                                              {
                                                id v63 = 0;
                                                v60 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"NATKeepAliveInterval" isRequired:0 defaultValue:&unk_26C894880 error:&v63];
                                                id v14 = v63;
                                                payloadNATKeepAliveInterval = self->_payloadNATKeepAliveInterval;
                                                self->_payloadNATKeepAliveInterval = v60;
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

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"RemoteAddress" withValue:self->_payloadRemoteAddress isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"LocalIdentifier" withValue:self->_payloadLocalIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"RemoteIdentifier" withValue:self->_payloadRemoteIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthenticationMethod" withValue:self->_payloadAuthenticationMethod isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"PayloadCertificateUUID" withValue:self->_payloadPayloadCertificateUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SharedSecret" withValue:self->_payloadSharedSecret isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"ExtendedAuthEnabled" withValue:self->_payloadExtendedAuthEnabled isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthName" withValue:self->_payloadAuthName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisableRedirect" withValue:self->_payloadDisableRedirect isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisableMOBIKE" withValue:self->_payloadDisableMOBIKE isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"UseConfigurationAttributeInternalIPSubnet" withValue:self->_payloadUseConfigurationAttributeInternalIPSubnet isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"EnablePFS" withValue:self->_payloadEnablePFS isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"EnableCertificateRevocationCheck" withValue:self->_payloadEnableCertificateRevocationCheck isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthPassword" withValue:self->_payloadAuthPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DeadPeerDetectionRate" withValue:self->_payloadDeadPeerDetectionRate isRequired:0 defaultValue:@"Medium"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CertificateType" withValue:self->_payloadCertificateType isRequired:0 defaultValue:@"RSA"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ServerCertificateIssuerCommonName" withValue:self->_payloadServerCertificateIssuerCommonName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ServerCertificateCommonName" withValue:self->_payloadServerCertificateCommonName isRequired:0 defaultValue:0];
  payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C87E8;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"IKESecurityAssociationParameters" withValue:payloadIKESecurityAssociationParameters dictSerializer:v17 isRequired:0 defaultValue:0];
  payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_2642C87E8;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"ChildSecurityAssociationParameters" withValue:payloadChildSecurityAssociationParameters dictSerializer:&v12 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5, @"TLSMinimumVersion", self->_payloadTLSMinimumVersion, 0, @"1.0", v12, v13, v14, v15 withKey withValue isRequired defaultValue];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"TLSMaximumVersion" withValue:self->_payloadTLSMaximumVersion isRequired:0 defaultValue:@"1.2"];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"NATKeepAliveOffloadEnable" withValue:self->_payloadNATKeepAliveOffloadEnable isRequired:0 defaultValue:&unk_26C894868];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"NATKeepAliveInterval" withValue:self->_payloadNATKeepAliveInterval isRequired:0 defaultValue:&unk_26C894880];
  id v10 = (void *)[v5 copy];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v54.receiver = self;
  v54.super_class = (Class)CEMNetworkVPNDeclaration_IKEv2;
  id v4 = [(CEMPayloadBase *)&v54 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRemoteAddress copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadLocalIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadRemoteIdentifier copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAuthenticationMethod copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadPayloadCertificateUUID copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadSharedSecret copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadExtendedAuthEnabled copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_payloadAuthName copy];
  v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadDisableRedirect copy];
  v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadDisableMOBIKE copy];
  v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadUseConfigurationAttributeInternalIPSubnet copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadEnablePFS copy];
  id v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadEnableCertificateRevocationCheck copy];
  id v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSString *)self->_payloadAuthPassword copy];
  id v32 = (void *)v4[15];
  v4[15] = v31;

  uint64_t v33 = [(NSString *)self->_payloadDeadPeerDetectionRate copy];
  id v34 = (void *)v4[16];
  v4[16] = v33;

  uint64_t v35 = [(NSString *)self->_payloadCertificateType copy];
  v36 = (void *)v4[17];
  v4[17] = v35;

  uint64_t v37 = [(NSString *)self->_payloadServerCertificateIssuerCommonName copy];
  v38 = (void *)v4[18];
  v4[18] = v37;

  uint64_t v39 = [(NSString *)self->_payloadServerCertificateCommonName copy];
  v40 = (void *)v4[19];
  v4[19] = v39;

  uint64_t v41 = [(CEMNetworkVPNDeclaration_SecurityAssociationParameters *)self->_payloadIKESecurityAssociationParameters copy];
  v42 = (void *)v4[20];
  v4[20] = v41;

  uint64_t v43 = [(CEMNetworkVPNDeclaration_SecurityAssociationParameters *)self->_payloadChildSecurityAssociationParameters copy];
  v44 = (void *)v4[21];
  v4[21] = v43;

  uint64_t v45 = [(NSString *)self->_payloadTLSMinimumVersion copy];
  v46 = (void *)v4[22];
  v4[22] = v45;

  uint64_t v47 = [(NSString *)self->_payloadTLSMaximumVersion copy];
  v48 = (void *)v4[23];
  v4[23] = v47;

  uint64_t v49 = [(NSNumber *)self->_payloadNATKeepAliveOffloadEnable copy];
  v50 = (void *)v4[24];
  v4[24] = v49;

  uint64_t v51 = [(NSNumber *)self->_payloadNATKeepAliveInterval copy];
  v52 = (void *)v4[25];
  v4[25] = v51;

  return v4;
}

- (NSString)payloadRemoteAddress
{
  return self->_payloadRemoteAddress;
}

- (void)setPayloadRemoteAddress:(id)a3
{
}

- (NSString)payloadLocalIdentifier
{
  return self->_payloadLocalIdentifier;
}

- (void)setPayloadLocalIdentifier:(id)a3
{
}

- (NSString)payloadRemoteIdentifier
{
  return self->_payloadRemoteIdentifier;
}

- (void)setPayloadRemoteIdentifier:(id)a3
{
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
}

- (NSString)payloadSharedSecret
{
  return self->_payloadSharedSecret;
}

- (void)setPayloadSharedSecret:(id)a3
{
}

- (NSNumber)payloadExtendedAuthEnabled
{
  return self->_payloadExtendedAuthEnabled;
}

- (void)setPayloadExtendedAuthEnabled:(id)a3
{
}

- (NSString)payloadAuthName
{
  return self->_payloadAuthName;
}

- (void)setPayloadAuthName:(id)a3
{
}

- (NSNumber)payloadDisableRedirect
{
  return self->_payloadDisableRedirect;
}

- (void)setPayloadDisableRedirect:(id)a3
{
}

- (NSNumber)payloadDisableMOBIKE
{
  return self->_payloadDisableMOBIKE;
}

- (void)setPayloadDisableMOBIKE:(id)a3
{
}

- (NSNumber)payloadUseConfigurationAttributeInternalIPSubnet
{
  return self->_payloadUseConfigurationAttributeInternalIPSubnet;
}

- (void)setPayloadUseConfigurationAttributeInternalIPSubnet:(id)a3
{
}

- (NSNumber)payloadEnablePFS
{
  return self->_payloadEnablePFS;
}

- (void)setPayloadEnablePFS:(id)a3
{
}

- (NSNumber)payloadEnableCertificateRevocationCheck
{
  return self->_payloadEnableCertificateRevocationCheck;
}

- (void)setPayloadEnableCertificateRevocationCheck:(id)a3
{
}

- (NSString)payloadAuthPassword
{
  return self->_payloadAuthPassword;
}

- (void)setPayloadAuthPassword:(id)a3
{
}

- (NSString)payloadDeadPeerDetectionRate
{
  return self->_payloadDeadPeerDetectionRate;
}

- (void)setPayloadDeadPeerDetectionRate:(id)a3
{
}

- (NSString)payloadCertificateType
{
  return self->_payloadCertificateType;
}

- (void)setPayloadCertificateType:(id)a3
{
}

- (NSString)payloadServerCertificateIssuerCommonName
{
  return self->_payloadServerCertificateIssuerCommonName;
}

- (void)setPayloadServerCertificateIssuerCommonName:(id)a3
{
}

- (NSString)payloadServerCertificateCommonName
{
  return self->_payloadServerCertificateCommonName;
}

- (void)setPayloadServerCertificateCommonName:(id)a3
{
}

- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadIKESecurityAssociationParameters
{
  return self->_payloadIKESecurityAssociationParameters;
}

- (void)setPayloadIKESecurityAssociationParameters:(id)a3
{
}

- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadChildSecurityAssociationParameters
{
  return self->_payloadChildSecurityAssociationParameters;
}

- (void)setPayloadChildSecurityAssociationParameters:(id)a3
{
}

- (NSString)payloadTLSMinimumVersion
{
  return self->_payloadTLSMinimumVersion;
}

- (void)setPayloadTLSMinimumVersion:(id)a3
{
}

- (NSString)payloadTLSMaximumVersion
{
  return self->_payloadTLSMaximumVersion;
}

- (void)setPayloadTLSMaximumVersion:(id)a3
{
}

- (NSNumber)payloadNATKeepAliveOffloadEnable
{
  return self->_payloadNATKeepAliveOffloadEnable;
}

- (void)setPayloadNATKeepAliveOffloadEnable:(id)a3
{
}

- (NSNumber)payloadNATKeepAliveInterval
{
  return self->_payloadNATKeepAliveInterval;
}

- (void)setPayloadNATKeepAliveInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNATKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_payloadNATKeepAliveOffloadEnable, 0);
  objc_storeStrong((id *)&self->_payloadTLSMaximumVersion, 0);
  objc_storeStrong((id *)&self->_payloadTLSMinimumVersion, 0);
  objc_storeStrong((id *)&self->_payloadChildSecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadIKESecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateCommonName, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateIssuerCommonName, 0);
  objc_storeStrong((id *)&self->_payloadCertificateType, 0);
  objc_storeStrong((id *)&self->_payloadDeadPeerDetectionRate, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadEnableCertificateRevocationCheck, 0);
  objc_storeStrong((id *)&self->_payloadEnablePFS, 0);
  objc_storeStrong((id *)&self->_payloadUseConfigurationAttributeInternalIPSubnet, 0);
  objc_storeStrong((id *)&self->_payloadDisableMOBIKE, 0);
  objc_storeStrong((id *)&self->_payloadDisableRedirect, 0);
  objc_storeStrong((id *)&self->_payloadAuthName, 0);
  objc_storeStrong((id *)&self->_payloadExtendedAuthEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
}

@end