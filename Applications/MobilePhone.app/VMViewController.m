@interface VMViewController
- (VMViewController)init;
- (VMViewController)initWithCoder:(id)a3;
- (VMViewController)initWithManager:(id)a3;
- (VMViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VMVoicemailManager)manager;
- (void)detailSlider:(id)a3 didChangeValue:(float)a4;
- (void)detailSliderTrackingDidCancel:(id)a3;
- (void)pause;
- (void)play;
- (void)playbackControls:(id)a3 didRequestState:(int64_t)a4;
- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4;
- (void)playerController:(id)a3 didChangeToDuration:(double)a4;
- (void)playerController:(id)a3 didChangeToStatus:(int64_t)a4;
- (void)playerController:(id)a3 didChangeToTimeControlStatus:(int64_t)a4;
- (void)playerController:(id)a3 didSeekToTime:(float)a4;
- (void)stop;
@end

@implementation VMViewController

- (VMViewController)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMViewController;
  v6 = [(PHViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

- (VMViewController)init
{
  return 0;
}

- (VMViewController)initWithCoder:(id)a3
{
  return 0;
}

- (VMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (VMVoicemailManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
}

- (void)detailSliderTrackingDidCancel:(id)a3
{
  id v7 = [(VMViewController *)self playerController];
  [v7 currentTime];
  double v5 = v4;
  v6 = [(VMViewController *)self playerControlsView];
  [v6 setElapsedTime:v5];
}

- (void)detailSlider:(id)a3 didChangeValue:(float)a4
{
  id v6 = [(VMViewController *)self playerController];
  *(float *)&double v5 = a4;
  [v6 seekToTime:v5];
}

- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4
{
  id v5 = [(VMViewController *)self playerControlsView];
  [v5 setElapsedTime:1 animated:a4];
}

- (void)playerController:(id)a3 didChangeToDuration:(double)a4
{
  id v6 = a3;
  id v7 = [(VMViewController *)self playerControlsView];
  v8 = [v7 timelineSlider];
  [v8 setDuration:a4];

  id v9 = [v6 status];
  if (v9 == (id)1)
  {
    id v10 = [(VMViewController *)self playerControlsView];
    [v10 setEnabled:1];
  }
}

- (void)playerController:(id)a3 didChangeToStatus:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v14 = v6;
    [v6 duration];
    double v11 = v10;
    v12 = [(VMViewController *)self playerControlsView];
    [v12 setDuration:v11];

    v13 = [(VMViewController *)self playerControlsView];
    [v13 setElapsedTime:0.0];

    id v7 = [(VMViewController *)self playerControlsView];
    v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v14 = v6;
    id v7 = [(VMViewController *)self playerControlsView];
    v8 = v7;
    uint64_t v9 = 0;
  }
  [v7 setEnabled:v9];

  id v6 = v14;
LABEL_6:
}

- (void)playerController:(id)a3 didChangeToTimeControlStatus:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2 || a4 == 1)
  {
    id v10 = v6;
    id v7 = [(VMViewController *)self playerControlsView];
    v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    if (a4) {
      goto LABEL_7;
    }
    id v10 = v6;
    id v7 = [(VMViewController *)self playerControlsView];
    v8 = v7;
    uint64_t v9 = 2;
  }
  [v7 setState:v9 animated:1];

  id v6 = v10;
LABEL_7:
}

- (void)playerController:(id)a3 didSeekToTime:(float)a4
{
  id v5 = [(VMViewController *)self playerControlsView];
  [v5 setElapsedTime:1 animated:a4];
}

- (void)playbackControls:(id)a3 didRequestState:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 2:
      [(VMViewController *)self pause];
      break;
    case 1:
      [(VMViewController *)self play];
      break;
    case 0:
      [(VMViewController *)self stop];
      break;
  }
  [v6 setState:a4];
}

- (void)pause
{
  id v2 = [(VMViewController *)self playerController];
  [v2 pause];
}

- (void)play
{
  id v2 = [(VMViewController *)self playerController];
  [v2 play];
}

- (void)stop
{
  id v2 = [(VMViewController *)self playerController];
  [v2 stop];
}

@end