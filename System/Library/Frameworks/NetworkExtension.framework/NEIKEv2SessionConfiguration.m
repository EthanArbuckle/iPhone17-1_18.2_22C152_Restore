@interface NEIKEv2SessionConfiguration
- (BOOL)blackholeDetectionEnabled;
- (BOOL)deadPeerDetectionEnabled;
- (BOOL)disableRemoteCertificateValidation;
- (BOOL)enableCertificateRevocationCheck;
- (BOOL)idleTimeoutEnabled;
- (BOOL)initialContactDisabled;
- (BOOL)localCertificateIsModernSystem;
- (BOOL)natTraversalKeepaliveDisabled;
- (BOOL)natTraversalKeepaliveEnabled;
- (BOOL)natTraversalKeepaliveOffloadEnabled;
- (BOOL)negotiateMOBIKE;
- (BOOL)ppkMandatory;
- (BOOL)strictCertificateRevocationCheck;
- (NEIKEv2AuthenticationProtocol)authenticationProtocol;
- (NEIKEv2AuthenticationProtocol)remoteAuthentication;
- (NEIKEv2ConfigurationMessage)configurationReply;
- (NEIKEv2ConfigurationMessage)configurationRequest;
- (NEIKEv2Identifier)localIdentifier;
- (NEIKEv2Identifier)remoteIdentifier;
- (NEIKEv2SessionConfiguration)init;
- (NSArray)additionalMOBIKEAddresses;
- (NSArray)customIKEAuthPayloads;
- (NSArray)customIKEAuthPrivateNotifies;
- (NSArray)customIKEAuthVendorPayloads;
- (NSArray)remoteCertificateAuthorityReferences;
- (NSData)localCertificateKeyReference;
- (NSData)localCertificateReference;
- (NSData)localEncryptedEAPIdentity;
- (NSData)passwordReference;
- (NSData)ppk;
- (NSData)ppkID;
- (NSData)ppkReference;
- (NSData)remoteCertificateAuthorityHash;
- (NSData)sharedSecret;
- (NSData)sharedSecretReference;
- (NSNumber)pduSessionID;
- (NSString)IMEI;
- (NSString)IMEISV;
- (NSString)localCertificateName;
- (NSString)localPrivateEAPIdentity;
- (NSString)password;
- (NSString)remoteCertificateAuthorityName;
- (NSString)remoteCertificateHostname;
- (NSString)tlsMaximumVersion;
- (NSString)tlsMinimumVersion;
- (NSString)username;
- (__SecKey)localPrivateKeyRef;
- (__SecKey)remotePublicKeyRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)deadPeerDetectionInterval;
- (unint64_t)deadPeerDetectionReceiveIntervalTriggerReporting;
- (unint64_t)deadPeerDetectionRetryIntervalMilliseconds;
- (unint64_t)idleTimeoutSeconds;
- (unint64_t)natTraversalKeepaliveInterval;
- (unint64_t)natTraversalKeepaliveOffloadInterval;
- (unint64_t)ppkIDType;
- (unsigned)deadPeerDetectionMaxRetryCount;
- (unsigned)deadPeerDetectionMaxRetryCountBeforeReporting;
- (unsigned)deadPeerDetectionReceiveMaxShortDPDBeforeReporting;
- (void)copyRemoteAuthKey;
- (void)dealloc;
- (void)setAdditionalMOBIKEAddresses:(id)a3;
- (void)setAuthenticationProtocol:(id)a3;
- (void)setBlackholeDetectionEnabled:(BOOL)a3;
- (void)setConfigurationReply:(id)a3;
- (void)setConfigurationRequest:(id)a3;
- (void)setCustomIKEAuthPayloads:(id)a3;
- (void)setCustomIKEAuthPrivateNotifies:(id)a3;
- (void)setCustomIKEAuthVendorPayloads:(id)a3;
- (void)setDeadPeerDetectionEnabled:(BOOL)a3;
- (void)setDeadPeerDetectionInterval:(unint64_t)a3;
- (void)setDeadPeerDetectionMaxRetryCount:(unsigned int)a3;
- (void)setDeadPeerDetectionMaxRetryCountBeforeReporting:(unsigned int)a3;
- (void)setDeadPeerDetectionReceiveIntervalTriggerReporting:(unint64_t)a3;
- (void)setDeadPeerDetectionReceiveMaxShortDPDBeforeReporting:(unsigned int)a3;
- (void)setDeadPeerDetectionRetryIntervalMilliseconds:(unint64_t)a3;
- (void)setDisableRemoteCertificateValidation:(BOOL)a3;
- (void)setEnableCertificateRevocationCheck:(BOOL)a3;
- (void)setIMEI:(id)a3;
- (void)setIMEISV:(id)a3;
- (void)setIdleTimeoutEnabled:(BOOL)a3;
- (void)setIdleTimeoutSeconds:(unint64_t)a3;
- (void)setInitialContactDisabled:(BOOL)a3;
- (void)setLocalCertificateIsModernSystem:(BOOL)a3;
- (void)setLocalCertificateKeyReference:(id)a3;
- (void)setLocalCertificateName:(id)a3;
- (void)setLocalCertificateReference:(id)a3;
- (void)setLocalEncryptedEAPIdentity:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setLocalPrivateEAPIdentity:(id)a3;
- (void)setLocalPrivateKeyRef:(__SecKey *)a3;
- (void)setNatTraversalKeepaliveDisabled:(BOOL)a3;
- (void)setNatTraversalKeepaliveEnabled:(BOOL)a3;
- (void)setNatTraversalKeepaliveInterval:(unint64_t)a3;
- (void)setNatTraversalKeepaliveOffloadEnabled:(BOOL)a3;
- (void)setNatTraversalKeepaliveOffloadInterval:(unint64_t)a3;
- (void)setNegotiateMOBIKE:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordReference:(id)a3;
- (void)setPduSessionID:(id)a3;
- (void)setPpk:(id)a3;
- (void)setPpkID:(id)a3;
- (void)setPpkIDType:(unint64_t)a3;
- (void)setPpkMandatory:(BOOL)a3;
- (void)setPpkReference:(id)a3;
- (void)setRemoteAuthentication:(id)a3;
- (void)setRemoteCertificateAuthorityHash:(id)a3;
- (void)setRemoteCertificateAuthorityName:(id)a3;
- (void)setRemoteCertificateAuthorityReferences:(id)a3;
- (void)setRemoteCertificateHostname:(id)a3;
- (void)setRemoteIdentifier:(id)a3;
- (void)setRemotePublicKeyRef:(__SecKey *)a3;
- (void)setSharedSecret:(id)a3;
- (void)setSharedSecretReference:(id)a3;
- (void)setStrictCertificateRevocationCheck:(BOOL)a3;
- (void)setTlsMaximumVersion:(id)a3;
- (void)setTlsMinimumVersion:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation NEIKEv2SessionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppkID, 0);
  objc_storeStrong((id *)&self->_ppkReference, 0);
  objc_storeStrong((id *)&self->_ppk, 0);
  objc_storeStrong((id *)&self->_IMEISV, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_pduSessionID, 0);
  objc_storeStrong((id *)&self->_customIKEAuthPrivateNotifies, 0);
  objc_storeStrong((id *)&self->_customIKEAuthVendorPayloads, 0);
  objc_storeStrong((id *)&self->_customIKEAuthPayloads, 0);
  objc_storeStrong((id *)&self->_tlsMaximumVersion, 0);
  objc_storeStrong((id *)&self->_tlsMinimumVersion, 0);
  objc_storeStrong((id *)&self->_remoteCertificateAuthorityHash, 0);
  objc_storeStrong((id *)&self->_remoteCertificateAuthorityReferences, 0);
  objc_storeStrong((id *)&self->_remoteCertificateAuthorityName, 0);
  objc_storeStrong((id *)&self->_remoteCertificateHostname, 0);
  objc_storeStrong((id *)&self->_localCertificateKeyReference, 0);
  objc_storeStrong((id *)&self->_localCertificateReference, 0);
  objc_storeStrong((id *)&self->_localCertificateName, 0);
  objc_storeStrong((id *)&self->_sharedSecretReference, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_passwordReference, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_localEncryptedEAPIdentity, 0);
  objc_storeStrong((id *)&self->_localPrivateEAPIdentity, 0);
  objc_storeStrong((id *)&self->_remoteAuthentication, 0);
  objc_storeStrong((id *)&self->_authenticationProtocol, 0);
  objc_storeStrong((id *)&self->_additionalMOBIKEAddresses, 0);
  objc_storeStrong((id *)&self->_remoteIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationReply, 0);

  objc_storeStrong((id *)&self->_configurationRequest, 0);
}

