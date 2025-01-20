@interface NEVPNProtocolIKEv2
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disableInitialContact;
- (BOOL)disableMOBIKE;
- (BOOL)disableRedirect;
- (BOOL)enableFallback;
- (BOOL)enablePFS;
- (BOOL)enableRevocationCheck;
- (BOOL)needToUpdateKeychain;
- (BOOL)opportunisticPFS;
- (BOOL)strictRevocationCheck;
- (BOOL)useConfigurationAttributeInternalIPSubnet;
- (NEVPNIKEv2CertificateType)certificateType;
- (NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate;
- (NEVPNIKEv2PPKConfiguration)ppkConfiguration;
- (NEVPNIKEv2SecurityAssociationParameters)IKESecurityAssociationParameters;
- (NEVPNIKEv2SecurityAssociationParameters)childSecurityAssociationParameters;
- (NEVPNIKEv2TLSVersion)maximumTLSVersion;
- (NEVPNIKEv2TLSVersion)minimumTLSVersion;
- (NEVPNProtocolIKEv2)init;
- (NEVPNProtocolIKEv2)initWithCoder:(id)a3;
- (NSArray)IKESecurityAssociationParametersArray;
- (NSArray)childSecurityAssociationParametersArray;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (NSString)serverCertificateCommonName;
- (NSString)serverCertificateIssuerCommonName;
- (NSUInteger)mtu;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int)disableMOBIKERetryOnWake;
- (int)natKeepAliveOffloadEnable;
- (int)natKeepAliveOffloadInterval;
- (int64_t)tunnelKind;
- (void)encodeWithCoder:(id)a3;
- (void)initWithPluginType:(void *)a1;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setCertificateType:(NEVPNIKEv2CertificateType)certificateType;
- (void)setChildSecurityAssociationParametersArray:(id)a3;
- (void)setDeadPeerDetectionRate:(NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate;
- (void)setDefaultsForUIConfiguration;
- (void)setDisableInitialContact:(BOOL)a3;
- (void)setDisableMOBIKE:(BOOL)disableMOBIKE;
- (void)setDisableMOBIKERetryOnWake:(int)a3;
- (void)setDisableRedirect:(BOOL)disableRedirect;
- (void)setEnableFallback:(BOOL)enableFallback;
- (void)setEnablePFS:(BOOL)enablePFS;
- (void)setEnableRevocationCheck:(BOOL)enableRevocationCheck;
- (void)setIKESecurityAssociationParametersArray:(id)a3;
- (void)setMaximumTLSVersion:(NEVPNIKEv2TLSVersion)maximumTLSVersion;
- (void)setMinimumTLSVersion:(NEVPNIKEv2TLSVersion)minimumTLSVersion;
- (void)setMtu:(NSUInteger)mtu;
- (void)setNatKeepAliveOffloadEnable:(int)a3;
- (void)setNatKeepAliveOffloadInterval:(int)a3;
- (void)setOpportunisticPFS:(BOOL)a3;
- (void)setPluginType:(void *)a1;
- (void)setPpkConfiguration:(id)a3;
- (void)setProviderBundleIdentifier:(id)a3;
- (void)setServerCertificateCommonName:(NSString *)serverCertificateCommonName;
- (void)setServerCertificateIssuerCommonName:(NSString *)serverCertificateIssuerCommonName;
- (void)setStrictRevocationCheck:(BOOL)strictRevocationCheck;
- (void)setTunnelKind:(int64_t)a3;
- (void)setUseConfigurationAttributeInternalIPSubnet:(BOOL)useConfigurationAttributeInternalIPSubnet;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NEVPNProtocolIKEv2

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_childSecurityAssociationParametersArray, 0);
  objc_storeStrong((id *)&self->_IKESecurityAssociationParametersArray, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_ppkConfiguration, 0);
  objc_storeStrong((id *)&self->_childSecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_IKESecurityAssociationParameters, 0);
  objc_storeStrong((id *)&self->_serverCertificateCommonName, 0);

  objc_storeStrong((id *)&self->_serverCertificateIssuerCommonName, 0);
}

- (void)setDisableInitialContact:(BOOL)a3
{
  self->_disableInitialContact = a3;
}

- (BOOL)disableInitialContact
{
  return self->_disableInitialContact;
}

- (void)setTunnelKind:(int64_t)a3
{
  self->_tunnelKind = a3;
}

- (int64_t)tunnelKind
{
  return self->_tunnelKind;
}

- (void)setOpportunisticPFS:(BOOL)a3
{
  self->_opportunisticPFS = a3;
}

- (BOOL)opportunisticPFS
{
  return self->_opportunisticPFS;
}

- (void)setDisableMOBIKERetryOnWake:(int)a3
{
  self->_disableMOBIKERetryOnWake = a3;
}

- (int)disableMOBIKERetryOnWake
{
  return self->_disableMOBIKERetryOnWake;
}

- (void)setNatKeepAliveOffloadInterval:(int)a3
{
  self->_natKeepAliveOffloadInterval = a3;
}

- (int)natKeepAliveOffloadInterval
{
  return self->_natKeepAliveOffloadInterval;
}

- (void)setNatKeepAliveOffloadEnable:(int)a3
{
  self->_natKeepAliveOffloadEnable = a3;
}

- (int)natKeepAliveOffloadEnable
{
  return self->_natKeepAliveOffloadEnable;
}

