@interface ATXAppEntityFeatures
- (ATXAppEntityFeatures)init;
- (NSNumber)appCategoryScore;
- (NSNumber)appCategoryScore_v2;
- (NSNumber)classConditionalOfNotificationsClearedForEntity;
- (NSNumber)classConditionalOfNotificationsReceivedForEntity;
- (NSNumber)globalAppInterruptionsCountByEntity;
- (NSNumber)globalCountOfNotificationsClearedForEntity;
- (NSNumber)globalCountOfNotificationsReceivedForEntity;
- (NSNumber)globalInterruptingPrior;
- (NSNumber)globalModeAffinityPrior;
- (NSNumber)globalNotificationsClearedRateForEntity;
- (NSNumber)globalPopularityOfInterruptingEntity;
- (NSNumber)globalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)localNotificationsClearedRateForEntity;
- (NSNumber)localPopularityOfNotificationsReceivedForEntity;
- (NSNumber)modeAppInterruptionsClassConditionalProbabilityByEntity;
- (NSNumber)modeAppInterruptionsCountByEntity;
- (NSNumber)modeCountOfNotificationsClearedForEntity;
- (NSNumber)modeCountOfNotificationsReceivedForEntity;
- (NSNumber)modePopularityOfInterruptingEntity;
- (NSNumber)notificationsReceivedInLastTwoWeeks;
- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity;
- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (void)setAppCategoryScore:(id)a3;
- (void)setAppCategoryScore_v2:(id)a3;
- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3;
- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3;
- (void)setGlobalAppInterruptionsCountByEntity:(id)a3;
- (void)setGlobalCountOfNotificationsClearedForEntity:(id)a3;
- (void)setGlobalCountOfNotificationsReceivedForEntity:(id)a3;
- (void)setGlobalInterruptingPrior:(id)a3;
- (void)setGlobalModeAffinityPrior:(id)a3;
- (void)setGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setGlobalPopularityOfInterruptingEntity:(id)a3;
- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setLocalNotificationsClearedRateForEntity:(id)a3;
- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setModeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3;
- (void)setModeAppInterruptionsCountByEntity:(id)a3;
- (void)setModeCountOfNotificationsClearedForEntity:(id)a3;
- (void)setModeCountOfNotificationsReceivedForEntity:(id)a3;
- (void)setModePopularityOfInterruptingEntity:(id)a3;
- (void)setNotificationsReceivedInLastTwoWeeks:(id)a3;
- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3;
@end

@implementation ATXAppEntityFeatures

