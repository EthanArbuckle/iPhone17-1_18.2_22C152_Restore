@interface ATXHomeScreenLogWidgetAddedFeatures
- (ATXHomeScreenLogWidgetAddedFeatures)initWithHSEvent:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5;
- (id)_key:(id)a3 byAppendingStringIndicatingIfWidgetWasAdded:(BOOL)a4;
- (id)_pickIndexForNegativeExampleFromGalleryItems;
- (void)_pickIndexForNegativeExampleFromGalleryItems;
- (void)_populateFeaturesForAddedWidget;
- (void)_populateFeaturesForNegativeExample;
- (void)_populateHomeScreenConfigFeaturesForWidgetBundleId:(id)a3 widgetKind:(id)a4 parentAppBundleId:(id)a5 widgetWasAdded:(BOOL)a6;
- (void)_populateParentAppFeaturesForParentAppBundleId:(id)a3 widgetWasAdded:(BOOL)a4;
- (void)_sendToCoreAnalytics;
- (void)logWidgetAddedFeaturesInCoreAnalytics;
@end

@implementation ATXHomeScreenLogWidgetAddedFeatures

- (ATXHomeScreenLogWidgetAddedFeatures)initWithHSEvent:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenLogWidgetAddedFeatures;
  v11 = [(ATXHomeScreenLogWidgetAddedFeatures *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    widgetAddedFeatures = v11->_widgetAddedFeatures;
    v11->_widgetAddedFeatures = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_hsEvent, a3);
    v11->_rankOfWidgetInGallery = a4;
    objc_storeStrong((id *)&v11->_galleryItems, a5);
  }

  return v11;
}

- (void)_sendToCoreAnalytics
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    widgetAddedFeatures = self->_widgetAddedFeatures;
    int v5 = 138412290;
    v6 = widgetAddedFeatures;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenLogWidgetAddedFeatures: Widget added features: %@", (uint8_t *)&v5, 0xCu);
  }

  AnalyticsSendEvent();
}

- (void)_populateFeaturesForAddedWidget
{
  v3 = (void *)MEMORY[0x1E4F4B440];
  v4 = [(ATXHomeScreenEvent *)self->_hsEvent widgetBundleId];
  int v5 = [(ATXHomeScreenEvent *)self->_hsEvent widgetKind];
  v6 = [v3 stringRepresentationForExtensionBundleId:v4 kind:v5];
  widgetAddedFeatures = self->_widgetAddedFeatures;
  int v8 = 1;
  id v9 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetBundleIdAndKindFor" byAppendingStringIndicatingIfWidgetWasAdded:1];
  [(NSMutableDictionary *)widgetAddedFeatures setObject:v6 forKeyedSubscript:v9];

  [(ATXHomeScreenEvent *)self->_hsEvent widgetSize];
  id v10 = ATXCAStringForStackLayoutSize();
  v11 = self->_widgetAddedFeatures;
  uint64_t v12 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetSizeFor" byAppendingStringIndicatingIfWidgetWasAdded:1];
  [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

  [(ATXHomeScreenEvent *)self->_hsEvent stackKind];
  v13 = ATXStringForStackKind();
  [(NSMutableDictionary *)self->_widgetAddedFeatures setObject:v13 forKeyedSubscript:@"stackKindForAddedWidget"];

  [(ATXHomeScreenEvent *)self->_hsEvent stackLocation];
  v14 = ATXCAStringForStackLocation();
  [(NSMutableDictionary *)self->_widgetAddedFeatures setObject:v14 forKeyedSubscript:@"stackLocationForAddedWidget"];

  objc_super v15 = [NSNumber numberWithUnsignedInteger:self->_rankOfWidgetInGallery];
  v16 = self->_widgetAddedFeatures;
  v17 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"rankInGalleryFor" byAppendingStringIndicatingIfWidgetWasAdded:1];
  [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

  unint64_t rankOfWidgetInGallery = self->_rankOfWidgetInGallery;
  if (rankOfWidgetInGallery)
  {
    id v27 = [(NSArray *)self->_galleryItems objectAtIndexedSubscript:rankOfWidgetInGallery - 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v27)
      {
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "rankType"));
        int v8 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v27 = 0;
  v19 = &unk_1F27F0E10;
LABEL_7:
  v20 = self->_widgetAddedFeatures;
  v21 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"galleryRankTypeFor" byAppendingStringIndicatingIfWidgetWasAdded:1];
  [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v21];

  if (v8)
  {
    [(NSMutableDictionary *)self->_widgetAddedFeatures setObject:&unk_1F27F0E10 forKeyedSubscript:@"suggestedSizeInGalleryIsSameForAddedWidget"];
  }
  else
  {

    v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v27, "suggestedSize") == -[ATXHomeScreenEvent widgetSize](self->_hsEvent, "widgetSize"));
    [(NSMutableDictionary *)self->_widgetAddedFeatures setObject:v22 forKeyedSubscript:@"suggestedSizeInGalleryIsSameForAddedWidget"];
  }
  v23 = [(ATXHomeScreenEvent *)self->_hsEvent appBundleId];
  [(ATXHomeScreenLogWidgetAddedFeatures *)self _populateParentAppFeaturesForParentAppBundleId:v23 widgetWasAdded:1];

  v24 = [(ATXHomeScreenEvent *)self->_hsEvent widgetBundleId];
  v25 = [(ATXHomeScreenEvent *)self->_hsEvent widgetKind];
  v26 = [(ATXHomeScreenEvent *)self->_hsEvent appBundleId];
  [(ATXHomeScreenLogWidgetAddedFeatures *)self _populateHomeScreenConfigFeaturesForWidgetBundleId:v24 widgetKind:v25 parentAppBundleId:v26 widgetWasAdded:1];
}

