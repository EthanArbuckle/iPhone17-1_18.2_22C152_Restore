@interface AVSampleBufferDisplayLayerPlayerController
+ (id)keyPathsForValuesAffectingContentDimensions;
+ (id)keyPathsForValuesAffectingContentDuration;
+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes;
+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes;
+ (id)keyPathsForValuesAffectingHasLiveStreamingContent;
+ (id)keyPathsForValuesAffectingMaxTiming;
+ (id)keyPathsForValuesAffectingPaused;
+ (id)keyPathsForValuesAffectingPictureInPicturePossible;
+ (id)keyPathsForValuesAffectingPlaying;
+ (id)keyPathsForValuesAffectingRate;
+ (id)keyPathsForValuesAffectingTimeControlStatus;
+ (id)keyPathsForValuesAffectingTiming;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentSBDLTime;
- ($B1B40AE7B40192423BFE885F22139C9A)contentTimeRange;
- (AVObservationController)sbdlObservationController;
- (AVPictureInPictureController)pictureInPictureController;
- (AVPictureInPicturePlaybackState)playbackState;
- (AVPictureInPictureSampleBufferPlaybackDelegate)playbackDelegate;
- (AVSampleBufferDisplayLayerPlaybackDelegateAdapter)playbackDelegateAdapter;
- (AVSampleBufferDisplayLayerPlayerController)init;
- (BOOL)hasLiveStreamingContent;
- (BOOL)hasSeekableLiveStreamingContent;
- (BOOL)isPaused;
- (BOOL)isPictureInPictureAvailable;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPlaying;
- (CGSize)enqueuedBufferDimensions;
- (double)_effectiveRate;
- (double)contentDurationWithinEndTimes;
- (double)currentTimeWithinEndTimes;
- (double)rate;
- (id)maxTiming;
- (id)minTiming;
- (id)timing;
- (int64_t)status;
- (int64_t)timeControlStatus;
- (void)_startObservation;
- (void)_updateBackgroundAudioPlaybackPolicy;
- (void)_updatePlaybackStateTiming;
- (void)_updateStatus;
- (void)dealloc;
- (void)invalidatePlaybackState;
- (void)pauseForAllCoordinatedPlaybackParticipants:(BOOL)a3;
- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5;
- (void)setContentTimeRange:(id *)a3;
- (void)setEnqueuedBufferDimensions:(CGSize)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPictureInPictureAvailable:(BOOL)a3;
- (void)setPictureInPictureController:(id)a3;
- (void)setPictureInPictureInterrupted:(BOOL)a3;
- (void)setPlaybackDelegate:(id)a3;
- (void)setPlaybackDelegateAdapter:(id)a3;
- (void)setPlaybackState:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setSbdlObservationController:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimeControlStatus:(int64_t)a3;
- (void)togglePlaybackEvenWhenInBackground:(id)a3;
@end

@implementation AVSampleBufferDisplayLayerPlayerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbdlObservationController, 0);
  objc_storeStrong((id *)&self->_playbackDelegate, 0);
  objc_destroyWeak((id *)&self->_pictureInPictureController);
  objc_destroyWeak((id *)&self->_playbackState);
  objc_storeStrong((id *)&self->_timeControlStatus, 0);

  objc_storeStrong((id *)&self->super._seekToTimeInternal.epoch, 0);
}

- (void)setPlaybackDelegateAdapter:(id)a3
{
}

- (AVSampleBufferDisplayLayerPlaybackDelegateAdapter)playbackDelegateAdapter
{
  return (AVSampleBufferDisplayLayerPlaybackDelegateAdapter *)self->_sbdlObservationController;
}

- (void)setContentTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_enqueuedBufferDimensions.height = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_contentTimeRange.start.timescale = v4;
  *(_OWORD *)&self->_contentTimeRange.duration.value = v3;
}

- ($B1B40AE7B40192423BFE885F22139C9A)contentTimeRange
{
  long long v3 = *(_OWORD *)&self[16].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[15].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[16].var0.var3;
  return self;
}

