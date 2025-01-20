@interface CWFNetworkProfile
+ (BOOL)supportsSecureCoding;
+ (id)supportedOSSpecificKeys;
- (BOOL)_isHomeNetwork;
- (BOOL)_shouldDisplayDeviceNames;
- (BOOL)bypassCaptive;
- (BOOL)isAllowedInLockdownMode;
- (BOOL)isAmbiguousNetworkName;
- (BOOL)isAppBased;
- (BOOL)isAutoJoinDisabled;
- (BOOL)isAutojoinDisabledUntilFirstUserJoin;
- (BOOL)isBlueAtlasNetwork;
- (BOOL)isCaptive;
- (BOOL)isCaptiveStateDetermined;
- (BOOL)isCarPlay;
- (BOOL)isCarPlayNetwork;
- (BOOL)isDNSHeuristicsFilteredNetwork;
- (BOOL)isEAP;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetworkProfile:(id)a3;
- (BOOL)isHighPopularity;
- (BOOL)isHighQuality;
- (BOOL)isHotspot;
- (BOOL)isLowPopularity;
- (BOOL)isLowQuality;
- (BOOL)isOWE;
- (BOOL)isOpen;
- (BOOL)isPSK;
- (BOOL)isPasspoint;
- (BOOL)isPasspointHomeOperatorNetwork;
- (BOOL)isPasspointProvisionedNetwork;
- (BOOL)isPasswordSharingDisabled;
- (BOOL)isPasswordSharingSupported;
- (BOOL)isPersonalHotspot;
- (BOOL)isPotentiallyCaptive;
- (BOOL)isPotentiallyMoving;
- (BOOL)isPrivacyProxyEnabled;
- (BOOL)isProfileBased;
- (BOOL)isProminentDisplay;
- (BOOL)isPublicAirPlayNetwork;
- (BOOL)isServiceProviderRoamingEnabled;
- (BOOL)isSessionBased;
- (BOOL)isStandalone6G;
- (BOOL)isSuspicious;
- (BOOL)isSystemMode;
- (BOOL)isTCPGood;
- (BOOL)isTLSCertificateRequired;
- (BOOL)isWAPI;
- (BOOL)isWEP;
- (BOOL)isWPA;
- (BOOL)isWPA2;
- (BOOL)isWPA3;
- (BOOL)privateMACAddressDisabledByEvaluation;
- (BOOL)privateMACAddressEnabledForEvaluation;
- (BOOL)useCachedIdentifier;
- (BOOL)useCachedNetworkName;
- (BOOL)useCachedShortSSID;
- (BOOL)wasCaptive;
- (BOOL)wasMoreRecentlyJoinedByUser;
- (BOOL)wasRecently6GHzOnlyOnAnyDevice;
- (CWFNetworkProfile)init;
- (CWFNetworkProfile)initWithCoder:(id)a3;
- (CWFNetworkProfile)initWithExternalForm:(id)a3;
- (NSArray)NAIRealmNameList;
- (NSArray)TLSTrustedServerNames;
- (NSArray)acceptedEAPTypes;
- (NSArray)cellularNetworkInfo;
- (NSArray)innerAcceptedEAPTypes;
- (NSArray)roamingConsortiumList;
- (NSArray)seamlessSSIDList;
- (NSData)SSID;
- (NSDate)addedAt;
- (NSDate)cachedPrivateMACAddressUpdatedAt;
- (NSDate)captiveWebsheetLoginDate;
- (NSDate)disable6EModeTimestamp;
- (NSDate)lastDiscoveredAt;
- (NSDate)lastJoinedAt;
- (NSDate)lastJoinedBySystemAt;
- (NSDate)lastJoinedByUserAt;
- (NSDate)lastJoinedOnAnyDeviceAt;
- (NSDate)privateMACAddressEvaluatedAt;
- (NSDate)privateMACAddressModeUserSettingUpdatedAt;
- (NSDate)updatedAt;
- (NSDate)was6GHzOnlyAt;
- (NSDate)was6GHzOnlyOnAnyDeviceAt;
- (NSDate)wasHiddenBefore;
- (NSDictionary)DNSHeuristicsFailureStateInfo;
- (NSDictionary)EAPProfile;
- (NSDictionary)OSSpecificAttributes;
- (NSDictionary)captiveProfile;
- (NSDictionary)discoveredDevices;
- (NSDictionary)userPreferredNetworkNames;
- (NSDictionary)userPreferredPasspointDomains;
- (NSMutableDictionary)internal;
- (NSSet)BSSList;
- (NSSet)properties;
- (NSString)NANServiceID;
- (NSString)bundleID;
- (NSString)cachedIdentifier;
- (NSString)cachedNetworkName;
- (NSString)cachedPrivateMACAddress;
- (NSString)carplayUUID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayedOperatorName;
- (NSString)domainName;
- (NSString)networkGroupID;
- (NSString)networkName;
- (NSString)payloadUUID;
- (NSString)privacyProxyBlockedReason;
- (double)networkQualityResponsiveness;
- (id)JSONCompatibleKeyValueMap;
- (id)OSSpecificValueForKey:(id)a3;
- (id)OTASystemInfoBeaconProbeList;
- (id)SIMIdentifiers;
- (id)__basicDescription;
- (id)__coreWiFiSpecificProperties;
- (id)__defaultProperties;
- (id)__descriptionFor6EMode;
- (id)__descriptionForBSSListWithLimit:(unint64_t)a3;
- (id)__descriptionForCaptiveFlags;
- (id)__descriptionForHiddenState;
- (id)__descriptionForLowDataMode;
- (id)__descriptionForMovingAttribute;
- (id)__descriptionForNearbyShareableStatus;
- (id)__descriptionForPrivateMAC;
- (id)__descriptionForPublicAttribute;
- (id)__filteredNetworkProfileWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5;
- (id)__keyForProperty:(int64_t)a3;
- (id)__requiredProperties;
- (id)_location;
- (id)changedOSSpecificKeysFromNetworkProfile:(id)a3;
- (id)changedPropertiesFromNetworkProfile:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreWiFiSpecificAttributes;
- (id)expirationDate;
- (id)externalForm;
- (id)filteredNetworkProfileWithProperties:(id)a3;
- (id)filteredNetworkProfileWithProperties:(id)a3 OSSpecificKeys:(id)a4;
- (id)identifier;
- (id)lastDisconnectTimestamp;
- (id)lastHomeForceFixDate;
- (id)matchingKnownBSS:(id)a3;
- (id)networkDisabledUntilDate;
- (id)networkQualityDate;
- (id)passpointAccountName;
- (id)walletIdentifier;
- (int)lastDisconnectReason;
- (int)transitionDisabledFlags;
- (int64_t)WAPISubtype;
- (int64_t)WEPSubtype;
- (int64_t)__propertyForKey:(id)a3;
- (int64_t)addReason;
- (int64_t)compareSupportedSecurityTypes:(id)a3;
- (int64_t)compareUserPriority:(id)a3;
- (int64_t)disable6EMode;
- (int64_t)hiddenState;
- (int64_t)locationOfInterest;
- (int64_t)lowDataMode;
- (int64_t)movingAttribute;
- (int64_t)nearbyShareableStatus;
- (int64_t)networkOfInterestHomeState;
- (int64_t)networkOfInterestWorkState;
- (int64_t)privateMACAddressEvaluationState;
- (int64_t)privateMACAddressModeConfigurationProfileSetting;
- (int64_t)privateMACAddressModeUserSetting;
- (int64_t)publicAttribute;
- (int64_t)ssidHarvestStatus;
- (unint64_t)cachedShortSSID;
- (unint64_t)effectiveSupportedSecurityTypes;
- (unint64_t)hash;
- (unint64_t)lastJoinedBySystemAtWeek;
- (unint64_t)networkGroupPriority;
- (unint64_t)popularityScore;
- (unint64_t)qualityScore;
- (unint64_t)shortSSID;
- (unint64_t)strongestSupportedSecurityType;
- (unint64_t)supportedSecurityTypes;
- (unint64_t)totalNetworkUsage;
- (unint64_t)was6GHzOnlyAtWeek;
- (unint64_t)weakestSupportedSecurityType;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithNetworkProfile:(id)a3;
- (void)setAddReason:(int64_t)a3;
- (void)setAddedAt:(id)a3;
- (void)setAutoJoinDisabled:(BOOL)a3;
- (void)setBSSList:(id)a3;
- (void)setBlueAtlasNetwork:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setCachedIdentifier:(id)a3;
- (void)setCachedNetworkName:(id)a3;
- (void)setCachedPrivateMACAddress:(id)a3;
- (void)setCachedPrivateMACAddressUpdatedAt:(id)a3;
- (void)setCachedShortSSID:(unint64_t)a3;
- (void)setCaptiveProfile:(id)a3;
- (void)setCarplayNetwork:(BOOL)a3;
- (void)setCarplayUUID:(id)a3;
- (void)setCellularNetworkInfo:(id)a3;
- (void)setCoreWiFiSpecificAttributes:(id)a3;
- (void)setDNSHeuristicsFailureStateInfo:(id)a3;
- (void)setDNSHeuristicsFilteredNetwork:(BOOL)a3;
- (void)setDisable6EMode:(int64_t)a3;
- (void)setDisable6EModeTimestamp:(id)a3;
- (void)setDisableAutojoinUntilFirstUserJoin:(BOOL)a3;
- (void)setDiscoveredDevices:(id)a3;
- (void)setDisplayedOperatorName:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setEAPProfile:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHiddenState:(int64_t)a3;
- (void)setHighPopularity:(BOOL)a3;
- (void)setHighQuality:(BOOL)a3;
- (void)setInternal:(id)a3;
- (void)setIsSuspicious:(BOOL)a3;
- (void)setIsTCPGood:(BOOL)a3;
- (void)setLastDisconnectReason:(int)a3;
- (void)setLastDisconnectTimestamp:(id)a3;
- (void)setLastDiscoveredAt:(id)a3;
- (void)setLastHomeForceFixDate:(id)a3;
- (void)setLastJoinedBySystemAt:(id)a3;
- (void)setLastJoinedBySystemAtWeek:(unint64_t)a3;
- (void)setLastJoinedByUserAt:(id)a3;
- (void)setLocationOfInterest:(int64_t)a3;
- (void)setLowDataMode:(int64_t)a3;
- (void)setLowPopularity:(BOOL)a3;
- (void)setLowQuality:(BOOL)a3;
- (void)setMovingAttribute:(int64_t)a3;
- (void)setNAIRealmNameList:(id)a3;
- (void)setNANServiceID:(id)a3;
- (void)setNearbyShareableStatus:(int64_t)a3;
- (void)setNetworkDisabledUntilDate:(id)a3;
- (void)setNetworkGroupID:(id)a3;
- (void)setNetworkGroupPriority:(unint64_t)a3;
- (void)setNetworkOfInterestHomeState:(int64_t)a3;
- (void)setNetworkOfInterestWorkState:(int64_t)a3;
- (void)setNetworkQualityDate:(id)a3;
- (void)setNetworkQualityResponsiveness:(double)a3;
- (void)setOSSpecificAttributes:(id)a3;
- (void)setOSSpecificValue:(id)a3 forKey:(id)a4;
- (void)setOTASystemInfoBeaconProbeList:(id)a3;
- (void)setPasspointAccountName:(id)a3;
- (void)setPasspointHomeOperatorNetwork:(BOOL)a3;
- (void)setPasspointProvisionedNetwork:(BOOL)a3;
- (void)setPasswordSharingDisabled:(BOOL)a3;
- (void)setPayloadUUID:(id)a3;
- (void)setPersonalHotspot:(BOOL)a3;
- (void)setPopularityScore:(unint64_t)a3;
- (void)setPotentiallyCaptive:(BOOL)a3;
- (void)setPotentiallyMoving:(BOOL)a3;
- (void)setPrivacyProxyBlockedReason:(id)a3;
- (void)setPrivacyProxyEnabled:(BOOL)a3;
- (void)setPrivateMACAddressEvaluatedAt:(id)a3;
- (void)setPrivateMACAddressEvaluationState:(int64_t)a3;
- (void)setPrivateMACAddressModeConfigurationProfileSetting:(int64_t)a3;
- (void)setPrivateMACAddressModeUserSetting:(int64_t)a3;
- (void)setPrivateMACAddressModeUserSettingUpdatedAt:(id)a3;
- (void)setProminentDisplay:(BOOL)a3;
- (void)setPublicAirPlayNetwork:(BOOL)a3;
- (void)setPublicAttribute:(int64_t)a3;
- (void)setQualityScore:(unint64_t)a3;
- (void)setRoamingConsortiumList:(id)a3;
- (void)setSIMIdentifiers:(id)a3;
- (void)setSSID:(id)a3;
- (void)setSSIDHarvestStatus:(int64_t)a3;
- (void)setSeamlessSSIDList:(id)a3;
- (void)setServiceProviderRoamingEnabled:(BOOL)a3;
- (void)setSessionBased:(BOOL)a3;
- (void)setStandalone6G:(BOOL)a3;
- (void)setSupportedSecurityTypes:(unint64_t)a3;
- (void)setSystemMode:(BOOL)a3;
- (void)setTotalNetworkUsage:(unint64_t)a3;
- (void)setTransitionDisabledFlags:(int)a3;
- (void)setUpdatedAt:(id)a3;
- (void)setUseCachedIdentifier:(BOOL)a3;
- (void)setUseCachedNetworkName:(BOOL)a3;
- (void)setUseCachedShortSSID:(BOOL)a3;
- (void)setUserPreferredNetworkNames:(id)a3;
- (void)setUserPreferredPasspointDomains:(id)a3;
- (void)setWAPISubtype:(int64_t)a3;
- (void)setWEPSubtype:(int64_t)a3;
- (void)setWalletIdentifier:(id)a3;
- (void)setWas6GHzOnlyAt:(id)a3;
- (void)setWas6GHzOnlyAtWeek:(unint64_t)a3;
- (void)setWasHiddenBefore:(id)a3;
@end

@implementation CWFNetworkProfile

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFNetworkProfile *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToNetworkProfile = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToNetworkProfile = objc_msgSend_isEqualToNetworkProfile_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToNetworkProfile = 0;
  }

  return isEqualToNetworkProfile;
}

- (void)setSSID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6D50, v3);
  *(_WORD *)&self->_useCachedIdentifier = 0;
  self->_useCachedShortSSID = 0;
}

- (void)setDomainName:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6D68, v3);
  self->_useCachedIdentifier = 0;
}

- (void)setCarplayNetwork:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC71E8, v7);
}

- (void)setStandalone6G:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC70C8, v7);
}

- (void)setPrivacyProxyEnabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7290, v7);
}

- (void)setPersonalHotspot:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7068, v7);
}

- (void)setHiddenState:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6F78, v7);
}

- (void)setAutoJoinDisabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6F60, v7);
}

- (void)setAddReason:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6FF0, v7);
}

- (void)setSessionBased:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC70F8, v7);
}

- (void)setMovingAttribute:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC72F0, v7);
}

- (void)setServiceProviderRoamingEnabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC71A0, v7);
}

- (void)setNearbyShareableStatus:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7320, v7);
}

- (void)setPublicAttribute:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7308, v7);
}

- (void)setLowDataMode:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7110, v7);
}

- (void)setDNSHeuristicsFilteredNetwork:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC73C8, v7);
}

- (void)setBSSList:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)objc_msgSend_count(v4, v5, v6, v7, v8) < 0xB)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v9, (uint64_t)v4, (uint64_t)&unk_1F0DC7278, v10);
  }
  else
  {
    v11 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v9, @"lastAssociatedAt", 0, v10);
    v28[0] = v11;
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v28, 1, v13);
    v18 = objc_msgSend_sortedArrayUsingDescriptors_(v4, v15, (uint64_t)v14, v16, v17);
    v21 = objc_msgSend_subarrayWithRange_(v18, v19, 0, 10, v20);

    v25 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v22, (uint64_t)v21, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1F0DC7278, v27);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNetworkName, 0);
  objc_storeStrong((id *)&self->_cachedIdentifier, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (CWFNetworkProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CWFNetworkProfile;
  v5 = [(CWFNetworkProfile *)&v29 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v18 = objc_msgSend_setWithObjects_(v6, v15, v7, v16, v17, v8, v9, v10, v11, v12, v13, v14, 0);
    v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, @"_internal", v20);
    uint64_t v26 = objc_msgSend_mutableCopy(v21, v22, v23, v24, v25);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v26;
  }
  return v5;
}