- (ATXAppEntityFeatures)init
{
  v28.receiver = self;
  v28.super_class = (Class)ATXAppEntityFeatures;
  v2 = [(ATXAppEntityFeatures *)&v28 init];
  v3 = v2;
  if (v2)
  {
    appCategoryScore = v2->_appCategoryScore;
    v2->_appCategoryScore = (NSNumber *)&unk_1F27F01B0;

    appCategoryScore_v2 = v3->_appCategoryScore_v2;
    v3->_appCategoryScore_v2 = (NSNumber *)&unk_1F27F01B0;

    globalModeAffinityPrior = v3->_globalModeAffinityPrior;
    v3->_globalModeAffinityPrior = (NSNumber *)&unk_1F27F01B0;

    globalInterruptingPrior = v3->_globalInterruptingPrior;
    v3->_globalInterruptingPrior = (NSNumber *)&unk_1F27F01B0;

    notificationsReceivedInLastTwoWeeks = v3->_notificationsReceivedInLastTwoWeeks;
    v3->_notificationsReceivedInLastTwoWeeks = (NSNumber *)&unk_1F27F01B0;

    modeAppInterruptionsCountByEntity = v3->_modeAppInterruptionsCountByEntity;
    v3->_modeAppInterruptionsCountByEntity = (NSNumber *)&unk_1F27F01B0;

    modePopularityOfInterruptingEntity = v3->_modePopularityOfInterruptingEntity;
    v3->_modePopularityOfInterruptingEntity = (NSNumber *)&unk_1F27F01B0;

    modeAppInterruptionsClassConditionalProbabilityByEntity = v3->_modeAppInterruptionsClassConditionalProbabilityByEntity;
    v3->_modeAppInterruptionsClassConditionalProbabilityByEntity = (NSNumber *)&unk_1F27F01B0;

    globalAppInterruptionsCountByEntity = v3->_globalAppInterruptionsCountByEntity;
    v3->_globalAppInterruptionsCountByEntity = (NSNumber *)&unk_1F27F01B0;

    globalPopularityOfInterruptingEntity = v3->_globalPopularityOfInterruptingEntity;
    v3->_globalPopularityOfInterruptingEntity = (NSNumber *)&unk_1F27F01B0;

    ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = v3->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
    v3->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = (NSNumber *)&unk_1F27F01B0;

    modeCountOfNotificationsClearedForEntity = v3->_modeCountOfNotificationsClearedForEntity;
    v3->_modeCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1F27F01B0;

    globalCountOfNotificationsClearedForEntity = v3->_globalCountOfNotificationsClearedForEntity;
    v3->_globalCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1F27F01B0;

    localNotificationsClearedRateForEntity = v3->_localNotificationsClearedRateForEntity;
    v3->_localNotificationsClearedRateForEntity = (NSNumber *)&unk_1F27F01B0;

    globalNotificationsClearedRateForEntity = v3->_globalNotificationsClearedRateForEntity;
    v3->_globalNotificationsClearedRateForEntity = (NSNumber *)&unk_1F27F01B0;

    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)&unk_1F27F01B0;

    classConditionalOfNotificationsClearedForEntity = v3->_classConditionalOfNotificationsClearedForEntity;
    v3->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)&unk_1F27F01B0;

    globalCountOfNotificationsReceivedForEntity = v3->_globalCountOfNotificationsReceivedForEntity;
    v3->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F01B0;

    modeCountOfNotificationsReceivedForEntity = v3->_modeCountOfNotificationsReceivedForEntity;
    v3->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F01B0;

    localPopularityOfNotificationsReceivedForEntity = v3->_localPopularityOfNotificationsReceivedForEntity;
    v3->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F01B0;

    globalPopularityOfNotificationsReceivedForEntity = v3->_globalPopularityOfNotificationsReceivedForEntity;
    v3->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F01B0;

    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F01B0;

    classConditionalOfNotificationsReceivedForEntity = v3->_classConditionalOfNotificationsReceivedForEntity;
    v3->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F01B0;
  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)ATXAppEntityFeatures;
  v5 = [(ATXAppEntityFeatures *)&v53 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"appCategoryScore"];
    appCategoryScore = v5->_appCategoryScore;
    v5->_appCategoryScore = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"appCategoryScore_v2"];
    appCategoryScore_v2 = v5->_appCategoryScore_v2;
    v5->_appCategoryScore_v2 = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"globalModeAffinityPrior"];
    globalModeAffinityPrior = v5->_globalModeAffinityPrior;
    v5->_globalModeAffinityPrior = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"globalInterruptingPrior"];
    globalInterruptingPrior = v5->_globalInterruptingPrior;
    v5->_globalInterruptingPrior = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"notificationsReceivedInLastTwoWeeks"];
    notificationsReceivedInLastTwoWeeks = v5->_notificationsReceivedInLastTwoWeeks;
    v5->_notificationsReceivedInLastTwoWeeks = (NSNumber *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"modeAppInterruptionsCountByEntity"];
    modeAppInterruptionsCountByEntity = v5->_modeAppInterruptionsCountByEntity;
    v5->_modeAppInterruptionsCountByEntity = (NSNumber *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"modePopularityOfInterruptingEntity"];
    modePopularityOfInterruptingEntity = v5->_modePopularityOfInterruptingEntity;
    v5->_modePopularityOfInterruptingEntity = (NSNumber *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"modeAppInterruptionsClassConditionalProbabilityByEntity"];
    modeAppInterruptionsClassConditionalProbabilityByEntity = v5->_modeAppInterruptionsClassConditionalProbabilityByEntity;
    v5->_modeAppInterruptionsClassConditionalProbabilityByEntity = (NSNumber *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"globalAppInterruptionsCountByEntity"];
    globalAppInterruptionsCountByEntity = v5->_globalAppInterruptionsCountByEntity;
    v5->_globalAppInterruptionsCountByEntity = (NSNumber *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"globalPopularityOfInterruptingEntity"];
    globalPopularityOfInterruptingEntity = v5->_globalPopularityOfInterruptingEntity;
    v5->_globalPopularityOfInterruptingEntity = (NSNumber *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"ratioOfModePopularityToGlobalPopularityOfInterruptingEntity"];
    ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = v5->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
    v5->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = (NSNumber *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsClearedForEntity"];
    modeCountOfNotificationsClearedForEntity = v5->_modeCountOfNotificationsClearedForEntity;
    v5->_modeCountOfNotificationsClearedForEntity = (NSNumber *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsClearedForEntity"];
    globalCountOfNotificationsClearedForEntity = v5->_globalCountOfNotificationsClearedForEntity;
    v5->_globalCountOfNotificationsClearedForEntity = (NSNumber *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"localNotificationsClearedRateForEntity"];
    localNotificationsClearedRateForEntity = v5->_localNotificationsClearedRateForEntity;
    v5->_localNotificationsClearedRateForEntity = (NSNumber *)v32;

    uint64_t v34 = [v4 objectForKeyedSubscript:@"globalNotificationsClearedRateForEntity"];
    globalNotificationsClearedRateForEntity = v5->_globalNotificationsClearedRateForEntity;
    v5->_globalNotificationsClearedRateForEntity = (NSNumber *)v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"ratioOfLocalToGlobalNotificationsClearedRateForEntity"];
    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"classConditionalOfNotificationsClearedForEntity"];
    classConditionalOfNotificationsClearedForEntity = v5->_classConditionalOfNotificationsClearedForEntity;
    v5->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)v38;

    uint64_t v40 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsReceivedForEntity"];
    globalCountOfNotificationsReceivedForEntity = v5->_globalCountOfNotificationsReceivedForEntity;
    v5->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)v40;

    uint64_t v42 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsReceivedForEntity"];
    modeCountOfNotificationsReceivedForEntity = v5->_modeCountOfNotificationsReceivedForEntity;
    v5->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)v42;

    uint64_t v44 = [v4 objectForKeyedSubscript:@"localPopularityOfNotificationsReceivedForEntity"];
    localPopularityOfNotificationsReceivedForEntity = v5->_localPopularityOfNotificationsReceivedForEntity;
    v5->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)v44;

    uint64_t v46 = [v4 objectForKeyedSubscript:@"globalPopularityOfNotificationsReceivedForEntity"];
    globalPopularityOfNotificationsReceivedForEntity = v5->_globalPopularityOfNotificationsReceivedForEntity;
    v5->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v46;

    uint64_t v48 = [v4 objectForKeyedSubscript:@"ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"];
    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v48;

    uint64_t v50 = [v4 objectForKeyedSubscript:@"classConditionalOfNotificationsReceivedForEntity"];
    classConditionalOfNotificationsReceivedForEntity = v5->_classConditionalOfNotificationsReceivedForEntity;
    v5->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)v50;
  }
  return v5;
}