- (void)_populateFeaturesForNegativeExample
{
  v3 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _pickIndexForNegativeExampleFromGalleryItems];
  if (v3)
  {
    id v27 = v3;
    v4 = -[NSArray objectAtIndexedSubscript:](self->_galleryItems, "objectAtIndexedSubscript:", [v3 unsignedIntValue]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = (void *)MEMORY[0x1E4F4B440];
      uint64_t v7 = [v5 extensionBundleIdForMetrics];
      int v8 = [v5 widgetKind];
      id v9 = [v6 stringRepresentationForExtensionBundleId:v7 kind:v8];
      widgetAddedFeatures = self->_widgetAddedFeatures;
      v11 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetBundleIdAndKindFor" byAppendingStringIndicatingIfWidgetWasAdded:0];
      [(NSMutableDictionary *)widgetAddedFeatures setObject:v9 forKeyedSubscript:v11];

      [v5 suggestedSize];
      uint64_t v12 = ATXCAStringForStackLayoutSize();
      v13 = self->_widgetAddedFeatures;
      v14 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetSizeFor" byAppendingStringIndicatingIfWidgetWasAdded:0];
      [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

      objc_super v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v27, "unsignedIntValue") + 1);
      v16 = self->_widgetAddedFeatures;
      v17 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"rankInGalleryFor" byAppendingStringIndicatingIfWidgetWasAdded:0];
      [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

      v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "rankType"));
      v19 = self->_widgetAddedFeatures;
      v20 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"galleryRankTypeFor" byAppendingStringIndicatingIfWidgetWasAdded:0];
      [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

      v21 = [v5 appBundleId];
      [(ATXHomeScreenLogWidgetAddedFeatures *)self _populateParentAppFeaturesForParentAppBundleId:v21 widgetWasAdded:0];

      v22 = [v5 avocadoDescriptor];
      v23 = [v22 extensionBundleIdentifier];
      v24 = [v5 avocadoDescriptor];
      v25 = [v24 kind];
      v26 = [v5 appBundleId];
      [(ATXHomeScreenLogWidgetAddedFeatures *)self _populateHomeScreenConfigFeaturesForWidgetBundleId:v23 widgetKind:v25 parentAppBundleId:v26 widgetWasAdded:0];
    }
    else
    {
      id v5 = 0;
    }

    v3 = v27;
  }
}

