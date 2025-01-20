@interface IMInternalAVAudioPlayer
- (BOOL)_playAtTime:(double)a3;
- (BOOL)isPlaying;
- (BOOL)playAtTime:(double)a3;
- (IMInternalAVAudioPlayer)initWithContentsOfURL:(id)a3 playerType:(int64_t)a4;
- (IMInternalAVAudioPlayerDelegate)delegate;
- (double)currentTime;
- (double)deviceCurrentTime;
- (double)duration;
- (float)volume;
- (int64_t)playerType;
- (void)_handleAVPlayerItemStateChange;
- (void)_notifyPlayerDidFinishSuccessfully:(BOOL)a3;
- (void)_notifyPlayerDidPrepareAudioFileSuccessfully:(BOOL)a3;
- (void)_playerItemDidEndNotification:(id)a3;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)prepareToPlay;
- (void)setDelegate:(id)a3;
- (void)setVolume:(float)a3;
- (void)stop;
@end

@implementation IMInternalAVAudioPlayer

- (IMInternalAVAudioPlayer)initWithContentsOfURL:(id)a3 playerType:(int64_t)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)IMInternalAVAudioPlayer;
  v7 = [(IMInternalAVAudioPlayer *)&v40 init];
  uint64_t v10 = (uint64_t)v7;
  v11 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend_isFileURL(v6, v8, v9))
    {
      *(void *)(v10 + 48) = a4;
      if (a4 == 1)
      {
        uint64_t v41 = *MEMORY[0x263EFA2A8];
        v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, 0xFFFFLL);
        v42[0] = v13;
        v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v42, &v41, 1);

        v17 = objc_msgSend_URLAssetWithURL_options_(MEMORY[0x263EFA8D0], v16, (uint64_t)v6, v15);
        uint64_t v19 = objc_msgSend_playerItemWithAsset_(MEMORY[0x263EFA800], v18, (uint64_t)v17);
        v20 = *(void **)(v10 + 24);
        *(void *)(v10 + 24) = v19;

        objc_msgSend_setPlayHapticTracks_(*(void **)(v10 + 24), v21, 1);
        uint64_t v23 = objc_msgSend_playerWithPlayerItem_(MEMORY[0x263EFA7F0], v22, *(void *)(v10 + 24));
        v24 = *(void **)(v10 + 16);
        *(void *)(v10 + 16) = v23;

        objc_msgSend_addObserver_forKeyPath_options_context_(*(void **)(v10 + 24), v25, v10, @"status", 3, qword_267BC0040);
        v28 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v26, v27);
        objc_msgSend_addObserver_selector_name_object_(v28, v29, v10, sel__playerItemDidEndNotification_, *MEMORY[0x263EFA050], *(void *)(v10 + 24));

        v32 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v30, v31);
        objc_msgSend_addObserver_selector_name_object_(v32, v33, v10, sel__playerItemDidEndNotification_, *MEMORY[0x263EFA060], *(void *)(v10 + 24));
      }
      else
      {
        id v34 = objc_alloc(MEMORY[0x263EF93B8]);
        uint64_t v36 = objc_msgSend_initWithContentsOfURL_error_(v34, v35, (uint64_t)v6, 0);
        v37 = *(void **)(v10 + 8);
        *(void *)(v10 + 8) = v36;

        objc_msgSend_setDelegate_(*(void **)(v10 + 8), v38, v10);
      }
      v11 = (IMInternalAVAudioPlayer *)(id)v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a5;
  if ((void *)qword_267BC0040 == a6)
  {
    if (objc_msgSend_isEqualToString_(a3, v10, @"status"))
    {
      v13 = objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x263F081B8]);
      v15 = objc_msgSend_objectForKeyedSubscript_(v11, v14, *MEMORY[0x263F081C8]);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isEqualToNumber_(v13, v16, (uint64_t)v15) & 1) == 0)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_2180F4C88;
          block[3] = &unk_264300898;
          block[4] = self;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)IMInternalAVAudioPlayer;
    [(IMInternalAVAudioPlayer *)&v18 observeValueForKeyPath:a3 ofObject:a4 change:v11 context:a6];
  }
}