- (void)setOSSpecificAttributes:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    v45 = self;
    v46 = v4;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v10 = objc_msgSend_allKeys(v4, v5, v6, v7, v8);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v47, (uint64_t)v59, 16);
    if (v12)
    {
      uint64_t v17 = v12;
      v18 = 0;
      uint64_t v19 = *(void *)v48;
      uint64_t v20 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v10);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend_supportedOSSpecificKeys(CWFNetworkProfile, v13, v14, v15, v16, v43, v44);
          char v27 = objc_msgSend_containsObject_(v23, v24, v22, v25, v26);

          if ((v27 & 1) == 0)
          {
            if (!v18)
            {
              v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16);
            }
            objc_msgSend_addObject_(v18, v13, v22, v15, v16);
            v28 = CWFGetOSLog();
            if (v28)
            {
              objc_super v29 = CWFGetOSLog();
            }
            else
            {
              v30 = v20;
              objc_super v29 = v20;
            }

            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              int v51 = 136446978;
              v52 = "-[CWFNetworkProfile setOSSpecificAttributes:]";
              __int16 v53 = 2082;
              v54 = "CWFNetworkProfile.m";
              __int16 v55 = 1024;
              int v56 = 2387;
              __int16 v57 = 2112;
              uint64_t v58 = v22;
              LODWORD(v44) = 38;
              v43 = &v51;
              _os_log_send_and_compose_impl();
            }
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v47, (uint64_t)v59, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    if (objc_msgSend_count(v18, v32, v33, v34, v35))
    {
      uint64_t v9 = v46;
      v31 = objc_msgSend_mutableCopy(v46, v36, v37, v38, v39);
      objc_msgSend_removeObjectsForKeys_(v31, v40, (uint64_t)v18, v41, v42);
    }
    else
    {
      v31 = 0;
      uint64_t v9 = v46;
    }
    self = v45;
  }
  else
  {
    v31 = 0;
  }
  if (v31) {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v31, (uint64_t)&unk_1F0DC6D80, v8, v43, v44);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v9, (uint64_t)&unk_1F0DC6D80, v8, v43, v44);
  }
}

+ (id)supportedOSSpecificKeys
{
  if (qword_1EB4B2650 != -1) {
    dispatch_once(&qword_1EB4B2650, &unk_1F0DA3ED0);
  }
  v2 = (void *)qword_1EB4B2648;
  return v2;
}

- (id)identifier
{
  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_useCachedIdentifier(v2, v3, v4, v5, v6) & 1) == 0)
  {
    if (objc_msgSend_isPasspoint(v2, v7, v8, v9, v10))
    {
      v18 = objc_msgSend_domainName(v2, v11, v12, v13, v14);
      if (!v18)
      {
LABEL_11:

        objc_msgSend_setUseCachedIdentifier_(v2, v44, 1, v45, v46);
        goto LABEL_12;
      }
      uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v15, @"wifi.network.passpoint.%@", v16, v17, v18);
      objc_msgSend_setCachedIdentifier_(v2, v20, (uint64_t)v19, v21, v22);
    }
    else
    {
      v18 = objc_msgSend_networkName(v2, v11, v12, v13, v14);
      if (v18)
      {
        uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v23, @"wifi.network.ssid.%@", v25, v26, v18);
        objc_msgSend_setCachedIdentifier_(v2, v27, (uint64_t)v19, v28, v29);
      }
      else
      {
        v30 = objc_msgSend_SSID(v2, v23, v24, v25, v26);
        uint64_t v19 = v30;
        if (v30)
        {
          uint64_t v35 = NSString;
          v36 = CWFHexadecimalStringFromData(v30, v31, v32, v33, v34);
          v40 = objc_msgSend_stringWithFormat_(v35, v37, @"wifi.network.ssid.%@", v38, v39, v36);
          objc_msgSend_setCachedIdentifier_(v2, v41, (uint64_t)v40, v42, v43);
        }
        v18 = 0;
      }
    }

    goto LABEL_11;
  }
LABEL_12:
  long long v47 = objc_msgSend_cachedIdentifier(v2, v7, v8, v9, v10);
  objc_sync_exit(v2);

  return v47;
}

- (BOOL)useCachedIdentifier
{
  return self->_useCachedIdentifier;
}

- (NSString)cachedIdentifier
{
  return self->_cachedIdentifier;
}

- (void)setCoreWiFiSpecificAttributes:(id)a3
{
  id v4 = a3;
  objc_msgSend___coreWiFiSpecificProperties(self, v5, v6, v7, v8);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [CWFNetworkProfile alloc];
  uint64_t v13 = objc_msgSend_initWithExternalForm_(v9, v10, (uint64_t)v4, v11, v12);

  uint64_t v17 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v14, (uint64_t)v34, v15, v16);
  uint64_t v22 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v18, v19, v20, v21);
  uint64_t v24 = objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(v13, v23, (uint64_t)v17, 0, (uint64_t)v22);

  internal = self->_internal;
  v30 = objc_msgSend_internal(v24, v26, v27, v28, v29);
  objc_msgSend_addEntriesFromDictionary_(internal, v31, (uint64_t)v30, v32, v33);
}

- (CWFNetworkProfile)initWithExternalForm:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = (CWFNetworkProfile *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11, v12);
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    objc_msgSend_allKeys(v4, v15, v16, v17, v18);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v154, (uint64_t)v159, 16);
    if (!v149) {
      goto LABEL_60;
    }
    uint64_t v148 = *(void *)v155;
    id v145 = v4;
    v146 = v13;
    while (1)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v155 != v148) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v154 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend___propertyForKey_(v13, v20, v24, v21, v22);
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = objc_msgSend_numberWithInteger_(NSNumber, v20, v25, v21, v22);
          v31 = objc_msgSend_objectForKeyedSubscript_(v14, v28, (uint64_t)v27, v29, v30);

          if (!v31)
          {
            if (v26 <= 24)
            {
              switch(v26)
              {
                case 2:
                  uint64_t v41 = NSNumber;
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v42 = sub_1B4F53B10(v32);
                  uint64_t v46 = objc_msgSend_numberWithUnsignedInteger_(v41, v43, v42, v44, v45);
                  objc_msgSend_numberWithInteger_(NSNumber, v47, 2, v48, v49);
                  goto LABEL_31;
                case 3:
                  uint64_t v58 = NSNumber;
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v59 = sub_1B4F53DB4(v32);
                  uint64_t v46 = objc_msgSend_numberWithInteger_(v58, v60, v59, v61, v62);
                  objc_msgSend_numberWithInteger_(NSNumber, v63, 3, v64, v65);
                  goto LABEL_31;
                case 4:
                  v66 = NSNumber;
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v67 = sub_1B4F53F24(v32);
                  uint64_t v46 = objc_msgSend_numberWithInteger_(v66, v68, v67, v69, v70);
                  objc_msgSend_numberWithInteger_(NSNumber, v71, 4, v72, v73);
                  goto LABEL_31;
                case 6:
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  if (objc_msgSend_BOOLValue(v32, v74, v75, v76, v77)) {
                    v40 = &unk_1F0DC6D50;
                  }
                  else {
                    v40 = &unk_1F0DC6D98;
                  }
                  objc_msgSend_numberWithInteger_(NSNumber, v78, 6, v79, v80);
                  goto LABEL_52;
                case 11:
                  v81 = NSNumber;
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v82 = sub_1B4F54040(v32);
                  uint64_t v46 = objc_msgSend_numberWithInteger_(v81, v83, v82, v84, v85);
                  objc_msgSend_numberWithInteger_(NSNumber, v86, 11, v87, v88);
                  goto LABEL_31;
                default:
                  goto LABEL_56;
              }
            }
            if (v26 > 38)
            {
              if (v26 != 39)
              {
                if (v26 != 86 && v26 != 88) {
                  goto LABEL_56;
                }
                long long v50 = NSNumber;
                uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                uint64_t v51 = sub_1B4F55AA4(v32);
                uint64_t v46 = objc_msgSend_numberWithInteger_(v50, v52, v51, v53, v54);
                objc_msgSend_numberWithInteger_(NSNumber, v55, v26, v56, v57);
                v89 = LABEL_31:;
                objc_msgSend_setObject_forKeyedSubscript_(v14, v90, (uint64_t)v46, (uint64_t)v89, v91);

LABEL_53:
                goto LABEL_54;
              }
              uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
              if (objc_msgSend_BOOLValue(v32, v119, v120, v121, v122)) {
                v40 = &unk_1F0DC6D50;
              }
              else {
                v40 = &unk_1F0DC6D98;
              }
              objc_msgSend_numberWithInteger_(NSNumber, v123, 39, v124, v125);
            }
            else
            {
              if (v26 != 25)
              {
                if (v26 == 35)
                {
                  uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  long long v150 = 0u;
                  long long v151 = 0u;
                  long long v152 = 0u;
                  long long v153 = 0u;
                  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v92, (uint64_t)&v150, (uint64_t)v158, 16);
                  if (v93)
                  {
                    uint64_t v98 = v93;
                    uint64_t v32 = 0;
                    uint64_t v99 = *(void *)v151;
                    do
                    {
                      for (uint64_t i = 0; i != v98; ++i)
                      {
                        if (*(void *)v151 != v99) {
                          objc_enumerationMutation(v46);
                        }
                        uint64_t v101 = *(void *)(*((void *)&v150 + 1) + 8 * i);
                        v102 = [CWFBSS alloc];
                        v110 = objc_msgSend_initWithExternalForm_(v102, v103, v101, v104, v105);
                        if (v110)
                        {
                          if (!v32)
                          {
                            uint64_t v32 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v106, v107, v108, v109);
                          }
                          objc_msgSend_addObject_(v32, v106, (uint64_t)v110, v108, v109);
                        }
                      }
                      uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v111, (uint64_t)&v150, (uint64_t)v158, 16);
                    }
                    while (v98);
                  }
                  else
                  {
                    uint64_t v32 = 0;
                  }
                  v133 = objc_msgSend_copy(v32, v94, v95, v96, v97);
                  v137 = objc_msgSend_numberWithInteger_(NSNumber, v134, 35, v135, v136);
                  objc_msgSend_setObject_forKeyedSubscript_(v14, v138, (uint64_t)v133, (uint64_t)v137, v139);

                  id v4 = v145;
                  uint64_t v13 = v146;
                }
                else
                {
                  if (v26 == 38)
                  {
                    uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                    if (objc_msgSend_BOOLValue(v32, v33, v34, v35, v36)) {
                      v40 = &unk_1F0DC6D50;
                    }
                    else {
                      v40 = &unk_1F0DC6D98;
                    }
                    objc_msgSend_numberWithInteger_(NSNumber, v37, 38, v38, v39);
                    goto LABEL_52;
                  }
LABEL_56:
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v46 = objc_msgSend_numberWithInteger_(NSNumber, v128, v26, v129, v130);
                  objc_msgSend_setObject_forKeyedSubscript_(v14, v131, (uint64_t)v32, (uint64_t)v46, v132);
                }
                goto LABEL_53;
              }
              uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
              if (objc_msgSend_BOOLValue(v32, v112, v113, v114, v115)) {
                v40 = &unk_1F0DC6D50;
              }
              else {
                v40 = &unk_1F0DC6D98;
              }
              objc_msgSend_numberWithInteger_(NSNumber, v116, 25, v117, v118);
            }
            uint64_t v46 = LABEL_52:;
            objc_msgSend_setObject_forKeyedSubscript_(v14, v126, (uint64_t)v40, (uint64_t)v46, v127);
            goto LABEL_53;
          }
        }
LABEL_54:
        ++v23;
      }
      while (v23 != v149);
      uint64_t v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v154, (uint64_t)v159, 16);
      uint64_t v149 = v140;
      if (!v140)
      {
LABEL_60:

        objc_msgSend_setInternal_(v13, v141, (uint64_t)v14, v142, v143);
        break;
      }
    }
  }

  return v13;
}