- (void)setProviderBundleIdentifier:(id)a3
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setChildSecurityAssociationParametersArray:(id)a3
{
}

- (NSArray)childSecurityAssociationParametersArray
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setIKESecurityAssociationParametersArray:(id)a3
{
}

- (NSArray)IKESecurityAssociationParametersArray
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setPpkConfiguration:(id)a3
{
}

- (NEVPNIKEv2PPKConfiguration)ppkConfiguration
{
  return (NEVPNIKEv2PPKConfiguration *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMtu:(NSUInteger)mtu
{
  self->_mtu = mtu;
}

- (NSUInteger)mtu
{
  return self->_mtu;
}

- (void)setEnableFallback:(BOOL)enableFallback
{
  self->_enableFallback = enableFallback;
}

- (BOOL)enableFallback
{
  return self->_enableFallback;
}

- (void)setMaximumTLSVersion:(NEVPNIKEv2TLSVersion)maximumTLSVersion
{
  self->_maximumTLSVersion = maximumTLSVersion;
}

- (NEVPNIKEv2TLSVersion)maximumTLSVersion
{
  return self->_maximumTLSVersion;
}

- (void)setMinimumTLSVersion:(NEVPNIKEv2TLSVersion)minimumTLSVersion
{
  self->_minimumTLSVersion = minimumTLSVersion;
}

- (NEVPNIKEv2TLSVersion)minimumTLSVersion
{
  return self->_minimumTLSVersion;
}

- (void)setStrictRevocationCheck:(BOOL)strictRevocationCheck
{
  self->_strictRevocationCheck = strictRevocationCheck;
}

- (BOOL)strictRevocationCheck
{
  return self->_strictRevocationCheck;
}

- (void)setEnableRevocationCheck:(BOOL)enableRevocationCheck
{
  self->_enableRevocationCheck = enableRevocationCheck;
}

- (BOOL)enableRevocationCheck
{
  return self->_enableRevocationCheck;
}

- (void)setEnablePFS:(BOOL)enablePFS
{
  self->_enablePFS = enablePFS;
}

- (BOOL)enablePFS
{
  return self->_enablePFS;
}

- (void)setDisableRedirect:(BOOL)disableRedirect
{
  self->_disableRedirect = disableRedirect;
}

- (BOOL)disableRedirect
{
  return self->_disableRedirect;
}

- (void)setDisableMOBIKE:(BOOL)disableMOBIKE
{
  self->_disableMOBIKE = disableMOBIKE;
}

- (BOOL)disableMOBIKE
{
  return self->_disableMOBIKE;
}

- (NEVPNIKEv2SecurityAssociationParameters)childSecurityAssociationParameters
{
  return (NEVPNIKEv2SecurityAssociationParameters *)objc_getProperty(self, a2, 304, 1);
}

- (NEVPNIKEv2SecurityAssociationParameters)IKESecurityAssociationParameters
{
  return (NEVPNIKEv2SecurityAssociationParameters *)objc_getProperty(self, a2, 296, 1);
}

- (void)setUseConfigurationAttributeInternalIPSubnet:(BOOL)useConfigurationAttributeInternalIPSubnet
{
  self->_useConfigurationAttributeInternalIPSubnet = useConfigurationAttributeInternalIPSubnet;
}

- (BOOL)useConfigurationAttributeInternalIPSubnet
{
  return self->_useConfigurationAttributeInternalIPSubnet;
}

- (void)setCertificateType:(NEVPNIKEv2CertificateType)certificateType
{
  self->_certificateType = certificateType;
}

- (NEVPNIKEv2CertificateType)certificateType
{
  return self->_certificateType;
}

- (void)setServerCertificateCommonName:(NSString *)serverCertificateCommonName
{
}

- (NSString)serverCertificateCommonName
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setServerCertificateIssuerCommonName:(NSString *)serverCertificateIssuerCommonName
{
}

- (NSString)serverCertificateIssuerCommonName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setDeadPeerDetectionRate:(NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate
{
  self->_deadPeerDetectionRate = deadPeerDetectionRate;
}

- (NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate
{
  return self->_deadPeerDetectionRate;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolIKEv2;
  [(NEVPNProtocolIPSec *)&v10 removeKeychainItemsInDomain:a3 keepIdentity:a4];
  Property = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  v8 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v7, 32, 1);
  }
  id v9 = Property;

  if (v9 && [v9 domain] == a3) {
    [v9 setIdentifier:0];
  }
}

- (BOOL)needToUpdateKeychain
{
  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolIKEv2;
  if ([(NEVPNProtocolIPSec *)&v10 needToUpdateKeychain]) {
    return 1;
  }
  Property = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  v6 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v5, 32, 1);
  }
  id v7 = Property;

  if (v7)
  {
    v8 = [v7 data];
    BOOL v3 = [v8 length] != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNProtocolIKEv2;
  [(NEVPNProtocolIPSec *)&v17 syncWithKeychainInDomain:a3 configuration:v8 suffix:v9];
  Property = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  v12 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v11, 32, 1);
  }
  id v13 = Property;

  if (v13 && [v13 domain] == a3)
  {
    if (v9)
    {
      v14 = [v9 stringByAppendingString:@".PPK"];
    }
    else
    {
      v14 = @"PPK";
    }
    v15 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
    v16 = [v15 identifier];
    [v13 syncUsingConfiguration:v8 accountName:v16 passwordType:2 identifierSuffix:v14];
  }
}

