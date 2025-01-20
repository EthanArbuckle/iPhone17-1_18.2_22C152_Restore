@interface NSMutableURLRequest(AuthKit)
+ (id)ak_anisetteHeadersWithCompanionData:()AuthKit;
+ (id)ak_anisetteHeadersWithData:()AuthKit;
+ (id)ak_clientInfoHeader;
+ (id)ak_clientTimeHeader;
+ (id)ak_deviceUDIDHeader;
+ (id)ak_localeHeader;
+ (id)ak_proxiedAnisetteHeadersWithData:()AuthKit;
+ (id)ak_proxiedClientInfoHeadersWithDevice:()AuthKit;
+ (id)ak_proxiedHeadersForDevice:()AuthKit anisetteData:;
+ (id)ak_timeZoneHeader;
- (id)ak_valueForEncodedHeaderWithKey:()AuthKit;
- (uint64_t)ak_addAppProvidedContext:()AuthKit;
- (uint64_t)ak_addAppleIDHeaderWithValue:()AuthKit;
- (uint64_t)ak_addAuthorizationHeaderWithCustodianRecoveryToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addAuthorizationHeaderWithHeartbeatToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addAuthorizationHeaderWithServiceToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addCDPStatusHeaderForDSID:()AuthKit;
- (uint64_t)ak_addCFUHeader:()AuthKit;
- (uint64_t)ak_addCKRequestHeader;
- (uint64_t)ak_addCircleStatusHeaderForCircleStatus:()AuthKit;
- (uint64_t)ak_addClientApp:()AuthKit;
- (uint64_t)ak_addCompanionClientInfoHeader:()AuthKit;
- (uint64_t)ak_addContinutationKeyPresenceHeader:()AuthKit;
- (uint64_t)ak_addCustodianSyncActionHeader;
- (uint64_t)ak_addDataCenterHeaderWithIdentifier:()AuthKit;
- (uint64_t)ak_addEphemeralAuthHeader;
- (uint64_t)ak_addExecutionModeHeader:()AuthKit;
- (uint64_t)ak_addGuardianAuthorizationHeaderWithHeartbeatToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addGuardianAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addGuardianAuthorizationHeaderWithServiceToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addHeaderForDeviceManagementState:()AuthKit;
- (uint64_t)ak_addHeaderForMDMOrganizationToken:()AuthKit;
- (uint64_t)ak_addICSCIntentHeader;
- (uint64_t)ak_addJSONRequestHeader;
- (uint64_t)ak_addLocalUserHasAppleIDLoginHeader;
- (uint64_t)ak_addOTStatusHeaderForAltDSID:()AuthKit;
- (uint64_t)ak_addPRKRequestHeader;
- (uint64_t)ak_addPasscodeAuthHeader;
- (uint64_t)ak_addPhoneNumberCertificateHeaderWithValue:()AuthKit;
- (uint64_t)ak_addPreviousTransactionIdHeader:()AuthKit;
- (uint64_t)ak_addProxiedAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addProxiedClientInfoHeader:()AuthKit;
- (uint64_t)ak_addProxiedDeviceICSCIntentHeader;
- (uint64_t)ak_addProxiedDevicePRKRequestHeader;
- (uint64_t)ak_addProxiedDeviceUDIDHeader:()AuthKit;
- (uint64_t)ak_addProxyApp:()AuthKit;
- (uint64_t)ak_addReAuthenticationHeader;
- (uint64_t)ak_addRecoveryHeaderWithIdentityToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addSKUCountryHeader;
- (uint64_t)ak_addServiceHeaderForServiceType:()AuthKit;
- (uint64_t)ak_addShortLivedTokenHeaderWithIdentityToken:()AuthKit forAltDSID:;
- (uint64_t)ak_addShowWarranty;
- (uint64_t)ak_addTelemetryDeviceSessionID:()AuthKit;
- (uint64_t)ak_addTelemetryFlowID:()AuthKit;
- (uint64_t)ak_addWalrusDeviceRegionHeader;
- (void)_setAuthorizationHeaderWithToken:()AuthKit altDSID:key:;
- (void)ak_addAbsintheHeaderWithValue:()AuthKit;
- (void)ak_addAcceptedSLAHeaderWithVersion:()AuthKit;
- (void)ak_addAppleIDUserModeHeaderWithValue:()AuthKit;
- (void)ak_addAttestationDataHeaders;
- (void)ak_addCircleStatusHeader;
- (void)ak_addClientBundleIDHeader:()AuthKit;
- (void)ak_addClientInfoHeader;
- (void)ak_addClientTimeHeader;
- (void)ak_addContextHeaderForServiceType:()AuthKit;
- (void)ak_addContinutationKeyHeader:()AuthKit;
- (void)ak_addCountryHeader;
- (void)ak_addDeviceConfigurationModeHeader;
- (void)ak_addDeviceConfigurationModeHeaderForAuthContext:()AuthKit;
- (void)ak_addDeviceMLBHeader;
- (void)ak_addDeviceModeHeader;
- (void)ak_addDeviceModel;
- (void)ak_addDeviceROMHeader;
- (void)ak_addDeviceSerialNumberHeader;
- (void)ak_addDeviceUDIDHeader;
- (void)ak_addExperimentModeHeader;
- (void)ak_addFeatureMaskHeader;
- (void)ak_addFidoRecoveryTokenHeader:()AuthKit;
- (void)ak_addGuardianAuthorizationHeaderWithIdentityToken:()AuthKit heartbeatToken:serviceToken:forAltDSID:;
- (void)ak_addHeaderForDCRT:()AuthKit;
- (void)ak_addHeaderForSecurityCode:()AuthKit;
- (void)ak_addHeaderForSourceAltDSID:()AuthKit;
- (void)ak_addICSCRecoveryHeaderWithIdentityToken:()AuthKit forAltDSID:;
- (void)ak_addInternalBuildHeader;
- (void)ak_addLocalUserUUIDHashHeader;
- (void)ak_addLocaleHeader;
- (void)ak_addLoggedInServicesHeaderForServices:()AuthKit;
- (void)ak_addOfferSecurityUpgrade:()AuthKit;
- (void)ak_addPasswordResetKeyHeader:()AuthKit;
- (void)ak_addPhoneInformationHeaderWithValue:()AuthKit;
- (void)ak_addPhoneNumberHeader;
- (void)ak_addPrivateEmailAppBundleIdHeader:()AuthKit;
- (void)ak_addPrivateEmailAppNameHeader:()AuthKit;
- (void)ak_addPrivateEmailDomainHeader:()AuthKit;
- (void)ak_addPrivateEmailOriginHeader:()AuthKit;
- (void)ak_addProvisioningUDIDHeader;
- (void)ak_addProxiedAnisetteHeaders:()AuthKit;
- (void)ak_addProxiedAttestationHeaders:()AuthKit;
- (void)ak_addProxiedBundleIDHeader:()AuthKit;
- (void)ak_addProxiedDeviceCountryHeader:()AuthKit;
- (void)ak_addProxiedDeviceSerialNumberHeader:()AuthKit;
- (void)ak_addRequestContextHeader:()AuthKit;
- (void)ak_addRequestUUIDHeader:()AuthKit;
- (void)ak_addSeedBuildHeader;
- (void)ak_addTimeZoneHeaders;
- (void)ak_addURLSwitchingHeaderWithURLKey:()AuthKit altDSID:;
- (void)ak_addWalrusStatusHeader;
- (void)ak_setBodyWithParameters:()AuthKit;
- (void)ak_setJSONBodyWithParameters:()AuthKit;
@end

