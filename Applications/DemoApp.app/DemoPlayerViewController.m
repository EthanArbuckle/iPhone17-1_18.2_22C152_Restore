@interface DemoPlayerViewController
- (void)_playerItemDidPlayToEndTime:(id)a3;
- (void)_prepareMovie;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DemoPlayerViewController

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)DemoPlayerViewController;
  [(DemoPlayerViewController *)&v8 loadView];
  v3 = [(DemoPlayerViewController *)self view];
  v4 = +[UIColor blackColor];
  [v3 setBackgroundColor:v4];

  v5 = [DemoPlayerView alloc];
  [v3 bounds];
  v6 = -[DemoPlayerView initWithFrame:](v5, "initWithFrame:");
  playerView = self->_playerView;
  self->_playerView = v6;

  [v3 addSubview:self->_playerView];
  self->_duration = NAN;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DemoPlayerViewController;
  [(DemoPlayerViewController *)&v4 viewDidAppear:a3];
  [(DemoPlayerViewController *)self _prepareMovie];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_100009038)
  {
    uint64_t v7 = [(AVPlayer *)self->_player currentItem];
    if (v7)
    {
      objc_super v8 = (void *)v7;
      v9 = [(AVPlayer *)self->_player currentItem];
      id v10 = [v9 status];

      if (v10 == (id)1)
      {
        if (self->_sync)
        {
          v12 = +[NSDate date];
          [v12 timeIntervalSince1970];
          long double v14 = v13;

          long double v15 = fmod(v14, self->_duration + 1.0);
          memset(&v23, 0, sizeof(v23));
          CMTimeMakeWithSeconds(&v23, v15, 1);
          player = self->_player;
          CMTime v22 = v23;
          long long v20 = *(_OWORD *)&kCMTimeZero.value;
          CMTimeEpoch epoch = kCMTimeZero.epoch;
          long long v18 = v20;
          CMTimeEpoch v19 = epoch;
          [(AVPlayer *)player seekToTime:&v22 toleranceBefore:&v20 toleranceAfter:&v18];
        }
        LODWORD(v11) = 1.0;
        [(AVPlayer *)self->_player setRate:v11];
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)DemoPlayerViewController;
    -[DemoPlayerViewController observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_playerItemDidPlayToEndTime:(id)a3
{
  double duration = self->_duration;
  double v5 = 1.0;
  v6 = +[NSDate date];
  [v6 timeIntervalSince1970];
  long double v8 = v7;

  if (self->_sync && (v9 = duration + 1.0, double v5 = fmod(v9 * ceil(v8 / v9) - v8, v9), v5 >= 2.0))
  {
    long double v11 = fmod(v8, v9);
    memset(&v18, 0, sizeof(v18));
    CMTimeMakeWithSeconds(&v18, v11, 1);
    player = self->_player;
    CMTime v17 = v18;
    long long v15 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    long long v13 = v15;
    CMTimeEpoch v14 = epoch;
    [(AVPlayer *)player seekToTime:&v17 toleranceBefore:&v15 toleranceAfter:&v13];
  }
  else
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000017F0;
    block[3] = &unk_100004168;
    block[4] = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_prepareMovie
{
  self->_sync = 1;
  v3 = NSHomeDirectory();
  objc_super v4 = [v3 stringByAppendingPathComponent:@"DemoSync.mov"];
  double v5 = +[NSURL fileURLWithPath:v4 isDirectory:0];

  if (([v5 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    v6 = NSHomeDirectory();
    double v7 = [v6 stringByAppendingPathComponent:@"Demo.mov"];
    uint64_t v8 = +[NSURL fileURLWithPath:v7 isDirectory:0];

    self->_sync = 0;
    double v5 = (void *)v8;
  }
  if (([v5 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    NSLog(@"movie %@ not found", v5);
    abort();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000019D8;
  v10[3] = &unk_100004190;
  id v11 = [objc_alloc((Class)AVURLAsset) initWithURL:v5 options:0];
  v12 = self;
  id v9 = v11;
  [v9 loadValuesAsynchronouslyForKeys:&off_100004320 completionHandler:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerView, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end