- (id)copyLegacyDictionary
{
  v49.receiver = self;
  v49.super_class = (Class)NEVPNProtocolIKEv2;
  id v3 = [(NEVPNProtocolIPSec *)&v49 copyLegacyDictionary];
  if (!v3) {
    return v3;
  }
  if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate])
  {
    if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate] == NEVPNIKEv2DeadPeerDetectionRateLow)
    {
      v4 = kNEIKEv2DeadPeerDetectionRateLowValue;
    }
    else if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate] == NEVPNIKEv2DeadPeerDetectionRateMedium)
    {
      v4 = kNEIKEv2DeadPeerDetectionRateMediumValue;
    }
    else
    {
      if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate] != NEVPNIKEv2DeadPeerDetectionRateHigh) {
        goto LABEL_11;
      }
      v4 = kNEIKEv2DeadPeerDetectionRateHighValue;
    }
  }
  else
  {
    v4 = kNEIKEv2DeadPeerDetectionRateNoneValue;
  }
  [v3 setObject:*v4 forKeyedSubscript:@"DeadPeerDetectionRate"];
LABEL_11:
  v5 = [(NEVPNProtocolIKEv2 *)self serverCertificateIssuerCommonName];

  if (v5)
  {
    v6 = [(NEVPNProtocolIKEv2 *)self serverCertificateIssuerCommonName];
    [v3 setObject:v6 forKeyedSubscript:@"ServerCertificateIssuerCommonName"];
  }
  id v7 = [(NEVPNProtocolIKEv2 *)self serverCertificateCommonName];

  if (v7)
  {
    id v8 = [(NEVPNProtocolIKEv2 *)self serverCertificateCommonName];
    [v3 setObject:v8 forKeyedSubscript:@"ServerCertificateCommonName"];
  }
  id v9 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParameters];
  id v10 = -[NEVPNIKEv2SecurityAssociationParameters copyDictionary](v9);
  [v3 setObject:v10 forKeyedSubscript:@"IKESecurityAssociationParameters"];

  v11 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParameters];
  id v12 = -[NEVPNIKEv2SecurityAssociationParameters copyDictionary](v11);
  [v3 setObject:v12 forKeyedSubscript:@"ChildSecurityAssociationParameters"];

  if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeRSA)
  {
    id v13 = kNEIKEv2CertificateTypeRSAValue;
  }
  else if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeECDSA256)
  {
    id v13 = kNEIKEv2CertificateTypeECDSA256Value;
  }
  else if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeECDSA384)
  {
    id v13 = kNEIKEv2CertificateTypeECDSA384Value;
  }
  else if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeECDSA521)
  {
    id v13 = kNEIKEv2CertificateTypeECDSA521Value;
  }
  else
  {
    if ([(NEVPNProtocolIKEv2 *)self certificateType] != NEVPNIKEv2CertificateTypeEd25519) {
      goto LABEL_26;
    }
    id v13 = kNEIKEv2CertificateTypeEd25519Value;
  }
  [v3 setObject:*v13 forKeyedSubscript:@"CertificateType"];
LABEL_26:
  if ([(NEVPNProtocolIPSec *)self useExtendedAuthentication]) {
    v14 = &unk_1EF08D270;
  }
  else {
    v14 = &unk_1EF08D288;
  }
  [v3 setObject:v14 forKeyedSubscript:@"ExtendedAuthEnabled"];
  if ([(NEVPNProtocolIKEv2 *)self useConfigurationAttributeInternalIPSubnet])
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"));
    [v3 setObject:v15 forKeyedSubscript:@"UseConfigurationAttributeInternalIPSubnet"];
  }
  if ([(NEVPNProtocolIKEv2 *)self disableMOBIKE])
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"));
    [v3 setObject:v16 forKeyedSubscript:@"DisableMOBIKE"];
  }
  if ([(NEVPNProtocolIKEv2 *)self disableRedirect])
  {
    objc_super v17 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"));
    [v3 setObject:v17 forKeyedSubscript:@"DisableRedirect"];
  }
  if ([(NEVPNProtocolIKEv2 *)self enablePFS])
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"));
    [v3 setObject:v18 forKeyedSubscript:@"EnablePFS"];
  }
  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"));
  [v3 setObject:v19 forKeyedSubscript:@"NATKeepAliveOffloadEnable"];

  if ([(NEVPNProtocolIKEv2 *)self natKeepAliveOffloadInterval])
  {
    v20 = objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"));
    [v3 setObject:v20 forKeyedSubscript:@"NATKeepAliveInterval"];
  }
  if ([(NEVPNProtocolIKEv2 *)self disableMOBIKERetryOnWake])
  {
    v21 = objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"));
    [v3 setObject:v21 forKeyedSubscript:@"DisableMOBIKERetryOnWake"];
  }
  if ([(NEVPNProtocolIKEv2 *)self enableRevocationCheck])
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"));
    [v3 setObject:v22 forKeyedSubscript:@"EnableCertificateRevocationCheck"];

    if ([(NEVPNProtocolIKEv2 *)self strictRevocationCheck])
    {
      v23 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"));
      [v3 setObject:v23 forKeyedSubscript:@"StrictCertificateRevocationCheck"];
    }
  }
  if ([(NEVPNProtocolIKEv2 *)self minimumTLSVersion] == NEVPNIKEv2TLSVersion1_0)
  {
    v24 = kNEIKEv2TLSVersion1_0Value;
  }
  else if ([(NEVPNProtocolIKEv2 *)self minimumTLSVersion] == NEVPNIKEv2TLSVersion1_1)
  {
    v24 = kNEIKEv2TLSVersion1_1Value;
  }
  else
  {
    if ([(NEVPNProtocolIKEv2 *)self minimumTLSVersion] != NEVPNIKEv2TLSVersion1_2) {
      goto LABEL_51;
    }
    v24 = kNEIKEv2TLSVersion1_2Value;
  }
  [v3 setObject:*v24 forKeyedSubscript:@"TLSMinimumVersion"];
