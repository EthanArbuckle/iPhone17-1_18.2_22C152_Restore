@interface _CDFTCPInteractionDataCollectionTask
- (BOOL)deleteSessionOnCleanup;
- (BOOL)selectedForDataCollection;
- (NSDate)collectionDate;
- (NSString)sessionPath;
- (OS_xpc_object)activity;
- (_CDFTCPInteractionDataCollectionSession)session;
- (_CDFTCPInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4;
- (_CDFTCPInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4 sessionPath:(id)a5 collectionDate:(id)a6 samplingRate:(double)a7 maxBatches:(unint64_t)a8 daysPerBatch:(unint64_t)a9 twoWeekPeriodsInLookback:(unint64_t)a10;
- (_CDInteractionStore)interactionStore;
- (double)samplingRate;
- (unint64_t)daysPerBatch;
- (unint64_t)maxBatches;
- (unint64_t)twoWeekPeriodsInLookback;
- (void)_execute;
- (void)cleanup;
- (void)execute;
- (void)setDeleteSessionOnCleanup:(BOOL)a3;
- (void)setInteractionStore:(id)a3;
- (void)setSelectedForDataCollection:(BOOL)a3;
- (void)setSession:(id)a3;
@end

@implementation _CDFTCPInteractionDataCollectionTask

- (_CDFTCPInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 date];
  int v10 = CRIsAppleInternal();
  double v11 = 1.0;
  if (!v10) {
    double v11 = 0.0;
  }
  v12 = [(_CDFTCPInteractionDataCollectionTask *)self initWithStore:v8 activity:v7 sessionPath:@"/var/mobile/Library/CoreDuet/DataCollection/FTCPInteractions/session.archive" collectionDate:v9 samplingRate:1 maxBatches:7 daysPerBatch:v11 twoWeekPeriodsInLookback:2];

  return v12;
}

- (_CDFTCPInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4 sessionPath:(id)a5 collectionDate:(id)a6 samplingRate:(double)a7 maxBatches:(unint64_t)a8 daysPerBatch:(unint64_t)a9 twoWeekPeriodsInLookback:(unint64_t)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v39.receiver = self;
  v39.super_class = (Class)_CDFTCPInteractionDataCollectionTask;
  v22 = [(_CDFTCPInteractionDataCollectionTask *)&v39 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_interactionStore, a3);
    objc_storeStrong((id *)&v23->_activity, a4);
    uint64_t v24 = [v20 copy];
    sessionPath = v23->_sessionPath;
    v23->_sessionPath = (NSString *)v24;

    v26 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v23->_sessionPath options:0 error:0];
    id v37 = v19;
    id v27 = v18;
    unint64_t v28 = a9;
    if (v26)
    {
      id v38 = 0;
      v29 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v26 error:&v38];
      id v30 = v38;
      if (v30)
      {
        v31 = +[_CDLogging dataCollectionChannel];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[_CDFTCPInteractionDataCollectionTask initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:twoWeekPeriodsInLookback:]();
        }
      }
    }
    else
    {
      v29 = 0;
    }
    session = v23->_session;
    v23->_session = v29;
    v33 = v29;

    uint64_t v34 = [v21 copy];
    collectionDate = v23->_collectionDate;
    v23->_collectionDate = (NSDate *)v34;

    v23->_samplingRate = a7;
    v23->_maxBatches = a8;
    v23->_daysPerBatch = v28;
    v23->_twoWeekPeriodsInLookback = a10;
    v23->_deleteSessionOnCleanup = 1;

    id v18 = v27;
    id v19 = v37;
  }

  return v23;
}

- (void)execute
{
  [(_CDFTCPInteractionDataCollectionTask *)self _execute];
  [(_CDFTCPInteractionDataCollectionTask *)self cleanup];
}

- (void)_execute
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Selected for_CDFTCPInteractionDataCollectionTaskdata collection", v2, v3, v4, v5, v6);
}

- (void)cleanup
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error remove previous session file (_CDFTCPInteraction data collection): %@", v2, v3, v4, v5, v6);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)sessionPath
{
  return self->_sessionPath;
}

- (NSDate)collectionDate
{
  return self->_collectionDate;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
}

- (_CDFTCPInteractionDataCollectionSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (double)samplingRate
{
  return self->_samplingRate;
}

- (unint64_t)maxBatches
{
  return self->_maxBatches;
}

- (unint64_t)daysPerBatch
{
  return self->_daysPerBatch;
}

- (unint64_t)twoWeekPeriodsInLookback
{
  return self->_twoWeekPeriodsInLookback;
}

- (BOOL)selectedForDataCollection
{
  return self->_selectedForDataCollection;
}

- (void)setSelectedForDataCollection:(BOOL)a3
{
  self->_selectedForDataCollection = a3;
}

- (BOOL)deleteSessionOnCleanup
{
  return self->_deleteSessionOnCleanup;
}

- (void)setDeleteSessionOnCleanup:(BOOL)a3
{
  self->_deleteSessionOnCleanup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_collectionDate, 0);
  objc_storeStrong((id *)&self->_sessionPath, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:twoWeekPeriodsInLookback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error unarchiving _CDFTCPInteraction data collection session: %@", v2, v3, v4, v5, v6);
}

@end