- (void)setPaused:(BOOL)a3
{
  BYTE1(self->_timing) = a3;
}

- (void)setSbdlObservationController:(id)a3
{
}

- (AVObservationController)sbdlObservationController
{
  return (AVObservationController *)self->_playbackDelegate;
}

- (CGSize)enqueuedBufferDimensions
{
  playbackDelegateAdapter = self->_playbackDelegateAdapter;
  double width = self->_enqueuedBufferDimensions.width;
  result.height = width;
  result.double width = *(double *)&playbackDelegateAdapter;
  return result;
}

- (AVPictureInPictureSampleBufferPlaybackDelegate)playbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureController);

  return (AVPictureInPictureSampleBufferPlaybackDelegate *)WeakRetained;
}

- (AVPictureInPictureController)pictureInPictureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackState);

  return (AVPictureInPictureController *)WeakRetained;
}

- (AVPictureInPicturePlaybackState)playbackState
{
  return (AVPictureInPicturePlaybackState *)self->_timeControlStatus;
}

- (void)setTimeControlStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setPictureInPictureAvailable:(BOOL)a3
{
  LOBYTE(self->_timing) = a3;
}

- (BOOL)isPictureInPictureAvailable
{
  return (BOOL)self->_timing;
}

- (void)setStatus:(int64_t)a3
{
  *(void *)&self->_pictureInPictureAvailable = a3;
}

- (int64_t)status
{
  return *(void *)&self->_pictureInPictureAvailable;
}

- (void)_startObservation
{
  v59[6] = *MEMORY[0x1E4F143B8];
  long long v3 = [(AVSampleBufferDisplayLayerPlayerController *)self sbdlObservationController];

  if (!v3)
  {
    long long v4 = [[AVObservationController alloc] initWithOwner:self];
    [(AVSampleBufferDisplayLayerPlayerController *)self setSbdlObservationController:v4];

    v5 = [(AVSampleBufferDisplayLayerPlayerController *)self sbdlObservationController];
    v6 = [MEMORY[0x1E4F153E0] sharedInstance];
    id v7 = (id)[v5 startObserving:v6 keyPath:@"isPiPAvailable" includeInitialValue:1 observationHandler:&__block_literal_global_25664];

    v8 = [(AVSampleBufferDisplayLayerPlayerController *)self sbdlObservationController];
    [v8 startObservingNotificationForName:*MEMORY[0x1E4F1FA58] object:0 notificationCenter:0 observationHandler:&__block_literal_global_140];

    v9 = [(AVSampleBufferDisplayLayerPlayerController *)self sbdlObservationController];
    [v9 startObservingNotificationForName:*MEMORY[0x1E4F1FA68] object:0 notificationCenter:0 observationHandler:&__block_literal_global_140];

    v10 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
    v11 = [v10 contentSource];
    v12 = [v11 sampleBufferDisplayLayer];

    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x4010000000;
    v56[3] = &unk_1B0741513;
    long long v57 = 0u;
    long long v58 = 0u;
    [v12 frame];
    *(void *)&long long v57 = v13;
    *((void *)&v57 + 1) = v14;
    *(void *)&long long v58 = v15;
    *((void *)&v58 + 1) = v16;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x4010000000;
    v53[3] = &unk_1B0741513;
    long long v54 = 0u;
    long long v55 = 0u;
    [v12 bounds];
    *(void *)&long long v54 = v17;
    *((void *)&v54 + 1) = v18;
    *(void *)&long long v55 = v19;
    *((void *)&v55 + 1) = v20;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x5010000000;
    v49[3] = &unk_1B0741513;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    if (v12)
    {
      [v12 affineTransform];
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0xA010000000;
      v40 = &unk_1B0741513;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      [v12 transform];
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0xA010000000;
      v28 = &unk_1B0741513;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      [v12 sublayerTransform];
    }
    else
    {
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0xA010000000;
      v40 = &unk_1B0741513;
      long long v41 = 0uLL;
      long long v42 = 0uLL;
      long long v43 = 0uLL;
      long long v44 = 0uLL;
      long long v45 = 0uLL;
      long long v46 = 0uLL;
      long long v47 = 0uLL;
      long long v48 = 0uLL;
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0xA010000000;
      v28 = &unk_1B0741513;
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v35 = 0uLL;
      long long v36 = 0uLL;
    }
    v21 = [(AVSampleBufferDisplayLayerPlayerController *)self sbdlObservationController];
    v59[0] = @"bounds";
    v59[1] = @"frame";
    v59[2] = @"transform";
    v59[3] = @"affineTransform";
    v59[4] = @"sublayerTransform";
    v59[5] = @"videoGravity";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_3;
    v24[3] = &unk_1E5FC4750;
    v24[4] = v56;
    v24[5] = v53;
    v24[6] = v49;
    v24[7] = &v37;
    v24[8] = &v25;
    id v23 = (id)[v21 startObserving:v12 keyPaths:v22 includeInitialValue:1 observationHandler:v24];

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v56, 8);
  }
}

