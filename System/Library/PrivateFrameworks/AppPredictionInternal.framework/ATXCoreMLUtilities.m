@interface ATXCoreMLUtilities
+ (double)scoreForModelOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4;
+ (id)loadCoreMLModelWithName:(id)a3;
@end

@implementation ATXCoreMLUtilities

+ (id)loadCoreMLModelWithName:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[ATXCoreMLUtilities loadCoreMLModelWithName:](v4);
    }
    goto LABEL_10;
  }
  v4 = [MEMORY[0x1E4F4AF08] pathForResource:v3 ofType:@"mlmodelc" isDirectory:1];
  if (!v4)
  {
LABEL_10:
    v8 = 0;
    id v9 = 0;
    goto LABEL_11;
  }
  v5 = objc_opt_new();
  [v5 setComputeUnits:0];
  v6 = (void *)MEMORY[0x1E4F1E968];
  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v12 = 0;
  v8 = [v6 modelWithContentsOfURL:v7 configuration:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ATXCoreMLUtilities loadCoreMLModelWithName:v10];
    }
  }
LABEL_11:

  return v8;
}

+ (double)scoreForModelOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 type];
  switch(v6)
  {
    case 1:
      double v7 = (double)[v5 int64Value];
      break;
    case 2:
      [v5 doubleValue];
      double v7 = v8;
      break;
    case 5:
      v10 = [v5 multiArrayValue];
      v11 = [v10 objectAtIndexedSubscript:a4];
      [v11 doubleValue];
      double v7 = v12;
      goto LABEL_9;
    case 6:
      v10 = [v5 dictionaryValue];
      v11 = [NSNumber numberWithInteger:a4];
      v13 = [v10 objectForKeyedSubscript:v11];
      [v13 doubleValue];
      double v7 = v14;

LABEL_9:
      break;
    default:
      id v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXCoreMLUtilities scoreForModelOutputValue:outputIndexedSubscript:](v6, v9);
      }

      double v7 = -31337.0;
      break;
  }

  return v7;
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXCoreMLUtilities: Missing model name", v1, 2u);
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXCoreMLUtilities: Error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)scoreForModelOutputValue:(uint64_t)a1 outputIndexedSubscript:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXCoreMLUtilities - CoreMLModel: No valid outputType found for %ld", (uint8_t *)&v2, 0xCu);
}

@end