- (int64_t)__propertyForKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"SSID", v5, v6))
  {
    int64_t v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"SupportedSecurityTypes", v8, v9))
  {
    int64_t v10 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"WEPSubtype", v12, v13))
  {
    int64_t v10 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"WAPISubtype", v15, v16))
  {
    int64_t v10 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"CaptiveProfile", v18, v19))
  {
    int64_t v10 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v20, @"Hidden", v21, v22))
  {
    int64_t v10 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, @"AutoJoinDisabled", v24, v25))
  {
    int64_t v10 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v26, @"PasswordSharingDisabled", v27, v28))
  {
    int64_t v10 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v3, v29, @"PayloadUUID", v30, v31))
  {
    int64_t v10 = 9;
  }
  else if (objc_msgSend_isEqualToString_(v3, v32, @"BundleID", v33, v34))
  {
    int64_t v10 = 10;
  }
  else if (objc_msgSend_isEqualToString_(v3, v35, @"AddReason", v36, v37))
  {
    int64_t v10 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v38, @"AddedAt", v39, v40))
  {
    int64_t v10 = 12;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v3, v41, @"JoinedByUserAt", v42, v43)) {
      goto LABEL_26;
    }
    if (objc_msgSend_isEqualToString_(v3, v44, @"JoinedBySystemAt", v45, v46))
    {
      int64_t v10 = 14;
      goto LABEL_29;
    }
    if (objc_msgSend_isEqualToString_(v3, v47, @"JoinedByUserAt", v48, v49))
    {
LABEL_26:
      int64_t v10 = 13;
    }
    else if (objc_msgSend_isEqualToString_(v3, v51, @"PersonalHotspot", v52, v53))
    {
      int64_t v10 = 15;
    }
    else if (objc_msgSend_isEqualToString_(v3, v54, @"SystemMode", v55, v56))
    {
      int64_t v10 = 16;
    }
    else if (objc_msgSend_isEqualToString_(v3, v57, @"EAPProfile", v58, v59))
    {
      int64_t v10 = 18;
    }
    else if (objc_msgSend_isEqualToString_(v3, v60, @"PasspointDomain", v61, v62))
    {
      int64_t v10 = 19;
    }
    else if (objc_msgSend_isEqualToString_(v3, v63, @"PasspointNAIRealmList", v64, v65))
    {
      int64_t v10 = 20;
    }
    else if (objc_msgSend_isEqualToString_(v3, v66, @"PasspointRCList", v67, v68))
    {
      int64_t v10 = 21;
    }
    else if (objc_msgSend_isEqualToString_(v3, v69, @"PasspointCellularNetworkInfo", v70, v71))
    {
      int64_t v10 = 22;
    }
    else if (objc_msgSend_isEqualToString_(v3, v72, @"PasspointSPRoamingEnabled", v73, v74))
    {
      int64_t v10 = 23;
    }
    else if (objc_msgSend_isEqualToString_(v3, v75, @"PasspointDisplayName", v76, v77))
    {
      int64_t v10 = 24;
    }
    else if (objc_msgSend_isEqualToString_(v3, v78, @"LowDataMode", v79, v80))
    {
      int64_t v10 = 25;
    }
    else if (objc_msgSend_isEqualToString_(v3, v81, @"__OSSpecific__", v82, v83))
    {
      int64_t v10 = 26;
    }
    else if (objc_msgSend_isEqualToString_(v3, v84, @"UpdatedAt", v85, v86))
    {
      int64_t v10 = 27;
    }
    else if (objc_msgSend_isEqualToString_(v3, v87, @"CarPlayUUID", v88, v89))
    {
      int64_t v10 = 28;
    }
    else if (objc_msgSend_isEqualToString_(v3, v90, @"CarPlayNetwork", v91, v92))
    {
      int64_t v10 = 29;
    }
    else if (objc_msgSend_isEqualToString_(v3, v93, @"UserPreferredNetworkNames", v94, v95))
    {
      int64_t v10 = 30;
    }
    else if (objc_msgSend_isEqualToString_(v3, v96, @"UserPreferredPasspointDomains", v97, v98))
    {
      int64_t v10 = 31;
    }
    else if (objc_msgSend_isEqualToString_(v3, v99, @"NetworkGroupID", v100, v101))
    {
      int64_t v10 = 32;
    }
    else if (objc_msgSend_isEqualToString_(v3, v102, @"NetworkGroupPriority", v103, v104))
    {
      int64_t v10 = 33;
    }
    else if (objc_msgSend_isEqualToString_(v3, v105, @"LastDiscoveredAt", v106, v107))
    {
      int64_t v10 = 34;
    }
    else if (objc_msgSend_isEqualToString_(v3, v108, @"BSSList", v109, v110))
    {
      int64_t v10 = 35;
    }
    else if (objc_msgSend_isEqualToString_(v3, v111, @"PrivacyProxyEnabled", v112, v113))
    {
      int64_t v10 = 36;
    }
    else if (objc_msgSend_isEqualToString_(v3, v114, @"PrivacyProxyBlockedReason", v115, v116))
    {
      int64_t v10 = 37;
    }
    else if (objc_msgSend_isEqualToString_(v3, v117, @"Moving", v118, v119))
    {
      int64_t v10 = 38;
    }
    else if (objc_msgSend_isEqualToString_(v3, v120, @"Public", v121, v122))
    {
      int64_t v10 = 39;
    }
    else if (objc_msgSend_isEqualToString_(v3, v123, @"BlueAtlasNetwork", v124, v125))
    {
      int64_t v10 = 76;
    }
    else if (objc_msgSend_isEqualToString_(v3, v126, @"PublicAirPlayNetwork", v127, v128))
    {
      int64_t v10 = 77;
    }
    else if (objc_msgSend_isEqualToString_(v3, v129, @"TransitionDisabledFlags", v130, v131))
    {
      int64_t v10 = 40;
    }
    else if (objc_msgSend_isEqualToString_(v3, v132, @"NearbyShareableStatus", v133, v134))
    {
      int64_t v10 = 41;
    }
    else if (objc_msgSend_isEqualToString_(v3, v135, @"Standalone6G", v136, v137))
    {
      int64_t v10 = 42;
    }
    else if (objc_msgSend_isEqualToString_(v3, v138, @"Disable6EMode", v139, v140))
    {
      int64_t v10 = 43;
    }
    else if (objc_msgSend_isEqualToString_(v3, v141, @"Disable6EModeTimestamp", v142, v143))
    {
      int64_t v10 = 44;
    }
    else if (objc_msgSend_isEqualToString_(v3, v144, @"DisableAutojoinUntilFirstUserJoin", v145, v146))
    {
      int64_t v10 = 45;
    }
    else if (objc_msgSend_isEqualToString_(v3, v147, @"NetworkDisabledUntilDate", v148, v149))
    {
      int64_t v10 = 46;
    }
    else if (objc_msgSend_isEqualToString_(v3, v150, @"PasspointHomeOperatorNetwork", v151, v152))
    {
      int64_t v10 = 47;
    }
    else if (objc_msgSend_isEqualToString_(v3, v153, @"PasspointProvisionedNetwork", v154, v155))
    {
      int64_t v10 = 48;
    }
    else if (objc_msgSend_isEqualToString_(v3, v156, @"PasspointAccountName", v157, v158))
    {
      int64_t v10 = 49;
    }
    else if (objc_msgSend_isEqualToString_(v3, v159, @"HighPopularity", v160, v161))
    {
      int64_t v10 = 50;
    }
    else if (objc_msgSend_isEqualToString_(v3, v162, @"HighQuality", v163, v164))
    {
      int64_t v10 = 51;
    }
    else if (objc_msgSend_isEqualToString_(v3, v165, @"PotentiallyCaptive", v166, v167))
    {
      int64_t v10 = 52;
    }
    else if (objc_msgSend_isEqualToString_(v3, v168, @"PotentiallyMoving", v169, v170))
    {
      int64_t v10 = 53;
    }
    else if (objc_msgSend_isEqualToString_(v3, v171, @"TCPGood", v172, v173))
    {
      int64_t v10 = 55;
    }
    else if (objc_msgSend_isEqualToString_(v3, v174, @"LowPopularity", v175, v176))
    {
      int64_t v10 = 56;
    }
    else if (objc_msgSend_isEqualToString_(v3, v177, @"LowQuality", v178, v179))
    {
      int64_t v10 = 57;
    }
    else if (objc_msgSend_isEqualToString_(v3, v180, @"ProminentDisplay", v181, v182))
    {
      int64_t v10 = 58;
    }
    else if (objc_msgSend_isEqualToString_(v3, v183, @"PopularityScore", v184, v185))
    {
      int64_t v10 = 59;
    }
    else if (objc_msgSend_isEqualToString_(v3, v186, @"QualityScore", v187, v188))
    {
      int64_t v10 = 60;
    }
    else if (objc_msgSend_isEqualToString_(v3, v189, @"TotalNetworkUsage", v190, v191))
    {
      int64_t v10 = 61;
    }
    else if (objc_msgSend_isEqualToString_(v3, v192, @"ExpirationDate", v193, v194))
    {
      int64_t v10 = 62;
    }
    else if (objc_msgSend_isEqualToString_(v3, v195, @"HomeForceFixDate", v196, v197))
    {
      int64_t v10 = 63;
    }
    else if (objc_msgSend_isEqualToString_(v3, v198, @"LocationOfInterestType", v199, v200))
    {
      int64_t v10 = 64;
    }
    else if (objc_msgSend_isEqualToString_(v3, v201, @"NetworkOfInterestHomeState", v202, v203))
    {
      int64_t v10 = 65;
    }
    else if (objc_msgSend_isEqualToString_(v3, v204, @"NetworkOfInterestWorkState", v205, v206))
    {
      int64_t v10 = 66;
    }
    else if (objc_msgSend_isEqualToString_(v3, v207, @"SSIDHarvestStatus", v208, v209))
    {
      int64_t v10 = 67;
    }
    else if (objc_msgSend_isEqualToString_(v3, v210, @"WalletIdentifier", v211, v212))
    {
      int64_t v10 = 68;
    }
    else if (objc_msgSend_isEqualToString_(v3, v213, @"OTASystemInfoBeaconProbeList", v214, v215))
    {
      int64_t v10 = 69;
    }
    else if (objc_msgSend_isEqualToString_(v3, v216, @"SIMIdentifiers", v217, v218))
    {
      int64_t v10 = 70;
    }
    else if (objc_msgSend_isEqualToString_(v3, v219, @"NetworkQualityResponsiveness", v220, v221))
    {
      int64_t v10 = 71;
    }
    else if (objc_msgSend_isEqualToString_(v3, v222, @"NetworkQualityDate", v223, v224))
    {
      int64_t v10 = 72;
    }
    else if (objc_msgSend_isEqualToString_(v3, v225, @"LastDisconnectReason", v226, v227))
    {
      int64_t v10 = 73;
    }
    else if (objc_msgSend_isEqualToString_(v3, v228, @"LastDisconnectTimestamp", v229, v230))
    {
      int64_t v10 = 74;
    }
    else if (objc_msgSend_isEqualToString_(v3, v231, @"NANServiceID", v232, v233))
    {
      int64_t v10 = 75;
    }
    else if (objc_msgSend_isEqualToString_(v3, v234, @"JoinedBySystemAtWeek", v235, v236))
    {
      int64_t v10 = 78;
    }
    else if (objc_msgSend_isEqualToString_(v3, v237, @"Was6GHzOnlyAt", v238, v239))
    {
      int64_t v10 = 79;
    }
    else if (objc_msgSend_isEqualToString_(v3, v240, @"Was6GHzOnlyAtWeek", v241, v242))
    {
      int64_t v10 = 80;
    }
    else if (objc_msgSend_isEqualToString_(v3, v243, @"SeamlessSSIDList", v244, v245))
    {
      int64_t v10 = 81;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v246, @"DNSHeuristicsFilteredNetwork", v247, v248) & 1) != 0 {
           || (objc_msgSend_isEqualToString_(v3, v249, @"FilteredNetwork", v250, v251) & 1) != 0)
    }
    {
      int64_t v10 = 82;
    }
    else if ((objc_msgSend_isEqualToString_(v3, v252, @"DNSHeuristicsFailureStateInfo", v253, v254) & 1) != 0 {
           || (objc_msgSend_isEqualToString_(v3, v255, @"DNSFailures", v256, v257) & 1) != 0)
    }
    {
      int64_t v10 = 83;
    }
    else if (objc_msgSend_isEqualToString_(v3, v258, @"CachedPrivateMACAddress", v259, v260))
    {
      int64_t v10 = 84;
    }
    else if (objc_msgSend_isEqualToString_(v3, v261, @"CachedPrivateMACAddressUpdatedAt", v262, v263))
    {
      int64_t v10 = 85;
    }
    else if (objc_msgSend_isEqualToString_(v3, v264, @"PrivateMACAddressModeUserSetting", v265, v266))
    {
      int64_t v10 = 86;
    }
    else if (objc_msgSend_isEqualToString_(v3, v267, @"PrivateMACAddressModeUserSettingUpdatedAt", v268, v269))
    {
      int64_t v10 = 87;
    }
    else if (objc_msgSend_isEqualToString_(v3, v270, @"PrivateMACAddressEvaluationState", v271, v272))
    {
      int64_t v10 = 89;
    }
    else if (objc_msgSend_isEqualToString_(v3, v273, @"PrivateMACAddressModeConfigurationProfileSetting", v274, v275))
    {
      int64_t v10 = 88;
    }
    else if (objc_msgSend_isEqualToString_(v3, v276, @"PrivateMACAddressEvaluatedAt", v277, v278))
    {
      int64_t v10 = 90;
    }
    else if (objc_msgSend_isEqualToString_(v3, v279, @"WasHiddenBefore", v280, v281))
    {
      int64_t v10 = 91;
    }
    else if (objc_msgSend_isEqualToString_(v3, v282, @"DiscoveredDevices", v283, v284))
    {
      int64_t v10 = 92;
    }
    else
    {
      int64_t v10 = 0;
    }
  }
LABEL_29:

  return v10;
}

- (id)__filteredNetworkProfileWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5
{
  BOOL v6 = a4;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = objc_alloc_init(CWFNetworkProfile);
  uint64_t v15 = objc_msgSend_mutableCopy(self->_internal, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_properties(self, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);

  if (v6)
  {
    uint64_t v30 = objc_msgSend___requiredProperties(self, v26, v27, v28, v29);
    objc_msgSend_minusSet_(v25, v31, (uint64_t)v30, v32, v33);
  }
  if (v8)
  {
    objc_msgSend_minusSet_(v25, v26, (uint64_t)v8, v28, v29);
  }
  else
  {
    uint64_t v38 = objc_msgSend___defaultProperties(self, v26, v27, v28, v29);
    objc_msgSend_minusSet_(v25, v39, (uint64_t)v38, v40, v41);
  }
  uint64_t v42 = objc_msgSend_allObjects(v25, v34, v35, v36, v37);
  objc_msgSend_removeObjectsForKeys_(v15, v43, (uint64_t)v42, v44, v45);

  objc_msgSend_setInternal_(v10, v46, (uint64_t)v15, v47, v48);
  int v52 = objc_msgSend_containsObject_(v8, v49, (uint64_t)&unk_1F0DC6D80, v50, v51);
  if (v9 && v52)
  {
    uint64_t v94 = v25;
    uint64_t v95 = v15;
    uint64_t v96 = v10;
    id v97 = v8;
    uint64_t v57 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v53, v54, v55, v56);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v62 = objc_msgSend_OSSpecificAttributes(self, v58, v59, v60, v61);
    uint64_t v67 = objc_msgSend_allKeys(v62, v63, v64, v65, v66);

    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v98, (uint64_t)v102, 16);
    if (v69)
    {
      uint64_t v73 = v69;
      uint64_t v74 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v99 != v74) {
            objc_enumerationMutation(v67);
          }
          uint64_t v76 = *(void *)(*((void *)&v98 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v9, v70, v76, v71, v72))
          {
            v78 = objc_msgSend_OSSpecificAttributes(self, v70, v77, v71, v72);
            uint64_t v82 = objc_msgSend_objectForKeyedSubscript_(v78, v79, v76, v80, v81);
            objc_msgSend_setObject_forKeyedSubscript_(v57, v83, (uint64_t)v82, v76, v84);
          }
        }
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v98, (uint64_t)v102, 16);
      }
      while (v73);
    }

    uint64_t v89 = objc_msgSend_copy(v57, v85, v86, v87, v88);
    int64_t v10 = v96;
    objc_msgSend_setOSSpecificAttributes_(v96, v90, (uint64_t)v89, v91, v92);

    id v8 = v97;
    uint64_t v25 = v94;
    uint64_t v15 = v95;
  }

  return v10;
}

- (CWFNetworkProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)CWFNetworkProfile;
  v2 = [(CWFNetworkProfile *)&v6 init];
  if (!v2
    || (id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]),
        internal = v2->_internal,
        v2->_internal = v3,
        internal,
        !v2->_internal))
  {

    return 0;
  }
  return v2;
}

- (void)setInternal:(id)a3
{
}

- (NSSet)properties
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v6 = objc_msgSend_allKeys(self->_internal, a2, v2, v3, v4);
  int64_t v10 = objc_msgSend_setWithArray_(v5, v7, (uint64_t)v6, v8, v9);

  return (NSSet *)v10;
}

- (id)__coreWiFiSpecificProperties
{
  return &unk_1F0DC86E8;
}

- (id)__basicDescription
{
  objc_super v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_networkName(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);

  if ((objc_msgSend_hasPrefix_(v16, v17, @" ", v18, v19) & 1) != 0
    || objc_msgSend_hasSuffix_(v16, v20, @" ", v21, v22))
  {
    uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"'%@'", v21, v22, v16);

    uint64_t v16 = (void *)v23;
  }
  objc_msgSend_appendFormat_(v6, v20, @"%@ - ", v21, v22, v16);
  uint64_t v28 = objc_msgSend_SSID(self, v24, v25, v26, v27);
  uint64_t v33 = CWFHexadecimalStringFromData(v28, v29, v30, v31, v32);
  uint64_t v38 = objc_msgSend_redactedForWiFi(v33, v34, v35, v36, v37);
  uint64_t v43 = objc_msgSend_shortSSID(self, v39, v40, v41, v42);
  objc_msgSend_appendFormat_(v6, v44, @"ssid=%@ (%lu), ", v45, v46, v38, v43);

  uint64_t v51 = objc_msgSend_effectiveSupportedSecurityTypes(self, v47, v48, v49, v50);
  uint64_t v56 = (const char *)objc_msgSend_WEPSubtype(self, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_WAPISubtype(self, v57, v58, v59, v60);
  uint64_t v64 = sub_1B4F3FE58(v51, v56, v61, v62, v63);
  objc_msgSend_appendFormat_(v6, v65, @"security=%@, ", v66, v67, v64);

  uint64_t v72 = objc_msgSend___descriptionForPrivateMAC(self, v68, v69, v70, v71);
  objc_msgSend_appendFormat_(v6, v73, @"privateMAC=[%@], ", v74, v75, v72);

  if (objc_msgSend_isPasspoint(self, v76, v77, v78, v79))
  {
    uint64_t v84 = objc_msgSend_domainName(self, v80, v81, v82, v83);
    uint64_t v89 = objc_msgSend_displayedOperatorName(self, v85, v86, v87, v88);
    if (objc_msgSend_isServiceProviderRoamingEnabled(self, v90, v91, v92, v93)) {
      objc_msgSend_appendFormat_(v6, v94, @"hs20=[domain=%@, display=%@, sproam=%s], ", v95, v96, v84, v89, "yes");
    }
    else {
      objc_msgSend_appendFormat_(v6, v94, @"hs20=[domain=%@, display=%@, sproam=%s], ", v95, v96, v84, v89, "no");
    }
  }
  if (objc_msgSend_isAutoJoinDisabled(self, v80, v81, v82, v83)) {
    objc_msgSend_appendString_(v6, v97, @"disabled=yes, ", v99, v100);
  }
  if (objc_msgSend_hiddenState(self, v97, v98, v99, v100) == 1) {
    objc_msgSend_appendString_(v6, v101, @"hidden=yes, ", v103, v104);
  }
  if ((objc_msgSend_isCaptive(self, v101, v102, v103, v104) & 1) != 0
    || objc_msgSend_wasCaptive(self, v105, v106, v107, v108))
  {
    uint64_t v109 = objc_msgSend___descriptionForCaptiveFlags(self, v105, v106, v107, v108);
    objc_msgSend_appendFormat_(v6, v110, @"captive=%@, ", v111, v112, v109);
  }
  if (objc_msgSend_isPersonalHotspot(self, v105, v106, v107, v108)) {
    objc_msgSend_appendString_(v6, v113, @"ph=yes, ", v115, v116);
  }
  if (objc_msgSend_isCarPlay(self, v113, v114, v115, v116)) {
    objc_msgSend_appendString_(v6, v117, @"carplay=yes, ", v119, v120);
  }
  if (objc_msgSend_lowDataMode(self, v117, v118, v119, v120) == 1) {
    objc_msgSend_appendString_(v6, v121, @"lowDataMode=on, ", v123, v124);
  }
  if (objc_msgSend_isStandalone6G(self, v121, v122, v123, v124)) {
    objc_msgSend_appendString_(v6, v125, @"6g-split=yes, ", v127, v128);
  }
  if (objc_msgSend_disable6EMode(self, v125, v126, v127, v128) == 2)
  {
    uint64_t v133 = objc_msgSend_disable6EModeTimestamp(self, v129, v130, v131, v132);
    uint64_t v134 = sub_1B4F3D76C(v133);
    objc_msgSend_appendFormat_(v6, v135, @"6g-mode=[off (%@)], ", v136, v137, v134);
  }
  if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(self, v129, v130, v131, v132))
  {
    uint64_t v142 = objc_msgSend_was6GHzOnlyAt(self, v138, v139, v140, v141);
    objc_msgSend_appendFormat_(v6, v143, @"6g-only=[yes, (%@)], ", v144, v145, v142);
  }
  uint64_t v146 = objc_msgSend_lastJoinedAt(self, v138, v139, v140, v141);

  if (v146)
  {
    uint64_t v151 = objc_msgSend_lastJoinedAt(self, v147, v148, v149, v150);
    uint64_t v152 = sub_1B4F3D76C(v151);
    if (objc_msgSend_wasMoreRecentlyJoinedByUser(self, v153, v154, v155, v156)) {
      objc_msgSend_appendFormat_(v6, v157, @"assoc=%@ (%s), ", v158, v159, v152, "user");
    }
    else {
      objc_msgSend_appendFormat_(v6, v157, @"assoc=%@ (%s), ", v158, v159, v152, "auto");
    }
  }
  uint64_t v160 = objc_msgSend_lastDisconnectTimestamp(self, v147, v148, v149, v150);

  if (v160)
  {
    v165 = objc_msgSend_lastDisconnectTimestamp(self, v161, v162, v163, v164);
    uint64_t v166 = sub_1B4F3D76C(v165);
    uint64_t DisconnectReason = objc_msgSend_lastDisconnectReason(self, v167, v168, v169, v170);
    objc_msgSend_appendFormat_(v6, v172, @"disassoc=%@ (%d), ", v173, v174, v166, DisconnectReason);
  }
  if (objc_msgSend_isPublicAirPlayNetwork(self, v161, v162, v163, v164)) {
    objc_msgSend_appendString_(v6, v175, @"publicAirPlayNetwork=yes, ", v177, v178);
  }
  uint64_t v179 = objc_msgSend_wasHiddenBefore(self, v175, v176, v177, v178);

  if (v179)
  {
    uint64_t v184 = objc_msgSend_wasHiddenBefore(self, v180, v181, v182, v183);
    uint64_t v185 = sub_1B4F3D76C(v184);
    objc_msgSend_appendFormat_(v6, v186, @"wasHiddenBefore=%@", v187, v188, v185);
  }
  if (objc_msgSend_hasSuffix_(v6, v180, @", ", v182, v183))
  {
    uint64_t v193 = objc_msgSend_length(v6, v189, v190, v191, v192);
    objc_msgSend_deleteCharactersInRange_(v6, v194, v193 - 2, 2, v195);
  }

  return v6;
}