LABEL_51:
  if ([(NEVPNProtocolIKEv2 *)self maximumTLSVersion] == NEVPNIKEv2TLSVersion1_0)
  {
    v25 = kNEIKEv2TLSVersion1_0Value;
LABEL_57:
    [v3 setObject:*v25 forKeyedSubscript:@"TLSMaximumVersion"];
    goto LABEL_58;
  }
  if ([(NEVPNProtocolIKEv2 *)self maximumTLSVersion] == NEVPNIKEv2TLSVersion1_1)
  {
    v25 = kNEIKEv2TLSVersion1_1Value;
    goto LABEL_57;
  }
  if ([(NEVPNProtocolIKEv2 *)self maximumTLSVersion] == NEVPNIKEv2TLSVersion1_2)
  {
    v25 = kNEIKEv2TLSVersion1_2Value;
    goto LABEL_57;
  }
LABEL_58:
  if ([(NEVPNProtocolIKEv2 *)self enableFallback])
  {
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"));
    [v3 setObject:v26 forKeyedSubscript:@"EnableFallback"];
  }
  if ([(NEVPNProtocolIKEv2 *)self mtu])
  {
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NEVPNProtocolIKEv2 mtu](self, "mtu"));
    [v3 setObject:v27 forKeyedSubscript:@"MTU"];
  }
  v28 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];

  if (v28)
  {
    Property = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
    v31 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v30, 32, 1);
    }
    v32 = [Property data];

    if (v32)
    {
      v33 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
      v35 = v33;
      if (v33) {
        v33 = objc_getProperty(v33, v34, 32, 1);
      }
      v36 = [v33 data];
      [v3 setObject:v36 forKeyedSubscript:@"PPK"];
    }
    v37 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
    v38 = [v37 identifier];
    v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"PPKIdentifier"];

    v40 = NSNumber;
    v41 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
    v42 = objc_msgSend(v40, "numberWithBool:", objc_msgSend(v41, "isMandatory"));
    [v3 setObject:v42 forKeyedSubscript:@"PPKMandatory"];

    v43 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
    v44 = [v43 keychainReference];

    if (v44)
    {
      v45 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
      v46 = [v45 keychainReference];
      v47 = (void *)[v46 copy];
      [v3 setObject:v47 forKeyedSubscript:@"PPKReference"];
    }
  }
  return v3;
}

- (void)setDefaultsForUIConfiguration
{
  v16[4] = *MEMORY[0x1E4F143B8];
  IKESecurityAssociationParameters = self->_IKESecurityAssociationParameters;
  self->_IKESecurityAssociationParameters = 0;

  childSecurityAssociationParameters = self->_childSecurityAssociationParameters;
  self->_childSecurityAssociationParameters = 0;

  v5 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  [(NEVPNIKEv2SecurityAssociationParameters *)v5 setEncryptionAlgorithm:6];
  [(NEVPNIKEv2SecurityAssociationParameters *)v5 setIntegrityAlgorithm:3];
  [(NEVPNIKEv2SecurityAssociationParameters *)v5 setDiffieHellmanGroup:19];
  [(NEVPNIKEv2SecurityAssociationParameters *)v5 setLifetimeMinutes:60];
  v6 = (void *)[(NEVPNIKEv2SecurityAssociationParameters *)v5 copy];
  [v6 setLifetimeMinutes:30];
  id v7 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  [(NEVPNIKEv2SecurityAssociationParameters *)v7 setEncryptionAlgorithm:6];
  [(NEVPNIKEv2SecurityAssociationParameters *)v7 setIntegrityAlgorithm:3];
  [(NEVPNIKEv2SecurityAssociationParameters *)v7 setDiffieHellmanGroup:14];
  [(NEVPNIKEv2SecurityAssociationParameters *)v7 setLifetimeMinutes:60];
  id v8 = (void *)[(NEVPNIKEv2SecurityAssociationParameters *)v7 copy];
  [v8 setLifetimeMinutes:30];
  id v9 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  [(NEVPNIKEv2SecurityAssociationParameters *)v9 setEncryptionAlgorithm:4];
  [(NEVPNIKEv2SecurityAssociationParameters *)v9 setIntegrityAlgorithm:3];
  [(NEVPNIKEv2SecurityAssociationParameters *)v9 setDiffieHellmanGroup:19];
  [(NEVPNIKEv2SecurityAssociationParameters *)v9 setLifetimeMinutes:60];
  v14 = (void *)[(NEVPNIKEv2SecurityAssociationParameters *)v9 copy];
  [v14 setLifetimeMinutes:30];
  id v10 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
  [(NEVPNIKEv2SecurityAssociationParameters *)v10 setEncryptionAlgorithm:4];
  [(NEVPNIKEv2SecurityAssociationParameters *)v10 setIntegrityAlgorithm:3];
  [(NEVPNIKEv2SecurityAssociationParameters *)v10 setDiffieHellmanGroup:14];
  [(NEVPNIKEv2SecurityAssociationParameters *)v10 setLifetimeMinutes:60];
  v11 = (void *)[(NEVPNIKEv2SecurityAssociationParameters *)v10 copy];
  [v11 setLifetimeMinutes:30];
  v16[0] = v5;
  v16[1] = v7;
  v16[2] = v9;
  v16[3] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  [(NEVPNProtocolIKEv2 *)self setIKESecurityAssociationParametersArray:v12];

  v15[0] = v6;
  v15[1] = v8;
  v15[2] = v14;
  v15[3] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  [(NEVPNProtocolIKEv2 *)self setChildSecurityAssociationParametersArray:v13];

  [(NEVPNProtocolIKEv2 *)self setEnablePFS:1];
  [(NEVPNProtocolIKEv2 *)self setOpportunisticPFS:1];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v28.receiver = self;
  v28.super_class = (Class)NEVPNProtocolIKEv2;
  id v8 = [(NEVPNProtocolIPSec *)&v28 descriptionWithIndent:v5 options:a4];
  id v9 = (void *)[v7 initWithString:v8];

  unint64_t v10 = a4 & 0xFFFFFFFFFFFFFFF7;
  if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate])
  {
    if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate] == NEVPNIKEv2DeadPeerDetectionRateLow)
    {
      unint64_t v11 = a4 | 8;
      id v12 = @"low";
    }
    else if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate] == NEVPNIKEv2DeadPeerDetectionRateMedium)
    {
      unint64_t v11 = a4 | 8;
      id v12 = @"medium";
    }
    else
    {
      unint64_t v11 = a4 | 8;
      if ([(NEVPNProtocolIKEv2 *)self deadPeerDetectionRate] != NEVPNIKEv2DeadPeerDetectionRateHigh) {
        goto LABEL_10;
      }
      id v12 = @"high";
    }
  }
  else
  {
    unint64_t v11 = a4 | 8;
    id v12 = @"none";
  }
  [v9 appendPrettyObject:v12 withName:@"deadPeerDetectionRate" andIndent:v5 options:v11];