@implementation NSMutableURLRequest(AuthKit)

+ (id)ak_anisetteHeadersWithData:()AuthKit
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = [v3 machineID];
  v6 = [v3 oneTimePassword];
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", objc_msgSend(v3, "routingInfo"));
  v8 = (void *)v7;
  if (v5 && v6 && v7) {
    goto LABEL_7;
  }
  v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[NSMutableURLRequest(AuthKit) ak_anisetteHeadersWithData:]();
  }

  if (v5) {
LABEL_7:
  }
    [v4 setObject:v5 forKeyedSubscript:@"X-Apple-I-MD-M"];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"X-Apple-I-MD"];
  }
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"X-Apple-I-MD-RINFO"];
  }
  v10 = +[AKDevice currentDevice];
  v11 = [v10 localUserUUID];
  v12 = objc_msgSend(v11, "aaf_toSHA256String");

  if (v12) {
    [v4 setObject:v12 forKeyedSubscript:@"X-Apple-I-MD-LU"];
  }
  v13 = +[AKConfiguration sharedConfiguration];
  uint64_t v14 = [v13 shouldAllowTestApplication];

  if (v14 == 1) {
    [v4 setObject:@"true" forKeyedSubscript:@"X-Apple-Test-Application"];
  }
  v15 = (void *)[v4 copy];

  return v15;
}