- (BOOL)wasRecently6GHzOnlyOnAnyDevice
{
  uint64_t v10 = objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, a2, v2, v3, v4);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_lastJoinedByUserAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    uint64_t v22 = objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    if (v17 >= v31)
    {
      uint64_t v33 = objc_msgSend_lastJoinedByUserAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v33, v34, v35, v36, v37);
      double v39 = v38;
      uint64_t v44 = objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, v40, v41, v42, v43);
      objc_msgSend_timeIntervalSinceReferenceDate(v44, v45, v46, v47, v48);
      BOOL v32 = v39 - v49 <= 1209600.0;
    }
    else
    {
      BOOL v32 = 1;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)wasMoreRecentlyJoinedByUser
{
  objc_super v6 = objc_msgSend_lastJoinedByUserAt(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9, v10);
  double v12 = v11;
  double v17 = objc_msgSend_lastJoinedBySystemAt(self, v13, v14, v15, v16);
  objc_msgSend_timeIntervalSinceReferenceDate(v17, v18, v19, v20, v21);
  BOOL v23 = v12 > v22;

  return v23;
}

- (NSDate)lastJoinedAt
{
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, v2, v3, v4);
  double v7 = v6;
  double v12 = objc_msgSend_lastJoinedBySystemAt(self, v8, v9, v10, v11);
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  if (v21 <= v7) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  BOOL v23 = objc_msgSend_lastJoinedByUserAt(self, v17, v18, v19, v20);
  objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26, v27);
  if (v28 > v7) {
    double v28 = 0.0;
  }
  if (v22 <= v28) {
    uint64_t v29 = v23;
  }
  else {
    uint64_t v29 = v12;
  }
  uint64_t v30 = v29;

  return v30;
}

- (NSDate)lastJoinedByUserAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7020, v2, v3);
}

- (NSDate)lastJoinedBySystemAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7038, v2, v3);
}

- (NSDate)wasHiddenBefore
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F90, v2, v3);
}

- (BOOL)wasCaptive
{
  if (!sub_1B4F408A8()) {
    return 0;
  }
  double v7 = objc_msgSend_captiveProfile(self, v3, v4, v5, v6);
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v8 = (uint64_t *)qword_1EB4B25C8;
  uint64_t v31 = qword_1EB4B25C8;
  if (!qword_1EB4B25C8)
  {
    uint64_t v9 = sub_1B4F773F4();
    v29[3] = (uint64_t)dlsym(v9, "kCNSNetworkWasCaptiveProperty");
    qword_1EB4B25C8 = v29[3];
    uint64_t v8 = (uint64_t *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (v8)
  {
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v7, v10, *v8, v12, v13);
    char v19 = objc_msgSend_BOOLValue(v14, v15, v16, v17, v18);

    return v19;
  }
  double v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
  uint64_t v25 = objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)"CFStringRef getkCNSNetworkWasCaptiveProperty(void)", v23, v24);
  uint64_t v26 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v27, (uint64_t)v25, @"CWFNetworkProfile.m", 32, @"%s", v26);

  __break(1u);
  return result;
}

- (unint64_t)was6GHzOnlyAtWeek
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6DF8, v2, v3);
  unint64_t v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  uint64_t v15 = objc_msgSend_was6GHzOnlyAt(self, v11, v12, v13, v14);
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18, v19);
  unint64_t v21 = vcvtmd_u64_f64(v20 / 86400.0 / 7.0);

  if (v10 <= v21) {
    return v21;
  }
  else {
    return v10;
  }
}

- (NSDate)was6GHzOnlyOnAnyDeviceAt
{
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, v2, v3, v4);
  double v7 = v6;
  uint64_t v12 = objc_msgSend_was6GHzOnlyAt(self, v8, v9, v10, v11);
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  if (v21 <= v7) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  uint64_t v23 = objc_msgSend_was6GHzOnlyAtWeek(self, v17, v18, v19, v20);
  if (v7 >= (double)(unint64_t)(604800 * v23))
  {
    double v28 = (double)(unint64_t)(604800 * v23);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v24, v25, v26, v27, v28);
  }
  else
  {
    double v28 = 0.0;
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v24, v25, v26, v27, 0.0);
  uint64_t v29 = };
  uint64_t v30 = (void *)v29;
  if (v22 > 0.0 || v28 > 0.0)
  {
    if (v22 <= v28) {
      BOOL v32 = (void *)v29;
    }
    else {
      BOOL v32 = v12;
    }
    id v31 = v32;
  }
  else
  {
    id v31 = 0;
  }
  uint64_t v33 = (NSDate *)v31;

  return v33;
}

- (NSDate)was6GHzOnlyAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6DE0, v2, v3);
}

- (unint64_t)shortSSID
{
  if ((objc_msgSend_useCachedShortSSID(self, a2, v2, v3, v4) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend_SSID(self, v6, v7, v8, v9);
    if (v13) {
      Apple80211CalculateShortSSIDCopy();
    }
    objc_msgSend_setCachedShortSSID_(self, v10, 0, v11, v12);
    objc_msgSend_setUseCachedShortSSID_(self, v14, 1, v15, v16);
  }
  return objc_msgSend_cachedShortSSID(self, v6, v7, v8, v9);
}

- (BOOL)useCachedShortSSID
{
  return self->_useCachedShortSSID;
}

- (void)setUseCachedShortSSID:(BOOL)a3
{
  self->_useCachedShortSSID = a3;
}

- (void)setCachedShortSSID:(unint64_t)a3
{
  self->_cachedShortSSID = a3;
}

- (NSString)networkName
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_useCachedNetworkName(v2, v3, v4, v5, v6) & 1) == 0)
  {
    uint64_t v11 = objc_msgSend_SSID(v2, v7, v8, v9, v10);
    uint64_t v12 = CWFHumanReadableStringFromData(v11);
    objc_msgSend_setCachedNetworkName_(v2, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_setUseCachedNetworkName_(v2, v16, 1, v17, v18);
  }
  uint64_t v19 = objc_msgSend_cachedNetworkName(v2, v7, v8, v9, v10);
  objc_sync_exit(v2);

  return (NSString *)v19;
}

- (BOOL)useCachedNetworkName
{
  return self->_useCachedNetworkName;
}

- (void)setUseCachedNetworkName:(BOOL)a3
{
  self->_useCachedNetworkName = a3;
}

- (void)setCachedNetworkName:(id)a3
{
}

- (int64_t)lowDataMode
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7110, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (id)lastDisconnectTimestamp
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6E40, v2, v3);
}

- (BOOL)isStandalone6G
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC70C8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPublicAirPlayNetwork
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC72C0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPersonalHotspot
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7068, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPasspoint
{
  uint64_t v5 = objc_msgSend_domainName(self, a2, v2, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (NSString)domainName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6D68, v2, v3);
}

- (BOOL)isCaptive
{
  uint64_t v3 = sub_1B4F408A8();
  if (v3)
  {
    uint64_t v8 = objc_msgSend_captiveProfile(self, v4, v5, v6, v7);
    sub_1B4F40A58();
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v10, v9, v11, v12);
    char v18 = objc_msgSend_BOOLValue(v13, v14, v15, v16, v17);

    LOBYTE(v3) = v18;
  }
  return v3;
}

- (NSDictionary)captiveProfile
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6FA8, v2, v3);
}

- (BOOL)isAutoJoinDisabled
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F60, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)hiddenState
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F78, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)effectiveSupportedSecurityTypes
{
  uint64_t v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  if (v6 == 16) {
    uint64_t v11 = 80;
  }
  else {
    uint64_t v11 = v6;
  }
  if (v11 == 512) {
    unint64_t v12 = 768;
  }
  else {
    unint64_t v12 = v11;
  }
  char v13 = objc_msgSend_transitionDisabledFlags(self, v7, v8, v9, v10);
  if (v12 & 0x50) != 0 && (v13)
  {
    uint64_t v15 = CWFGetOSLog();
    if (v15)
    {
      uint64_t v16 = CWFGetOSLog();
    }
    else
    {
      uint64_t v16 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    return 64;
  }
  return v12;
}

- (unint64_t)supportedSecurityTypes
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6D98, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)transitionDisabledFlags
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC70B0, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)disable6EMode
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6DB0, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)cachedShortSSID
{
  return self->_cachedShortSSID;
}

- (NSString)cachedNetworkName
{
  return self->_cachedNetworkName;
}

- (id)__descriptionForPrivateMAC
{
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_cachedPrivateMACAddress(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  double v21 = objc_msgSend_cachedPrivateMACAddressUpdatedAt(self, v17, v18, v19, v20);
  double v22 = sub_1B4F3D76C(v21);
  objc_msgSend_appendFormat_(v6, v23, @"%@ (%@), ", v24, v25, v16, v22);

  if (objc_msgSend_privateMACAddressModeUserSetting(self, v26, v27, v28, v29))
  {
    uint64_t v34 = objc_msgSend_privateMACAddressModeUserSetting(self, v30, v31, v32, v33);
    uint64_t v35 = sub_1B4F55A80(v34);
    uint64_t v40 = objc_msgSend_privateMACAddressModeUserSettingUpdatedAt(self, v36, v37, v38, v39);
    uint64_t v41 = sub_1B4F3D76C(v40);
    objc_msgSend_appendFormat_(v6, v42, @"user=%@ (%@), ", v43, v44, v35, v41);
  }
  if (objc_msgSend_privateMACAddressEvaluationState(self, v30, v31, v32, v33))
  {
    unint64_t v49 = objc_msgSend_privateMACAddressEvaluationState(self, v45, v46, v47, v48);
    uint64_t v54 = sub_1B4F55A1C(v49, v50, v51, v52, v53);
    uint64_t v59 = objc_msgSend_privateMACAddressEvaluatedAt(self, v55, v56, v57, v58);
    uint64_t v60 = sub_1B4F3D76C(v59);
    objc_msgSend_appendFormat_(v6, v61, @"eval=%@ (%@), ", v62, v63, v54, v60);
  }
  if (objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v45, v46, v47, v48))
  {
    uint64_t v68 = objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v64, v65, v66, v67);
    uint64_t v69 = sub_1B4F55A80(v68);
    objc_msgSend_appendFormat_(v6, v70, @"prof=%@, ", v71, v72, v69);
  }
  if (objc_msgSend_hasSuffix_(v6, v64, @", ", v66, v67))
  {
    uint64_t v77 = objc_msgSend_length(v6, v73, v74, v75, v76);
    objc_msgSend_deleteCharactersInRange_(v6, v78, v77 - 2, 2, v79);
  }
  return v6;
}

- (int64_t)privateMACAddressModeUserSetting
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6EA0, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)privateMACAddressModeConfigurationProfileSetting
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6ED0, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)privateMACAddressEvaluationState
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6EE8, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)cachedPrivateMACAddress
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6E70, v2, v3);
}

- (NSDate)cachedPrivateMACAddressUpdatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6E88, v2, v3);
}

- (int64_t)WEPSubtype
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F30, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)WAPISubtype
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F48, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isCarPlay
{
  if (objc_msgSend_isCarPlayNetwork(self, a2, v2, v3, v4)) {
    return 1;
  }
  uint64_t v11 = objc_msgSend_carplayUUID(self, v6, v7, v8, v9);
  BOOL v10 = v11 != 0;

  return v10;
}

- (BOOL)isCarPlayNetwork
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC71E8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)carplayUUID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC71D0, v2, v3);
}

- (id)__descriptionForBSSListWithLimit:(unint64_t)a3
{
  v68[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, a3, v3, v4);
  BOOL v10 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v8, @"lastAssociatedAt", 0, v9);
  uint64_t v15 = objc_msgSend_BSSList(self, v11, v12, v13, v14);
  v68[0] = v10;
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v68, 1, v17);
  double v22 = objc_msgSend_sortedArrayUsingDescriptors_(v15, v19, (uint64_t)v18, v20, v21);

  if (objc_msgSend_count(v22, v23, v24, v25, v26))
  {
    objc_msgSend_appendString_(v7, v27, @"bssList=[", v28, v29);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    unint64_t v34 = objc_msgSend_count(v22, v30, v31, v32, v33);
    uint64_t v38 = a3;
    if (v34 <= a3) {
      uint64_t v38 = objc_msgSend_count(v22, v35, v36, a3, v37);
    }
    uint64_t v39 = objc_msgSend_subarrayWithRange_(v22, v35, 0, v38, v37);
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v63, (uint64_t)v67, 16);
    if (v41)
    {
      uint64_t v45 = v41;
      uint64_t v46 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v64 != v46) {
            objc_enumerationMutation(v39);
          }
          objc_msgSend_appendFormat_(v7, v42, @"(%@), ", v43, v44, *(void *)(*((void *)&v63 + 1) + 8 * i));
        }
        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v63, (uint64_t)v67, 16);
      }
      while (v45);
    }

    if (objc_msgSend_count(v22, v48, v49, v50, v51) > a3) {
      objc_msgSend_appendString_(v7, v52, @"..., ", v54, v55);
    }
    uint64_t v56 = objc_msgSend_length(v7, v52, v53, v54, v55);
    objc_msgSend_deleteCharactersInRange_(v7, v57, v56 - 2, 2, v58);
    objc_msgSend_appendString_(v7, v59, @"], ", v60, v61);
  }

  return v7;
}

- (NSString)description
{
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend___basicDescription(self, v7, v8, v9, v10);
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, @", ", v16, v17);
  uint64_t v21 = objc_msgSend___descriptionForBSSListWithLimit_(self, v18, 3, v19, v20);
  objc_msgSend_appendString_(v6, v22, (uint64_t)v21, v23, v24);

  if (objc_msgSend_hasSuffix_(v6, v25, @", ", v26, v27))
  {
    uint64_t v32 = objc_msgSend_length(v6, v28, v29, v30, v31);
    objc_msgSend_deleteCharactersInRange_(v6, v33, v32 - 2, 2, v34);
  }
  return (NSString *)v6;
}

- (NSSet)BSSList
{
  return (NSSet *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7278, v2, v3);
}

- (void)setTransitionDisabledFlags:(int)a3
{
  objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC70B0, v7);
}

- (void)setPublicAirPlayNetwork:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC72C0, v7);
}

- (void)setNetworkGroupPriority:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7248, v7);
}

- (void)setSupportedSecurityTypes:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6D98, v7);
}

