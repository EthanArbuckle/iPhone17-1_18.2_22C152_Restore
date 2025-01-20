@interface _ATXAppLaunchHistogramManager
+ (BOOL)isHistogramDeprecated:(int64_t)a3;
+ (_ATXAppLaunchHistogramManager)sharedInstance;
+ (void)releaseTemporarySharedInstance;
+ (void)resetDataForCategoricalHistograms;
+ (void)resetSharedInstance;
+ (void)useTemporarySharedInstance:(id)a3;
- (BOOL)persistentStore;
- (_ATXAppLaunchHistogramManager)initWithInMemoryStore;
- (_ATXAppLaunchHistogramManager)initWithPersistentStore;
- (id)_categoricalHistogramForLaunchType:(int64_t)a3 maxCategoryCount:(unsigned __int16)a4 pruningMethod:(int64_t)a5;
- (id)categoricalHistogramForLaunchType:(int64_t)a3;
- (id)histogramForLaunchType:(int64_t)a3;
- (id)initAndPersist:(BOOL)a3;
- (int)getHistogramMaxCategoryCountFromAsset:(id)a3;
- (unint64_t)getHistogramPruningMethodFromAsset:(id)a3;
- (void)enumerateInMemoryCategoricalHistogramsWithBlock:(id)a3;
- (void)enumerateInMemoryHistogramsWithBlock:(id)a3;
- (void)exchangeDatastore:(id)a3;
- (void)purgeHistogramForLaunchType:(int64_t)a3;
@end

@implementation _ATXAppLaunchHistogramManager

- (_ATXAppLaunchHistogramManager)initWithPersistentStore
{
  return (_ATXAppLaunchHistogramManager *)[(_ATXAppLaunchHistogramManager *)self initAndPersist:1];
}

- (_ATXAppLaunchHistogramManager)initWithInMemoryStore
{
  return (_ATXAppLaunchHistogramManager *)[(_ATXAppLaunchHistogramManager *)self initAndPersist:0];
}

- (unint64_t)getHistogramPruningMethodFromAsset:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:]((uint64_t)v4, v8);
    }

    unint64_t v7 = 1;
  }

  return v7;
}

- (int)getHistogramMaxCategoryCountFromAsset:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 intValue];
  }
  else
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:]((uint64_t)v4, v8);
    }

    int v7 = 50;
  }

  return v7;
}

- (id)initAndPersist:(BOOL)a3
{
  BOOL v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_ATXAppLaunchHistogramManager;
  id v4 = [(_ATXAppLaunchHistogramManager *)&v19 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create("ATXBackgroundSaver", v6);
    backgroundSaverQueue = v4->_backgroundSaverQueue;
    v4->_backgroundSaverQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    histograms = v4->_histograms;
    v4->_histograms = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    categoricalHistograms = v4->_categoricalHistograms;
    v4->_categoricalHistograms = (NSMutableDictionary *)v11;

    v4->_persistentStore = v3;
    if (v3)
    {
      uint64_t v13 = +[_ATXDataStore sharedInstance];
      datastore = v4->_datastore;
      v4->_datastore = (_ATXDataStore *)v13;
    }
    uint64_t v15 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
    parameters = v4->_parameters;
    v4->_parameters = (NSDictionary *)v15;

    v4->_SSIDPruningMethod = [(_ATXAppLaunchHistogramManager *)v4 getHistogramPruningMethodFromAsset:@"SSIDPruningMethod"];
    v4->_maxSSIDCount = [(_ATXAppLaunchHistogramManager *)v4 getHistogramMaxCategoryCountFromAsset:@"MaxSSIDCount"];
    v4->_actionConfirmsRejectsPruningMethod = [(_ATXAppLaunchHistogramManager *)v4 getHistogramPruningMethodFromAsset:@"ActionsConfirmsRejectsPruningMethod"];
    v4->_maxActionConfirmsRejectsActionCount = [(_ATXAppLaunchHistogramManager *)v4 getHistogramMaxCategoryCountFromAsset:@"ActionsConfirmsRejectsMaxActionCount"];
    v4->_appJointContextPruningMethod = [(_ATXAppLaunchHistogramManager *)v4 getHistogramPruningMethodFromAsset:@"AppJointContextPruningMethod"];
    v4->_maxAppJointContextKeyCount = [(_ATXAppLaunchHistogramManager *)v4 getHistogramMaxCategoryCountFromAsset:@"AppJointContextMaxKeyCount"];
    v4->_maxAppSpecificLocationMaxKeyCount = [(_ATXAppLaunchHistogramManager *)v4 getHistogramMaxCategoryCountFromAsset:@"AppCoarseLocationMaxKeyCount"];
    v4->_maxAppCoarseLocationMaxKeyCount = [(_ATXAppLaunchHistogramManager *)v4 getHistogramMaxCategoryCountFromAsset:@"AppSpecificLocationMaxKeyCount"];
    v4->_maxAppZoom7GeoHashMaxKeyCount = [(_ATXAppLaunchHistogramManager *)v4 getHistogramMaxCategoryCountFromAsset:@"AppZoom7GeoHashMaxKeyCount"];
    v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchHistogramManager initAndPersist:]();
    }
  }
  return v4;
}