- (id)jsonRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v13 = *(_OWORD *)&self->_appCategoryScore;
  v12[0] = @"appCategoryScore";
  v12[1] = @"appCategoryScore_v2";
  globalModeAffinityPrior = self->_globalModeAffinityPrior;
  v12[2] = @"globalModeAffinityPrior";
  v12[3] = @"globalInterruptingPrior";
  long long v15 = *(_OWORD *)&self->_globalInterruptingPrior;
  v12[4] = @"notificationsReceivedInLastTwoWeeks";
  v12[5] = @"modeAppInterruptionsCountByEntity";
  modeAppInterruptionsCountByEntity = self->_modeAppInterruptionsCountByEntity;
  uint64_t v14 = globalModeAffinityPrior;
  uint64_t v16 = modeAppInterruptionsCountByEntity;
  v12[6] = @"modePopularityOfInterruptingEntity";
  v12[7] = @"modeAppInterruptionsClassConditionalProbabilityByEntity";
  long long v18 = *(_OWORD *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity;
  v12[8] = @"globalAppInterruptionsCountByEntity";
  v12[9] = @"globalPopularityOfInterruptingEntity";
  globalPopularityOfInterruptingEntity = self->_globalPopularityOfInterruptingEntity;
  modePopularityOfInterruptingEntity = self->_modePopularityOfInterruptingEntity;
  v19 = globalPopularityOfInterruptingEntity;
  long long v20 = *(_OWORD *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
  v12[10] = @"ratioOfModePopularityToGlobalPopularityOfInterruptingEntity";
  v12[11] = @"modeCountOfNotificationsClearedForEntity";
  v12[12] = @"globalCountOfNotificationsClearedForEntity";
  v12[13] = @"localNotificationsClearedRateForEntity";
  localNotificationsClearedRateForEntity = self->_localNotificationsClearedRateForEntity;
  globalCountOfNotificationsClearedForEntity = self->_globalCountOfNotificationsClearedForEntity;
  uint64_t v22 = localNotificationsClearedRateForEntity;
  v12[14] = @"globalNotificationsClearedRateForEntity";
  v12[15] = @"ratioOfLocalToGlobalNotificationsClearedRateForEntity";
  ratioOfLocalToGlobalNotificationsClearedRateForEntity = self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  globalNotificationsClearedRateForEntity = self->_globalNotificationsClearedRateForEntity;
  uint64_t v24 = ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  v12[16] = @"classConditionalOfNotificationsClearedForEntity";
  v12[17] = @"globalCountOfNotificationsReceivedForEntity";
  globalCountOfNotificationsReceivedForEntity = self->_globalCountOfNotificationsReceivedForEntity;
  classConditionalOfNotificationsClearedForEntity = self->_classConditionalOfNotificationsClearedForEntity;
  uint64_t v26 = globalCountOfNotificationsReceivedForEntity;
  v12[18] = @"modeCountOfNotificationsReceivedForEntity";
  v12[19] = @"localPopularityOfNotificationsReceivedForEntity";
  localPopularityOfNotificationsReceivedForEntity = self->_localPopularityOfNotificationsReceivedForEntity;
  modeCountOfNotificationsReceivedForEntity = self->_modeCountOfNotificationsReceivedForEntity;
  uint64_t v28 = localPopularityOfNotificationsReceivedForEntity;
  v12[20] = @"globalPopularityOfNotificationsReceivedForEntity";
  v12[21] = @"ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity";
  ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  globalPopularityOfNotificationsReceivedForEntity = self->_globalPopularityOfNotificationsReceivedForEntity;
  uint64_t v30 = ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  v12[22] = @"classConditionalOfNotificationsReceivedForEntity";
  classConditionalOfNotificationsReceivedForEntity = self->_classConditionalOfNotificationsReceivedForEntity;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:v12 count:23];
  return v10;
}

