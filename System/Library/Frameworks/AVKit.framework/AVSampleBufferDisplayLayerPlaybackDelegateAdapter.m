@interface AVSampleBufferDisplayLayerPlaybackDelegateAdapter
+ (id)playbackDelegateAdapterWithDelegate:(id)a3;
- ($B1B40AE7B40192423BFE885F22139C9A)pictureInPictureControllerTimeRangeForPlayback:(SEL)a3;
- (AVPictureInPictureSampleBufferPlaybackDelegate)playbackDelegate;
- (BOOL)pictureInPictureControllerIsPlaybackPaused:(id)a3;
- (void)pictureInPictureController:(id)a3 didTransitionToRenderSize:(id)a4;
- (void)pictureInPictureController:(id)a3 setPlaying:(BOOL)a4;
- (void)pictureInPictureController:(id)a3 skipByInterval:(id *)a4 completionHandler:(id)a5;
@end

@implementation AVSampleBufferDisplayLayerPlaybackDelegateAdapter

+ (id)playbackDelegateAdapterWithDelegate:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AVSampleBufferDisplayLayerPlaybackDelegateAdapter;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v7, sel_alloc);
  v5 = (id *)objc_msgSend(v4, "init", v7.receiver, v7.super_class);
  objc_storeWeak(v5 + 1, v3);

  return v5;
}

- (void).cxx_destruct
{
}

- (AVPictureInPictureSampleBufferPlaybackDelegate)playbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDelegate);

  return (AVPictureInPictureSampleBufferPlaybackDelegate *)WeakRetained;
}

- (void)pictureInPictureController:(id)a3 skipByInterval:(id *)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  [v10 pictureInPictureController:v9 skipByInterval:&v11 completionHandler:v8];
}

- (void)pictureInPictureController:(id)a3 didTransitionToRenderSize:(id)a4
{
  id v6 = a3;
  id v7 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  [v7 pictureInPictureController:v6 didTransitionToRenderSize:a4];
}

- (BOOL)pictureInPictureControllerIsPlaybackPaused:(id)a3
{
  id v4 = a3;
  v5 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  id v8 = v7;
  if (v6) {
    char v9 = [v7 pictureInPictureControllerPlaybackPaused:v4];
  }
  else {
    char v9 = [v7 pictureInPictureControllerIsPlaybackPaused:v4];
  }
  BOOL v10 = v9;

  return v10;
}

- ($B1B40AE7B40192423BFE885F22139C9A)pictureInPictureControllerTimeRangeForPlayback:(SEL)a3
{
  id v6 = a4;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  id v7 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
    BOOL v10 = v11;
    if (v11)
    {
      [v11 pictureInPictureControllerTimeRangeForPlayback:v6];
      goto LABEL_7;
    }
LABEL_6:
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    goto LABEL_7;
  }
  char v9 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  BOOL v10 = v9;
  if (!v9) {
    goto LABEL_6;
  }
  [v9 pictureInPictureControllerPlaybackTimeRange:v6];
LABEL_7:
  *(_OWORD *)&retstr->var0.var0 = v13;
  *(_OWORD *)&retstr->var0.var3 = v14;
  *(_OWORD *)&retstr->var1.var1 = v15;

  return result;
}

- (void)pictureInPictureController:(id)a3 setPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  char v7 = objc_opt_respondsToSelector();

  char v8 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  char v9 = objc_opt_respondsToSelector();

  BOOL v10 = [(AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self playbackDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = v10;
  if (v7 & 1) != 0 || (v9)
  {
    if (v4)
    {
      if (v7) {
        [v10 pictureInPictureControllerStartPlayback:v12];
      }
    }
    else if (v9)
    {
      [v10 pictureInPictureControllerStopPlayback:v12];
    }
  }
  else
  {
    [v10 pictureInPictureController:v12 setPlaying:v4];
  }
}

@end