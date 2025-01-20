@interface HSSetupStateMachineConfiguration
+ (id)configureService:(id)a3 withName:(id)a4;
+ (id)configureServices:(id)a3 withNames:(id)a4;
+ (id)disableServices:(id)a3;
+ (id)enableServices:(id)a3;
+ (id)writeConfigurationState:(int64_t)a3 toService:(id)a4;
+ (id)writeVisibilityState:(id)a3 toInputSourceService:(id)a4;
- (BOOL)allowsRandomVoiceSelection;
- (BOOL)isExplicitContentAllowed;
- (BOOL)isPlaybackInfluencesForYouEnabled;
- (BOOL)isReadyToPair;
- (BOOL)isSetupInitiatedByOtherMatterEcosystem;
- (BOOL)isShareSiriAnalyticsEnabled;
- (BOOL)requiresOwnerToPair;
- (BOOL)shouldShowSiriRecognitionLanguageSetup;
- (BOOL)shouldShowVoiceSelectionSetup;
- (BOOL)shouldSkipVoiceProfileSetup;
- (BOOL)supportsRichConfiguration;
- (HFAccessoryItem)addedAccessoryItem;
- (HFSetupPairingObserver)pairingObserver;
- (HMAccessory)addedAccessory;
- (HMAccessoryCategory)category;
- (HMCameraProfile)cameraProfile;
- (HMHome)home;
- (HMSetupAccessoryDescription)setupDescription;
- (HMSiriEndpointOnboardingSelections)onboardingSelections;
- (HSSetupStateMachineConfiguration)initWithAccessory:(id)a3;
- (HSSetupStateMachineConfiguration)initWithError:(id)a3;
- (HSSetupStateMachineConfiguration)initWithHome:(id)a3;
- (HSSetupStateMachineConfigurationDelegate)delegate;
- (MTSDeviceSetupRequest)matterDeviceSetupRequest;
- (MTSSystemCommissionerPairingManager)pairingManager;
- (NSArray)availableSiriLanguageValues;
- (NSArray)listOfVoices;
- (NSArray)siriEnabledAccessories;
- (NSError)pairingError;
- (NSString)recognitionLanguage;
- (NSString)roomName;
- (NSString)userGivenAccessoryName;
- (id)configureAccessoryDateAdded;
- (id)configureAccessoryName;
- (id)configureAccessoryWithName:(id)a3;
- (id)configureRoom;
- (id)updateUserGivenAccessoryName:(id)a3;
- (id)validateName:(id)a3;
- (id)validateNames:(id)a3;
- (void)setAddedAccessory:(id)a3;
- (void)setAllowsRandomVoiceSelection:(BOOL)a3;
- (void)setAvailableSiriLanguageValues:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setIsExplicitContentAllowed:(BOOL)a3;
- (void)setIsPlaybackInfluencesForYouEnabled:(BOOL)a3;
- (void)setIsReadyToPair:(BOOL)a3;
- (void)setIsShareSiriAnalyticsEnabled:(BOOL)a3;
- (void)setListOfVoices:(id)a3;
- (void)setOnboardingSelections:(id)a3;
- (void)setPairingError:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setPairingObserver:(id)a3;
- (void)setRecognitionLanguage:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setSetupDescription:(id)a3;
- (void)setShouldShowSiriRecognitionLanguageSetup:(BOOL)a3;
- (void)setShouldShowVoiceSelectionSetup:(BOOL)a3;
- (void)setShouldSkipVoiceProfileSetup:(BOOL)a3;
- (void)setSiriEnabledAccessories:(id)a3;
- (void)setUserGivenAccessoryName:(id)a3;
@end

@implementation HSSetupStateMachineConfiguration

- (BOOL)requiresOwnerToPair
{
  v3 = [(HSSetupStateMachineConfiguration *)self category];
  v4 = [v3 categoryType];
  if ([v4 isEqualToString:HMAccessoryCategoryTypeSpeaker])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v6 = [(HSSetupStateMachineConfiguration *)self category];
    v7 = [v6 categoryType];
    unsigned __int8 v5 = [v7 isEqualToString:HMAccessoryCategoryTypeAirPort];
  }
  return v5;
}