void __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_3(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_4;
  block[3] = &unk_1E5FC4728;
  objc_copyWeak(&v8, &location);
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = v3;
  uint64_t v7 = *(void *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  long long v3 = [WeakRetained pictureInPictureController];
  long long v4 = [v3 contentSource];
  long long v5 = [v4 sampleBufferDisplayLayer];

  if (WeakRetained)
  {
    if (v5)
    {
      long long v6 = *(CGRect **)(*(void *)(a1 + 32) + 8);
      [v5 frame];
      v79.origin.x = v7;
      v79.origin.y = v8;
      v79.size.double width = v9;
      v79.size.height = v10;
      if (!CGRectEqualToRect(v6[1], v79)) {
        goto LABEL_8;
      }
      v11 = *(CGRect **)(*(void *)(a1 + 40) + 8);
      [v5 bounds];
      v80.origin.x = v12;
      v80.origin.y = v13;
      v80.size.double width = v14;
      v80.size.height = v15;
      if (!CGRectEqualToRect(v11[1], v80)) {
        goto LABEL_8;
      }
      uint64_t v16 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
      [v5 affineTransform];
      long long v17 = v16[3];
      *(_OWORD *)&t1.m11 = v16[2];
      *(_OWORD *)&t1.m13 = v17;
      *(_OWORD *)&t1.m21 = v16[4];
      if (!CGAffineTransformEqualToTransform((CGAffineTransform *)&t1, &t2)) {
        goto LABEL_8;
      }
      uint64_t v18 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
      [v5 transform];
      long long v19 = v18[7];
      *(_OWORD *)&t1.m31 = v18[6];
      *(_OWORD *)&t1.m33 = v19;
      long long v20 = v18[9];
      *(_OWORD *)&t1.m41 = v18[8];
      *(_OWORD *)&t1.m43 = v20;
      long long v21 = v18[3];
      *(_OWORD *)&t1.m11 = v18[2];
      *(_OWORD *)&t1.m13 = v21;
      long long v22 = v18[5];
      *(_OWORD *)&t1.m21 = v18[4];
      *(_OWORD *)&t1.m23 = v22;
      if (!CATransform3DEqualToTransform(&t1, &b)) {
        goto LABEL_8;
      }
      id v23 = *(_OWORD **)(*(void *)(a1 + 64) + 8);
      [v5 sublayerTransform];
      long long v24 = v23[7];
      *(_OWORD *)&t1.m31 = v23[6];
      *(_OWORD *)&t1.m33 = v24;
      long long v25 = v23[9];
      *(_OWORD *)&t1.m41 = v23[8];
      *(_OWORD *)&t1.m43 = v25;
      long long v26 = v23[3];
      *(_OWORD *)&t1.m11 = v23[2];
      *(_OWORD *)&t1.m13 = v26;
      long long v27 = v23[5];
      *(_OWORD *)&t1.m21 = v23[4];
      *(_OWORD *)&t1.m23 = v27;
      if (!CATransform3DEqualToTransform(&t1, &v75))
      {
LABEL_8:
        [v5 frame];
        v28 = *(void **)(*(void *)(a1 + 32) + 8);
        v28[4] = v29;
        v28[5] = v30;
        v28[6] = v31;
        v28[7] = v32;
        [v5 bounds];
        long long v33 = *(void **)(*(void *)(a1 + 40) + 8);
        v33[4] = v34;
        v33[5] = v35;
        v33[6] = v36;
        v33[7] = v37;
        [v5 affineTransform];
        v38 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
        long long v40 = v73;
        long long v39 = v74;
        v38[2] = v72;
        v38[3] = v40;
        v38[4] = v39;
        [v5 transform];
        long long v41 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
        long long v43 = v66;
        long long v42 = v67;
        long long v44 = v65;
        v41[2] = v64;
        v41[3] = v44;
        long long v46 = v70;
        long long v45 = v71;
        long long v47 = v69;
        v41[6] = v68;
        v41[7] = v47;
        v41[8] = v46;
        v41[9] = v45;
        v41[4] = v43;
        v41[5] = v42;
        [v5 sublayerTransform];
        long long v48 = *(_OWORD **)(*(void *)(a1 + 64) + 8);
        long long v50 = v58;
        long long v49 = v59;
        long long v51 = v57;
        v48[2] = v56;
        v48[3] = v51;
        long long v53 = v62;
        long long v52 = v63;
        long long v54 = v61;
        v48[6] = v60;
        v48[7] = v54;
        v48[8] = v53;
        v48[9] = v52;
        v48[4] = v50;
        v48[5] = v49;
        long long v55 = [WeakRetained pictureInPictureController];
        [v55 contentSourceVideoRectInWindowChanged];
      }
    }
  }
}

void __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v5 = a4;
  long long v6 = [v12 pictureInPictureController];
  CGFloat v7 = [v6 contentSource];
  CGFloat v8 = [v7 sampleBufferDisplayLayer];
  CGFloat v9 = [v8 sampleBufferRenderer];
  CGFloat v10 = [v9 timebase];

  if (v10)
  {
    v11 = [v5 object];

    if (v10 == v11) {
      [v12 invalidatePlaybackState];
    }
  }
}