+ (_ATXAppLaunchHistogramManager)sharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    BOOL v3 = [[_ATXAppLaunchHistogramManager alloc] initWithPersistentStore];
    id v4 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedInstance;
  }
  id v5 = v2;
  pthread_mutex_unlock(&sharedInstanceLock);
  return (_ATXAppLaunchHistogramManager *)v5;
}

+ (void)resetSharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (void *)sharedInstance;
  sharedInstance = 0;

  pthread_mutex_unlock(&sharedInstanceLock);
}

+ (void)useTemporarySharedInstance:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&swappedInstance, (id)sharedInstance);
  id v4 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v3;

  pthread_mutex_unlock(&sharedInstanceLock);
}

+ (void)releaseTemporarySharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&sharedInstance, (id)swappedInstance);
  v2 = (void *)swappedInstance;
  swappedInstance = 0;

  pthread_mutex_unlock(&sharedInstanceLock);
}

- (void)exchangeDatastore:(id)a3
{
  id v4 = (_ATXDataStore *)a3;
  id v5 = self->_histograms;
  objc_sync_enter(v5);
  datastore = self->_datastore;
  self->_datastore = v4;
  dispatch_queue_t v7 = v4;

  objc_sync_exit(v5);
}

- (void)enumerateInMemoryHistogramsWithBlock:(id)a3
{
  id v4 = a3;
  histograms = self->_histograms;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70___ATXAppLaunchHistogramManager_enumerateInMemoryHistogramsWithBlock___block_invoke;
  v7[3] = &unk_1E68AFB68;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)histograms enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)enumerateInMemoryCategoricalHistogramsWithBlock:(id)a3
{
  id v4 = a3;
  categoricalHistograms = self->_categoricalHistograms;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81___ATXAppLaunchHistogramManager_enumerateInMemoryCategoricalHistogramsWithBlock___block_invoke;
  v7[3] = &unk_1E68AFB90;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)categoricalHistograms enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)histogramForLaunchType:(int64_t)a3
{
  id v5 = self->_histograms;
  objc_sync_enter(v5);
  histograms = self->_histograms;
  dispatch_queue_t v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(NSMutableDictionary *)histograms objectForKeyedSubscript:v7];

  if (!v8)
  {
    if (self->_persistentStore)
    {
      id v8 = [[_ATXAppLaunchHistogramWithPersistentBackup alloc] initWithDataStore:self->_datastore histogramType:a3 saveOnBackgroundQueue:self->_backgroundSaverQueue];
      if (v8)
      {
LABEL_7:
        v10 = self->_histograms;
        uint64_t v11 = [NSNumber numberWithInteger:a3];
        [(NSMutableDictionary *)v10 setObject:v8 forKeyedSubscript:v11];

        goto LABEL_8;
      }
      uint64_t v9 = [[_ATXAppLaunchHistogramWithPersistentBackup alloc] initWithDataStore:self->_datastore histogramType:a3 loadFromDataStore:0 saveOnBackgroundQueue:self->_backgroundSaverQueue];
    }
    else
    {
      uint64_t v9 = [[_ATXAppLaunchHistogram alloc] initWithType:a3];
    }
    id v8 = v9;
    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v5);

  return v8;
}

