@interface HWBalloonController
- (BOOL)isInteractive;
- (BOOL)shouldSuppressDrawingBalloon;
- (BOOL)wantsBalloonGradient;
- (BOOL)wantsEdgeToEdgeLayout;
- (BOOL)wantsTranscriptGroupMonograms;
- (BOOL)wantsTranscriptTimestampDrawer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTranscriptPluginView)pluginContentView;
- (HWBalloonController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)cancelPlayback;
- (void)dealloc;
- (void)playbackWithCompletionBlock:(id)a3;
- (void)setPluginContentView:(id)a3;
@end

@implementation HWBalloonController

- (HWBalloonController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HWBalloonController;
  v7 = [(HWBalloonController *)&v12 init];
  v8 = v7;
  if (v7)
  {
    [(HWAbstractBalloonController *)v7 setBalloonPluginDatasource:v6];
    [(HWAbstractBalloonController *)v8 setDatasourceIsFromMe:v4];
    v9 = [(HWAbstractBalloonController *)v8 balloonPluginDatasource];
    [v9 setBalloonController:v8];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v8 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HWBalloonController;
  [(HWBalloonController *)&v4 dealloc];
}

- (CKTranscriptPluginView)pluginContentView
{
  pluginContentView = self->_pluginContentView;
  if (!pluginContentView)
  {
    objc_super v4 = -[HWPluginContentView initWithFrame:]([HWPluginContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = [(HWAbstractBalloonController *)self balloonPluginDatasource];
    [(HWPluginContentView *)v4 setDataSource:v5];

    id v6 = [(HWAbstractBalloonController *)self balloonPluginDatasource];
    v7 = [v6 handwritingFromPayload];
    [(HWPluginContentView *)v4 setHandwriting:v7];

    [(HWBalloonController *)self setPluginContentView:v4];
    pluginContentView = self->_pluginContentView;
  }

  return pluginContentView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(HWAbstractBalloonController *)self balloonPluginDatasource];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)wantsTranscriptTimestampDrawer
{
  return 1;
}

- (BOOL)wantsTranscriptGroupMonograms
{
  return 1;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 0;
}

- (BOOL)wantsBalloonGradient
{
  return 0;
}

- (BOOL)shouldSuppressDrawingBalloon
{
  return 0;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v8 = a3;
  objc_super v4 = self->_pluginContentView;
  v5 = v4;
  if (v4)
  {
    double v6 = [(CKTranscriptPluginView *)v4 imageView];
    double v7 = [v6 image];

    if (!v7) {
      [(CKTranscriptPluginView *)v5 setNeedsLayout];
    }
  }
}

- (void)playbackWithCompletionBlock:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  unsigned __int8 v5 = [(HWAbstractBalloonController *)self datasourceIsFromMe];
  double v6 = [(HWBalloonController *)self pluginContentView];
  double v7 = v6;
  if (v5)
  {
    [v6 cleanupAfterAnimation];
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_16534;
    v8[3] = &unk_28620;
    double v9 = v4;
    [v7 replayDrawingWithCompletionBlock:v8];
  }
}

- (void)cancelPlayback
{
  id v2 = [(HWBalloonController *)self pluginContentView];
  [v2 cleanupAfterAnimation];
}

- (void)setPluginContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end