uint64_t __63__AVSampleBufferDisplayLayerPlayerController__startObservation__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F153E0];
  id v3 = a2;
  long long v4 = [v2 sharedInstance];
  objc_msgSend(v3, "setPictureInPictureAvailable:", objc_msgSend(v4, "isPiPAvailable"));

  uint64_t v5 = [v3 isPictureInPictureAvailable];

  return +[AVPlayerController setCachedIsPictureInPictureSupported:v5];
}

- (void)_updateBackgroundAudioPlaybackPolicy
{
  p_pictureInPictureController = &self->_pictureInPictureController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureController);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_pictureInPictureController);
    CGFloat v7 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
    int v8 = [v6 pictureInPictureControllerShouldProhibitBackgroundAudioPlayback:v7];

    if (v8) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  id v10 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
  [v10 setBackgroundPlaybackPolicy:v9];
}

- (void)_updateStatus
{
  [(AVSampleBufferDisplayLayerPlayerController *)self contentDimensions];
  BOOL v7 = ((v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v4 >= 0
    || (unint64_t)(v4 - 1) < 0xFFFFFFFFFFFFFLL;
  BOOL v9 = (v3 < 0 || ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(v3 - 1) > 0xFFFFFFFFFFFFELL;
  uint64_t v10 = 1;
  if (!v9 && v7)
  {
    [(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange];
    if ((v14 & 1) == 0
      || ([(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange], (v13 & 1) == 0)
      || ([(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange], v12)
      || ([(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange], v11 < 0))
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 2;
    }
  }
  [(AVSampleBufferDisplayLayerPlayerController *)self setStatus:v10];
}

- (void)_updatePlaybackStateTiming
{
  id v11 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackState];
  [v11 currentElapsedTime];
  double v4 = v3;
  if ([v11 isPaused])
  {
    double v5 = 0.0;
    double v6 = NAN;
  }
  else
  {
    +[AVValueTiming currentTimeStamp];
    double v6 = v7;
    [v11 timelineRate];
    double v5 = v8;
  }
  BOOL v9 = [[AVValueTiming alloc] initWithAnchorValue:v4 anchorTimeStamp:v6 rate:v5];
  epoch = (void *)self->super._seekToTimeInternal.epoch;
  self->super._seekToTimeInternal.epoch = (int64_t)v9;
}

- (void)setEnqueuedBufferDimensions:(CGSize)a3
{
  *(CGSize *)&self->_playbackDelegateAdapter = a3;
  double v4 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
  [v4 contentSourceVideoRectInWindowChanged];

  [(AVSampleBufferDisplayLayerPlayerController *)self _updateStatus];
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return 0;
}

- (id)maxTiming
{
  [(AVSampleBufferDisplayLayerPlayerController *)self contentDuration];

  return +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
}

- (id)minTiming
{
  return +[AVValueTiming valueTimingWithAnchorValue:0.0 anchorTimeStamp:NAN rate:0.0];
}

- (id)timing
{
  return self->super._seekToTimeInternal.epoch;
}

- (BOOL)hasLiveStreamingContent
{
  [(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange];
  if (v6)
  {
    [(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange];
    return (v5 >> 2) & 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)contentDurationWithinEndTimes
{
  v2 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackState];
  [v2 timelineDuration];
  double v4 = v3;

  return v4;
}

- (double)currentTimeWithinEndTimes
{
  v2 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackState];
  [v2 currentElapsedTime];
  double v4 = v3;

  return v4;
}

- (double)rate
{
  v2 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackState];
  [v2 timelineRate];
  double v4 = v3;

  return v4;
}

- (BOOL)isPictureInPicturePossible
{
  if ([(AVSampleBufferDisplayLayerPlayerController *)self status] == 3) {
    return 0;
  }

  return [(AVSampleBufferDisplayLayerPlayerController *)self isPictureInPictureAvailable];
}

- (void)setPictureInPictureInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferDisplayLayerPlayerController;
  -[AVPlayerController setPictureInPictureInterrupted:](&v5, sel_setPictureInPictureInterrupted_);
  if (v3) {
    [(AVSampleBufferDisplayLayerPlayerController *)self setPlaying:0];
  }
}

- (void)togglePlaybackEvenWhenInBackground:(id)a3
{
  uint64_t v4 = [(AVSampleBufferDisplayLayerPlayerController *)self isPlaying] ^ 1;

  [(AVSampleBufferDisplayLayerPlayerController *)self setPlaying:v4];
}

- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(AVSampleBufferDisplayLayerPlayerController *)self isPlaying];
  if (v7) {
    [(AVSampleBufferDisplayLayerPlayerController *)self togglePlaybackEvenWhenInBackground:self];
  }
  double v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = @"NO";
    long long v17 = "-[AVSampleBufferDisplayLayerPlayerController seekByTimeInterval:toleranceBefore:toleranceAfter:]";
    *(_DWORD *)buf = 136315650;
    if (v7) {
      BOOL v9 = @"YES";
    }
    __int16 v18 = 2048;
    double v19 = a3;
    __int16 v20 = 2112;
    long long v21 = v9;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s  interval: %f shouldResumePlayback: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v10 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackDelegate];
  id v11 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
  CMTimeMakeWithSeconds(&v15, a3, 90000);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__AVSampleBufferDisplayLayerPlayerController_seekByTimeInterval_toleranceBefore_toleranceAfter___block_invoke;
  v12[3] = &unk_1E5FC46C0;
  objc_copyWeak(&v13, (id *)buf);
  BOOL v14 = v7;
  [v10 pictureInPictureController:v11 skipByInterval:&v15 completionHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __96__AVSampleBufferDisplayLayerPlayerController_seekByTimeInterval_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Done seeking.", buf, 2u);
    }

    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v4 = _AVLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "Resuming playback after a seek.", v5, 2u);
      }

      [WeakRetained togglePlaybackEvenWhenInBackground:WeakRetained];
    }
  }
}

