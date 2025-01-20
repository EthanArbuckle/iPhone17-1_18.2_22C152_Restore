@interface OSMRelevanceEngineTrainingContext
- (void)trainWithUnmanagedElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
@end

@implementation OSMRelevanceEngineTrainingContext

- (void)trainWithUnmanagedElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v11 = v10;
    uint64_t v12 = [v8 identifier];
    v13 = (void *)v12;
    CFStringRef v14 = @"negative";
    *(_DWORD *)buf = 136315906;
    v17 = "-[OSMRelevanceEngineTrainingContext trainWithUnmanagedElement:isPositiveEvent:interaction:]";
    if (v6) {
      CFStringRef v14 = @"positive";
    }
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    CFStringRef v21 = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Training Element: %@ Feedback: %@ Interaction: %@", buf, 0x2Au);
  }
  v15.receiver = self;
  v15.super_class = (Class)OSMRelevanceEngineTrainingContext;
  [(OSMRelevanceEngineTrainingContext *)&v15 trainWithUnmanagedElement:v8 isPositiveEvent:v6 interaction:v9];
}

@end