- (void)_populateParentAppFeaturesForParentAppBundleId:(id)a3 widgetWasAdded:(BOOL)a4
{
  BOOL v4 = a4;
  v78[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    v75 = +[_ATXAppInfoManager sharedInstance];
    id v76 = +[_ATXAppLaunchHistogramManager sharedInstance];
    uint64_t v7 = [v76 histogramForLaunchType:0];
    v74 = [v76 categoricalHistogramForLaunchType:32];
    int v8 = [MEMORY[0x1E4F4AF00] genreForBundle:v6];
    widgetAddedFeatures = self->_widgetAddedFeatures;
    id v10 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppGenreIdFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)widgetAddedFeatures setObject:v8 forKeyedSubscript:v10];

    v11 = NSNumber;
    uint64_t v12 = [v75 lastLaunchDateForBundleId:v6];
    [v12 timeIntervalSinceNow];
    v13 = objc_msgSend(v11, "numberWithDouble:");
    v14 = self->_widgetAddedFeatures;
    objc_super v15 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"secondsSinceLastParentAppLaunchFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

    v16 = NSNumber;
    v78[0] = v6;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
    [v7 totalLaunchesForBundleIds:v17];
    v18 = objc_msgSend(v16, "numberWithDouble:");
    v19 = self->_widgetAddedFeatures;
    v20 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppTotalDecayedLaunchesFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

    v21 = NSNumber;
    v73 = v7;
    [v7 overallLaunchPopularityForBundleId:v6];
    v22 = objc_msgSend(v21, "numberWithDouble:");
    v23 = self->_widgetAddedFeatures;
    v24 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppRelativeLaunchPopularityFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];

    v25 = NSNumber;
    [v7 entropyForBundleId:v6];
    v26 = objc_msgSend(v25, "numberWithDouble:");
    id v27 = self->_widgetAddedFeatures;
    v28 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppEntropyFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v27 setObject:v26 forKeyedSubscript:v28];

    v72 = [MEMORY[0x1E4FB3840] currentNotificationSettingsCenter];
    v29 = [v72 notificationSourceWithIdentifier:v6];
    v30 = NSNumber;
    v31 = [v29 sourceSettings];
    v32 = [v31 notificationSettings];
    v33 = objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v32, "authorizationStatus"));
    v34 = self->_widgetAddedFeatures;
    v35 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsAreAuthorizedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v34 setObject:v33 forKeyedSubscript:v35];

    v36 = NSNumber;
    [v74 totalLaunchesForBundleId:v6 category:@"r"];
    v37 = objc_msgSend(v36, "numberWithDouble:");
    v38 = self->_widgetAddedFeatures;
    v39 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsReceivedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v38 setObject:v37 forKeyedSubscript:v39];

    v40 = NSNumber;
    [v74 totalLaunchesForBundleId:v6 category:@"e"];
    v41 = objc_msgSend(v40, "numberWithDouble:");
    v42 = self->_widgetAddedFeatures;
    v43 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsEngagedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v42 setObject:v41 forKeyedSubscript:v43];

    v44 = NSNumber;
    [v74 totalLaunchesForBundleId:v6 category:@"c"];
    v45 = objc_msgSend(v44, "numberWithDouble:");
    v46 = self->_widgetAddedFeatures;
    v47 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsClearedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v46 setObject:v45 forKeyedSubscript:v47];

    v48 = NSNumber;
    [v74 totalLaunchesForBundleId:v6 category:@"i"];
    v49 = objc_msgSend(v48, "numberWithDouble:");
    v50 = self->_widgetAddedFeatures;
    v51 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsClearedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v50 setObject:v49 forKeyedSubscript:v51];
  }
  else
  {
    v52 = self->_widgetAddedFeatures;
    id v53 = 0;
    v54 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppGenreIdFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v52 setObject:@"Not applicable" forKeyedSubscript:v54];

    v55 = self->_widgetAddedFeatures;
    v56 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"secondsSinceLastParentAppLaunchFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v55 setObject:&unk_1F27F0E10 forKeyedSubscript:v56];

    v57 = self->_widgetAddedFeatures;
    v58 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppTotalDecayedLaunchesFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v57 setObject:&unk_1F27F0E10 forKeyedSubscript:v58];

    v59 = self->_widgetAddedFeatures;
    v60 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppRelativeLaunchPopularityFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v59 setObject:&unk_1F27F0E10 forKeyedSubscript:v60];

    v61 = self->_widgetAddedFeatures;
    v62 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppEntropyFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v61 setObject:&unk_1F27F0E10 forKeyedSubscript:v62];

    v63 = self->_widgetAddedFeatures;
    v64 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsAreAuthorizedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v63 setObject:&unk_1F27F0E10 forKeyedSubscript:v64];

    v65 = self->_widgetAddedFeatures;
    v66 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsReceivedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v65 setObject:&unk_1F27F0E10 forKeyedSubscript:v66];

    v67 = self->_widgetAddedFeatures;
    v68 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsEngagedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v67 setObject:&unk_1F27F0E10 forKeyedSubscript:v68];

    v69 = self->_widgetAddedFeatures;
    v70 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsIgnoredFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    [(NSMutableDictionary *)v69 setObject:&unk_1F27F0E10 forKeyedSubscript:v70];

    v71 = self->_widgetAddedFeatures;
    id v77 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppNotificationsClearedFor" byAppendingStringIndicatingIfWidgetWasAdded:v4];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", &unk_1F27F0E10);
  }
}