- (void)pauseForAllCoordinatedPlaybackParticipants:(BOOL)a3
{
}

- (void)setPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVSampleBufferDisplayLayerPlayerController *)self isPlaying] != a3)
  {
    objc_super v5 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackDelegateAdapter];
    char v6 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
    [v5 pictureInPictureController:v6 setPlaying:v3];

    [(AVSampleBufferDisplayLayerPlayerController *)self invalidatePlaybackState];
  }
}

- (BOOL)isPlaying
{
  return ![(AVSampleBufferDisplayLayerPlayerController *)self isPaused];
}

- (int64_t)timeControlStatus
{
  v2 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackState];
  if ([v2 isPaused])
  {
    int64_t v3 = 0;
  }
  else
  {
    [v2 timelineRate];
    if (v4 == 0.0) {
      int64_t v3 = 1;
    }
    else {
      int64_t v3 = 2;
    }
  }

  return v3;
}

- (BOOL)isPaused
{
  v2 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackState];
  char v3 = [v2 isPaused];

  return v3;
}

- (void)setPlaybackState:(id)a3
{
  id v5 = a3;
  p_timeControlStatus = &self->_timeControlStatus;
  if (self->_timeControlStatus != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_timeControlStatus, a3);
    p_timeControlStatus = (int64_t *)[(AVSampleBufferDisplayLayerPlayerController *)self _updatePlaybackStateTiming];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_timeControlStatus, v5);
}