- (id)categoricalHistogramForLaunchType:(int64_t)a3
{
  id v5 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 11:
    case 14:
    case 16:
    case 17:
    case 19:
    case 20:
    case 22:
    case 23:
    case 25:
    case 26:
    case 28:
    case 35:
    case 36:
    case 90:
    case 91:
    case 92:
    case 93:
      goto LABEL_13;
    case 4:
    case 29:
    case 31:
      int maxSSIDCount = self->_maxSSIDCount;
      int64_t SSIDPruningMethod = self->_SSIDPruningMethod;
      goto LABEL_12;
    case 6:
    case 7:
    case 9:
    case 10:
    case 12:
    case 13:
      id v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:]();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"Deprecated histogram type.";
      goto LABEL_7;
    case 8:
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:]();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_APRHistogramTypeAppIntentDonation is deprecated.";
      goto LABEL_7;
    case 15:
      uint64_t v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:]();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeIntentForAllAppsLaunch is deprecated.";
      goto LABEL_7;
    case 18:
      v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.4();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeIntentForAllAppsDayOfWeek is deprecated.";
      goto LABEL_7;
    case 21:
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.5();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeIntentForAllAppsTrendingLaunch is deprecated.";
      goto LABEL_7;
    case 24:
      v18 = __atxlog_handle_default();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.6();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeIntentForAllAppsUnlockTime is deprecated.";
      goto LABEL_7;
    case 27:
      objc_super v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.7();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch is deprecated.";
      goto LABEL_7;
    case 30:
      v20 = __atxlog_handle_default();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.8();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeIntentForAllAppsWifiLaunch is deprecated.";
      goto LABEL_7;
    case 32:
      LOWORD(maxSSIDCount) = 8;
      goto LABEL_53;
    case 33:
    case 34:
      int maxSSIDCount = self->_maxActionConfirmsRejectsActionCount;
      int64_t SSIDPruningMethod = self->_actionConfirmsRejectsPruningMethod;
      goto LABEL_12;
    case 37:
    case 38:
    case 39:
      LOWORD(maxSSIDCount) = 5;
      goto LABEL_53;
    case 40:
      LOWORD(maxSSIDCount) = 2;
      goto LABEL_53;
    case 41:
      LOWORD(maxSSIDCount) = 7;
      goto LABEL_53;
    case 42:
      LOWORD(maxSSIDCount) = 42;
      goto LABEL_53;
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 63:
    case 64:
    case 69:
    case 70:
    case 75:
    case 76:
    case 81:
    case 82:
    case 87:
    case 88:
    case 89:
      int maxSSIDCount = self->_maxAppJointContextKeyCount;
      int64_t SSIDPruningMethod = self->_appJointContextPruningMethod;
      goto LABEL_12;
    case 49:
      LOWORD(maxSSIDCount) = 4;
      goto LABEL_11;
    case 50:
      int maxSSIDCount = self->_maxAppSpecificLocationMaxKeyCount;
      goto LABEL_11;
    case 51:
      int maxSSIDCount = self->_maxAppCoarseLocationMaxKeyCount;
      goto LABEL_11;
    case 52:
    case 53:
    case 54:
    case 65:
    case 71:
    case 77:
    case 83:
      LOWORD(maxSSIDCount) = 12;
      goto LABEL_11;
    case 55:
    case 56:
    case 66:
    case 72:
    case 78:
    case 84:
      LOWORD(maxSSIDCount) = 7;
      goto LABEL_11;
    case 57:
    case 58:
    case 67:
    case 73:
    case 79:
    case 85:
      LOWORD(maxSSIDCount) = 250;
      goto LABEL_11;
    case 59:
    case 60:
    case 68:
    case 74:
    case 80:
    case 86:
      LOWORD(maxSSIDCount) = 500;
      goto LABEL_11;
    case 61:
      int maxSSIDCount = self->_maxAppZoom7GeoHashMaxKeyCount;
      goto LABEL_11;
    case 62:
      LOWORD(maxSSIDCount) = 8;
      goto LABEL_11;
    case 94:
      int64_t SSIDPruningMethod = 2;
      LOWORD(maxSSIDCount) = 2;
      goto LABEL_12;
    case 95:
      LOWORD(maxSSIDCount) = [(_ATXAppLaunchHistogramManager *)self getHistogramMaxCategoryCountFromAsset:@"PoiCategoryMaxCount"];
      goto LABEL_11;
    case 96:
      LOWORD(maxSSIDCount) = 3;
LABEL_53:
      int64_t SSIDPruningMethod = 1;
      goto LABEL_12;
    case 97:
      LOWORD(maxSSIDCount) = 6;
      goto LABEL_11;
    case 98:
      LOWORD(maxSSIDCount) = 1;
LABEL_11:
      int64_t SSIDPruningMethod = 2;
      goto LABEL_12;
    case 99:
      v21 = __atxlog_handle_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.9();
      }

      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"_ATXHistogramTypeMax is not meant to be instantiated.";
LABEL_7:
      [v9 raise:v10 format:v11];
      id v5 = 0;
      goto LABEL_13;
    default:
      int64_t SSIDPruningMethod = 0;
      LOWORD(maxSSIDCount) = 0;