- (void)setIsReadyToPair:(BOOL)a3
{
  self->_isReadyToPair = a3;
  if (!a3) {
    return;
  }
  v4 = [(HSSetupStateMachineConfiguration *)self setupDescription];
  unsigned int v5 = [v4 isSetupInitiatedByOtherMatterEcosystem];

  if (v5) {
    goto LABEL_3;
  }
  v6 = [(HSSetupStateMachineConfiguration *)self home];

  if (!v6) {
    return;
  }
  if ([(HSSetupStateMachineConfiguration *)self requiresOwnerToPair])
  {
    v7 = [(HSSetupStateMachineConfiguration *)self home];
    unsigned __int8 v8 = [v7 hf_currentUserIsOwner];

    if ((v8 & 1) == 0)
    {
      HULocalizedString();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v11 = [(HSSetupStateMachineConfiguration *)self home];
      v13 = [v11 name];
      v14 = HULocalizedStringWithFormat();
      v15 = +[NSError hf_errorWithCode:title:description:](NSError, "hf_errorWithCode:title:description:", 61, v16, v14, v13);
      [(HSSetupStateMachineConfiguration *)self setPairingError:v15];

      goto LABEL_11;
    }
  }
  v9 = [(HSSetupStateMachineConfiguration *)self home];
  unsigned __int8 v10 = [v9 hf_currentUserIsAdministrator];

  if ((v10 & 1) == 0)
  {
    HULocalizedString();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v11 = HULocalizedString();
    v12 = +[NSError hf_errorWithCode:61 title:v16 description:v11];
    [(HSSetupStateMachineConfiguration *)self setPairingError:v12];

LABEL_11:
    goto LABEL_12;
  }
LABEL_3:
  id v16 = [(HSSetupStateMachineConfiguration *)self delegate];
  [v16 stateMachineConfigurationIsReadyToPair:self];
LABEL_12:
}

- (void)setPairingError:(id)a3
{
  v4 = (NSError *)a3;
  unsigned int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unsigned __int8 v8 = "-[HSSetupStateMachineConfiguration setPairingError:]";
    __int16 v9 = 2112;
    unsigned __int8 v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s *** Setting pairingError *** = %@", (uint8_t *)&v7, 0x16u);
  }

  pairingError = self->_pairingError;
  self->_pairingError = v4;
}

- (id)updateUserGivenAccessoryName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HSSetupStateMachineConfiguration *)self validateName:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D3B8;
  v9[3] = &unk_1000A9840;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = [v5 flatMap:v9];

  return v7;
}

- (void)setHome:(id)a3
{
  id v6 = (HMHome *)a3;
  if (self->_home != v6)
  {
    objc_storeStrong((id *)&self->_home, a3);
    unsigned int v5 = [(HSSetupStateMachineConfiguration *)self delegate];
    [v5 stateMachineConfiguration:self didUpdateHome:v6];
  }
}

- (HSSetupStateMachineConfiguration)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSSetupStateMachineConfiguration;
  id v6 = [(HSSetupStateMachineConfiguration *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v7->_isReadyToPair = 0;
  }

  return v7;
}

- (HSSetupStateMachineConfiguration)initWithAccessory:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSSetupStateMachineConfiguration;
  id v6 = [(HSSetupStateMachineConfiguration *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 home];
    home = v6->_home;
    v6->_home = (HMHome *)v7;

    objc_storeStrong((id *)&v6->_addedAccessory, a3);
    uint64_t v9 = [v5 name];
    userGivenAccessoryName = v6->_userGivenAccessoryName;
    v6->_userGivenAccessoryName = (NSString *)v9;
  }
  return v6;
}

- (HSSetupStateMachineConfiguration)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSSetupStateMachineConfiguration;
  id v6 = [(HSSetupStateMachineConfiguration *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pairingError, a3);
  }

  return v7;
}

- (HMSetupAccessoryDescription)setupDescription
{
  v3 = [(HSSetupStateMachineConfiguration *)self delegate];
  id v4 = [v3 stateMachineConfigurationGetSetupAccessoryDescription:self];

  return (HMSetupAccessoryDescription *)v4;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  v3 = [(HSSetupStateMachineConfiguration *)self delegate];
  id v4 = [v3 stateMachineConfigurationGetMatterDeviceSetupRequest:self];

  return (MTSDeviceSetupRequest *)v4;
}