- (void)_populateHomeScreenConfigFeaturesForWidgetBundleId:(id)a3 widgetKind:(id)a4 parentAppBundleId:(id)a5 widgetWasAdded:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  widgetAddedFeatures = self->_widgetAddedFeatures;
  uint64_t v12 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetIsAlreadyAddedOnTodayPageFor" byAppendingStringIndicatingIfWidgetWasAdded:v6];
  [(NSMutableDictionary *)widgetAddedFeatures setObject:&unk_1F27F0E10 forKeyedSubscript:v12];

  v13 = self->_widgetAddedFeatures;
  v14 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetIsAlreadyAddedOnHomeScreenFor" byAppendingStringIndicatingIfWidgetWasAdded:v6];
  [(NSMutableDictionary *)v13 setObject:&unk_1F27F0E10 forKeyedSubscript:v14];

  objc_super v15 = self->_widgetAddedFeatures;
  v16 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetFromParentAppBundleIdIsAlreadyAddedOnTodayPageFor" byAppendingStringIndicatingIfWidgetWasAdded:v6];
  [(NSMutableDictionary *)v15 setObject:&unk_1F27F0E10 forKeyedSubscript:v16];

  v17 = self->_widgetAddedFeatures;
  v18 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"widgetFromParentAppBundleIdIsAlreadyAddedOnHomeScreenFor" byAppendingStringIndicatingIfWidgetWasAdded:v6];
  [(NSMutableDictionary *)v17 setObject:&unk_1F27F0E10 forKeyedSubscript:v18];

  v19 = self->_widgetAddedFeatures;
  v20 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppIsOnDockFor" byAppendingStringIndicatingIfWidgetWasAdded:v6];
  [(NSMutableDictionary *)v19 setObject:&unk_1F27F0E10 forKeyedSubscript:v20];

  v21 = objc_opt_new();
  id v51 = 0;
  v22 = [v21 loadHomeScreenAndTodayPageConfigurationsWithError:&v51];
  id v23 = v51;
  if (v22)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __134__ATXHomeScreenLogWidgetAddedFeatures__populateHomeScreenConfigFeaturesForWidgetBundleId_widgetKind_parentAppBundleId_widgetWasAdded___block_invoke;
    v47[3] = &unk_1E68B0970;
    v47[4] = self;
    id v48 = v9;
    id v49 = v10;
    BOOL v50 = v6;
    [v22 enumerateObjectsUsingBlock:v47];
    id v46 = v23;
    v24 = [v21 loadDockAppListWithError:&v46];
    id v25 = v46;

    if (v24)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v41 = v24;
      v26 = v24;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        id v36 = v25;
        v37 = v22;
        v38 = v21;
        id v39 = v10;
        id v40 = v9;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            v32 = [(ATXHomeScreenEvent *)self->_hsEvent appBundleId];
            LODWORD(v31) = [v31 isEqualToString:v32];

            if (v31)
            {
              v33 = self->_widgetAddedFeatures;
              v34 = [(ATXHomeScreenLogWidgetAddedFeatures *)self _key:@"parentAppIsOnDockFor" byAppendingStringIndicatingIfWidgetWasAdded:v6];
              [(NSMutableDictionary *)v33 setObject:&unk_1F27F0E28 forKeyedSubscript:v34];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v28);
        id v10 = v39;
        id v9 = v40;
        v22 = v37;
        v21 = v38;
        id v25 = v36;
      }
      v24 = v41;
    }
    else
    {
      v26 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v25;
        _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogWidgetAddedFeatures: failed to fetch apps on dock with error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v35 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v23;
      _os_log_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogWidgetAddedFeatures: failed to fetch home screen config with error: %@", buf, 0xCu);
    }

    id v25 = v23;
  }
}