- (NSNumber)appCategoryScore
{
  return self->_appCategoryScore;
}

- (void)setAppCategoryScore:(id)a3
{
}

- (NSNumber)appCategoryScore_v2
{
  return self->_appCategoryScore_v2;
}

- (void)setAppCategoryScore_v2:(id)a3
{
}

- (NSNumber)globalModeAffinityPrior
{
  return self->_globalModeAffinityPrior;
}

- (void)setGlobalModeAffinityPrior:(id)a3
{
}

- (NSNumber)globalInterruptingPrior
{
  return self->_globalInterruptingPrior;
}

- (void)setGlobalInterruptingPrior:(id)a3
{
}

- (NSNumber)notificationsReceivedInLastTwoWeeks
{
  return self->_notificationsReceivedInLastTwoWeeks;
}

- (void)setNotificationsReceivedInLastTwoWeeks:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountByEntity
{
  return self->_modeAppInterruptionsCountByEntity;
}

- (void)setModeAppInterruptionsCountByEntity:(id)a3
{
}

- (NSNumber)modeAppInterruptionsClassConditionalProbabilityByEntity
{
  return self->_modeAppInterruptionsClassConditionalProbabilityByEntity;
}

- (void)setModeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3
{
}

- (NSNumber)globalAppInterruptionsCountByEntity
{
  return self->_globalAppInterruptionsCountByEntity;
}

