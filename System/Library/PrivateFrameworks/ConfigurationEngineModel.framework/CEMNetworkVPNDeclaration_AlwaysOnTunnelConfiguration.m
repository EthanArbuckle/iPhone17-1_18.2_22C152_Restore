@interface CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withProtocolType:(id)a7;
+ (id)buildWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withPayloadCertificateUUID:(id)a7 withSharedSecret:(id)a8 withExtendedAuthEnabled:(id)a9 withDisableRedirect:(id)a10 withDisableMOBIKE:(id)a11 withUseConfigurationAttributeInternalIPSubnet:(id)a12 withEnablePFS:(id)a13 withEnableCertificateRevocationCheck:(id)a14 withNATKeepAliveOffloadEnable:(id)a15 withNATKeepAliveInterval:(id)a16 withAuthName:(id)a17 withAuthPassword:(id)a18 withDeadPeerDetectionRate:(id)a19 withProtocolType:(id)a20 withServerCertificateIssuerCommonName:(id)a21 withServerCertificateCommonName:(id)a22 withIKESecurityAssociationParameters:(id)a23 withChildSecurityAssociationParameters:(id)a24 withInterfaces:(id)a25;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadChildSecurityAssociationParameters;
- (CEMNetworkVPNDeclaration_SecurityAssociationParameters)payloadIKESecurityAssociationParameters;
- (NSArray)payloadInterfaces;
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
- (NSString)payloadDeadPeerDetectionRate;
- (NSString)payloadLocalIdentifier;
- (NSString)payloadPayloadCertificateUUID;
- (NSString)payloadProtocolType;
- (NSString)payloadRemoteAddress;
- (NSString)payloadRemoteIdentifier;
- (NSString)payloadServerCertificateCommonName;
- (NSString)payloadServerCertificateIssuerCommonName;
- (NSString)payloadSharedSecret;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAuthName:(id)a3;
- (void)setPayloadAuthPassword:(id)a3;
- (void)setPayloadAuthenticationMethod:(id)a3;
- (void)setPayloadChildSecurityAssociationParameters:(id)a3;
- (void)setPayloadDeadPeerDetectionRate:(id)a3;
- (void)setPayloadDisableMOBIKE:(id)a3;
- (void)setPayloadDisableRedirect:(id)a3;
- (void)setPayloadEnableCertificateRevocationCheck:(id)a3;
- (void)setPayloadEnablePFS:(id)a3;
- (void)setPayloadExtendedAuthEnabled:(id)a3;
- (void)setPayloadIKESecurityAssociationParameters:(id)a3;
- (void)setPayloadInterfaces:(id)a3;
- (void)setPayloadLocalIdentifier:(id)a3;
- (void)setPayloadNATKeepAliveInterval:(id)a3;
- (void)setPayloadNATKeepAliveOffloadEnable:(id)a3;
- (void)setPayloadPayloadCertificateUUID:(id)a3;
- (void)setPayloadProtocolType:(id)a3;
- (void)setPayloadRemoteAddress:(id)a3;
- (void)setPayloadRemoteIdentifier:(id)a3;
- (void)setPayloadServerCertificateCommonName:(id)a3;
- (void)setPayloadServerCertificateIssuerCommonName:(id)a3;
- (void)setPayloadSharedSecret:(id)a3;
- (void)setPayloadUseConfigurationAttributeInternalIPSubnet:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration

+ (NSSet)allowedPayloadKeys
{
  v6[23] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RemoteAddress";
  v6[1] = @"LocalIdentifier";
  v6[2] = @"RemoteIdentifier";
  v6[3] = @"AuthenticationMethod";
  v6[4] = @"PayloadCertificateUUID";
  v6[5] = @"SharedSecret";
  v6[6] = @"ExtendedAuthEnabled";
  v6[7] = @"DisableRedirect";
  v6[8] = @"DisableMOBIKE";
  v6[9] = @"UseConfigurationAttributeInternalIPSubnet";
  v6[10] = @"EnablePFS";
  v6[11] = @"EnableCertificateRevocationCheck";
  v6[12] = @"NATKeepAliveOffloadEnable";
  v6[13] = @"NATKeepAliveInterval";
  v6[14] = @"AuthName";
  v6[15] = @"AuthPassword";
  v6[16] = @"DeadPeerDetectionRate";
  v6[17] = @"ProtocolType";
  v6[18] = @"ServerCertificateIssuerCommonName";
  v6[19] = @"ServerCertificateCommonName";
  v6[20] = @"IKESecurityAssociationParameters";
  v6[21] = @"ChildSecurityAssociationParameters";
  v6[22] = @"Interfaces";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:23];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withPayloadCertificateUUID:(id)a7 withSharedSecret:(id)a8 withExtendedAuthEnabled:(id)a9 withDisableRedirect:(id)a10 withDisableMOBIKE:(id)a11 withUseConfigurationAttributeInternalIPSubnet:(id)a12 withEnablePFS:(id)a13 withEnableCertificateRevocationCheck:(id)a14 withNATKeepAliveOffloadEnable:(id)a15 withNATKeepAliveInterval:(id)a16 withAuthName:(id)a17 withAuthPassword:(id)a18 withDeadPeerDetectionRate:(id)a19 withProtocolType:(id)a20 withServerCertificateIssuerCommonName:(id)a21 withServerCertificateCommonName:(id)a22 withIKESecurityAssociationParameters:(id)a23 withChildSecurityAssociationParameters:(id)a24 withInterfaces:(id)a25
{
  id v64 = a25;
  id v63 = a24;
  id v62 = a23;
  id v61 = a22;
  id v60 = a21;
  id v59 = a20;
  v58 = (__CFString *)a19;
  id v57 = a18;
  id v56 = a17;
  id v55 = a16;
  id v54 = a15;
  id v53 = a14;
  id v52 = a13;
  id v51 = a12;
  id v25 = a11;
  id v26 = a10;
  id v27 = a9;
  id v28 = a8;
  id v29 = a7;
  id v30 = a6;
  id v31 = a5;
  id v32 = a4;
  id v33 = a3;
  v34 = objc_opt_new();
  [v34 setPayloadRemoteAddress:v33];

  [v34 setPayloadLocalIdentifier:v32];
  [v34 setPayloadRemoteIdentifier:v31];

  [v34 setPayloadAuthenticationMethod:v30];
  [v34 setPayloadPayloadCertificateUUID:v29];

  [v34 setPayloadSharedSecret:v28];
  if (v27) {
    v35 = v27;
  }
  else {
    v35 = &unk_26C894850;
  }
  [v34 setPayloadExtendedAuthEnabled:v35];

  if (v26) {
    v36 = v26;
  }
  else {
    v36 = &unk_26C894850;
  }
  [v34 setPayloadDisableRedirect:v36];

  if (v25) {
    v37 = v25;
  }
  else {
    v37 = &unk_26C894850;
  }
  [v34 setPayloadDisableMOBIKE:v37];

  if (v51) {
    v38 = v51;
  }
  else {
    v38 = &unk_26C894850;
  }
  [v34 setPayloadUseConfigurationAttributeInternalIPSubnet:v38];

  if (v52) {
    v39 = v52;
  }
  else {
    v39 = &unk_26C894850;
  }
  [v34 setPayloadEnablePFS:v39];

  if (v53) {
    v40 = v53;
  }
  else {
    v40 = &unk_26C894850;
  }
  [v34 setPayloadEnableCertificateRevocationCheck:v40];

  if (v54) {
    v41 = v54;
  }
  else {
    v41 = &unk_26C894868;
  }
  [v34 setPayloadNATKeepAliveOffloadEnable:v41];

  if (v55) {
    v42 = v55;
  }
  else {
    v42 = &unk_26C894880;
  }
  [v34 setPayloadNATKeepAliveInterval:v42];

  [v34 setPayloadAuthName:v56];
  [v34 setPayloadAuthPassword:v57];

  if (v58) {
    v43 = v58;
  }
  else {
    v43 = @"Low";
  }
  [v34 setPayloadDeadPeerDetectionRate:v43];

  [v34 setPayloadProtocolType:v59];
  [v34 setPayloadServerCertificateIssuerCommonName:v60];

  [v34 setPayloadServerCertificateCommonName:v61];
  [v34 setPayloadIKESecurityAssociationParameters:v62];

  [v34 setPayloadChildSecurityAssociationParameters:v63];
  [v34 setPayloadInterfaces:v64];

  return v34;
}