LABEL_10:
  id v13 = [(NEVPNProtocolIKEv2 *)self serverCertificateIssuerCommonName];
  unint64_t v14 = a4 | 9;
  [v9 appendPrettyObject:v13 withName:@"serverCertificateIssuer" andIndent:v5 options:v14];

  v15 = [(NEVPNProtocolIKEv2 *)self serverCertificateCommonName];
  [v9 appendPrettyObject:v15 withName:@"serverCertificateCommonName" andIndent:v5 options:v14];

  v16 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParameters];
  [v9 appendPrettyObject:v16 withName:@"IKESAParameters" andIndent:v5 options:v11];

  objc_super v17 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParameters];
  [v9 appendPrettyObject:v17 withName:@"childSAParameters" andIndent:v5 options:v11];

  v18 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParametersArray];
  [v9 appendPrettyObject:v18 withName:@"IKESAParametersArray" andIndent:v5 options:v10];

  v19 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParametersArray];
  [v9 appendPrettyObject:v19 withName:@"childSAParametersArray" andIndent:v5 options:v10];

  if (self) {
    BOOL wakeForRekey = self->_wakeForRekey;
  }
  else {
    BOOL wakeForRekey = 0;
  }
  [v9 appendPrettyBOOL:wakeForRekey withName:@"wakeForRekey" andIndent:v5 options:v10];
  if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeRSA)
  {
    v21 = @"RSA";
  }
  else if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeECDSA256)
  {
    v21 = @"ECDSA256";
  }
  else if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeECDSA384)
  {
    v21 = @"ECDSA384";
  }
  else if ([(NEVPNProtocolIKEv2 *)self certificateType] == NEVPNIKEv2CertificateTypeECDSA521)
  {
    v21 = @"ECDSA521";
  }
  else
  {
    if ([(NEVPNProtocolIKEv2 *)self certificateType] != NEVPNIKEv2CertificateTypeEd25519) {
      goto LABEL_23;
    }
    v21 = @"Ed25519";
  }
  [v9 appendPrettyObject:v21 withName:@"certificateType" andIndent:v5 options:v11];
LABEL_23:
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"), @"useConfigurationAttributeInternalIPSubnet", v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"), @"disableMOBIKE", v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"), @"disableRedirect", v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"), @"enabledPFS", v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS"), @"opportunisticPFS", v5, v11);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"), @"natKeepAliveOffloadEnable", v5, v10);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"), @"DisableMOBIKERetryOnWake", v5, v10);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"), @"natKeepAliveOffloadInterval", v5, v10);
  v22 = [(NEVPNProtocolIKEv2 *)self providerBundleIdentifier];
  [v9 appendPrettyObject:v22 withName:@"providerBundleIdentifier" andIndent:v5 options:v10];

  v23 = [(NEVPNProtocolIKEv2 *)self pluginType];
  [v9 appendPrettyObject:v23 withName:@"pluginType" andIndent:v5 options:v10];

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"), @"enableRevocationCheck", v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"), @"strictRevocationCheck", v5, v11);
  if ([(NEVPNProtocolIKEv2 *)self minimumTLSVersion] == NEVPNIKEv2TLSVersion1_0)
  {
    v24 = @"1.0";
  }
  else if ([(NEVPNProtocolIKEv2 *)self minimumTLSVersion] == NEVPNIKEv2TLSVersion1_1)
  {
    v24 = @"1.1";
  }
  else
  {
    if ([(NEVPNProtocolIKEv2 *)self minimumTLSVersion] != NEVPNIKEv2TLSVersion1_2) {
      goto LABEL_30;
    }
    v24 = @"1.2";
  }
  [v9 appendPrettyObject:v24 withName:@"minimumTLSVersion" andIndent:v5 options:v11];