void __134__ATXHomeScreenLogWidgetAddedFeatures__populateHomeScreenConfigFeaturesForWidgetBundleId_widgetKind_parentAppBundleId_widgetWasAdded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ATXStackLocationForPageAndIndex();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  BOOL v4 = [v3 stacks];
  v34 = v3;
  id v5 = [v3 panels];
  BOOL v6 = [v4 arrayByAddingObjectsFromArray:v5];

  id obj = v6;
  uint64_t v37 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v7;
        int v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v9 = [v8 widgets];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v40 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              objc_super v15 = [v14 widgetUniqueId];
              v16 = [*(id *)(*(void *)(a1 + 32) + 16) widgetUniqueId];
              char v17 = [v15 isEqualToString:v16];

              if (v17) {
                continue;
              }
              if ([v14 isSameWidgetAsWidgetBundleId:*(void *)(a1 + 40) widgetKind:*(void *)(a1 + 48)])
              {
                if (ATXStackLocationIsTodayPage())
                {
                  v18 = *(void **)(a1 + 32);
                  v19 = (void *)v18[1];
                  uint64_t v20 = *(unsigned __int8 *)(a1 + 56);
                  v21 = @"widgetIsAlreadyAddedOnTodayPageFor";
LABEL_17:
                  v22 = [v18 _key:v21 byAppendingStringIndicatingIfWidgetWasAdded:v20];
                  [v19 setObject:&unk_1F27F0E28 forKeyedSubscript:v22];

                  goto LABEL_18;
                }
                if (ATXStackLocationIsHomeScreen())
                {
                  v18 = *(void **)(a1 + 32);
                  v19 = (void *)v18[1];
                  uint64_t v20 = *(unsigned __int8 *)(a1 + 56);
                  v21 = @"widgetIsAlreadyAddedOnHomeScreenFor";
                  goto LABEL_17;
                }
              }