+ (id)ak_timeZoneHeader
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v1 = [v0 abbreviation];

  if (v1)
  {
    id v4 = @"X-Apple-I-TimeZone";
    v5[0] = v1;
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v2;
}

+ (id)ak_localeHeader
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = +[AKDevice currentDevice];
  v1 = [v0 locale];
  v2 = [v1 localeIdentifier];

  if (v2)
  {
    v5 = @"X-Apple-I-Locale";
    v6[0] = v2;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

+ (id)ak_clientTimeHeader
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1C9C8] date];
  v1 = objc_msgSend(v0, "ak_serverFriendlyString");

  if (v1)
  {
    id v4 = @"X-Apple-I-Client-Time";
    v5[0] = v1;
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v2;
}

- (void)ak_addInternalBuildHeader
{
  id v4 = +[AKDevice currentDevice];
  if ([v4 isInternalBuild])
  {
    v2 = +[AKConfiguration sharedConfiguration];
    uint64_t v3 = [v2 shouldHideInternalBuildHeader];

    if (v3 != 1)
    {
      [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-88CC-99DE-EE63-2736"];
    }
  }
  else
  {
  }
}

- (void)ak_addSeedBuildHeader
{
  id v4 = +[AKDevice currentDevice];
  if ([v4 isSeedBuild])
  {
    v2 = +[AKConfiguration sharedConfiguration];
    uint64_t v3 = [v2 shouldHideSeedBuildHeader];

    if (v3 != 1)
    {
      [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-B636-170F-9E08-A4C3"];
    }
  }
  else
  {
  }
}

- (void)ak_addFeatureMaskHeader
{
  v2 = +[AKDevice currentDevice];
  int v3 = [v2 isInternalBuild];

  if (v3)
  {
    id v4 = +[AKConfiguration sharedConfiguration];
    uint64_t v5 = [v4 internalFeaturesMaskValue];

    if (v5)
    {
      id v7 = [NSNumber numberWithUnsignedInteger:v5];
      v6 = [v7 stringValue];
      [a1 setValue:v6 forHTTPHeaderField:@"X-Apple-I-Experiment-Features"];
    }
  }
}

- (void)ak_addLocalUserUUIDHashHeader
{
  v2 = +[AKDevice currentDevice];
  int v3 = [v2 localUserUUID];
  objc_msgSend(v3, "aaf_toSHA256String");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v5;
  if (v5)
  {
    [a1 setValue:v5 forHTTPHeaderField:@"X-Apple-I-MD-LU"];
    id v4 = v5;
  }
}

- (uint64_t)ak_addAppleIDHeaderWithValue:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-AppleID"];
}

- (void)ak_addAppleIDUserModeHeaderWithValue:()AuthKit
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 stringValue];
  [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-I-DeviceUserMode"];
}

- (void)ak_addDeviceUDIDHeader
{
  v2 = +[AKDevice currentDevice];
  int v3 = [v2 isVirtualMachine];

  id v4 = +[AKDevice currentDevice];
  id v5 = v4;
  if (v3) {
    [v4 provisioningDeviceIdentifier];
  }
  else {
  id v6 = [v4 uniqueDeviceIdentifier];
  }

  [a1 setValue:v6 forHTTPHeaderField:@"X-Mme-Device-Id"];
}

- (void)ak_addProvisioningUDIDHeader
{
  id v3 = +[AKDevice currentDevice];
  v2 = [v3 provisioningDeviceIdentifier];
  [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-I-Provisioning-Device-Id"];
}

- (uint64_t)ak_addProxiedDeviceUDIDHeader:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Mme-Proxied-Device-Id"];
}

- (void)ak_addClientInfoHeader
{
  id v3 = +[AKDevice currentDevice];
  v2 = [v3 serverFriendlyDescription];
  [a1 setValue:v2 forHTTPHeaderField:@"X-MMe-Client-Info"];
}

- (void)ak_addClientTimeHeader
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  v2 = objc_msgSend(v3, "ak_serverFriendlyString");
  [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-I-Client-Time"];
}

