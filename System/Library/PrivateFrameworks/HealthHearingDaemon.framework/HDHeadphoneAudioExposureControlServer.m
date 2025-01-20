@interface HDHeadphoneAudioExposureControlServer
+ (id)taskIdentifier;
- (HDHeadphoneAudioExposureControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_headphoneProvenanceForRemoteDevice:(BOOL)a3;
- (id)_headphoneProvenanceForRemoteWatch;
- (id)_makeAirPods;
- (id)_makeBeatsHeadphones;
- (id)_makeEarPods;
- (id)_makeUnknownHeadphones;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_headphoneProvenanceForRemoteWatch;
- (void)remote_fetchDoseLimitWithCompletion:(id)a3;
- (void)remote_fetchInfoDictWithCompletion:(id)a3;
- (void)remote_fetchInfoWithCompletion:(id)a3;
- (void)remote_insertQuantityWithExposure:(double)a3 duration:(double)a4 startDate:(id)a5 includesNotificationSample:(BOOL)a6 synced:(BOOL)a7 completion:(id)a8;
- (void)remote_overrideDoseLimit:(id)a3 completion:(id)a4;
- (void)remote_rebuildWithCompletion:(id)a3;
@end

@implementation HDHeadphoneAudioExposureControlServer

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x263F44970] taskIdentifier];
}

- (HDHeadphoneAudioExposureControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDHeadphoneAudioExposureControlServer;
  v12 = [(HDStandardTaskServer *)&v22 initWithUUID:a3 configuration:a4 client:v11 delegate:a6];
  if (v12)
  {
    v13 = [v11 profile];
    objc_storeWeak((id *)&v12->_profile, v13);

    v14 = [v11 profile];
    uint64_t v15 = [v14 profileExtensionWithIdentifier:*MEMORY[0x263F44960]];
    profileExtension = v12->_profileExtension;
    v12->_profileExtension = (HDHearingProfileExtension *)v15;

    objc_storeStrong((id *)&v12->_client, a5);
    uint64_t v17 = HKCreateSerialDispatchQueue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    v19 = [MEMORY[0x263F43498] sharedDiagnosticManager];
    [v19 addObject:v12];

    v20 = v12;
  }

  return v12;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F34ED8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F34ED0](self, a2);
}

- (id)diagnosticDescription
{
  return &stru_26D9E5188;
}

- (void)remote_rebuildWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HDHearingProfileExtension *)profileExtension headphoneDoseManager];
  id v8 = 0;
  uint64_t v6 = [v5 _rebuildWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_fetchInfoWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHearingProfileExtension *)profileExtension headphoneDoseManager];
  id v8 = 0;
  uint64_t v6 = [v5 _infoWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_fetchInfoDictWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHearingProfileExtension *)profileExtension headphoneDoseManager];
  id v8 = 0;
  uint64_t v6 = [v5 _infoDictWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_insertQuantityWithExposure:(double)a3 duration:(double)a4 startDate:(id)a5 includesNotificationSample:(BOOL)a6 synced:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v40[2] = *MEMORY[0x263EF8340];
  id v13 = a5;
  v37 = (void (**)(id, uint64_t, id))a8;
  id v14 = v13;
  uint64_t v15 = v14;
  if (!v14)
  {
    v16 = [MEMORY[0x263EFF910] now];
    uint64_t v15 = [v16 dateByAddingTimeInterval:-a4];
  }
  uint64_t v17 = [v15 dateByAddingTimeInterval:a4];
  uint64_t v18 = [MEMORY[0x263F0A830] decibelAWeightedSoundPressureLevelUnit];
  v19 = (void *)MEMORY[0x263F0A648];
  v20 = HKHeadphoneAudioExposureType();
  v35 = (void *)v18;
  v21 = [MEMORY[0x263F0A630] quantityWithUnit:v18 doubleValue:a3];
  objc_super v22 = [v19 quantitySampleWithType:v20 quantity:v21 startDate:v15 endDate:v17];

  if (v10)
  {
    v23 = [v17 dateByAddingTimeInterval:1.0];
    v24 = [v23 dateByAddingTimeInterval:-604800.0];
    v25 = (void *)MEMORY[0x263F0A150];
    v26 = HKHeadphoneAudioExposureEventType();
    [v25 categorySampleWithType:v26 value:1 startDate:v24 endDate:v23];
    v28 = BOOL v27 = v9;

    v40[0] = v28;
    v40[1] = v22;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];

    BOOL v9 = v27;
  }
  else
  {
    v39 = v22;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
  }
  v30 = [(HDStandardTaskServer *)self profile];
  v31 = [v30 dataManager];
  v32 = [(HDHeadphoneAudioExposureControlServer *)self _headphoneProvenanceForRemoteDevice:v9];
  id v38 = 0;
  uint64_t v33 = [v31 insertDataObjects:v29 withProvenance:v32 creationDate:&v38 error:CFAbsoluteTimeGetCurrent()];
  id v34 = v38;

  v37[2](v37, v33, v34);
}