LABEL_12:
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __67___ATXAppLaunchHistogramManager_categoricalHistogramForLaunchType___block_invoke;
      v22[3] = &unk_1E68AFBB8;
      v22[4] = self;
      v22[5] = a3;
      __int16 v23 = maxSSIDCount;
      v22[6] = SSIDPruningMethod;
      v12 = _Block_copy(v22);
      id v5 = ATXHistogramTypeFunctionLookup[a3]();

LABEL_13:
      return v5;
  }
}

- (id)_categoricalHistogramForLaunchType:(int64_t)a3 maxCategoryCount:(unsigned __int16)a4 pruningMethod:(int64_t)a5
{
  uint64_t v6 = a4;
  uint64_t v9 = self->_categoricalHistograms;
  objc_sync_enter(v9);
  categoricalHistograms = self->_categoricalHistograms;
  uint64_t v11 = [NSNumber numberWithInteger:a3];
  v12 = [(NSMutableDictionary *)categoricalHistograms objectForKeyedSubscript:v11];

  if (!v12)
  {
    if (self->_persistentStore) {
      uint64_t v13 = [[_ATXAppLaunchCategoricalHistogramWithPersistentBackup alloc] initWithDataStore:self->_datastore histogramType:a3 saveOnBackgroundQueue:self->_backgroundSaverQueue maxCategoryCount:v6 pruningMethod:a5];
    }
    else {
      uint64_t v13 = [[_ATXAppLaunchCategoricalHistogram alloc] initWithType:a3 maxCategoryCount:v6 pruningMethod:a5];
    }
    v12 = v13;
    v14 = self->_categoricalHistograms;
    uint64_t v15 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v14 setObject:v12 forKeyedSubscript:v15];
  }
  objc_sync_exit(v9);

  return v12;
}

- (void)purgeHistogramForLaunchType:(int64_t)a3
{
  obj = self->_histograms;
  objc_sync_enter(obj);
  histograms = self->_histograms;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  dispatch_queue_t v7 = [(NSMutableDictionary *)histograms objectForKeyedSubscript:v6];

  if (v7)
  {
    if ([v7 isMemberOfClass:objc_opt_class()]) {
      [v7 flush];
    }
    id v8 = self->_histograms;
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];
  }
  objc_sync_exit(obj);

  obja = self->_categoricalHistograms;
  objc_sync_enter(obja);
  categoricalHistograms = self->_categoricalHistograms;
  uint64_t v11 = [NSNumber numberWithInteger:a3];
  v12 = [(NSMutableDictionary *)categoricalHistograms objectForKeyedSubscript:v11];

  if (v12)
  {
    if ([v12 isMemberOfClass:objc_opt_class()]) {
      [v12 flush];
    }
    uint64_t v13 = self->_categoricalHistograms;
    v14 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v13 removeObjectForKey:v14];
  }
  objc_sync_exit(obja);
}

+ (BOOL)isHistogramDeprecated:(int64_t)a3
{
  id v3 = +[_ATXDataStore stringForHistogramType:a3];
  char v4 = [v3 hasSuffix:@"_Deprecated"];

  return v4;
}

+ (void)resetDataForCategoricalHistograms
{
  for (uint64_t i = 0; i != 99; ++i)
  {
    if (([(id)objc_opt_class() isHistogramDeprecated:i] & 1) == 0)
    {
      id v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
      char v4 = [v3 categoricalHistogramForLaunchType:i];

      if (v4) {
        [v4 resetData];
      }
    }
  }
}

- (BOOL)persistentStore
{
  return self->_persistentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoricalHistograms, 0);
  objc_storeStrong((id *)&self->_histograms, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_backgroundSaverQueue, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

- (void)getHistogramPruningMethodFromAsset:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "No value found in asset for %@", (uint8_t *)&v2, 0xCu);
}

- (void)initAndPersist:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "_ATXLaunchHistogramManager initialized", v1, 2u);
}

- (void)categoricalHistogramForLaunchType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Deprecated histogram type.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_APRHistogramTypeAppIntentDonation is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeIntentForAllAppsLaunch is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeIntentForAllAppsDayOfWeek is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeIntentForAllAppsTrendingLaunch is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeIntentForAllAppsUnlockTime is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeIntentForAllAppsWifiLaunch is deprecated.", v2, v3, v4, v5, v6);
}

- (void)categoricalHistogramForLaunchType:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXHistogramTypeMax is not meant to be instantiated.", v2, v3, v4, v5, v6);
}

@end