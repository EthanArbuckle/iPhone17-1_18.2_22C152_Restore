@interface AssistantMetrics
+ (id)sharedMetrics;
+ (void)didDetailToggle:(id)a3 bundleId:(id)a4 on:(BOOL)a5;
+ (void)didDetailVisit:(id)a3;
+ (void)didDisableSiriConfirmed:(BOOL)a3 source:(id)a4;
+ (void)didEnableSiriConfirmed:(BOOL)a3 source:(id)a4;
+ (void)didStartEnrollment:(BOOL)a3;
+ (void)didToggle:(id)a3 on:(BOOL)a4;
+ (void)didVisit;
- (id)__confirmedTrueFalseProperty;
- (id)__detailToggleFoundInAppsTracker;
- (id)__detailToggleSearchTracker;
- (id)__detailToggleSiriKitTracker;
- (id)__detailToggleTrackerNameProperty;
- (id)__detailVisitFoundInAppsTracker;
- (id)__detailVisitTracker;
- (id)__disableSiriTracker;
- (id)__enableSiriTracker;
- (id)__foundInAppsProperty;
- (id)__onOffProperty;
- (id)__siriSourceProperty;
- (id)__startEnrollmentTracker;
- (id)__toggleTracker;
- (id)__toggleTrackerNameProperty;
- (id)__visitTracker;
- (void)logDetailToggle:(id)a3 bundleId:(id)a4 on:(BOOL)a5;
- (void)logDetailVisit:(id)a3;
- (void)logDisableSiriConfirmed:(BOOL)a3 source:(id)a4;
- (void)logEnableSiriConfirmed:(BOOL)a3 source:(id)a4;
- (void)logStartEnrollment:(BOOL)a3;
- (void)logToggle:(id)a3 on:(BOOL)a4;
- (void)logVisit;
@end

@implementation AssistantMetrics

+ (id)sharedMetrics
{
  if (sharedMetrics_onceToken != -1) {
    dispatch_once(&sharedMetrics_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedMetrics_sSharedMetrics;

  return v2;
}

uint64_t __33__AssistantMetrics_sharedMetrics__block_invoke()
{
  sharedMetrics_sSharedMetrics = objc_alloc_init(AssistantMetrics);

  return MEMORY[0x270F9A758]();
}

+ (void)didVisit
{
  id v2 = +[AssistantMetrics sharedMetrics];
  [v2 logVisit];
}

+ (void)didEnableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[AssistantMetrics sharedMetrics];
  [v6 logEnableSiriConfirmed:v4 source:v5];
}

+ (void)didDisableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[AssistantMetrics sharedMetrics];
  [v6 logDisableSiriConfirmed:v4 source:v5];
}

+ (void)didStartEnrollment:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AssistantMetrics sharedMetrics];
  [v4 logStartEnrollment:v3];
}

+ (void)didToggle:(id)a3 on:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[AssistantMetrics sharedMetrics];
  [v6 logToggle:v5 on:v4];
}

+ (void)didDetailVisit:(id)a3
{
  id v3 = a3;
  id v4 = +[AssistantMetrics sharedMetrics];
  [v4 logDetailVisit:v3];
}

+ (void)didDetailToggle:(id)a3 bundleId:(id)a4 on:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[AssistantMetrics sharedMetrics];
  [v9 logDetailToggle:v8 bundleId:v7 on:v5];
}

- (id)__onOffProperty
{
  v9[2] = *MEMORY[0x263EF8340];
  onOffProperty = self->_onOffProperty;
  if (!onOffProperty)
  {
    id PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = @"on";
    v9[1] = @"off";
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    id v6 = [PETEventPropertyClass propertyWithName:@"val" possibleValues:v5];
    id v7 = self->_onOffProperty;
    self->_onOffProperty = v6;

    onOffProperty = self->_onOffProperty;
  }

  return onOffProperty;
}