- (void)ak_addCircleStatusHeader
{
  id v4 = +[AKDevice currentDevice];
  int v2 = [v4 isInCircle];
  id v3 = AKTrueValue;
  if (!v2) {
    id v3 = AKFalseValue;
  }
  [a1 setValue:*v3 forHTTPHeaderField:@"X-Apple-I-CDP-Circle-Status"];
}

- (uint64_t)ak_addOTStatusHeaderForAltDSID:()AuthKit
{
  BOOL v2 = +[AKCDPFactory cdpAccountIsOTEnabledForAltDSID:](AKCDPFactory, "cdpAccountIsOTEnabledForAltDSID:");
  id v3 = AKTrueValue;
  if (!v2) {
    id v3 = AKFalseValue;
  }
  id v4 = *v3;

  return [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-OT-Status"];
}

- (uint64_t)ak_addCDPStatusHeaderForDSID:()AuthKit
{
  BOOL v2 = +[AKCDPFactory cdpAccountIsICDPEnabledForDSID:](AKCDPFactory, "cdpAccountIsICDPEnabledForDSID:");
  id v3 = AKTrueValue;
  if (!v2) {
    id v3 = AKFalseValue;
  }
  id v4 = *v3;

  return [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-CDP-Status"];
}

- (uint64_t)ak_addCircleStatusHeaderForCircleStatus:()AuthKit
{
  id v3 = AKTrueValue;
  if (!a3) {
    id v3 = AKFalseValue;
  }
  return [a1 setValue:*v3 forHTTPHeaderField:@"X-Apple-I-CDP-Circle-Status"];
}

- (uint64_t)ak_addCompanionClientInfoHeader:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-MMe-Companion-Client-Info"];
}

- (uint64_t)ak_addProxiedClientInfoHeader:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-MMe-Proxied-Client-Info"];
}

- (uint64_t)ak_addEphemeralAuthHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-Ephemeral-Auth"];
}

- (void)ak_addAttestationDataHeaders
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 URL];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_193494000, a3, OS_LOG_TYPE_ERROR, "Unable to get Attestation data for request %@! Error: %@", v6, 0x16u);
}

- (void)ak_addProxiedAnisetteHeaders:()AuthKit
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "ak_proxiedAnisetteHeadersWithData:", v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        [a1 setValue:v11 forHTTPHeaderField:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)ak_addProxiedAttestationHeaders:()AuthKit
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSMutableURLRequest(AuthKit) ak_addProxiedAttestationHeaders:]();
  }

  uint64_t v6 = [v4 attestationHeaders];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__NSMutableURLRequest_AuthKit__ak_addProxiedAttestationHeaders___block_invoke;
  v7[3] = &unk_1E57605E8;
  v7[4] = a1;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (uint64_t)ak_addAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-Identity-Token"];
}

- (uint64_t)ak_addProxiedAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-Proxied-Identity-Token"];
}

- (uint64_t)ak_addAuthorizationHeaderWithServiceToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-GS-Token"];
}

- (uint64_t)ak_addAuthorizationHeaderWithHeartbeatToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-HB-Token"];
}

- (uint64_t)ak_addAuthorizationHeaderWithCustodianRecoveryToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-CR-Token"];
}

- (void)ak_addICSCRecoveryHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  id v6 = a4;
  id v7 = a3;
  [a1 _setAuthorizationHeaderWithToken:v7 altDSID:v6 key:@"X-Apple-iCSC-Identity-Token"];
  objc_msgSend(a1, "ak_addRecoveryHeaderWithIdentityToken:forAltDSID:", v7, v6);
}

- (uint64_t)ak_addRecoveryHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-Recovery-Identity-Token"];
}

- (uint64_t)ak_addShortLivedTokenHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-SL-Token"];
}

- (uint64_t)ak_addGuardianAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-Guardian-Identity-Token"];
}

- (uint64_t)ak_addGuardianAuthorizationHeaderWithHeartbeatToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-Guardian-HB-Token"];
}

- (uint64_t)ak_addGuardianAuthorizationHeaderWithServiceToken:()AuthKit forAltDSID:
{
  return [a1 _setAuthorizationHeaderWithToken:a3 altDSID:a4 key:@"X-Apple-Guardian-GS-Token"];
}

