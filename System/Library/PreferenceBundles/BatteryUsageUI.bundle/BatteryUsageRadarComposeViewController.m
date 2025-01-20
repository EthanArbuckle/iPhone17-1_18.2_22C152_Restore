@interface BatteryUsageRadarComposeViewController
+ (BOOL)hasRadarCompose;
- (BatteryUsageRadarComposeViewController)initWithParentView:(id)a3 andDictionary:(id)a4;
- (NSDictionary)currentDictionary;
- (UIViewController)parentViewController;
- (id)urlEncodedString:(id)a3;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)setCurrentDictionary:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)showRadarComposeAlert;
@end

@implementation BatteryUsageRadarComposeViewController

+ (BOOL)hasRadarCompose
{
  if (qword_D7550 != -1) {
    dispatch_once(&qword_D7550, &stru_BF838);
  }
  if (!byte_D7548) {
    return 0;
  }
  if (!qword_D7558)
  {
    qword_D7558 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/RadarCompose.framework/RadarCompose", 2);
    if (!qword_D7558) {
      return 0;
    }
  }

  return isTapToRadarEnabled();
}

- (BatteryUsageRadarComposeViewController)initWithParentView:(id)a3 andDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BatteryUsageRadarComposeViewController;
  v8 = [(BatteryUsageRadarComposeViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(BatteryUsageRadarComposeViewController *)v8 setParentViewController:v6];
    [(BatteryUsageRadarComposeViewController *)v9 setCurrentDictionary:v7];
  }

  return v9;
}

- (void)showRadarComposeAlert
{
  id v2 = objc_msgSend(objc_alloc((Class)UIAlertView), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", 0, @"What type of problem?", self, @"Cancel", @"Battery Life Issue", @"Battery Usage UI Issue", 0);
  [v2 show];
}

- (id)urlEncodedString:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v11 = [v5 objectForKey:v10];
        v12 = sub_491C(v10);
        v13 = sub_491C(v11);
        v14 = +[NSString stringWithFormat:@"%@=%@", v12, v13, (void)v17];

        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = [v4 componentsJoinedByString:@"&"];

  return v15;
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  if (a4)
  {
    CFStringRef v5 = @"Purple Battery UI";
    if (a4 == 1) {
      CFStringRef v5 = @"Purple Battery Life";
    }
    v12[0] = @"ComponentName";
    v12[1] = @"ComponentVersion";
    v13[0] = v5;
    v13[1] = @"1.0";
    v12[2] = @"ComponentID";
    v12[3] = @"Reproducibility";
    CFStringRef v6 = @"485067";
    if (a4 == 1) {
      CFStringRef v6 = @"241066";
    }
    v13[2] = v6;
    v13[3] = @"I Didn't Try";
    v12[4] = @"Classification";
    v12[5] = @"Keywords";
    v13[4] = @"Power";
    v13[5] = @"RadarFromBatteryUsageUI";
    v12[6] = @"ExtensionIdentifiers";
    v13[6] = @"com.apple.PowerlogCore.diagnosticextension";
    id v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];
    uint64_t v8 = [(BatteryUsageRadarComposeViewController *)self urlEncodedString:v7];
    v9 = [@"tap-to-radar://new?" stringByAppendingString:v8];

    v10 = +[NSURL URLWithString:v9];
    objc_super v11 = +[LSApplicationWorkspace defaultWorkspace];
    [v11 openURL:v10];
  }
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
}

- (NSDictionary)currentDictionary
{
  return self->_currentDictionary;
}

- (void)setCurrentDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDictionary, 0);

  objc_storeStrong((id *)&self->_parentViewController, 0);
}

@end