- (BOOL)isEqualToNetworkProfile:(id)a3
{
  id v5 = a3;
  uint64_t v10 = objc_msgSend_SSID(self, v6, v7, v8, v9);
  uint64_t v19 = objc_msgSend_SSID(v5, v11, v12, v13, v14);
  if (v10 != v19)
  {
    uint64_t v108 = objc_msgSend_SSID(self, v15, v16, v17, v18);
    if (!v108)
    {
      char isEqual = 0;
      goto LABEL_32;
    }
    uint64_t v28 = objc_msgSend_SSID(v5, v20, v21, v22, v23);
    if (!v28)
    {
      char isEqual = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v29 = objc_msgSend_SSID(self, v24, v25, v26, v27);
    uint64_t v34 = objc_msgSend_SSID(v5, v30, v31, v32, v33);
    if (!objc_msgSend_isEqual_(v29, v35, (uint64_t)v34, v36, v37))
    {
      char isEqual = 0;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v105 = v34;
    uint64_t v106 = v29;
    uint64_t v107 = v28;
  }
  uint64_t v38 = objc_msgSend_domainName(self, v15, v16, v17, v18);
  uint64_t v47 = objc_msgSend_domainName(v5, v39, v40, v41, v42);
  if (v38 != v47)
  {
    uint64_t v48 = objc_msgSend_domainName(self, v43, v44, v45, v46);
    if (v48)
    {
      uint64_t v53 = (void *)v48;
      uint64_t v58 = objc_msgSend_domainName(v5, v49, v50, v51, v52);
      if (v58)
      {
        uint64_t v3 = objc_msgSend_domainName(self, v54, v55, v56, v57);
        long long v63 = objc_msgSend_domainName(v5, v59, v60, v61, v62);
        if (objc_msgSend_isEqual_(v3, v64, (uint64_t)v63, v65, v66))
        {
          long long v101 = v63;
          uint64_t v102 = v58;
          uint64_t v103 = v53;
          goto LABEL_12;
        }
      }
    }

    char isEqual = 0;
    goto LABEL_29;
  }
LABEL_12:
  uint64_t v68 = objc_msgSend_internal(self, v43, v44, v45, v46);
  uint64_t v73 = objc_msgSend_internal(v5, v69, v70, v71, v72);
  if (v68 == (void *)v73)
  {

    char isEqual = 1;
    if (v38 == v47) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v78 = (void *)v73;
    uint64_t v104 = v3;
    uint64_t v79 = objc_msgSend_internal(self, v74, v75, v76, v77);
    if (v79)
    {
      uint64_t v84 = (void *)v79;
      uint64_t v85 = objc_msgSend_internal(v5, v80, v81, v82, v83);
      if (v85)
      {
        uint64_t v100 = v85;
        uint64_t v99 = objc_msgSend_internal(self, v86, v87, v88, v89);
        uint64_t v94 = objc_msgSend_internal(v5, v90, v91, v92, v93);
        char isEqual = objc_msgSend_isEqual_(v99, v95, (uint64_t)v94, v96, v97);

        uint64_t v85 = v100;
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {

      char isEqual = 0;
    }
    uint64_t v3 = v104;
    if (v38 == v47) {
      goto LABEL_28;
    }
  }

LABEL_28:
LABEL_29:
  uint64_t v29 = v106;
  uint64_t v28 = v107;
  uint64_t v34 = v105;
  if (v10 != v19) {
    goto LABEL_30;
  }
LABEL_32:

  return isEqual;
}

- (NSData)SSID
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6D50, v2, v3);
}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

- (void)setUserPreferredPasspointDomains:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7218, v3);
}

- (void)setUserPreferredNetworkNames:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7200, v3);
}

- (void)setUpdatedAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC71B8, v3);
}

- (void)setRoamingConsortiumList:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7158, v3);
}

- (void)setPrivacyProxyBlockedReason:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC72D8, v3);
}

- (void)setPayloadUUID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6FD8, v3);
}

- (void)setNetworkGroupID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7230, v3);
}

- (void)setNANServiceID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7338, v3);
}

- (void)setNAIRealmNameList:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7170, v3);
}

- (void)setLastJoinedByUserAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7020, v3);
}

- (void)setLastJoinedBySystemAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7038, v3);
}

- (void)setLastDiscoveredAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7260, v3);
}

- (void)setEAPProfile:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7128, v3);
}

- (void)setDisplayedOperatorName:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7140, v3);
}

- (void)setDNSHeuristicsFailureStateInfo:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC73E0, v3);
}

- (void)setCellularNetworkInfo:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7188, v3);
}

- (void)setCarplayUUID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC71D0, v3);
}

- (void)setCaptiveProfile:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6FA8, v3);
}

- (void)setBundleID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7050, v3);
}

- (void)setAddedAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7008, v3);
}

- (NSString)payloadUUID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6FD8, v2, v3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_internal, @"_internal", v3);
}

- (NSString)bundleID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7050, v2, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUseCachedIdentifier:(BOOL)a3
{
  self->_useCachedIdentifier = a3;
}

- (void)setCachedIdentifier:(id)a3
{
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v6 = objc_msgSend_externalForm(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  uint64_t v16 = objc_msgSend_networkName(self, v12, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, @"networkName", v18);

  uint64_t v22 = sub_1B4F59CC8(v11, 0, 1u);
  if (v22)
  {
    uint64_t v23 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v22, v20, v21);
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)__defaultProperties
{
  uint64_t v8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3, v4);
  for (uint64_t i = 0; i != 93; ++i)
  {
    uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v5, i, v6, v7);
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);
  }
  uint64_t v15 = objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (id)__requiredProperties
{
  return (id)objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)&unk_1F0DC86D0, v2, v3);
}

- (id)filteredNetworkProfileWithProperties:(id)a3
{
  return (id)objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, 0);
}

- (id)filteredNetworkProfileWithProperties:(id)a3 OSSpecificKeys:(id)a4
{
  return (id)objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, (uint64_t)a4);
}

- (int64_t)compareSupportedSecurityTypes:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_weakestSupportedSecurityType(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_weakestSupportedSecurityType(v4, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_strongestSupportedSecurityType(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_strongestSupportedSecurityType(v4, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_WAPISubtype(self, v25, v26, v27, v28);
  uint64_t v34 = objc_msgSend_WAPISubtype(v4, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_WEPSubtype(self, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_WEPSubtype(v4, v40, v41, v42, v43);

  if (v9 == v14)
  {
    if (v19 == v24) {
      return 0;
    }
    uint64_t v46 = v19;
    uint64_t v47 = v39;
    uint64_t v48 = v29;
    uint64_t v49 = v24;
  }
  else
  {
    uint64_t v46 = v9;
    uint64_t v47 = v39;
    uint64_t v48 = v29;
    uint64_t v49 = v14;
  }
  return CWFCompareSecurityType(v46, v47, v48, v49, v44, v34);
}

- (int64_t)compareUserPriority:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_userPreferredNetworkNames(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_userPreferredNetworkNames(v4, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_userPreferredPasspointDomains(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_userPreferredPasspointDomains(v4, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_domainName(self, v25, v26, v27, v28);
  uint64_t v34 = objc_msgSend_domainName(v4, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_networkName(self, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_networkName(v4, v40, v41, v42, v43);

  uint64_t v80 = v24;
  uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v24, v45, (uint64_t)v29, v46, v47);
  uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v19, v49, (uint64_t)v34, v50, v51);
  uint64_t v82 = (void *)v39;
  uint64_t v83 = v14;
  uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v14, v53, v39, v54, v55);
  uint64_t v81 = (void *)v44;
  long long v63 = objc_msgSend_objectForKeyedSubscript_(v9, v57, v44, v58, v59);
  uint64_t v85 = v9;
  if (v56 && v48)
  {
    objc_msgSend_laterDate_(v56, v60, (uint64_t)v48, v61, v62);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v56) {
      uint64_t v68 = v56;
    }
    else {
      uint64_t v68 = v48;
    }
    id v64 = v68;
  }
  uint64_t v69 = v64;
  uint64_t v84 = v19;
  if (v63 && v52)
  {
    objc_msgSend_laterDate_(v63, v65, (uint64_t)v52, v66, v67);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v63) {
      uint64_t v74 = v63;
    }
    else {
      uint64_t v74 = v52;
    }
    id v70 = v74;
  }
  uint64_t v75 = v70;
  if (v69 && v70)
  {
    uint64_t v76 = v80;
    int64_t v77 = objc_msgSend_compare_(v69, v71, (uint64_t)v70, v72, v73);
  }
  else
  {
    uint64_t v76 = v80;
    if (v70) {
      uint64_t v78 = -1;
    }
    else {
      uint64_t v78 = 0;
    }
    if (v69) {
      int64_t v77 = 1;
    }
    else {
      int64_t v77 = v78;
    }
  }

  return v77;
}

- (id)matchingKnownBSS:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  objc_msgSend_BSSList(self, v5, v6, v7, v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_BSSID(v17, v10, v11, v12, v13);
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          uint64_t v20 = objc_msgSend_BSSID(v4, v10, v11, v12, v13);
          if (v20)
          {
            uint64_t v25 = (void *)v20;
            uint64_t v26 = objc_msgSend_BSSID(v17, v21, v22, v23, v24);
            uint64_t v31 = objc_msgSend_BSSID(v4, v27, v28, v29, v30);
            int isEqual = objc_msgSend_isEqual_(v26, v32, (uint64_t)v31, v33, v34);

            if (isEqual)
            {
              id v14 = v17;
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v14);
  }
LABEL_13:

  return v14;
}

- (id)__keyForProperty:(int64_t)a3
{
  id v4 = 0;
  id v5 = CWFNetworkProfilePropertySSIDKey;
  switch(a3)
  {
    case 1:
      goto LABEL_90;
    case 2:
      id v5 = CWFNetworkProfilePropertySupportedSecurityTypesKey;
      goto LABEL_90;
    case 3:
      id v5 = CWFNetworkProfilePropertyWEPSubtypeKey;
      goto LABEL_90;
    case 4:
      id v5 = CWFNetworkProfilePropertyWAPISubtypeKey;
      goto LABEL_90;
    case 5:
      id v5 = CWFNetworkProfilePropertyCaptiveProfileKey;
      goto LABEL_90;
    case 6:
      id v5 = CWFNetworkProfilePropertyHiddenStateKey;
      goto LABEL_90;
    case 7:
      id v5 = CWFNetworkProfilePropertyAutoJoinDisabledKey;
      goto LABEL_90;
    case 8:
      id v5 = CWFNetworkProfilePropertyPasswordSharingDisabledKey;
      goto LABEL_90;
    case 9:
      id v5 = CWFNetworkProfilePropertyPayloadUUIDKey;
      goto LABEL_90;
    case 10:
      id v5 = CWFNetworkProfilePropertyBundleIDKey;
      goto LABEL_90;
    case 11:
      id v5 = CWFNetworkProfilePropertyAddReasonKey;
      goto LABEL_90;
    case 12:
      id v5 = CWFNetworkProfilePropertyAddedAtKey;
      goto LABEL_90;
    case 13:
      id v5 = CWFNetworkProfilePropertyLastJoinedByUserAtKey;
      goto LABEL_90;
    case 14:
      id v5 = CWFNetworkProfilePropertyLastJoinedBySystemAtKey;
      goto LABEL_90;
    case 15:
      id v5 = CWFNetworkProfilePropertyPersonalHotspotKey;
      goto LABEL_90;
    case 16:
      id v5 = CWFNetworkProfilePropertySystemModeKey;
      goto LABEL_90;
    case 18:
      id v5 = CWFNetworkProfilePropertyEAPProfileKey;
      goto LABEL_90;
    case 19:
      id v5 = CWFNetworkProfilePropertyPasspointDomainNameKey;
      goto LABEL_90;
    case 20:
      id v5 = CWFNetworkProfilePropertyPasspointNAIRealmNameListKey;
      goto LABEL_90;
    case 21:
      id v5 = CWFNetworkProfilePropertyPasspointRoamingConsortiumListKey;
      goto LABEL_90;
    case 22:
      id v5 = CWFNetworkProfilePropertyPasspointCellularNetworkInfoKey;
      goto LABEL_90;
    case 23:
      id v5 = CWFNetworkProfilePropertyPasspointServiceProviderRoamingEnabledKey;
      goto LABEL_90;
    case 24:
      id v5 = CWFNetworkProfilePropertyPasspointDisplayedOperatorNameKey;
      goto LABEL_90;
    case 25:
      id v5 = CWFNetworkProfilePropertyLowDataModeKey;
      goto LABEL_90;
    case 26:
      id v5 = CWFNetworkProfilePropertyOSSpecificAttributesKey;
      goto LABEL_90;
    case 27:
      id v5 = CWFNetworkProfilePropertyUpdatedAtKey;
      goto LABEL_90;
    case 28:
      id v5 = CWFNetworkProfilePropertyCarPlayUUIDKey;
      goto LABEL_90;
    case 29:
      id v5 = CWFNetworkProfilePropertyCarPlayNetworkKey;
      goto LABEL_90;
    case 30:
      id v5 = CWFNetworkProfilePropertyUserPreferredNetworkNamesKey;
      goto LABEL_90;
    case 31:
      id v5 = CWFNetworkProfilePropertyUserPreferredPasspointDomainsKey;
      goto LABEL_90;
    case 32:
      id v5 = CWFNetworkProfilePropertyNetworkGroupIDKey;
      goto LABEL_90;
    case 33:
      id v5 = CWFNetworkProfilePropertyNetworkGroupPriorityKey;
      goto LABEL_90;
    case 34:
      id v5 = CWFNetworkProfilePropertyLastDiscoveredAtKey;
      goto LABEL_90;
    case 35:
      id v5 = CWFNetworkProfilePropertyBSSListKey;
      goto LABEL_90;
    case 36:
      id v5 = CWFNetworkProfilePropertyPrivacyProxyEnabledKey;
      goto LABEL_90;
    case 37:
      id v5 = CWFNetworkProfilePropertyPrivacyProxyBlockedReasonKey;
      goto LABEL_90;
    case 38:
      id v5 = CWFNetworkProfilePropertyMovingKey;
      goto LABEL_90;
    case 39:
      id v5 = CWFNetworkProfilePropertyPublicKey;
      goto LABEL_90;
    case 40:
      id v5 = CWFNetworkProfilePropertyTransitionDisabledFlagsKey;
      goto LABEL_90;
    case 41:
      id v5 = CWFNetworkProfilePropertyNearbyShareableStatusKey;
      goto LABEL_90;
    case 42:
      id v5 = CWFNetworkProfilePropertyStandalone6GKey;
      goto LABEL_90;
    case 43:
      id v5 = CWFNetworkProfilePropertyDisable6EModeKey;
      goto LABEL_90;
    case 44:
      id v5 = CWFNetworkProfilePropertyDisable6EModeTimestampKey;
      goto LABEL_90;
    case 45:
      id v5 = CWFNetworkProfilePropertyDisableAutojoinUntilFirstUserJoinKey;
      goto LABEL_90;
    case 46:
      id v5 = CWFNetworkProfilePropertyNetworkDisabledUntilDateKey;
      goto LABEL_90;
    case 47:
      id v5 = CWFNetworkProfilePropertyPasspointHomeOperatorNetworkKey;
      goto LABEL_90;
    case 48:
      id v5 = CWFNetworkProfilePropertyPasspointProvisionedNetworkKey;
      goto LABEL_90;
    case 49:
      id v5 = CWFNetworkProfilePropertyPasspointAccountNameKey;
      goto LABEL_90;
    case 50:
      id v5 = CWFNetworkProfilePropertyHighPopularityKey;
      goto LABEL_90;
    case 51:
      id v5 = CWFNetworkProfilePropertyHighQualityKey;
      goto LABEL_90;
    case 52:
      id v5 = CWFNetworkProfilePropertyPotentiallyCaptiveKey;
      goto LABEL_90;
    case 53:
      id v5 = CWFNetworkProfilePropertyPotentiallyMovingKey;
      goto LABEL_90;
    case 54:
      id v5 = CWFNetworkProfilePropertySuspiciousKey;
      goto LABEL_90;
    case 55:
      id v5 = CWFNetworkProfilePropertyTCPGoodKey;
      goto LABEL_90;
    case 56:
      id v5 = CWFNetworkProfilePropertyLowPopularityKey;
      goto LABEL_90;
    case 57:
      id v5 = CWFNetworkProfilePropertyLowQualityKey;
      goto LABEL_90;
    case 58:
      id v5 = CWFNetworkProfilePropertyProminentDisplayKey;
      goto LABEL_90;
    case 59:
      id v5 = CWFNetworkProfilePropertyPopularityScoreKey;
      goto LABEL_90;
    case 60:
      id v5 = CWFNetworkProfilePropertyQualityScoreKey;
      goto LABEL_90;
    case 61:
      id v5 = CWFNetworkProfilePropertyTotalNetworkUsageKey;
      goto LABEL_90;
    case 62:
      id v5 = CWFNetworkProfilePropertyExpirationDateKey;
      goto LABEL_90;
    case 63:
    case 65:
      id v5 = CWFNetworkProfilePropertyNetworkOfInterestHomeStateKey;
      goto LABEL_90;
    case 66:
      id v5 = CWFNetworkProfilePropertyNetworkOfInterestWorkStateKey;
      goto LABEL_90;
    case 67:
      id v5 = CWFNetworkProfilePropertySSIDHarvestStatusKey;
      goto LABEL_90;
    case 68:
      id v5 = CWFNetworkProfilePropertyWalletIdentifierKey;
      goto LABEL_90;
    case 69:
      id v5 = CWFNetworkProfilePropertyOTASystemInfoBeaconProbeListKey;
      goto LABEL_90;
    case 70:
      id v5 = CWFNetworkProfilePropertySIMIdentifiersKey;
      goto LABEL_90;
    case 71:
      id v5 = CWFNetworkProfilePropertyNetworkQualityResponsivenessKey;
      goto LABEL_90;
    case 72:
      id v5 = CWFNetworkProfilePropertyNetworkQualityDateKey;
      goto LABEL_90;
    case 73:
      id v5 = CWFNetworkProfilePropertyLastDisconnectReasonKey;
      goto LABEL_90;
    case 74:
      id v5 = CWFNetworkProfilePropertyLastDisconnectTimestampKey;
      goto LABEL_90;
    case 75:
      id v5 = CWFNetworkProfilePropertyNANServiceIDKey;
      goto LABEL_90;
    case 76:
      id v5 = CWFNetworkProfilePropertyBlueAtlasNetworkKey;
      goto LABEL_90;
    case 77:
      id v5 = CWFNetworkProfilePropertyPublicAirPlayNetworkKey;
      goto LABEL_90;
    case 78:
      id v5 = CWFNetworkProfilePropertyLastJoinedBySystemAtWeekKey;
      goto LABEL_90;
    case 79:
      id v5 = CWFNetworkProfilePropertyWas6GHzOnlyAtKey;
      goto LABEL_90;
    case 80:
      id v5 = CWFNetworkProfilePropertyWas6GHzOnlyAtWeekKey;
      goto LABEL_90;
    case 81:
      id v5 = CWFNetworkProfilePropertySeamlessSSIDListKey;
      goto LABEL_90;
    case 82:
      id v5 = CWFNetworkProfilePropertyDNSHeuristicsFilteredNetworkKey;
      goto LABEL_90;
    case 83:
      id v5 = CWFNetworkProfilePropertyDNSHeuristicsFailureStateInfoKey;
      goto LABEL_90;
    case 84:
      id v5 = CWFNetworkProfilePropertyCachedPrivateMACAddressKey;
      goto LABEL_90;
    case 85:
      id v5 = CWFNetworkProfilePropertyCachedPrivateMACAddressUpdatedAtKey;
      goto LABEL_90;
    case 86:
      id v5 = CWFNetworkProfilePropertyPrivateMACAddressModeUserSettingKey;
      goto LABEL_90;
    case 87:
      id v5 = CWFNetworkProfilePropertyPrivateMACAddressModeUserSettingUpdatedAtKey;
      goto LABEL_90;
    case 88:
      id v5 = CWFNetworkProfilePropertyPrivateMACAddressModeConfigurationProfileSettingKey;
      goto LABEL_90;
    case 89:
      id v5 = CWFNetworkProfilePropertyPrivateMACAddressEvaluationStateKey;
      goto LABEL_90;
    case 90:
      id v5 = CWFNetworkProfilePropertyPrivateMACAddressEvaluatedAtKey;
      goto LABEL_90;
    case 91:
      id v5 = CWFNetworkProfilePropertyWasHiddenBeforeKey;
      goto LABEL_90;
    case 92:
      id v5 = CWFNetworkProfilePropertyDiscoveredDevicesKey;
LABEL_90:
      id v4 = *v5;
      break;
    default:
      break;
  }
  return v4;
}

- (id)externalForm
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3, v4);
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  uint64_t v11 = objc_msgSend_allKeys(self->_internal, v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v159, (uint64_t)v165, 16);
  if (v13)
  {
    uint64_t v18 = v13;
    uint64_t v19 = MEMORY[0x1E4F1CC28];
    uint64_t v20 = MEMORY[0x1E4F1CC38];
    uint64_t v154 = *(void *)v160;
    uint64_t v150 = v11;
    uint64_t v151 = v6;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v160 != v154) {
          objc_enumerationMutation(v11);
        }
        uint64_t v22 = *(void **)(*((void *)&v159 + 1) + 8 * v21);
        uint64_t v23 = objc_msgSend_integerValue(v22, v14, v15, v16, v17);
        uint64_t v27 = objc_msgSend___keyForProperty_(self, v24, v23, v25, v26);
        uint64_t v32 = objc_msgSend_integerValue(v22, v28, v29, v30, v31);
        if (v27)
        {
          switch(v32)
          {
            case 2:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              uint64_t v75 = objc_msgSend_unsignedIntegerValue(v36, v71, v72, v73, v74);
              uint64_t v68 = sub_1B4F53860(v75, v76, v77, v78, v79);
              goto LABEL_28;
            case 3:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              unint64_t v84 = objc_msgSend_integerValue(v36, v80, v81, v82, v83);
              uint64_t v68 = sub_1B4F53D48(v84, v85, v86, v87, v88);
              goto LABEL_28;
            case 4:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              unint64_t v93 = objc_msgSend_integerValue(v36, v89, v90, v91, v92);
              uint64_t v68 = sub_1B4F53EB8(v93, v94, v95, v96, v97);
              goto LABEL_28;
            case 6:
            case 25:
            case 38:
            case 39:
              uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              uint64_t v56 = objc_msgSend_integerValue(v51, v52, v53, v54, v55);

              if (v56)
              {
                if (v56 == 1) {
                  objc_msgSend_setObject_forKeyedSubscript_(v6, v57, v20, (uint64_t)v27, v58);
                }
                else {
                  objc_msgSend_setObject_forKeyedSubscript_(v6, v57, v19, (uint64_t)v27, v58);
                }
              }
              break;
            case 7:
            case 8:
            case 15:
            case 16:
            case 29:
            case 42:
            case 45:
            case 47:
            case 48:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
            case 58:
            case 76:
            case 77:
            case 82:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              if (!objc_msgSend_BOOLValue(v36, v37, v38, v39, v40)) {
                goto LABEL_14;
              }
              goto LABEL_13;
            case 11:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              unint64_t v102 = objc_msgSend_integerValue(v36, v98, v99, v100, v101);
              uint64_t v68 = sub_1B4F53FD4(v102, v103, v104, v105, v106);
              goto LABEL_28;
            case 20:
            case 21:
            case 22:
            case 26:
            case 30:
            case 31:
            case 69:
            case 70:
            case 81:
            case 83:
            case 92:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              if (objc_msgSend_count(v36, v47, v48, v49, v50)) {
                goto LABEL_13;
              }
              goto LABEL_14;
            case 23:
            case 36:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              if (objc_msgSend_BOOLValue(v36, v59, v60, v61, v62)) {
                goto LABEL_14;
              }
              goto LABEL_13;
            case 33:
            case 40:
            case 41:
            case 43:
            case 59:
            case 60:
            case 61:
            case 64:
            case 65:
            case 66:
            case 67:
            case 73:
            case 78:
            case 80:
            case 89:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              if (!objc_msgSend_unsignedIntegerValue(v36, v43, v44, v45, v46)) {
                goto LABEL_14;
              }
LABEL_13:
              objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v36, (uint64_t)v27, v42);
              goto LABEL_14;
            case 35:
              uint64_t v108 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              uint64_t v111 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v109, @"BSSID", 0, v110);
              long long v155 = 0u;
              long long v156 = 0u;
              long long v157 = 0u;
              long long v158 = 0u;
              uint64_t v152 = (void *)v111;
              uint64_t v163 = v111;
              uint64_t v114 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v112, (uint64_t)&v163, 1, v113);
              long long v153 = v108;
              uint64_t v118 = objc_msgSend_sortedArrayUsingDescriptors_(v108, v115, (uint64_t)v114, v116, v117);

              uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v119, (uint64_t)&v155, (uint64_t)v164, 16);
              if (v120)
              {
                uint64_t v125 = v120;
                uint64_t v126 = 0;
                uint64_t v127 = *(void *)v156;
                do
                {
                  for (uint64_t i = 0; i != v125; ++i)
                  {
                    if (*(void *)v156 != v127) {
                      objc_enumerationMutation(v118);
                    }
                    uint64_t v133 = objc_msgSend_externalForm(*(void **)(*((void *)&v155 + 1) + 8 * i), v121, v122, v123, v124);
                    if (v133)
                    {
                      if (!v126)
                      {
                        uint64_t v126 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v129, v130, v131, v132);
                      }
                      objc_msgSend_addObject_(v126, v129, (uint64_t)v133, v131, v132);
                    }
                  }
                  uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v121, (uint64_t)&v155, (uint64_t)v164, 16);
                }
                while (v125);
              }
              else
              {
                uint64_t v126 = 0;
              }

              uint64_t v140 = objc_msgSend_copy(v126, v136, v137, v138, v139);
              uint64_t v6 = v151;
              objc_msgSend_setObject_forKeyedSubscript_(v151, v141, (uint64_t)v140, (uint64_t)v27, v142);

              uint64_t v11 = v150;
              uint64_t v19 = MEMORY[0x1E4F1CC28];
              uint64_t v20 = MEMORY[0x1E4F1CC38];
              break;
            case 86:
            case 88:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              uint64_t v67 = objc_msgSend_integerValue(v36, v63, v64, v65, v66);
              uint64_t v68 = sub_1B4F55A80(v67);