LABEL_30:
  if ([(NEVPNProtocolIKEv2 *)self maximumTLSVersion] == NEVPNIKEv2TLSVersion1_0)
  {
    v25 = @"1.0";
  }
  else if ([(NEVPNProtocolIKEv2 *)self maximumTLSVersion] == NEVPNIKEv2TLSVersion1_1)
  {
    v25 = @"1.1";
  }
  else
  {
    if ([(NEVPNProtocolIKEv2 *)self maximumTLSVersion] != NEVPNIKEv2TLSVersion1_2) {
      goto LABEL_37;
    }
    v25 = @"1.2";
  }
  [v9 appendPrettyObject:v25 withName:@"maximumTLSVersion" andIndent:v5 options:v11];
LABEL_37:
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"), @"enableFallback", v5, v11);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", (int)-[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind"), @"tunnelKind", v5, v11);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact"), @"disableInitialContact", v5, v11);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", (int)-[NEVPNProtocolIKEv2 mtu](self, "mtu"), @"MTU", v5, v11);
  v26 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  [v9 appendPrettyObject:v26 withName:@"PPK" andIndent:v5 options:v11];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NEVPNProtocolIKEv2;
  unsigned int v5 = [(NEVPNProtocolIPSec *)&v38 checkValidityAndCollectErrors:v4];
  v6 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParametersArray];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParametersArray];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          if (![*(id *)(*((void *)&v34 + 1) + 8 * i) checkValidityAndCollectErrors:v4]) {
            LOBYTE(v5) = 0;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v10);
    }

    int v13 = v5 & 1;
  }
  else
  {
    unint64_t v14 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParameters];
    int v15 = [v14 checkValidityAndCollectErrors:v4];

    int v13 = v15 & v5;
  }
  v16 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParametersArray];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v18 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParametersArray];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          v13 &= [*(id *)(*((void *)&v30 + 1) + 8 * j) checkValidityAndCollectErrors:v4];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v20);
    }
  }
  else
  {
    v23 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParameters];
    uint64_t v24 = [v23 checkValidityAndCollectErrors:v4];

    LOBYTE(v13) = v24 & v13;
  }
  uint64_t v25 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
    char v28 = [v27 checkValidityAndCollectErrors:v4];

    LOBYTE(v13) = v28 & v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)NEVPNProtocolIKEv2;
  id v4 = [(NEVPNProtocolIPSec *)&v31 copyWithZone:a3];
  unsigned int v5 = [(NEVPNProtocolIKEv2 *)self pluginType];
  -[NEVPNProtocolIKEv2 setPluginType:](v4, v5);

  objc_msgSend(v4, "setDeadPeerDetectionRate:", -[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"));
  v6 = [(NEVPNProtocolIKEv2 *)self serverCertificateIssuerCommonName];
  [v4 setServerCertificateIssuerCommonName:v6];

  uint64_t v7 = [(NEVPNProtocolIKEv2 *)self serverCertificateCommonName];
  [v4 setServerCertificateCommonName:v7];

  id v8 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParameters];
  uint64_t v9 = [v8 copy];
  uint64_t v10 = (void *)v4[37];
  v4[37] = v9;

  uint64_t v11 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParameters];
  uint64_t v12 = [v11 copy];
  int v13 = (void *)v4[38];
  v4[38] = v12;

  unint64_t v14 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParametersArray];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C978]);
    v16 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParametersArray];
    uint64_t v17 = [v15 initWithArray:v16 copyItems:1];
    v18 = (void *)v4[44];
    v4[44] = v17;
  }
  uint64_t v19 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParametersArray];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v21 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParametersArray];
    uint64_t v22 = [v20 initWithArray:v21 copyItems:1];
    v23 = (void *)v4[45];
    v4[45] = v22;
  }
  if (self) {
    BOOL wakeForRekey = self->_wakeForRekey;
  }
  else {
    BOOL wakeForRekey = 0;
  }
  *((unsigned char *)v4 + 247) = wakeForRekey;
  v4[36] = [(NEVPNProtocolIKEv2 *)self certificateType];
  *((unsigned char *)v4 + 240) = [(NEVPNProtocolIKEv2 *)self useConfigurationAttributeInternalIPSubnet];
  *((unsigned char *)v4 + 241) = [(NEVPNProtocolIKEv2 *)self disableMOBIKE];
  *((unsigned char *)v4 + 242) = [(NEVPNProtocolIKEv2 *)self disableRedirect];
  *((unsigned char *)v4 + 243) = [(NEVPNProtocolIKEv2 *)self enablePFS];
  *((unsigned char *)v4 + 248) = [(NEVPNProtocolIKEv2 *)self opportunisticPFS];
  *((_DWORD *)v4 + 63) = [(NEVPNProtocolIKEv2 *)self natKeepAliveOffloadEnable];
  *((_DWORD *)v4 + 64) = [(NEVPNProtocolIKEv2 *)self natKeepAliveOffloadInterval];
  *((_DWORD *)v4 + 65) = [(NEVPNProtocolIKEv2 *)self disableMOBIKERetryOnWake];
  uint64_t v25 = [(NEVPNProtocolIKEv2 *)self providerBundleIdentifier];
  v26 = (void *)v4[46];
  v4[46] = v25;

  *((unsigned char *)v4 + 244) = [(NEVPNProtocolIKEv2 *)self enableRevocationCheck];
  *((unsigned char *)v4 + 245) = [(NEVPNProtocolIKEv2 *)self strictRevocationCheck];
  v4[39] = [(NEVPNProtocolIKEv2 *)self minimumTLSVersion];
  v4[40] = [(NEVPNProtocolIKEv2 *)self maximumTLSVersion];
  v4[47] = [(NEVPNProtocolIKEv2 *)self tunnelKind];
  *((unsigned char *)v4 + 249) = [(NEVPNProtocolIKEv2 *)self disableInitialContact];
  *((unsigned char *)v4 + 246) = [(NEVPNProtocolIKEv2 *)self enableFallback];
  v4[41] = [(NEVPNProtocolIKEv2 *)self mtu];
  v27 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  uint64_t v28 = [v27 copy];
  v29 = (void *)v4[42];
  v4[42] = v28;

  return v4;
}

