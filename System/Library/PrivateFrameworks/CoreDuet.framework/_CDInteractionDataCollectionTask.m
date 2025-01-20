@interface _CDInteractionDataCollectionTask
- (BOOL)deleteSessionOnCleanup;
- (BOOL)selectedForDataCollection;
- (NSDate)collectionDate;
- (NSString)sessionPath;
- (OS_xpc_object)activity;
- (_CDInteractionDataCollectionSession)session;
- (_CDInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4;
- (_CDInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4 sessionPath:(id)a5 collectionDate:(id)a6 samplingRate:(double)a7 maxBatches:(unint64_t)a8 daysPerBatch:(unint64_t)a9;
- (_CDInteractionStore)interactionStore;
- (double)samplingRate;
- (unint64_t)daysPerBatch;
- (unint64_t)maxBatches;
- (void)_execute;
- (void)cleanup;
- (void)execute;
- (void)setDeleteSessionOnCleanup:(BOOL)a3;
- (void)setInteractionStore:(id)a3;
- (void)setSelectedForDataCollection:(BOOL)a3;
- (void)setSession:(id)a3;
@end

@implementation _CDInteractionDataCollectionTask

- (_CDInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] date];
  double v9 = 1.0;
  if (!CRIsAppleInternal())
  {
    v10 = OSAGetDATaskingValue();
    double v9 = 0.0001;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        double v9 = v11;
      }
    }
  }
  v12 = OSAGetDATaskingValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v13 = [v12 unsignedIntegerValue];
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = OSAGetDATaskingValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v15 = [v14 unsignedIntegerValue];
  }
  else {
    uint64_t v15 = 7;
  }
  v16 = [(_CDInteractionDataCollectionTask *)self initWithStore:v6 activity:v7 sessionPath:@"/var/mobile/Library/CoreDuet/DataCollection/Interactions/session.archive" collectionDate:v8 samplingRate:v13 maxBatches:v15 daysPerBatch:v9];

  return v16;
}

- (_CDInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4 sessionPath:(id)a5 collectionDate:(id)a6 samplingRate:(double)a7 maxBatches:(unint64_t)a8 daysPerBatch:(unint64_t)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v38.receiver = self;
  v38.super_class = (Class)_CDInteractionDataCollectionTask;
  v21 = [(_CDInteractionDataCollectionTask *)&v38 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_interactionStore, a3);
    objc_storeStrong((id *)&v22->_activity, a4);
    uint64_t v23 = [v19 copy];
    sessionPath = v22->_sessionPath;
    v22->_sessionPath = (NSString *)v23;

    v25 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v22->_sessionPath options:0 error:0];
    id v36 = v18;
    id v26 = v17;
    unint64_t v27 = a9;
    if (v25)
    {
      id v37 = 0;
      v28 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v25 error:&v37];
      id v29 = v37;
      if (v29)
      {
        v30 = +[_CDLogging dataCollectionChannel];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[_CDInteractionDataCollectionTask initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:]();
        }
      }
    }
    else
    {
      v28 = 0;
    }
    session = v22->_session;
    v22->_session = v28;
    v32 = v28;

    uint64_t v33 = [v20 copy];
    collectionDate = v22->_collectionDate;
    v22->_collectionDate = (NSDate *)v33;

    v22->_samplingRate = a7;
    v22->_maxBatches = a8;
    v22->_daysPerBatch = v27;
    v22->_deleteSessionOnCleanup = 1;

    id v17 = v26;
    id v18 = v36;
  }

  return v22;
}

- (void)execute
{
  [(_CDInteractionDataCollectionTask *)self _execute];
  [(_CDInteractionDataCollectionTask *)self cleanup];
}

- (void)_execute
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Selected for _CDInteraction data collection", v1, 2u);
}

- (void)cleanup
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error remove previous session file (_CDInteraction data collection): %@", v2, v3, v4, v5, v6);
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

- (_CDInteractionDataCollectionSession)session
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

- (void)initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error unarchiving _CDInteraction data collection session: %@", v2, v3, v4, v5, v6);
}

@end