- (HMAccessoryCategory)category
{
  v3 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
  id v4 = [v3 category];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(HSSetupStateMachineConfiguration *)self setupDescription];
    id v6 = [v7 category];
  }

  return (HMAccessoryCategory *)v6;
}

- (HFAccessoryItem)addedAccessoryItem
{
  id v3 = objc_alloc((Class)HFAccessoryItem);
  id v4 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
  id v5 = objc_alloc_init((Class)HFNullValueSource);
  id v6 = [v3 initWithAccessory:v4 valueSource:v5];

  return (HFAccessoryItem *)v6;
}

- (void)setIsShareSiriAnalyticsEnabled:(BOOL)a3
{
  if (self->_isShareSiriAnalyticsEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[HSSetupStateMachineConfiguration setIsShareSiriAnalyticsEnabled:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s *** Setting the value for  isShareSiriAnalyticsEnabled *** = %{BOOL}d", (uint8_t *)&v6, 0x12u);
    }

    self->_isShareSiriAnalyticsEnabled = v3;
  }
}

- (HMCameraProfile)cameraProfile
{
  v2 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
  BOOL v3 = [v2 cameraProfiles];
  id v4 = [v3 firstObject];

  return (HMCameraProfile *)v4;
}

- (BOOL)supportsRichConfiguration
{
  v2 = [(HSSetupStateMachineConfiguration *)self cameraProfile];
  BOOL v3 = [v2 userSettings];

  if (v3)
  {
    unsigned int v4 = [v3 supportedFeatures];
    unsigned int v5 = [v3 supportedFeatures];
    BOOL v6 = v5 & (v4 >> 1) & ((unint64_t)[v3 supportedFeatures] >> 2) & 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (HSSetupStateMachineConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSSetupStateMachineConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSetupDescription:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (BOOL)isReadyToPair
{
  return self->_isReadyToPair;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)userGivenAccessoryName
{
  return self->_userGivenAccessoryName;
}

- (void)setUserGivenAccessoryName:(id)a3
{
}

- (NSError)pairingError
{
  return self->_pairingError;
}

- (HMAccessory)addedAccessory
{
  return self->_addedAccessory;
}

- (void)setAddedAccessory:(id)a3
{
}

- (BOOL)isPlaybackInfluencesForYouEnabled
{
  return self->_isPlaybackInfluencesForYouEnabled;
}

- (void)setIsPlaybackInfluencesForYouEnabled:(BOOL)a3
{
  self->_isPlaybackInfluencesForYouEnabled = a3;
}

- (BOOL)isShareSiriAnalyticsEnabled
{
  return self->_isShareSiriAnalyticsEnabled;
}

- (BOOL)isExplicitContentAllowed
{
  return self->_isExplicitContentAllowed;
}

- (void)setIsExplicitContentAllowed:(BOOL)a3
{
  self->_isExplicitContentAllowed = a3;
}

- (HMSiriEndpointOnboardingSelections)onboardingSelections
{
  return self->_onboardingSelections;
}

- (void)setOnboardingSelections:(id)a3
{
}

- (BOOL)shouldSkipVoiceProfileSetup
{
  return self->_shouldSkipVoiceProfileSetup;
}

- (void)setShouldSkipVoiceProfileSetup:(BOOL)a3
{
  self->_shouldSkipVoiceProfileSetup = a3;
}

- (NSArray)siriEnabledAccessories
{
  return self->_siriEnabledAccessories;
}

- (void)setSiriEnabledAccessories:(id)a3
{
}

- (NSArray)availableSiriLanguageValues
{
  return self->_availableSiriLanguageValues;
}

- (void)setAvailableSiriLanguageValues:(id)a3
{
}

- (NSArray)listOfVoices
{
  return self->_listOfVoices;
}

- (void)setListOfVoices:(id)a3
{
}

- (BOOL)shouldShowSiriRecognitionLanguageSetup
{
  return self->_shouldShowSiriRecognitionLanguageSetup;
}

- (void)setShouldShowSiriRecognitionLanguageSetup:(BOOL)a3
{
  self->_shouldShowSiriRecognitionLanguageSetup = a3;
}

- (BOOL)shouldShowVoiceSelectionSetup
{
  return self->_shouldShowVoiceSelectionSetup;
}

- (void)setShouldShowVoiceSelectionSetup:(BOOL)a3
{
  self->_shouldShowVoiceSelectionSetup = a3;
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (void)setRecognitionLanguage:(id)a3
{
}

- (BOOL)allowsRandomVoiceSelection
{
  return self->_allowsRandomVoiceSelection;
}

- (void)setAllowsRandomVoiceSelection:(BOOL)a3
{
  self->_allowsRandomVoiceSelection = a3;
}

- (MTSSystemCommissionerPairingManager)pairingManager
{
  return (MTSSystemCommissionerPairingManager *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPairingManager:(id)a3
{
}

- (HFSetupPairingObserver)pairingObserver
{
  return (HFSetupPairingObserver *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPairingObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingObserver, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_listOfVoices, 0);
  objc_storeStrong((id *)&self->_availableSiriLanguageValues, 0);
  objc_storeStrong((id *)&self->_siriEnabledAccessories, 0);
  objc_storeStrong((id *)&self->_onboardingSelections, 0);
  objc_storeStrong((id *)&self->_addedAccessory, 0);
  objc_storeStrong((id *)&self->_pairingError, 0);
  objc_storeStrong((id *)&self->_userGivenAccessoryName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_setupDescription, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)validateName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[HFHomeKitDispatcher sharedDispatcher];
  BOOL v6 = [v5 homeManager];

  [(HSSetupStateMachineConfiguration *)self home];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002940C;
  v12[3] = &unk_1000A9F60;
  id v13 = v6;
  id v14 = v4;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v15;
  id v8 = v4;
  id v9 = v6;
  id v10 = +[NAFuture futureWithBlock:v12];

  return v10;
}

- (id)validateNames:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029808;
  v7[3] = &unk_1000A9F88;
  v7[4] = self;
  BOOL v3 = [a3 na_map:v7];
  id v4 = +[NAScheduler mainThreadScheduler];
  unsigned int v5 = +[NAFuture combineAllFutures:v3 ignoringErrors:0 scheduler:v4];

  return v5;
}

- (id)configureRoom
{
  if ([(HSSetupStateMachineConfiguration *)self isSetupInitiatedByOtherMatterEcosystem]&& ([(HSSetupStateMachineConfiguration *)self addedAccessory], id v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    v11 = +[NAFuture futureWithNoResult];
  }
  else
  {
    unsigned int v5 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
    if (!v5)
    {
      id v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"HSSetupStateMachineConfiguration+Helpers.m" lineNumber:70 description:@"Can't configure a nil accessory"];
    }
    BOOL v6 = [(HSSetupStateMachineConfiguration *)self home];
    if (!v6)
    {
      id v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"HSSetupStateMachineConfiguration+Helpers.m" lineNumber:73 description:@"Can't configure accessory without a home"];
    }
    id v7 = [(HSSetupStateMachineConfiguration *)self roomName];
    if (v7)
    {
      id v8 = [v6 rooms];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100029B34;
      v23[3] = &unk_1000A9FB0;
      id v9 = v7;
      id v24 = v9;
      id v10 = [v8 na_firstObjectPassingTest:v23];

      if (v10)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100029B78;
        v19[3] = &unk_1000A98E0;
        id v20 = v6;
        id v21 = v5;
        id v22 = v10;
        v11 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v19];

        id v12 = v20;
      }
      else
      {
        id v12 = [objc_alloc((Class)HFRoomBuilder) initWithHome:v6];
        [v12 setName:v9];
        [v12 addAccessory:v5];
        v11 = [v12 commitItem];
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100029B8C;
      v17[3] = &unk_1000A8D98;
      id v18 = v9;
      id v13 = [v11 addCompletionBlock:v17];
    }
    else
    {
      v11 = +[NAFuture futureWithNoResult];
    }
  }

  return v11;
}

- (id)configureAccessoryName
{
  BOOL v3 = [(HSSetupStateMachineConfiguration *)self userGivenAccessoryName];
  if (v3)
  {
    if ([(HSSetupStateMachineConfiguration *)self isSetupInitiatedByOtherMatterEcosystem]&& ([(HSSetupStateMachineConfiguration *)self addedAccessory], id v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = self;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
        id v18 = v17;
        if (!v18)
        {
          v19 = +[NSAssertionHandler currentHandler];
          id v20 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
          [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class() file lineNumber description];
        }
      }
      else
      {
        id v18 = 0;
      }

      id v21 = [(HSSetupStateMachineConfiguration *)v18 targetEcosystem];
      id v22 = v21;
      if (v21)
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100029F2C;
        v33[3] = &unk_1000A99C0;
        id v34 = v21;
        v35 = v18;
        BOOL v6 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v33];

        v23 = v34;
      }
      else
      {
        id v24 = HFLogForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100066CE8(v24, v25, v26, v27, v28, v29, v30, v31);
        }

        v23 = +[NSError hmfErrorWithCode:8];
        BOOL v6 = +[NAFuture futureWithError:v23];
      }
    }
    else
    {
      unsigned int v5 = [(HSSetupStateMachineConfiguration *)self userGivenAccessoryName];
      BOOL v6 = [(HSSetupStateMachineConfiguration *)self configureAccessoryWithName:v5];
    }
  }
  else
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066CB0(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    BOOL v6 = +[NAFuture futureWithNoResult];
  }

  return v6;
}

