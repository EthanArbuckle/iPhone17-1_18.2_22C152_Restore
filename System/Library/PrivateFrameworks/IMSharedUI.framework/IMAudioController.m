@interface IMAudioController
+ (Class)audioControllerClass;
+ (id)audioControllerWithContentsOfURLs:(id)a3;
- (BOOL)interrupted;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)shouldDuckOthers;
- (BOOL)shouldStopPlayingWhenSilent;
- (BOOL)shouldUseAVPlayer;
- (BOOL)shouldUseSpeaker;
- (IMAudioController)initWithContentsOfURLs:(id)a3;
- (IMAudioControllerDelegate)delegate;
- (IMAudioPlayer)audioPlayer;
- (IMAudioPlayer)listenAudioPlayer;
- (NSArray)audioURLs;
- (NSURL)currentURL;
- (double)currentMediaObjectDuration;
- (double)currentMediaObjectTime;
- (float)volume;
- (id)currentMediaObject;
- (unint64_t)audioSessionControllerOptions;
- (void)_notifyPlayerDidPrepareAudioURL:(id)a3 successfully:(BOOL)a4;
- (void)_playSoundWithURL:(id)a3 completion:(id)a4;
- (void)addContentsOfURL:(id)a3;
- (void)addContentsOfURLs:(id)a3;
- (void)audioPlayerCurrentTimeDidChange:(id)a3;
- (void)audioPlayerDidFinishPlaying:(id)a3;
- (void)audioPlayerDidPrepareAudioToPlay:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)pause;
- (void)play;
- (void)playAfterDelay:(double)a3;
- (void)playListenEndSound:(id)a3;
- (void)playListenSound:(id)a3;
- (void)prepareToPlay;
- (void)setAudioPlayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setListenAudioPlayer:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setShouldDuckOthers:(BOOL)a3;
- (void)setShouldStopPlayingWhenSilent:(BOOL)a3;
- (void)setShouldUseAVPlayer:(BOOL)a3;
- (void)setShouldUseSpeaker:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)stop;
@end

@implementation IMAudioController

- (void)dealloc
{
  objc_msgSend_setDelegate_(self->_audioPlayer, a2, 0);
  objc_msgSend_stop(self->_audioPlayer, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)IMAudioController;
  [(IMAudioController *)&v5 dealloc];
}

