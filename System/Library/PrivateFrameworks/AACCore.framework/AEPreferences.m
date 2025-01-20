@interface AEPreferences
+ (id)defaultPreferences;
+ (id)preferencesWithPreferencePrimitives:(id)a3 systemNotificationPrimitives:(id)a4 queue:(id)a5;
- (AEObservation)notificationObservation;
- (AEPreference)allowRemotelyKillingAgent;
- (AEPreference)captureDisplays;
- (AEPreference)disableContinuity;
- (AEPreference)disableDictation;
- (AEPreference)disableQuickNote;
- (AEPreference)disableSiri;
- (AEPreference)disableTrackpadLookup;
- (AEPreference)elevateWindows;
- (AEPreference)enforceSingleAppMode;
- (AEPreference)enterSandbox;
- (AEPreference)expirationTime;
- (AEPreference)failOnDeactivation;
- (AEPreference)forceScreenMirroring;
- (AEPreference)networkPolicyExemptExecutablePaths;
- (AEPreference)presentShields;
- (AEPreference)restrictContentCapture;
- (AEPreference)restrictFrontmostApp;
- (AEPreference)restrictMedia;
- (AEPreference)restrictNetworkAccess;
- (AEPreference)scrubPasteboard;
- (AEPreference)setCustomHomeScreenLayout;
- (AEPreference)showPromptsAndBanners;
- (AEPreference)stopAirPlayBeforehand;
- (AEPreferencePrimitives)preferencePrimitives;
- (AEPreferences)initWithPreferencePrimitives:(id)a3 systemNotificationPrimitives:(id)a4 queue:(id)a5;
- (AESystemNotificationPrimitives)systemNotificationPrimitives;
- (NSMapTable)cachedPreferencesByKey;
- (id)createAssessmentFile;
- (id)preferenceForKey:(id)a3 defaultArrayValue:(id)a4;
- (id)preferenceForKey:(id)a3 defaultNumberValue:(id)a4;
- (void)dealloc;
- (void)preferencesDidUpdate;
@end

@implementation AEPreferences

- (void)dealloc
{
  v3 = [(AEPreferences *)self notificationObservation];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)AEPreferences;
  [(AEPreferences *)&v4 dealloc];
}

+ (id)defaultPreferences
{
  v2 = (void *)[objc_alloc((Class)a1) initWithPreferencePrimitives:0 systemNotificationPrimitives:0 queue:0];
  return v2;
}

+ (id)preferencesWithPreferencePrimitives:(id)a3 systemNotificationPrimitives:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithPreferencePrimitives:v10 systemNotificationPrimitives:v9 queue:v8];

  return v11;
}

- (AEPreferences)initWithPreferencePrimitives:(id)a3 systemNotificationPrimitives:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AEPreferences;
  v12 = [(AEPreferences *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preferencePrimitives, a3);
    objc_storeStrong((id *)&v13->_systemNotificationPrimitives, a4);
    uint64_t v14 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    cachedPreferencesByKey = v13->_cachedPreferencesByKey;
    v13->_cachedPreferencesByKey = (NSMapTable *)v14;

    if (v10)
    {
      if (v11)
      {
        objc_initWeak(&location, v13);
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __81__AEPreferences_initWithPreferencePrimitives_systemNotificationPrimitives_queue___block_invoke;
        v19[3] = &unk_264EA37A8;
        objc_copyWeak(&v20, &location);
        uint64_t v16 = [v10 observeSystemNotificationWithName:@"com.apple.assessmentmode.preferencesDidChangeNotification" onQueue:v11 withHandler:v19];
        notificationObservation = v13->_notificationObservation;
        v13->_notificationObservation = (AEObservation *)v16;

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }

  return v13;
}

void __81__AEPreferences_initWithPreferencePrimitives_systemNotificationPrimitives_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained preferencesDidUpdate];
}