- (id)configureAccessoryWithName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
    id v7 = [(HSSetupStateMachineConfiguration *)self home];
    uint64_t v8 = [(HSSetupStateMachineConfiguration *)self userGivenAccessoryName];
    *(_DWORD *)buf = 138412802;
    v66 = v6;
    __int16 v67 = 2112;
    v68 = v7;
    __int16 v69 = 2112;
    v70 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to configure %@ in %@, with userGivenAccessoryName %@", buf, 0x20u);
  }
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
  uint64_t v11 = [v10 name];
  unsigned __int8 v12 = [v4 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10002A590;
    v62[3] = &unk_1000A99C0;
    id v13 = v10;
    id v63 = v13;
    id v14 = v4;
    id v64 = v14;
    uint64_t v15 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v62];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10002A668;
    v59[3] = &unk_1000A9DA8;
    id v60 = v14;
    id v61 = v13;
    id v16 = [v15 addCompletionBlock:v59];
    [v9 addObject:v15];
  }
  v17 = [v10 hf_primaryService];
  id v18 = [v17 serviceType];
  unsigned int v19 = [v18 isEqualToString:HMServiceTypeTelevision];

  if (!v19)
  {
    if (!objc_msgSend(v10, "hf_isSingleServiceLikeAccessory")) {
      goto LABEL_17;
    }
    id v24 = [v10 hf_visibleServices];
    uint64_t v25 = [v24 anyObject];
    if (v25)
    {
      id v26 = (id)v25;
    }
    else
    {
      uint64_t v27 = [v10 hf_primaryService];
      uint64_t v28 = v27;
      if (v27)
      {
        id v26 = v27;
      }
      else
      {
        uint64_t v29 = [v10 hf_programmableSwitchServices];
        id v26 = [v29 anyObject];
      }
      if (v26) {
        goto LABEL_15;
      }
      NSLog(@"Attempted to name a single service accessory without a visible service");
      id v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100066D20(v24, v37, v38, v39, v40, v41, v42, v43);
      }
      id v26 = 0;
    }