- (id)__confirmedTrueFalseProperty
{
  v9[2] = *MEMORY[0x263EF8340];
  confirmedTrueFalseProperty = self->_confirmedTrueFalseProperty;
  if (!confirmedTrueFalseProperty)
  {
    id PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = @"true";
    v9[1] = @"false";
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    id v6 = [PETEventPropertyClass propertyWithName:@"conf" possibleValues:v5];
    id v7 = self->_confirmedTrueFalseProperty;
    self->_confirmedTrueFalseProperty = v6;

    confirmedTrueFalseProperty = self->_confirmedTrueFalseProperty;
  }

  return confirmedTrueFalseProperty;
}

- (id)__toggleTrackerNameProperty
{
  v9[4] = *MEMORY[0x263EF8340];
  toggleTrackerNameProperty = self->_toggleTrackerNameProperty;
  if (!toggleTrackerNameProperty)
  {
    id PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = @"HeySiri";
    v9[1] = @"HardwareButton";
    v9[2] = @"Lockscreen";
    void v9[3] = @"Search";
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];
    id v6 = [PETEventPropertyClass propertyWithName:@"name" possibleValues:v5];
    id v7 = self->_toggleTrackerNameProperty;
    self->_toggleTrackerNameProperty = v6;

    toggleTrackerNameProperty = self->_toggleTrackerNameProperty;
  }

  return toggleTrackerNameProperty;
}

- (id)__detailToggleTrackerNameProperty
{
  v9[6] = *MEMORY[0x263EF8340];
  detailToggleTrackerNameProperty = self->_detailToggleTrackerNameProperty;
  if (!detailToggleTrackerNameProperty)
  {
    id PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = @"sirisearch";
    v9[1] = @"sirikit";
    v9[2] = @"foundinapps";
    void v9[3] = @"portraittopics";
    v9[4] = @"inAppShow";
    void v9[5] = @"inAppLearn";
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:6];
    id v6 = [PETEventPropertyClass propertyWithName:@"name" possibleValues:v5];
    id v7 = self->_detailToggleTrackerNameProperty;
    self->_detailToggleTrackerNameProperty = v6;

    detailToggleTrackerNameProperty = self->_detailToggleTrackerNameProperty;
  }

  return detailToggleTrackerNameProperty;
}

- (id)__siriSourceProperty
{
  void v9[3] = *MEMORY[0x263EF8340];
  siriSourceProperty = self->_siriSourceProperty;
  if (!siriSourceProperty)
  {
    id PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = @"HeySiri";
    v9[1] = @"HardwareButton";
    v9[2] = @"Unknown";
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    id v6 = [PETEventPropertyClass propertyWithName:@"source" possibleValues:v5];
    id v7 = self->_siriSourceProperty;
    self->_siriSourceProperty = v6;

    siriSourceProperty = self->_siriSourceProperty;
  }

  return siriSourceProperty;
}

- (id)__foundInAppsProperty
{
  v9[6] = *MEMORY[0x263EF8340];
  foundInAppsProperty = self->_foundInAppsProperty;
  if (!foundInAppsProperty)
  {
    id PETEventPropertyClass = getPETEventPropertyClass();
    v9[0] = @"com.apple.Maps";
    v9[1] = @"com.apple.mobilemail";
    v9[2] = @"com.apple.MobileSMS";
    void v9[3] = @"com.apple.news";
    void v9[4] = @"com.apple.MobileAddressBook";
    void v9[5] = @"com.apple.mobilecal";
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:6];
    id v6 = [PETEventPropertyClass propertyWithName:@"bundleId" possibleValues:v5];
    id v7 = self->_foundInAppsProperty;
    self->_foundInAppsProperty = v6;

    foundInAppsProperty = self->_foundInAppsProperty;
  }

  return foundInAppsProperty;
}

- (id)__visitTracker
{
  visitTracker = self->_visitTracker;
  if (!visitTracker)
  {
    id v4 = (PETScalarEventTracker *)[objc_alloc((Class)getPETScalarEventTrackerClass()) initWithFeatureId:@"SiriSettings" event:@"Visit" registerProperties:MEMORY[0x263EFFA68]];
    BOOL v5 = self->_visitTracker;
    self->_visitTracker = v4;

    visitTracker = self->_visitTracker;
  }

  return visitTracker;
}

