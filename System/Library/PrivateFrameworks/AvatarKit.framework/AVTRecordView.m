@interface AVTRecordView
+ (BOOL)usesInternalTrackingPipeline;
+ (void)setUsesInternalTrackingPipeline:(BOOL)a3;
- (AVTRecordView)init;
- (AVTRecordView)initWithCoder:(id)a3;
- (AVTRecordView)initWithFrame:(CGRect)a3;
- (AVTRecordView)initWithFrame:(CGRect)a3 options:(id)a4;
- (AVTRecordViewDelegate)recordDelegate;
- (BOOL)allowTrackSmoothing;
- (BOOL)disableRendering;
- (BOOL)exportMovieToURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)faceIsFullyActive;
- (BOOL)isDoubleBuffered;
- (BOOL)isPreviewing;
- (BOOL)isRecording;
- (BOOL)mergeAudio:(id)a3 andVideoTo:(id)a4 error:(id *)a5;
- (BOOL)mute;
- (BOOL)playBakedAnimation;
- (BOOL)recording;
- (double)_renderer:(id)a3 inputTimeForCurrentFrameWithTime:(double)a4;
- (double)currentAudioTime;
- (double)finalVideoDuration;
- (double)recordingDuration;
- (float)maxRecordingDuration;
- (id)_tmpAudioURL;
- (id)_tmpMaskVideoURL;
- (id)_tmpVideoURL;
- (id)faceTrackingRecordingURL;
- (int64_t)preferredFramesPerSecond;
- (opaqueCMSampleBuffer)createSilentAudioAtFrame:(int64_t)a3 nFrames:(int)a4 sampleRate:(double)a5 numChannels:(int)a6;
- (void)_avt_commonInit;
- (void)_didLostTrackingForAWhile;
- (void)_drawAtTime:(double)a3;
- (void)_playLivePreviewAnimation;
- (void)_processInfoThermalStateDidChange:(id)a3;
- (void)_renderer:(id)a3 updateAtTime:(double)a4;
- (void)_setEffectivePreferredFramesPerSecond;
- (void)_smoothRecordedData;
- (void)_updateFrameRateForThermalState:(int64_t)a3;
- (void)_updateTrackingState;
- (void)addRecordedAnimationToAvatar:(id)a3;
- (void)audioPlayerItemDidReachEnd:(id)a3;
- (void)audioSessionDidInterrupt:(id)a3;
- (void)avatarDidChange;
- (void)cancelRecording;
- (void)cancelRecordingAudio;
- (void)convertRecordedDataToAnimationGroup;
- (void)dealloc;
- (void)drawableNotAvailableForTime:(double)a3;
- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5;
- (void)faceTracker:(id)a3 session:(id)a4 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4;
- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4;
- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4;
- (void)fadePuppetToWhite:(float)a3;
- (void)finalizeAudioFile;
- (void)playPreviewOnce;
- (void)removeRecordedAnimationFromAvatar:(id)a3;
- (void)setAvatar:(id)a3;
- (void)setDisableRendering:(BOOL)a3;
- (void)setFaceTrackingPaused:(BOOL)a3;
- (void)setFaceTrackingRecordingURL:(id)a3;
- (void)setMaxRecordingDuration:(float)a3;
- (void)setMute:(BOOL)a3;
- (void)setPlayBakedAnimation:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setRecordDelegate:(id)a3;
- (void)startPlayingAudio;
- (void)startPreviewing;
- (void)startRecording;
- (void)startRecordingAudio;
- (void)stopPlayingAudio;
- (void)stopPreviewing;
- (void)stopRecording;
- (void)stopRecordingAudio;
- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6;
- (void)trimRecordedData;
- (void)updateAudioState;
- (void)updateForChangedFaceTrackingPaused;
- (void)updateMuteState;
@end

@implementation AVTRecordView

+ (BOOL)usesInternalTrackingPipeline
{
  return +[AVTFaceTracker usesInternalTrackingPipeline];
}

+ (void)setUsesInternalTrackingPipeline:(BOOL)a3
{
}

- (void)_avt_commonInit
{
}

- (AVTRecordView)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVTRecordView;
  v2 = [(AVTRecordView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AVTRecordView *)v2 _avt_commonInit];
  }
  return v3;
}

- (AVTRecordView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTRecordView;
  v3 = [(AVTView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AVTRecordView *)v3 _avt_commonInit];
  }
  return v4;
}

- (AVTRecordView)initWithFrame:(CGRect)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVTRecordView;
  v4 = -[AVTView initWithFrame:options:](&v7, sel_initWithFrame_options_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v5 = v4;
  if (v4) {
    [(AVTRecordView *)v4 _avt_commonInit];
  }
  return v5;
}

- (AVTRecordView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTRecordView;
  v3 = -[AVTView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AVTRecordView *)v3 _avt_commonInit];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F08458] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AVTRecordView;
  [(AVTView *)&v4 dealloc];
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond_user;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond_user = a3;
  [(AVTRecordView *)self _setEffectivePreferredFramesPerSecond];
}

- (void)_setEffectivePreferredFramesPerSecond
{
  int64_t preferredFramesPerSecond_thermal = self->_preferredFramesPerSecond_thermal;
  int64_t preferredFramesPerSecond_user = self->_preferredFramesPerSecond_user;
  if (preferredFramesPerSecond_thermal)
  {
    if (preferredFramesPerSecond_user)
    {
      if (preferredFramesPerSecond_user < preferredFramesPerSecond_thermal) {
        int64_t preferredFramesPerSecond_thermal = self->_preferredFramesPerSecond_user;
      }
      -[AVTRecordView setPreferredFramesPerSecond:](&v6, sel_setPreferredFramesPerSecond_, preferredFramesPerSecond_thermal, v4.receiver, v4.super_class, v5.receiver, v5.super_class, self, AVTRecordView);
    }
    else
    {
      -[AVTRecordView setPreferredFramesPerSecond:](&v5, sel_setPreferredFramesPerSecond_, preferredFramesPerSecond_thermal, v4.receiver, v4.super_class, self, AVTRecordView, v6.receiver, v6.super_class);
    }
  }
  else
  {
    -[AVTRecordView setPreferredFramesPerSecond:](&v4, sel_setPreferredFramesPerSecond_, preferredFramesPerSecond_user, self, AVTRecordView, v5.receiver, v5.super_class, v6.receiver, v6.super_class);
  }
}

- (void)_updateFrameRateForThermalState:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  if (([v5 BOOLForKey:@"avatarKit.disableThermalDrivenFPS"] & 1) == 0)
  {
    if ((unint64_t)a3 <= 3) {
      self->_int64_t preferredFramesPerSecond_thermal = qword_20B890700[a3];
    }
    [(AVTRecordView *)self _setEffectivePreferredFramesPerSecond];
  }
}

- (void)_processInfoThermalStateDidChange:(id)a3
{
  id v4 = [a3 object];
  -[AVTRecordView _updateFrameRateForThermalState:](self, "_updateFrameRateForThermalState:", [v4 thermalState]);
}

- (id)faceTrackingRecordingURL
{
  v2 = [(AVTView *)self faceTracker];
  v3 = [v2 faceTrackingRecordingURL];

  return v3;
}

- (void)setFaceTrackingRecordingURL:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTView *)self faceTracker];
  [v5 setFaceTrackingRecordingURL:v4];
}

- (void)faceTracker:(id)a3 session:(id)a4 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  [(NSLock *)self->_audioLock lock];
  if (self->_audioWriterInput)
  {
    p_currentAudioTime = &self->_currentAudioTime;
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&v10, a5);
    self->_currentAudioTime = v10;
    if (!self->_audioIsRecording)
    {
      audioWriter = self->_audioWriter;
      *(_OWORD *)&v10.value = *(_OWORD *)&p_currentAudioTime->value;
      v10.int64_t epoch = self->_currentAudioTime.epoch;
      [(AVAssetWriter *)audioWriter startSessionAtSourceTime:&v10];
      int64_t epoch = self->_currentAudioTime.epoch;
      *(_OWORD *)&self->_startAudioTime.value = *(_OWORD *)&p_currentAudioTime->value;
      self->_startAudioTime.int64_t epoch = epoch;
      self->_audioIsRecording = 1;
    }
    if ([(AVAssetWriterInput *)self->_audioWriterInput isReadyForMoreMediaData])
    {
      self->_recordedSampleCount += CMSampleBufferGetNumSamples(a5);
      [(AVAssetWriterInput *)self->_audioWriterInput appendSampleBuffer:a5];
    }
  }
  [(NSLock *)self->_audioLock unlock];
}

- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  v8 = [(AVTRecordView *)self recordDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    $95D729B680665BEAEFA1D6FCA8238556 v10 = [(AVTRecordView *)self recordDelegate];
    [v10 recordView:self session:v14 didFailWithError:v7];
  }
  v11 = [(AVTView *)self faceTrackingDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AVTView *)self faceTrackingDelegate];
    [v13 avatarView:self faceTrackingSessionFailedWithError:v7];
  }
}

- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4
{
  id v11 = a4;
  id v5 = [(AVTRecordView *)self recordDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVTRecordView *)self recordDelegate];
    [v7 recordView:self sessionWasInterrupted:v11];
  }
  v8 = [(AVTView *)self faceTrackingDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    $95D729B680665BEAEFA1D6FCA8238556 v10 = [(AVTView *)self faceTrackingDelegate];
    [v10 avatarViewFaceTrackingSessionInterruptionDidBegin:self];
  }
}

- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4
{
  id v11 = a4;
  id v5 = [(AVTRecordView *)self recordDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVTRecordView *)self recordDelegate];
    [v7 recordView:self sessionInterruptionEnded:v11];
  }
  v8 = [(AVTView *)self faceTrackingDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    $95D729B680665BEAEFA1D6FCA8238556 v10 = [(AVTView *)self faceTrackingDelegate];
    [v10 avatarViewFaceTrackingSessionInterruptionDidEnd:self];
  }
}

- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AVTRecordView;
  [(AVTView *)&v26 faceTrackerDidUpdate:v6 withARFrame:a4];
  if (!self->_exportingMovie)
  {
    BOOL v7 = [v6 faceIsTracked]
      && !self->_exportingMovie
      && ![(AVTView *)self faceTrackingIsPaused];
    [(AVTView *)self setRendersContinuously:v7];
    if (self->_recording)
    {
      if (self->_recordedCount >= self->_recordingCapacity)
      {
        [(AVTRecordView *)self stopRecording];
      }
      else
      {
        v8 = [v6 faceTrackingInfo];
        uint64_t v9 = [v8 trackingData];
        [(NSMutableData *)self->_rawTimesData increaseLengthBy:8];
        uint64_t v10 = *(void *)v9;
        *(void *)([(NSMutableData *)self->_rawTimesData mutableBytes] + 8 * self->_recordedCount) = v10;
        [(NSMutableData *)self->_rawBlendShapesData increaseLengthBy:204];
        id v11 = [(NSMutableData *)self->_rawBlendShapesData mutableBytes] + 204 * self->_recordedCount;
        _OWORD *v11 = *(_OWORD *)(v9 + 256);
        long long v12 = *(_OWORD *)(v9 + 400);
        long long v13 = *(_OWORD *)(v9 + 416);
        long long v14 = *(_OWORD *)(v9 + 432);
        *(_OWORD *)((char *)v11 + 188) = *(_OWORD *)(v9 + 444);
        v11[10] = v13;
        v11[11] = v14;
        v11[9] = v12;
        long long v15 = *(_OWORD *)(v9 + 336);
        long long v16 = *(_OWORD *)(v9 + 352);
        long long v17 = *(_OWORD *)(v9 + 384);
        v11[7] = *(_OWORD *)(v9 + 368);
        v11[8] = v17;
        v11[5] = v15;
        v11[6] = v16;
        long long v18 = *(_OWORD *)(v9 + 272);
        long long v19 = *(_OWORD *)(v9 + 288);
        long long v20 = *(_OWORD *)(v9 + 320);
        v11[3] = *(_OWORD *)(v9 + 304);
        v11[4] = v20;
        v11[1] = v18;
        v11[2] = v19;
        [(NSMutableData *)self->_rawTransformsData increaseLengthBy:64];
        v21 = [(NSMutableData *)self->_rawTransformsData mutableBytes]
            + ((uint64_t)self->_recordedCount << 6);
        [v6 rawTransform];
        _OWORD *v21 = v22;
        v21[1] = v23;
        v21[2] = v24;
        v21[3] = v25;
        [(NSMutableData *)self->_rawParametersData increaseLengthBy:4];
        *(_DWORD *)([(NSMutableData *)self->_rawParametersData mutableBytes]
                  + 4 * self->_recordedCount++) = *(_DWORD *)(v9 + 464);
      }
    }
  }
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  uint64_t v10 = (void (**)(void))a6;
  if (!self->_exportingMovie && !self->_playing)
  {
    v12.receiver = self;
    v12.super_class = (Class)AVTRecordView;
    [(AVTView *)&v12 transitionToFaceTrackingWithDuration:a4 style:v6 enableBakedAnimations:v10 completionHandler:a3];
    goto LABEL_9;
  }
  id v11 = [(AVTView *)self avatar];
  [v11 setPose:0];

  if ([(AVTView *)self enableFaceTracking])
  {
    [(AVTRecordView *)self setFaceTrackingPaused:0];
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [(AVTView *)self setEnableFaceTracking:1];
  if (v10) {
LABEL_7:
  }
    v10[2](v10);
LABEL_9:
}

- (void)_didLostTrackingForAWhile
{
  v3 = [(AVTRecordView *)self recordDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVTRecordView *)self recordDelegate];
    [v5 recordViewDidLostTrackingWhileRecording:self];
  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  id v6 = a3;
  if ([(AVTRecordView *)self isPreviewing])
  {
    audioPlayer = self->_audioPlayer;
    if (audioPlayer) {
      [(AVPlayer *)audioPlayer currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v8 = fmax(CMTimeGetSeconds(&time), 0.0);
    if (self->_lastAudioPlayerTime != v8 || v8 == 0.0)
    {
      uint64_t v9 = self->_audioPlayer;
      if (v9) {
        [(AVPlayer *)v9 currentTime];
      }
      else {
        memset(&v10, 0, sizeof(v10));
      }
      self->_lastAudioPlayerTime = CMTimeGetSeconds(&v10);
      self->_lastAudioSystemTime = CACurrentMediaTime();
    }
    else
    {
      double v8 = v8 + CACurrentMediaTime() - self->_lastAudioSystemTime;
    }
    objc_msgSend(v6, "setSceneTime:", v8, v10.value, *(void *)&v10.timescale, v10.epoch, time.value, *(void *)&time.timescale, time.epoch);
  }
  [(AVTView *)self updateAtTime:a4];
}

- (double)_renderer:(id)a3 inputTimeForCurrentFrameWithTime:(double)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if (!self->_playing && !self->_exportingMovie)
  {
    [(AVTView *)self currentlyRenderedTrackingDate];
    if (v8 == 0.0) {
      double v7 = a4;
    }
    else {
      double v7 = v8;
    }
  }

  return v7;
}

- (BOOL)allowTrackSmoothing
{
  return !self->_transitioningFromSnapshot;
}

- (void)setAvatar:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)AVTRecordView;
  [(AVTView *)&v5 setAvatar:v4];

  kdebug_trace();
}

- (void)avatarDidChange
{
  [(AVTView *)self lockAvatar];
  [(AVTRecordView *)self convertRecordedDataToAnimationGroup];
  v3 = [(AVTView *)self environment];
  id v4 = [(AVTView *)self avatar];
  objc_super v5 = [(AVTView *)self presentationConfiguration];
  [v3 avatarDidChange:v4 presentationConfiguration:v5];

  if (!self->_recordedAnimationGroup) {
    self->_referenceAnimationBeginTime = CACurrentMediaTime();
  }
  id v6 = [(AVTView *)self avatar];
  [v6 setBakedAnimationReferenceTime:self->_referenceAnimationBeginTime];

  [(AVTView *)self unlockAvatar];
}

- (void)startRecording
{
  [(AVTView *)self lockAvatar];
  self->_playing = 0;
  int v3 = (int)(float)(self->_maxRecordingDuration * 60.0);
  self->_recordingCapacity = v3;
  id v4 = [MEMORY[0x263EFF990] dataWithCapacity:8 * v3];
  rawTimesData = self->_rawTimesData;
  self->_rawTimesData = v4;

  id v6 = [MEMORY[0x263EFF990] dataWithCapacity:204 * self->_recordingCapacity];
  rawBlendShapesData = self->_rawBlendShapesData;
  self->_rawBlendShapesData = v6;

  double v8 = [MEMORY[0x263EFF990] dataWithCapacity:(uint64_t)self->_recordingCapacity << 6];
  rawTransformsData = self->_rawTransformsData;
  self->_rawTransformsData = v8;

  CMTime v10 = [MEMORY[0x263EFF990] dataWithCapacity:4 * self->_recordingCapacity];
  rawParametersData = self->_rawParametersData;
  self->_rawParametersData = v10;

  self->_recording = 1;
  self->_recordingStartTime = CACurrentMediaTime();
  self->_recordedCount = 0;
  recordedAnimationGroup = self->_recordedAnimationGroup;
  self->_recordedAnimationGroup = 0;

  long long v13 = [(AVTView *)self faceTracker];
  [v13 startRecording];

  [(AVTRecordView *)self cancelRecordingAudio];
  [(AVTRecordView *)self startRecordingAudio];
  [(AVTView *)self unlockAvatar];
}

- (void)cancelRecording
{
  [(AVTView *)self lockAvatar];
  rawTimesData = self->_rawTimesData;
  self->_rawTimesData = 0;

  rawBlendShapesData = self->_rawBlendShapesData;
  self->_rawBlendShapesData = 0;

  rawTransformsData = self->_rawTransformsData;
  self->_rawTransformsData = 0;

  rawParametersData = self->_rawParametersData;
  self->_rawParametersData = 0;

  self->_recording = 0;
  self->_recordedCount = 0;
  recordedAnimationGroup = self->_recordedAnimationGroup;
  self->_recordedAnimationGroup = 0;

  double v8 = [(AVTView *)self faceTracker];
  [v8 stopRecording];

  [(AVTRecordView *)self cancelRecordingAudio];
  [(AVTView *)self unlockAvatar];
}

