@interface HUDiagnosticsCameraClipViewController
- (HMCameraClip)cameraClip;
- (HMCameraProfile)cameraProfile;
- (HUDiagnosticsCameraClipViewController)initWithRecordingEvent:(id)a3 cameraProfile:(id)a4;
- (UITableView)eventTableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCameraClip:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setEventTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUDiagnosticsCameraClipViewController

- (HUDiagnosticsCameraClipViewController)initWithRecordingEvent:(id)a3 cameraProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUDiagnosticsCameraClipViewController;
  v9 = [(HUDiagnosticsCameraClipViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cameraClip, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUDiagnosticsCameraClipViewController;
  [(HUDiagnosticsCameraClipViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(HUDiagnosticsCameraClipViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(HUDiagnosticsCameraClipViewController *)self view];
  v6 = [(HUDiagnosticsCameraClipViewController *)self eventTableView];
  [v5 addSubview:v6];
}

- (UITableView)eventTableView
{
  eventTableView = self->_eventTableView;
  if (!eventTableView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42E98]);
    v5 = [(HUDiagnosticsCameraClipViewController *)self view];
    [v5 bounds];
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:");

    [(UITableView *)v6 setDataSource:self];
    [(UITableView *)v6 setDelegate:self];
    [(UITableView *)v6 setSemanticContentAttribute:3];
    objc_super v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITableView *)v6 setBackgroundColor:v7];

    [(UITableView *)v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUDiagnosticsRecordingCellEventIdentifier"];
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
  return 7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"HUDiagnosticsRecordingCellEventIdentifier" forIndexPath:v6];
  [v7 setHideIcon:1];
  uint64_t v8 = [v6 row];

  switch(v8)
  {
    case 0:
      v9 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      v11 = [v10 uniqueIdentifier];
      [v9 stringWithFormat:@"UUID: %@", v11];
      goto LABEL_10;
    case 1:
      objc_super v12 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      v11 = [v10 dateOfOccurrence];
      [v12 stringWithFormat:@"Start Date: %@", v11];
      goto LABEL_10;
    case 2:
      v13 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      [v10 duration];
      [v13 stringWithFormat:@"Duration: %.2f", v14];
      goto LABEL_14;
    case 3:
      v15 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      int v16 = [v10 isComplete];
      v17 = @"NO";
      if (v16) {
        v17 = @"YES";
      }
      [v15 stringWithFormat:@"Complete: %@", v17];
      goto LABEL_14;
    case 4:
      v18 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      [v10 targetFragmentDuration];
      [v18 stringWithFormat:@"Target Fragment Duration: %.2f", v19];
      goto LABEL_14;
    case 5:
      v20 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      v11 = [v10 significantEvents];
      objc_msgSend(v20, "stringWithFormat:", @"Significant Events: %lu", objc_msgSend(v11, "count"));
      v21 = LABEL_10:;
      [v7 setTitleText:v21];

      goto LABEL_15;
    case 6:
      v22 = NSString;
      v10 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
      int v23 = [v10 canAskForUserFeedback];
      v24 = @"NO";
      if (v23) {
        v24 = @"YES";
      }
      [v22 stringWithFormat:@"Can ask for feedback: %@", v24];
      v11 = LABEL_14:;
      [v7 setTitleText:v11];
LABEL_15:

      break;
    default:
      break;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3) == 5)
  {
    v5 = [HUDiagnosticsCameraClipSignificantEventsViewController alloc];
    id v6 = [(HUDiagnosticsCameraClipViewController *)self cameraClip];
    uint64_t v8 = [(HUDiagnosticsCameraClipSignificantEventsViewController *)v5 initWithCameraClip:v6];

    objc_super v7 = [(HUDiagnosticsCameraClipViewController *)self navigationController];
    [v7 pushViewController:v8 animated:1];
  }
}

- (void)setEventTableView:(id)a3
{
}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
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
  objc_storeStrong((id *)&self->_cameraClip, 0);

  objc_storeStrong((id *)&self->_eventTableView, 0);
}

@end