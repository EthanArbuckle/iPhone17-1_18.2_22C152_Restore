@interface FBAUploadProgressCell
- (FBANetworkMonitor)netMonitor;
- (FBARadialProgressView)progressView;
- (FBKUploadTask)observedTask;
- (UIActivityIndicatorView)indeterminateSpinner;
- (UILabel)statusLabel;
- (unint64_t)lastStage;
- (void)awakeFromNib;
- (void)beginObserving:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIndeterminateSpinner:(id)a3;
- (void)setLastStage:(unint64_t)a3;
- (void)setNetMonitor:(id)a3;
- (void)setObservedTask:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)stopObserving:(id)a3;
- (void)updateForNetworkStateChange:(BOOL)a3;
- (void)updateProgressForTask:(id)a3;
- (void)updateUploadStage:(unint64_t)a3;
@end

@implementation FBAUploadProgressCell

- (void)awakeFromNib
{
  v7.receiver = self;
  v7.super_class = (Class)FBAUploadProgressCell;
  [(FBAUploadProgressCell *)&v7 awakeFromNib];
  v3 = +[FBANetworkMonitor sharedInstance];
  [(FBAUploadProgressCell *)self setNetMonitor:v3];

  v4 = [(FBAUploadProgressCell *)self netMonitor];
  [v4 addObserver:self forKeyPath:@"isConnectedToCellNetwork" options:1 context:off_1001217C8];

  v5 = [(FBAUploadProgressCell *)self indeterminateSpinner];
  [v5 setActivityIndicatorViewStyle:100];

  v6 = [(FBAUploadProgressCell *)self indeterminateSpinner];
  [v6 stopAnimating];
}

- (void)setObservedTask:(id)a3
{
  id v9 = a3;
  p_observedTask = &self->_observedTask;
  v6 = [(FBKUploadTask *)self->_observedTask taskIdentifier];
  objc_super v7 = [v9 taskIdentifier];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    if (*p_observedTask) {
      -[FBAUploadProgressCell stopObserving:](self, "stopObserving:");
    }
    objc_storeStrong((id *)&self->_observedTask, a3);
    [(FBAUploadProgressCell *)self beginObserving:*p_observedTask];
  }
  -[FBAUploadProgressCell updateUploadStage:](self, "updateUploadStage:", [v9 localSubmissionStage]);
  [(FBAUploadProgressCell *)self updateProgressForTask:v9];
}

- (void)dealloc
{
  if (self->_observedTask) {
    -[FBAUploadProgressCell stopObserving:](self, "stopObserving:");
  }
  v3 = [(FBAUploadProgressCell *)self netMonitor];
  [v3 removeObserver:self forKeyPath:@"isConnectedToCellNetwork"];

  v4.receiver = self;
  v4.super_class = (Class)FBAUploadProgressCell;
  [(FBAUploadProgressCell *)&v4 dealloc];
}

- (void)beginObserving:(id)a3
{
  objc_super v4 = off_1001217D0;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"bytesUploaded" options:1 context:v4];
  [v5 addObserver:self forKeyPath:@"localSubmissionStage" options:1 context:off_1001217D8];
}

- (void)stopObserving:(id)a3
{
  objc_super v4 = off_1001217D0;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"bytesUploaded" context:v4];
  [v5 removeObserver:self forKeyPath:@"localSubmissionStage" context:off_1001217D8];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001217D0 == a6)
  {
    v13 = [(FBAUploadProgressCell *)self observedTask];
    [(FBAUploadProgressCell *)self updateProgressForTask:v13];
LABEL_7:

    goto LABEL_9;
  }
  if (off_1001217D8 == a6)
  {
    v13 = [(FBAUploadProgressCell *)self observedTask];
    -[FBAUploadProgressCell updateUploadStage:](self, "updateUploadStage:", [v13 localSubmissionStage]);
    goto LABEL_7;
  }
  if (off_1001217C8 == a6)
  {
    v14 = [(FBAUploadProgressCell *)self netMonitor];
    id v15 = [v14 shouldShowWaitingOnWifi];

    [(FBAUploadProgressCell *)self updateForNetworkStateChange:v15];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)FBAUploadProgressCell;
    [(FBAUploadProgressCell *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_9:
}

- (void)updateForNetworkStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ((id)[(FBAUploadProgressCell *)self lastStage] == (id)4)
  {
    id v8 = +[NSBundle mainBundle];
    if (v3)
    {
      id v5 = LocalizableGTStringKeyForKey();
      v6 = [v8 localizedStringForKey:v5 value:&stru_1000F6658 table:0];
      objc_super v7 = [(FBAUploadProgressCell *)self statusLabel];
      [v7 setText:v6];
    }
    else
    {
      id v5 = [v8 localizedStringForKey:@"FOLLOWUP_SENDING_ATTACHMENTS" value:&stru_1000F6658 table:0];
      v6 = [(FBAUploadProgressCell *)self statusLabel];
      [v6 setText:v5];
    }
  }
}