- (void)invalidatePlaybackState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v25.value) = 136315138;
      *(CMTimeValue *)((char *)&v25.value + 4) = (CMTimeValue)"-[AVSampleBufferDisplayLayerPlayerController invalidatePlaybackState]";
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v25, 0xCu);
    }
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    double v4 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackDelegateAdapter];
    id v5 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
    uint64_t v6 = [v4 pictureInPictureControllerIsPlaybackPaused:v5];

    id v7 = [(AVSampleBufferDisplayLayerPlayerController *)self playbackDelegateAdapter];
    double v8 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
    if (v7)
    {
      [v7 pictureInPictureControllerTimeRangeForPlayback:v8];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
    }
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    [(AVSampleBufferDisplayLayerPlayerController *)self setContentTimeRange:v20];

    memset(&v25, 0, sizeof(v25));
    [(AVSampleBufferDisplayLayerPlayerController *)self _currentSBDLTime];
    [(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange];
    CMTime rhs = v17;
    CMTimeSubtract(&v25, &lhs, &rhs);
    BOOL v9 = [AVPictureInPicturePlaybackState alloc];
    CMTime time = v25;
    double Seconds = CMTimeGetSeconds(&time);
    [(AVSampleBufferDisplayLayerPlayerController *)self contentTimeRange];
    CMTime v15 = v14;
    double v11 = CMTimeGetSeconds(&v15);
    [(AVSampleBufferDisplayLayerPlayerController *)self _effectiveRate];
    id v13 = [(AVPictureInPicturePlaybackState *)v9 initWithElapsedTime:v6 timelineDuration:Seconds timelineRate:v11 paused:v12];
    [(AVSampleBufferDisplayLayerPlayerController *)self setPlaybackState:v13];

    [(AVSampleBufferDisplayLayerPlayerController *)self _updateBackgroundAudioPlaybackPolicy];
    [(AVSampleBufferDisplayLayerPlayerController *)self _updateStatus];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__AVSampleBufferDisplayLayerPlayerController_invalidatePlaybackState__block_invoke;
    block[3] = &unk_1E5FC4698;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__AVSampleBufferDisplayLayerPlayerController_invalidatePlaybackState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidatePlaybackState];
}

