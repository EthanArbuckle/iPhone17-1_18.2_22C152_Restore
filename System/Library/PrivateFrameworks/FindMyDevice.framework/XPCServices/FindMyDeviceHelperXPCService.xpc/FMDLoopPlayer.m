@interface FMDLoopPlayer
- (AVQueuePlayer)player;
- (BOOL)addedObservers;
- (FMDLoopPlayer)initWithPlayer:(id)a3;
- (float)_adjustAudioVolumeForOptimalRampingPerception:(float)a3;
- (id)_audioMixForVolumeRampingWithDuration:(double)a3 toneAsset:(id)a4 toneAssetDuration:(double)a5 itemIndex:(unint64_t)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playURL:(id)a3;
- (void)playbackInLoopWithURL:(id)a3;
- (void)setAddedObservers:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)startObservingPlayerAndItem;
- (void)stop;
- (void)stopObservingPlayerAndItem;
@end

@implementation FMDLoopPlayer

- (FMDLoopPlayer)initWithPlayer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDLoopPlayer;
  v5 = [(FMDLoopPlayer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FMDLoopPlayer *)v5 setPlayer:v4];
  }

  return v6;
}

- (void)playURL:(id)a3
{
}

- (void)stop
{
  [(AVQueuePlayer *)self->_player setVibrationPattern:0];
  [(AVQueuePlayer *)self->_player pause];
  [(FMDLoopPlayer *)self stopObservingPlayerAndItem];
  player = self->_player;

  [(AVQueuePlayer *)player removeAllItems];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_1000272F8 == a6)
  {
    v20 = [v12 objectForKey:NSKeyValueChangeNewKey];
    id v21 = [v20 unsignedIntegerValue];

    if (v21 == (id)2)
    {
      id v22 = v11;
      v17 = sub_10000CD44();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v22 error];
        LODWORD(v28) = 138412290;
        *(void *)((char *)&v28 + 4) = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDLoopPlayer: End looping since player has failed with error %@", (uint8_t *)&v28, 0xCu);
        goto LABEL_10;
      }
LABEL_19:

      [(FMDLoopPlayer *)self stop];
LABEL_20:
    }
  }
  else
  {
    if (off_100027300 == a6)
    {
      id v23 = v11;
      v24 = [v23 items];
      id v25 = [v24 count];

      if (v25)
      {
        v26 = [v13 objectForKeyedSubscript:NSKeyValueChangeOldKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v28 = *(_OWORD *)&kCMTimeZero.value;
          CMTimeEpoch epoch = kCMTimeZero.epoch;
          [v26 seekToTime:&v28 completionHandler:0];
          [(FMDLoopPlayer *)self stopObservingPlayerAndItem];
          v27 = [v26 audioMix];

          if (!v27) {
            [v23 insertItem:v26 afterItem:0];
          }
          [(FMDLoopPlayer *)self startObservingPlayerAndItem];
        }

        goto LABEL_20;
      }
      v17 = sub_10000CD44();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDLoopPlayer: Play queue emptied out due to bad player item. End looping.", (uint8_t *)&v28, 2u);
      }
      goto LABEL_19;
    }
    if (off_100027308 == a6)
    {
      v14 = [v12 objectForKey:NSKeyValueChangeNewKey];
      id v15 = [v14 unsignedIntegerValue];

      if (v15 == (id)2)
      {
        id v16 = v11;
        v17 = sub_10000CD44();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v16 currentItem];
          v19 = [v18 error];
          LODWORD(v28) = 138412290;
          *(void *)((char *)&v28 + 4) = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDLoopPlayer: End looping since player item has failed with error %@", (uint8_t *)&v28, 0xCu);

LABEL_10:
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
  }
}

- (void)startObservingPlayerAndItem
{
  if (!self->_addedObservers)
  {
    [(AVQueuePlayer *)self->_player addObserver:self forKeyPath:@"status" options:1 context:off_1000272F8];
    [(AVQueuePlayer *)self->_player addObserver:self forKeyPath:@"currentItem" options:2 context:off_100027300];
    [(AVQueuePlayer *)self->_player addObserver:self forKeyPath:@"currentItem.status" options:1 context:off_100027308];
    self->_addedObservers = 1;
  }
}

