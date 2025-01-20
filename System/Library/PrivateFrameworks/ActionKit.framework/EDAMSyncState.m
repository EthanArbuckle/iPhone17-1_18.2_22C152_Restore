@interface EDAMSyncState
+ (id)structFields;
+ (id)structName;
- (EDAMClientSyncRateConfig)clientSyncRateConfig;
- (NSNumber)businessSummaryUpdated;
- (NSNumber)communicationEngineUpdateId;
- (NSNumber)currentDevicesUsed;
- (NSNumber)currentTime;
- (NSNumber)fullSyncBefore;
- (NSNumber)showChoiceScreen;
- (NSNumber)updateCount;
- (NSNumber)uploaded;
- (NSNumber)userLastUpdated;
- (NSNumber)userMaxMessageEventId;
- (void)setBusinessSummaryUpdated:(id)a3;
- (void)setClientSyncRateConfig:(id)a3;
- (void)setCommunicationEngineUpdateId:(id)a3;
- (void)setCurrentDevicesUsed:(id)a3;
- (void)setCurrentTime:(id)a3;
- (void)setFullSyncBefore:(id)a3;
- (void)setShowChoiceScreen:(id)a3;
- (void)setUpdateCount:(id)a3;
- (void)setUploaded:(id)a3;
- (void)setUserLastUpdated:(id)a3;
- (void)setUserMaxMessageEventId:(id)a3;
@end

@implementation EDAMSyncState

+ (id)structFields
{
  v17[11] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_34;
  if (!structFields_structFields_34)
  {
    v16 = +[FATField fieldWithIndex:1 type:10 optional:0 name:@"currentTime"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:2 type:10 optional:0 name:@"fullSyncBefore"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"updateCount"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"uploaded"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"userLastUpdated"];
    v17[4] = v5;
    v6 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"userMaxMessageEventId"];
    v17[5] = v6;
    v7 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"businessSummaryUpdated"];
    v17[6] = v7;
    v8 = +[FATField fieldWithIndex:8 type:8 optional:1 name:@"communicationEngineUpdateId"];
    v17[7] = v8;
    v9 = +[FATField fieldWithIndex:9 type:8 optional:1 name:@"currentDevicesUsed"];
    v17[8] = v9;
    v10 = +[FATField fieldWithIndex:10 type:2 optional:1 name:@"showChoiceScreen"];
    v17[9] = v10;
    v11 = +[FATField fieldWithIndex:11 type:12 optional:1 name:@"clientSyncRateConfig" structClass:objc_opt_class()];
    v17[10] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
    v13 = (void *)structFields_structFields_34;
    structFields_structFields_34 = v12;

    v2 = (void *)structFields_structFields_34;
  }
  return v2;
}

+ (id)structName
{
  return @"SyncState";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSyncRateConfig, 0);
  objc_storeStrong((id *)&self->_showChoiceScreen, 0);
  objc_storeStrong((id *)&self->_currentDevicesUsed, 0);
  objc_storeStrong((id *)&self->_communicationEngineUpdateId, 0);
  objc_storeStrong((id *)&self->_businessSummaryUpdated, 0);
  objc_storeStrong((id *)&self->_userMaxMessageEventId, 0);
  objc_storeStrong((id *)&self->_userLastUpdated, 0);
  objc_storeStrong((id *)&self->_uploaded, 0);
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_fullSyncBefore, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

- (void)setClientSyncRateConfig:(id)a3
{
}

- (EDAMClientSyncRateConfig)clientSyncRateConfig
{
  return self->_clientSyncRateConfig;
}

- (void)setShowChoiceScreen:(id)a3
{
}

- (NSNumber)showChoiceScreen
{
  return self->_showChoiceScreen;
}

- (void)setCurrentDevicesUsed:(id)a3
{
}

- (NSNumber)currentDevicesUsed
{
  return self->_currentDevicesUsed;
}

- (void)setCommunicationEngineUpdateId:(id)a3
{
}

- (NSNumber)communicationEngineUpdateId
{
  return self->_communicationEngineUpdateId;
}

- (void)setBusinessSummaryUpdated:(id)a3
{
}

- (NSNumber)businessSummaryUpdated
{
  return self->_businessSummaryUpdated;
}

- (void)setUserMaxMessageEventId:(id)a3
{
}

- (NSNumber)userMaxMessageEventId
{
  return self->_userMaxMessageEventId;
}

- (void)setUserLastUpdated:(id)a3
{
}

- (NSNumber)userLastUpdated
{
  return self->_userLastUpdated;
}

- (void)setUploaded:(id)a3
{
}

- (NSNumber)uploaded
{
  return self->_uploaded;
}

- (void)setUpdateCount:(id)a3
{
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setFullSyncBefore:(id)a3
{
}

- (NSNumber)fullSyncBefore
{
  return self->_fullSyncBefore;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

@end