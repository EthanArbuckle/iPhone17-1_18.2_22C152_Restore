@interface AFSiriAudioRoute
- (AFSiriAudioRoute)initWithRouteDescription:(id)a3 hearingAidsAnnounceEnabled:(BOOL)a4 builtInSpeakerAnnounceEnabled:(BOOL)a5 ringerSwitchState:(int64_t)a6;
- (BOOL)_isBuiltInSpeakerRoute;
- (BOOL)_isHearingAidsRoute;
- (BOOL)hasAuthenticationCapability;
- (BOOL)isEqualToRoute:(id)a3;
- (BOOL)isRouteCurrentlyPicked;
- (BOOL)isThirdPartyBluetoothHeadset;
- (BOOL)supportsVolumeAdjustment;
- (NSDictionary)avscRouteDescription;
- (NSString)btAddress;
- (NSString)connectedBTProductID;
- (NSString)name;
- (NSString)productID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)routeName;
- (int64_t)_announcementPlatform;
- (int64_t)announcePlatformForRoute;
- (unint64_t)_getRouteCapabilities;
- (unint64_t)availableAnnouncementRequestTypes;
- (unint64_t)hash;
- (void)_initializeInternalState;
- (void)setAnnouncePlatformForRoute:(int64_t)a3;
- (void)setAvailableAnnouncementRequestTypes:(unint64_t)a3;
- (void)setAvscRouteDescription:(id)a3;
- (void)setBtAddress:(id)a3;
- (void)setConnectedBTProductID:(id)a3;
- (void)setName:(id)a3;
- (void)setProductID:(id)a3;
@end

@implementation AFSiriAudioRoute

- (void)_initializeInternalState
{
  avscRouteDescription = self->_avscRouteDescription;
  if (avscRouteDescription)
  {
    v4 = avscRouteDescription;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v5 = (id *)getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr;
    uint64_t v61 = getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_block_invoke;
      v57 = &unk_1E592C0B0;
      v6 = MediaExperienceLibrary_27262();
      v59[3] = (uint64_t)dlsym(v6, "AVSystemController_RouteDescriptionKey_IsGenuineAppleAccessory");
      getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessorySymbolLoc_ptr = v59[3];
      v5 = (id *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v5)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessory(void)"];
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 36, @"%s", dlerror(), v54, v55, v56, v57);
      goto LABEL_49;
    }
    id v7 = *v5;
    v8 = [(NSDictionary *)v4 objectForKey:v7];
    self->_isGenuineAppleAccessory = [v8 BOOLValue];

    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v9 = (id *)getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
    uint64_t v61 = getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_block_invoke;
      v57 = &unk_1E592C0B0;
      v10 = MediaExperienceLibrary_27262();
      v59[3] = (uint64_t)dlsym(v10, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
      getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr = v59[3];
      v9 = (id *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v9)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)"];
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 32, @"%s", dlerror(), v54, v55, v56, v57);
      goto LABEL_49;
    }
    id v11 = *v9;
    v12 = [(NSDictionary *)v4 objectForKey:v11];
    self->_isRouteCurrentlyPicked = [v12 BOOLValue];

    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v13 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr;
    uint64_t v61 = getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_block_invoke;
      v57 = &unk_1E592C0B0;
      v14 = MediaExperienceLibrary_27262();
      v59[3] = (uint64_t)dlsym(v14, "AVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP");
      getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAPSymbolLoc_ptr = v59[3];
      v13 = (id *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v13)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP(void)"];
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 30, @"%s", dlerror(), v54, v55, v56, v57);
      goto LABEL_49;
    }
    id v15 = *v13;
    v16 = [(NSDictionary *)v4 objectForKey:v15];
    self->_char isDoAPCapable = [v16 BOOLValue];

    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v17 = (id *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
    uint64_t v61 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_block_invoke;
      v57 = &unk_1E592C0B0;
      v18 = MediaExperienceLibrary_27262();
      v59[3] = (uint64_t)dlsym(v18, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive");
      getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr = v59[3];
      v17 = (id *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v17)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive(void)"];
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 27, @"%s", dlerror(), v54, v55, v56, v57);
      goto LABEL_49;
    }
    id v19 = *v17;
    v20 = [(NSDictionary *)v4 objectForKey:v19];
    self->_isHeadsetInEar = [v20 BOOLValue];

    v21 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled();
    v22 = [(NSDictionary *)v4 objectForKey:v21];

    if (v22)
    {
      self->_inEarDetectEnabledSpecified = 1;
      v23 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled();
      v24 = [(NSDictionary *)v4 objectForKey:v23];
      self->_inEarDetectEnabled = [v24 BOOLValue];
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v25 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
    uint64_t v61 = getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_block_invoke;
      v57 = &unk_1E592C0B0;
      v26 = MediaExperienceLibrary_27262();
      v59[3] = (uint64_t)dlsym(v26, "AVSystemController_RouteDescriptionKey_BTDetails_ProductID");
      getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr = v59[3];
      v25 = (id *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v25)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_ProductID(void)"];
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 33, @"%s", dlerror(), v54, v55, v56, v57);
      goto LABEL_49;
    }
    id v27 = *v25;
    v28 = [(NSDictionary *)v4 objectForKey:v27];
    connectedBTProductID = self->_connectedBTProductID;
    self->_connectedBTProductID = v28;

    BOOL v30 = [(NSString *)self->_connectedBTProductID hasPrefix:@"BTHeadphones"];
    v31 = self->_connectedBTProductID;
    if (v30)
    {
      v32 = @"BTHeadphones";
    }
    else
    {
      if (![(NSString *)self->_connectedBTProductID hasPrefix:@"BTHeadset"]) {
        goto LABEL_24;
      }
      v31 = self->_connectedBTProductID;
      v32 = @"BTHeadset";
    }
    v33 = [(NSString *)v31 substringFromIndex:[(__CFString *)v32 length]];
    productID = self->_productID;
    self->_productID = v33;