LABEL_18:
              uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 16) appBundleId];
              if (!v23) {
                continue;
              }
              v24 = (void *)v23;
              uint64_t v25 = [v14 appBundleId];
              if (v25)
              {
                v26 = (void *)v25;
                uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 16) appBundleId];
                uint64_t v28 = [v14 appBundleId];
                int v29 = [v27 isEqualToString:v28];

                if (!v29) {
                  continue;
                }
                if (ATXStackLocationIsTodayPage())
                {
                  v30 = *(void **)(a1 + 32);
                  v31 = (void *)v30[1];
                  uint64_t v32 = *(unsigned __int8 *)(a1 + 56);
                  v33 = @"widgetFromParentAppBundleIdIsAlreadyAddedOnTodayPageFor";
                }
                else
                {
                  if (!ATXStackLocationIsHomeScreen()) {
                    continue;
                  }
                  v30 = *(void **)(a1 + 32);
                  v31 = (void *)v30[1];
                  uint64_t v32 = *(unsigned __int8 *)(a1 + 56);
                  v33 = @"widgetFromParentAppBundleIdIsAlreadyAddedOnHomeScreenFor";
                }
                v24 = [v30 _key:v33 byAppendingStringIndicatingIfWidgetWasAdded:v32];
                [v31 setObject:&unk_1F27F0E28 forKeyedSubscript:v24];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v37);
  }
}

- (id)_pickIndexForNegativeExampleFromGalleryItems
{
  NSUInteger v3 = [(NSArray *)self->_galleryItems count];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 20;
    do
    {
      uint64_t v6 = arc4random_uniform(v4);
      uint64_t v7 = [(NSArray *)self->_galleryItems objectAtIndexedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t rankOfWidgetInGallery = self->_rankOfWidgetInGallery;
        BOOL v9 = rankOfWidgetInGallery != 0;
        unint64_t v10 = rankOfWidgetInGallery - 1;
        if (!v9 || v10 != v6)
        {
          v14 = [NSNumber numberWithUnsignedInteger:v6];

          goto LABEL_17;
        }
      }

      --v5;
    }
    while (v5);
    uint64_t v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      [(ATXHomeScreenLogWidgetAddedFeatures *)v4 _pickIndexForNegativeExampleFromGalleryItems];
    }
  }
  else
  {
    v13 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenLogWidgetAddedFeatures _pickIndexForNegativeExampleFromGalleryItems](v13);
    }
  }
  v14 = 0;
LABEL_17:
  return v14;
}

- (id)_key:(id)a3 byAppendingStringIndicatingIfWidgetWasAdded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = [v5 alloc];
  int v8 = @"NegativeExample";
  if (v4) {
    int v8 = @"WidgetAdded";
  }
  BOOL v9 = (void *)[v7 initWithFormat:@"%@%@", v6, v8];

  return v9;
}

- (void)logWidgetAddedFeaturesInCoreAnalytics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(ATXHomeScreenEvent *)self->_hsEvent widgetBundleId];
    unint64_t rankOfWidgetInGallery = self->_rankOfWidgetInGallery;
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2048;
    unint64_t v9 = rankOfWidgetInGallery;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogWidgetAddedFeatures: logging new widget added: %@, rank in gallery: %lu", (uint8_t *)&v6, 0x16u);
  }
  [(ATXHomeScreenLogWidgetAddedFeatures *)self _populateFeaturesForAddedWidget];
  [(ATXHomeScreenLogWidgetAddedFeatures *)self _populateFeaturesForNegativeExample];
  [(ATXHomeScreenLogWidgetAddedFeatures *)self _sendToCoreAnalytics];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryItems, 0);
  objc_storeStrong((id *)&self->_hsEvent, 0);
  objc_storeStrong((id *)&self->_widgetAddedFeatures, 0);
}

- (void)_pickIndexForNegativeExampleFromGalleryItems
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogWidgetAddedFeatures: Unable to find a negative example with negExampleIndexUpperBound: %lu", (uint8_t *)&v2, 0xCu);
}

@end