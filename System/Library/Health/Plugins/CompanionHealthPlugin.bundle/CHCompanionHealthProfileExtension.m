@interface CHCompanionHealthProfileExtension
- (CHActivityApplicationInstallationManager)activityApplicationInstallationManager;
- (CHCoachingDiagnosticManager)coachDiagnosticManager;
- (CHCompanionHealthProfileExtension)initWithProfile:(id)a3;
- (CHCompanionWidgetSchedulingManager)widgetSchedulingManager;
- (CHCompanionWorkoutCreditManager)companionWorkoutCreditManager;
- (CHFitnessAppBadgeManager)fitnessAppBadgeManager;
- (CHTrendsNotificationManager)trendsNotificationManager;
- (FCHealthService)fitnessCoachingHealthService;
- (HDProfile)profile;
- (void)dealloc;
- (void)registerFitnessAppBadgeCountProvider:(id)a3;
- (void)requestFitnessAppBadgeCountUpdate;
- (void)setActivityApplicationInstallationManager:(id)a3;
- (void)setCoachDiagnosticManager:(id)a3;
- (void)setCompanionWorkoutCreditManager:(id)a3;
- (void)setFitnessAppBadgeManager:(id)a3;
- (void)setFitnessCoachingHealthService:(id)a3;
- (void)setProfile:(id)a3;
- (void)setTrendsNotificationManager:(id)a3;
- (void)setWidgetSchedulingManager:(id)a3;
- (void)unregisterFitnessAppBadgeCountProvider:(id)a3;
@end

@implementation CHCompanionHealthProfileExtension

- (void)requestFitnessAppBadgeCountUpdate
{
}

- (void)registerFitnessAppBadgeCountProvider:(id)a3
{
}

- (CHCompanionHealthProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CHCompanionHealthProfileExtension;
  v5 = [(CHCompanionHealthProfileExtension *)&v40 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x263F33248]);
    v8 = [(CHCompanionHealthProfileExtension *)v6 profile];
    uint64_t v9 = [v7 initWithProfile:v8];
    activityApplicationInstallationManager = v6->_activityApplicationInstallationManager;
    v6->_activityApplicationInstallationManager = (CHActivityApplicationInstallationManager *)v9;

    id v11 = objc_alloc(MEMORY[0x263F33260]);
    v12 = [(CHCompanionHealthProfileExtension *)v6 profile];
    uint64_t v13 = [v11 initWithProfile:v12];
    companionWorkoutCreditManager = v6->_companionWorkoutCreditManager;
    v6->_companionWorkoutCreditManager = (CHCompanionWorkoutCreditManager *)v13;

    v15 = (CHFitnessAppBadgeManager *)objc_alloc_init(MEMORY[0x263F33268]);
    fitnessAppBadgeManager = v6->_fitnessAppBadgeManager;
    v6->_fitnessAppBadgeManager = v15;

    id v17 = objc_alloc(MEMORY[0x263F33250]);
    v18 = [(CHCompanionHealthProfileExtension *)v6 profile];
    uint64_t v19 = [v17 initWithProfile:v18];
    coachDiagnosticManager = v6->_coachDiagnosticManager;
    v6->_coachDiagnosticManager = (CHCoachingDiagnosticManager *)v19;

    id v21 = objc_alloc(MEMORY[0x263F33270]);
    v22 = [(CHCompanionHealthProfileExtension *)v6 profile];
    uint64_t v23 = [v21 initWithProfile:v22];
    trendsNotificationManager = v6->_trendsNotificationManager;
    v6->_trendsNotificationManager = (CHTrendsNotificationManager *)v23;

    id v25 = objc_alloc(MEMORY[0x263F33258]);
    v26 = [(CHCompanionHealthProfileExtension *)v6 profile];
    uint64_t v27 = [v25 initWithProfile:v26];
    widgetSchedulingManager = v6->_widgetSchedulingManager;
    v6->_widgetSchedulingManager = (CHCompanionWidgetSchedulingManager *)v27;

    id v29 = objc_alloc(MEMORY[0x263F3E0A8]);
    v30 = [(CHCompanionHealthProfileExtension *)v6 profile];
    uint64_t v31 = [v29 initWithProfile:v30];
    fitnessCoachingHealthService = v6->_fitnessCoachingHealthService;
    v6->_fitnessCoachingHealthService = (FCHealthService *)v31;

    objc_initWeak(&location, v6);
    v33 = (const char *)*MEMORY[0x263F09FD8];
    v34 = MEMORY[0x263EF83A0];
    id v35 = MEMORY[0x263EF83A0];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_241DD9D38;
    v37[3] = &unk_2650F9358;
    objc_copyWeak(&v38, &location);
    notify_register_dispatch(v33, &v6->_standalonePhoneFitnessModeChangeToken, v34, v37);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  int standalonePhoneFitnessModeChangeToken = self->_standalonePhoneFitnessModeChangeToken;
  if (standalonePhoneFitnessModeChangeToken != -1) {
    notify_cancel(standalonePhoneFitnessModeChangeToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHCompanionHealthProfileExtension;
  [(CHCompanionHealthProfileExtension *)&v4 dealloc];
}

- (void)unregisterFitnessAppBadgeCountProvider:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (CHActivityApplicationInstallationManager)activityApplicationInstallationManager
{
  return self->_activityApplicationInstallationManager;
}

- (void)setActivityApplicationInstallationManager:(id)a3
{
}

- (CHCompanionWorkoutCreditManager)companionWorkoutCreditManager
{
  return self->_companionWorkoutCreditManager;
}

- (void)setCompanionWorkoutCreditManager:(id)a3
{
}

- (CHFitnessAppBadgeManager)fitnessAppBadgeManager
{
  return self->_fitnessAppBadgeManager;
}

- (void)setFitnessAppBadgeManager:(id)a3
{
}

- (CHCoachingDiagnosticManager)coachDiagnosticManager
{
  return self->_coachDiagnosticManager;
}

- (void)setCoachDiagnosticManager:(id)a3
{
}

- (CHTrendsNotificationManager)trendsNotificationManager
{
  return self->_trendsNotificationManager;
}

- (void)setTrendsNotificationManager:(id)a3
{
}

- (CHCompanionWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (void)setWidgetSchedulingManager:(id)a3
{
}

- (FCHealthService)fitnessCoachingHealthService
{
  return self->_fitnessCoachingHealthService;
}

- (void)setFitnessCoachingHealthService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessCoachingHealthService, 0);
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_trendsNotificationManager, 0);
  objc_storeStrong((id *)&self->_coachDiagnosticManager, 0);
  objc_storeStrong((id *)&self->_fitnessAppBadgeManager, 0);
  objc_storeStrong((id *)&self->_companionWorkoutCreditManager, 0);
  objc_storeStrong((id *)&self->_activityApplicationInstallationManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end