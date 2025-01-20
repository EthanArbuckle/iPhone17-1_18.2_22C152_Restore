@interface FMDAudioPlayerFactory
+ (id)initWithContentsOfURL:(id)a3 error:(id *)a4;
@end

@implementation FMDAudioPlayerFactory

+ (id)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = +[FMDAVRouteControllerFactory isAutomationActive];
  v7 = sub_100006668();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDAutomationAVAudioPlayer: switching to automation", buf, 2u);
    }

    v9 = +[FMDAutomationHelperFactory sharedFactory];
    v10 = (objc_class *)[v9 automationHelperClassWithName:@"FMDAutomationAVAudioPlayer"];

    id v11 = [v10 alloc];
    uint64_t v19 = 0;
    v12 = (id *)&v19;
    id v13 = [v11 initWithError:&v19];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AVAudioPlayer: initWithContentsOfURL: %@", buf, 0xCu);
    }

    uint64_t v18 = 0;
    v12 = (id *)&v18;
    id v13 = [objc_alloc((Class)AVAudioPlayer) initWithContentsOfURL:v5 error:&v18];
  }
  v14 = v13;
  id v15 = *v12;
  v16 = v15;
  if (a4) {
    *a4 = v15;
  }

  return v14;
}

@end