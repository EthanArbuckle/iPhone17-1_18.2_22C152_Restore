@interface LNSpotlightCascadeBridge
+ (void)deleteItems:(id)a3 bundleIdentifier:(id)a4 version:(unint64_t)a5 validity:(id)a6 completionHandler:(id)a7;
+ (void)donateItems:(id)a3 bundleIdentifier:(id)a4 version:(unint64_t)a5 validity:(id)a6 completionHandler:(id)a7;
@end

@implementation LNSpotlightCascadeBridge

+ (void)donateItems:(id)a3 bundleIdentifier:(id)a4 version:(unint64_t)a5 validity:(id)a6 completionHandler:(id)a7
{
  v7 = (void (**)(id, void))a7;
  v8 = getLNLogCategoryVocabulary();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "Ignoring AppEntity donations", v9, 2u);
  }

  v7[2](v7, 0);
}

+ (void)deleteItems:(id)a3 bundleIdentifier:(id)a4 version:(unint64_t)a5 validity:(id)a6 completionHandler:(id)a7
{
  v7 = (void (**)(id, void))a7;
  v8 = getLNLogCategoryVocabulary();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "Ignoring AppEntity donations", v9, 2u);
  }

  v7[2](v7, 0);
}

@end