- (IMAudioController)initWithContentsOfURLs:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMAudioController;
  v7 = [(IMAudioController *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_mutableCopy(v4, v5, v6);
    audioURLs = v7->_audioURLs;
    v7->_audioURLs = (NSMutableArray *)v8;

    v7->_shouldUseSpeaker = 1;
    v7->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

+ (Class)audioControllerClass
{
  return (Class)objc_opt_class();
}

+ (id)audioControllerWithContentsOfURLs:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc((Class)objc_msgSend_audioControllerClass(a1, v5, v6));
  v9 = objc_msgSend_initWithContentsOfURLs_(v7, v8, (uint64_t)v4);

  return v9;
}

- (NSArray)audioURLs
{
  v3 = objc_msgSend_copy(self->_audioURLs, a2, v2);
  return (NSArray *)v3;
}

- (void)addContentsOfURL:(id)a3
{
}

- (void)addContentsOfURLs:(id)a3
{
}

- (void)setShouldUseSpeaker:(BOOL)a3
{
  if (self->_shouldUseSpeaker != a3)
  {
    self->_shouldUseSpeaker = a3;
    if (objc_msgSend_isPlaying(self, a2, a3))
    {
      objc_msgSend_sharedInstance(IMAudioSessionController, v4, v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = objc_msgSend_audioSessionControllerOptions(self, v6, v7);
      objc_msgSend_activateWithOptions_completion_(v10, v9, v8, 0);
    }
  }
}

- (void)setShouldStopPlayingWhenSilent:(BOOL)a3
{
  if (self->_shouldStopPlayingWhenSilent != a3)
  {
    self->_shouldStopPlayingWhenSilent = a3;
    if (objc_msgSend_isPlaying(self, a2, a3))
    {
      objc_msgSend_sharedInstance(IMAudioSessionController, v4, v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = objc_msgSend_audioSessionControllerOptions(self, v6, v7);
      objc_msgSend_activateWithOptions_completion_(v10, v9, v8, 0);
    }
  }
}

- (void)setShouldDuckOthers:(BOOL)a3
{
  if (self->_shouldDuckOthers != a3)
  {
    self->_shouldDuckOthers = a3;
    if (objc_msgSend_isPlaying(self, a2, a3))
    {
      objc_msgSend_sharedInstance(IMAudioSessionController, v4, v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = objc_msgSend_audioSessionControllerOptions(self, v6, v7);
      objc_msgSend_activateWithOptions_completion_(v10, v9, v8, 0);
    }
  }
}

- (unint64_t)audioSessionControllerOptions
{
  unint64_t shouldUseSpeaker = objc_msgSend_shouldUseSpeaker(self, a2, v2);
  if (objc_msgSend_shouldStopPlayingWhenSilent(self, v5, v6)) {
    shouldUseSpeaker |= 2uLL;
  }
  if (objc_msgSend_shouldDuckOthers(self, v7, v8)) {
    return shouldUseSpeaker | 4;
  }
  else {
    return shouldUseSpeaker;
  }
}

- (void)play
{
}

- (void)playAfterDelay:(double)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v5 = self->_audioURLs;
  uint64_t v8 = objc_msgSend_audio(IMSharedUILogs, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t currentIndex = self->_currentIndex;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = currentIndex;
    __int16 v60 = 1024;
    int v61 = objc_msgSend_count(v5, v9, v10);
    _os_log_impl(&dword_2180ED000, v8, OS_LOG_TYPE_INFO, "Playing %d of %d audio messages", buf, 0xEu);
  }

  objc_msgSend_audioPlayer(self, v12, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  if (v14)
  {
    if ((objc_msgSend_isPlaying(v14, v15, v16) & 1) == 0)
    {
      id location = 0;
      objc_initWeak(&location, v14);
      v19 = objc_msgSend_sharedInstance(IMAudioSessionController, v17, v18);
      uint64_t v22 = objc_msgSend_audioSessionControllerOptions(self, v20, v21);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = sub_2180F37AC;
      v53[3] = &unk_264300848;
      id v14 = v14;
      id v54 = v14;
      v57[1] = *(id *)&a3;
      objc_copyWeak(&v56, (id *)buf);
      objc_copyWeak(v57, &location);
      v55 = self;
      objc_msgSend_activateWithOptions_completion_(v19, v23, v22, v53);

      objc_destroyWeak(v57);
      objc_destroyWeak(&v56);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    unint64_t v24 = self->_currentIndex;
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v24 = 0;
      self->_unint64_t currentIndex = 0;
    }
    if (v24 >= objc_msgSend_count(v5, v15, v16))
    {
      id v14 = 0;
    }
    else
    {
      v26 = objc_msgSend_objectAtIndex_(v5, v25, self->_currentIndex);
      uint64_t shouldUseAVPlayer = objc_msgSend_shouldUseAVPlayer(self, v27, v28);
      v31 = objc_msgSend_audioPlayerWithContentsOfURL_shouldUseAVPlayer_(IMAudioPlayer, v30, (uint64_t)v26, shouldUseAVPlayer);
      objc_msgSend_setDelegate_(v31, v32, (uint64_t)self);
      objc_msgSend_setAudioPlayer_(self, v33, (uint64_t)v31);
      id location = 0;
      objc_initWeak(&location, v31);
      v36 = objc_msgSend_sharedInstance(IMAudioSessionController, v34, v35);
      uint64_t v39 = objc_msgSend_audioSessionControllerOptions(self, v37, v38);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = sub_2180F3908;
      v48[3] = &unk_264300848;
      id v14 = v31;
      id v49 = v14;
      v52[1] = *(id *)&a3;
      objc_copyWeak(&v51, (id *)buf);
      objc_copyWeak(v52, &location);
      v50 = self;
      objc_msgSend_activateWithOptions_completion_(v36, v40, v39, v48);

      v43 = objc_msgSend_delegate(self, v41, v42);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_duration(v14, v44, v45);
        objc_msgSend_audioController_didChangeProgressForContentAtURL_currentTime_duration_(v43, v46, (uint64_t)self, v26, 0.0, v47);
      }

      objc_destroyWeak(v52);
      objc_destroyWeak(&v51);

      objc_destroyWeak(&location);
    }
  }
  objc_destroyWeak((id *)buf);
}

- (void)prepareToPlay
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_2180F3DA0;
  v34 = sub_2180F3DB0;
  id v35 = 0;
  objc_msgSend_audioPlayer(self, a2, v2);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isPlaying((void *)v31[5], v4, v5))
  {
    objc_msgSend_audioURL((void *)v31[5], v6, v7);
    uint64_t v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(self, v9, (uint64_t)v8, 1);
  }
  else
  {
    if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL) {
      self->_unint64_t currentIndex = 0;
    }
    uint64_t v8 = self->_audioURLs;
    v12 = (void *)v31[5];
    if (v12) {
      goto LABEL_6;
    }
    unint64_t currentIndex = self->_currentIndex;
    if (currentIndex >= objc_msgSend_count(v8, v10, v11))
    {
      objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(self, v10, 0, 0);
      goto LABEL_8;
    }
    v12 = (void *)v31[5];
    if (v12)
    {
LABEL_6:
      uint64_t v13 = objc_msgSend_audioURL(v12, v10, v11);
    }
    else
    {
      uint64_t v13 = objc_msgSend_objectAtIndex_(v8, v10, self->_currentIndex);
    }
    uint64_t v16 = (void *)v13;
    v17 = objc_msgSend_sharedInstance(IMAudioSessionController, v14, v15);
    uint64_t v20 = objc_msgSend_audioSessionControllerOptions(self, v18, v19);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_2180F3DB8;
    v25[3] = &unk_264300870;
    id v21 = v17;
    id v26 = v21;
    v27 = self;
    id v22 = v16;
    id v28 = v22;
    v29 = &v30;
    objc_msgSend_activateWithOptions_completion_(v21, v23, v20, v25);
  }
LABEL_8:

  _Block_object_dispose(&v30, 8);
}

