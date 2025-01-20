@interface HMDMatterThirdPartyPairingLogEvent
- (BOOL)cleanClose;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)caseSessionSanityCheckPassed;
- (NSNumber)communicationProtocol;
- (NSNumber)credentialsSentToClient;
- (NSNumber)discoveredOverBLE;
- (NSNumber)errorCode;
- (NSNumber)hasShortDiscriminator;
- (NSNumber)knownToSystemCommissioner;
- (NSNumber)longestStateDuration;
- (NSNumber)matterCategoryNumber;
- (NSNumber)matterProductID;
- (NSNumber)matterProductNumber;
- (NSNumber)matterVendorNumber;
- (NSNumber)pairingDuration;
- (NSNumber)pairingWindowOpenedWithPasscodeDuration;
- (NSNumber)providedThreadScanResults;
- (NSNumber)providedWiFiScanResults;
- (NSNumber)requiresMatterCustomCommissioningFlow;
- (NSNumber)success;
- (NSNumber)supportsSoftAP;
- (NSNumber)threadSetupDuration;
- (NSNumber)underlyingErrorCode;
- (NSString)accessoryTransportType;
- (NSString)client;
- (NSString)coreAnalyticsEventName;
- (NSString)errorDomain;
- (NSString)firmwareVersion;
- (NSString)longestStateName;
- (NSString)underlyingErrorDomain;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAccessoryTransportType:(id)a3;
- (void)setCaseSessionSanityCheckPassed:(id)a3;
- (void)setCleanClose:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setCommunicationProtocol:(id)a3;
- (void)setCredentialsSentToClient:(id)a3;
- (void)setDiscoveredOverBLE:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHasShortDiscriminator:(id)a3;
- (void)setKnownToSystemCommissioner:(id)a3;
- (void)setLongestStateDuration:(id)a3;
- (void)setLongestStateName:(id)a3;
- (void)setMatterCategoryNumber:(id)a3;
- (void)setMatterProductID:(id)a3;
- (void)setMatterProductNumber:(id)a3;
- (void)setMatterVendorNumber:(id)a3;
- (void)setPairingDuration:(id)a3;
- (void)setPairingWindowOpenedWithPasscodeDuration:(id)a3;
- (void)setProvidedThreadScanResults:(id)a3;
- (void)setProvidedWiFiScanResults:(id)a3;
- (void)setRequiresMatterCustomCommissioningFlow:(id)a3;
- (void)setSuccess:(id)a3;
- (void)setSupportsSoftAP:(id)a3;
- (void)setThreadSetupDuration:(id)a3;
- (void)setUnderlyingErrorCode:(id)a3;
- (void)setUnderlyingErrorDomain:(id)a3;
@end

@implementation HMDMatterThirdPartyPairingLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseSessionSanityCheckPassed, 0);
  objc_storeStrong((id *)&self->_discoveredOverBLE, 0);
  objc_storeStrong((id *)&self->_knownToSystemCommissioner, 0);
  objc_storeStrong((id *)&self->_providedThreadScanResults, 0);
  objc_storeStrong((id *)&self->_providedWiFiScanResults, 0);
  objc_storeStrong((id *)&self->_credentialsSentToClient, 0);
  objc_storeStrong((id *)&self->_requiresMatterCustomCommissioningFlow, 0);
  objc_storeStrong((id *)&self->_communicationProtocol, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_hasShortDiscriminator, 0);
  objc_storeStrong((id *)&self->_supportsSoftAP, 0);
  objc_storeStrong((id *)&self->_accessoryTransportType, 0);
  objc_storeStrong((id *)&self->_pairingWindowOpenedWithPasscodeDuration, 0);
  objc_storeStrong((id *)&self->_threadSetupDuration, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_matterProductID, 0);
  objc_storeStrong((id *)&self->_matterProductNumber, 0);
  objc_storeStrong((id *)&self->_matterVendorNumber, 0);
  objc_storeStrong((id *)&self->_matterCategoryNumber, 0);
  objc_storeStrong((id *)&self->_longestStateDuration, 0);
  objc_storeStrong((id *)&self->_longestStateName, 0);
  objc_storeStrong((id *)&self->_underlyingErrorCode, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_success, 0);
  objc_storeStrong((id *)&self->_pairingDuration, 0);
}

- (void)setCleanClose:(BOOL)a3
{
  self->_cleanClose = a3;
}

- (BOOL)cleanClose
{
  return self->_cleanClose;
}

- (void)setCaseSessionSanityCheckPassed:(id)a3
{
}

- (NSNumber)caseSessionSanityCheckPassed
{
  return self->_caseSessionSanityCheckPassed;
}

- (void)setDiscoveredOverBLE:(id)a3
{
}

- (NSNumber)discoveredOverBLE
{
  return self->_discoveredOverBLE;
}

