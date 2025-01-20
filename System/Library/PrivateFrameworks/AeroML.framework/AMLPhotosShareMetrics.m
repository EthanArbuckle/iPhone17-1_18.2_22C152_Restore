@interface AMLPhotosShareMetrics
+ (double)shareInformationForPhotoId:(id)a3 startTime:(id)a4 endTime:(id)a5 interactionStorePath:(id)a6;
+ (id)logger;
@end

@implementation AMLPhotosShareMetrics

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger_logger;

  return v2;
}

void __31__AMLPhotosShareMetrics_logger__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.aeroml.AMLFramework", "AMLPhotosShareMetricsLogging");
  v1 = (void *)logger_logger;
  logger_logger = (uint64_t)v0;

  if (!logger_logger && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __31__AMLPhotosShareMetrics_logger__block_invoke_cold_1();
  }
}

+ (double)shareInformationForPhotoId:(id)a3 startTime:(id)a4 endTime:(id)a5 interactionStorePath:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F08798];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[[v9 alloc] initWithStartDate:v12 endDate:v11];

  v15 = objc_opt_new();
  v16 = [v15 shareInformationForPhotoId:v13 dateInterval:v14 interactionStoreDB:v10];

  v17 = +[AMLPhotosShareMetrics logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[AMLPhotosShareMetrics shareInformationForPhotoId:startTime:endTime:interactionStorePath:](v16, v17);
  }

  double v18 = (double)(unint64_t)[v16 interactionCount];
  double v19 = v18 / (double)(unint64_t)[v16 totalInteractionCount];

  return v19;
}

void __31__AMLPhotosShareMetrics_logger__block_invoke_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_24775E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create os_log_t logger", v0, 2u);
}

+ (void)shareInformationForPhotoId:(void *)a1 startTime:(NSObject *)a2 endTime:interactionStorePath:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218240;
  uint64_t v5 = [a1 interactionCount];
  __int16 v6 = 2048;
  uint64_t v7 = [a1 totalInteractionCount];
  _os_log_debug_impl(&dword_24775E000, a2, OS_LOG_TYPE_DEBUG, "shareInformationForPhotoId is (%lu/%lu)", (uint8_t *)&v4, 0x16u);
}

@end