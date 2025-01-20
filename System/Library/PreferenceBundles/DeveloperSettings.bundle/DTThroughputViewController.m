@interface DTThroughputViewController
- (NPTPerformanceTest)testObject;
- (NPTResults)testResults;
- (id)downloadSpeed:(id)a3;
- (id)latency:(id)a3;
- (id)packetLoss:(id)a3;
- (id)specifiers;
- (id)uploadSpeed:(id)a3;
- (int64_t)testStatus;
- (void)cancelSpeedTest:(id)a3;
- (void)setTestObject:(id)a3;
- (void)setTestResults:(id)a3;
- (void)setTestStatus:(int64_t)a3;
- (void)startSpeedTest;
- (void)startSpeedTest:(id)a3;
- (void)updateTestStatus:(int64_t)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DTThroughputViewController

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DTThroughputViewController;
  [(DTThroughputViewController *)&v6 viewWillDisappear:a3];
  v4 = [(DTThroughputViewController *)self testObject];

  if (v4)
  {
    v5 = [(DTThroughputViewController *)self testObject];
    [v5 cancelAllNetworking];

    [(DTThroughputViewController *)self setTestObject:0];
    [(DTThroughputViewController *)self setTestStatus:0];
  }
}

- (id)specifiers
{
  v3 = objc_opt_new();
  v38 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
  objc_msgSend(v3, "addObject:");
  int64_t v4 = [(DTThroughputViewController *)self testStatus];
  if (v4 == 2)
  {
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"CANCELLING_THROUGHPUT_TEST" value:&stru_35910 table:@"DTSettings"];
    uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  }
  else
  {
    if (v4 == 1)
    {
      v12 = +[NSBundle bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"CANCEL_THROUGHPUT_TEST" value:&stru_35910 table:@"DTSettings"];
      v8 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:15 edit:0];

      v9 = "cancelSpeedTest:";
      goto LABEL_7;
    }
    uint64_t v5 = 0;
    if (!v4)
    {
      objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
      v7 = [v6 localizedStringForKey:@"START_THROUGHPUT_TEST" value:&stru_35910 table:@"DTSettings"];
      v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];

      v9 = "startSpeedTest:";
LABEL_7:
      uint64_t v5 = (uint64_t)v8;
      [v8 setButtonAction:v9];
    }
  }
  v36 = (void *)v5;
  [v3 addObject:v5];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"RESULTS" value:&stru_35910 table:@"DTSettings"];
  v37 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:0 edit:0];

  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = SFLocalizableWAPIStringKeyForKey();
  v18 = [v16 localizedStringForKey:v17 value:&stru_35910 table:@"DTSettings"];
  [v37 setProperty:v18 forKey:PSFooterTextGroupKey];

  [v3 addObject:v37];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"PACKET_LOSS" value:&stru_35910 table:@"DTSettings"];
  v35 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:"packetLoss:" detail:0 cell:4 edit:0];

  [v3 addObject:v35];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"LATENCY" value:&stru_35910 table:@"DTSettings"];
  v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:"latency:" detail:0 cell:4 edit:0];

  [v3 addObject:v23];
  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"DOWNLOAD_SPEED" value:&stru_35910 table:@"DTSettings"];
  v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:"downloadSpeed:" detail:0 cell:4 edit:0];

  [v3 addObject:v26];
  v27 = +[NSBundle bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"UPLOAD_SPEED" value:&stru_35910 table:@"DTSettings"];
  v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:"uploadSpeed:" detail:0 cell:4 edit:0];

  [v3 addObject:v29];
  uint64_t v30 = OBJC_IVAR___PSListController__specifiers;
  v31 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v32 = v3;

  id v33 = *(id *)&self->PSListController_opaque[v30];
  return v33;
}

- (id)packetLoss:(id)a3
{
  int64_t v4 = [(DTThroughputViewController *)self testResults];
  if (v4)
  {
    uint64_t v5 = [(DTThroughputViewController *)self testResults];
    objc_super v6 = [v5 pingResults];
    [v6 percentLost];
    v8 = +[NSString stringWithFormat:@"%.2f %%", v7];
  }
  else
  {
    v8 = &stru_35910;
  }

  return v8;
}