- (void)setKnownToSystemCommissioner:(id)a3
{
}

- (NSNumber)knownToSystemCommissioner
{
  return self->_knownToSystemCommissioner;
}

- (void)setProvidedThreadScanResults:(id)a3
{
}

- (NSNumber)providedThreadScanResults
{
  return self->_providedThreadScanResults;
}

- (void)setProvidedWiFiScanResults:(id)a3
{
}

- (NSNumber)providedWiFiScanResults
{
  return self->_providedWiFiScanResults;
}

- (void)setCredentialsSentToClient:(id)a3
{
}

- (NSNumber)credentialsSentToClient
{
  return self->_credentialsSentToClient;
}

- (void)setRequiresMatterCustomCommissioningFlow:(id)a3
{
}

- (NSNumber)requiresMatterCustomCommissioningFlow
{
  return self->_requiresMatterCustomCommissioningFlow;
}

- (void)setCommunicationProtocol:(id)a3
{
}

- (NSNumber)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setClient:(id)a3
{
}

- (NSString)client
{
  return self->_client;
}

- (void)setHasShortDiscriminator:(id)a3
{
}

- (NSNumber)hasShortDiscriminator
{
  return self->_hasShortDiscriminator;
}

- (void)setSupportsSoftAP:(id)a3
{
}

- (NSNumber)supportsSoftAP
{
  return self->_supportsSoftAP;
}

- (void)setAccessoryTransportType:(id)a3
{
}

- (NSString)accessoryTransportType
{
  return self->_accessoryTransportType;
}

- (void)setPairingWindowOpenedWithPasscodeDuration:(id)a3
{
}

- (NSNumber)pairingWindowOpenedWithPasscodeDuration
{
  return self->_pairingWindowOpenedWithPasscodeDuration;
}

- (void)setThreadSetupDuration:(id)a3
{
}

