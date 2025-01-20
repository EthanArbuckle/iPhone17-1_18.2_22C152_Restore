@interface ATXFaceSuggestionFeaturedConfidenceSignal
- (double)valueForDescriptor:(id)a3;
- (double)weight;
@end

@implementation ATXFaceSuggestionFeaturedConfidenceSignal

- (double)valueForDescriptor:(id)a3
{
  v3 = [a3 galleryOptions];
  uint64_t v4 = [v3 featuredConfidenceLevel];

  if (v4 == 2) {
    return 2.0;
  }
  double result = 1.0;
  if (!v4)
  {
    v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceSuggestionFeaturedConfidenceSignal valueForDescriptor:](v6);
    }

    return -1000.0;
  }
  return result;
}

- (double)weight
{
  return 5.0;
}

- (void)valueForDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXFaceSuggestionFeaturedConfidenceSignal valueForDescriptor:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: warning: attempting to score descriptor with no featured confidence, returning -1000.0", (uint8_t *)&v1, 0xCu);
}

@end