- (void)ak_addGuardianAuthorizationHeaderWithIdentityToken:()AuthKit heartbeatToken:serviceToken:forAltDSID:
{
  id v10 = a6;
  id v12 = a5;
  id v11 = a4;
  objc_msgSend(a1, "ak_addGuardianAuthorizationHeaderWithIdentityToken:forAltDSID:", a3, v10);
  objc_msgSend(a1, "ak_addGuardianAuthorizationHeaderWithHeartbeatToken:forAltDSID:", v11, v10);

  objc_msgSend(a1, "ak_addGuardianAuthorizationHeaderWithServiceToken:forAltDSID:", v12, v10);
}

- (void)ak_addURLSwitchingHeaderWithURLKey:()AuthKit altDSID:
{
  if (a4) {
    [NSString stringWithFormat:@"%@:%@", a4, a3];
  }
  else {
  id v8 = [NSString stringWithFormat:@":%@", a3, v7];
  }
  id v5 = [v8 dataUsingEncoding:4];
  id v6 = [v5 base64EncodedStringWithOptions:0];
  [a1 setValue:v6 forHTTPHeaderField:@"X-Apple-I-UrlSwitch-Info"];
}

- (uint64_t)ak_addDataCenterHeaderWithIdentifier:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-DC"];
}

- (id)ak_valueForEncodedHeaderWithKey:()AuthKit
{
  v1 = objc_msgSend(a1, "valueForHTTPHeaderField:");
  if (v1)
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v1 options:0];
    id v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_setAuthorizationHeaderWithToken:()AuthKit altDSID:key:
{
  id v8 = NSString;
  id v9 = a5;
  id v12 = [v8 stringWithFormat:@"%@:%@", a4, a3];
  id v10 = [v12 dataUsingEncoding:4];
  id v11 = [v10 base64EncodedStringWithOptions:0];
  [a1 setValue:v11 forHTTPHeaderField:v9];
}

- (void)ak_setBodyWithParameters:()AuthKit
{
  id v7 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:&v7];
  id v5 = v7;
  if (v5)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSMutableURLRequest(AuthKit) ak_setBodyWithParameters:]();
    }
  }
  else
  {
    [a1 setHTTPBody:v4];
  }
}

- (void)ak_setJSONBodyWithParameters:()AuthKit
{
  v8[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8[0] = 0;
  id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:v8];
  id v6 = v8[0];
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSMutableURLRequest(AuthKit) ak_setBodyWithParameters:]();
    }
  }
  else
  {
    [a1 setHTTPBody:v5];
  }
}

- (uint64_t)ak_addJSONRequestHeader
{
  return [a1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}

- (void)ak_addAbsintheHeaderWithValue:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Mme-Nas-Qualify"];
  }
  return a1;
}

- (void)ak_addLoggedInServicesHeaderForServices:()AuthKit
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 componentsJoinedByString:@","];
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSMutableURLRequest(AuthKit) ak_addLoggedInServicesHeaderForServices:]();
    }

    [a1 setValue:v5 forHTTPHeaderField:@"X-Apple-I-Logged-In-Services"];
  }
}

- (void)ak_addContextHeaderForServiceType:()AuthKit
{
  uint64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 6 && ((0x7Bu >> v3)) {
    return (void *)[a1 setValue:off_1E5760608[v3] forHTTPHeaderField:@"X-Apple-AK-Context-Type"];
  }
  return a1;
}

- (void)ak_addContinutationKeyHeader:()AuthKit
{
  id v5 = [a3 dataUsingEncoding:4];
  id v4 = [v5 base64EncodedStringWithOptions:0];
  [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-CK"];
}

- (uint64_t)ak_addContinutationKeyPresenceHeader:()AuthKit
{
  uint64_t v3 = AKTrueValue;
  if (!a3) {
    uint64_t v3 = AKFalseValue;
  }
  return [a1 setValue:*v3 forHTTPHeaderField:@"X-Apple-I-CK-Presence"];
}

- (void)ak_addPasswordResetKeyHeader:()AuthKit
{
  id v5 = [a3 dataUsingEncoding:4];
  id v4 = [v5 base64EncodedStringWithOptions:0];
  [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-PRK"];
}

- (void)ak_addCountryHeader
{
  BOOL v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C400]];
  id v5 = [v3 uppercaseString];

  id v4 = v5;
  if (v5)
  {
    [a1 setValue:v5 forHTTPHeaderField:@"X-MMe-Country"];
    id v4 = v5;
  }
}