LABEL_24:
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v35 = (void *)getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
    uint64_t v61 = getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
    if (!getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_block_invoke;
      v57 = &unk_1E592C0B0;
      v36 = MediaExperienceLibrary_27262();
      v59[3] = (uint64_t)dlsym(v36, "AVSystemController_RouteDescriptionKey_RouteUID");
      getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr = v59[3];
      v35 = (void *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (v35)
    {
      v37 = [(NSDictionary *)v4 objectForKey:*v35];
      v38 = [v37 componentsSeparatedByString:@"-"];
      v39 = [v38 objectAtIndex:0];
      btAddress = self->_btAddress;
      self->_btAddress = v39;

      if ((AFBTProductIDSupportsAnnounce(self->_productID) & 1) != 0 || (char isDoAPCapable = self->_isDoAPCapable) != 0) {
        char isDoAPCapable = AFBTAnnounceCallsUnsupportedOnProductID(self->_productID) ^ 1;
      }
      self->_headsetSupportsAnnounceCalls = isDoAPCapable;
      self->_headsetSupportsIED = AFBTProductIDSupportsIED(self->_productID);
      self->_headsetSupportsFauxIED = AFBTProductIDSupportsFauxIED(self->_productID);
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x2020000000;
      v42 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
      uint64_t v61 = getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
      if (!getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr)
      {
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_block_invoke;
        v57 = &unk_1E592C0B0;
        v43 = MediaExperienceLibrary_27262();
        v59[3] = (uint64_t)dlsym(v43, "AVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged");
        getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr = v59[3];
        v42 = (id *)v59[3];
      }
      _Block_object_dispose(&v58, 8);
      if (v42)
      {
        id v44 = *v42;
        v45 = [(NSDictionary *)v4 objectForKey:v44];
        self->_isTipiRoute = [v45 BOOLValue];

        if (!self->_isTipiRoute && self->_isHeadsetInEar) {
          self->_shouldTakeRouteFromOtherConnectedDevice = 1;
        }
        uint64_t v58 = 0;
        v59 = &v58;
        uint64_t v60 = 0x2020000000;
        v46 = (id *)getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        uint64_t v61 = getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr)
        {
          uint64_t v54 = MEMORY[0x1E4F143A8];
          uint64_t v55 = 3221225472;
          v56 = __getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_block_invoke;
          v57 = &unk_1E592C0B0;
          v47 = MediaExperienceLibrary_27262();
          v59[3] = (uint64_t)dlsym(v47, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
          getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr = v59[3];
          v46 = (id *)v59[3];
        }
        _Block_object_dispose(&v58, 8);
        if (v46)
        {
          id v48 = *v46;
          v49 = [(NSDictionary *)v4 objectForKey:v48];
          v50 = (NSString *)[v49 copy];
          avAudioRouteName = self->_avAudioRouteName;
          self->_avAudioRouteName = v50;

          self->_isBuiltInSpeakerRoute = [(AFSiriAudioRoute *)self _isBuiltInSpeakerRoute];
          self->_isHearingAidsRoute = [(AFSiriAudioRoute *)self _isHearingAidsRoute];

          return;
        }
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)"];
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 35, @"%s", dlerror(), v54, v55, v56, v57);
      }
      else
      {
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged(void)"];
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 31, @"%s", dlerror(), v54, v55, v56, v57);
      }
    }
    else
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)"];
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"AFSiriAudioRoute.m", 34, @"%s", dlerror(), v54, v55, v56, v57);
    }
