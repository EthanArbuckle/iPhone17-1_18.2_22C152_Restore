@interface _ATXAppLaunchCategoricalHistogramWithPersistentBackup
- (BOOL)removeHistoryForBundleId:(id)a3;
- (BOOL)removeHistoryForCategory:(id)a3;
- (_ATXAppLaunchCategoricalHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4;
- (_ATXAppLaunchCategoricalHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 saveOnBackgroundQueue:(id)a5 maxCategoryCount:(unsigned __int16)a6 pruningMethod:(int64_t)a7;
- (_ATXDataStore)datastore;
- (int)removeHistoryForBundleIds:(id)a3;
- (int64_t)histogramType;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5;
- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5 weight:(float)a6;
- (void)flush;
- (void)resetData;
- (void)resetHistogram:(id)a3;
@end

@implementation _ATXAppLaunchCategoricalHistogramWithPersistentBackup

- (void)flush
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  v5 = (void *)MEMORY[0x1D25F6CC0]();
  [(_ATXAppLaunchCategoricalHistogram *)self encodeWithCoder:v4];
  datastore = self->_datastore;
  v7 = [v4 encodedData];
  [(_ATXDataStore *)datastore addCategoricalHistogramData:v7 forHistogramOfType:self->_histogramType];
}

- (_ATXAppLaunchCategoricalHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4
{
  return [(_ATXAppLaunchCategoricalHistogramWithPersistentBackup *)self initWithDataStore:a3 histogramType:a4 saveOnBackgroundQueue:0 maxCategoryCount:0 pruningMethod:0];
}

- (_ATXAppLaunchCategoricalHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 saveOnBackgroundQueue:(id)a5 maxCategoryCount:(unsigned __int16)a6 pruningMethod:(int64_t)a7
{
  uint64_t v8 = a6;
  id v13 = a3;
  id v14 = a5;
  v15 = (void *)MEMORY[0x1D25F6CC0]();
  v16 = [v13 categoricalHistogramDataForHistogramType:a4];
  if (v16)
  {
    id v26 = v13;
    v17 = (void *)MEMORY[0x1D25F6CC0]();
    id v34 = 0;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v16 error:&v34];
    id v27 = v34;
    if (v18)
    {
      v33.receiver = self;
      v33.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
      v19 = [(_ATXAppLaunchCategoricalHistogram *)&v33 initWithCoder:v18];
    }
    else
    {
      v25 = v17;
      v20 = __atxlog_handle_default();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchCategoricalHistogramWithPersistentBackup initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:]();
      }

      v32.receiver = self;
      v32.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
      v19 = [(_ATXAppLaunchCategoricalHistogram *)&v32 initWithType:a4 maxCategoryCount:v8 pruningMethod:a7];
      v17 = v25;
    }

    if (v19)
    {
      [(_ATXAppLaunchCategoricalHistogram *)v19 _setMaxCategoryCount:v8 pruningMethod:a7];
      [(_ATXAppLaunchCategoricalHistogram *)v19 _reduceCategoryCountTo:[(_ATXAppLaunchCategoricalHistogram *)v19 maxCategoryCount]];
    }

    id v13 = v26;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
    v19 = [(_ATXAppLaunchCategoricalHistogram *)&v31 initWithType:a4 maxCategoryCount:v8 pruningMethod:a7];
  }

  if (v19)
  {
    objc_storeStrong((id *)&v19->_datastore, a3);
    v19->_histogramType = a4;
    if (v14)
    {
      objc_initWeak(&location, v19);
      v21 = [ATXBackgroundSaver alloc];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __142___ATXAppLaunchCategoricalHistogramWithPersistentBackup_initWithDataStore_histogramType_saveOnBackgroundQueue_maxCategoryCount_pruningMethod___block_invoke;
      v28[3] = &unk_1E68AC2D0;
      objc_copyWeak(&v29, &location);
      uint64_t v22 = [(ATXBackgroundSaver *)v21 initWithQueue:v14 block:v28];
      saver = v19->_saver;
      v19->_saver = (ATXBackgroundSaver *)v22;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return v19;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  [(_ATXAppLaunchCategoricalHistogram *)&v6 addLaunchWithBundleId:a3 date:a4 category:a5];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5 weight:(float)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](&v7, sel_addLaunchWithBundleId_date_category_weight_, a3, a4, a5);
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  BOOL v4 = [(_ATXAppLaunchCategoricalHistogram *)&v6 removeHistoryForBundleId:a3];
  if (v4) {
    [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
  }
  return v4;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  int v4 = [(_ATXAppLaunchCategoricalHistogram *)&v6 removeHistoryForBundleIds:a3];
  if (v4) {
    [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
  }
  return v4;
}

- (BOOL)removeHistoryForCategory:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  BOOL v4 = [(_ATXAppLaunchCategoricalHistogram *)&v6 removeHistoryForCategory:a3];
  if (v4) {
    [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
  }
  return v4;
}

- (void)resetData
{
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  [(_ATXAppLaunchCategoricalHistogram *)&v3 resetData];
  [(ATXBackgroundSaver *)self->_saver scheduleSave];
}

- (void)resetHistogram:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  [(_ATXAppLaunchCategoricalHistogram *)&v4 resetHistogram:a3];
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

- (void)initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unable to decode data with error: %@", v2, v3, v4, v5, v6);
}

@end