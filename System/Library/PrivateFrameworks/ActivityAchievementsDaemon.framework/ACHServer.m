@interface ACHServer
+ (id)serverWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 awardingScheduler:(id)a6 achievementStore:(id)a7 mobileAssetProvider:(id)a8 templateSourceScheduler:(id)a9 monthlyChallengeTemplateSource:(id)a10 error:(id *)a11;
+ (id)serverWithTemplateStore:(id)a3 earnedInstanceStore:(id)a4 awardingScheduler:(id)a5 achievementStore:(id)a6 mobileAssetProvider:(id)a7 templateSourceScheduler:(id)a8 monthlyChallengeTemplateSource:(id)a9;
- (ACHAchievementStoring)achievementStore;
- (ACHAwardingScheduler)awardingScheduler;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHMobileAssetProvider)mobileAssetProvider;
- (ACHMonthlyChallengeTemplateSource)monthlyChallengeTemplateSource;
- (ACHServer)initWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 awardingScheduler:(id)a6 achievementStore:(id)a7 mobileAssetProvider:(id)a8 templateSourceScheduler:(id)a9 monthlyChallengeTemplateSource:(id)a10;
- (ACHTemplateSourceScheduler)templateSourceScheduler;
- (ACHTemplateStore)templateStore;
- (HDProfile)profile;
- (HDXPCClient)client;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInvalidated;
- (void)remote_addEarnedInstance:(id)a3 completion:(id)a4;
- (void)remote_addTemplate:(id)a3 completion:(id)a4;
- (void)remote_availableMobileAssetsWithCompletion:(id)a3;
- (void)remote_fetchAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)remote_fetchActivityChallengeAssetsServerURLWithCompletion:(id)a3;
- (void)remote_fetchAllAchievementsWithCompletion:(id)a3;
- (void)remote_fetchAllEarnedInstancesWithCompletion:(id)a3;
- (void)remote_fetchAllTemplatesWithCompletion:(id)a3;
- (void)remote_fetchEphemeralAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)remote_forceAwardingSchedulerWithCompletion:(id)a3;
- (void)remote_monthlyChallengeForDate:(id)a3 completion:(id)a4;
- (void)remote_removeAllEarnedInstancesWithCompletion:(id)a3;
- (void)remote_removeAllTemplatesWithCompletion:(id)a3;
- (void)remote_removeEarnedInstance:(id)a3 completion:(id)a4;
- (void)remote_removeTemplate:(id)a3 completion:(id)a4;
- (void)remote_runMonthlyChallengesWithCompletion:(id)a3;
- (void)remote_setActivityChallengeAssetsServerURL:(id)a3 completion:(id)a4;
- (void)remote_templateForMonthlyChallengeType:(unint64_t)a3 completion:(id)a4;
- (void)setAchievementStore:(id)a3;
- (void)setAwardingScheduler:(id)a3;
- (void)setClient:(id)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setMobileAssetProvider:(id)a3;
- (void)setMonthlyChallengeTemplateSource:(id)a3;
- (void)setProfile:(id)a3;
- (void)setTemplateSourceScheduler:(id)a3;
- (void)setTemplateStore:(id)a3;
@end

@implementation ACHServer

+ (id)serverWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 awardingScheduler:(id)a6 achievementStore:(id)a7 mobileAssetProvider:(id)a8 templateSourceScheduler:(id)a9 monthlyChallengeTemplateSource:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v24 = [v16 process];
  int v25 = [v24 hasRequiredEntitlement:*MEMORY[0x263F09BA8] error:a11];

  if (v25)
  {
    v26 = (void *)[objc_alloc((Class)a1) initWithClient:v16 templateStore:v17 earnedInstanceStore:v18 awardingScheduler:v19 achievementStore:v20 mobileAssetProvider:v21 templateSourceScheduler:v22 monthlyChallengeTemplateSource:v23];
  }
  else
  {
    id v27 = v23;
    v28 = ACHLogXPC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v28, OS_LOG_TYPE_DEFAULT, "ACHServer rejecting client connection missing entitlement.", buf, 2u);
    }

    v26 = 0;
    id v23 = v27;
  }

  return v26;
}

+ (id)serverWithTemplateStore:(id)a3 earnedInstanceStore:(id)a4 awardingScheduler:(id)a5 achievementStore:(id)a6 mobileAssetProvider:(id)a7 templateSourceScheduler:(id)a8 monthlyChallengeTemplateSource:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = (void *)[objc_alloc((Class)a1) initWithClient:0 templateStore:v22 earnedInstanceStore:v21 awardingScheduler:v20 achievementStore:v19 mobileAssetProvider:v18 templateSourceScheduler:v17 monthlyChallengeTemplateSource:v16];

  return v23;
}