- (void)_smoothRecordedData
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20B819000, v0, v1, "Error: [Record view] CVAFaceTrackingPostProcessRecordingExt failed with error code %d", v2, v3, v4, v5, v6);
}

- (void)stopRecording
{
  [(AVTView *)self lockAvatar];
  if (self->_recording)
  {
    self->_recording = 0;
    uint64_t v3 = [(AVTView *)self faceTracker];
    [v3 stopRecording];

    [(AVTRecordView *)self stopRecordingAudio];
    [(AVTRecordView *)self trimRecordedData];
    [(AVTRecordView *)self finalizeAudioFile];
    [(AVTRecordView *)self _smoothRecordedData];
    [(AVTRecordView *)self convertRecordedDataToAnimationGroup];
  }
  [(AVTView *)self unlockAvatar];
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)addRecordedAnimationToAvatar:(id)a3
{
  id v11 = a3;
  [v11 pauseBakedAnimation];
  uint64_t v4 = self->_recordedAnimationGroup;
  uint64_t v5 = [v11 bakedAnimationCopy];
  uint8_t v6 = v5;
  if (v5)
  {
    [v5 setUsesSceneTimeBase:1];
    [v6 setBeginTime:0.0];
    [v6 setTimeOffset:self->_recordingStartTime - self->_referenceAnimationBeginTime];
    double v7 = (CAAnimationGroup *)[(CAAnimationGroup *)v4 copy];

    double v8 = [(CAAnimationGroup *)v7 animations];
    uint64_t v9 = [v8 arrayByAddingObject:v6];
    [(CAAnimationGroup *)v7 setAnimations:v9];

    uint64_t v4 = v7;
  }
  CMTime v10 = [v11 avatarNode];
  [v10 addAnimation:v4 forKey:@"livePreview"];
}

- (void)removeRecordedAnimationFromAvatar:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [v4 avatarNode];
  [v3 removeAnimationForKey:@"livePreview"];

  [v4 resumeBakedAnimation];
}

- (void)_playLivePreviewAnimation
{
  id v6 = [(AVTView *)self avatar];
  uint64_t v3 = [(AVTView *)self environment];
  int v4 = [v3 showReticle];

  if (v4)
  {
    uint64_t v5 = [(AVTView *)self environment];
    [v5 setShowReticle:0];

    [(AVTView *)self setFaceIsTracked:1];
  }
  [(AVTRecordView *)self addRecordedAnimationToAvatar:v6];
}

- (void)startPreviewing
{
  [(AVTView *)self lockAvatar];
  self->_playing = 1;
  [(AVTRecordView *)self _playLivePreviewAnimation];
  [(AVTRecordView *)self updateAudioState];
  [(AVTRecordView *)self _updateTrackingState];
  [(AVTView *)self unlockAvatar];
  uint64_t v3 = [(AVTRecordView *)self recordDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVTRecordView *)self recordDelegate];
    [v5 recordView:self previewDidChangeStatus:0];
  }
}

- (void)playPreviewOnce
{
  if (self->_playing)
  {
    uint64_t v3 = [(AVTRecordView *)self recordDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(AVTRecordView *)self recordDelegate];
      [v5 recordView:self previewDidChangeStatus:1];
    }
    [(AVTView *)self lockAvatar];
    [(AVTRecordView *)self _playLivePreviewAnimation];
    [(AVTRecordView *)self stopPlayingAudio];
    [(AVTRecordView *)self startPlayingAudio];
    [(AVTRecordView *)self _updateTrackingState];
    [(AVTView *)self unlockAvatar];
    id v6 = [(AVTRecordView *)self recordDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(AVTRecordView *)self recordDelegate];
      [v8 recordView:self previewDidChangeStatus:0];
    }
  }
  else
  {
    [(AVTRecordView *)self startPreviewing];
  }
}

- (void)stopPreviewing
{
  [(AVTView *)self lockAvatar];
  self->_playing = 0;
  id v6 = [(AVTView *)self avatar];
  -[AVTRecordView removeRecordedAnimationFromAvatar:](self, "removeRecordedAnimationFromAvatar:");
  [(AVTRecordView *)self updateAudioState];
  [(AVTRecordView *)self stopPlayingAudio];
  [(AVTRecordView *)self _updateTrackingState];
  [(AVTView *)self unlockAvatar];
  uint64_t v3 = [(AVTRecordView *)self recordDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVTRecordView *)self recordDelegate];
    [v5 recordView:self previewDidChangeStatus:1];
  }
}

- (BOOL)isPreviewing
{
  return self->_playing;
}

- (BOOL)playBakedAnimation
{
  return self->_playBakedAnimation;
}

- (void)setPlayBakedAnimation:(BOOL)a3
{
  if (self->_playBakedAnimation != a3)
  {
    self->_playBakedAnimation = a3;
    [(AVTRecordView *)self _updateTrackingState];
  }
}

- (BOOL)disableRendering
{
  return self->_disableRendering;
}

- (void)setDisableRendering:(BOOL)a3
{
  if (self->_disableRendering != a3)
  {
    BOOL v3 = a3;
    self->_disableRendering = a3;
    id v5 = [(AVTRecordView *)self scene];
    char v4 = [v5 rootNode];
    [v4 setHidden:v3];
  }
}

- (void)_updateTrackingState
{
  if (self->_playBakedAnimation
    || [(AVTView *)self faceTrackingIsPaused]
    || self->_playing
    || self->_exportingMovie)
  {
    id v3 = [(AVTView *)self faceTracker];
    [v3 pauseByPausingARSession];
  }
  else
  {
    id v3 = [(AVTView *)self faceTracker];
    [v3 run];
  }
}

- (void)setFaceTrackingPaused:(BOOL)a3
{
  if (!self->_playing)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVTRecordView;
    [(AVTView *)&v3 setFaceTrackingPaused:a3];
  }
}

- (void)updateForChangedFaceTrackingPaused
{
  BOOL v3 = [(AVTView *)self faceTrackingIsPaused];
  char v4 = [(AVTRecordView *)self scene];
  [v4 setPaused:v3];

  [(AVTRecordView *)self _updateTrackingState];
}

- (BOOL)faceIsFullyActive
{
  uint64_t v2 = [(AVTView *)self environment];
  char v3 = [v2 faceIsFullyVisible];

  return v3;
}

- (void)trimRecordedData
{
  char v3 = [(NSMutableData *)self->_rawTimesData mutableBytes];
  char v4 = [(NSMutableData *)self->_rawBlendShapesData mutableBytes];
  id v5 = [(NSMutableData *)self->_rawTransformsData mutableBytes];
  id v6 = [(NSMutableData *)self->_rawParametersData mutableBytes];
  CMTime time = (CMTime)self->_startAudioTime;
  double Seconds = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)self->_stopAudioTime;
  double v8 = CMTimeGetSeconds(&time);
  uint64_t recordedCount = self->_recordedCount;
  if ((int)recordedCount < 1)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    uint64_t v10 = 0;
    while (v3[v10] <= Seconds)
    {
      if (recordedCount == ++v10)
      {
        LODWORD(v10) = self->_recordedCount;
        goto LABEL_12;
      }
    }
  }
  if ((int)v10 >= (int)recordedCount)
  {
LABEL_12:
    uint64_t v11 = v10;
    LODWORD(recordedCount) = v10;
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = v10;
    while (v3[v12] <= v8)
    {
      if ((int)recordedCount <= (int)++v12) {
        goto LABEL_14;
      }
    }
    LODWORD(recordedCount) = v12;
  }
LABEL_14:
  int v13 = recordedCount - v10;
  self->_uint64_t recordedCount = v13;
  size_t v14 = 8 * v13;
  memmove(v3, &v3[v11], v14);
  [(NSMutableData *)self->_rawTimesData setLength:v14];
  size_t v15 = 204 * self->_recordedCount;
  memmove(v4, &v4[4 * (51 * v10)], v15);
  [(NSMutableData *)self->_rawBlendShapesData setLength:v15];
  size_t v16 = (uint64_t)self->_recordedCount << 6;
  memmove(v5, &v5[64 * v11], v16);
  [(NSMutableData *)self->_rawTransformsData setLength:v16];
  size_t v17 = 4 * self->_recordedCount;
  memmove(v6, &v6[4 * v11], v17);
  [(NSMutableData *)self->_rawParametersData setLength:v17];
}

- (double)recordingDuration
{
  char v3 = [(NSMutableData *)self->_rawTimesData mutableBytes];
  int recordedCount = self->_recordedCount;
  if (recordedCount <= 1) {
    int recordedCount = 1;
  }
  return v3[recordedCount - 1] - *v3;
}

- (double)finalVideoDuration
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(AVTRecordView *)self recordingDuration];
  double v3 = v2 + 0.25;
  *(float *)&double v2 = (v2 + 0.25) * 60.0;
  unint64_t v4 = vcvtps_u32_f32(*(float *)&v2);
  id v5 = avt_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = v3;
    int v8 = 134218752;
    double v9 = (float)((float)v4 / 60.0);
    __int16 v10 = 1024;
    int v11 = v4;
    __int16 v12 = 1024;
    int v13 = 60;
    __int16 v14 = 2048;
    double v15 = v6;
    _os_log_impl(&dword_20B819000, v5, OS_LOG_TYPE_DEFAULT, "[Record view] Final video duration: %.3fs (for %d frames at %dfps ; exact duration: %.3fs)",
      (uint8_t *)&v8,
      0x22u);
  }

  return (float)((float)v4 / 60.0);
}