- (void)pause
{
  id v4 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_pause(v4, v5, v6);

  objc_msgSend_setPlaying_(self, v7, 0);
  objc_msgSend_delegate(self, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_audioControllerDidPause_(v11, v10, (uint64_t)self);
  }
}

- (void)stop
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_audio(IMSharedUILogs, a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v22[0] = 67109120;
    v22[1] = objc_msgSend_interrupted(self, v5, v6);
    _os_log_impl(&dword_2180ED000, v4, OS_LOG_TYPE_INFO, "Stop (interruption: %d)", (uint8_t *)v22, 8u);
  }

  uint64_t v9 = objc_msgSend_audioPlayer(self, v7, v8);
  objc_msgSend_stop(v9, v10, v11);

  objc_msgSend_setPlaying_(self, v12, 0);
  if ((objc_msgSend_interrupted(self, v13, v14) & 1) == 0)
  {
    v17 = objc_msgSend_sharedInstance(IMAudioSessionController, v15, v16);
    objc_msgSend_deactivate(v17, v18, v19);
  }
  uint64_t v20 = objc_msgSend_delegate(self, v15, v16);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_audioControllerDidStop_(v20, v21, (uint64_t)self);
  }
}

- (id)currentMediaObject
{
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend_objectAtIndex_(self->_audioURLs, a2, currentIndex);
  }
  return v3;
}

