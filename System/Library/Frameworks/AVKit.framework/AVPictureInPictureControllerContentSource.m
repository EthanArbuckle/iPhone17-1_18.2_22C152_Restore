@interface AVPictureInPictureControllerContentSource
+ (int64_t)version;
- (AVPictureInPictureContentSource)_activeVideoCallContentViewController;
- (AVPictureInPictureContentSource)source;
- (AVPictureInPictureContentViewController)activeContentViewController;
- (AVPictureInPictureControllerContentSource)init;
- (AVPictureInPictureControllerContentSource)initWithActiveVideoCallSourceView:(UIView *)sourceView contentViewController:(AVPictureInPictureVideoCallViewController *)contentViewController;
- (AVPictureInPictureControllerContentSource)initWithPlayerLayer:(AVPlayerLayer *)playerLayer;
- (AVPictureInPictureControllerContentSource)initWithSampleBufferDisplayLayer:(AVSampleBufferDisplayLayer *)sampleBufferDisplayLayer playbackDelegate:(id)playbackDelegate;
- (AVPictureInPictureControllerContentSource)initWithSampleBufferDisplayLayer:(id)a3 initialRenderSize:(CGSize)a4 playbackDelegate:(id)a5;
- (AVPictureInPictureControllerContentSource)initWithSourceView:(id)a3 contentViewController:(id)a4 playerController:(id)a5;
- (AVPlayerLayer)playerLayer;
- (AVSampleBufferDisplayLayer)sampleBufferDisplayLayer;
- (BOOL)hasInitialRenderSize;
- (CGSize)initialRenderSize;
- (UIView)activeSourceView;
- (id)_activeVideoCallSourceView;
- (id)sampleBufferPlaybackDelegate;
- (void)dealloc;
@end

@implementation AVPictureInPictureControllerContentSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeVideoCallContentViewController, 0);
  objc_destroyWeak(&self->__activeVideoCallSourceView);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_activeContentViewController, 0);
  objc_destroyWeak((id *)&self->_activeSourceView);
  objc_storeStrong((id *)&self->_sampleBufferPlaybackDelegate, 0);

  objc_storeStrong((id *)&self->_sampleBufferDisplayLayer, 0);
}

- (BOOL)hasInitialRenderSize
{
  return self->_hasInitialRenderSize;
}

- (AVPictureInPictureContentSource)_activeVideoCallContentViewController
{
  return self->__activeVideoCallContentViewController;
}

- (id)_activeVideoCallSourceView
{
  id WeakRetained = objc_loadWeakRetained(&self->__activeVideoCallSourceView);

  return WeakRetained;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)dealloc
{
  v3 = [(AVPictureInPictureControllerContentSource *)self sampleBufferDisplayLayer];
  objc_msgSend(v3, "avkit_removePictureInPicturePlayerController");

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureControllerContentSource;
  [(AVPictureInPictureControllerContentSource *)&v4 dealloc];
}

- (AVPictureInPictureContentSource)source
{
  v3 = [(AVPictureInPictureControllerContentSource *)self sampleBufferDisplayLayer];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(AVPictureInPictureControllerContentSource *)self playerLayer];
    v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      v8 = [(AVPictureInPictureControllerContentSource *)self _activeVideoCallContentViewController];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(AVPictureInPictureControllerContentSource *)self activeContentViewController];
      }
      id v5 = v10;
    }
  }

  return (AVPictureInPictureContentSource *)v5;
}

- (AVPictureInPictureControllerContentSource)initWithPlayerLayer:(AVPlayerLayer *)playerLayer
{
  id v5 = playerLayer;
  v9.receiver = self;
  v9.super_class = (Class)AVPictureInPictureControllerContentSource;
  v6 = [(AVPictureInPictureControllerContentSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playerLayer, playerLayer);
  }

  return v7;
}

- (AVPictureInPictureControllerContentSource)init
{
  return [(AVPictureInPictureControllerContentSource *)self initWithPlayerLayer:0];
}

+ (int64_t)version
{
  return 2;
}

- (AVPictureInPictureControllerContentSource)initWithActiveVideoCallSourceView:(UIView *)sourceView contentViewController:(AVPictureInPictureVideoCallViewController *)contentViewController
{
  v6 = sourceView;
  v7 = contentViewController;
  v11.receiver = self;
  v11.super_class = (Class)AVPictureInPictureControllerContentSource;
  v8 = [(AVPictureInPictureControllerContentSource *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->__activeVideoCallSourceView, v6);
    objc_storeStrong((id *)&v9->__activeVideoCallContentViewController, contentViewController);
  }

  return v9;
}

- (CGSize)initialRenderSize
{
  double width = self->_initialRenderSize.width;
  double height = self->_initialRenderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (AVPictureInPictureControllerContentSource)initWithSampleBufferDisplayLayer:(id)a3 initialRenderSize:(CGSize)a4 playbackDelegate:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVPictureInPictureControllerContentSource;
  v12 = [(AVPictureInPictureControllerContentSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_initialRenderSize.CGFloat width = width;
    v12->_initialRenderSize.CGFloat height = height;
    objc_storeStrong((id *)&v12->_sampleBufferDisplayLayer, a3);
    objc_storeStrong((id *)&v13->_sampleBufferPlaybackDelegate, a5);
    v13->_hasInitialRenderSize = 1;
  }

  return v13;
}

- (AVPictureInPictureContentViewController)activeContentViewController
{
  return self->_activeContentViewController;
}

- (UIView)activeSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeSourceView);

  return (UIView *)WeakRetained;
}

- (AVPictureInPictureControllerContentSource)initWithSourceView:(id)a3 contentViewController:(id)a4 playerController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVPictureInPictureControllerContentSource;
  id v11 = [(AVPictureInPictureControllerContentSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_activeSourceView, v8);
    objc_storeStrong((id *)&v12->_activeContentViewController, a4);
    [v9 setPlayerController:v10];
  }

  return v12;
}

- (id)sampleBufferPlaybackDelegate
{
  return self->_sampleBufferPlaybackDelegate;
}

- (AVSampleBufferDisplayLayer)sampleBufferDisplayLayer
{
  return self->_sampleBufferDisplayLayer;
}

- (AVPictureInPictureControllerContentSource)initWithSampleBufferDisplayLayer:(AVSampleBufferDisplayLayer *)sampleBufferDisplayLayer playbackDelegate:(id)playbackDelegate
{
  v7 = sampleBufferDisplayLayer;
  id v8 = playbackDelegate;
  v12.receiver = self;
  v12.super_class = (Class)AVPictureInPictureControllerContentSource;
  id v9 = [(AVPictureInPictureControllerContentSource *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sampleBufferDisplayLayer, sampleBufferDisplayLayer);
    objc_storeStrong((id *)&v10->_sampleBufferPlaybackDelegate, playbackDelegate);
  }

  return v10;
}

@end