- (void)convertRecordedDataToAnimationGroup
{
  double v3 = [(NSMutableData *)self->_rawTimesData mutableBytes];
  unint64_t v4 = [(NSMutableData *)self->_rawBlendShapesData mutableBytes];
  id v5 = [(NSMutableData *)self->_rawTransformsData mutableBytes];
  float v6 = [(NSMutableData *)self->_rawParametersData mutableBytes];
  if (self->_recordedCount)
  {
    char v7 = v6;
    [(AVTRecordView *)self recordingDuration];
    if (v8 > 0.0)
    {
      double v9 = v8;
      v72 = v4;
      v68 = v5;
      uint64_t v10 = self->_recordedCount + 1;
      id v71 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v74 = v10;
      int v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
      __int16 v12 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
      if (self->_recordedCount > 1)
      {
        uint64_t v13 = 0;
        do
        {
          [v11 addObject:v12];
          ++v13;
        }
        while (v13 < self->_recordedCount - 1);
      }
      double v14 = v9 + 0.25;
      double v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      [v11 addObject:v15];

      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v74];
      if (self->_recordedCount >= 1)
      {
        uint64_t v17 = 0;
        do
        {
          long long v18 = [NSNumber numberWithDouble:(v3[v17] - *v3) / v14];
          [v16 addObject:v18];

          ++v17;
        }
        while (v17 < self->_recordedCount);
      }
      [v16 addObject:&unk_26C064D28];
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke;
      v87[3] = &__block_descriptor_48_e37_f40__0Q8Q16__NSNumber_24__NSNumber_32l;
      v87[4] = v72;
      v87[5] = v7;
      v78[0] = MEMORY[0x263EF8330];
      v78[1] = 3221225472;
      v79 = __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2;
      v80 = &unk_2640214B0;
      v81 = self;
      double v84 = v14;
      id v73 = v11;
      id v82 = v73;
      uint64_t v85 = v74;
      v86 = v87;
      id v70 = v16;
      id v83 = v70;
      uint64_t v19 = AVTBlendShapeLocationToARIndex((void *)*MEMORY[0x263EF8EC8]);
      long long v77 = 0u;
      long long v20 = [(AVTView *)self avatar];
      v21 = v20;
      if (v20) {
        [v20 morphInfoForARKitBlendShapeIndex:v19];
      }
      else {
        long long v77 = 0u;
      }

      if (BYTE8(v77))
      {
        long long v22 = v79((uint64_t)v78, v19, 0);
        if (v22) {
          [v71 addObject:v22];
        }
      }
      else
      {
        long long v22 = 0;
      }
      for (uint64_t i = 0; i != 52; ++i)
      {
        if (v19 != i)
        {
          BYTE8(v76) = 0;
          long long v24 = [(AVTView *)self avatar];
          long long v25 = v24;
          if (v24) {
            [v24 morphInfoForARKitBlendShapeIndex:i];
          }
          else {
            long long v76 = 0u;
          }

          if (BYTE8(v76))
          {
            objc_super v26 = v79((uint64_t)v78, i, v22);
            if (v26) {
              [v71 addObject:v26];
            }
          }
        }
      }
      v27 = objc_msgSend(MEMORY[0x263F157D8], "animationWithKeyPath:", @"/root_JNT.translation", 0.0);
      [v27 setDuration:v14];
      uint64_t v69 = *MEMORY[0x263F15AA8];
      objc_msgSend(v27, "setFillMode:");
      [v27 setTimingFunctions:v73];
      [v27 setUsesSceneTimeBase:1];
      v28 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v74];
      if (self->_recordedCount)
      {
        unint64_t v29 = 0;
        v30 = (long long *)(v68 + 48);
        do
        {
          long long v31 = *v30;
          v30 += 4;
          v32 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *(double *)&v31);
          [v28 addObject:v32];

          ++v29;
        }
        while (v29 < self->_recordedCount);
      }
      v33 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *((double *)v68 + 6));
      [v28 addObject:v33];

      [v27 setKeyTimes:v70];
      [v27 setValues:v28];
      [v71 addObject:v27];
      v34 = [MEMORY[0x263F157D8] animationWithKeyPath:@"/head_JNT.orientation"];

      [v34 setDuration:v14];
      [v34 setFillMode:v69];
      [v34 setTimingFunctions:v73];
      [v34 setUsesSceneTimeBase:1];
      v35 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v74];

      if (self->_recordedCount)
      {
        unint64_t v36 = 0;
        v37 = (float32x4_t *)(v68 + 32);
        do
        {
          float32x4_t v38 = v37[-2];
          float32x4_t v39 = v37[-1];
          int32x4_t v40 = (int32x4_t)vmulq_f32(v38, v38);
          v40.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1))).u32[0];
          float32x2_t v41 = vrsqrte_f32((float32x2_t)v40.u32[0]);
          float32x2_t v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v41, v41)));
          float32x4_t v43 = vmulq_n_f32(v38, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v42, v42))).f32[0]);
          int32x4_t v44 = (int32x4_t)vmulq_f32(v39, v39);
          v44.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1))).u32[0];
          float32x2_t v45 = vrsqrte_f32((float32x2_t)v44.u32[0]);
          float32x2_t v46 = vmul_f32(v45, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(v45, v45)));
          float32x4_t v47 = vmulq_n_f32(v39, vmul_f32(v46, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(v46, v46))).f32[0]);
          int32x4_t v48 = (int32x4_t)vmulq_f32(*v37, *v37);
          v48.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v48, 2), vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v48.i8, 1))).u32[0];
          float32x2_t v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
          float32x2_t v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
          float32x4_t v51 = vmulq_n_f32(*v37, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
          float v52 = (float)(v43.f32[0] + v47.f32[1]) + v51.f32[2];
          if (v52 <= 0.0)
          {
            if (v43.f32[0] <= v47.f32[1] || v43.f32[0] <= v51.f32[2])
            {
              if (v47.f32[1] <= v51.f32[2])
              {
                v62.i64[0] = v51.i64[0];
                v62.f32[2] = (float)(v51.f32[2] + 1.0) - v43.f32[0];
                v62.i32[3] = v43.i32[1];
                float32x4_t v55 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v47, (int32x4_t)v43), (int8x16_t)v47, 8uLL));
                v54.i64[0] = vaddq_f32(v51, v55).u64[0];
                v54.i64[1] = vsubq_f32(v62, v55).i64[1];
                v55.i32[0] = v54.i32[2];
              }
              else
              {
                float32x4_t v57 = v47;
                v57.f32[1] = (float)(v47.f32[1] + 1.0) - v43.f32[0];
                v57.i32[3] = v51.i32[0];
                float32x4_t v58 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v43, (int32x4_t)v51), vtrn1q_s32((int32x4_t)v51, (int32x4_t)v43));
                int32x4_t v59 = (int32x4_t)vaddq_f32(v47, v58);
                float32x4_t v55 = vsubq_f32(v57, v58);
                float32x4_t v54 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v59), (int32x4_t)v55);
                v55.i32[0] = v55.i32[1];
              }
            }
            else
            {
              float32_t v60 = (float)(v43.f32[0] + 1.0) - v47.f32[1];
              float32x4_t v61 = (float32x4_t)vextq_s8((int8x16_t)v47, (int8x16_t)vtrn1q_s32((int32x4_t)v47, (int32x4_t)v51), 0xCuLL);
              float32x4_t v54 = vaddq_f32(v61, v43);
              v61.f32[0] = v60;
              v43.i32[0] = v51.i32[2];
              v43.i32[3] = v51.i32[1];
              float32x4_t v55 = vsubq_f32(v61, v43);
              v54.i32[0] = v55.i32[0];
              v54.i32[3] = v55.i32[3];
            }
          }
          else
          {
            float32x4_t v53 = (float32x4_t)vzip2q_s32((int32x4_t)v47, vuzp1q_s32((int32x4_t)v47, (int32x4_t)v51));
            v53.i32[2] = v43.i32[1];
            float32x4_t v55 = (float32x4_t)vtrn2q_s32((int32x4_t)v51, vzip2q_s32((int32x4_t)v51, (int32x4_t)v43));
            v55.i32[2] = v47.i32[0];
            float32x4_t v54 = vsubq_f32(v53, v55);
            v55.i32[3] = 1.0;
            v53.f32[3] = v52;
            v54.i32[3] = vaddq_f32(v53, v55).i32[3];
            v55.i32[0] = v54.i32[3];
          }
          *(void *)&double v75 = vmulq_n_f32(v54, 0.5 / sqrtf(v55.f32[0])).u64[0];
          if ([(AVTView *)self arMode]) {
            double v63 = v75;
          }
          else {
            +[AVTAvatar applyGazeCorrectionWithInputAngle:v75 translation:*(double *)v37[1].i64];
          }
          v64 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v63);
          [v35 addObject:v64];

          ++v36;
          v37 += 4;
        }
        while (v36 < self->_recordedCount);
      }
      v65 = [v35 objectAtIndex:0];
      [v35 addObject:v65];

      [v34 setKeyTimes:v70];
      [v34 setValues:v35];
      [v71 addObject:v34];
      v66 = [MEMORY[0x263F15750] animation];
      [(CAAnimationGroup *)v66 setAnimations:v71];
      [(CAAnimationGroup *)v66 setDuration:v14];
      [(CAAnimationGroup *)v66 setUsesSceneTimeBase:1];
      [(CAAnimationGroup *)v66 setFillMode:v69];
      recordedAnimationGroup = self->_recordedAnimationGroup;
      self->_recordedAnimationGroup = v66;
    }
  }
}