- (void)setPluginType:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v14 = v3;
    uint64_t v4 = [v3 copy];
    unsigned int v5 = (void *)a1[43];
    a1[43] = v4;

    uint64_t v7 = a1[10];
    if (v14)
    {
      if (v7 != 1)
      {
        a1[10] = 1;
        id v8 = objc_getProperty(a1, v6, 96, 1);
        [v8 setDomain:1];

        uint64_t v9 = [a1 passwordKeychainItem];
        [v9 setDomain:1];
      }
      uint64_t v10 = @"com.apple.managed.vpn.shared";
      uint64_t v11 = a1;
    }
    else
    {
      if (v7)
      {
        a1[10] = 0;
        id v12 = objc_getProperty(a1, v6, 96, 1);
        [v12 setDomain:0];

        int v13 = [a1 passwordKeychainItem];
        [v13 setDomain:0];
      }
      uint64_t v11 = a1;
      uint64_t v10 = 0;
    }
    objc_setProperty_atomic(v11, v6, v10, 88);
    id v3 = v14;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEVPNProtocolIKEv2;
  [(NEVPNProtocolIPSec *)&v15 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"), @"DeadPeerDetectionRate");
  unsigned int v5 = [(NEVPNProtocolIKEv2 *)self serverCertificateIssuerCommonName];
  [v4 encodeObject:v5 forKey:@"ServerCertificateIssuer"];

  v6 = [(NEVPNProtocolIKEv2 *)self serverCertificateCommonName];
  [v4 encodeObject:v6 forKey:@"ServerCertificateCommonName"];

  uint64_t v7 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParameters];
  [v4 encodeObject:v7 forKey:@"IKESAParameters"];

  id v8 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParameters];
  [v4 encodeObject:v8 forKey:@"ChildSAParameters"];

  uint64_t v9 = [(NEVPNProtocolIKEv2 *)self IKESecurityAssociationParametersArray];
  [v4 encodeObject:v9 forKey:@"IKESAParametersArray"];

  uint64_t v10 = [(NEVPNProtocolIKEv2 *)self childSecurityAssociationParametersArray];
  [v4 encodeObject:v10 forKey:@"ChildSAParametersArray"];

  if (self) {
    BOOL wakeForRekey = self->_wakeForRekey;
  }
  else {
    BOOL wakeForRekey = 0;
  }
  [v4 encodeBool:wakeForRekey forKey:@"WakeForRekey"];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 certificateType](self, "certificateType"), @"CertificateType");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"), @"UseConfigurationAttributeInternalIPSubnet");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"), @"DisableMOBIKE");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"), @"DisableRedirect");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"), @"EnablePFS");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS"), @"OpportunisticPFS");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"), @"NATKeepAliveOffloadEnable");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"), @"NATKeepAliveOffloadInterval");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"), @"DisableMOBIKERetryOnWake");
  id v12 = [(NEVPNProtocolIKEv2 *)self providerBundleIdentifier];
  [v4 encodeObject:v12 forKey:@"ProviderBundleIdentifier"];

  int v13 = [(NEVPNProtocolIKEv2 *)self pluginType];
  [v4 encodeObject:v13 forKey:@"PluginType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"), @"EnableRevocationCheck");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"), @"StrictRevocationCheck");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion"), @"MinimumTLSVersion");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion"), @"MaximumTLSVersion");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind"), @"TunnelType");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact"), @"DisableInitialContact");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"), @"EnableFallback");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 mtu](self, "mtu"), @"MTU");
  id v14 = [(NEVPNProtocolIKEv2 *)self ppkConfiguration];
  [v4 encodeObject:v14 forKey:@"PPKConfiguration"];
}