- (BOOL)playAtTime:(double)a3
{
  if (self->_playerType == 1 && !objc_msgSend_status(self->_playerItem, a2, v3))
  {
    self->_avPlayerPlayRequested = 1;
    return 1;
  }
  else
  {
    return MEMORY[0x270F9A6D0](self, sel__playAtTime_, v3);
  }
}

- (BOOL)_playAtTime:(double)a3
{
  uint64_t v5 = MEMORY[0x21D462110]("kCMTimeZero", @"CoreMedia");
  long long v13 = *(_OWORD *)v5;
  uint64_t v14 = *(void *)(v5 + 16);
  if (self->_playerType == 1)
  {
    self->_avPlayerPlayRequested = 0;
    if (self->_avPlayerState == 3)
    {
      avPlayer = self->_avPlayer;
      long long v11 = v13;
      uint64_t v12 = v14;
      objc_msgSend_seekToTime_(avPlayer, v6, (uint64_t)&v11);
    }
    objc_msgSend_play(self->_avPlayer, v6, v7);
    self->_avPlayerState = 1;
    return 1;
  }
  else
  {
    avAudioPlayer = self->_avAudioPlayer;
    return objc_msgSend_playAtTime_(avAudioPlayer, v6, v7, a3);
  }
}

- (double)deviceCurrentTime
{
  if (self->_playerType == 1) {
    return 0.0;
  }
  objc_msgSend_deviceCurrentTime(self->_avAudioPlayer, a2, v2);
  return result;
}

- (void)stop
{
  if (self->_playerType == 1)
  {
    if ((self->_avPlayerState & 0xFFFFFFFFFFFFFFFELL) != 2) {
      objc_msgSend_pause(self->_avPlayer, a2, v2);
    }
    self->_avPlayerState = 3;
  }
  else
  {
    avAudioPlayer = self->_avAudioPlayer;
    objc_msgSend_stop(avAudioPlayer, a2, v2);
  }
}

- (void)pause
{
  if (self->_playerType == 1)
  {
    objc_msgSend_pause(self->_avPlayer, a2, v2);
    self->_avPlayerState = 2;
  }
  else
  {
    avAudioPlayer = self->_avAudioPlayer;
    objc_msgSend_pause(avAudioPlayer, a2, v2);
  }
}

- (float)volume
{
  uint64_t v3 = 8;
  if (self->_playerType == 1) {
    uint64_t v3 = 16;
  }
  objc_msgSend_volume(*(void **)((char *)&self->super.isa + v3), a2, v2);
  return result;
}

- (void)setVolume:(float)a3
{
  uint64_t v4 = 8;
  if (self->_playerType == 1) {
    uint64_t v4 = 16;
  }
  objc_msgSend_setVolume_(*(void **)((char *)&self->super.isa + v4), a2, v3);
}

- (BOOL)isPlaying
{
  if (self->_playerType == 1) {
    return self->_avPlayerState == 1;
  }
  else {
    return objc_msgSend_isPlaying(self->_avAudioPlayer, a2, v2);
  }
}

- (double)currentTime
{
  if (qword_267BC0110 != -1) {
    dispatch_once(&qword_267BC0110, &unk_26C918EF8);
  }
  if (self->_playerType == 1)
  {
    uint64_t v4 = (void (*)(void *))off_267BC0108;
    avPlayer = self->_avPlayer;
    if (avPlayer) {
      objc_msgSend_currentTime(avPlayer, a2, v2);
    }
    else {
      memset(v8, 0, sizeof(v8));
    }
    v4(v8);
  }
  else
  {
    avAudioPlayer = self->_avAudioPlayer;
    objc_msgSend_currentTime(avAudioPlayer, a2, v2);
  }
  return result;
}

