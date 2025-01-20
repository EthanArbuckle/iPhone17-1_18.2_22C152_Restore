@interface HUDiagnosticsCameraClipSignificantEventsViewController
- (HMCameraClip)cameraClip;
- (HUDiagnosticsCameraClipSignificantEventsViewController)initWithCameraClip:(id)a3;
- (UITableView)eventTableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCameraClip:(id)a3;
- (void)setEventTableView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUDiagnosticsCameraClipSignificantEventsViewController

- (HUDiagnosticsCameraClipSignificantEventsViewController)initWithCameraClip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUDiagnosticsCameraClipSignificantEventsViewController;
  v6 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cameraClip, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUDiagnosticsCameraClipSignificantEventsViewController;
  [(HUDiagnosticsCameraClipSignificantEventsViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)self view];
  v6 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)self eventTableView];
  [v5 addSubview:v6];
}

- (UITableView)eventTableView
{
  eventTableView = self->_eventTableView;
  if (!eventTableView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42E98]);
    id v5 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)self view];
    [v5 bounds];
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:");

    [(UITableView *)v6 setDataSource:self];
    [(UITableView *)v6 setDelegate:self];
    [(UITableView *)v6 setSemanticContentAttribute:3];
    objc_super v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITableView *)v6 setBackgroundColor:v7];

    [(UITableView *)v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUCameraSignificantEventsBrowserCellIdentifier"];
    [(UITableView *)v6 setShowsHorizontalScrollIndicator:0];
    v8 = self->_eventTableView;
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
  id v4 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)self cameraClip];
  id v5 = [v4 significantEvents];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"HUCameraSignificantEventsBrowserCellIdentifier" forIndexPath:v6];
  [v7 setHideIcon:1];
  v8 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)self cameraClip];
  objc_super v9 = objc_msgSend(v8, "hf_sortedSignificantEvents");
  uint64_t v10 = [v6 row];

  v11 = [v9 objectAtIndex:v10];

  v12 = [v11 description];
  [v7 setTitleText:v12];

  return v7;
}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
}

- (void)setEventTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTableView, 0);

  objc_storeStrong((id *)&self->_cameraClip, 0);
}

@end