- (void)setPictureInPictureController:(id)a3
{
  p_playbackState = &self->_playbackState;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackState);

  if (WeakRetained)
  {
    id v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Expect this to only be set once.", v10, 2u);
    }
  }
  objc_storeWeak((id *)p_playbackState, v5);
  double v8 = [v5 contentSource];

  BOOL v9 = [v8 sampleBufferPlaybackDelegate];
  [(AVSampleBufferDisplayLayerPlayerController *)self setPlaybackDelegate:v9];

  [(AVSampleBufferDisplayLayerPlayerController *)self _startObservation];
}

- (void)setPlaybackDelegate:(id)a3
{
  p_pictureInPictureController = &self->_pictureInPictureController;
  id v5 = a3;
  objc_storeWeak((id *)p_pictureInPictureController, v5);
  uint64_t v6 = +[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegateAdapterWithDelegate:v5];

  [(AVSampleBufferDisplayLayerPlayerController *)self setPlaybackDelegateAdapter:v6];

  [(AVSampleBufferDisplayLayerPlayerController *)self invalidatePlaybackState];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentSBDLTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  double v4 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
  id v5 = [v4 contentSource];
  uint64_t v6 = [v5 sampleBufferDisplayLayer];
  id v7 = [v6 sampleBufferRenderer];
  double v8 = (void *)[v7 timebase];

  if (v8)
  {
    CFRetain(v8);
    CMTimebaseGetTime(&v10, (CMTimebaseRef)v8);
    *(CMTime *)retstr = v10;
    CFRelease(v8);
  }
  return result;
}

- (double)_effectiveRate
{
  v2 = [(AVSampleBufferDisplayLayerPlayerController *)self pictureInPictureController];
  char v3 = [v2 contentSource];
  double v4 = [v3 sampleBufferDisplayLayer];
  id v5 = [v4 sampleBufferRenderer];
  uint64_t v6 = (void *)[v5 timebase];

  if (!v6) {
    return 0.0;
  }
  CFRetain(v6);
  double EffectiveRate = CMTimebaseGetEffectiveRate((CMTimebaseRef)v6);
  CFRelease(v6);
  return EffectiveRate;
}

- (AVSampleBufferDisplayLayerPlayerController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVSampleBufferDisplayLayerPlayerController;
  v2 = [(AVPlayerController *)&v9 init];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    LOBYTE(v2->_timing) = [v3 isPiPAvailable];

    double v4 = [[AVPictureInPicturePlaybackState alloc] initWithElapsedTime:1 timelineDuration:NAN timelineRate:NAN paused:0.0];
    timeControlStatus = (void *)v2->_timeControlStatus;
    v2->_timeControlStatus = (int64_t)v4;

    uint64_t v6 = [[AVValueTiming alloc] initWithAnchorValue:NAN anchorTimeStamp:NAN rate:0.0];
    epoch = (void *)v2->super._seekToTimeInternal.epoch;
    v2->super._seekToTimeInternal.epoch = (int64_t)v6;
  }
  return v2;
}

- (void)dealloc
{
  char v3 = [(AVSampleBufferDisplayLayerPlayerController *)self sbdlObservationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferDisplayLayerPlayerController;
  [(AVPlayerController *)&v4 dealloc];
}

+ (id)keyPathsForValuesAffectingMaxTiming
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"contentDuration", 0);
}

+ (id)keyPathsForValuesAffectingTiming
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playbackState", 0);
}

+ (id)keyPathsForValuesAffectingHasLiveStreamingContent
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"contentTimeRange";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_super v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingContentDuration
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"contentDurationWithinEndTimes";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_super v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playbackState.timelineDuration";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_super v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playbackState";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_super v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingRate
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playbackState.timelineRate";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_super v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingContentDimensions
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"enqueuedBufferDimensions"];
}

+ (id)keyPathsForValuesAffectingPictureInPicturePossible
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"status";
  v6[1] = @"pictureInPictureAvailable";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  objc_super v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingPlaying
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"paused"];
}

+ (id)keyPathsForValuesAffectingTimeControlStatus
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playbackState.paused", @"playbackState.timelineRate", 0);
}

+ (id)keyPathsForValuesAffectingPaused
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playbackState.paused", 0);
}

@end