+ (id)buildRequiredOnlyWithRemoteAddress:(id)a3 withLocalIdentifier:(id)a4 withRemoteIdentifier:(id)a5 withAuthenticationMethod:(id)a6 withProtocolType:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadRemoteAddress:v15];

  [v16 setPayloadLocalIdentifier:v14];
  [v16 setPayloadRemoteIdentifier:v13];

  [v16 setPayloadAuthenticationMethod:v12];
  [v16 setPayloadProtocolType:v11];

  return v16;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v83 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RemoteAddress" isRequired:1 defaultValue:0 error:&v83];
  id v14 = v83;
  payloadRemoteAddress = self->_payloadRemoteAddress;
  self->_payloadRemoteAddress = v13;

  if (!v14)
  {
    id v82 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LocalIdentifier" isRequired:1 defaultValue:0 error:&v82];
    id v14 = v82;
    payloadLocalIdentifier = self->_payloadLocalIdentifier;
    self->_payloadLocalIdentifier = v16;

    if (!v14)
    {
      id v81 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RemoteIdentifier" isRequired:1 defaultValue:0 error:&v81];
      id v14 = v81;
      payloadRemoteIdentifier = self->_payloadRemoteIdentifier;
      self->_payloadRemoteIdentifier = v18;

      if (!v14)
      {
        id v80 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthenticationMethod" isRequired:1 defaultValue:0 error:&v80];
        id v14 = v80;
        payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
        self->_payloadAuthenticationMethod = v20;

        if (!v14)
        {
          id v79 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PayloadCertificateUUID" isRequired:0 defaultValue:0 error:&v79];
          id v14 = v79;
          payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
          self->_payloadPayloadCertificateUUID = v22;

          if (!v14)
          {
            id v78 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SharedSecret" isRequired:0 defaultValue:0 error:&v78];
            id v14 = v78;
            payloadSharedSecret = self->_payloadSharedSecret;
            self->_payloadSharedSecret = v24;

            if (!v14)
            {
              id v77 = 0;
              id v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ExtendedAuthEnabled" isRequired:0 defaultValue:&unk_26C894850 error:&v77];
              id v14 = v77;
              payloadExtendedAuthEnabled = self->_payloadExtendedAuthEnabled;
              self->_payloadExtendedAuthEnabled = v26;

              if (!v14)
              {
                id v76 = 0;
                id v28 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisableRedirect" isRequired:0 defaultValue:&unk_26C894850 error:&v76];
                id v14 = v76;
                payloadDisableRedirect = self->_payloadDisableRedirect;
                self->_payloadDisableRedirect = v28;

                if (!v14)
                {
                  id v75 = 0;
                  id v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisableMOBIKE" isRequired:0 defaultValue:&unk_26C894850 error:&v75];
                  id v14 = v75;
                  payloadDisableMOBIKE = self->_payloadDisableMOBIKE;
                  self->_payloadDisableMOBIKE = v30;

                  if (!v14)
                  {
                    id v74 = 0;
                    id v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"UseConfigurationAttributeInternalIPSubnet" isRequired:0 defaultValue:&unk_26C894850 error:&v74];
                    id v14 = v74;
                    payloadUseConfigurationAttributeInternalIPSubnet = self->_payloadUseConfigurationAttributeInternalIPSubnet;
                    self->_payloadUseConfigurationAttributeInternalIPSubnet = v32;

                    if (!v14)
                    {
                      id v73 = 0;
                      v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"EnablePFS" isRequired:0 defaultValue:&unk_26C894850 error:&v73];
                      id v14 = v73;
                      payloadEnablePFS = self->_payloadEnablePFS;
                      self->_payloadEnablePFS = v34;

                      if (!v14)
                      {
                        id v72 = 0;
                        v36 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"EnableCertificateRevocationCheck" isRequired:0 defaultValue:&unk_26C894850 error:&v72];
                        id v14 = v72;
                        payloadEnableCertificateRevocationCheck = self->_payloadEnableCertificateRevocationCheck;
                        self->_payloadEnableCertificateRevocationCheck = v36;

                        if (!v14)
                        {
                          id v71 = 0;
                          v38 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"NATKeepAliveOffloadEnable" isRequired:0 defaultValue:&unk_26C894868 error:&v71];
                          id v14 = v71;
                          payloadNATKeepAliveOffloadEnable = self->_payloadNATKeepAliveOffloadEnable;
                          self->_payloadNATKeepAliveOffloadEnable = v38;

                          if (!v14)
                          {
                            id v70 = 0;
                            v40 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"NATKeepAliveInterval" isRequired:0 defaultValue:&unk_26C894880 error:&v70];
                            id v14 = v70;
                            payloadNATKeepAliveInterval = self->_payloadNATKeepAliveInterval;
                            self->_payloadNATKeepAliveInterval = v40;

                            if (!v14)
                            {
                              id v69 = 0;
                              v42 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthName" isRequired:0 defaultValue:0 error:&v69];
                              id v14 = v69;
                              payloadAuthName = self->_payloadAuthName;
                              self->_payloadAuthName = v42;

                              if (!v14)
                              {
                                id v68 = 0;
                                v44 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthPassword" isRequired:0 defaultValue:0 error:&v68];
                                id v14 = v68;
                                payloadAuthPassword = self->_payloadAuthPassword;
                                self->_payloadAuthPassword = v44;

                                if (!v14)
                                {
                                  id v67 = 0;
                                  v46 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeadPeerDetectionRate" isRequired:0 defaultValue:@"Low" error:&v67];
                                  id v14 = v67;
                                  payloadDeadPeerDetectionRate = self->_payloadDeadPeerDetectionRate;
                                  self->_payloadDeadPeerDetectionRate = v46;

                                  if (!v14)
                                  {
                                    id v66 = 0;
                                    v48 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProtocolType" isRequired:1 defaultValue:0 error:&v66];
                                    id v14 = v66;
                                    payloadProtocolType = self->_payloadProtocolType;
                                    self->_payloadProtocolType = v48;

                                    if (!v14)
                                    {
                                      id v65 = 0;
                                      v50 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerCertificateIssuerCommonName" isRequired:0 defaultValue:0 error:&v65];
                                      id v14 = v65;
                                      payloadServerCertificateIssuerCommonName = self->_payloadServerCertificateIssuerCommonName;
                                      self->_payloadServerCertificateIssuerCommonName = v50;

                                      if (!v14)
                                      {
                                        id v64 = 0;
                                        id v52 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerCertificateCommonName" isRequired:0 defaultValue:0 error:&v64];
                                        id v14 = v64;
                                        payloadServerCertificateCommonName = self->_payloadServerCertificateCommonName;
                                        self->_payloadServerCertificateCommonName = v52;

                                        if (!v14)
                                        {
                                          id v63 = 0;
                                          id v54 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"IKESecurityAssociationParameters" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v63];
                                          id v14 = v63;
                                          payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
                                          self->_payloadIKESecurityAssociationParameters = v54;

                                          if (!v14)
                                          {
                                            id v62 = 0;
                                            id v56 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"ChildSecurityAssociationParameters" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v62];
                                            id v14 = v62;
                                            payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
                                            self->_payloadChildSecurityAssociationParameters = v56;

                                            if (!v14)
                                            {
                                              id v61 = 0;
                                              v58 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Interfaces" validator:&__block_literal_global_1167 isRequired:0 defaultValue:0 error:&v61];
                                              id v14 = v61;
                                              payloadInterfaces = self->_payloadInterfaces;
                                              self->_payloadInterfaces = v58;
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
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisableRedirect" withValue:self->_payloadDisableRedirect isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisableMOBIKE" withValue:self->_payloadDisableMOBIKE isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"UseConfigurationAttributeInternalIPSubnet" withValue:self->_payloadUseConfigurationAttributeInternalIPSubnet isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"EnablePFS" withValue:self->_payloadEnablePFS isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"EnableCertificateRevocationCheck" withValue:self->_payloadEnableCertificateRevocationCheck isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"NATKeepAliveOffloadEnable" withValue:self->_payloadNATKeepAliveOffloadEnable isRequired:0 defaultValue:&unk_26C894868];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"NATKeepAliveInterval" withValue:self->_payloadNATKeepAliveInterval isRequired:0 defaultValue:&unk_26C894880];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthName" withValue:self->_payloadAuthName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthPassword" withValue:self->_payloadAuthPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DeadPeerDetectionRate" withValue:self->_payloadDeadPeerDetectionRate isRequired:0 defaultValue:@"Low"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProtocolType" withValue:self->_payloadProtocolType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ServerCertificateIssuerCommonName" withValue:self->_payloadServerCertificateIssuerCommonName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ServerCertificateCommonName" withValue:self->_payloadServerCertificateCommonName isRequired:0 defaultValue:0];
  payloadIKESecurityAssociationParameters = self->_payloadIKESecurityAssociationParameters;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C87E8;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"IKESecurityAssociationParameters" withValue:payloadIKESecurityAssociationParameters dictSerializer:v17 isRequired:0 defaultValue:0];
  payloadChildSecurityAssociationParameters = self->_payloadChildSecurityAssociationParameters;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke_2;
  id v15 = &unk_2642C87E8;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"ChildSecurityAssociationParameters" withValue:payloadChildSecurityAssociationParameters dictSerializer:&v12 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5, @"Interfaces", self->_payloadInterfaces, &__block_literal_global_1169, 0, 0, v12, v13, v14, v15 withKey withValue itemSerializer isRequired defaultValue];
  v10 = (void *)[v5 copy];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v52.receiver = self;
  v52.super_class = (Class)CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration;
  id v4 = [(CEMPayloadBase *)&v52 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRemoteAddress copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadLocalIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadRemoteIdentifier copy];
  v10 = (void *)v4[4];
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

  uint64_t v19 = [(NSNumber *)self->_payloadDisableRedirect copy];
  v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadDisableMOBIKE copy];
  v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadUseConfigurationAttributeInternalIPSubnet copy];
  v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadEnablePFS copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadEnableCertificateRevocationCheck copy];
  id v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadNATKeepAliveOffloadEnable copy];
  id v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadNATKeepAliveInterval copy];
  id v32 = (void *)v4[15];
  v4[15] = v31;

  uint64_t v33 = [(NSString *)self->_payloadAuthName copy];
  v34 = (void *)v4[16];
  v4[16] = v33;

  uint64_t v35 = [(NSString *)self->_payloadAuthPassword copy];
  v36 = (void *)v4[17];
  v4[17] = v35;

  uint64_t v37 = [(NSString *)self->_payloadDeadPeerDetectionRate copy];
  v38 = (void *)v4[18];
  v4[18] = v37;

  uint64_t v39 = [(NSString *)self->_payloadProtocolType copy];
  v40 = (void *)v4[19];
  v4[19] = v39;

  uint64_t v41 = [(NSString *)self->_payloadServerCertificateIssuerCommonName copy];
  v42 = (void *)v4[20];
  v4[20] = v41;

  uint64_t v43 = [(NSString *)self->_payloadServerCertificateCommonName copy];
  v44 = (void *)v4[21];
  v4[21] = v43;

  uint64_t v45 = [(CEMNetworkVPNDeclaration_SecurityAssociationParameters *)self->_payloadIKESecurityAssociationParameters copy];
  v46 = (void *)v4[22];
  v4[22] = v45;

  uint64_t v47 = [(CEMNetworkVPNDeclaration_SecurityAssociationParameters *)self->_payloadChildSecurityAssociationParameters copy];
  v48 = (void *)v4[23];
  v4[23] = v47;

  uint64_t v49 = [(NSArray *)self->_payloadInterfaces copy];
  v50 = (void *)v4[24];
  v4[24] = v49;

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

- (NSString)payloadAuthName
{
  return self->_payloadAuthName;
}

- (void)setPayloadAuthName:(id)a3
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

- (NSString)payloadProtocolType
{
  return self->_payloadProtocolType;
}

- (void)setPayloadProtocolType:(id)a3
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

- (NSArray)payloadInterfaces
{
  return self->_payloadInterfaces;
}

- (void)setPayloadInterfaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInterfaces, 0);
  objc_storeStrong((id *)&self->_payloadChildSecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadIKESecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateCommonName, 0);
  objc_storeStrong((id *)&self->_payloadServerCertificateIssuerCommonName, 0);
  objc_storeStrong((id *)&self->_payloadProtocolType, 0);
  objc_storeStrong((id *)&self->_payloadDeadPeerDetectionRate, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadAuthName, 0);
  objc_storeStrong((id *)&self->_payloadNATKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_payloadNATKeepAliveOffloadEnable, 0);
  objc_storeStrong((id *)&self->_payloadEnableCertificateRevocationCheck, 0);
  objc_storeStrong((id *)&self->_payloadEnablePFS, 0);
  objc_storeStrong((id *)&self->_payloadUseConfigurationAttributeInternalIPSubnet, 0);
  objc_storeStrong((id *)&self->_payloadDisableMOBIKE, 0);
  objc_storeStrong((id *)&self->_payloadDisableRedirect, 0);
  objc_storeStrong((id *)&self->_payloadExtendedAuthEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
}

@end