@interface CLLocationManagerInternal
- (BOOL)allowsBackgroundLocationUpdates;
- (BOOL)showsBackgroundLocationIndicator;
- (CLLocationManager)manager;
- (CLLocationManagerDelegate)delegate;
- (CLLocationManagerInternal)initWithInfo:(id)a3 bundleIdentifier:(id)a4 bundlePath:(id)a5 websiteIdentifier:(id)a6 delegate:(id)a7 silo:(id)a8;
- (NSData)monitorLedgerAccessKey;
- (NSMutableSet)rangedConstraints;
- (NSMutableSet)rangedRegions;
- (NSString)clientKeyForIdentityValidation;
- (int)PausesLocationUpdatesAutomatically;
- (void)cancelLocationRequest;
- (void)dealloc;
- (void)invalidate;
- (void)performCourtesyPromptIfNeeded;
- (void)setAllowsBackgroundLocationUpdates:(BOOL)a3;
- (void)setClientKeyForIdentityValidation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
- (void)setMonitorLedgerAccessKey:(id)a3;
- (void)setPausesLocationUpdatesAutomatically:(int)a3;
- (void)setShowsBackgroundLocationIndicator:(BOOL)a3;
- (void)stopUpdatingLocationAutoPaused;
@end

@implementation CLLocationManagerInternal

- (void)performCourtesyPromptIfNeeded
{
  if ([(CLLocationManagerStateTracker *)self->fState courtesyPromptNeeded])
  {
    fClient = self->fClient;
    CLClientRequestAuthorization(fClient, 3);
  }
}

- (CLLocationManager)manager
{
  return (CLLocationManager *)objc_loadWeak((id *)&self->fManager);
}

- (CLLocationManagerDelegate)delegate
{
  return (CLLocationManagerDelegate *)objc_loadWeak((id *)&self->fDelegate);
}

- (void)setPausesLocationUpdatesAutomatically:(int)a3
{
  [(CLLocationManagerStateTracker *)self->fState setPausesLocationUpdatesAutomatically:*(void *)&a3];
  fClient = self->fClient;
  int v5 = [(CLLocationManagerStateTracker *)self->fState pausesLocationUpdatesAutomatically];

  sub_1906D578C((uint64_t)fClient, v5);
}

- (CLLocationManagerInternal)initWithInfo:(id)a3 bundleIdentifier:(id)a4 bundlePath:(id)a5 websiteIdentifier:(id)a6 delegate:(id)a7 silo:(id)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CLLocationManagerInternal;
  v11 = [(CLLocationManagerInternal *)&v15 init];
  if (v11)
  {
    v12 = [CLLocationManagerStateTracker alloc];
    *((void *)v11 + 4) = [(CLLocationManagerStateTracker *)v12 initWithQueue:MEMORY[0x1E4F14428] identifier:a3 state:&unk_1EE005600];
    *((void *)v11 + 36) = a8;
    objc_storeWeak((id *)v11 + 2, a7);
    objc_storeWeak((id *)v11 + 3, a3);
    uint64_t v13 = CLClientCreateWithBundleIdentifierAndPathWithWebsiteOnSilo();
    *((void *)v11 + 1) = v13;
    v11[272] = *(unsigned char *)(v13 + 17) != 0;
    *(void *)(v11 + 60) = 0xBFF0000000000000;
    *((void *)v11 + 26) = 0;
    *((void *)v11 + 27) = 0x4024000000000000;
    *((_DWORD *)v11 + 56) = 1;
    *((void *)v11 + 29) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    *((void *)v11 + 30) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v11 setClientKeyForIdentityValidation:0];
    [v11 setMonitorLedgerAccessKey:0];
    *((void *)v11 + 35) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return (CLLocationManagerInternal *)v11;
}

- (NSString)clientKeyForIdentityValidation
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMonitorLedgerAccessKey:(id)a3
{
}