LABEL_28:
              uint64_t v107 = (void *)v68;
              objc_msgSend_setObject_forKeyedSubscript_(v6, v69, v68, (uint64_t)v27, v70);

              goto LABEL_14;
            default:
              uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v33, (uint64_t)v22, v34, v35);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v134, (uint64_t)v36, (uint64_t)v27, v135);
LABEL_14:

              break;
          }
        }

        ++v21;
      }
      while (v21 != v18);
      uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v159, (uint64_t)v165, 16);
      uint64_t v18 = v143;
    }
    while (v143);
  }

  uint64_t v148 = objc_msgSend_copy(v6, v144, v145, v146, v147);
  return v148;
}

- (void)mergeWithNetworkProfile:(id)a3
{
  internal = self->_internal;
  objc_msgSend_internal(a3, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v6, (uint64_t)v9, v7, v8);
}

- (id)coreWiFiSpecificAttributes
{
  uint64_t v6 = objc_msgSend___coreWiFiSpecificProperties(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v7, (uint64_t)v6, v8, v9);
  uint64_t v15 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v11, v12, v13, v14);
  uint64_t v17 = objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_(self, v16, (uint64_t)v10, 0, (uint64_t)v15);

  uint64_t v22 = objc_msgSend_externalForm(v17, v18, v19, v20, v21);

  return v22;
}

- (id)changedPropertiesFromNetworkProfile:(id)a3
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_externalForm(self, v5, v6, v7, v8);
  uint64_t v10 = [CWFNetworkProfile alloc];
  uint64_t v137 = (void *)v9;
  uint64_t v14 = objc_msgSend_initWithExternalForm_(v10, v11, v9, v12, v13);
  uint64_t v138 = v4;
  uint64_t v19 = objc_msgSend_externalForm(v4, v15, v16, v17, v18);
  uint64_t v20 = [CWFNetworkProfile alloc];
  uint64_t v136 = (void *)v19;
  uint64_t v24 = objc_msgSend_initWithExternalForm_(v20, v21, v19, v22, v23);
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v25, v26, v27, v28);
  id v144 = (id)objc_claimAutoreleasedReturnValue();
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  uint64_t v33 = objc_msgSend_internal(v14, v29, v30, v31, v32);
  uint64_t v38 = objc_msgSend_allKeys(v33, v34, v35, v36, v37);

  id obj = v38;
  uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v150, (uint64_t)v154, 16);
  if (v148)
  {
    uint64_t v147 = *(void *)v151;
    uint64_t v139 = v24;
    uint64_t v140 = v14;
    do
    {
      for (uint64_t i = 0; i != v148; ++i)
      {
        if (*(void *)v151 != v147) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void *)(*((void *)&v150 + 1) + 8 * i);
        uint64_t v46 = objc_msgSend_internal(v14, v40, v41, v42, v43);
        uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v46, v47, v45, v48, v49);
        uint64_t v55 = objc_msgSend_internal(v24, v51, v52, v53, v54);
        uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v55, v56, v45, v57, v58);
        if (v50 == (void *)v59)
        {

          continue;
        }
        uint64_t v64 = (void *)v59;
        uint64_t v149 = v46;
        uint64_t v65 = objc_msgSend_internal(v14, v60, v61, v62, v63);
        uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v65, v66, v45, v67, v68);
        if (!v73) {
          goto LABEL_13;
        }
        uint64_t v74 = v24;
        uint64_t v146 = objc_msgSend_internal(v24, v69, v70, v71, v72);
        uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v146, v75, v45, v76, v77);
        if (!v78)
        {

LABEL_13:
LABEL_14:
          objc_msgSend_addObject_(v144, v40, v45, v42, v43);
          continue;
        }
        uint64_t v142 = (void *)v78;
        uint64_t v141 = objc_msgSend_internal(v14, v79, v80, v81, v82);
        uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v141, v83, v45, v84, v85);
        uint64_t v91 = objc_msgSend_internal(v74, v87, v88, v89, v90);
        uint64_t v95 = objc_msgSend_objectForKeyedSubscript_(v91, v92, v45, v93, v94);
        char isEqual = objc_msgSend_isEqual_(v86, v96, (uint64_t)v95, v97, v98);

        uint64_t v14 = v140;
        uint64_t v24 = v139;
        if ((isEqual & 1) == 0) {
          goto LABEL_14;
        }
      }
      uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v150, (uint64_t)v154, 16);
    }
    while (v148);
  }

  uint64_t v99 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v104 = objc_msgSend_internal(v24, v100, v101, v102, v103);
  uint64_t v109 = objc_msgSend_allKeys(v104, v105, v106, v107, v108);
  uint64_t v113 = objc_msgSend_setWithArray_(v99, v110, (uint64_t)v109, v111, v112);

  uint64_t v114 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v119 = objc_msgSend_internal(v14, v115, v116, v117, v118);
  uint64_t v124 = objc_msgSend_allKeys(v119, v120, v121, v122, v123);
  uint64_t v128 = objc_msgSend_setWithArray_(v114, v125, (uint64_t)v124, v126, v127);
  objc_msgSend_minusSet_(v113, v129, (uint64_t)v128, v130, v131);

  objc_msgSend_unionSet_(v144, v132, (uint64_t)v113, v133, v134);
  return v144;
}

- (id)changedOSSpecificKeysFromNetworkProfile:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_externalForm(self, v10, v11, v12, v13);
  uint64_t v15 = [CWFNetworkProfile alloc];
  uint64_t v109 = (void *)v14;
  uint64_t v108 = objc_msgSend_initWithExternalForm_(v15, v16, v14, v17, v18);
  uint64_t v23 = objc_msgSend_OSSpecificAttributes(v108, v19, v20, v21, v22);
  uint64_t v110 = v4;
  uint64_t v28 = objc_msgSend_externalForm(v4, v24, v25, v26, v27);
  uint64_t v29 = [CWFNetworkProfile alloc];
  uint64_t v107 = (void *)v28;
  uint64_t v106 = objc_msgSend_initWithExternalForm_(v29, v30, v28, v31, v32);
  uint64_t v37 = objc_msgSend_OSSpecificAttributes(v106, v33, v34, v35, v36);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v42 = objc_msgSend_allKeys(v23, v38, v39, v40, v41);
  uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v116, (uint64_t)v120, 16);
  if (v115)
  {
    uint64_t v47 = *(void *)v117;
    uint64_t v111 = v42;
    uint64_t v112 = v37;
    uint64_t v113 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v115; ++i)
      {
        if (*(void *)v117 != v47) {
          objc_enumerationMutation(v42);
        }
        uint64_t v49 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v23, v44, v49, v45, v46);
        uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v37, v51, v49, v52, v53);
        if (v50 == (void *)v54)
        {

          continue;
        }
        uint64_t v58 = (void *)v54;
        uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v23, v55, v49, v56, v57);
        if (!v59) {
          goto LABEL_13;
        }
        uint64_t v63 = (void *)v59;
        uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v37, v60, v49, v61, v62);
        if (!v64)
        {

          uint64_t v47 = v113;
LABEL_13:

LABEL_14:
          objc_msgSend_addObject_(v9, v44, v49, v45, v46);
          continue;
        }
        uint64_t v68 = (void *)v64;
        uint64_t v69 = objc_msgSend_objectForKeyedSubscript_(v23, v65, v49, v66, v67);
        objc_msgSend_objectForKeyedSubscript_(v37, v70, v49, v71, v72);
        uint64_t v73 = v23;
        uint64_t v75 = v74 = v9;
        char isEqual = objc_msgSend_isEqual_(v69, v76, (uint64_t)v75, v77, v78);

        uint64_t v9 = v74;
        uint64_t v23 = v73;
        uint64_t v37 = v112;

        uint64_t v42 = v111;
        uint64_t v47 = v113;
        if ((isEqual & 1) == 0) {
          goto LABEL_14;
        }
      }
      uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v116, (uint64_t)v120, 16);
    }
    while (v115);
  }

  uint64_t v79 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v84 = objc_msgSend_allKeys(v37, v80, v81, v82, v83);
  uint64_t v88 = objc_msgSend_setWithArray_(v79, v85, (uint64_t)v84, v86, v87);

  uint64_t v89 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v94 = objc_msgSend_allKeys(v23, v90, v91, v92, v93);
  uint64_t v98 = objc_msgSend_setWithArray_(v89, v95, (uint64_t)v94, v96, v97);
  objc_msgSend_minusSet_(v88, v99, (uint64_t)v98, v100, v101);

  objc_msgSend_unionSet_(v9, v102, (uint64_t)v88, v103, v104);
  return v9;
}