- (double)duration
{
  if (qword_267BC0120 != -1) {
    dispatch_once(&qword_267BC0120, &unk_26C919098);
  }
  if (qword_267BC0130 != -1) {
    dispatch_once(&qword_267BC0130, &unk_26C9190D8);
  }
  uint64_t v3 = MEMORY[0x21D462110]("kCMTimeIndefinite", @"CoreMedia");
  long long v18 = *(_OWORD *)v3;
  uint64_t v19 = *(void *)(v3 + 16);
  if (self->_playerType == 1)
  {
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    id v6 = objc_msgSend_currentItem(self->_avPlayer, v4, v5);
    uint64_t v9 = v6;
    if (v6)
    {
      objc_msgSend_duration(v6, v7, v8);
    }
    else
    {
      long long v16 = 0uLL;
      uint64_t v17 = 0;
    }

    long long v14 = v16;
    uint64_t v15 = v17;
    long long v12 = v18;
    uint64_t v13 = v19;
    if (off_267BC0118(&v14, &v12))
    {
      long long v14 = v16;
      uint64_t v15 = v17;
      off_267BC0128(&v14);
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    avAudioPlayer = self->_avAudioPlayer;
    objc_msgSend_duration(avAudioPlayer, v4, v5);
  }
  return result;
}

- (void)prepareToPlay
{
  if (self->_playerType != 1)
  {
    uint64_t v7 = objc_msgSend_prepareToPlay(self->_avAudioPlayer, a2, v2);
LABEL_7:
    id v6 = self;
    goto LABEL_8;
  }
  if (!objc_msgSend_isPlaying(self, a2, v2))
  {
    uint64_t v8 = objc_msgSend_status(self->_playerItem, v4, v5);
    if (!v8)
    {
      self->_avPlayerPrepareRequested = 1;
      return;
    }
    uint64_t v7 = v8 == 1;
    goto LABEL_7;
  }
  id v6 = self;
  uint64_t v7 = 1;
LABEL_8:
  objc_msgSend__notifyPlayerDidPrepareAudioFileSuccessfully_(v6, v4, v7);
}

- (void)dealloc
{
  objc_msgSend_removeObserver_forKeyPath_(self->_playerItem, a2, (uint64_t)self, @"status");
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v3, v4);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, *MEMORY[0x263EFA050], self->_playerItem);

  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, *MEMORY[0x263EFA060], self->_playerItem);

  objc_msgSend_setDelegate_(self->_avAudioPlayer, v11, 0);
  v12.receiver = self;
  v12.super_class = (Class)IMInternalAVAudioPlayer;
  [(IMInternalAVAudioPlayer *)&v12 dealloc];
}

- (void)_playerItemDidEndNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2180F53A8;
  v6[3] = &unk_2643007D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)_handleAVPlayerItemStateChange
{
  uint64_t v4 = objc_msgSend_status(self->_playerItem, a2, v2);
  uint64_t v7 = v4;
  if (self->_avPlayerPrepareRequested)
  {
    self->_avPlayerPrepareRequested = 0;
    objc_msgSend__notifyPlayerDidPrepareAudioFileSuccessfully_(self, v5, v4 == 1);
  }
  if (self->_avPlayerPlayRequested && v7 != 0)
  {
    self->_avPlayerPlayRequested = 0;
    MEMORY[0x270F9A6D0](self, sel__playAtTime_, v6);
  }
}

- (void)_notifyPlayerDidFinishSuccessfully:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_internalAVAudioPlayerDidFinishPlaying_successfully_(v6, v5, (uint64_t)self, v3);
  }
}

- (void)_notifyPlayerDidPrepareAudioFileSuccessfully:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_internalAVAudioPlayerDidPrepareAudioForPlaying_successfully_(v6, v5, (uint64_t)self, v3);
  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
}

- (int64_t)playerType
{
  return self->_playerType;
}

- (IMInternalAVAudioPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMInternalAVAudioPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avAudioPlayer, 0);
}

@end