- (id)latency:(id)a3
{
  int64_t v4 = [(DTThroughputViewController *)self testResults];
  if (v4)
  {
    uint64_t v5 = [(DTThroughputViewController *)self testResults];
    objc_super v6 = [v5 pingResults];
    [v6 meanLatency];
    v8 = +[NSString stringWithFormat:@"%.2f ms", v7 * 1000.0];
  }
  else
  {
    v8 = &stru_35910;
  }

  return v8;
}

- (id)downloadSpeed:(id)a3
{
  int64_t v4 = [(DTThroughputViewController *)self testResults];
  if (v4)
  {
    uint64_t v5 = [(DTThroughputViewController *)self testResults];
    objc_super v6 = [v5 downloadResults];
    [v6 speed];
    v8 = +[NSString stringWithFormat:@"%.2f Mbps", v7];
  }
  else
  {
    v8 = &stru_35910;
  }

  return v8;
}

- (id)uploadSpeed:(id)a3
{
  int64_t v4 = [(DTThroughputViewController *)self testResults];
  if (v4)
  {
    uint64_t v5 = [(DTThroughputViewController *)self testResults];
    objc_super v6 = [v5 uploadResults];
    [v6 speed];
    v8 = +[NSString stringWithFormat:@"%.2f Mbps", v7];
  }
  else
  {
    v8 = &stru_35910;
  }

  return v8;
}

- (void)cancelSpeedTest:(id)a3
{
  int64_t v4 = [(DTThroughputViewController *)self testObject];

  if (v4)
  {
    [(DTThroughputViewController *)self updateTestStatus:2];
    uint64_t v5 = [(DTThroughputViewController *)self testObject];
    [v5 cancelAllNetworking];

    objc_initWeak(&location, self);
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2074C;
    block[3] = &unk_35438;
    objc_copyWeak(&v8, &location);
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(DTThroughputViewController *)self updateTestStatus:0];
  }
}

- (void)startSpeedTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  dispatch_time_t v6 = [v5 localizedStringForKey:@"THROUGHPUT_ALERT_TITLE" value:&stru_35910 table:@"DTSettings"];

  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"THROUGHPUT_ALERT_TEXT" value:&stru_35910 table:@"DTSettings"];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"THROUGHPUT_ALERT_CONTINUE" value:&stru_35910 table:@"DTSettings"];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"THROUGHPUT_ALERT_CANCEL" value:&stru_35910 table:@"DTSettings"];

  v13 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  v14 = +[UIAlertAction actionWithTitle:v12 style:1 handler:&stru_35458];
  [v13 addAction:v14];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_20A4C;
  v17[3] = &unk_35010;
  v17[4] = self;
  v15 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v17];
  [v13 addAction:v15];
  [v13 setPreferredAction:v15];
  v16 = [v4 target];

  [v16 presentViewController:v13 animated:1 completion:0];
}

- (void)updateTestStatus:(int64_t)a3
{
  [(DTThroughputViewController *)self setTestStatus:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_20B10;
  block[3] = &unk_350D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startSpeedTest
{
  v3 = +[NPTPerformanceTestConfiguration defaultConfiguration];
  [v3 setTestDuration:10];
  [v3 setConcurrentStreams:4];
  [v3 setInterfaceType:3];
  [v3 setUseSecureConnection:1];
  [v3 setClientName:@"DeveloperSettings"];
  [(DTThroughputViewController *)self setTestResults:0];
  id v4 = +[NPTPerformanceTest performanceTestWithConfiguration:v3];
  [(DTThroughputViewController *)self setTestObject:v4];

  objc_initWeak(&location, self);
  uint64_t v5 = [(DTThroughputViewController *)self testObject];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_20C88;
  v6[3] = &unk_354A8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 startTestWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (int64_t)testStatus
{
  return self->_testStatus;
}

- (void)setTestStatus:(int64_t)a3
{
  self->_testStatus = a3;
}

- (NPTPerformanceTest)testObject
{
  return self->_testObject;
}

- (void)setTestObject:(id)a3
{
}

- (NPTResults)testResults
{
  return self->_testResults;
}

- (void)setTestResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testResults, 0);

  objc_storeStrong((id *)&self->_testObject, 0);
}

@end