- (id)__enableSiriTracker
{
  v11[2] = *MEMORY[0x263EF8340];
  enableSiriTracker = self->_enableSiriTracker;
  if (!enableSiriTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __siriSourceProperty];
    v11[0] = v5;
    id v6 = [(AssistantMetrics *)self __confirmedTrueFalseProperty];
    v11[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"EnableSiri" registerProperties:v7];
    id v9 = self->_enableSiriTracker;
    self->_enableSiriTracker = v8;

    enableSiriTracker = self->_enableSiriTracker;
  }

  return enableSiriTracker;
}

- (id)__disableSiriTracker
{
  v11[2] = *MEMORY[0x263EF8340];
  disableSiriTracker = self->_disableSiriTracker;
  if (!disableSiriTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __siriSourceProperty];
    v11[0] = v5;
    id v6 = [(AssistantMetrics *)self __confirmedTrueFalseProperty];
    v11[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"DisableSiri" registerProperties:v7];
    id v9 = self->_disableSiriTracker;
    self->_disableSiriTracker = v8;

    disableSiriTracker = self->_disableSiriTracker;
  }

  return disableSiriTracker;
}

- (id)__toggleTracker
{
  v11[2] = *MEMORY[0x263EF8340];
  toggleTracker = self->_toggleTracker;
  if (!toggleTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __toggleTrackerNameProperty];
    v11[0] = v5;
    id v6 = [(AssistantMetrics *)self __onOffProperty];
    v11[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"Toggle" registerProperties:v7];
    id v9 = self->_toggleTracker;
    self->_toggleTracker = v8;

    toggleTracker = self->_toggleTracker;
  }

  return toggleTracker;
}

- (id)__startEnrollmentTracker
{
  v10[1] = *MEMORY[0x263EF8340];
  startEnrollmentTracker = self->_startEnrollmentTracker;
  if (!startEnrollmentTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __confirmedTrueFalseProperty];
    v10[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v7 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"VoiceEnroll" registerProperties:v6];
    id v8 = self->_startEnrollmentTracker;
    self->_startEnrollmentTracker = v7;

    startEnrollmentTracker = self->_startEnrollmentTracker;
  }

  return startEnrollmentTracker;
}

- (id)__detailVisitTracker
{
  detailVisitTracker = self->_detailVisitTracker;
  if (!detailVisitTracker)
  {
    id v4 = (PETScalarEventTracker *)[objc_alloc((Class)getPETScalarEventTrackerClass()) initWithFeatureId:@"SiriSettings" event:@"DetailVisit" registerProperties:MEMORY[0x263EFFA68]];
    BOOL v5 = self->_detailVisitTracker;
    self->_detailVisitTracker = v4;

    detailVisitTracker = self->_detailVisitTracker;
  }

  return detailVisitTracker;
}

- (id)__detailVisitFoundInAppsTracker
{
  v10[1] = *MEMORY[0x263EF8340];
  detailVisitFoundInAppsTracker = self->_detailVisitFoundInAppsTracker;
  if (!detailVisitFoundInAppsTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __foundInAppsProperty];
    v10[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v7 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"DetailVisitFIA" registerProperties:v6];
    id v8 = self->_detailVisitFoundInAppsTracker;
    self->_detailVisitFoundInAppsTracker = v7;

    detailVisitFoundInAppsTracker = self->_detailVisitFoundInAppsTracker;
  }

  return detailVisitFoundInAppsTracker;
}

- (id)__detailToggleFoundInAppsTracker
{
  v12[3] = *MEMORY[0x263EF8340];
  detailToggleFoundInAppsTracker = self->_detailToggleFoundInAppsTracker;
  if (!detailToggleFoundInAppsTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __detailToggleTrackerNameProperty];
    id v6 = [(AssistantMetrics *)self __foundInAppsProperty];
    v12[1] = v6;
    id v7 = [(AssistantMetrics *)self __onOffProperty];
    v12[2] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
    id v9 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"DetailToggleFIA" registerProperties:v8];
    v10 = self->_detailToggleFoundInAppsTracker;
    self->_detailToggleFoundInAppsTracker = v9;

    detailToggleFoundInAppsTracker = self->_detailToggleFoundInAppsTracker;
  }

  return detailToggleFoundInAppsTracker;
}