- (void)remote_fetchDoseLimitWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHearingProfileExtension *)profileExtension headphoneDoseManager];
  id v8 = 0;
  uint64_t v6 = [v5 _fetchDoseLimitInfoWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_overrideDoseLimit:(id)a3 completion:(id)a4
{
  profileExtension = self->_profileExtension;
  uint64_t v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(HDHearingProfileExtension *)profileExtension headphoneDoseManager];
  id v11 = 0;
  uint64_t v9 = [v8 _overrideDoseLimit:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (id)_headphoneProvenanceForRemoteDevice:(BOOL)a3
{
  if (a3)
  {
    v3 = [(HDHeadphoneAudioExposureControlServer *)self _headphoneProvenanceForRemoteWatch];
  }
  else
  {
    v4 = [(HDStandardTaskServer *)self profile];
    v5 = [v4 dataProvenanceManager];
    v3 = [v5 defaultLocalDataProvenance];
  }
  return v3;
}

- (id)_headphoneProvenanceForRemoteWatch
{
  v42[4] = *MEMORY[0x263EF8340];
  v3 = [(HDHeadphoneAudioExposureControlServer *)self _makeAirPods];
  v42[0] = v3;
  v4 = [(HDHeadphoneAudioExposureControlServer *)self _makeEarPods];
  v42[1] = v4;
  v5 = [(HDHeadphoneAudioExposureControlServer *)self _makeBeatsHeadphones];
  v42[2] = v5;
  uint64_t v6 = [(HDHeadphoneAudioExposureControlServer *)self _makeUnknownHeadphones];
  v42[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"];
  uint64_t v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [v9 sourceManager];
  id v41 = 0;
  id v11 = [v10 sourceForAppleDeviceWithUUID:v8 identifier:@"com.apple.health.demo_watch" name:@"Fake Person's Watch" productType:@"Watch1,2" createIfNecessary:1 error:&v41];
  id v12 = v41;

  if (v11)
  {
    id v13 = [(HDStandardTaskServer *)self profile];
    id v14 = [v13 deviceManager];
    uint64_t v15 = objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
    id v40 = v12;
    v16 = [v14 deviceEntityForDevice:v15 error:&v40];
    id v38 = v40;

    if (v16)
    {
      uint64_t v17 = [(HDStandardTaskServer *)self profile];
      uint64_t v18 = [v17 daemon];
      v19 = [v18 behavior];

      id v34 = (void *)MEMORY[0x263F431D0];
      v35 = [(HDStandardTaskServer *)self profile];
      uint64_t v33 = [v35 currentSyncIdentityPersistentID];
      uint64_t v20 = [v19 currentOSBuild];
      v21 = (void *)v20;
      uint64_t v22 = *MEMORY[0x263F42FF8];
      if (v20) {
        uint64_t v22 = v20;
      }
      uint64_t v32 = v22;
      v36 = v8;
      v37 = v7;
      if (v19) {
        [v19 currentOSVersionStruct];
      }
      else {
        memset(v39, 0, sizeof(v39));
      }
      v26 = [v19 currentOSVersion];
      BOOL v27 = [v19 localTimeZone];
      v28 = [v27 name];
      v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
      v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v24 = [v34 dataProvenanceWithSyncProvenance:0 syncIdentity:v33 productType:@"Watch1,2" systemBuild:v32 operatingSystemVersion:v39 sourceVersion:v26 timeZoneName:v28 sourceID:v29 deviceID:v30 contributorReference:0];

      id v8 = v36;
      id v7 = v37;
    }
    else
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x263F09900];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09900], OS_LOG_TYPE_ERROR))
      {
        id v12 = v38;
        [(HDHeadphoneAudioExposureControlServer *)(uint64_t)v38 _headphoneProvenanceForRemoteWatch];
        v24 = 0;
        goto LABEL_15;
      }
      v24 = 0;
    }
    id v12 = v38;
LABEL_15:

    goto LABEL_16;
  }
  _HKInitializeLogging();
  v23 = *MEMORY[0x263F09900];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09900], OS_LOG_TYPE_ERROR)) {
    [(HDHeadphoneAudioExposureControlServer *)(uint64_t)v12 _headphoneProvenanceForRemoteWatch];
  }
  v24 = 0;
LABEL_16:

  return v24;
}

- (id)_makeAirPods
{
  id v2 = objc_alloc(MEMORY[0x263F0A2D8]);
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = (void *)[v2 initWithName:@"AirPods", @"Apple, Inc.", @"AirPods 1,1", 0, 0, 0, v4, 0 manufacturer model hardwareVersion firmwareVersion softwareVersion localIdentifier UDIDeviceIdentifier];

  return v5;
}

- (id)_makeEarPods
{
  id v2 = objc_alloc(MEMORY[0x263F0A2D8]);
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = (void *)[v2 initWithName:@"EarPods", @"Apple, Inc.", @"EarPods 1,1", 0, 0, 0, v4, 0 manufacturer model hardwareVersion firmwareVersion softwareVersion localIdentifier UDIDeviceIdentifier];

  return v5;
}

- (id)_makeBeatsHeadphones
{
  id v2 = objc_alloc(MEMORY[0x263F0A2D8]);
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = (void *)[v2 initWithName:@"Powerbeats Pro" manufacturer:@"Beats By Dre" model:@"Powerbeats Pro 1,1" hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:v4 UDIDeviceIdentifier:0];

  return v5;
}

- (id)_makeUnknownHeadphones
{
  id v2 = objc_alloc(MEMORY[0x263F0A2D8]);
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = (void *)[v2 initWithName:0, @"Foo, Inc.", @"FooPods 1,1", 0, 0, 0, v4, 0 manufacturer model hardwareVersion firmwareVersion softwareVersion localIdentifier UDIDeviceIdentifier];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_headphoneProvenanceForRemoteWatch
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22615C000, a2, OS_LOG_TYPE_ERROR, "Error creating headphone device entity %{public}@", (uint8_t *)&v2, 0xCu);
}

@end