LABEL_15:
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10002A89C;
    v50[3] = &unk_1000A98E0;
    id v51 = v26;
    id v30 = v4;
    id v52 = v30;
    id v31 = v10;
    id v53 = v31;
    id v23 = v26;
    v32 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v50];
    v44 = _NSConcreteStackBlock;
    uint64_t v45 = 3221225472;
    v46 = sub_10002A970;
    v47 = &unk_1000A9DA8;
    id v48 = v30;
    id v49 = v31;
    id v33 = [v32 addCompletionBlock:&v44];
    [v9 addObject:v32, v44, v45, v46, v47];

    goto LABEL_16;
  }
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10002A74C;
  v56[3] = &unk_1000A99C0;
  id v57 = v10;
  id v20 = v4;
  id v58 = v20;
  id v21 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v56];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10002A7BC;
  v54[3] = &unk_1000A8D98;
  id v55 = v20;
  id v22 = [v21 addCompletionBlock:v54];
  [v9 addObject:v21];

  id v23 = v57;
LABEL_16:

LABEL_17:
  id v34 = +[NAScheduler mainThreadScheduler];
  v35 = +[NAFuture combineAllFutures:v9 ignoringErrors:1 scheduler:v34];

  return v35;
}

- (id)configureAccessoryDateAdded
{
  BOOL v3 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
  id v4 = v3;
  if (!v3)
  {
LABEL_6:
    uint64_t v9 = +[NAFuture futureWithNoResult];
    goto LABEL_8;
  }
  unsigned int v5 = [v3 hf_dateAdded];

  if (v5)
  {
    BOOL v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(HSSetupStateMachineConfiguration *)self addedAccessory];
      uint64_t v8 = [v4 hf_dateAdded];
      *(_DWORD *)buf = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not updating date added for %@ because it is already set to %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002AC00;
  v11[3] = &unk_1000A96F8;
  id v12 = v4;
  uint64_t v9 = +[NAFuture lazyFutureWithBlock:v11];

LABEL_8:

  return v9;
}