- (void)updateProgressForTask:(id)a3
{
  id v4 = a3;
  float v5 = 0.0;
  id v17 = v4;
  if (v4)
  {
    v6 = [v4 bytesToUpload];
    [v6 floatValue];
    float v8 = v7;

    if (v8 != 0.0)
    {
      id v9 = [v17 bytesUploaded];
      [v9 floatValue];
      float v11 = v10;
      id v12 = [v17 bytesToUpload];
      [v12 floatValue];
      float v5 = v11 / v13;
    }
  }
  v14 = [(FBAUploadProgressCell *)self progressView];
  *(float *)&double v15 = v5;
  [v14 setProgress:v15];

  objc_super v16 = [(FBAUploadProgressCell *)self netMonitor];
  -[FBAUploadProgressCell updateForNetworkStateChange:](self, "updateForNetworkStateChange:", [v16 shouldShowWaitingOnWifi]);
}

- (void)updateUploadStage:(unint64_t)a3
{
  -[FBAUploadProgressCell setLastStage:](self, "setLastStage:");
  float v5 = +[UIColor labelColor];
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      v6 = +[NSBundle mainBundle];
      float v7 = v6;
      CFStringRef v8 = @"FOLLOWUP_SENDING_ATTACHMENTS";
      goto LABEL_10;
    case 2uLL:
      double v15 = +[NSBundle mainBundle];
      id v25 = [v15 localizedStringForKey:@"OUTBOX_COLLECTING" value:&stru_1000F6658 table:0];

      goto LABEL_18;
    case 3uLL:
      objc_super v16 = +[NSBundle mainBundle];
      id v17 = v16;
      CFStringRef v18 = @"OUTBOX_SUBMISSION_TOO_LARGE";
      goto LABEL_12;
    case 4uLL:
    case 8uLL:
      id v9 = [(FBAUploadProgressCell *)self netMonitor];
      unsigned int v10 = [v9 shouldShowWaitingOnWifi];

      float v11 = +[NSBundle mainBundle];
      id v12 = v11;
      if (v10)
      {
        float v13 = LocalizableGTStringKeyForKey();
        id v25 = [v12 localizedStringForKey:v13 value:&stru_1000F6658 table:0];
      }
      else
      {
        id v25 = [v11 localizedStringForKey:@"FOLLOWUP_SENDING_ATTACHMENTS" value:&stru_1000F6658 table:0];
      }

      if (a3 == 8)
      {
LABEL_18:
        v21 = [(FBAUploadProgressCell *)self indeterminateSpinner];
        [v21 startAnimating];
        uint64_t v14 = 1;
      }
      else
      {
        uint64_t v14 = 0;
LABEL_15:
        v21 = [(FBAUploadProgressCell *)self indeterminateSpinner];
        [v21 stopAnimating];
      }

      v22 = [(FBAUploadProgressCell *)self statusLabel];
      [v22 setText:v25];

      v23 = [(FBAUploadProgressCell *)self statusLabel];
      [v23 setTextColor:v5];

      v24 = [(FBAUploadProgressCell *)self progressView];
      [v24 setHidden:v14];

      return;
    case 5uLL:
      v19 = +[NSBundle mainBundle];
      id v25 = [v19 localizedStringForKey:@"OUTBOX_FAILED" value:&stru_1000F6658 table:0];

      uint64_t v20 = +[UIColor redColor];
      uint64_t v14 = 0;
      float v7 = v5;
      goto LABEL_13;
    case 6uLL:
      v6 = +[NSBundle mainBundle];
      float v7 = v6;
      CFStringRef v8 = @"OUTBOX_READY_FOR_COMPLETE";
LABEL_10:
      id v25 = [v6 localizedStringForKey:v8 value:&stru_1000F6658 table:0];
      uint64_t v14 = 1;
      goto LABEL_14;
    case 7uLL:
      objc_super v16 = +[NSBundle mainBundle];
      id v17 = v16;
      CFStringRef v18 = @"OUTBOX_SUBMISSION_FAILED";
LABEL_12:
      id v25 = [v16 localizedStringForKey:v18 value:&stru_1000F6658 table:0];

      uint64_t v20 = +[UIColor redColor];
      float v7 = v5;
      uint64_t v14 = 1;
LABEL_13:
      float v5 = (void *)v20;
LABEL_14:

      goto LABEL_15;
    default:
      uint64_t v14 = 0;
      id v25 = 0;
      goto LABEL_15;
  }
}

- (UILabel)statusLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusLabel);

  return (UILabel *)WeakRetained;
}

- (void)setStatusLabel:(id)a3
{
}

- (FBARadialProgressView)progressView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);

  return (FBARadialProgressView *)WeakRetained;
}

- (void)setProgressView:(id)a3
{
}

- (FBKUploadTask)observedTask
{
  return self->_observedTask;
}

- (UIActivityIndicatorView)indeterminateSpinner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indeterminateSpinner);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setIndeterminateSpinner:(id)a3
{
}

- (FBANetworkMonitor)netMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_netMonitor);

  return (FBANetworkMonitor *)WeakRetained;
}

- (void)setNetMonitor:(id)a3
{
}

- (unint64_t)lastStage
{
  return self->_lastStage;
}

- (void)setLastStage:(unint64_t)a3
{
  self->_lastStage = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_netMonitor);
  objc_destroyWeak((id *)&self->_indeterminateSpinner);
  objc_storeStrong((id *)&self->_observedTask, 0);
  objc_destroyWeak((id *)&self->_progressView);

  objc_destroyWeak((id *)&self->_statusLabel);
}

@end