float __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  if (a2 > 0x32) {
    int v11 = (float *)(*(void *)(a1 + 40) + 4 * (a2 + a3) - 204);
  }
  else {
    int v11 = (float *)(*(void *)(a1 + 32) + 4 * (a2 + 51 * a3));
  }
  float v12 = *v11;
  uint64_t v13 = AVTBlendShapeLocationFromARIndex(a2);
  float v14 = AVTMorphWeightApplyBlinkCorrection(v13, v12);
  double v15 = AVTBlendShapeLocationFromARIndex(a2);

  if (v9 && v15 == (void *)*MEMORY[0x263EF8EC8])
  {
    [v9 floatValue];
    float v14 = v16 + (float)((float)(v14 - v16) * 0.3);
  }
  if (v10)
  {
    [v10 floatValue];
    float v18 = v17;
  }
  else
  {
    float v18 = -1.0;
  }
  float v19 = AVTMorphWeightApplyCorrectionForTongue(v13, v14, v18);

  return v19;
}

id __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v33 = 0u;
  float v6 = [*(id *)(a1 + 32) avatar];
  char v7 = v6;
  if (v6) {
    [v6 morphInfoForARKitBlendShapeIndex:a2];
  }
  else {
    long long v33 = 0u;
  }

  uint64_t v8 = AVTBlendShapeLocationFromARIndex(a2);
  uint64_t v9 = [*((id *)&v33 + 1) name];
  if (!v9) {
    __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_1();
  }
  id v10 = (void *)MEMORY[0x263F157D8];
  long long v31 = (void *)v9;
  v32 = (void *)v8;
  int v11 = [NSString stringWithFormat:@"/%@.morpher.weights[\"%@\"]", v9, v8];
  float v12 = [v10 animationWithKeyPath:v11];

  [v12 setDuration:*(double *)(a1 + 56)];
  [v12 setFillMode:*MEMORY[0x263F15AA8]];
  [v12 setTimingFunctions:*(void *)(a1 + 40)];
  v30 = v12;
  [v12 setUsesSceneTimeBase:1];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(a1 + 64)];
  if (*(_DWORD *)(*(void *)(a1 + 32) + 864))
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = *(void *)(a1 + 72);
      float v16 = [v13 lastObject];
      float v17 = [v5 values];
      float v18 = [v17 objectAtIndexedSubscript:v14];
      float v19 = (*(float (**)(uint64_t, uint64_t, unint64_t, void *, void *))(v15 + 16))(v15, a2, v14, v16, v18);

      if (v19 == -1.0) {
        __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_2();
      }
      *(float *)&double v20 = v19;
      v21 = [NSNumber numberWithFloat:v20];
      [v13 addObject:v21];

      ++v14;
    }
    while (v14 < *(int *)(*(void *)(a1 + 32) + 864));
  }
  uint64_t v22 = *(void *)(a1 + 72);
  long long v23 = [v13 lastObject];
  long long v24 = [v5 values];
  long long v25 = [v24 objectAtIndexedSubscript:*(int *)(*(void *)(a1 + 32) + 864)];
  float v26 = (*(float (**)(uint64_t, uint64_t, void, void *, void *))(v22 + 16))(v22, a2, 0, v23, v25);

  *(float *)&double v27 = v26;
  v28 = [NSNumber numberWithFloat:v27];
  [v13 addObject:v28];

  [v30 setKeyTimes:*(void *)(a1 + 48)];
  [v30 setValues:v13];

  return v30;
}

- (float)maxRecordingDuration
{
  return self->_maxRecordingDuration;
}

- (void)setMaxRecordingDuration:(float)a3
{
  self->_maxRecordingDuration = a3;
}

- (id)_tmpAudioURL
{
  double v2 = [MEMORY[0x263F08850] defaultManager];
  double v3 = [v2 temporaryDirectory];

  unint64_t v4 = [v3 URLByAppendingPathComponent:@"avtpuppet-audio.mp4"];

  return v4;
}

- (id)_tmpVideoURL
{
  double v2 = [MEMORY[0x263F08850] defaultManager];
  double v3 = [v2 temporaryDirectory];

  unint64_t v4 = [v3 URLByAppendingPathComponent:@"avtpuppet-video.mov"];

  return v4;
}

- (id)_tmpMaskVideoURL
{
  double v2 = [MEMORY[0x263F08850] defaultManager];
  double v3 = [v2 temporaryDirectory];

  unint64_t v4 = [v3 URLByAppendingPathComponent:@"avtpuppet-video-alpha.mov"];

  return v4;
}

- (BOOL)mergeAudio:(id)a3 andVideoTo:(id)a4 error:(id *)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v57 = a4;
  float32x4_t v58 = [MEMORY[0x263EFA788] composition];
  v56 = [(AVTRecordView *)self _tmpVideoURL];
  char v7 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v56 options:0];
  if (v7) {
    goto LABEL_5;
  }
  uint64_t v8 = avt_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[AVTRecordView mergeAudio:andVideoTo:error:].cold.4();
  }

  sleep(1u);
  char v7 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v56 options:0];
  if (v7)
  {
LABEL_5:
    memset(&v68, 0, sizeof(v68));
    [v7 duration];
    char v9 = 0;
  }
  else
  {
    uint64_t v15 = avt_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AVTRecordView mergeAudio:andVideoTo:error:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    char v7 = 0;
    memset(&v68, 0, sizeof(v68));
    memset(&duration, 0, sizeof(duration));
    char v9 = 1;
  }
  long long v51 = *MEMORY[0x263F010E0];
  *(_OWORD *)&start.start.value = *MEMORY[0x263F010E0];
  CMTimeEpoch v10 = *(void *)(MEMORY[0x263F010E0] + 16);
  start.start.int64_t epoch = v10;
  CMTimeRangeMake(&v68, &start.start, &duration);
  if (!self->_mute)
  {
    memset(&start, 0, sizeof(start));
    if (v9) {
      memset(&v66, 0, sizeof(v66));
    }
    else {
      [v7 duration];
    }
    *(_OWORD *)&v65.start.value = v51;
    v65.start.int64_t epoch = v10;
    CMTimeRangeMake(&start, &v65.start, &v66);
    uint64_t v11 = *MEMORY[0x263EF9CE8];
    float v12 = [v58 addMutableTrackWithMediaType:*MEMORY[0x263EF9CE8] preferredTrackID:0];
    uint64_t v13 = [v55 tracksWithMediaType:v11];
    unint64_t v14 = [v13 firstObject];

    if (v14)
    {
      CMTimeRange v65 = start;
      long long v63 = v51;
      CMTimeEpoch v64 = v10;
      [v12 insertTimeRange:&v65 ofTrack:v14 atTime:&v63 error:0];
    }
    else
    {
      long long v23 = avt_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[AVTRecordView mergeAudio:andVideoTo:error:](v55);
      }
    }
  }
  uint64_t v24 = *MEMORY[0x263EF9D48];
  float32x4_t v54 = objc_msgSend(v58, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x263EF9D48], 0, v51);
  long long v25 = [v7 tracksWithMediaType:v24];
  float v26 = [v25 firstObject];

  if (v26)
  {
    CMTimeRange start = v68;
    *(_OWORD *)&v65.start.value = v52;
    v65.start.int64_t epoch = v10;
    [v54 insertTimeRange:&start ofTrack:v26 atTime:&v65 error:0];
    double v27 = [MEMORY[0x263F08850] defaultManager];
    v28 = [v57 path];
    char v29 = [v27 fileExistsAtPath:v28];

    if (v29)
    {
      v30 = [MEMORY[0x263F08850] defaultManager];
      long long v31 = [v57 path];
      [v30 removeItemAtPath:v31 error:0];
    }
    id v32 = objc_alloc(MEMORY[0x263EFA4A8]);
    long long v33 = (void *)[v32 initWithAsset:v58 presetName:*MEMORY[0x263EF95C0]];
    [v33 setOutputFileType:*MEMORY[0x263EF9898]];
    [v33 setOutputURL:v57];
    v34 = [MEMORY[0x263EFA790] metadataItem];
    uint64_t v35 = *MEMORY[0x263EF9E90];
    [v34 setKeySpace:*MEMORY[0x263EF9E90]];
    [v34 setKey:@"LOOP"];
    LODWORD(v65.start.value) = 0;
    uint64_t v36 = *MEMORY[0x263F00F48];
    [v34 setDataType:*MEMORY[0x263F00F48]];
    v37 = [MEMORY[0x263EFF8F8] dataWithBytes:&v65 length:4];
    [v34 setValue:v37];

    float32x4_t v38 = [MEMORY[0x263EFA790] metadataItem];
    [v38 setKeySpace:v35];
    [v38 setKey:@"GREY"];
    [v38 setDataType:v36];
    float32x4_t v39 = [MEMORY[0x263EFF8F8] dataWithBytes:&v65 length:4];
    [v38 setValue:v39];

    v69[0] = v34;
    v69[1] = v38;
    int32x4_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
    [v33 setMetadata:v40];

    dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
    float32x2_t v42 = avt_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(start.start.value) = 138412290;
      *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v33;
      _os_log_impl(&dword_20B819000, v42, OS_LOG_TYPE_DEFAULT, "[Record view] Video export will start with session %@", (uint8_t *)&start, 0xCu);
    }

    start.start.value = 0;
    *(void *)&start.start.timescale = &start;
    start.start.int64_t epoch = 0x3032000000;
    start.duration.value = (CMTimeValue)__Block_byref_object_copy__7;
    *(void *)&start.duration.timescale = __Block_byref_object_dispose__7;
    start.duration.int64_t epoch = 0;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke;
    v59[3] = &unk_2640214D8;
    id v43 = v33;
    id v60 = v43;
    p_CMTimeRange start = &start;
    int32x4_t v44 = v41;
    float32x4_t v61 = v44;
    [v43 exportAsynchronouslyWithCompletionHandler:v59];
    dispatch_time_t v45 = dispatch_time(0, 20000000000);
    dispatch_semaphore_wait(v44, v45);
    float32x2_t v46 = *(void **)(*(void *)&start.start.timescale + 40);
    BOOL v47 = v46 == 0;
    if (a5 && v46) {
      *a5 = v46;
    }

    _Block_object_dispose(&start, 8);
  }
  else
  {
    int32x4_t v48 = avt_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[AVTRecordView mergeAudio:andVideoTo:error:]((uint64_t)v7, v55);
    }

    if (!a5)
    {
      BOOL v47 = 0;
      goto LABEL_33;
    }
    float32x2_t v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v70 = *MEMORY[0x263F08320];
    id v43 = [NSString stringWithFormat:@"Failed to get video track"];
    id v71 = v43;
    v34 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    [v49 errorWithDomain:@"AVTErrorDomain" code:1 userInfo:v34];
    BOOL v47 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_33:
  return v47;
}