- (AEPreference)enterSandbox
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"EnterSandbox" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)presentShields
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"PresentShields" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)restrictFrontmostApp
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"RestrictFrontmostApp" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (id)createAssessmentFile
{
  return [(AEPreferences *)self preferenceForKey:@"CreateAssessmentFile" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)disableSiri
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"DisableSiri" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)disableContinuity
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"DisableContinuity" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)scrubPasteboard
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"ScrubPasteboard" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)restrictNetworkAccess
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"RestrictNetworkAccess" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)stopAirPlayBeforehand
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"StopAirPlayBeforehand" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)restrictContentCapture
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"RestrictContentCapture" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)disableTrackpadLookup
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"DisableTrackpadLookup" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)captureDisplays
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"CaptureDisplays" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)elevateWindows
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"ElevateWindows" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)disableDictation
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"DisableDication" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)disableQuickNote
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"DisableQuickNote" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)restrictMedia
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"RestrictMedia" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)enforceSingleAppMode
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"EnforceSingleAppMode" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)showPromptsAndBanners
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"ShowPromptsAndBanners" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)expirationTime
{
  v3 = [NSNumber numberWithDouble:28800.0];
  objc_super v4 = [(AEPreferences *)self preferenceForKey:@"ExpirationTime" defaultNumberValue:v3];

  return (AEPreference *)v4;
}

- (AEPreference)forceScreenMirroring
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"ForceScreenMirroring" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)allowRemotelyKillingAgent
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"KillingAgentRemotely" defaultNumberValue:MEMORY[0x263EFFA80]];
}

- (AEPreference)setCustomHomeScreenLayout
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"CustomHomeScreenLayout" defaultNumberValue:MEMORY[0x263EFFA88]];
}

- (AEPreference)failOnDeactivation
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"FailOnDeactivation" defaultNumberValue:MEMORY[0x263EFFA80]];
}

- (AEPreference)networkPolicyExemptExecutablePaths
{
  return (AEPreference *)[(AEPreferences *)self preferenceForKey:@"NetworkPolicyExemptExecutablePaths" defaultArrayValue:MEMORY[0x263EFFA68]];
}

- (id)preferenceForKey:(id)a3 defaultNumberValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AEPreferences *)self cachedPreferencesByKey];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = [AEPreference alloc];
    v12 = [(AEPreferences *)self preferencePrimitives];
    v13 = [(AEPreferences *)self systemNotificationPrimitives];
    id v10 = [(AEPreference *)v11 initWithKey:v6 preferencesPrimitives:v12 systemNotificationPrimitives:v13 defaultValue:v7];

    uint64_t v14 = [(AEPreferences *)self cachedPreferencesByKey];
    [v14 setObject:v10 forKey:v6];
  }
  return v10;
}

- (id)preferenceForKey:(id)a3 defaultArrayValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AEPreferences *)self cachedPreferencesByKey];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = [AEPreference alloc];
    v12 = [(AEPreferences *)self preferencePrimitives];
    v13 = [(AEPreferences *)self systemNotificationPrimitives];
    id v10 = [(AEPreference *)v11 initWithKey:v6 preferencesPrimitives:v12 systemNotificationPrimitives:v13 defaultValue:v7];

    uint64_t v14 = [(AEPreferences *)self cachedPreferencesByKey];
    [v14 setObject:v10 forKey:v6];
  }
  return v10;
}

- (void)preferencesDidUpdate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AEPreferences *)self cachedPreferencesByKey];
  v3 = [v2 objectEnumerator];
  objc_super v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) preferenceDidUpdate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (AEPreferencePrimitives)preferencePrimitives
{
  return self->_preferencePrimitives;
}

- (AESystemNotificationPrimitives)systemNotificationPrimitives
{
  return self->_systemNotificationPrimitives;
}

- (AEObservation)notificationObservation
{
  return self->_notificationObservation;
}

- (NSMapTable)cachedPreferencesByKey
{
  return self->_cachedPreferencesByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPreferencesByKey, 0);
  objc_storeStrong((id *)&self->_notificationObservation, 0);
  objc_storeStrong((id *)&self->_systemNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_preferencePrimitives, 0);
}

@end