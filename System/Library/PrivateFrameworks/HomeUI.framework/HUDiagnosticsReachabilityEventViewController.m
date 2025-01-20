@interface HUDiagnosticsReachabilityEventViewController
- (HFCameraScrubberReachabilityEventContainer)container;
- (HMCameraProfile)cameraProfile;
- (HUDiagnosticsReachabilityEventViewController)initWithReachabilityEvent:(id)a3 cameraProfile:(id)a4;
- (UITableView)eventTableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCameraProfile:(id)a3;
- (void)setContainer:(id)a3;
- (void)setEventTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUDiagnosticsReachabilityEventViewController

- (HUDiagnosticsReachabilityEventViewController)initWithReachabilityEvent:(id)a3 cameraProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUDiagnosticsReachabilityEventViewController;
  v9 = [(HUDiagnosticsReachabilityEventViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUDiagnosticsReachabilityEventViewController;
  [(HUDiagnosticsReachabilityEventViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(HUDiagnosticsReachabilityEventViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(HUDiagnosticsReachabilityEventViewController *)self view];
  v6 = [(HUDiagnosticsReachabilityEventViewController *)self eventTableView];
  [v5 addSubview:v6];
}

- (UITableView)eventTableView
{
  eventTableView = self->_eventTableView;
  if (!eventTableView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42E98]);
    v5 = [(HUDiagnosticsReachabilityEventViewController *)self view];
    [v5 bounds];
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:");

    [(UITableView *)v6 setDataSource:self];
    [(UITableView *)v6 setDelegate:self];
    [(UITableView *)v6 setSemanticContentAttribute:3];
    objc_super v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITableView *)v6 setBackgroundColor:v7];

    [(UITableView *)v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUDiagnosticsReachabilityEventCellIdentifier"];
    [(UITableView *)v6 setShowsHorizontalScrollIndicator:0];
    id v8 = self->_eventTableView;
    self->_eventTableView = v6;

    eventTableView = self->_eventTableView;
  }

  return eventTableView;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(HUDiagnosticsReachabilityEventViewController *)self container];
  v5 = [v4 endEvent];
  if (v5) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"HUDiagnosticsReachabilityEventCellIdentifier" forIndexPath:v6];
  [v7 setHideIcon:1];
  uint64_t v8 = [v6 row];

  v9 = [(HUDiagnosticsReachabilityEventViewController *)self container];
  v10 = v9;
  if (v8) {
    [v9 endEvent];
  }
  else {
  v11 = [v9 startEvent];
  }
  objc_super v12 = [v11 description];
  [v7 setTitleText:v12];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3) != 1) {
    return;
  }
  v5 = [(HUDiagnosticsReachabilityEventViewController *)self container];
  id v6 = [v5 endEvent];
  uint64_t v7 = [v6 containerType];

  if (v7 != 1) {
    return;
  }
  uint64_t v8 = objc_opt_class();
  v9 = [(HUDiagnosticsReachabilityEventViewController *)self container];
  id v10 = [v9 endEvent];
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v18 = v10;
    if (v11) {
      goto LABEL_10;
    }
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  id v18 = 0;
LABEL_10:

  v14 = [HUDiagnosticsCameraClipViewController alloc];
  v15 = [(HUDiagnosticsReachabilityEventViewController *)self cameraProfile];
  v16 = [(HUDiagnosticsCameraClipViewController *)v14 initWithRecordingEvent:v18 cameraProfile:v15];

  v17 = [(HUDiagnosticsReachabilityEventViewController *)self navigationController];
  [v17 pushViewController:v16 animated:1];
}

- (void)setEventTableView:(id)a3
{
}

- (HFCameraScrubberReachabilityEventContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_eventTableView, 0);
}

@end