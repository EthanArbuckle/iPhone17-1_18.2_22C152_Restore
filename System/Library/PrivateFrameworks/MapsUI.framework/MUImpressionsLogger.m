@interface MUImpressionsLogger
- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4;
- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5;
@end

@implementation MUImpressionsLogger

- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MUGetMUImpressionsLoggerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 debugString];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_DEBUG, "Logging element did enter %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = MUGetMUImpressionsLoggerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = [v5 debugString];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_DEBUG, "Logging element did exit %@", (uint8_t *)&v8, 0xCu);
  }
}

@end