- (ACHServer)initWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 awardingScheduler:(id)a6 achievementStore:(id)a7 mobileAssetProvider:(id)a8 templateSourceScheduler:(id)a9 monthlyChallengeTemplateSource:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ACHServer;
  id v18 = [(ACHServer *)&v28 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_client, a3);
    objc_storeStrong((id *)&v19->_templateStore, a4);
    objc_storeStrong((id *)&v19->_earnedInstanceStore, a5);
    objc_storeStrong((id *)&v19->_awardingScheduler, a6);
    objc_storeStrong((id *)&v19->_achievementStore, a7);
    objc_storeStrong((id *)&v19->_mobileAssetProvider, a8);
    objc_storeStrong((id *)&v19->_templateSourceScheduler, a9);
    objc_storeStrong((id *)&v19->_monthlyChallengeTemplateSource, a10);
  }

  return v19;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F0A7A0](self, a2);
}

- (id)remoteInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  id v3 = [(ACHServer *)self client];
  v2 = [v3 connection];
  [v2 invalidate];
}

- (void)remote_addTemplate:(id)a3 completion:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  v8 = [(ACHServer *)self templateStore];
  v10[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  [v8 addTemplates:v9];
  v6[2](v6, 1, 0);
}

- (void)remote_removeTemplate:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  v8 = [(ACHServer *)self templateStore];
  v13[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v12 = 0;
  uint64_t v10 = [v8 removeTemplates:v9 error:&v12];
  id v11 = v12;

  v6[2](v6, v10, v11);
}

- (void)remote_removeAllTemplatesWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(ACHServer *)self templateStore];
  id v8 = 0;
  uint64_t v6 = [v5 removeAllTemplates:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_fetchAllTemplatesWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  v5 = [(ACHServer *)self templateStore];
  id v6 = [v5 allTemplates];

  v4[2](v4, v6, 0);
}

- (void)remote_fetchAllEarnedInstancesWithCompletion:(id)a3
{
  id v5 = a3;
  id v7 = [(ACHServer *)self earnedInstanceStore];
  id v6 = [v7 earnedInstances];
  (*((void (**)(id, void *, void))a3 + 2))(v5, v6, 0);
}

- (void)remote_removeAllEarnedInstancesWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, id))a3;
  id v5 = [(ACHServer *)self earnedInstanceStore];
  id v8 = 0;
  uint64_t v6 = [v5 removeAllEarnedInstancesWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_addEarnedInstance:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(ACHServer *)self earnedInstanceStore];
  v9 = [MEMORY[0x263EFFA08] setWithObject:v7];

  id v12 = 0;
  uint64_t v10 = [v8 addEarnedInstances:v9 error:&v12];
  id v11 = v12;

  v6[2](v6, v10, v11);
}

- (void)remote_removeEarnedInstance:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(ACHServer *)self earnedInstanceStore];
  v13[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v12 = 0;
  uint64_t v10 = [v8 removeEarnedInstances:v9 error:&v12];
  id v11 = v12;

  v6[2](v6, v10, v11);
}

- (void)remote_fetchAllAchievementsWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  id v5 = [(ACHServer *)self achievementStore];
  uint64_t v6 = [v5 allAchievements];
  id v7 = [v6 allObjects];

  v4[2](v4, v7, 0);
}

- (void)remote_fetchAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = [(ACHServer *)self achievementStore];
  id v9 = [v8 achievementWithTemplateUniqueName:v7];

  v6[2](v6, v9, 0);
}

- (void)remote_fetchEphemeralAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = [(ACHServer *)self achievementStore];
  id v9 = [v8 ephemeralAchievementWithTemplateUniqueName:v7];

  v6[2](v6, v9, 0);
}

- (void)remote_forceAwardingSchedulerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHServer *)self awardingScheduler];
  [v5 requestAwardingEvaluationWithCompletion:v4];
}

- (void)remote_fetchActivityChallengeAssetsServerURLWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, id))a3;
  id v4 = ACHMobileAssetServerURLWithError();
  id v5 = 0;
  v3[2](v3, v4, v5);
}

- (void)remote_setActivityChallengeAssetsServerURL:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, uint64_t, void))a4;
  ACHSetMobileAssetServerURL();
  v4[2](v4, 1, 0);
}

- (void)remote_availableMobileAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHServer *)self mobileAssetProvider];
  [v5 availableAssetsWithCompletion:v4];
}