- (id)__detailToggleSearchTracker
{
  v10[1] = *MEMORY[0x263EF8340];
  detailToggleSearchTracker = self->_detailToggleSearchTracker;
  if (!detailToggleSearchTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __onOffProperty];
    v10[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v7 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"DetailToggleSearch" registerProperties:v6];
    id v8 = self->_detailToggleSearchTracker;
    self->_detailToggleSearchTracker = v7;

    detailToggleSearchTracker = self->_detailToggleSearchTracker;
  }

  return detailToggleSearchTracker;
}

- (id)__detailToggleSiriKitTracker
{
  v10[1] = *MEMORY[0x263EF8340];
  detailToggleSiriKitTracker = self->_detailToggleSiriKitTracker;
  if (!detailToggleSiriKitTracker)
  {
    id v4 = objc_alloc((Class)getPETScalarEventTrackerClass());
    BOOL v5 = [(AssistantMetrics *)self __onOffProperty];
    v10[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v7 = (PETScalarEventTracker *)[v4 initWithFeatureId:@"SiriSettings" event:@"DetailToggleSiriKit" registerProperties:v6];
    id v8 = self->_detailToggleSiriKitTracker;
    self->_detailToggleSiriKitTracker = v7;

    detailToggleSiriKitTracker = self->_detailToggleSiriKitTracker;
  }

  return detailToggleSiriKitTracker;
}

- (void)logVisit
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __28__AssistantMetrics_logVisit__block_invoke;
  v2[3] = &unk_26457CF88;
  v2[4] = self;
  doAsync(v2);
}

void __28__AssistantMetrics_logVisit__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__visitTracker");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 trackEventWithPropertyValues:MEMORY[0x263EFFA68]];
}

- (void)logEnableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__AssistantMetrics_logEnableSiriConfirmed_source___block_invoke;
  v8[3] = &unk_26457D0F8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  doAsync(v8);
}

void __50__AssistantMetrics_logEnableSiriConfirmed_source___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__siriSourceProperty");
  int v3 = [v2 isValidValue:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "__enableSiriTracker");
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v5 = @"true";
    }
    else {
      BOOL v5 = @"false";
    }
    v7[0] = *(void *)(a1 + 40);
    v7[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
    [v4 trackEventWithPropertyValues:v6];
  }
}

- (void)logDisableSiriConfirmed:(BOOL)a3 source:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__AssistantMetrics_logDisableSiriConfirmed_source___block_invoke;
  v8[3] = &unk_26457D0F8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  doAsync(v8);
}

void __51__AssistantMetrics_logDisableSiriConfirmed_source___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__siriSourceProperty");
  int v3 = [v2 isValidValue:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "__disableSiriTracker");
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v5 = @"true";
    }
    else {
      BOOL v5 = @"false";
    }
    v7[0] = *(void *)(a1 + 40);
    v7[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
    [v4 trackEventWithPropertyValues:v6];
  }
}

- (void)logStartEnrollment:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__AssistantMetrics_logStartEnrollment___block_invoke;
  v3[3] = &unk_26457D120;
  v3[4] = self;
  BOOL v4 = a3;
  doAsync(v3);
}

void __39__AssistantMetrics_logStartEnrollment___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__startEnrollmentTracker");
  int v3 = @"true";
  if (!*(unsigned char *)(a1 + 40)) {
    int v3 = @"false";
  }
  v5[0] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [v2 trackEventWithPropertyValues:v4];
}

- (void)logToggle:(id)a3 on:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__AssistantMetrics_logToggle_on___block_invoke;
  v8[3] = &unk_26457D0F8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  doAsync(v8);
}

