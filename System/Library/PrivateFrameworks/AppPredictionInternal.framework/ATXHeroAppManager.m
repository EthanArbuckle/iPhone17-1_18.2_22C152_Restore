@interface ATXHeroAppManager
- (ATXHeroAppFeedback)heroFeedback;
- (ATXHeroAppManager)init;
- (ATXHeroAppManager)initWithFeedback:(id)a3;
- (void)donateHeroAppPredictions:(id)a3;
@end

@implementation ATXHeroAppManager

- (ATXHeroAppManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXHeroAppManager *)self initWithFeedback:v3];

  return v4;
}

- (ATXHeroAppManager)initWithFeedback:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAppManager;
  v6 = [(ATXHeroAppManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heroFeedback, a3);
  }

  return v7;
}

- (void)donateHeroAppPredictions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__ATXHeroAppManager_donateHeroAppPredictions___block_invoke;
  v16[3] = &unk_1E68AD7D0;
  v16[4] = self;
  v3 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v16);
  v4 = __atxlog_handle_hero();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 count];
    *(_DWORD *)buf = 134217984;
    double v18 = *(double *)&v5;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Left with %lu predictions after removing predictions based on feedback.", buf, 0xCu);
  }

  if ([v3 count])
  {
    v6 = [MEMORY[0x1E4F1C9C8] now];
    v7 = [MEMORY[0x1E4F935D0] sharedInstance];
    v8 = [v7 getCurrentPreciseLocation];

    objc_super v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v6 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      double v18 = -v10;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Took %f seconds to fetch precise location", buf, 0xCu);
    }

    if (v8)
    {
      v11 = +[ATXHeroDataServerHelper inRadiusPredictionsFrom:v3 currentLocation:v8];

      v3 = __atxlog_handle_hero();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v11 count];
        *(_DWORD *)buf = 134217984;
        double v18 = *(double *)&v12;
        _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Left with %lu predictions after removing predictions based on gps location.", buf, 0xCu);
      }
    }
    else
    {
      v13 = __atxlog_handle_hero();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXHeroAppManager donateHeroAppPredictions:](v13);
      }

      v11 = objc_opt_new();
    }

    v3 = v11;
  }
  else
  {
    v8 = 0;
  }
  v14 = __atxlog_handle_hero();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v3 description];
    *(_DWORD *)buf = 138412290;
    double v18 = *(double *)&v15;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Sending hero app predictions to blending layer. Predictions: %@", buf, 0xCu);
  }
  +[ATXHeroAppBlendingUpdater updateBlendingLayerWithHeroAppPredictions:v3 currentLocation:v8];
}

uint64_t __46__ATXHeroAppManager_donateHeroAppPredictions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) shouldShowHeroAppPrediction:a2];
}

- (ATXHeroAppFeedback)heroFeedback
{
  return self->_heroFeedback;
}

- (void).cxx_destruct
{
}

- (void)donateHeroAppPredictions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Could not get precise location. Clearing predictions.", v1, 2u);
}

@end