- (void)setClientKeyForIdentityValidation:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)invalidate
{
  fClient = self->fClient;
  if (fClient) {
    CLClientInvalidate((uint64_t)fClient);
  }
}

- (void)dealloc
{
  [(CLLocationManagerInternal *)self setClientKeyForIdentityValidation:0];
  [(CLLocationManagerInternal *)self setMonitorLedgerAccessKey:0];

  self->fPlaceInferenceTimer = 0;
  fRangedRegions = self->fRangedRegions;
  if (fRangedRegions)
  {
    self->fRangedRegions = 0;
    fClient = self->fClient;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1906F8E70;
    v9[3] = &unk_1E5696C40;
    v9[4] = fRangedRegions;
    if (fClient)
    {
      int v5 = (void *)*((void *)fClient + 29);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1906DD850;
      v10[3] = &unk_1E5696C40;
      v10[4] = v9;
      [v5 async:v10];
    }
  }
  [self->fPlaceInferenceHandler invalidate];

  self->fPlaceInferenceHandler = 0;
  v6 = *(void **)&self->fLocation.fromSimulationController;
  if (v6)
  {
    [*(id *)&self->fLocation.fromSimulationController invalidate];

    *(void *)&self->fLocation.fromSimulationController = 0;
  }
  v7 = self->fClient;
  if (v7)
  {
    CLClientInvalidate((uint64_t)v7);
    CFRelease(self->fClient);
    self->fClient = 0;
  }

  *(void *)&self->fIsMasquerading = 0;
  self->fState = 0;
  v8.receiver = self;
  v8.super_class = (Class)CLLocationManagerInternal;
  [(CLLocationManagerInternal *)&v8 dealloc];
}

- (void)cancelLocationRequest
{
  [(CLLocationManagerStateTracker *)self->fState setRequestingLocation:0];
  v3 = *(void **)&self->fLocation.fromSimulationController;
  if (v3)
  {
    [*(id *)&self->fLocation.fromSimulationController invalidate];

    *(void *)&self->fLocation.fromSimulationController = 0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->fManager);

  objc_destroyWeak((id *)&self->fDelegate);
}

- (int)PausesLocationUpdatesAutomatically
{
  return [(CLLocationManagerStateTracker *)self->fState pausesLocationUpdatesAutomatically];
}

- (void)setAllowsBackgroundLocationUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  -[CLLocationManagerStateTracker setAllowsBackgroundLocationUpdates:](self->fState, "setAllowsBackgroundLocationUpdates:");
  fClient = self->fClient;

  sub_1906F219C((uint64_t)fClient, v3);
}

- (BOOL)allowsBackgroundLocationUpdates
{
  return [(CLLocationManagerStateTracker *)self->fState allowsBackgroundLocationUpdates];
}

- (void)setShowsBackgroundLocationIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  -[CLLocationManagerStateTracker setShowsBackgroundLocationIndicator:](self->fState, "setShowsBackgroundLocationIndicator:");
  fClient = self->fClient;

  sub_1906F2254((uint64_t)fClient, v3);
}

- (BOOL)showsBackgroundLocationIndicator
{
  return [(CLLocationManagerStateTracker *)self->fState showsBackgroundLocationIndicator];
}

- (void)stopUpdatingLocationAutoPaused
{
  [(CLLocationManagerStateTracker *)self->fState setUpdatingLocation:0];
  [(CLLocationManagerStateTracker *)self->fState setPaused:1];
  fClient = self->fClient;

  CLClientStopLocationUpdates_0((uint64_t)fClient);
}

- (NSMutableSet)rangedRegions
{
  return *(NSMutableSet **)&self->fLocationRequestTimeout;
}

- (NSMutableSet)rangedConstraints
{
  return *(NSMutableSet **)&self->fHeadingOrientation;
}

- (void)setManager:(id)a3
{
}

- (NSData)monitorLedgerAccessKey
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

@end