- (void)setDisable6EMode:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6DB0, v7);
}

- (NSDate)disable6EModeTimestamp
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6DC8, v2, v3);
}

- (void)setDisable6EModeTimestamp:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6DC8, v3);
}

- (BOOL)isAmbiguousNetworkName
{
  id v5 = objc_msgSend_networkName(self, a2, v2, v3, v4);
  unsigned __int8 v10 = sub_1B4F54AF0(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setWEPSubtype:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6F30, v7);
}

- (void)setWAPISubtype:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6F48, v7);
}

- (BOOL)isOpen
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 9) & 1;
}

- (BOOL)isOWE
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 8) & 1;
}

- (BOOL)isWEP
{
  return objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 1;
}

- (BOOL)isWAPI
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 1) & 1;
}

- (BOOL)isWPA
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC) != 0;
}

- (BOOL)isWPA2
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x30) != 0;
}

- (BOOL)isWPA3
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC0) != 0;
}

- (BOOL)isPSK
{
  char v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  char v11 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) != 0) {
      return 1;
    }
    return (v11 & 0x14) != 0 || (v11 & 0x40) != 0;
  }
  uint64_t v13 = objc_msgSend_WEPSubtype(self, v7, v8, v9, v10);
  BOOL result = 1;
  if ((v11 & 2) == 0 && v13 == 5) {
    return (v11 & 0x14) != 0 || (v11 & 0x40) != 0;
  }
  return result;
}

- (BOOL)isEAP
{
  char v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  char v11 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 8) != 0) {
      return 1;
    }
    return (v11 & 0x20) != 0 || v11 < 0;
  }
  uint64_t v13 = objc_msgSend_WEPSubtype(self, v7, v8, v9, v10);
  BOOL result = 1;
  if ((v11 & 8) == 0 && v13 != 5) {
    return (v11 & 0x20) != 0 || v11 < 0;
  }
  return result;
}

- (unint64_t)strongestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_WEPSubtype(self, v12, v13, v14, v15);
  return CWFStrongestSecurityType(v6, v11, v16);
}

- (unint64_t)weakestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_WEPSubtype(self, v12, v13, v14, v15);
  return CWFWeakestSecurityType(v6, v11, v16);
}

- (void)setWasHiddenBefore:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6F90, v3);
}

- (BOOL)isCaptiveStateDetermined
{
  if (!sub_1B4F408A8()) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_captiveProfile(self, v3, v4, v5, v6);
  sub_1B4F40A58();
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, v8, v10, v11);
  BOOL v13 = v12 != 0;

  return v13;
}

- (BOOL)bypassCaptive
{
  if (!sub_1B4F408A8()) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_captiveProfile(self, v3, v4, v5, v6);
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v8 = (uint64_t *)qword_1EB4B25B0;
  uint64_t v31 = qword_1EB4B25B0;
  if (!qword_1EB4B25B0)
  {
    uint64_t v9 = sub_1B4F773F4();
    v29[3] = (uint64_t)dlsym(v9, "kCNSCaptiveBypassProperty");
    qword_1EB4B25B0 = v29[3];
    uint64_t v8 = (uint64_t *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (v8)
  {
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v7, v10, *v8, v12, v13);
    char v19 = objc_msgSend_BOOLValue(v14, v15, v16, v17, v18);

    return v19;
  }
  uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
  uint64_t v25 = objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)"CFStringRef getkCNSCaptiveBypassProperty(void)", v23, v24);
  uint64_t v26 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v27, (uint64_t)v25, @"CWFNetworkProfile.m", 33, @"%s", v26);

  __break(1u);
  return result;
}

- (NSDate)captiveWebsheetLoginDate
{
  if (sub_1B4F408A8())
  {
    uint64_t v7 = objc_msgSend_captiveProfile(self, v3, v4, v5, v6);
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v8 = (uint64_t *)qword_1E9D45C28;
    uint64_t v26 = qword_1E9D45C28;
    if (!qword_1E9D45C28)
    {
      uint64_t v9 = sub_1B4F773F4();
      v24[3] = (uint64_t)dlsym(v9, "kCNSCaptiveNetworkWebSheetLoginDateProperty");
      qword_1E9D45C28 = v24[3];
      uint64_t v8 = (uint64_t *)v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (!v8)
    {
      uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"CFStringRef getkCNSCaptiveNetworkWebSheetLoginDateProperty(void)", v18, v19);
      uint64_t v21 = dlerror();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v22, (uint64_t)v20, @"CWFNetworkProfile.m", 34, @"%s", v21);

      __break(1u);
      return result;
    }
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v7, v10, *v8, v12, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  return (NSDate *)v14;
}

- (BOOL)isPasswordSharingSupported
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isWAPI(self, v6, v7, v8, v9) & 1) == 0
      && (objc_msgSend_isWEP(self, v10, v11, v12, v13) & 1) == 0
      && (objc_msgSend_isEAP(self, v14, v15, v16, v17) & 1) == 0
      && (objc_msgSend_isProfileBased(self, v18, v19, v20, v21) & 1) == 0
      && !objc_msgSend_isOWE(self, v22, v23, v24, v25);
}

- (BOOL)isPasswordSharingDisabled
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6FC0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasswordSharingDisabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6FC0, v7);
}

- (BOOL)isProfileBased
{
  uint64_t v5 = objc_msgSend_payloadUUID(self, a2, v2, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (int64_t)addReason
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6FF0, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDate)addedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7008, v2, v3);
}

- (NSDate)lastJoinedOnAnyDeviceAt
{
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, v2, v3, v4);
  double v7 = v6;
  uint64_t v12 = objc_msgSend_lastJoinedAt(self, v8, v9, v10, v11);
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  double v18 = v17;
  uint64_t v23 = objc_msgSend_lastDisconnectTimestamp(self, v19, v20, v21, v22);
  objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26, v27);
  if (v18 <= v7 && v32 <= v7)
  {
    double v34 = v32;
    if (v32 <= v18)
    {
      double v34 = v18;
    }
    else
    {
      id v35 = v23;

      uint64_t v12 = v35;
    }
  }
  else
  {
    double v34 = 0.0;
  }
  uint64_t JoinedBySystemAtWeek = objc_msgSend_lastJoinedBySystemAtWeek(self, v28, v29, v30, v31);
  if (v7 >= (double)(unint64_t)(604800 * JoinedBySystemAtWeek))
  {
    double v41 = (double)(unint64_t)(604800 * JoinedBySystemAtWeek);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v37, v38, v39, v40, v41);
  }
  else
  {
    double v41 = 0.0;
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v37, v38, v39, v40, 0.0);
  uint64_t v42 = };
  uint64_t v43 = (void *)v42;
  if (v34 > 0.0 || v41 > 0.0)
  {
    if (v34 <= v41) {
      uint64_t v45 = (void *)v42;
    }
    else {
      uint64_t v45 = v12;
    }
    id v44 = v45;
  }
  else
  {
    id v44 = 0;
  }
  uint64_t v46 = (NSDate *)v44;

  return v46;
}

- (BOOL)isAppBased
{
  uint64_t v5 = objc_msgSend_bundleID(self, a2, v2, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)isHotspot
{
  if ((objc_msgSend_isCaptive(self, a2, v2, v3, v4) & 1) != 0
    || (objc_msgSend_isPasspoint(self, v6, v7, v8, v9) & 1) != 0)
  {
    return 1;
  }
  uint64_t v15 = objc_msgSend_acceptedEAPTypes(self, v10, v11, v12, v13);
  if (objc_msgSend_containsObject_(v15, v16, (uint64_t)&unk_1F0DC7080, v17, v18))
  {
    char v14 = 1;
  }
  else
  {
    uint64_t v23 = objc_msgSend_acceptedEAPTypes(self, v19, v20, v21, v22);
    char v14 = objc_msgSend_containsObject_(v23, v24, (uint64_t)&unk_1F0DC7098, v25, v26);
  }
  return v14;
}

- (BOOL)isSystemMode
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC70E0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSystemMode:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC70E0, v7);
}

- (BOOL)isSessionBased
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC70F8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDictionary)EAPProfile
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7128, v2, v3);
}

- (NSArray)acceptedEAPTypes
{
  uint64_t v5 = objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  char v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"AcceptEAPTypes", v7, v8);

  return (NSArray *)v9;
}

- (NSArray)innerAcceptedEAPTypes
{
  uint64_t v5 = objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  char v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"InnerAcceptEAPTypes", v7, v8);

  return (NSArray *)v9;
}

- (BOOL)isTLSCertificateRequired
{
  uint64_t v5 = objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  char v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"TLSCertificateIsRequired", v7, v8);
  char v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

- (NSArray)TLSTrustedServerNames
{
  uint64_t v5 = objc_msgSend_EAPProfile(self, a2, v2, v3, v4);
  char v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"TLSTrustedServerNames", v7, v8);

  return (NSArray *)v9;
}

- (NSString)displayedOperatorName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7140, v2, v3);
}

- (NSArray)roamingConsortiumList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7158, v2, v3);
}

- (NSArray)NAIRealmNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7170, v2, v3);
}

- (NSArray)cellularNetworkInfo
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7188, v2, v3);
}

- (BOOL)isServiceProviderRoamingEnabled
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC71A0, v2, v3);
  char v9 = v4;
  if (v4) {
    char v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)setOSSpecificValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (v11
    && (objc_msgSend_supportedOSSpecificKeys(CWFNetworkProfile, v7, v8, v9, v10),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_1F0DC6D80, v18, v19);

    if (v6 && !v20)
    {
      uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v21, v22, v23, v24);
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1F0DC6D80, v27);
    }
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_1F0DC6D80, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v6, (uint64_t)v11, v30);
  }
  else
  {
    uint64_t v31 = CWFGetOSLog();
    if (v31)
    {
      uint64_t v28 = CWFGetOSLog();
    }
    else
    {
      uint64_t v28 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (id)OSSpecificValueForKey:(id)a3
{
  if (a3)
  {
    internal = self->_internal;
    id v4 = a3;
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_1F0DC6D80, v6, v7);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (NSDictionary)OSSpecificAttributes
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6D80, v2, v3);
  uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7, v8);

  return (NSDictionary *)v9;
}

- (NSDate)updatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC71B8, v2, v3);
}

- (NSDictionary)userPreferredNetworkNames
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7200, v2, v3);
}

- (NSDictionary)userPreferredPasspointDomains
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7218, v2, v3);
}

- (NSString)networkGroupID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7230, v2, v3);
}

- (unint64_t)networkGroupPriority
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7248, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDate)lastDiscoveredAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7260, v2, v3);
}

- (BOOL)isPrivacyProxyEnabled
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7290, v2, v3);
  unint64_t v9 = v4;
  if (v4) {
    char v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)setBlueAtlasNetwork:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC72A8, v7);
}

- (BOOL)isBlueAtlasNetwork
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC72A8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)privacyProxyBlockedReason
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC72D8, v2, v3);
}

- (int64_t)movingAttribute
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC72F0, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)publicAttribute
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7308, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)nearbyShareableStatus
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7320, v2, v3);
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)NANServiceID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7338, v2, v3);
}

- (BOOL)isAllowedInLockdownMode
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isOWE(self, v6, v7, v8, v9) & 1) == 0
      && (!objc_msgSend_isWEP(self, v10, v11, v12, v13)
       || (objc_msgSend_isPSK(self, v14, v15, v16, v17) & 1) == 0)
      && (!objc_msgSend_isWPA(self, v14, v15, v16, v17)
       || (objc_msgSend_isPSK(self, v18, v19, v20, v21) & 1) == 0)
      && (objc_msgSend_isWAPI(self, v18, v19, v20, v21) & 1) == 0
      && (objc_msgSend_isPasspoint(self, v22, v23, v24, v25) & 1) == 0
      && !objc_msgSend_isCaptive(self, v26, v27, v28, v29);
}

- (BOOL)isAutojoinDisabledUntilFirstUserJoin
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7350, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setDisableAutojoinUntilFirstUserJoin:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7350, v7);
}

- (id)networkDisabledUntilDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7368, v2, v3);
}

- (void)setNetworkDisabledUntilDate:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7368, v3);
}

- (BOOL)isPasspointHomeOperatorNetwork
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7380, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasspointHomeOperatorNetwork:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7380, v7);
}

- (BOOL)isPasspointProvisionedNetwork
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7398, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasspointProvisionedNetwork:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7398, v7);
}

- (id)passpointAccountName
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC73B0, v2, v3);
}

- (void)setPasspointAccountName:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC73B0, v3);
}

- (unint64_t)lastJoinedBySystemAtWeek
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6E10, v2, v3);
  unint64_t v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  uint64_t v15 = objc_msgSend_lastJoinedBySystemAt(self, v11, v12, v13, v14);
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18, v19);
  unint64_t v21 = vcvtmd_u64_f64(v20 / 86400.0 / 7.0);

  if (v10 <= v21) {
    return v21;
  }
  else {
    return v10;
  }
}

- (void)setLastJoinedBySystemAtWeek:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6E10, v7);
}

- (void)setWas6GHzOnlyAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6DE0, v3);
}

- (void)setWas6GHzOnlyAtWeek:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6DF8, v7);
}

- (NSArray)seamlessSSIDList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6E28, v2, v3);
}

- (void)setSeamlessSSIDList:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6E28, v3);
}

- (BOOL)isDNSHeuristicsFilteredNetwork
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC73C8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSDictionary)DNSHeuristicsFailureStateInfo
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC73E0, v2, v3);
}

- (BOOL)isHighPopularity
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC73F8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHighPopularity:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC73F8, v7);
}

- (BOOL)isPotentiallyCaptive
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7410, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPotentiallyCaptive:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7410, v7);
}

- (BOOL)isPotentiallyMoving
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7428, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPotentiallyMoving:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7428, v7);
}

- (BOOL)isHighQuality
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7440, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHighQuality:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7440, v7);
}

- (BOOL)isSuspicious
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7458, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSuspicious:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7458, v7);
}

- (BOOL)isTCPGood
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7470, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsTCPGood:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7470, v7);
}

- (BOOL)isLowPopularity
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7488, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowPopularity:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7488, v7);
}

- (BOOL)isLowQuality
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC74A0, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowQuality:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC74A0, v7);
}

- (BOOL)isProminentDisplay
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC74B8, v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setProminentDisplay:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC74B8, v7);
}

- (unint64_t)popularityScore
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC74D0, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPopularityScore:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC74D0, v7);
}

- (unint64_t)qualityScore
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC74E8, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setQualityScore:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC74E8, v7);
}

- (unint64_t)totalNetworkUsage
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7500, v2, v3);
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setTotalNetworkUsage:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7500, v7);
}

- (id)expirationDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7518, v2, v3);
}

- (void)setExpirationDate:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7518, v3);
}

- (id)lastHomeForceFixDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7530, v2, v3);
}

- (void)setLastHomeForceFixDate:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7530, v3);
}

- (int64_t)locationOfInterest
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7548, v2, v3);
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLocationOfInterest:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7548, v7);
}

- (int64_t)networkOfInterestHomeState
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7560, v2, v3);
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkOfInterestHomeState:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7560, v7);
}

- (int64_t)networkOfInterestWorkState
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7578, v2, v3);
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkOfInterestWorkState:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7578, v7);
}

- (int64_t)ssidHarvestStatus
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7590, v2, v3);
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSSIDHarvestStatus:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC7590, v7);
}

- (id)walletIdentifier
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC75A8, v2, v3);
}

- (void)setWalletIdentifier:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC75A8, v3);
}

- (id)OTASystemInfoBeaconProbeList
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC75C0, v2, v3);
}

- (void)setOTASystemInfoBeaconProbeList:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC75C0, v3);
}

- (id)SIMIdentifiers
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC75D8, v2, v3);
}

- (void)setSIMIdentifiers:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC75D8, v3);
}

- (double)networkQualityResponsiveness
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC75F0, v2, v3);
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, v5, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v7, (uint64_t)v9, (uint64_t)&unk_1F0DC75F0, v8);
}

- (id)networkQualityDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7608, v2, v3);
}

- (void)setNetworkQualityDate:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7608, v3);
}

- (int)lastDisconnectReason
{
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6E58, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLastDisconnectReason:(int)a3
{
  objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6E58, v7);
}

- (void)setLastDisconnectTimestamp:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6E40, v3);
}

- (void)setCachedPrivateMACAddress:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6E70, v3);
}

- (void)setCachedPrivateMACAddressUpdatedAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6E88, v3);
}

- (void)setPrivateMACAddressModeUserSetting:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6EA0, v7);
}

- (NSDate)privateMACAddressModeUserSettingUpdatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6EB8, v2, v3);
}

- (void)setPrivateMACAddressModeUserSettingUpdatedAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6EB8, v3);
}

- (void)setPrivateMACAddressModeConfigurationProfileSetting:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6ED0, v7);
}

- (void)setPrivateMACAddressEvaluationState:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC6EE8, v7);
}

