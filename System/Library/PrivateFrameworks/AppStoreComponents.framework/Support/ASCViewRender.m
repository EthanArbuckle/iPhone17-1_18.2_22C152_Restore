@interface ASCViewRender
+ (NSSet)requiredFieldNames;
+ (NSString)category;
+ (NSString)subsystem;
+ (OS_os_log)log;
+ (void)bootstrapDidBeginWithTag:(unint64_t)a3;
+ (void)bootstrapDidEndWithTag:(unint64_t)a3;
+ (void)jsCallDidBeginWithTag:(unint64_t)a3;
+ (void)jsCallDidEndWithTag:(unint64_t)a3;
+ (void)jsStackBootstrapDidBeginWithTag:(unint64_t)a3;
+ (void)jsStackBootstrapDidEndWithTag:(unint64_t)a3;
+ (void)launchCorrelationKeyWithTag:(unint64_t)a3 withString:(id)a4;
+ (void)modelPrefetchDidBeginWithTag:(unint64_t)a3;
+ (void)modelPrefetchDidEndWithTag:(unint64_t)a3;
+ (void)overlayRequestedWithTag:(unint64_t)a3;
+ (void)pageRequestedWithTag:(unint64_t)a3;
+ (void)pageUserReadyWithTag:(unint64_t)a3;
+ (void)requestDidBeginWithTag:(unint64_t)a3;
+ (void)requestDidEndWithTag:(unint64_t)a3;
+ (void)resourceRequestDidBeginWithTag:(unint64_t)a3;
+ (void)resourceRequestDidEndWithTag:(unint64_t)a3;
+ (void)rootViewModelParseDidBeginWithTag:(unint64_t)a3;
+ (void)rootViewModelParseDidEndWithTag:(unint64_t)a3;
+ (void)rootViewModelPresentWithTag:(unint64_t)a3;
@end

@implementation ASCViewRender

+ (NSString)subsystem
{
  return (NSString *)@"com.apple.AppStoreComponents";
}

+ (NSString)category
{
  return (NSString *)@"PageRender";
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002611C;
  block[3] = &unk_100184310;
  block[4] = a1;
  if (qword_1001A60A8 != -1) {
    dispatch_once(&qword_1001A60A8, block);
  }
  v2 = (void *)qword_1001A60B0;

  return (OS_os_log *)v2;
}

+ (NSSet)requiredFieldNames
{
  id v2 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"pageRequestedTime", @"requestStartTime", @"requestEndTime", @"jsCallStartTime", @"jsCallEndTime", @"rootViewModelParseStartTime", @"rootViewModelParseEndTime", @"pageUserReadyTime", 0);

  return (NSSet *)v2;
}

+ (void)overlayRequestedWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:0 withName:@"overlayRequested"];
  v5 = [a1 log];
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, a3, "overlayRequested", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)modelPrefetchDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"modelPrefetchStart"];
  v5 = [a1 log];
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "modelPrefetch", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)modelPrefetchDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"modelPrefetchEnd"];
  v5 = [a1 log];
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "modelPrefetch", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)pageRequestedWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:0 withName:@"pageRequested"];
  v5 = [a1 log];
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, a3, "pageRequested", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)bootstrapDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"bootstrapStart"];
  v5 = [a1 log];
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "bootstrap", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)bootstrapDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"bootstrapEnd"];
  v5 = [a1 log];
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "bootstrap", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)launchCorrelationKeyWithTag:(unint64_t)a3 withString:(id)a4
{
  id v6 = a4;
  [a1 willEmitSignpostOfType:1 withName:@"launchCorrelationKey"];
  v7 = [a1 log];
  v8 = v7;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, a3, "launchCorrelationKey", "String=%{signpost.description:attribute}@", (uint8_t *)&v9, 0xCu);
  }
}

+ (void)requestDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"requestStart"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "request", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)requestDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"requestEnd"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "request", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)jsStackBootstrapDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"jsStackBootstrapStart"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "jsStackBootstrap", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)jsStackBootstrapDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"jsStackBootstrapEnd"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "jsStackBootstrap", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)jsCallDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"jsCallStart"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "jsCall", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)jsCallDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"jsCallEnd"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "jsCall", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)rootViewModelParseDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"rootViewModelParseStart"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "rootViewModelParse", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)rootViewModelParseDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"rootViewModelParseEnd"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "rootViewModelParse", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)rootViewModelPresentWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:0 withName:@"rootViewModelPresent"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, a3, "rootViewModelPresent", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)resourceRequestDidBeginWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"resourceRequestStart"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "resourceRequest", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)resourceRequestDidEndWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:3 withName:@"resourceRequestEnd"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, a3, "resourceRequest", (const char *)&unk_100164626, v7, 2u);
  }
}

+ (void)pageUserReadyWithTag:(unint64_t)a3
{
  [a1 willEmitSignpostOfType:0 withName:@"pageUserReady"];
  v5 = [a1 log];
  id v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, a3, "pageUserReady", (const char *)&unk_100164626, v7, 2u);
  }
}

@end