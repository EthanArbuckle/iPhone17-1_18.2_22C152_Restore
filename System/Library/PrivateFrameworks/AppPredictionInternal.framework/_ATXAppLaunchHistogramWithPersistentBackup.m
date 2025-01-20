@interface _ATXAppLaunchHistogramWithPersistentBackup
- (BOOL)removeHistoryForBundleId:(id)a3;
- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4;
- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 loadFromDataStore:(BOOL)a5 saveOnBackgroundQueue:(id)a6;
- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 saveOnBackgroundQueue:(id)a5;
- (_ATXDataStore)datastore;
- (int)removeHistoryForBundleIds:(id)a3;
- (int64_t)histogramType;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6;
- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4;
- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4 weight:(float)a5;
- (void)decayByFactor:(double)a3;
- (void)decayWithHalfLifeInDays:(double)a3;
- (void)flush;
- (void)removeLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6;
- (void)resetData;
@end

@implementation _ATXAppLaunchHistogramWithPersistentBackup

- (void)flush
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(_ATXAppLaunchHistogram *)self encodeWithCoder:v5];
  v6 = [v5 encodedData];

  [(_ATXDataStore *)self->_datastore addHistogramData:v6 forHistogramOfType:self->_histogramType];
}

- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4
{
  return [(_ATXAppLaunchHistogramWithPersistentBackup *)self initWithDataStore:a3 histogramType:a4 saveOnBackgroundQueue:0];
}

- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 saveOnBackgroundQueue:(id)a5
{
  return [(_ATXAppLaunchHistogramWithPersistentBackup *)self initWithDataStore:a3 histogramType:a4 loadFromDataStore:1 saveOnBackgroundQueue:a5];
}

- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 loadFromDataStore:(BOOL)a5 saveOnBackgroundQueue:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a6;
  if (v7 && ([v11 histogramDataForHistogramType:a4], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1D25F6CC0]();
    id v32 = 0;
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v14 error:&v32];
    id v17 = v32;
    if (v16)
    {
      v31.receiver = self;
      v31.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
      v18 = [(_ATXAppLaunchHistogram *)&v31 initWithCoder:v16];
    }
    else
    {
      v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:]();
      }

      v30.receiver = self;
      v30.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
      v18 = [(_ATXAppLaunchHistogram *)&v30 initWithType:a4];
    }
    v19 = v18;

    if (!v19) {
      goto LABEL_12;
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
    v19 = [(_ATXAppLaunchHistogram *)&v29 initWithType:a4];
    v14 = 0;
    if (!v19)
    {
LABEL_12:
      v24 = __atxlog_handle_default();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:]();
      }

      goto LABEL_15;
    }
  }
  objc_storeStrong((id *)&v19->_datastore, a3);
  v19->_histogramType = a4;
  if (v12)
  {
    objc_initWeak(&location, v19);
    v20 = [ATXBackgroundSaver alloc];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __118___ATXAppLaunchHistogramWithPersistentBackup_initWithDataStore_histogramType_loadFromDataStore_saveOnBackgroundQueue___block_invoke;
    v26[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v27, &location);
    uint64_t v21 = [(ATXBackgroundSaver *)v20 initWithQueue:v12 block:v26];
    saver = v19->_saver;
    v19->_saver = (ATXBackgroundSaver *)v21;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
LABEL_15:

  return v19;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  [(_ATXAppLaunchHistogram *)&v6 addLaunchWithBundleId:a3 date:a4 timeZone:a5];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:](&v7, sel_addLaunchWithBundleId_date_timeZone_weight_, a3, a4, a5);
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  [(_ATXAppLaunchHistogram *)&v5 addLaunchWithBundleId:a3 elapsedTime:a4];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4 weight:(float)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:elapsedTime:weight:](&v6, sel_addLaunchWithBundleId_elapsedTime_weight_, a3, a4);
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)removeLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram removeLaunchWithBundleId:date:timeZone:weight:](&v7, sel_removeLaunchWithBundleId_date_timeZone_weight_, a3, a4, a5);
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  BOOL v4 = [(_ATXAppLaunchHistogram *)&v6 removeHistoryForBundleId:a3];
  if (v4) {
    [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
  }
  return v4;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  int v4 = [(_ATXAppLaunchHistogram *)&v6 removeHistoryForBundleIds:a3];
  if (v4 >= 1) {
    [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
  }
  return v4;
}

- (void)decayByFactor:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  [(_ATXAppLaunchHistogram *)&v4 decayByFactor:a3];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  [(_ATXAppLaunchHistogram *)&v4 decayWithHalfLifeInDays:a3];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)resetData
{
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  [(_ATXAppLaunchHistogram *)&v3 resetData];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (_ATXDataStore)datastore
{
  return self->_datastore;
}

- (int64_t)histogramType
{
  return self->_histogramType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastore, 0);
  objc_storeStrong((id *)&self->_saver, 0);
}

- (void)initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Failed to create App Launch Histogram with type: %ld", v1, 0xCu);
}

- (void)initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error unarchiving AppLaunchHistogram. Error: %@", v2, v3, v4, v5, v6);
}

@end