- (double)currentMediaObjectTime
{
  v3 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_currentTime(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)currentMediaObjectDuration
{
  v3 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_duration(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)setVolume:(float)a3
{
  objc_msgSend_audioPlayer(self, a2, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v5 = a3;
  objc_msgSend_setVolume_(v8, v6, v7, v5);
}

- (float)volume
{
  uint64_t v3 = objc_msgSend_audioPlayer(self, a2, v2);
  objc_msgSend_volume(v3, v4, v5);
  float v7 = v6;

  return v7;
}

- (void)audioPlayerCurrentTimeDidChange:(id)a3
{
  id v18 = a3;
  float v6 = objc_msgSend_delegate(self, v4, v5);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = objc_msgSend_currentMediaObject(self, v7, v8);
    objc_msgSend_currentTime(v18, v10, v11);
    double v13 = v12;
    objc_msgSend_duration(v18, v14, v15);
    objc_msgSend_audioController_didChangeProgressForContentAtURL_currentTime_duration_(v6, v16, (uint64_t)self, v9, v13, v17);
  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3
{
  id v4 = a3;
  float v7 = objc_msgSend_delegate(self, v5, v6);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = objc_msgSend_currentMediaObject(self, v8, v9);
    objc_msgSend_audioController_didFinishPlayingContentAtURL_(v7, v11, (uint64_t)self, v10);
  }
  objc_msgSend_setDelegate_(v4, v8, 0);
  objc_msgSend_setAudioPlayer_(self, v12, 0);
  unint64_t v13 = self->_currentIndex + 1;
  if (v13 >= objc_msgSend_count(self->_audioURLs, v14, v15))
  {
    if (objc_msgSend_shouldUseSpeaker(self, v16, v17))
    {
      objc_msgSend_stop(self, v18, v19);
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = sub_2180F43A0;
      v20[3] = &unk_264300898;
      v20[4] = self;
      objc_msgSend_playListenEndSound_(self, v18, (uint64_t)v20);
    }
  }
  else
  {
    ++self->_currentIndex;
    objc_msgSend_play(self, v16, v17);
  }
}

- (void)audioPlayerDidPrepareAudioToPlay:(id)a3 successfully:(BOOL)a4
{
  objc_msgSend_audioURL(a3, a2, (uint64_t)a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(self, v5, (uint64_t)v6, 1);
}

- (void)_notifyPlayerDidPrepareAudioURL:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  uint64_t v8 = objc_msgSend_delegate(self, v6, v7);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_audioController_didPrepareToPlayContentAtURL_successfully_(v8, v9, (uint64_t)self, v10, v4);
  }
}

- (void)_playSoundWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_msgSend_audioPlayerWithContentsOfURL_(IMAudioPlayer, v8, (uint64_t)v6);
  objc_msgSend_setListenAudioPlayer_(self, v10, (uint64_t)v9);
  id location = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2180F45B4;
  v13[3] = &unk_2643008C0;
  objc_copyWeak(&v15, &location);
  id v11 = v7;
  id v14 = v11;
  objc_msgSend_playAfterDelay_completion_(v9, v12, (uint64_t)v13, 0.0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)playListenSound:(id)a3
{
  id v4 = a3;
  IMURLForResourceFromSharedUIBundle(@"MessageListen", @"caf");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__playSoundWithURL_completion_(self, v5, (uint64_t)v6, v4);
}

- (void)playListenEndSound:(id)a3
{
  id v4 = a3;
  IMURLForResourceFromSharedUIBundle(@"MessageListenEnd", @"caf");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__playSoundWithURL_completion_(self, v5, (uint64_t)v6, v4);
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    objc_msgSend_delegate(self, a2, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_opt_respondsToSelector()) {
      objc_msgSend_audioControllerPlayingDidChange_(v5, v4, (uint64_t)self);
    }
  }
}

- (BOOL)shouldUseSpeaker
{
  return self->_shouldUseSpeaker;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  return self->_shouldStopPlayingWhenSilent;
}

- (BOOL)shouldDuckOthers
{
  return self->_shouldDuckOthers;
}

- (BOOL)shouldUseAVPlayer
{
  return self->_shouldUseAVPlayer;
}

- (void)setShouldUseAVPlayer:(BOOL)a3
{
  self->_uint64_t shouldUseAVPlayer = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (IMAudioControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMAudioControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (IMAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (IMAudioPlayer)listenAudioPlayer
{
  return self->_listenAudioPlayer;
}

- (void)setListenAudioPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_audioURLs, 0);
  objc_storeStrong((id *)&self->_listenAudioPlayer, 0);
}

@end