- (void)setPpkMandatory:(BOOL)a3
{
  self->_ppkMandatory = a3;
}

- (BOOL)ppkMandatory
{
  return self->_ppkMandatory;
}

- (void)setPpkID:(id)a3
{
}

- (NSData)ppkID
{
  return (NSData *)objc_getProperty(self, a2, 360, 1);
}

- (void)setPpkIDType:(unint64_t)a3
{
  self->_ppkIDType = a3;
}

- (unint64_t)ppkIDType
{
  return self->_ppkIDType;
}

- (void)setPpkReference:(id)a3
{
}

- (NSData)ppkReference
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setPpk:(id)a3
{
}

- (NSData)ppk
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setIMEISV:(id)a3
{
}

- (NSString)IMEISV
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setIMEI:(id)a3
{
}

- (NSString)IMEI
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPduSessionID:(id)a3
{
}

- (NSNumber)pduSessionID
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setCustomIKEAuthPrivateNotifies:(id)a3
{
}

- (NSArray)customIKEAuthPrivateNotifies
{
  return self->_customIKEAuthPrivateNotifies;
}

- (void)setCustomIKEAuthVendorPayloads:(id)a3
{
}

- (NSArray)customIKEAuthVendorPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCustomIKEAuthPayloads:(id)a3
{
}