- (NSNumber)threadSetupDuration
{
  return self->_threadSetupDuration;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setMatterProductID:(id)a3
{
}

- (NSNumber)matterProductID
{
  return self->_matterProductID;
}

- (void)setMatterProductNumber:(id)a3
{
}

- (NSNumber)matterProductNumber
{
  return self->_matterProductNumber;
}

- (void)setMatterVendorNumber:(id)a3
{
}

- (NSNumber)matterVendorNumber
{
  return self->_matterVendorNumber;
}

- (void)setMatterCategoryNumber:(id)a3
{
}

- (NSNumber)matterCategoryNumber
{
  return self->_matterCategoryNumber;
}

- (void)setLongestStateDuration:(id)a3
{
}

- (NSNumber)longestStateDuration
{
  return self->_longestStateDuration;
}

- (void)setLongestStateName:(id)a3
{
}

- (NSString)longestStateName
{
  return self->_longestStateName;
}

- (void)setUnderlyingErrorCode:(id)a3
{
}

- (NSNumber)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setErrorCode:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setSuccess:(id)a3
{
}

- (NSNumber)success
{
  return self->_success;
}

- (void)setPairingDuration:(id)a3
{
}

- (NSNumber)pairingDuration
{
  return self->_pairingDuration;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDMatterThirdPartyPairingLogEvent *)self pairingDuration];
  [v3 setObject:v4 forKeyedSubscript:@"pairingDuration"];

  v5 = [(HMDMatterThirdPartyPairingLogEvent *)self success];
  [v3 setObject:v5 forKeyedSubscript:@"success"];

  v6 = [(HMDMatterThirdPartyPairingLogEvent *)self errorDomain];
  [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];

  v7 = [(HMDMatterThirdPartyPairingLogEvent *)self errorCode];
  [v3 setObject:v7 forKeyedSubscript:@"errorCode"];

  v8 = [(HMDMatterThirdPartyPairingLogEvent *)self underlyingErrorDomain];
  [v3 setObject:v8 forKeyedSubscript:@"underlyingErrorDomain"];

  v9 = [(HMDMatterThirdPartyPairingLogEvent *)self underlyingErrorCode];
  [v3 setObject:v9 forKeyedSubscript:@"underlyingErrorCode"];

  v10 = [(HMDMatterThirdPartyPairingLogEvent *)self longestStateName];
  [v3 setObject:v10 forKeyedSubscript:@"longestStateName"];

  v11 = [(HMDMatterThirdPartyPairingLogEvent *)self longestStateDuration];
  [v3 setObject:v11 forKeyedSubscript:@"longestStateDuration"];

  v12 = [(HMDMatterThirdPartyPairingLogEvent *)self matterCategoryNumber];
  [v3 setObject:v12 forKeyedSubscript:@"matterCategoryNumber"];

  v13 = [(HMDMatterThirdPartyPairingLogEvent *)self matterVendorNumber];
  [v3 setObject:v13 forKeyedSubscript:@"matterVendorNumber"];

  v14 = [(HMDMatterThirdPartyPairingLogEvent *)self matterProductNumber];
  [v3 setObject:v14 forKeyedSubscript:@"matterProductNumber"];

  v15 = [(HMDMatterThirdPartyPairingLogEvent *)self matterProductID];
  [v3 setObject:v15 forKeyedSubscript:@"matterProductID"];

  v16 = [(HMDMatterThirdPartyPairingLogEvent *)self firmwareVersion];
  [v3 setObject:v16 forKeyedSubscript:@"firmwareVersion"];

  v17 = [(HMDMatterThirdPartyPairingLogEvent *)self supportsSoftAP];
  [v3 setObject:v17 forKeyedSubscript:@"supportsSoftAP"];

  v18 = [(HMDMatterThirdPartyPairingLogEvent *)self hasShortDiscriminator];
  [v3 setObject:v18 forKeyedSubscript:@"hasShortDiscriminator"];

  v19 = [(HMDMatterThirdPartyPairingLogEvent *)self client];
  [v3 setObject:v19 forKeyedSubscript:@"client"];

  v20 = [(HMDMatterThirdPartyPairingLogEvent *)self communicationProtocol];
  [v3 setObject:v20 forKeyedSubscript:@"communicationProtocol"];

  v21 = [(HMDMatterThirdPartyPairingLogEvent *)self requiresMatterCustomCommissioningFlow];
  [v3 setObject:v21 forKeyedSubscript:@"requiresMatterCustomCommissioningFlow"];

  v22 = [(HMDMatterThirdPartyPairingLogEvent *)self credentialsSentToClient];
  if (v22)
  {
    v23 = [(HMDMatterThirdPartyPairingLogEvent *)self credentialsSentToClient];
    [v3 setObject:v23 forKeyedSubscript:@"credentialsSentToClient"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"credentialsSentToClient"];
  }

  v24 = [(HMDMatterThirdPartyPairingLogEvent *)self providedWiFiScanResults];
  if (v24)
  {
    v25 = [(HMDMatterThirdPartyPairingLogEvent *)self providedWiFiScanResults];
    [v3 setObject:v25 forKeyedSubscript:@"providedWiFiScanResults"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"providedWiFiScanResults"];
  }

  v26 = [(HMDMatterThirdPartyPairingLogEvent *)self providedThreadScanResults];
  if (v26)
  {
    v27 = [(HMDMatterThirdPartyPairingLogEvent *)self providedThreadScanResults];
    [v3 setObject:v27 forKeyedSubscript:@"providedThreadScanResults"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"providedThreadScanResults"];
  }

  v28 = [(HMDMatterThirdPartyPairingLogEvent *)self discoveredOverBLE];
  if (v28)
  {
    v29 = [(HMDMatterThirdPartyPairingLogEvent *)self discoveredOverBLE];
    [v3 setObject:v29 forKeyedSubscript:@"discoveredOverBLE"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"discoveredOverBLE"];
  }

  v30 = [(HMDMatterThirdPartyPairingLogEvent *)self knownToSystemCommissioner];
  if (v30)
  {
    v31 = [(HMDMatterThirdPartyPairingLogEvent *)self knownToSystemCommissioner];
    [v3 setObject:v31 forKeyedSubscript:@"knownToSystemCommissioner"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"knownToSystemCommissioner"];
  }

  v32 = [(HMDMatterThirdPartyPairingLogEvent *)self caseSessionSanityCheckPassed];
  if (v32)
  {
    v33 = [(HMDMatterThirdPartyPairingLogEvent *)self caseSessionSanityCheckPassed];
    [v3 setObject:v33 forKeyedSubscript:@"CASAESessionSanityCheckPassed"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"CASAESessionSanityCheckPassed"];
  }

  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDMatterThirdPartyPairingLogEvent cleanClose](self, "cleanClose"));
  [v3 setObject:v34 forKeyedSubscript:@"cleanClose"];

  v35 = [(HMDMatterThirdPartyPairingLogEvent *)self threadSetupDuration];
  [v3 setObject:v35 forKeyedSubscript:@"threadSetupDuration"];

  v36 = [(HMDMatterThirdPartyPairingLogEvent *)self pairingWindowOpenedWithPasscodeDuration];
  [v3 setObject:v36 forKeyedSubscript:@"pairingWindowOpenedWithPasscodeDuration"];

  v37 = [(HMDMatterThirdPartyPairingLogEvent *)self accessoryTransportType];
  [v3 setObject:v37 forKeyedSubscript:@"accessoryTransport"];

  v38 = (void *)[v3 copy];
  return (NSDictionary *)v38;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.matter.pairing.thirdparty";
}

@end