- (void)setGlobalAppInterruptionsCountByEntity:(id)a3
{
}

- (NSNumber)globalPopularityOfInterruptingEntity
{
  return self->_globalPopularityOfInterruptingEntity;
}

- (void)setGlobalPopularityOfInterruptingEntity:(id)a3
{
}

- (NSNumber)modePopularityOfInterruptingEntity
{
  return self->_modePopularityOfInterruptingEntity;
}

- (void)setModePopularityOfInterruptingEntity:(id)a3
{
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3
{
}

- (NSNumber)modeCountOfNotificationsClearedForEntity
{
  return self->_modeCountOfNotificationsClearedForEntity;
}

- (void)setModeCountOfNotificationsClearedForEntity:(id)a3
{
}

- (NSNumber)globalCountOfNotificationsClearedForEntity
{
  return self->_globalCountOfNotificationsClearedForEntity;
}

- (void)setGlobalCountOfNotificationsClearedForEntity:(id)a3
{
}

- (NSNumber)localNotificationsClearedRateForEntity
{
  return self->_localNotificationsClearedRateForEntity;
}

- (void)setLocalNotificationsClearedRateForEntity:(id)a3
{
}

- (NSNumber)globalNotificationsClearedRateForEntity
{
  return self->_globalNotificationsClearedRateForEntity;
}

- (void)setGlobalNotificationsClearedRateForEntity:(id)a3
{
}

- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity
{
  return self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
}

- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3
{
}

- (NSNumber)classConditionalOfNotificationsClearedForEntity
{
  return self->_classConditionalOfNotificationsClearedForEntity;
}

- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3
{
}

- (NSNumber)globalCountOfNotificationsReceivedForEntity
{
  return self->_globalCountOfNotificationsReceivedForEntity;
}

- (void)setGlobalCountOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)modeCountOfNotificationsReceivedForEntity
{
  return self->_modeCountOfNotificationsReceivedForEntity;
}

- (void)setModeCountOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)localPopularityOfNotificationsReceivedForEntity
{
  return self->_localPopularityOfNotificationsReceivedForEntity;
}

- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)globalPopularityOfNotificationsReceivedForEntity
{
  return self->_globalPopularityOfNotificationsReceivedForEntity;
}

- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity
{
  return self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
}

- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)classConditionalOfNotificationsReceivedForEntity
{
  return self->_classConditionalOfNotificationsReceivedForEntity;
}

- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_localNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_modePopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInLastTwoWeeks, 0);
  objc_storeStrong((id *)&self->_globalInterruptingPrior, 0);
  objc_storeStrong((id *)&self->_globalModeAffinityPrior, 0);
  objc_storeStrong((id *)&self->_appCategoryScore_v2, 0);
  objc_storeStrong((id *)&self->_appCategoryScore, 0);
}

@end