void __33__AssistantMetrics_logToggle_on___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__toggleTrackerNameProperty");
  int v3 = [v2 isValidValue:*(void *)(a1 + 40)];

  if (v3)
  {
    BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "__toggleTracker");
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v5 = @"on";
    }
    else {
      BOOL v5 = @"off";
    }
    v7[0] = *(void *)(a1 + 40);
    v7[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
    [v4 trackEventWithPropertyValues:v6];
  }
}

- (void)logDetailVisit:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__AssistantMetrics_logDetailVisit___block_invoke;
  v6[3] = &unk_26457D148;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  doAsync(v6);
}

void __35__AssistantMetrics_logDetailVisit___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__foundInAppsProperty");
  int v3 = [v2 isValidValue:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = objc_msgSend(v4, "__detailVisitFoundInAppsTracker");
    v8[0] = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [v5 trackEventWithPropertyValues:v6];
  }
  else
  {
    objc_msgSend(v4, "__detailVisitTracker");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 trackEventWithPropertyValues:MEMORY[0x263EFFA68]];
  }
}

- (void)logDetailToggle:(id)a3 bundleId:(id)a4 on:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__AssistantMetrics_logDetailToggle_bundleId_on___block_invoke;
  v12[3] = &unk_26457D170;
  void v12[4] = self;
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = a5;
  id v10 = v8;
  id v11 = v9;
  doAsync(v12);
}

void __48__AssistantMetrics_logDetailToggle_bundleId_on___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__foundInAppsProperty");
  int v3 = [v2 isValidValue:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "__detailToggleFoundInAppsTracker");
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = v5;
    id v6 = @"on";
    if (!*(unsigned char *)(a1 + 56)) {
      id v6 = @"off";
    }
    v17 = v6;
    id v7 = (void *)MEMORY[0x263EFF8C0];
    id v8 = (__CFString **)&v15;
    uint64_t v9 = 3;
  }
  else
  {
    if ([*(id *)(a1 + 48) isEqualToString:@"sirikit"])
    {
      id v4 = objc_msgSend(*(id *)(a1 + 32), "__detailToggleSiriKitTracker");
      id v10 = @"on";
      if (!*(unsigned char *)(a1 + 56)) {
        id v10 = @"off";
      }
      id v14 = v10;
      id v7 = (void *)MEMORY[0x263EFF8C0];
      id v8 = &v14;
    }
    else
    {
      if (![*(id *)(a1 + 48) isEqualToString:@"sirisearch"]) {
        return;
      }
      id v4 = objc_msgSend(*(id *)(a1 + 32), "__detailToggleSearchTracker");
      id v11 = @"on";
      if (!*(unsigned char *)(a1 + 56)) {
        id v11 = @"off";
      }
      id v13 = v11;
      id v7 = (void *)MEMORY[0x263EFF8C0];
      id v8 = &v13;
    }
    uint64_t v9 = 1;
  }
  v12 = objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v13, v14, v15, v16, v17);
  [v4 trackEventWithPropertyValues:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailToggleSearchTracker, 0);
  objc_storeStrong((id *)&self->_detailToggleSiriKitTracker, 0);
  objc_storeStrong((id *)&self->_detailToggleFoundInAppsTracker, 0);
  objc_storeStrong((id *)&self->_detailVisitFoundInAppsTracker, 0);
  objc_storeStrong((id *)&self->_detailVisitTracker, 0);
  objc_storeStrong((id *)&self->_toggleTracker, 0);
  objc_storeStrong((id *)&self->_startEnrollmentTracker, 0);
  objc_storeStrong((id *)&self->_disableSiriTracker, 0);
  objc_storeStrong((id *)&self->_enableSiriTracker, 0);
  objc_storeStrong((id *)&self->_visitTracker, 0);
  objc_storeStrong((id *)&self->_foundInAppsProperty, 0);
  objc_storeStrong((id *)&self->_siriSourceProperty, 0);
  objc_storeStrong((id *)&self->_confirmedTrueFalseProperty, 0);
  objc_storeStrong((id *)&self->_onOffProperty, 0);
  objc_storeStrong((id *)&self->_detailToggleTrackerNameProperty, 0);

  objc_storeStrong((id *)&self->_toggleTrackerNameProperty, 0);
}

@end