- (uint64_t)ak_addSKUCountryHeader
{
  uint64_t v2 = MGGetStringAnswer();
  if (v2) {
    [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-I-SKU-Country"];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)ak_addProxiedDeviceCountryHeader:()AuthKit
{
  if (a3)
  {
    id v4 = [a3 uppercaseString];
    [a1 setValue:v4 forHTTPHeaderField:@"X-MMe-Proxied-Country"];
  }
}

- (void)ak_addLocaleHeader
{
  uint64_t v2 = +[AKDevice currentDevice];
  id v5 = [v2 locale];

  uint64_t v3 = v5;
  if (v5)
  {
    id v4 = [v5 localeIdentifier];
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Locale"];

    uint64_t v3 = v5;
  }
}

- (void)ak_addTimeZoneHeaders
{
  uint64_t v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v7 = [v2 name];

  if (v7) {
    [a1 setValue:v7 forHTTPHeaderField:@"X-Apple-I-TimeZone"];
  }
  uint64_t v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v4 = [v3 secondsFromGMT];

  id v5 = [NSNumber numberWithInteger:v4];
  id v6 = [v5 stringValue];
  [a1 setValue:v6 forHTTPHeaderField:@"X-Apple-I-TimeZone-Offset"];
}

- (uint64_t)ak_addPRKRequestHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-PRK-Gen"];
}

- (uint64_t)ak_addCKRequestHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-CK-Gen"];
}

- (uint64_t)ak_addProxiedDevicePRKRequestHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Proxied-PRK-Gen"];
}

- (uint64_t)ak_addICSCIntentHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-ICSCREC"];
}

- (uint64_t)ak_addLocalUserHasAppleIDLoginHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Local-Login-Uses-AppleID"];
}

- (void)ak_addDeviceROMHeader
{
  uint64_t v2 = +[AKDevice currentDevice];
  id v4 = [v2 ROMAddress];

  uint64_t v3 = v4;
  if (v4)
  {
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-ROM"];
    uint64_t v3 = v4;
  }
}

- (void)ak_addDeviceMLBHeader
{
  uint64_t v2 = +[AKDevice currentDevice];
  id v4 = [v2 MLBSerialNumber];

  uint64_t v3 = v4;
  if (v4)
  {
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-MLB"];
    uint64_t v3 = v4;
  }
}

- (void)ak_addDeviceSerialNumberHeader
{
  uint64_t v2 = +[AKDevice currentDevice];
  id v4 = [v2 serialNumber];

  uint64_t v3 = v4;
  if (v4)
  {
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-SRL-NO"];
    uint64_t v3 = v4;
  }
}

- (void)ak_addProxiedDeviceSerialNumberHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Proxied-SRL-NO"];
  }
  return a1;
}

- (void)ak_addPhoneNumberHeader
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Failed to attach PTN header", v1, 2u);
}

- (uint64_t)ak_addPhoneNumberCertificateHeaderWithValue:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-IDS-PAC"];
}

- (void)ak_addPhoneInformationHeaderWithValue:()AuthKit
{
  if (a3)
  {
    id v4 = objc_msgSend(NSString, "ak_base64EncodedJsonFromObject:");
    if (v4)
    {
      [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Phone"];
    }
    else
    {
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[NSMutableURLRequest(AuthKit) ak_addPhoneInformationHeaderWithValue:]();
      }
    }
  }
}

- (void)ak_addAcceptedSLAHeaderWithVersion:()AuthKit
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v3 stringValue];
  [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-iOS-SLA-Version"];
}

- (uint64_t)ak_addClientApp:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-Client-App-Name"];
}

- (uint64_t)ak_addProxyApp:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-Proxied-App-Name"];
}

- (uint64_t)ak_addAppProvidedContext:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-App-Provided-Context"];
}

- (uint64_t)ak_addReAuthenticationHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-ReAuth"];
}

- (void)ak_addOfferSecurityUpgrade:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:@"1" forHTTPHeaderField:@"X-Apple-Offer-Security-Upgrade"];
  }
  return a1;
}

- (uint64_t)ak_addProxiedDeviceICSCIntentHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Proxied-ICSCREC"];
}