+ (id)configureService:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 defaultName];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002AF88;
    v11[3] = &unk_1000A99C0;
    id v12 = v5;
    id v13 = v6;
    uint64_t v9 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v11];
  }

  return v9;
}

+ (id)configureServices:(id)a3 withNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    unsigned __int8 v8 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v5 objectAtIndexedSubscript:v9];
        uint64_t v11 = [v6 objectAtIndexedSubscript:v9];
        id v12 = +[HSSetupStateMachineConfiguration configureService:v10 withName:v11];
        [v8 na_safeAddObject:v12];

        ++v9;
      }
      while (v9 < (unint64_t)[v5 count]);
    }
    id v13 = +[NAScheduler mainThreadScheduler];
    id v14 = +[NAFuture combineAllFutures:v8 ignoringErrors:1 scheduler:v13];
  }
  else
  {
    __int16 v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100066F2C(v5, v6, v15);
    }

    NSLog(@"%s passed different count services [%ld] and names [%ld]", "+[HSSetupStateMachineConfiguration(Helpers) configureServices:withNames:]", [v5 count], [v6 count]);
    id v14 = +[NAFuture futureWithNoResult];
  }

  return v14;
}

+ (id)enableServices:(id)a3
{
  BOOL v3 = [a3 na_map:&stru_1000A9FF0];
  id v4 = [v3 allObjects];
  id v5 = +[NAScheduler mainThreadScheduler];
  id v6 = +[NAFuture combineAllFutures:v4 ignoringErrors:1 scheduler:v5];

  return v6;
}

+ (id)disableServices:(id)a3
{
  BOOL v3 = [a3 na_map:&stru_1000AA010];
  id v4 = [v3 allObjects];
  id v5 = +[NAScheduler mainThreadScheduler];
  id v6 = +[NAFuture combineAllFutures:v4 ignoringErrors:1 scheduler:v5];

  return v6;
}

+ (id)writeVisibilityState:(id)a3 toInputSourceService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HMServiceTypeInputSource;
  unint64_t v9 = [v7 hf_characteristicEqualToType:HMCharacteristicTypeTargetVisibilityState forServiceType:HMServiceTypeInputSource];
  if (v9)
  {
    uint64_t v10 = [v7 hf_characteristicEqualToType:HMCharacteristicTypeCurrentVisibilityState forServiceType:v8];
    uint64_t v11 = [v10 value];
    id v12 = v11;
    if (v11 && [v11 isEqualToNumber:v6])
    {
      id v13 = +[NAFuture futureWithNoResult];
    }
    else
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002B6E8;
      v22[3] = &unk_1000A99C0;
      id v23 = v9;
      id v14 = v6;
      id v24 = v14;
      id v13 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v22];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10002B6F8;
      v19[3] = &unk_1000AA038;
      id v20 = v14;
      id v21 = a1;
      id v15 = [v13 addCompletionBlock:v19];
    }
  }
  else
  {
    id v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100066FEC((uint64_t)a1, v16, v17);
    }

    id v13 = +[NAFuture futureWithNoResult];
  }

  return v13;
}

+ (id)writeConfigurationState:(int64_t)a3 toService:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B8A0;
  v8[3] = &unk_1000AA060;
  id v9 = a4;
  int64_t v10 = a3;
  id v5 = v9;
  id v6 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v8];

  return v6;
}

- (BOOL)isSetupInitiatedByOtherMatterEcosystem
{
  v2 = [(HSSetupStateMachineConfiguration *)self setupDescription];
  unsigned __int8 v3 = [v2 isSetupInitiatedByOtherMatterEcosystem];

  return v3;
}

@end