intptr_t __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) status] == 3
    && ([*v2 error], double v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    unint64_t v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v9 = 0;
      _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Record view] Video export did complete", v9, 2u);
    }
  }
  else
  {
    unint64_t v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke_cold_1(v2);
    }
  }

  uint64_t v5 = [*(id *)(a1 + 32) error];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)fadePuppetToWhite:(float)a3
{
  id v5 = [(AVTView *)self environment];
  *(float *)&double v4 = a3;
  [v5 setFadeFactor:v4];
}

- (BOOL)exportMovieToURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  double v8 = COERCE_DOUBLE(a3);
  id v9 = a4;
  id v10 = a5;
  [(AVTRecordView *)self stopRecording];
  uint64_t v11 = [(AVTRecordView *)self scene];

  if (v11)
  {
    BOOL exportingMovie = self->_exportingMovie;
    uint64_t v13 = avt_default_log();
    unint64_t v14 = v13;
    if (exportingMovie)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AVTRecordView exportMovieToURL:options:completionHandler:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
      BOOL v22 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v93 = v8;
        _os_log_impl(&dword_20B819000, v14, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: exporting movie to %@", buf, 0xCu);
      }

      self->_BOOL exportingMovie = 1;
      long long v23 = [MEMORY[0x263F08AB8] currentProgress];
      if (v23)
      {
        unint64_t v14 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
      }
      else
      {
        unint64_t v14 = 0;
      }

      [v14 becomeCurrentWithPendingUnitCount:1];
      [(AVTRecordView *)self _updateTrackingState];
      [(AVTRecordView *)self fadePuppetToWhite:0.0];
      uint64_t v24 = [(AVTRecordView *)self pointOfView];
      long long v25 = [v24 camera];
      [v24 simdPosition];
      long long v69 = v26;
      [v25 zFar];
      double v28 = v27;
      [(AVTView *)self lockAvatar];
      [MEMORY[0x263F16B08] lock];
      char v29 = [(AVTView *)self avatar];
      v30 = (void *)[v29 copy];

      long long v31 = v30;
      [v30 update];
      [(AVTRecordView *)self addRecordedAnimationToAvatar:v30];
      [(CAAnimationGroup *)self->_recordedAnimationGroup duration];
      double v33 = v32;
      [MEMORY[0x263F16B08] unlock];
      [(AVTView *)self unlockAvatar];
      BOOL v22 = v33 > 0.0166666667;
      if (v33 > 0.0166666667)
      {
        CMTimeRange v68 = v31;
        v34 = avt_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          float v35 = v33;
          *(_DWORD *)buf = 134217984;
          double v93 = v35;
          _os_log_impl(&dword_20B819000, v34, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: scene duration %.3fs", buf, 0xCu);
        }

        uint64_t v36 = [v9 objectForKeyedSubscript:@"size"];
        uint64_t v70 = v25;
        CMTimeRange v65 = v36;
        CMTime v66 = v10;
        if (v36)
        {
          [v36 CGSizeValue];
          uint64_t v38 = v37;
          uint64_t v40 = v39;
        }
        else
        {
          uint64_t v38 = 0x4074000000000000;
          uint64_t v40 = 0x4074000000000000;
        }
        dispatch_semaphore_t v41 = (void *)[v9 mutableCopy];
        uint64_t v42 = [v9 objectForKeyedSubscript:@"codec"];
        id v43 = (void *)MEMORY[0x263EFA338];
        if (v42)
        {
          [v41 setObject:v42 forKeyedSubscript:*MEMORY[0x263EFA338]];
          [v41 removeObjectForKey:@"codec"];
        }
        CMTimeEpoch v64 = (void *)v42;
        int32x4_t v44 = [v9 objectForKeyedSubscript:@"AVTMovieTransparentBackground"];
        int v67 = [v44 BOOLValue];

        dispatch_time_t v45 = [v9 objectForKeyedSubscript:@"AVTMovieTransparentBackground"];

        if (v45) {
          [v41 removeObjectForKey:@"AVTMovieTransparentBackground"];
        }
        if (v67) {
          [v41 setObject:*MEMORY[0x263EFA378] forKeyedSubscript:*v43];
        }
        float v46 = v28;
        uint64_t v47 = *MEMORY[0x263EFA390];
        uint64_t v48 = *MEMORY[0x263EFA448];
        v90[0] = *MEMORY[0x263EFA388];
        v90[1] = v48;
        uint64_t v49 = *MEMORY[0x263EFA450];
        v91[0] = v47;
        v91[1] = v49;
        v90[2] = *MEMORY[0x263EFA460];
        v91[2] = *MEMORY[0x263EFA468];
        float32x2_t v50 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:3];
        [v41 setObject:v50 forKeyedSubscript:*MEMORY[0x263EFA398]];

        [v41 removeObjectForKey:@"AVTMovieGenerateAlphaMask-NoLongerImplemented"];
        [v41 removeObjectForKey:@"size"];
        uint64_t v88 = *MEMORY[0x263EFA3B8];
        v89 = &unk_26C00C550;
        long long v51 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        [v41 setObject:v51 forKeyedSubscript:*MEMORY[0x263EFA3A0]];

        v86 = @"AVTRendererOptionInitiallyConfigureForARMode";
        uint64_t v87 = MEMORY[0x263EFFA80];
        long long v52 = [NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        float32x4_t v53 = +[SCNRenderer rendererWithDevice:0 options:v52];

        objc_msgSend(v53, "set_superSamplingFactor:", 2.0);
        long long v63 = v41;
        if (v67) {
          [MEMORY[0x263F1C550] clearColor];
        }
        else {
        float32x4_t v54 = [MEMORY[0x263F1C550] whiteColor];
        }
        [v53 setBackgroundColor:v54];

        [v53 setAvatar:v68];
        id v55 = [v53 scene];
        [v55 setStartTime:0.0];
        [v55 setEndTime:v33];
        [MEMORY[0x263F16B08] begin];
        [MEMORY[0x263F16B08] setAnimationDuration:0.5];
        [v24 setSimdPosition:*(double *)&v69];
        [v70 zFar];
        [v70 setZFar:v56 + 20.0];
        id v57 = (void *)MEMORY[0x263F16B08];
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke;
        v71[3] = &unk_264021500;
        uint64_t v73 = self;
        uint64_t v74 = v14;
        id v75 = v53;
        uint64_t v83 = v38;
        uint64_t v84 = v40;
        id v76 = v41;
        id v77 = v55;
        id v78 = *(id *)&v8;
        id v79 = v68;
        id v82 = v66;
        id v80 = v24;
        long long v72 = v69;
        id v81 = v70;
        float v85 = v46;
        id v58 = v55;
        id v10 = v66;
        id v59 = v63;
        id v60 = v53;
        float32x4_t v61 = v57;
        long long v25 = v70;
        [v61 setCompletionBlock:v71];
        [MEMORY[0x263F16B08] commit];

        long long v31 = v68;
      }
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 48) setRendersContinuously:0];
  double v2 = [*(id *)(a1 + 48) scene];
  [v2 setPaused:1];

  [*(id *)(a1 + 56) resignCurrent];
  [*(id *)(a1 + 56) becomeCurrentWithPendingUnitCount:99];
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = [*(id *)(a1 + 48) _tmpVideoURL];
  id v5 = [v4 path];
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    double v8 = [MEMORY[0x263F08850] defaultManager];
    [v8 removeItemAtPath:v5 error:0];
  }
  id v9 = *(void **)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v55 = 0;
  int v11 = objc_msgSend(v9, "renderMovieToURL:size:antialiasingMode:attributes:error:", v4, 0, v10, &v55, *(double *)(a1 + 128), *(double *)(a1 + 136));
  id v12 = v55;
  if (v11)
  {
    double v13 = CFAbsoluteTimeGetCurrent();
    unint64_t v14 = avt_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = v13 - Current;
      float v16 = v15;
      double v17 = v16;
      [*(id *)(a1 + 80) endTime];
      uint64_t v19 = v18;
      [*(id *)(a1 + 80) endTime];
      *(float *)&double v20 = v20 * 60.0 / v15;
      *(_DWORD *)buf = 134218496;
      double v57 = v17;
      __int16 v58 = 2048;
      uint64_t v59 = v19;
      __int16 v60 = 2048;
      double v61 = *(float *)&v20;
      _os_log_impl(&dword_20B819000, v14, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: movie rendered in %.3fs for a length of %.3fs (%.3f frames rendered per second)", buf, 0x20u);
    }

    uint64_t v21 = [*(id *)(a1 + 48) _tmpAudioURL];
    BOOL v22 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v21 options:0];
    long long v23 = *(void **)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 88);
    id v54 = v12;
    char v25 = [v23 mergeAudio:v22 andVideoTo:v24 error:&v54];
    id v26 = v54;

    if (v25)
    {
      id v12 = v26;
    }
    else
    {
      double v33 = avt_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_2((uint64_t)v26, v33, v34, v35, v36, v37, v38, v39);
      }

      sleep(1u);
      uint64_t v40 = *(void **)(a1 + 48);
      uint64_t v41 = *(void *)(a1 + 88);
      id v53 = v26;
      char v42 = [v40 mergeAudio:v22 andVideoTo:v41 error:&v53];
      id v12 = v53;

      id v43 = avt_default_log();
      int32x4_t v44 = v43;
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20B819000, v44, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: audio merge succeeded after 2nd try", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_1((uint64_t)v12, v44, v45, v46, v47, v48, v49, v50);
      }
    }
  }
  else
  {
    uint64_t v21 = avt_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_3((uint64_t)v12, v21, v27, v28, v29, v30, v31, v32);
    }
  }

  [*(id *)(a1 + 56) resignCurrent];
  [*(id *)(a1 + 96) willRemoveFromScene:*(void *)(a1 + 80)];
  long long v51 = [*(id *)(a1 + 48) scene];
  [v51 setPaused:0];

  uint64_t v52 = *(void *)(a1 + 120);
  if (v52) {
    (*(void (**)(uint64_t, id))(v52 + 16))(v52, v12);
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 808) = 0;
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.75];
  [*(id *)(a1 + 104) setSimdPosition:*(double *)(a1 + 32)];
  [*(id *)(a1 + 112) setZFar:*(float *)(a1 + 144)];
  [*(id *)(a1 + 48) _updateTrackingState];
  [MEMORY[0x263F16B08] commit];
}

