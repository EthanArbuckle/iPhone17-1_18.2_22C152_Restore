@interface _DKEvent(ATXLocationVisitDuetEvent)
- (ATXLocationVisitDuetEvent)atx_convertToLocationVisitEvent;
- (void)atx_convertToLocationVisitEvent;
@end

@implementation _DKEvent(ATXLocationVisitDuetEvent)

- (ATXLocationVisitDuetEvent)atx_convertToLocationVisitEvent
{
  v2 = [a1 metadata];
  v3 = [MEMORY[0x1E4F5B578] identifier];
  v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
      if (v5)
      {
        v6 = [ATXLocationVisitDuetEvent alloc];
        v7 = [a1 startDate];
        v8 = [a1 endDate];
        v9 = [(ATXLocationVisitDuetEvent *)v6 initWithLocationOfInterestIdentifier:v5 startDate:v7 endDate:v8];

        goto LABEL_13;
      }
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(_DKEvent(ATXLocationVisitDuetEvent) *)(uint64_t)v4 atx_convertToLocationVisitEvent];
      }
    }
    else
    {
      v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(_DKEvent(ATXLocationVisitDuetEvent) *)(uint64_t)v4 atx_convertToLocationVisitEvent];
      }
    }
  }
  else
  {
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_DKEvent(ATXLocationVisitDuetEvent) atx_convertToLocationVisitEvent](v5);
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)atx_convertToLocationVisitEvent
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key for LocationVisit 'identifier' is not a number, %@", (uint8_t *)&v2, 0xCu);
}

@end