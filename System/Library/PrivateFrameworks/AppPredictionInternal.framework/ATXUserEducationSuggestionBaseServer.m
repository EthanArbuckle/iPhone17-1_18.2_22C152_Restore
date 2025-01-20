@interface ATXUserEducationSuggestionBaseServer
- (ATXUserEducationSuggestionBaseServer)init;
- (OS_dispatch_queue)serialQueue;
- (void)performBlockOnInternalSerialQueue:(id)a3;
@end

@implementation ATXUserEducationSuggestionBaseServer

- (ATXUserEducationSuggestionBaseServer)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)ATXUserEducationSuggestionBaseServer;
  v2 = [(ATXUserEducationSuggestionBaseServer *)&v11 init];
  if (v2)
  {
    v3 = [NSString stringWithFormat:@"%@_%@", objc_opt_class(), @"serialQueue"];
    v4 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[ATXUserEducationSuggestionBaseServer init]";
      __int16 v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: Starting up serial queue: %@", buf, 0x16u);
    }

    id v5 = v3;
    v6 = (const char *)[v5 UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)performBlockOnInternalSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
}

@end