+ (id)ak_clientInfoHeader
{
  v5[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = +[AKDevice currentDevice];
  v1 = [v0 serverFriendlyDescription];

  if (v1)
  {
    id v4 = @"X-MMe-Client-Info";
    v5[0] = v1;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v2;
}

+ (id)ak_deviceUDIDHeader
{
  v5[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = +[AKDevice currentDevice];
  v1 = [v0 uniqueDeviceIdentifier];

  if (v1)
  {
    id v4 = @"X-Mme-Device-Id";
    v5[0] = v1;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v2;
}

+ (id)ak_anisetteHeadersWithCompanionData:()AuthKit
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 machineID];
  id v6 = [v3 oneTimePassword];
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", objc_msgSend(v3, "routingInfo"));
  id v8 = (void *)v7;
  if (v5 && v6 && v7) {
    goto LABEL_7;
  }
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[NSMutableURLRequest(AuthKit) ak_anisetteHeadersWithCompanionData:]();
  }

  if (v5) {
LABEL_7:
  }
    [v4 setObject:v5 forKeyedSubscript:@"X-Apple-I-Companion-MD-M"];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"X-Apple-I-Companion-MD"];
  }
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"X-Apple-I-Companion-MD-RINFO"];
  }

  return v4;
}

+ (id)ak_proxiedHeadersForDevice:()AuthKit anisetteData:
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = objc_msgSend(a1, "ak_proxiedAnisetteHeadersWithData:", v7);

  [v9 addEntriesFromDictionary:v10];
  id v11 = objc_msgSend(a1, "ak_proxiedClientInfoHeadersWithDevice:", v8);

  [v9 addEntriesFromDictionary:v11];

  return v9;
}

+ (id)ak_proxiedAnisetteHeadersWithData:()AuthKit
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 machineID];
  id v6 = [v3 oneTimePassword];
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", objc_msgSend(v3, "routingInfo"));
  id v8 = (void *)v7;
  if (v5 && v6 && v7) {
    goto LABEL_7;
  }
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[NSMutableURLRequest(AuthKit) ak_proxiedAnisetteHeadersWithData:]();
  }

  if (v5) {
LABEL_7:
  }
    [v4 setObject:v5 forKeyedSubscript:@"X-Apple-I-Proxied-MD-M"];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"X-Apple-I-Proxied-MD"];
  }
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"X-Apple-I-Proxied-MD-RINFO"];
  }

  return v4;
}

+ (id)ak_proxiedClientInfoHeadersWithDevice:()AuthKit
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 serverFriendlyDescription];

  if (v5)
  {
    id v6 = [v3 serverFriendlyDescription];
    [v4 setObject:v6 forKeyedSubscript:@"X-MMe-Proxied-Client-Info"];
  }
  uint64_t v7 = [v3 uniqueDeviceIdentifier];

  if (v7)
  {
    id v8 = [v3 uniqueDeviceIdentifier];
    [v4 setObject:v8 forKeyedSubscript:@"X-Mme-Proxied-Device-Id"];
  }

  return v4;
}

- (uint64_t)ak_addShowWarranty
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Mme-Show-Warranty"];
}

- (void)ak_addDeviceModel
{
  uint64_t v2 = +[AKDevice currentDevice];
  id v4 = [v2 modelNumber];

  id v3 = v4;
  if (v4)
  {
    [a1 setValue:v4 forHTTPHeaderField:@"X-MMe-Device-Model"];
    id v3 = v4;
  }
}

- (uint64_t)ak_addCFUHeader:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-CFU-State"];
}

- (void)ak_addDeviceConfigurationModeHeader
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", +[AKDevice currentDeviceAuthenticationMode](AKDevice, "currentDeviceAuthenticationMode"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-I-Device-Configuration-Mode"];
}

- (void)ak_addDeviceConfigurationModeHeaderForAuthContext:()AuthKit
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", +[AKDevice currentDeviceAuthenticationModeForAuthContext:](AKDevice, "currentDeviceAuthenticationModeForAuthContext:"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-I-Device-Configuration-Mode"];
}

- (void)ak_addRequestUUIDHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Request-UUID"];
  }
  return a1;
}

- (uint64_t)ak_addExecutionModeHeader:()AuthKit
{
  if (a3)
  {
    id v3 = (void *)result;
    id v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[NSMutableURLRequest(AuthKit) ak_addExecutionModeHeader:]();
    }

    return [v3 setValue:@"cli" forHTTPHeaderField:@"X-Apple-I-Exec-Mode"];
  }
  return result;
}

- (void)ak_addClientBundleIDHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Client-Bundle-Id"];
  }
  return a1;
}

- (void)ak_addProxiedBundleIDHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Proxied-Bundle-Id"];
  }
  return a1;
}

- (void)ak_addFidoRecoveryTokenHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Fido-Recovery-Token"];
  }
  return a1;
}

- (void)ak_addWalrusStatusHeader
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Got unknown Walrus status when setting header", v1, 2u);
}

- (uint64_t)ak_addWalrusDeviceRegionHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Device-Region-Required"];
}

- (void)ak_addPrivateEmailDomainHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Private-Email-Domain"];
  }
  return a1;
}

- (void)ak_addPrivateEmailOriginHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Private-Email-Origin"];
  }
  return a1;
}

- (void)ak_addPrivateEmailAppBundleIdHeader:()AuthKit
{
  if (a3)
  {
    id v5 = [a3 dataUsingEncoding:4];
    id v4 = [v5 base64EncodedStringWithOptions:0];
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Private-Email-Client-Bundle"];
  }
}

- (void)ak_addPrivateEmailAppNameHeader:()AuthKit
{
  if (a3)
  {
    id v5 = [a3 dataUsingEncoding:4];
    id v4 = [v5 base64EncodedStringWithOptions:0];
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Private-Email-App-Name"];
  }
}

- (void)ak_addDeviceModeHeader
{
  id v2 = +[AKDevice currentDevice];
  int v3 = [v2 isInRestrictedSharingMode];

  if (v3)
  {
    [a1 setValue:@"1" forHTTPHeaderField:@"X-Apple-I-Device-Mode"];
  }
}

- (uint64_t)ak_addCustodianSyncActionHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Recovery-Contact-Sync-Action"];
}

- (void)ak_addRequestContextHeader:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Request-Context"];
  }
  return a1;
}

- (void)ak_addExperimentModeHeader
{
}

- (uint64_t)ak_addPasscodeAuthHeader
{
  return [a1 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Passcode-Auth"];
}

- (void)ak_addHeaderForSourceAltDSID:()AuthKit
{
  if (a3) {
    return (void *)[a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Source-Alternate-Id"];
  }
  return a1;
}

- (uint64_t)ak_addTelemetryDeviceSessionID:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Device-Session-Id"];
}

- (uint64_t)ak_addTelemetryFlowID:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Flow-Id"];
}

- (uint64_t)ak_addHeaderForDeviceManagementState:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-MDM-Device-Posture"];
}

- (uint64_t)ak_addHeaderForMDMOrganizationToken:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-MDM-Org-Token"];
}

- (void)ak_addHeaderForSecurityCode:()AuthKit
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 stringValue];
  [a1 setValue:v2 forHTTPHeaderField:@"security-code"];
}

- (void)ak_addHeaderForDCRT:()AuthKit
{
  id v4 = [a3 base64EncodedStringWithOptions:0];
  [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Dcrt"];
}

- (uint64_t)ak_addPreviousTransactionIdHeader:()AuthKit
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-Previous-PTXID"];
}

- (uint64_t)ak_addServiceHeaderForServiceType:()AuthKit
{
  uint64_t v4 = AKStringFromServiceType(a3, a2);
  if (v4) {
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Service-Type"];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)ak_addProxiedAttestationHeaders:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Adding proxied attestation headers - %@", v2, v3, v4, v5, v6);
}

- (void)ak_setBodyWithParameters:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Unable to serialize request parameters! Error: %@", v2, v3, v4, v5, v6);
}

- (void)ak_setJSONBodyWithParameters:()AuthKit .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "JSON Serialization exception: %@\nInvalid JSON input: %@", buf, 0x16u);
}

- (void)ak_addLoggedInServicesHeaderForServices:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Adding header with services: %@", v2, v3, v4, v5, v6);
}

- (void)ak_addPhoneInformationHeaderWithValue:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Failed to attach Phone Information header", v1, 2u);
}

+ (void)ak_anisetteHeadersWithData:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Encountered incomplete Anisette data! %@", v2, v3, v4, v5, v6);
}

+ (void)ak_anisetteHeadersWithCompanionData:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Encountered incomplete companion Anisette data! %@", v2, v3, v4, v5, v6);
}

+ (void)ak_proxiedAnisetteHeadersWithData:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Encountered incomplete Anisette data for proxied device! %@", v2, v3, v4, v5, v6);
}

- (void)ak_addExecutionModeHeader:()AuthKit .cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Setting Execution mode header to CLI", v1, 2u);
}

@end