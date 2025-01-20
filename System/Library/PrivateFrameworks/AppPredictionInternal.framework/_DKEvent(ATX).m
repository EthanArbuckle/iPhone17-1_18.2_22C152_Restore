@interface _DKEvent(ATX)
- (id)atx_efficientRelevantShortcut;
- (void)atx_efficientRelevantShortcut;
@end

@implementation _DKEvent(ATX)

- (id)atx_efficientRelevantShortcut
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  v3 = [a1 metadata];
  v4 = [MEMORY[0x1E4F5B5D8] serializedRelevantShortcut];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v17 = 0;
    v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v17];
    v7 = v17;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_DKEvent(ATX) *)(uint64_t)v7 atx_efficientRelevantShortcut];
      }
    }
  }
  else
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_DKEvent(ATX) atx_efficientRelevantShortcut](v7);
    }
    v6 = 0;
  }

  return v6;
}

- (void)atx_efficientRelevantShortcut
{
}

@end