- (void)startRecordingAudio
{
}

- (opaqueCMSampleBuffer)createSilentAudioAtFrame:(int64_t)a3 nFrames:(int)a4 sampleRate:(double)a5 numChannels:(int)a6
{
  UInt32 v10 = 2 * a6;
  CMBlockBufferRef destinationBuffer = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  size_t v12 = 2 * a6 * a4;
  if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v12, 0, 0, 0, v12, 1u, &destinationBuffer))
  {
    double v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:].cold.4();
    }
LABEL_10:

    return 0;
  }
  if (CMBlockBufferFillDataBytes(0, destinationBuffer, 0, v12))
  {
    double v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:]();
    }
    goto LABEL_10;
  }
  asbd.mSampleRate = a5;
  *(void *)&asbd.mFormatID = 0x46C70636DLL;
  asbd.mBytesPerPacket = v10;
  asbd.mFramesPerPacket = 1;
  asbd.mBytesPerFrame = v10;
  asbd.mChannelsPerFrame = a6;
  *(void *)&asbd.mBitsPerChannel = 16;
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  if (CMAudioFormatDescriptionCreate(v11, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    double v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:]();
    }
    goto LABEL_10;
  }
  CMSampleBufferRef sampleBufferOut = 0;
  double v15 = destinationBuffer;
  float v16 = formatDescriptionOut;
  CMTimeMake(&presentationTimeStamp, a3, 1);
  OSStatus v17 = CMAudioSampleBufferCreateReadyWithPacketDescriptions(v11, v15, v16, a4, &presentationTimeStamp, 0, &sampleBufferOut);
  CFRelease(destinationBuffer);
  if (v17)
  {
    uint64_t v18 = avt_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:]();
    }

    return 0;
  }
  return sampleBufferOut;
}

- (void)stopRecordingAudio
{
  if (self->_audioWriter)
  {
    [(NSLock *)self->_audioLock lock];
    int64_t epoch = self->_currentAudioTime.epoch;
    *(_OWORD *)&self->_stopAudioTime.value = *(_OWORD *)&self->_currentAudioTime.value;
    self->_stopAudioTime.int64_t epoch = epoch;
    audioLock = self->_audioLock;
    [(NSLock *)audioLock unlock];
  }
}

- (void)finalizeAudioFile
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_audioLock lock];
  [(AVTRecordView *)self finalVideoDuration];
  double v3 = (double)self->_recordedSampleCount / 44100.0;
  double v5 = v4 - v3;
  if (v5 <= 0.0) {
    double v6 = 0.0166666667;
  }
  else {
    double v6 = v5 + 0.0166666667;
  }
  int v7 = avt_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    float v8 = v3 + v6;
    int64_t recordedSampleCount = self->_recordedSampleCount;
    *(_DWORD *)buf = 134219008;
    float v10 = v3;
    double v19 = v8;
    __int16 v20 = 2048;
    double v21 = v10;
    __int16 v22 = 1024;
    int v23 = recordedSampleCount;
    __int16 v24 = 1024;
    int v25 = 44100;
    __int16 v26 = 1024;
    int v27 = (int)(v6 * 44100.0);
    _os_log_impl(&dword_20B819000, v7, OS_LOG_TYPE_DEFAULT, "[Record view] Final audio duration: %.3fs (exact duration: %.3fs for %d samples at %dHz ; %d generated silent samples)",
      buf,
      0x28u);
  }

  if (v6 > 0.0 && self->_audioIsRecording)
  {
    CFAllocatorRef v11 = [(AVTRecordView *)self createSilentAudioAtFrame:self->_recordedSampleCount nFrames:(int)(v6 * 44100.0) sampleRate:1 numChannels:44100.0];
    if (v11)
    {
      size_t v12 = v11;
      [(AVAssetWriterInput *)self->_audioWriterInput appendSampleBuffer:v11];
      CFRelease(v12);
    }
  }
  audioWriterInput = self->_audioWriterInput;
  self->_audioWriterInput = 0;

  audioWriter = self->_audioWriter;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__AVTRecordView_finalizeAudioFile__block_invoke;
  v17[3] = &unk_26401F6E0;
  v17[4] = self;
  [(AVAssetWriter *)audioWriter finishWritingWithCompletionHandler:v17];
  [(NSLock *)self->_audioLock lock];
  [(NSLock *)self->_audioLock unlock];
  double v15 = self->_audioWriter;
  self->_audioWriter = 0;

  [(AVCaptureMovieFileOutput *)self->_movieFileOutput stopRecording];
  movieFileOutput = self->_movieFileOutput;
  self->_movieFileOutput = 0;
}

void __34__AVTRecordView_finalizeAudioFile__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 904);
  if ([v2 status] == 2
    && ([v2 error], double v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    double v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Record view] Audio writing did finish", (uint8_t *)v7, 2u);
    }
  }
  else
  {
    double v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(*(void *)(a1 + 32) + 904) status];
      double v6 = [*(id *)(*(void *)(a1 + 32) + 904) error];
      v7[0] = 67109378;
      v7[1] = v5;
      __int16 v8 = 2112;
      id v9 = v6;
      _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Record view] Audio writing did finish with status:%d, error:%@", (uint8_t *)v7, 0x12u);
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 912) unlock];
}

- (void)cancelRecordingAudio
{
  [(AVCaptureMovieFileOutput *)self->_movieFileOutput stopRecording];
  movieFileOutput = self->_movieFileOutput;
  self->_movieFileOutput = 0;
}

- (void)updateAudioState
{
  if (self->_playing) {
    [(AVTRecordView *)self startPlayingAudio];
  }
}

- (void)setMute:(BOOL)a3
{
  if (self->_mute != a3)
  {
    self->_mute = a3;
    [(AVTRecordView *)self updateMuteState];
  }
}

- (void)audioPlayerItemDidReachEnd:(id)a3
{
  double v4 = [(AVTRecordView *)self recordDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTRecordView *)self recordDelegate];
    [v6 recordView:self previewDidChangeStatus:2];
  }
}