- (BOOL)privateMACAddressEnabledForEvaluation
{
  return !objc_msgSend_privateMACAddressModeUserSetting(self, a2, v2, v3, v4)
      && !objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v6, v7, v8, v9)
      && objc_msgSend_privateMACAddressEvaluationState(self, v10, v11, v12, v13) == 1;
}

- (BOOL)privateMACAddressDisabledByEvaluation
{
  return (objc_msgSend_isPersonalHotspot(self, a2, v2, v3, v4) & 1) == 0
      && !objc_msgSend_privateMACAddressModeUserSetting(self, v6, v7, v8, v9)
      && !objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v10, v11, v12, v13)
      && (unint64_t)(objc_msgSend_privateMACAddressEvaluationState(self, v14, v15, v16, v17) - 2) < 4;
}

- (NSDate)privateMACAddressEvaluatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F00, v2, v3);
}

- (void)setPrivateMACAddressEvaluatedAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6F00, v3);
}

- (void)setDiscoveredDevices:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC6F18, v3);
}

- (NSDictionary)discoveredDevices
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC6F18, v2, v3);
}

- (id)__descriptionForLowDataMode
{
  unint64_t v5 = objc_msgSend_lowDataMode(self, a2, v2, v3, v4);
  if (v5 > 2) {
    return @"?";
  }
  else {
    return off_1E60BBC00[v5];
  }
}

- (id)__descriptionForCaptiveFlags
{
  int v6 = objc_msgSend_bypassCaptive(self, a2, v2, v3, v4);
  if (!objc_msgSend_isCaptiveStateDetermined(self, v7, v8, v9, v10))
  {
    uint64_t v19 = @"?";
    double v20 = @"? (bypass)";
LABEL_5:
    if (v6) {
      uint64_t v19 = v20;
    }
    goto LABEL_14;
  }
  if (objc_msgSend_isCaptive(self, v11, v12, v13, v14))
  {
    uint64_t v19 = @"yes";
    double v20 = @"yes (bypass)";
    goto LABEL_5;
  }
  int v21 = objc_msgSend_wasCaptive(self, v15, v16, v17, v18);
  uint64_t v19 = @"no";
  if (v6) {
    uint64_t v19 = @"no (bypass)";
  }
  uint64_t v22 = @"was (bypass)";
  if (!v6) {
    uint64_t v22 = @"was";
  }
  if (v21) {
    uint64_t v19 = v22;
  }
LABEL_14:
  uint64_t v23 = v19;
  return v23;
}

- (id)__descriptionForHiddenState
{
  uint64_t v5 = objc_msgSend_hiddenState(self, a2, v2, v3, v4);
  int v6 = @"?";
  if (v5 == 2) {
    int v6 = @"no";
  }
  if (v5 == 1) {
    return @"yes";
  }
  else {
    return v6;
  }
}

- (id)__descriptionForMovingAttribute
{
  uint64_t v5 = objc_msgSend_movingAttribute(self, a2, v2, v3, v4);
  int v6 = @"?";
  if (v5 == 1) {
    int v6 = @"moving";
  }
  if (v5 == 2) {
    return @"stationary";
  }
  else {
    return v6;
  }
}

- (id)__descriptionForPublicAttribute
{
  uint64_t v5 = objc_msgSend_publicAttribute(self, a2, v2, v3, v4);
  int v6 = @"?";
  if (v5 == 2) {
    int v6 = @"private";
  }
  if (v5 == 1) {
    return @"public";
  }
  else {
    return v6;
  }
}

- (id)__descriptionForNearbyShareableStatus
{
  uint64_t v5 = objc_msgSend_nearbyShareableStatus(self, a2, v2, v3, v4);
  if ((unint64_t)(v5 - 1) > 8) {
    return @"?";
  }
  else {
    return off_1E60BBC18[v5 - 1];
  }
}

- (id)__descriptionFor6EMode
{
  unint64_t v5 = objc_msgSend_disable6EMode(self, a2, v2, v3, v4);
  if (v5 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, v6, @"? (%ld)", v7, v8, v5);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = off_1E60BBC60[v5];
  }
  return v9;
}

- (NSString)debugDescription
{
  int v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend___basicDescription(self, v7, v8, v9, v10);
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, @", ", v16, v17);
  if (objc_msgSend_isEAP(self, v18, v19, v20, v21)
    && objc_msgSend_isSystemMode(self, v22, v23, v24, v25))
  {
    objc_msgSend_appendString_(v6, v22, @"systemMode=yes, ", v24, v25);
  }
  if (objc_msgSend_transitionDisabledFlags(self, v22, v23, v24, v25))
  {
    uint64_t v30 = objc_msgSend_transitionDisabledFlags(self, v26, v27, v28, v29);
    id v35 = sub_1B4F54C18(v30, v31, v32, v33, v34);
    objc_msgSend_appendFormat_(v6, v36, @"transitionDisabledFlags=%@, ", v37, v38, v35);
  }
  if (objc_msgSend_movingAttribute(self, v26, v27, v28, v29))
  {
    uint64_t v43 = objc_msgSend___descriptionForMovingAttribute(self, v39, v40, v41, v42);
    objc_msgSend_appendFormat_(v6, v44, @"moving=%@, ", v45, v46, v43);
  }
  if (objc_msgSend_publicAttribute(self, v39, v40, v41, v42))
  {
    uint64_t v51 = objc_msgSend___descriptionForPublicAttribute(self, v47, v48, v49, v50);
    objc_msgSend_appendFormat_(v6, v52, @"public=%@, ", v53, v54, v51);
  }
  if (objc_msgSend_nearbyShareableStatus(self, v47, v48, v49, v50))
  {
    uint64_t v59 = objc_msgSend___descriptionForNearbyShareableStatus(self, v55, v56, v57, v58);
    objc_msgSend_appendFormat_(v6, v60, @"nearbyShareStatus=%@, ", v61, v62, v59);
  }
  if ((objc_msgSend_isPrivacyProxyEnabled(self, v55, v56, v57, v58) & 1) == 0) {
    objc_msgSend_appendString_(v6, v63, @"privacyProxy=no, ", v65, v66);
  }
  if (objc_msgSend_isAutojoinDisabledUntilFirstUserJoin(self, v63, v64, v65, v66)) {
    objc_msgSend_appendString_(v6, v67, @"disableAutojoinUntilFirstUserJoin=yes, ", v69, v70);
  }
  uint64_t v71 = objc_msgSend_networkDisabledUntilDate(self, v67, v68, v69, v70);

  if (v71)
  {
    uint64_t v76 = objc_msgSend_networkDisabledUntilDate(self, v72, v73, v74, v75);
    uint64_t v77 = sub_1B4F3D76C(v76);
    objc_msgSend_appendFormat_(v6, v78, @"networkDisabledUntilDate=%@, ", v79, v80, v77);
  }
  if (objc_msgSend_isPasspointHomeOperatorNetwork(self, v72, v73, v74, v75)) {
    objc_msgSend_appendString_(v6, v81, @"passpointHomeOperatorNetwork=yes, ", v83, v84);
  }
  if (objc_msgSend_isPasspointProvisionedNetwork(self, v81, v82, v83, v84)) {
    objc_msgSend_appendString_(v6, v85, @"passpointProvisionedNetwork=yes, ", v87, v88);
  }
  uint64_t v89 = objc_msgSend_passpointAccountName(self, v85, v86, v87, v88);

  if (v89)
  {
    uint64_t v94 = objc_msgSend_passpointAccountName(self, v90, v91, v92, v93);
    objc_msgSend_appendFormat_(v6, v95, @"passpointAccountName=%@, ", v96, v97, v94);
  }
  if (objc_msgSend_isHighPopularity(self, v90, v91, v92, v93)) {
    objc_msgSend_appendString_(v6, v98, @"highPopularity=yes, ", v100, v101);
  }
  if (objc_msgSend_isHighQuality(self, v98, v99, v100, v101)) {
    objc_msgSend_appendString_(v6, v102, @"highQuality=yes, ", v104, v105);
  }
  if (objc_msgSend_isPotentiallyCaptive(self, v102, v103, v104, v105)) {
    objc_msgSend_appendString_(v6, v106, @"potentiallyCaptive=yes, ", v108, v109);
  }
  if (objc_msgSend_isPotentiallyMoving(self, v106, v107, v108, v109)) {
    objc_msgSend_appendString_(v6, v110, @"potentiallyMoving=yes, ", v112, v113);
  }
  if (objc_msgSend_isSuspicious(self, v110, v111, v112, v113)) {
    objc_msgSend_appendString_(v6, v114, @"suspicious=yes, ", v116, v117);
  }
  if (objc_msgSend_isTCPGood(self, v114, v115, v116, v117)) {
    objc_msgSend_appendString_(v6, v118, @"tcpGood=yes, ", v120, v121);
  }
  if (objc_msgSend_isLowPopularity(self, v118, v119, v120, v121)) {
    objc_msgSend_appendString_(v6, v122, @"lowPopularity=yes, ", v124, v125);
  }
  if (objc_msgSend_isLowQuality(self, v122, v123, v124, v125)) {
    objc_msgSend_appendString_(v6, v126, @"lowQuality=yes, ", v128, v129);
  }
  if (objc_msgSend_isProminentDisplay(self, v126, v127, v128, v129)) {
    objc_msgSend_appendString_(v6, v130, @"prominentDisplay=yes, ", v132, v133);
  }
  if (objc_msgSend_popularityScore(self, v130, v131, v132, v133))
  {
    uint64_t v138 = objc_msgSend_popularityScore(self, v134, v135, v136, v137);
    objc_msgSend_appendFormat_(v6, v139, @"popularityScore=%lu, ", v140, v141, v138);
  }
  if (objc_msgSend_qualityScore(self, v134, v135, v136, v137))
  {
    uint64_t v146 = objc_msgSend_qualityScore(self, v142, v143, v144, v145);
    objc_msgSend_appendFormat_(v6, v147, @"qualityScore=%lu, ", v148, v149, v146);
  }
  if (objc_msgSend_totalNetworkUsage(self, v142, v143, v144, v145))
  {
    uint64_t v154 = objc_msgSend_totalNetworkUsage(self, v150, v151, v152, v153);
    objc_msgSend_appendFormat_(v6, v155, @"totalNetworkUsage=%lu, ", v156, v157, v154);
  }
  long long v158 = objc_msgSend_expirationDate(self, v150, v151, v152, v153);

  if (v158)
  {
    uint64_t v163 = objc_msgSend_expirationDate(self, v159, v160, v161, v162);
    uint64_t v164 = sub_1B4F3D76C(v163);
    objc_msgSend_appendFormat_(v6, v165, @"expirationDate=%@, ", v166, v167, v164);
  }
  uint64_t v168 = objc_msgSend_lastHomeForceFixDate(self, v159, v160, v161, v162);

  if (v168)
  {
    uint64_t v173 = objc_msgSend_lastHomeForceFixDate(self, v169, v170, v171, v172);
    uint64_t v174 = sub_1B4F3D76C(v173);
    objc_msgSend_appendFormat_(v6, v175, @"lastHomeForceFixDate=%@, ", v176, v177, v174);
  }
  if (objc_msgSend_locationOfInterest(self, v169, v170, v171, v172))
  {
    uint64_t v182 = objc_msgSend_locationOfInterest(self, v178, v179, v180, v181);
    objc_msgSend_appendFormat_(v6, v183, @"locationOfInterest=%lu, ", v184, v185, v182);
  }
  if (objc_msgSend_networkOfInterestHomeState(self, v178, v179, v180, v181)) {
    objc_msgSend_appendString_(v6, v186, @"networkOfInterestHomeState=yes, ", v188, v189);
  }
  if (objc_msgSend_networkOfInterestWorkState(self, v186, v187, v188, v189)) {
    objc_msgSend_appendString_(v6, v190, @"networkOfInterestWorkState=yes, ", v192, v193);
  }
  if (objc_msgSend_ssidHarvestStatus(self, v190, v191, v192, v193))
  {
    uint64_t v198 = objc_msgSend_ssidHarvestStatus(self, v194, v195, v196, v197);
    objc_msgSend_appendFormat_(v6, v199, @"ssidHarvestStatus=%lu, ", v200, v201, v198);
  }
  uint64_t v202 = objc_msgSend_walletIdentifier(self, v194, v195, v196, v197);

  if (v202)
  {
    v207 = objc_msgSend_walletIdentifier(self, v203, v204, v205, v206);
    objc_msgSend_appendFormat_(v6, v208, @"walletIdentifier=%@, ", v209, v210, v207);
  }
  uint64_t v211 = objc_msgSend_OTASystemInfoBeaconProbeList(self, v203, v204, v205, v206);

  if (v211)
  {
    v216 = objc_msgSend_OTASystemInfoBeaconProbeList(self, v212, v213, v214, v215);
    objc_msgSend_appendFormat_(v6, v217, @"OTASystemInfoBeaconProbeList=%@, ", v218, v219, v216);
  }
  uint64_t v220 = objc_msgSend_SIMIdentifiers(self, v212, v213, v214, v215);

  if (v220)
  {
    v225 = objc_msgSend_SIMIdentifiers(self, v221, v222, v223, v224);
    objc_msgSend_appendFormat_(v6, v226, @"SIMIdentifiers=%@, ", v227, v228, v225);
  }
  objc_msgSend_networkQualityResponsiveness(self, v221, v222, v223, v224);
  if (v233 > 0.0)
  {
    objc_msgSend_networkQualityResponsiveness(self, v229, v230, v231, v232);
    objc_msgSend_appendFormat_(v6, v234, @"networkQualityResponsiveness=%f, ", v235, v236, v237);
  }
  uint64_t v238 = objc_msgSend_networkQualityDate(self, v229, v230, v231, v232);

  if (v238)
  {
    v243 = objc_msgSend_networkQualityDate(self, v239, v240, v241, v242);
    uint64_t v244 = sub_1B4F3D76C(v243);
    objc_msgSend_appendFormat_(v6, v245, @"networkQualityDate=%@, ", v246, v247, v244);
  }
  if (objc_msgSend_isPublicAirPlayNetwork(self, v239, v240, v241, v242)) {
    objc_msgSend_appendString_(v6, v248, @"publicAirPlayNetwork=yes, ", v249, v250);
  }
  uint64_t v251 = objc_msgSend___descriptionForBSSListWithLimit_(self, v248, -1, v249, v250);
  objc_msgSend_appendString_(v6, v252, (uint64_t)v251, v253, v254);

  if (objc_msgSend_hasSuffix_(v6, v255, @", ", v256, v257))
  {
    uint64_t v262 = objc_msgSend_length(v6, v258, v259, v260, v261);
    objc_msgSend_deleteCharactersInRange_(v6, v263, v262 - 2, 2, v264);
  }
  id v265 = v6;

  return (NSString *)v265;
}

- (unint64_t)hash
{
  int v6 = objc_msgSend_SSID(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_domainName(self, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;
  uint64_t v26 = objc_msgSend_internal(self, v22, v23, v24, v25);
  unint64_t v31 = v21 ^ objc_msgSend_hash(v26, v27, v28, v29, v30);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v6 = objc_msgSend_allocWithZone_(CWFNetworkProfile, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_mutableCopy(self->_internal, v12, v13, v14, v15);
  objc_msgSend_setInternal_(v11, v17, (uint64_t)v16, v18, v19);

  return v11;
}

- (BOOL)_shouldDisplayDeviceNames
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && objc_msgSend_publicAttribute(self, v6, v7, v8, v9) != 1
      && (objc_msgSend_isPublicAirPlayNetwork(self, v10, v11, v12, v13) & 1) == 0
      && (objc_msgSend_isEAP(self, v14, v15, v16, v17) & 1) == 0
      && objc_msgSend_addReason(self, v18, v19, v20, v21) != 10;
}

- (id)_location
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = objc_msgSend_BSSList(self, a2, v2, v3, v4, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_location(v14, v7, v8, v9, v10);

        if (v15)
        {
          uint64_t v11 = objc_msgSend_location(v14, v7, v8, v9, v10);
          goto LABEL_11;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (BOOL)_isHomeNetwork
{
  if (objc_msgSend_networkOfInterestHomeState(self, a2, v2, v3, v4) == 1) {
    return 1;
  }
  uint64_t v11 = objc_msgSend_OSSpecificAttributes(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"NetworkOfInterestHomeState", v13, v14);
  if (objc_msgSend_integerValue(v15, v16, v17, v18, v19) == 1)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v24 = objc_msgSend_OSSpecificAttributes(self, v20, v21, v22, v23);
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"NetworkAtLocationOfInterestType", v26, v27);
    if (objc_msgSend_integerValue(v28, v29, v30, v31, v32) == 2)
    {
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v37 = objc_msgSend_OSSpecificAttributes(self, v33, v34, v35, v36);
      uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v37, v38, @"NetworkAtLocationOfInterestType", v39, v40);
      BOOL v10 = objc_msgSend_integerValue(v41, v42, v43, v44, v45) == 4;
    }
  }

  return v10;
}

@end