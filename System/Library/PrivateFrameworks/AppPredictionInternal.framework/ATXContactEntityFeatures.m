@interface ATXContactEntityFeatures
- (ATXContactEntityFeatures)init;
- (BOOL)isEmergencyContact;
- (BOOL)isFavoriteContact;
- (BOOL)isICloudFamilyMember;
- (BOOL)isVIPContact;
- (NSNumber)classConditionalOfNotificationsClearedForEntity;
- (NSNumber)classConditionalOfNotificationsReceivedForEntity;
- (NSNumber)globalCountOfNotificationsClearedForEntity;
- (NSNumber)globalCountOfNotificationsReceivedForEntity;
- (NSNumber)globalNotificationsClearedRateForEntity;
- (NSNumber)globalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)localNotificationsClearedRateForEntity;
- (NSNumber)localPopularityOfNotificationsReceivedForEntity;
- (NSNumber)modeCountOfNotificationsClearedForEntity;
- (NSNumber)modeCountOfNotificationsReceivedForEntity;
- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity;
- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3;
- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3;
- (void)setGlobalCountOfNotificationsClearedForEntity:(id)a3;
- (void)setGlobalCountOfNotificationsReceivedForEntity:(id)a3;
- (void)setGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setIsEmergencyContact:(BOOL)a3;
- (void)setIsFavoriteContact:(BOOL)a3;
- (void)setIsICloudFamilyMember:(BOOL)a3;
- (void)setIsVIPContact:(BOOL)a3;
- (void)setLocalNotificationsClearedRateForEntity:(id)a3;
- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setModeCountOfNotificationsClearedForEntity:(id)a3;
- (void)setModeCountOfNotificationsReceivedForEntity:(id)a3;
- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
@end

@implementation ATXContactEntityFeatures

- (ATXContactEntityFeatures)init
{
  v17.receiver = self;
  v17.super_class = (Class)ATXContactEntityFeatures;
  v2 = [(ATXContactEntityFeatures *)&v17 init];
  v3 = v2;
  if (v2)
  {
    modeCountOfNotificationsClearedForEntity = v2->_modeCountOfNotificationsClearedForEntity;
    v2->_modeCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1F27F2328;

    globalCountOfNotificationsClearedForEntity = v3->_globalCountOfNotificationsClearedForEntity;
    v3->_globalCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1F27F2328;

    localNotificationsClearedRateForEntity = v3->_localNotificationsClearedRateForEntity;
    v3->_localNotificationsClearedRateForEntity = (NSNumber *)&unk_1F27F2328;

    globalNotificationsClearedRateForEntity = v3->_globalNotificationsClearedRateForEntity;
    v3->_globalNotificationsClearedRateForEntity = (NSNumber *)&unk_1F27F2328;

    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)&unk_1F27F2328;

    classConditionalOfNotificationsClearedForEntity = v3->_classConditionalOfNotificationsClearedForEntity;
    v3->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)&unk_1F27F2328;

    globalCountOfNotificationsReceivedForEntity = v3->_globalCountOfNotificationsReceivedForEntity;
    v3->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F2328;

    modeCountOfNotificationsReceivedForEntity = v3->_modeCountOfNotificationsReceivedForEntity;
    v3->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F2328;

    localPopularityOfNotificationsReceivedForEntity = v3->_localPopularityOfNotificationsReceivedForEntity;
    v3->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F2328;

    globalPopularityOfNotificationsReceivedForEntity = v3->_globalPopularityOfNotificationsReceivedForEntity;
    v3->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F2328;

    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F2328;

    classConditionalOfNotificationsReceivedForEntity = v3->_classConditionalOfNotificationsReceivedForEntity;
    v3->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)&unk_1F27F2328;
  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ATXContactEntityFeatures;
  v5 = [(ATXContactEntityFeatures *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isFavorite"];
    v5->_isFavoriteContact = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"isVIP"];
    v5->_isVIPContact = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"isEmergency"];
    v5->_isEmergencyContact = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"isICloudFamilyMember"];
    v5->_isICloudFamilyMember = [v9 BOOLValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsClearedForEntity"];
    modeCountOfNotificationsClearedForEntity = v5->_modeCountOfNotificationsClearedForEntity;
    v5->_modeCountOfNotificationsClearedForEntity = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsClearedForEntity"];
    globalCountOfNotificationsClearedForEntity = v5->_globalCountOfNotificationsClearedForEntity;
    v5->_globalCountOfNotificationsClearedForEntity = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"localNotificationsClearedRateForEntity"];
    localNotificationsClearedRateForEntity = v5->_localNotificationsClearedRateForEntity;
    v5->_localNotificationsClearedRateForEntity = (NSNumber *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"globalNotificationsClearedRateForEntity"];
    globalNotificationsClearedRateForEntity = v5->_globalNotificationsClearedRateForEntity;
    v5->_globalNotificationsClearedRateForEntity = (NSNumber *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"ratioOfLocalToGlobalNotificationsClearedRateForEntity"];
    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"classConditionalOfNotificationsClearedForEntity"];
    classConditionalOfNotificationsClearedForEntity = v5->_classConditionalOfNotificationsClearedForEntity;
    v5->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsReceivedForEntity"];
    globalCountOfNotificationsReceivedForEntity = v5->_globalCountOfNotificationsReceivedForEntity;
    v5->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsReceivedForEntity"];
    modeCountOfNotificationsReceivedForEntity = v5->_modeCountOfNotificationsReceivedForEntity;
    v5->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"localPopularityOfNotificationsReceivedForEntity"];
    localPopularityOfNotificationsReceivedForEntity = v5->_localPopularityOfNotificationsReceivedForEntity;
    v5->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"globalPopularityOfNotificationsReceivedForEntity"];
    globalPopularityOfNotificationsReceivedForEntity = v5->_globalPopularityOfNotificationsReceivedForEntity;
    v5->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"];
    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"classConditionalOfNotificationsReceivedForEntity"];
    classConditionalOfNotificationsReceivedForEntity = v5->_classConditionalOfNotificationsReceivedForEntity;
    v5->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)v32;
  }
  return v5;
}