LABEL_49:

    __break(1u);
  }
}

- (BOOL)_isHearingAidsRoute
{
  return [(NSString *)self->_avAudioRouteName isEqualToString:@"BluetoothLEOutput"];
}

- (BOOL)_isBuiltInSpeakerRoute
{
  if ([(NSString *)self->_avAudioRouteName isEqualToString:@"Speaker"]) {
    return 1;
  }
  avAudioRouteName = self->_avAudioRouteName;
  return [(NSString *)avAudioRouteName isEqualToString:@"BestSpeaker"];
}

- (BOOL)isRouteCurrentlyPicked
{
  return self->_isRouteCurrentlyPicked;
}

- (BOOL)isEqualToRoute:(id)a3
{
  v5 = (AFSiriAudioRoute *)a3;
  v6 = v5;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
    goto LABEL_22;
  }
  productID = self->_productID;
  v8 = productID;
  if (!productID)
  {
    uint64_t v9 = [(AFSiriAudioRoute *)v5 productID];
    if (!v9) {
      goto LABEL_10;
    }
    v3 = (void *)v9;
    v8 = self->_productID;
  }
  v10 = [(AFSiriAudioRoute *)v6 productID];
  BOOL v11 = [(NSString *)v8 isEqualToString:v10];

  if (productID)
  {
    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {

    if (!v11) {
      goto LABEL_21;
    }
  }
LABEL_10:
  btAddress = self->_btAddress;
  v14 = btAddress;
  if (!btAddress)
  {
    uint64_t v15 = [(AFSiriAudioRoute *)v6 btAddress];
    if (!v15) {
      goto LABEL_17;
    }
    v3 = (void *)v15;
    v14 = self->_btAddress;
  }
  v16 = [(AFSiriAudioRoute *)v6 btAddress];
  BOOL v17 = [(NSString *)v14 isEqualToString:v16];

  if (btAddress)
  {
    if (!v17) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }

  if (!v17)
  {
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
LABEL_17:
  avAudioRouteName = self->_avAudioRouteName;
  id v19 = [(AFSiriAudioRoute *)v6 routeName];
  LODWORD(avAudioRouteName) = [(NSString *)avAudioRouteName isEqualToString:v19];

  if (!avAudioRouteName) {
    goto LABEL_21;
  }
  unint64_t availableAnnouncementRequestTypes = self->_availableAnnouncementRequestTypes;
  if (availableAnnouncementRequestTypes != [(AFSiriAudioRoute *)v6 availableAnnouncementRequestTypes])goto LABEL_21; {
  int64_t announcePlatformForRoute = self->_announcePlatformForRoute;
  }
  if (announcePlatformForRoute != [(AFSiriAudioRoute *)v6 announcePlatformForRoute]) {
    goto LABEL_21;
  }
  BOOL v22 = [(AFSiriAudioRoute *)self hasAuthenticationCapability];
  BOOL v12 = v22 ^ [(AFSiriAudioRoute *)v6 hasAuthenticationCapability] ^ 1;
LABEL_22:

  return v12;
}

- (BOOL)hasAuthenticationCapability
{
  return self->_isRouteCurrentlyPicked
      && self->_isHeadsetInEar
      && self->_headsetSupportsIED
      && !self->_headsetSupportsFauxIED
      && self->_inEarDetectEnabledSpecified
      && self->_inEarDetectEnabled
      && self->_isGenuineAppleAccessory;
}

- (id)routeName
{
  return self->_avAudioRouteName;
}

- (NSString)productID
{
  return self->_productID;
}

- (AFSiriAudioRoute)initWithRouteDescription:(id)a3 hearingAidsAnnounceEnabled:(BOOL)a4 builtInSpeakerAnnounceEnabled:(BOOL)a5 ringerSwitchState:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriAudioRoute;
  BOOL v12 = [(AFSiriAudioRoute *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avscRouteDescription, a3);
    v13->_hearingAidsAnnounceEnabled = a4;
    v13->_builtInSpeakerAnnounceEnabled = a5;
    v13->_ringerSwitchState = a6;
    [(AFSiriAudioRoute *)v13 _initializeInternalState];
    v13->_unint64_t availableAnnouncementRequestTypes = [(AFSiriAudioRoute *)v13 _getRouteCapabilities];
    v13->_int64_t announcePlatformForRoute = [(AFSiriAudioRoute *)v13 _announcementPlatform];
  }

  return v13;
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (unint64_t)availableAnnouncementRequestTypes
{
  return self->_availableAnnouncementRequestTypes;
}

- (int64_t)announcePlatformForRoute
{
  return self->_announcePlatformForRoute;
}

- (unint64_t)_getRouteCapabilities
{
  if (self->_isRouteCurrentlyPicked && self->_isDoAPCapable && (self->_isHeadsetInEar || !self->_headsetSupportsIED)) {
    goto LABEL_13;
  }
  if (!+[AFFeatureFlags isAccessibleAnnounceEnabled])
  {
    BOOL isRouteCurrentlyPicked = self->_isRouteCurrentlyPicked;
    goto LABEL_15;
  }
  BOOL isRouteCurrentlyPicked = self->_isRouteCurrentlyPicked;
  if (!self->_hearingAidsAnnounceEnabled) {
    goto LABEL_27;
  }
  if (!self->_isRouteCurrentlyPicked) {
    goto LABEL_17;
  }
  if (!self->_isHearingAidsRoute)
  {
LABEL_27:
    if (self->_builtInSpeakerAnnounceEnabled)
    {
      if (self->_isRouteCurrentlyPicked)
      {
        if (self->_isBuiltInSpeakerRoute && self->_ringerSwitchState == 1) {
          goto LABEL_13;
        }
LABEL_16:
        unint64_t result = 0;
        goto LABEL_18;
      }
LABEL_17:
      unint64_t result = 0;
      if (!self->_shouldTakeRouteFromOtherConnectedDevice) {
        return result;
      }
      goto LABEL_18;
    }
LABEL_15:
    if (isRouteCurrentlyPicked) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_13:
  unint64_t result = 1;
LABEL_18:
  if (self->_headsetSupportsAnnounceCalls
    && self->_isHeadsetInEar
    && (self->_inEarDetectEnabled || !self->_inEarDetectEnabledSpecified)
    && !self->_shouldDeferToOtherConnectedDevice)
  {
    result |= 2uLL;
  }
  return result;
}

- (int64_t)_announcementPlatform
{
  if ([(AFSiriAudioRoute *)self _isHearingAidsRoute]) {
    return 3;
  }
  if ([(AFSiriAudioRoute *)self _isBuiltInSpeakerRoute]) {
    return 4;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avAudioRouteName, 0);
  objc_storeStrong((id *)&self->_connectedBTProductID, 0);
  objc_storeStrong((id *)&self->_avscRouteDescription, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

- (void)setAnnouncePlatformForRoute:(int64_t)a3
{
  self->_int64_t announcePlatformForRoute = a3;
}

- (void)setAvscRouteDescription:(id)a3
{
}

- (NSDictionary)avscRouteDescription
{
  return self->_avscRouteDescription;
}

- (void)setAvailableAnnouncementRequestTypes:(unint64_t)a3
{
  self->_unint64_t availableAnnouncementRequestTypes = a3;
}

- (void)setConnectedBTProductID:(id)a3
{
}

- (NSString)connectedBTProductID
{
  return self->_connectedBTProductID;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setBtAddress:(id)a3
{
}

- (void)setProductID:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AFSiriAudioRoute alloc];
  avscRouteDescription = self->_avscRouteDescription;
  BOOL hearingAidsAnnounceEnabled = self->_hearingAidsAnnounceEnabled;
  BOOL builtInSpeakerAnnounceEnabled = self->_builtInSpeakerAnnounceEnabled;
  int64_t ringerSwitchState = self->_ringerSwitchState;
  return [(AFSiriAudioRoute *)v4 initWithRouteDescription:avscRouteDescription hearingAidsAnnounceEnabled:hearingAidsAnnounceEnabled builtInSpeakerAnnounceEnabled:builtInSpeakerAnnounceEnabled ringerSwitchState:ringerSwitchState];
}

- (BOOL)supportsVolumeAdjustment
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_btAddress length] != 17)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      productID = self->_productID;
      btAddress = self->_btAddress;
      int v11 = 136315650;
      BOOL v12 = "-[AFSiriAudioRoute supportsVolumeAdjustment]";
      __int16 v13 = 2112;
      v14 = productID;
      __int16 v15 = 2112;
      v16 = btAddress;
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s ProductID: %@, BTAddress: %@, route doesn't support volume adjustments", (uint8_t *)&v11, 0x20u);
    }
    return 0;
  }
  int v3 = AFIsH1Headset(self->_productID);
  v4 = AFSiriLogContextConnection;
  BOOL v5 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      int v11 = 136315138;
      BOOL v12 = "-[AFSiriAudioRoute supportsVolumeAdjustment]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Non H1 based headphones route, doesn't support volume adjustment", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
  if (!v5) {
    return 1;
  }
  int v11 = 136315138;
  BOOL v12 = "-[AFSiriAudioRoute supportsVolumeAdjustment]";
  BOOL v6 = 1;
  _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s H1 based headphones route, supports volume adjustment", (uint8_t *)&v11, 0xCu);
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_productID hash];
  NSUInteger v4 = [(NSString *)self->_btAddress hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_name hash];
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AFSiriAudioRoute availableAnnouncementRequestTypes](self, "availableAnnouncementRequestTypes"));
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFSiriAudioRoute hasAuthenticationCapability](self, "hasAuthenticationCapability"));
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isThirdPartyBluetoothHeadset
{
  if ([(NSString *)self->_avAudioRouteName isEqualToString:@"HeadsetBT"]
    || (BOOL v3 = [(NSString *)self->_avAudioRouteName isEqualToString:@"HeadphonesBT"]))
  {
    LOBYTE(v3) = !self->_isGenuineAppleAccessory;
  }
  return v3;
}

@end