- (NSArray)customIKEAuthPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTlsMaximumVersion:(id)a3
{
}

- (NSString)tlsMaximumVersion
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTlsMinimumVersion:(id)a3
{
}

- (NSString)tlsMinimumVersion
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setRemotePublicKeyRef:(__SecKey *)a3
{
}

- (__SecKey)remotePublicKeyRef
{
  return (__SecKey *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLocalPrivateKeyRef:(__SecKey *)a3
{
}

- (__SecKey)localPrivateKeyRef
{
  return (__SecKey *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDisableRemoteCertificateValidation:(BOOL)a3
{
  self->_disableRemoteCertificateValidation = a3;
}

- (BOOL)disableRemoteCertificateValidation
{
  return self->_disableRemoteCertificateValidation;
}

- (void)setStrictCertificateRevocationCheck:(BOOL)a3
{
  self->_strictCertificateRevocationCheck = a3;
}

- (BOOL)strictCertificateRevocationCheck
{
  return self->_strictCertificateRevocationCheck;
}

- (void)setEnableCertificateRevocationCheck:(BOOL)a3
{
  self->_enableCertificateRevocationCheck = a3;
}

- (BOOL)enableCertificateRevocationCheck
{
  return self->_enableCertificateRevocationCheck;
}

- (void)setRemoteCertificateAuthorityHash:(id)a3
{
}

- (NSData)remoteCertificateAuthorityHash
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setRemoteCertificateAuthorityReferences:(id)a3
{
}

- (NSArray)remoteCertificateAuthorityReferences
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRemoteCertificateAuthorityName:(id)a3
{
}

- (NSString)remoteCertificateAuthorityName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRemoteCertificateHostname:(id)a3
{
}

- (NSString)remoteCertificateHostname
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLocalCertificateIsModernSystem:(BOOL)a3
{
  self->_localCertificateIsModernSystem = a3;
}

- (BOOL)localCertificateIsModernSystem
{
  return self->_localCertificateIsModernSystem;
}

- (void)setLocalCertificateKeyReference:(id)a3
{
}

- (NSData)localCertificateKeyReference
{
  return (NSData *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLocalCertificateReference:(id)a3
{
}

- (NSData)localCertificateReference
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLocalCertificateName:(id)a3
{
}

- (NSString)localCertificateName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSharedSecretReference:(id)a3
{
}

- (NSData)sharedSecretReference
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSharedSecret:(id)a3
{
}

- (NSData)sharedSecret
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPasswordReference:(id)a3
{
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLocalEncryptedEAPIdentity:(id)a3
{
}

- (NSData)localEncryptedEAPIdentity
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLocalPrivateEAPIdentity:(id)a3
{
}

- (NSString)localPrivateEAPIdentity
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRemoteAuthentication:(id)a3
{
}

- (NEIKEv2AuthenticationProtocol)remoteAuthentication
{
  return (NEIKEv2AuthenticationProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAuthenticationProtocol:(id)a3
{
}

- (NEIKEv2AuthenticationProtocol)authenticationProtocol
{
  return (NEIKEv2AuthenticationProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBlackholeDetectionEnabled:(BOOL)a3
{
  self->_blackholeDetectionEnabled = a3;
}

- (BOOL)blackholeDetectionEnabled
{
  return self->_blackholeDetectionEnabled;
}

- (void)setIdleTimeoutSeconds:(unint64_t)a3
{
  self->_idleTimeoutSeconds = a3;
}

- (unint64_t)idleTimeoutSeconds
{
  return self->_idleTimeoutSeconds;
}

- (void)setIdleTimeoutEnabled:(BOOL)a3
{
  self->_idleTimeoutEnabled = a3;
}

- (BOOL)idleTimeoutEnabled
{
  return self->_idleTimeoutEnabled;
}

- (void)setDeadPeerDetectionReceiveMaxShortDPDBeforeReporting:(unsigned int)a3
{
  self->_deadPeerDetectionReceiveMaxShortDPDBeforeReporting = a3;
}

- (unsigned)deadPeerDetectionReceiveMaxShortDPDBeforeReporting
{
  return self->_deadPeerDetectionReceiveMaxShortDPDBeforeReporting;
}

- (void)setDeadPeerDetectionReceiveIntervalTriggerReporting:(unint64_t)a3
{
  self->_deadPeerDetectionReceiveIntervalTriggerReporting = a3;
}

- (unint64_t)deadPeerDetectionReceiveIntervalTriggerReporting
{
  return self->_deadPeerDetectionReceiveIntervalTriggerReporting;
}

- (void)setDeadPeerDetectionMaxRetryCountBeforeReporting:(unsigned int)a3
{
  self->_deadPeerDetectionMaxRetryCountBeforeReporting = a3;
}

- (unsigned)deadPeerDetectionMaxRetryCountBeforeReporting
{
  return self->_deadPeerDetectionMaxRetryCountBeforeReporting;
}

- (void)setDeadPeerDetectionMaxRetryCount:(unsigned int)a3
{
  self->_deadPeerDetectionMaxRetryCount = a3;
}

- (unsigned)deadPeerDetectionMaxRetryCount
{
  return self->_deadPeerDetectionMaxRetryCount;
}

- (void)setDeadPeerDetectionRetryIntervalMilliseconds:(unint64_t)a3
{
  self->_deadPeerDetectionRetryIntervalMilliseconds = a3;
}

- (unint64_t)deadPeerDetectionRetryIntervalMilliseconds
{
  return self->_deadPeerDetectionRetryIntervalMilliseconds;
}

- (void)setDeadPeerDetectionInterval:(unint64_t)a3
{
  self->_deadPeerDetectionInterval = a3;
}

- (unint64_t)deadPeerDetectionInterval
{
  return self->_deadPeerDetectionInterval;
}

- (void)setDeadPeerDetectionEnabled:(BOOL)a3
{
  self->_deadPeerDetectionEnabled = a3;
}

- (BOOL)deadPeerDetectionEnabled
{
  return self->_deadPeerDetectionEnabled;
}

- (void)setNatTraversalKeepaliveOffloadInterval:(unint64_t)a3
{
  self->_natTraversalKeepaliveOffloadInterval = a3;
}

- (unint64_t)natTraversalKeepaliveOffloadInterval
{
  return self->_natTraversalKeepaliveOffloadInterval;
}

- (void)setNatTraversalKeepaliveOffloadEnabled:(BOOL)a3
{
  self->_natTraversalKeepaliveOffloadEnabled = a3;
}

- (BOOL)natTraversalKeepaliveOffloadEnabled
{
  return self->_natTraversalKeepaliveOffloadEnabled;
}

- (void)setNatTraversalKeepaliveInterval:(unint64_t)a3
{
  self->_natTraversalKeepaliveInterval = a3;
}

- (unint64_t)natTraversalKeepaliveInterval
{
  return self->_natTraversalKeepaliveInterval;
}

- (void)setNatTraversalKeepaliveEnabled:(BOOL)a3
{
  self->_natTraversalKeepaliveEnabled = a3;
}

- (BOOL)natTraversalKeepaliveEnabled
{
  return self->_natTraversalKeepaliveEnabled;
}

- (void)setNatTraversalKeepaliveDisabled:(BOOL)a3
{
  self->_natTraversalKeepaliveDisabled = a3;
}

- (BOOL)natTraversalKeepaliveDisabled
{
  return self->_natTraversalKeepaliveDisabled;
}

- (void)setAdditionalMOBIKEAddresses:(id)a3
{
}

- (NSArray)additionalMOBIKEAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNegotiateMOBIKE:(BOOL)a3
{
  self->_negotiateMOBIKE = a3;
}

- (BOOL)negotiateMOBIKE
{
  return self->_negotiateMOBIKE;
}

- (void)setInitialContactDisabled:(BOOL)a3
{
  self->_initialContactDisabled = a3;
}

- (BOOL)initialContactDisabled
{
  return self->_initialContactDisabled;
}

- (void)setRemoteIdentifier:(id)a3
{
}

- (NEIKEv2Identifier)remoteIdentifier
{
  return (NEIKEv2Identifier *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NEIKEv2Identifier)localIdentifier
{
  return (NEIKEv2Identifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConfigurationReply:(id)a3
{
  v4 = (NEIKEv2ConfigurationMessage *)[a3 copy];
  if (v4) {
    v4->_configurationType = 2;
  }
  self->_configurationReply = v4;

  MEMORY[0x1F41817F8]();
}

- (NEIKEv2ConfigurationMessage)configurationReply
{
  return self->_configurationReply;
}

- (void)setConfigurationRequest:(id)a3
{
  v4 = (NEIKEv2ConfigurationMessage *)[a3 copy];
  if (v4) {
    v4->_configurationType = 1;
  }
  self->_configurationRequest = v4;

  MEMORY[0x1F41817F8]();
}

- (NEIKEv2ConfigurationMessage)configurationRequest
{
  return self->_configurationRequest;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NEIKEv2SessionConfiguration *)self localIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setLocalIdentifier:v6];

  v7 = [(NEIKEv2SessionConfiguration *)self remoteIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setRemoteIdentifier:v8];

  objc_msgSend(v4, "setInitialContactDisabled:", -[NEIKEv2SessionConfiguration initialContactDisabled](self, "initialContactDisabled"));
  objc_msgSend(v4, "setNegotiateMOBIKE:", -[NEIKEv2SessionConfiguration negotiateMOBIKE](self, "negotiateMOBIKE"));
  v9 = [(NEIKEv2SessionConfiguration *)self additionalMOBIKEAddresses];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    v11 = [(NEIKEv2SessionConfiguration *)self additionalMOBIKEAddresses];
    v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [v4 setAdditionalMOBIKEAddresses:v12];
  }
  objc_msgSend(v4, "setNatTraversalKeepaliveDisabled:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveDisabled](self, "natTraversalKeepaliveDisabled"));
  objc_msgSend(v4, "setNatTraversalKeepaliveInterval:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveInterval](self, "natTraversalKeepaliveInterval"));
  objc_msgSend(v4, "setNatTraversalKeepaliveOffloadEnabled:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveOffloadEnabled](self, "natTraversalKeepaliveOffloadEnabled"));
  objc_msgSend(v4, "setNatTraversalKeepaliveOffloadInterval:", -[NEIKEv2SessionConfiguration natTraversalKeepaliveOffloadInterval](self, "natTraversalKeepaliveOffloadInterval"));
  objc_msgSend(v4, "setDeadPeerDetectionEnabled:", -[NEIKEv2SessionConfiguration deadPeerDetectionEnabled](self, "deadPeerDetectionEnabled"));
  objc_msgSend(v4, "setDeadPeerDetectionInterval:", -[NEIKEv2SessionConfiguration deadPeerDetectionInterval](self, "deadPeerDetectionInterval"));
  objc_msgSend(v4, "setDeadPeerDetectionRetryIntervalMilliseconds:", -[NEIKEv2SessionConfiguration deadPeerDetectionRetryIntervalMilliseconds](self, "deadPeerDetectionRetryIntervalMilliseconds"));
  objc_msgSend(v4, "setDeadPeerDetectionMaxRetryCount:", -[NEIKEv2SessionConfiguration deadPeerDetectionMaxRetryCount](self, "deadPeerDetectionMaxRetryCount"));
  objc_msgSend(v4, "setDeadPeerDetectionMaxRetryCountBeforeReporting:", -[NEIKEv2SessionConfiguration deadPeerDetectionMaxRetryCountBeforeReporting](self, "deadPeerDetectionMaxRetryCountBeforeReporting"));
  objc_msgSend(v4, "setDeadPeerDetectionReceiveIntervalTriggerReporting:", -[NEIKEv2SessionConfiguration deadPeerDetectionReceiveIntervalTriggerReporting](self, "deadPeerDetectionReceiveIntervalTriggerReporting"));
  objc_msgSend(v4, "setDeadPeerDetectionReceiveMaxShortDPDBeforeReporting:", -[NEIKEv2SessionConfiguration deadPeerDetectionReceiveMaxShortDPDBeforeReporting](self, "deadPeerDetectionReceiveMaxShortDPDBeforeReporting"));
  objc_msgSend(v4, "setIdleTimeoutEnabled:", -[NEIKEv2SessionConfiguration idleTimeoutEnabled](self, "idleTimeoutEnabled"));
  objc_msgSend(v4, "setIdleTimeoutSeconds:", -[NEIKEv2SessionConfiguration idleTimeoutSeconds](self, "idleTimeoutSeconds"));
  objc_msgSend(v4, "setBlackholeDetectionEnabled:", -[NEIKEv2SessionConfiguration blackholeDetectionEnabled](self, "blackholeDetectionEnabled"));
  v13 = [(NEIKEv2SessionConfiguration *)self authenticationProtocol];
  v14 = (void *)[v13 copy];
  [v4 setAuthenticationProtocol:v14];

  v15 = [(NEIKEv2SessionConfiguration *)self localPrivateEAPIdentity];
  v16 = (void *)[v15 copy];
  [v4 setLocalPrivateEAPIdentity:v16];

  v17 = [(NEIKEv2SessionConfiguration *)self localEncryptedEAPIdentity];
  v18 = (void *)[v17 copy];
  [v4 setLocalEncryptedEAPIdentity:v18];

  v19 = [(NEIKEv2SessionConfiguration *)self username];
  v20 = (void *)[v19 copy];
  [v4 setUsername:v20];

  v21 = [(NEIKEv2SessionConfiguration *)self password];
  v22 = (void *)[v21 copy];
  [v4 setPassword:v22];

  v23 = [(NEIKEv2SessionConfiguration *)self passwordReference];
  v24 = (void *)[v23 copy];
  [v4 setPasswordReference:v24];

  v25 = [(NEIKEv2SessionConfiguration *)self sharedSecret];
  v26 = (void *)[v25 copy];
  [v4 setSharedSecret:v26];

  v27 = [(NEIKEv2SessionConfiguration *)self sharedSecretReference];
  v28 = (void *)[v27 copy];
  [v4 setSharedSecretReference:v28];

  v29 = [(NEIKEv2SessionConfiguration *)self localCertificateName];
  v30 = (void *)[v29 copy];
  [v4 setLocalCertificateName:v30];

  v31 = [(NEIKEv2SessionConfiguration *)self localCertificateReference];
  v32 = (void *)[v31 copy];
  [v4 setLocalCertificateReference:v32];

  v33 = [(NEIKEv2SessionConfiguration *)self remoteCertificateHostname];
  v34 = (void *)[v33 copy];
  [v4 setRemoteCertificateHostname:v34];

  v35 = [(NEIKEv2SessionConfiguration *)self remoteCertificateAuthorityName];
  v36 = (void *)[v35 copy];
  [v4 setRemoteCertificateAuthorityName:v36];

  v37 = [(NEIKEv2SessionConfiguration *)self remoteCertificateAuthorityReferences];

  if (v37)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F1C978]);
    v39 = [(NEIKEv2SessionConfiguration *)self remoteCertificateAuthorityReferences];
    v40 = (void *)[v38 initWithArray:v39 copyItems:1];
    [v4 setRemoteCertificateAuthorityReferences:v40];
  }
  v41 = [(NEIKEv2SessionConfiguration *)self remoteCertificateAuthorityHash];
  v42 = (void *)[v41 copy];
  [v4 setRemoteCertificateAuthorityHash:v42];

  objc_msgSend(v4, "setEnableCertificateRevocationCheck:", -[NEIKEv2SessionConfiguration enableCertificateRevocationCheck](self, "enableCertificateRevocationCheck"));
  objc_msgSend(v4, "setStrictCertificateRevocationCheck:", -[NEIKEv2SessionConfiguration strictCertificateRevocationCheck](self, "strictCertificateRevocationCheck"));
  objc_msgSend(v4, "setDisableRemoteCertificateValidation:", -[NEIKEv2SessionConfiguration disableRemoteCertificateValidation](self, "disableRemoteCertificateValidation"));
  objc_msgSend(v4, "setLocalPrivateKeyRef:", -[NEIKEv2SessionConfiguration localPrivateKeyRef](self, "localPrivateKeyRef"));
  objc_msgSend(v4, "setRemotePublicKeyRef:", -[NEIKEv2SessionConfiguration remotePublicKeyRef](self, "remotePublicKeyRef"));
  v43 = [(NEIKEv2SessionConfiguration *)self remoteAuthentication];
  v44 = (void *)[v43 copy];
  [v4 setRemoteAuthentication:v44];

  v45 = [(NEIKEv2SessionConfiguration *)self tlsMinimumVersion];
  v46 = (void *)[v45 copy];
  [v4 setTlsMinimumVersion:v46];

  v47 = [(NEIKEv2SessionConfiguration *)self tlsMaximumVersion];
  v48 = (void *)[v47 copy];
  [v4 setTlsMaximumVersion:v48];

  v49 = [(NEIKEv2SessionConfiguration *)self configurationRequest];
  v50 = (void *)[v49 copy];
  [v4 setConfigurationRequest:v50];

  v51 = [(NEIKEv2SessionConfiguration *)self configurationReply];
  v52 = (void *)[v51 copy];
  [v4 setConfigurationReply:v52];

  v53 = self;
  v54 = [v53 customIKEAuthPayloads];

  if (v54)
  {
    id v55 = objc_alloc(MEMORY[0x1E4F1C978]);
    v56 = [(NEIKEv2SessionConfiguration *)self customIKEAuthPayloads];
    v57 = (void *)[v55 initWithArray:v56 copyItems:1];
    [v4 setCustomIKEAuthPayloads:v57];
  }
  v58 = [(NEIKEv2SessionConfiguration *)self customIKEAuthVendorPayloads];

  if (v58)
  {
    id v59 = objc_alloc(MEMORY[0x1E4F1C978]);
    v60 = [(NEIKEv2SessionConfiguration *)self customIKEAuthVendorPayloads];
    v61 = (void *)[v59 initWithArray:v60 copyItems:1];
    [v4 setCustomIKEAuthVendorPayloads:v61];
  }
  v62 = [(NEIKEv2SessionConfiguration *)self customIKEAuthPrivateNotifies];

  if (v62)
  {
    id v63 = objc_alloc(MEMORY[0x1E4F1C978]);
    v64 = [(NEIKEv2SessionConfiguration *)self customIKEAuthPrivateNotifies];
    v65 = (void *)[v63 initWithArray:v64 copyItems:1];
    [v4 setCustomIKEAuthPrivateNotifies:v65];
  }
  v66 = [(NEIKEv2SessionConfiguration *)self IMEI];
  v67 = (void *)[v66 copy];
  [v4 setIMEI:v67];

  v68 = [(NEIKEv2SessionConfiguration *)self IMEISV];
  v69 = (void *)[v68 copy];
  [v4 setIMEISV:v69];

  v70 = [(NEIKEv2SessionConfiguration *)self ppk];
  v71 = (void *)[v70 copy];
  [v4 setPpk:v71];

  v72 = [(NEIKEv2SessionConfiguration *)self ppkReference];
  v73 = (void *)[v72 copy];
  [v4 setPpkReference:v73];

  v74 = [(NEIKEv2SessionConfiguration *)self ppkID];
  v75 = (void *)[v74 copy];
  [v4 setPpkID:v75];

  objc_msgSend(v4, "setPpkIDType:", -[NEIKEv2SessionConfiguration ppkIDType](self, "ppkIDType"));
  objc_msgSend(v4, "setPpkMandatory:", -[NEIKEv2SessionConfiguration ppkMandatory](self, "ppkMandatory"));
  return v4;
}

- (id)description
{
  return [(NEIKEv2SessionConfiguration *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEIKEv2SessionConfiguration *)self localIdentifier];
  [v7 appendPrettyObject:v8 withName:@"Local Identifier" andIndent:v5 options:a4];

  v9 = [(NEIKEv2SessionConfiguration *)self remoteIdentifier];
  [v7 appendPrettyObject:v9 withName:@"Remote Identifier" andIndent:v5 options:a4];

  id v10 = [(NEIKEv2SessionConfiguration *)self configurationRequest];
  [v7 appendPrettyObject:v10 withName:@"Configuration Request" andIndent:v5 options:a4];

  v11 = [(NEIKEv2SessionConfiguration *)self configurationReply];
  [v7 appendPrettyObject:v11 withName:@"Configuration Reply" andIndent:v5 options:a4];

  v12 = [(NEIKEv2SessionConfiguration *)self authenticationProtocol];
  [v7 appendPrettyObject:v12 withName:@"Local Authentication" andIndent:v5 options:a4];

  v13 = [(NEIKEv2SessionConfiguration *)self remoteAuthentication];
  [v7 appendPrettyObject:v13 withName:@"Remote Authentication" andIndent:v5 options:a4];

  if ([(NEIKEv2SessionConfiguration *)self ppkIDType])
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2SessionConfiguration ppkIDType](self, "ppkIDType"), @"PPK ID Type", v5, a4);
    v14 = [(NEIKEv2SessionConfiguration *)self ppkID];
    [v7 appendPrettyObject:v14 withName:@"PPK ID" andIndent:v5 options:a4];
  }
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2SessionConfiguration ppkMandatory](self, "ppkMandatory"), @"PPK Mandatory", v5, a4);
  v15 = [(NEIKEv2SessionConfiguration *)self customIKEAuthPrivateNotifies];
  [v7 appendPrettyObject:v15 withName:@"Private Notifies" andIndent:v5 options:a4];

  v16 = [(NEIKEv2SessionConfiguration *)self pduSessionID];
  [v7 appendPrettyObject:v16 withName:@"PDU Session ID" andIndent:v5 options:a4];

  return v7;
}

- (void)dealloc
{
  [(NEIKEv2SessionConfiguration *)self setLocalPrivateKeyRef:0];
  [(NEIKEv2SessionConfiguration *)self setRemotePublicKeyRef:0];
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2SessionConfiguration;
  [(NEIKEv2SessionConfiguration *)&v3 dealloc];
}

- (NEIKEv2SessionConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2SessionConfiguration;
  v2 = [(NEIKEv2SessionConfiguration *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

- (void)copyRemoteAuthKey
{
  v1 = a1;
  if (a1)
  {
    if ([a1 remotePublicKeyRef])
    {
      v1 = (void *)[v1 remotePublicKeyRef];
      CFRetain(v1);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

@end