- (id)jsonRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v12[0] = @"isFavorite";
  v3 = [NSNumber numberWithBool:self->_isFavoriteContact];
  v13[0] = v3;
  v12[1] = @"isVIP";
  id v4 = [NSNumber numberWithBool:self->_isVIPContact];
  v13[1] = v4;
  v12[2] = @"isEmergency";
  v5 = [NSNumber numberWithBool:self->_isEmergencyContact];
  v13[2] = v5;
  v12[3] = @"isICloudFamilyMember";
  v6 = [NSNumber numberWithBool:self->_isICloudFamilyMember];
  modeCountOfNotificationsClearedForEntity = self->_modeCountOfNotificationsClearedForEntity;
  globalCountOfNotificationsClearedForEntity = self->_globalCountOfNotificationsClearedForEntity;
  v13[3] = v6;
  v13[4] = modeCountOfNotificationsClearedForEntity;
  v12[4] = @"modeCountOfNotificationsClearedForEntity";
  v12[5] = @"globalCountOfNotificationsClearedForEntity";
  v13[5] = globalCountOfNotificationsClearedForEntity;
  long long v14 = *(_OWORD *)&self->_localNotificationsClearedRateForEntity;
  v12[6] = @"localNotificationsClearedRateForEntity";
  v12[7] = @"globalNotificationsClearedRateForEntity";
  v12[8] = @"ratioOfLocalToGlobalNotificationsClearedRateForEntity";
  v12[9] = @"classConditionalOfNotificationsClearedForEntity";
  classConditionalOfNotificationsClearedForEntity = self->_classConditionalOfNotificationsClearedForEntity;
  ratioOfLocalToGlobalNotificationsClearedRateForEntity = self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  uint64_t v16 = classConditionalOfNotificationsClearedForEntity;
  long long v17 = *(_OWORD *)&self->_globalCountOfNotificationsReceivedForEntity;
  v12[10] = @"globalCountOfNotificationsReceivedForEntity";
  v12[11] = @"modeCountOfNotificationsReceivedForEntity";
  localPopularityOfNotificationsReceivedForEntity = self->_localPopularityOfNotificationsReceivedForEntity;
  v12[12] = @"localPopularityOfNotificationsReceivedForEntity";
  v12[13] = @"globalPopularityOfNotificationsReceivedForEntity";
  long long v19 = *(_OWORD *)&self->_globalPopularityOfNotificationsReceivedForEntity;
  v12[14] = @"ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity";
  v12[15] = @"classConditionalOfNotificationsReceivedForEntity";
  classConditionalOfNotificationsReceivedForEntity = self->_classConditionalOfNotificationsReceivedForEntity;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:16];

  return v10;
}

- (BOOL)isFavoriteContact
{
  return self->_isFavoriteContact;
}

- (void)setIsFavoriteContact:(BOOL)a3
{
  self->_isFavoriteContact = a3;
}

- (BOOL)isVIPContact
{
  return self->_isVIPContact;
}

- (void)setIsVIPContact:(BOOL)a3
{
  self->_isVIPContact = a3;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (void)setIsEmergencyContact:(BOOL)a3
{
  self->_isEmergencyContact = a3;
}

- (BOOL)isICloudFamilyMember
{
  return self->_isICloudFamilyMember;
}

- (void)setIsICloudFamilyMember:(BOOL)a3
{
  self->_isICloudFamilyMember = a3;
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
}

@end