- (void)remote_runMonthlyChallengesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, BOOL, id))a3;
  id v5 = [(ACHServer *)self templateSourceScheduler];
  id v7 = 0;
  [v5 _runSynchronouslyWithError:&v7];
  id v6 = v7;

  if (v4) {
    v4[2](v4, v6 == 0, v6);
  }
}

- (void)remote_templateForMonthlyChallengeType:(unint64_t)a3 completion:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = [(ACHServer *)self monthlyChallengeTemplateSource];
  id v31 = 0;
  int v8 = [v7 isMonthlyChallengeOfTypeAvailable:a3 error:&v31];
  id v9 = v31;

  if (!v8)
  {
    id v22 = 0;
    if (!v6) {
      goto LABEL_8;
    }
LABEL_7:
    v6[2](v6, v22, v9);
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v11 = [MEMORY[0x263EFF910] date];
  id v12 = [v10 components:12 fromDate:v11];

  v13 = [v10 dateFromComponents:v12];
  uint64_t v14 = [v10 components:28 fromDate:v13];

  id v27 = objc_msgSend(v10, "hk_startOfMonthForDate:addingMonths:", v13, 1);
  id v26 = objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", 1);
  v15 = objc_msgSend(v10, "components:fromDate:", 28);
  objc_super v28 = (void *)v14;
  id v16 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v14 endDateComponents:v15];
  id v17 = [(ACHServer *)self monthlyChallengeTemplateSource];
  id v30 = v9;
  [v17 _goalValueForCurrentMonthForType:a3 error:&v30];
  double v19 = v18;
  id v20 = v30;

  id v21 = [(ACHServer *)self monthlyChallengeTemplateSource];
  id v22 = [v21 _createMonthlyChallengeTemplateWithType:a3 dateCompoonentInterval:v16 goalValue:v19];

  id v23 = [(ACHServer *)self monthlyChallengeTemplateSource];
  id v29 = v20;
  id v24 = [v23 _suffixForCurrentMonthForType:a3 template:v22 goal:&v29 error:v19];
  id v9 = v29;

  if (v24)
  {
    v32[0] = v24;
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    [v22 setAvailableSuffixes:v25];
  }
  if (v6) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)remote_monthlyChallengeForDate:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v28 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = [(ACHServer *)self templateStore];
  int v8 = [v7 allTemplates];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    id v12 = (void *)*MEMORY[0x263F23618];
    uint64_t v31 = *MEMORY[0x263F234C0];
    id v29 = (void *)*MEMORY[0x263F23618];
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v32 = v10;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        v15 = [v14 sourceName];

        if (v15 == v12)
        {
          id v16 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
          id v17 = [v16 components:v31 fromDate:v6];
          double v18 = [v14 uniqueName];
          double v19 = [v18 componentsSeparatedByString:@"_"];

          if ([v19 count] == 3)
          {
            id v20 = [v19 objectAtIndexedSubscript:1];
            uint64_t v21 = [v20 integerValue];

            [v19 objectAtIndexedSubscript:2];
            uint64_t v22 = v11;
            id v23 = v8;
            id v25 = v24 = v6;
            uint64_t v30 = [v25 integerValue];

            id v6 = v24;
            int v8 = v23;
            uint64_t v11 = v22;
            BOOL v26 = v21 == [v17 year];
            id v12 = v29;
            if (v26 && v30 == [v17 month])
            {
              id v27 = v28;
              (*((void (**)(id, void *, void))v28 + 2))(v28, v14, 0);

              goto LABEL_16;
            }
          }

          uint64_t v10 = v32;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v27 = v28;
  (*((void (**)(id, void, void))v28 + 2))(v28, 0, 0);
LABEL_16:
}

- (HDXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (ACHAwardingScheduler)awardingScheduler
{
  return self->_awardingScheduler;
}

- (void)setAwardingScheduler:(id)a3
{
}

- (ACHAchievementStoring)achievementStore
{
  return self->_achievementStore;
}

- (void)setAchievementStore:(id)a3
{
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
}

- (ACHTemplateSourceScheduler)templateSourceScheduler
{
  return self->_templateSourceScheduler;
}

- (void)setTemplateSourceScheduler:(id)a3
{
}

- (ACHMonthlyChallengeTemplateSource)monthlyChallengeTemplateSource
{
  return self->_monthlyChallengeTemplateSource;
}

- (void)setMonthlyChallengeTemplateSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlyChallengeTemplateSource, 0);
  objc_storeStrong((id *)&self->_templateSourceScheduler, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_achievementStore, 0);
  objc_storeStrong((id *)&self->_awardingScheduler, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end