- (void)stopObservingPlayerAndItem
{
  if (self->_addedObservers)
  {
    [(AVQueuePlayer *)self->_player removeObserver:self forKeyPath:@"status" context:off_1000272F8];
    [(AVQueuePlayer *)self->_player removeObserver:self forKeyPath:@"currentItem" context:off_100027300];
    [(AVQueuePlayer *)self->_player removeObserver:self forKeyPath:@"currentItem.status" context:off_100027308];
    self->_addedObservers = 0;
  }
}

- (void)playbackInLoopWithURL:(id)a3
{
  id v4 = a3;
  v5 = +[AVURLAsset assetWithURL:v4];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000050D0;
  v12[3] = &unk_10001C558;
  objc_copyWeak(&v15, &location);
  id v6 = v5;
  id v13 = v6;
  v14 = self;
  __asm { FMOV            V0.2D, #5.0 }
  long long v16 = _Q0;
  [v6 loadValuesAsynchronouslyForKeys:&off_100020470 completionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (float)_adjustAudioVolumeForOptimalRampingPerception:(float)a3
{
  return (float)(exp2f(a3) * 0.25) + -0.25;
}

- (id)_audioMixForVolumeRampingWithDuration:(double)a3 toneAsset:(id)a4 toneAssetDuration:(double)a5 itemIndex:(unint64_t)a6
{
  id v10 = a4;
  if (a3 <= 0.00000011920929 || (double v11 = (double)a6 * a5, v11 >= a3))
  {
    v26 = 0;
  }
  else
  {
    if (v11 + a5 <= a3) {
      double v12 = v11 + a5;
    }
    else {
      double v12 = a3;
    }
    double v13 = v11 / a3;
    *(float *)&double v13 = v11 / a3;
    [(FMDLoopPlayer *)self _adjustAudioVolumeForOptimalRampingPerception:v13];
    float v16 = v15;
    float v14 = v12 / a3;
    *(float *)&double v17 = v14;
    [(FMDLoopPlayer *)self _adjustAudioVolumeForOptimalRampingPerception:v17];
    float v19 = v18;
    v20 = sub_10000CD44();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.value) = 138545666;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2050;
      *(double *)((char *)&buf.flags + 2) = a3;
      HIWORD(buf.epoch) = 2114;
      id v33 = v10;
      __int16 v34 = 2050;
      double v35 = a5;
      __int16 v36 = 2050;
      unint64_t v37 = a6;
      __int16 v38 = 2050;
      double v39 = v16;
      __int16 v40 = 2050;
      double v41 = v19;
      __int16 v42 = 2050;
      double v43 = v12 - v11;
      __int16 v44 = 2050;
      double v45 = (double)a6 * a5;
      __int16 v46 = 2050;
      double v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@: _audioMixForVolumeRampingWithDuration:(%{public}f) toneAsset:(%{public}@) toneAssetDuration:(%{public}f) itemIndex:(%{public}lu): Ramping volume from %{public}f to %{public}f over %{public}f seconds, between overall playback timestamps %{public}f and %{public}f.", (uint8_t *)&buf, 0x66u);
    }

    id v21 = [v10 tracksWithMediaType:AVMediaTypeAudio];
    id v22 = [v21 firstObject];

    id v23 = +[AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:v22];
    CMTimeMakeWithSeconds(&v29, v12 - v11, 600);
    CMTime buf = kCMTimeZero;
    CMTimeRangeMake(&v30, &buf, &v29);
    *(float *)&double v24 = v16;
    *(float *)&double v25 = v19;
    [v23 setVolumeRampFromStartVolume:&v30 toEndVolume:v24 timeRange:v25];
    v26 = +[AVMutableAudioMix audioMix];
    v31 = v23;
    v27 = +[NSArray arrayWithObjects:&v31 count:1];
    [v26 setInputParameters:v27];
  }

  return v26;
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (BOOL)addedObservers
{
  return self->_addedObservers;
}

- (void)setAddedObservers:(BOOL)a3
{
  self->_addedObservers = a3;
}

- (void).cxx_destruct
{
}

@end