- (NEVPNProtocolIKEv2)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NEVPNProtocolIKEv2;
  unsigned int v5 = [(NEVPNProtocolIPSec *)&v31 initWithCoder:v4];
  if (v5)
  {
    v5->_deadPeerDetectionRate = (int)[v4 decodeInt32ForKey:@"DeadPeerDetectionRate"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerCertificateIssuer"];
    serverCertificateIssuerCommonName = v5->_serverCertificateIssuerCommonName;
    v5->_serverCertificateIssuerCommonName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerCertificateCommonName"];
    serverCertificateCommonName = v5->_serverCertificateCommonName;
    v5->_serverCertificateCommonName = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"IKESAParametersArray"];
    IKESecurityAssociationParametersArray = v5->_IKESecurityAssociationParametersArray;
    v5->_IKESecurityAssociationParametersArray = (NSArray *)v13;

    if (v5->_IKESecurityAssociationParametersArray)
    {
      IKESecurityAssociationParameters = v5->_IKESecurityAssociationParameters;
      v5->_IKESecurityAssociationParameters = 0;
    }
    else
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IKESAParameters"];
      IKESecurityAssociationParameters = v5->_IKESecurityAssociationParameters;
      v5->_IKESecurityAssociationParameters = (NEVPNIKEv2SecurityAssociationParameters *)v16;
    }

    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"ChildSAParametersArray"];
    childSecurityAssociationParametersArray = v5->_childSecurityAssociationParametersArray;
    v5->_childSecurityAssociationParametersArray = (NSArray *)v20;

    if (v5->_childSecurityAssociationParametersArray)
    {
      childSecurityAssociationParameters = v5->_childSecurityAssociationParameters;
      v5->_childSecurityAssociationParameters = 0;
    }
    else
    {
      uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ChildSAParameters"];
      childSecurityAssociationParameters = v5->_childSecurityAssociationParameters;
      v5->_childSecurityAssociationParameters = (NEVPNIKEv2SecurityAssociationParameters *)v23;
    }

    v5->_BOOL wakeForRekey = [v4 decodeBoolForKey:@"WakeForRekey"];
    v5->_certificateType = (int)[v4 decodeInt32ForKey:@"CertificateType"];
    v5->_useConfigurationAttributeInternalIPSubnet = [v4 decodeBoolForKey:@"UseConfigurationAttributeInternalIPSubnet"];
    v5->_disableMOBIKE = [v4 decodeBoolForKey:@"DisableMOBIKE"];
    v5->_disableRedirect = [v4 decodeBoolForKey:@"DisableRedirect"];
    v5->_enablePFS = [v4 decodeBoolForKey:@"EnablePFS"];
    v5->_opportunisticPFS = [v4 decodeBoolForKey:@"OpportunisticPFS"];
    v5->_natKeepAliveOffloadEnable = [v4 decodeInt32ForKey:@"NATKeepAliveOffloadEnable"];
    v5->_natKeepAliveOffloadInterval = [v4 decodeInt32ForKey:@"NATKeepAliveOffloadInterval"];
    v5->_disableMOBIKERetryOnWake = [v4 decodeInt32ForKey:@"DisableMOBIKERetryOnWake"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v26;

    v5->_enableRevocationCheck = [v4 decodeBoolForKey:@"EnableRevocationCheck"];
    v5->_strictRevocationCheck = [v4 decodeBoolForKey:@"StrictRevocationCheck"];
    v5->_minimumTLSVersion = (int)[v4 decodeInt32ForKey:@"MinimumTLSVersion"];
    v5->_maximumTLSVersion = (int)[v4 decodeInt32ForKey:@"MaximumTLSVersion"];
    v5->_tunnelKind = (int)[v4 decodeInt32ForKey:@"TunnelType"];
    v5->_disableInitialContact = [v4 decodeBoolForKey:@"DisableInitialContact"];
    v5->_enableFallback = [v4 decodeBoolForKey:@"EnableFallback"];
    v5->_mtu = (int)[v4 decodeInt32ForKey:@"MTU"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKConfiguration"];
    ppkConfiguration = v5->_ppkConfiguration;
    v5->_ppkConfiguration = (NEVPNIKEv2PPKConfiguration *)v28;
  }
  return v5;
}

- (NEVPNProtocolIKEv2)init
{
  return (NEVPNProtocolIKEv2 *)-[NEVPNProtocolIKEv2 initWithPluginType:](self, 0);
}

- (void)initWithPluginType:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)NEVPNProtocolIKEv2;
    id v4 = objc_msgSendSuper2(&v11, sel_initWithType_, 5);
    a1 = v4;
    if (v4)
    {
      -[NEVPNProtocolIKEv2 setPluginType:](v4, v3);
      a1[33] = 2;
      unsigned int v5 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
      uint64_t v6 = (void *)a1[37];
      a1[37] = v5;

      uint64_t v7 = objc_alloc_init(NEVPNIKEv2SecurityAssociationParameters);
      uint64_t v8 = (void *)a1[38];
      a1[38] = v7;

      [(id)a1[37] setLifetimeMinutes:60];
      [(id)a1[38] setLifetimeMinutes:30];
      *((unsigned char *)a1 + 247) = 0;
      a1[36] = 1;
      *((unsigned char *)a1 + 240) = 0;
      *((unsigned char *)a1 + 241) = 0;
      *((unsigned char *)a1 + 242) = 0;
      *((unsigned char *)a1 + 243) = 0;
      *((unsigned char *)a1 + 248) = 0;
      *((_DWORD *)a1 + 63) = 0;
      *((_DWORD *)a1 + 64) = 0;
      uint64_t v9 = (void *)a1[46];
      a1[46] = 0;

      *((_DWORD *)a1 + 65) = 0;
      [a1 setDisconnectOnWake:0];
      [a1 setUseExtendedAuthentication:0];
      a1[47] = 1;
      *((unsigned char *)a1 + 249) = 0;
      *((unsigned char *)a1 + 246) = 0;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end