- (void)startPlayingAudio
{
  if (!self->_audioPlayer)
  {
    id v10 = [(AVTRecordView *)self _tmpAudioURL];
    double v3 = (void *)[objc_alloc(MEMORY[0x263EFA800]) initWithURL:v10];
    double v4 = [MEMORY[0x263EFA7F0] playerWithPlayerItem:v3];
    audioPlayer = self->_audioPlayer;
    self->_audioPlayer = v4;

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = *MEMORY[0x263EFA050];
    __int16 v8 = [(AVPlayer *)self->_audioPlayer currentItem];
    [v6 addObserver:self selector:sel_audioPlayerItemDidReachEnd_ name:v7 object:v8];

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel_audioSessionDidInterrupt_ name:*MEMORY[0x263EF90A0] object:0];

    [(AVTRecordView *)self updateMuteState];
    [(AVPlayer *)self->_audioPlayer play];
  }
}

- (void)audioSessionDidInterrupt:(id)a3
{
  if (self->_playing)
  {
    double v4 = [a3 userInfo];
    char v5 = [v4 objectForKey:*MEMORY[0x263EF90C8]];
    uint64_t v6 = [v5 unsignedLongValue];
    if (v6)
    {
      if (v6 != 1) {
        goto LABEL_13;
      }
      uint64_t v7 = avt_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B819000, v7, OS_LOG_TYPE_DEFAULT, "[Record view] Audio session was interrupted", buf, 2u);
      }

      __int16 v8 = [(AVTRecordView *)self recordDelegate];
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        goto LABEL_13;
      }
      id v10 = [(AVTRecordView *)self recordDelegate];
      CFAllocatorRef v11 = [MEMORY[0x263EF93E0] sharedInstance];
      [v10 recordView:self audioSessionWasInterrupted:v11];
    }
    else
    {
      size_t v12 = avt_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v15 = 0;
        _os_log_impl(&dword_20B819000, v12, OS_LOG_TYPE_DEFAULT, "[Record view] Audio session interruption ended", v15, 2u);
      }

      [(AVPlayer *)self->_audioPlayer play];
      double v13 = [(AVTRecordView *)self recordDelegate];
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0) {
        goto LABEL_13;
      }
      id v10 = [(AVTRecordView *)self recordDelegate];
      CFAllocatorRef v11 = [MEMORY[0x263EF93E0] sharedInstance];
      [v10 recordView:self audioSessionInterruptionEnded:v11];
    }

LABEL_13:
  }
}

- (void)updateMuteState
{
  double v2 = 0.0;
  if (!self->_mute) {
    *(float *)&double v2 = 1.0;
  }
  [(AVPlayer *)self->_audioPlayer setVolume:v2];
}

- (void)stopPlayingAudio
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFA050];
  char v5 = [(AVPlayer *)self->_audioPlayer currentItem];
  [v3 removeObserver:self name:v4 object:v5];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263EF90A0] object:0];

  [(AVPlayer *)self->_audioPlayer pause];
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;
}

- (BOOL)isDoubleBuffered
{
  return self->_doubleBuffer;
}

- (double)currentAudioTime
{
  audioPlayer = self->_audioPlayer;
  if (audioPlayer) {
    [(AVPlayer *)audioPlayer currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- (void)_drawAtTime:(double)a3
{
  if ([(AVTRecordView *)self renderingAPI] || !self->_checkDrawableAvailable) {
    goto LABEL_2;
  }
  char v5 = self->_backingLayer;
  if ([(CALayer *)v5 isDrawableAvailable])
  {

LABEL_2:
    v6.receiver = self;
    v6.super_class = (Class)AVTRecordView;
    [(AVTView *)&v6 _drawAtTime:a3];
    return;
  }
  if (self->_doubleBuffer) {
    [(AVTRecordView *)self drawableNotAvailableForTime:a3];
  }
}

- (void)drawableNotAvailableForTime:(double)a3
{
  droppedDoubleBufferFrames = self->_droppedDoubleBufferFrames;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithDouble:");
  [(NSMutableArray *)droppedDoubleBufferFrames addObject:v6];

  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  if ([(AVTRecordView *)self preferredFramesPerSecond] < 1) {
    uint64_t v7 = 60;
  }
  else {
    uint64_t v7 = [(AVTRecordView *)self preferredFramesPerSecond];
  }
  double v8 = 1.0 / (double)v7;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  char v9 = self->_droppedDoubleBufferFrames;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__AVTRecordView_drawableNotAvailableForTime___block_invoke;
  v12[3] = &unk_264021528;
  v12[4] = &v18;
  v12[5] = v13;
  *(double *)&v12[7] = a3 + v8 * -12.0;
  *(double *)&v12[8] = v8;
  v12[6] = &v14;
  [(NSMutableArray *)v9 enumerateObjectsUsingBlock:v12];
  -[NSMutableArray removeObjectsInRange:](self->_droppedDoubleBufferFrames, "removeObjectsInRange:", 0, v19[3]);
  if (v15[3] >= 5
    && [(CALayer *)self->_backingLayer isMemberOfClass:objc_opt_class()])
  {
    id v10 = avt_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFAllocatorRef v11 = 0;
      _os_log_impl(&dword_20B819000, v10, OS_LOG_TYPE_DEFAULT, "[Record view] *****drawableNotAvailableForTime: SWITCHING TO TRIPLE BUFFERING", v11, 2u);
    }

    self->_doubleBuffer = 0;
    [(CALayer *)self->_backingLayer setMaximumDrawableCount:3];
  }
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __45__AVTRecordView_drawableNotAvailableForTime___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 doubleValue];
  if (v6 >= *(double *)(a1 + 56))
  {
    if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + *(double *)(a1 + 64) * 1.5 < v6) {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

- (BOOL)mute
{
  return self->_mute;
}

- (AVTRecordViewDelegate)recordDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordDelegate);
  return (AVTRecordViewDelegate *)WeakRetained;
}

- (void)setRecordDelegate:(id)a3
{
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLayer, 0);
  objc_storeStrong((id *)&self->_droppedDoubleBufferFrames, 0);
  objc_storeStrong((id *)&self->_audioLock, 0);
  objc_storeStrong((id *)&self->_audioWriter, 0);
  objc_storeStrong((id *)&self->_audioWriterInput, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_movieFileOutput, 0);
  objc_storeStrong((id *)&self->_recordedAnimationGroup, 0);
  objc_storeStrong((id *)&self->_rawParametersData, 0);
  objc_storeStrong((id *)&self->_rawTransformsData, 0);
  objc_storeStrong((id *)&self->_rawBlendShapesData, 0);
  objc_storeStrong((id *)&self->_rawTimesData, 0);
  objc_destroyWeak((id *)&self->_recordDelegate);
}

void __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_1()
{
  __assert_rtn("-[AVTRecordView convertRecordedDataToAnimationGroup]_block_invoke_2", "AVTRecordView.m", 1052, "morphedNodeName != nil");
}

void __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_2()
{
  __assert_rtn("-[AVTRecordView convertRecordedDataToAnimationGroup]_block_invoke_2", "AVTRecordView.m", 1063, "weight != -1");
}

- (void)mergeAudio:(uint64_t)a1 andVideoTo:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  [a2 statusOfValueForKey:@"tracks" error:0];
  OUTLINED_FUNCTION_4(&dword_20B819000, v2, v3, "Error: [Record view] Video export: failed to get video track from video asset %@ (status: %d)", v4, v5, v6, v7, 2u);
}

- (void)mergeAudio:(void *)a1 andVideoTo:error:.cold.2(void *a1)
{
  [a1 statusOfValueForKey:@"tracks" error:0];
  OUTLINED_FUNCTION_5(&dword_20B819000, v1, v2, "Error: [Record view] Video export: failed to get audio track (status: %d)", v3, v4, v5, v6, 0);
}

- (void)mergeAudio:(uint64_t)a3 andVideoTo:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeAudio:andVideoTo:error:.cold.4()
{
  [0 statusOfValueForKey:@"tracks" error:0];
  OUTLINED_FUNCTION_5(&dword_20B819000, v0, v1, "Error: [Record view] Video export: failed to get video asset, will try again in 1 second (status: %d)", v2, v3, v4, v5, 0);
}

void __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke_cold_1(id *a1)
{
  [*a1 status];
  double v8 = [*a1 error];
  OUTLINED_FUNCTION_4(&dword_20B819000, v2, v3, "Error: [Record view] Video export did complete with status: %d, error: %@", v4, v5, v6, v7, 2u);
}

- (void)exportMovieToURL:(uint64_t)a3 options:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20B819000, v0, v1, "Error: Audio: failed to create silent audio frame, CMAudioSampleBufferCreateReadyWithPacketDescriptions returned %d", v2, v3, v4, v5, v6);
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20B819000, v0, v1, "Error: Audio: failed to create silent audio frame, CMAudioFormatDescriptionCreate returned %d", v2, v3, v4, v5, v6);
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20B819000, v0, v1, "Error: Audio: failed to create silent audio frame, CMBlockBufferFillDataBytes returned %d", v2, v3, v4, v5, v6);
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20B819000, v0, v1, "Error: Audio: failed to create silent audio frame, CMBlockBufferCreateWithMemoryBlock returned %d", v2, v3, v4, v5, v6);
}

@end