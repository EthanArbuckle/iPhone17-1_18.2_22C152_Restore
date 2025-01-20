@interface MediaPlayerHelper
+ (id)sharedSystemMusicPlayer;
+ (id)sharedSystemMusicPlayerQueue;
- (BOOL)_isCommandSupported:(unsigned int)a3;
- (BOOL)_isSetElapsedTimeAvailable;
- (BOOL)currentNowPlayingInfoArtworkExists;
- (BOOL)currentNowPlayingInfoTrackCountExists;
- (BOOL)fakeStreamTrackIndexSet;
- (BOOL)fakeStreamTrackIndexTimeExpired;
- (BOOL)iBooksAppSelected;
- (BOOL)iTunesUAppSelected;
- (BOOL)isLoadingRadioStation;
- (BOOL)podcastAppSelected;
- (MediaPlayerHelper)init;
- (OS_dispatch_queue)nowPlayingHandlerQueue;
- (double)currentNowPlayingInfoDuration;
- (double)currentPlaybackTime;
- (double)nowPlayingAppPlaybackRate;
- (double)nowPlayingAppPlaybackSpeed;
- (id)_nowPlayingInfoDesc:(id)a3;
- (id)currentNowPlayingInfoArtwork;
- (id)currentNowPlayingInfoString:(id)a3;
- (id)getPBQItemsFromQueueQuery;
- (id)nowPlayingAppName;
- (id)nowPlayingInfoTitleForAudiobookIndex:(unsigned int)a3;
- (int)currentRepeatMode;
- (int)currentShuffleMode;
- (int)nowPlayingAppPlaybackState;
- (int)prepareForPlaybackWithQuery:(id)a3 andFirstItem:(id)a4;
- (int)repeatModeCache;
- (int)shuffleModeCache;
- (unint64_t)currentNowPlayingInfoPID;
- (unsigned)_currentNowPlayingInfoTrack:(BOOL)a3;
- (unsigned)currentNowPlayingInfoAlbumTrack;
- (unsigned)currentNowPlayingInfoAlbumTrackCount;
- (unsigned)currentNowPlayingInfoChapter;
- (unsigned)currentNowPlayingInfoChapterCount;
- (unsigned)currentNowPlayingInfoDisc;
- (unsigned)currentNowPlayingInfoDiscCount;
- (unsigned)currentNowPlayingInfoNumber:(id)a3;
- (unsigned)currentNowPlayingInfoTrack;
- (unsigned)currentNowPlayingInfoTrackCount;
- (unsigned)nowPlayingAppIsIPodApp;
- (unsigned)nowPlayingAppIsPodcastApp;
- (unsigned)nowPlayingAppIsValid;
- (unsigned)nowPlayingAppIsVideosApp;
- (unsigned)nowPlayingAppIsiBooksApp;
- (unsigned)nowPlayingAppIsiTunesRadio;
- (unsigned)nowPlayingAppIsiTunesUApp;
- (void)_calcNewFakeStreamIndexCount;
- (void)_canShowCloudTracksDidChangeNotification:(id)a3;
- (void)_checkShuffleRepeatModeChange;
- (void)_findCommandRefForCommand:(unsigned int)a3;
- (void)_handleNowPlayingAppDidChange:(id)a3;
- (void)_handleNowPlayingAppIsPlayingDidChange:(unsigned __int8)a3;
- (void)_handleNowPlayingInfo:(__CFDictionary *)a3;
- (void)_handlePlaybackQueueDidChange;
- (void)_itemPlaybackDidEnd:(id)a3;
- (void)_mediaLibraryChanged:(id)a3;
- (void)_nowPlayingAppChanged:(id)a3;
- (void)_nowPlayingAppIsPlayingChanged:(id)a3;
- (void)_nowPlayingInfoChanged:(id)a3;
- (void)_nowPlayingItemChanged:(id)a3;
- (void)_playbackQueueDidChangeNotification:(id)a3;
- (void)_printNowPlayingInfo:(id)a3 forName:(id)a4;
- (void)_repeatModeChanged:(id)a3;
- (void)_resetFakeStreamTrackCount;
- (void)_setFakeStreamTrackIndex:(unsigned int)a3 fromPlay:(BOOL)a4;
- (void)_setFakeStreamTrackIndexForSetCurIndex:(unsigned int)a3;
- (void)_setNowPlayingApp:(id)a3;
- (void)_shuffleModeChanged:(id)a3;
- (void)_startMusicPlayerNotifications:(id)a3;
- (void)_stopMusicPlayerNotifications:(id)a3;
- (void)_supportedCommandsDidChange:(__CFArray *)a3;
- (void)_supportedCommandsDidChangeNotification;
- (void)_waitForNowPlayingInfoReceived;
- (void)dealloc;
- (void)initPBQItemsFromQueueQuery;
- (void)notifyExplicitControlOccurred;
- (void)postFakeShuffleModeChanged;
- (void)setExpectedRepeatMode:(int)a3;
- (void)setExpectedShuffleMode:(int)a3;
- (void)setIBooksAppSelected:(BOOL)a3;
- (void)setITunesUAppSelected:(BOOL)a3;
- (void)setPodcastAppSelected:(BOOL)a3;
- (void)setRepeatModeCache:(int)a3;
- (void)setShuffleModeCache:(int)a3;
@end

@implementation MediaPlayerHelper

- (void)_resetFakeStreamTrackCount
{
  if ((((_BYTE)self - 100) & 3) != 0
    || (self->_fakeStreamTrackCount = 0, (((_BYTE)self - 104) & 3) != 0)
    || (self->_fakeStreamTrackIndex = 0, self->_fakeStreamTrackIndexSet = 0, (((_BYTE)self - 92) & 3) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    self->_fakeStreamTrackIndexSetTimestamp = 0;
    self->_fakeStreamTrackIndexNeedChange = 0;
  }
}

- (void)_setFakeStreamTrackIndexForSetCurIndex:(unsigned int)a3
{
  if ((((_BYTE)self - 104) & 3) != 0
    || (uint64_t v4 = *(void *)&a3,
        self->_fakeStreamTrackIndex = a3,
        self->_BOOL fakeStreamTrackIndexSet = 1,
        v5 = sub_10006FADC(),
        (((_BYTE)self - 92) & 3) != 0))
  {
LABEL_6:
    __break(0x5516u);
    goto LABEL_7;
  }
  self->_fakeStreamTrackIndexSetTimestamp = v5;
  dword_100139858 = 4;
  BOOL fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
  if (fakeStreamTrackIndexSet < 2)
  {
    if ((((_BYTE)self - 100) & 3) == 0)
    {
      NSLog(@"MR: %s:%d index=%d, _fakeStreamTrackIndexSet=%d _fakeStreamTrackIndex=%d _fakeStreamTrackCount=%d _fakeStreamTrackIndexSetTimestamp=%u", "-[MediaPlayerHelper _setFakeStreamTrackIndexForSetCurIndex:]", 384, v4, fakeStreamTrackIndexSet, self->_fakeStreamTrackIndex, self->_fakeStreamTrackCount, v5);
      dispatch_time_t v7 = dispatch_time(0, 105000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003E528;
      block[3] = &unk_100121CA0;
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
      dispatch_time_t v8 = dispatch_time(0, 2005000000);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10003E65C;
      v9[3] = &unk_100121CA0;
      v9[4] = self;
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
      return;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(0x550Au);
}

- (void)_setFakeStreamTrackIndex:(unsigned int)a3 fromPlay:(BOOL)a4
{
  BOOL v4 = a4;
  if (dword_10013985C || a4)
  {
    if ((((_BYTE)self - 104) & 3) != 0) {
      goto LABEL_23;
    }
    self->_fakeStreamTrackIndex = a3;
    self->_BOOL fakeStreamTrackIndexSet = 1;
    dispatch_time_t v7 = sub_10006FADC();
    if (((unint64_t)&self->_fakeStreamTrackIndexSetTimestamp & 3) != 0) {
      goto LABEL_23;
    }
    self->_fakeStreamTrackIndexSetTimestamp = v7;
    if (v4)
    {
      dword_100139858 = dword_100139854;
      if (!dword_100139854)
      {
        if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0) {
          goto LABEL_23;
        }
        self->_fakeStreamTrackCount = 2;
        if (a3 == 1 && dword_100139860) {
          dword_100139858 = 2;
        }
      }
    }
    else if (!dword_100139858)
    {
      p_fakeStreamTrackCount = &self->_fakeStreamTrackCount;
      if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0) {
        goto LABEL_23;
      }
      int v9 = *p_fakeStreamTrackCount;
      if (*p_fakeStreamTrackCount <= 1)
      {
        int v9 = 2;
        unsigned int *p_fakeStreamTrackCount = 2;
      }
      BOOL v10 = __CFADD__(v9, 1);
      unsigned int v11 = v9 + 1;
      if (v10) {
        goto LABEL_25;
      }
      unsigned int *p_fakeStreamTrackCount = v11;
    }
    BOOL fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
    if (fakeStreamTrackIndexSet > 1)
    {
LABEL_24:
      __break(0x550Au);
LABEL_25:
      __break(0x5500u);
      return;
    }
    if ((((_BYTE)self - 100) & 3) == 0)
    {
      NSLog(@"MR: %s:%d fromPlay=%d _fakeStreamTrackIndexSet=%d _fakeStreamTrackIndex=%d _fakeStreamTrackCount=%d _fakeStreamTrackIndexSetTimestamp=%u", "-[MediaPlayerHelper _setFakeStreamTrackIndex:fromPlay:]", 450, v4, fakeStreamTrackIndexSet, self->_fakeStreamTrackIndex, self->_fakeStreamTrackCount, v7);
      if (self->_fakeStreamTrackIndexSet <= 1u)
      {
        if (self->_fakeStreamTrackIndexSet)
        {
          dispatch_time_t v13 = dispatch_time(0, 2005000000);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10003E97C;
          block[3] = &unk_100121CA0;
          block[4] = self;
          dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
        }
        return;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(0x5516u);
    goto LABEL_24;
  }
}

- (void)_calcNewFakeStreamIndexCount
{
  if (dword_100139858 != 3) {
    return;
  }
  uint32_t v4 = arc4random_uniform(8u);
  BOOL v5 = __CFADD__(v4, 2);
  unsigned int v6 = v4 + 2;
  if (v5)
  {
LABEL_7:
    __break(0x5500u);
  }
  else
  {
    p_fakeStreamTrackCount = &self->_fakeStreamTrackCount;
    if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0)
    {
LABEL_13:
      __break(0x5516u);
      return;
    }
    while (*p_fakeStreamTrackCount == v6)
    {
      uint32_t v7 = arc4random_uniform(8u);
      BOOL v5 = __CFADD__(v7, 2);
      unsigned int v6 = v7 + 2;
      if (v5) {
        goto LABEL_7;
      }
    }
  }
  self->_fakeStreamTrackCount = v6;
  uint32_t v8 = arc4random_uniform(v6);
  p_fakeStreamTrackIndex = &self->_fakeStreamTrackIndex;
  if ((p_fakeStreamTrackIndex & 3) != 0) {
    goto LABEL_13;
  }
  while (*p_fakeStreamTrackIndex == v8)
    uint32_t v8 = arc4random_uniform(*p_fakeStreamTrackCount);
  unsigned int *p_fakeStreamTrackIndex = v8;
}

- (BOOL)fakeStreamTrackIndexTimeExpired
{
  v3 = sub_10006FADC();
  p_fakeStreamTrackIndexSetTimestamp = &self->_fakeStreamTrackIndexSetTimestamp;
  if (((unint64_t)&self->_fakeStreamTrackIndexSetTimestamp & 3) != 0)
  {
    __break(0x5516u);
    goto LABEL_13;
  }
  BOOL v5 = v3;
  LODWORD(v3) = sub_100070ABC(self->_fakeStreamTrackIndexSetTimestamp, v3, 1);
  unsigned int fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
  if (fakeStreamTrackIndexSet >= 2)
  {
LABEL_13:
    __break(0x550Au);
    return (char)v3;
  }
  BOOL v7 = v3 > 0x7D0 || fakeStreamTrackIndexSet == 0;
  char v8 = v7;
  if (!v7) {
    NSLog(@"MR: %s:%d curTimeMs=%u _fakeStreamTrackIndexSetTimestamp=%u _fakeStreamTrackIndexSet=%d, Not Expired Yet!", "-[MediaPlayerHelper fakeStreamTrackIndexTimeExpired]", 501, v5, *p_fakeStreamTrackIndexSetTimestamp, 1);
  }
  LOBYTE(v3) = v8;
  return (char)v3;
}

- (void)_waitForNowPlayingInfoReceived
{
  if (self->_nowPlayingInfoEverReceived >= 2u) {
    goto LABEL_8;
  }
  if (self->_nowPlayingInfoEverReceived) {
    return;
  }
  v2 = "-[MediaPlayerHelper _waitForNowPlayingInfoReceived]";
  NSLog(@"MR: %s:%d wait for _nowPlayingInfoEverReceived, maxWaitTimeMs %d, maxWaitTimePerIterationMs %d, maxNumIterations %d", a2, "-[MediaPlayerHelper _waitForNowPlayingInfoReceived]", 518, 15000, 50, 300);
  unsigned int nowPlayingInfoEverReceived = self->_nowPlayingInfoEverReceived;
  if (nowPlayingInfoEverReceived > 1)
  {
LABEL_8:
    __break(0x550Au);
  }
  else
  {
    uint64_t v3 = 0;
    while (!nowPlayingInfoEverReceived)
    {
      if (v3 == 300)
      {
        NSLog(@"WARNING timedout waiting for nowPlayingInfo dictionary!, playback information may not be correct");
        unsigned int v6 = self->_nowPlayingInfoEverReceived;
        if (v6 > 1) {
          goto LABEL_8;
        }
        uint64_t v3 = 301;
        goto LABEL_12;
      }
      uint64_t v3 = (v3 + 1);
      usleep(0xC350u);
      unsigned int nowPlayingInfoEverReceived = self->_nowPlayingInfoEverReceived;
      if (nowPlayingInfoEverReceived >= 2) {
        goto LABEL_8;
      }
    }
  }
  unsigned int v6 = 1;
LABEL_12:
  NSLog(@"MR: %s:%d after waiting for _nowPlayingInfoEverReceived(%d), iteration %d / %d", v2, 529, v6, v3, 300);
}

- (void)_startMusicPlayerNotifications:(id)a3
{
  NSLog(@"system music player installed!", a2, a3);
  uint32_t v4 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue];
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003ED90;
    block[3] = &unk_100121CA0;
    block[4] = self;
    dispatch_sync(v4, block);
  }
  else
  {
    __break(0x5510u);
  }
}

- (void)_stopMusicPlayerNotifications:(id)a3
{
  NSLog(@"system music player uninstalled!", a2, a3);
  uint64_t v3 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue];
  if (v3)
  {
    dispatch_sync(v3, &stru_1001245B0);
  }
  else
  {
    __break(0x5510u);
  }
}

- (MediaPlayerHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)MediaPlayerHelper;
  v2 = [(MediaPlayerHelper *)&v6 init];
  if (!v2) {
    return (MediaPlayerHelper *)v2;
  }
  result = (MediaPlayerHelper *)dispatch_queue_create("com.apple.iapd.nowPlayingQueue", 0);
  uint32_t v4 = (MediaPlayerHelper **)(v2 + 104);
  if (((unint64_t)(v2 + 104) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 13) = result;
  pthread_mutex_init((pthread_mutex_t *)(v2 + 16), 0);
  sub_1000EE49C(6u, @"MP: initing observers");
  sub_1000EE49C(7u, @"MR: initing observers");
  if ((((_BYTE)v2 + 8) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 1) = 0;
  if ((((_BYTE)v2 + 80) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 10) = 0;
  if ((((_BYTE)v2 + 88) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 11) = 0;
  *(_DWORD *)(v2 + 97) = 0;
  if ((((_BYTE)v2 + 112) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 28) = 1;
  if ((((_BYTE)v2 + 116) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 29) = 1;
  if ((((_BYTE)v2 + 120) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 30) = 1;
  if ((((_BYTE)v2 + 124) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 31) = 1;
  if ((((_BYTE)v2 + 0x80) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 32) = 0;
  if ((((_BYTE)v2 - 124) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 33) = 0;
  if ((((_BYTE)v2 - 120) & 7) != 0) {
    goto LABEL_26;
  }
  *((void *)v2 + 17) = 0;
  if ((((_BYTE)v2 - 100) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 39) = 0;
  if ((((_BYTE)v2 - 104) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 38) = 0;
  v2[160] = 0;
  if ((((_BYTE)v2 - 92) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 41) = 0;
  v2[168] = 0;
  if ((((_BYTE)v2 - 84) & 3) != 0) {
    goto LABEL_26;
  }
  *((_DWORD *)v2 + 43) = 0;
  *((_WORD *)v2 + 88) = 0;
  *((_WORD *)v2 + 106) = 0;
  v2[214] = 0;
  if ((((_BYTE)v2 - 112) & 7) != 0
    || (*((void *)v2 + 18) = 0,
        result = objc_alloc_init(IAPApplicationStateMonitor),
        (((_BYTE)v2 - 56) & 7) != 0)
    || (*((void *)v2 + 25) = result, (((_BYTE)v2 - 48) & 3) != 0)
    || (*((_DWORD *)v2 + 52) = -1, (((_BYTE)v2 - 72) & 7) != 0))
  {
LABEL_26:
    __break(0x5516u);
  }
  else
  {
    *((void *)v2 + 23) = 0;
    v2[192] = 0;
    if (dword_100139868 == -1) {
      dword_100139868 = CFPreferencesGetAppBooleanValue(@"PodcastPlaybackInMusicApp", @"com.apple.iapd", 0) != 0;
    }
    result = *v4;
    if (*v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003F0F8;
      block[3] = &unk_100121CA0;
      block[4] = v2;
      dispatch_async(&result->super, block);
      return (MediaPlayerHelper *)v2;
    }
  }
  __break(0x5510u);
  return result;
}

- (void)dealloc
{
  sub_1000EE49C(6u, @"MP: dealloc'ing observers");
  sub_1000EE49C(7u, @"MR: dealloc'ing observers");
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  [(NSNotificationCenter *)v3 removeObserver:self name:kMRMediaRemoteNowPlayingInfoDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:MPMusicPlayerControllerItemPlaybackDidEndNotification object:0];
  if (sub_10003CAB4()) {
    [(MediaPlayerHelper *)self _stopMusicPlayerNotifications:0];
  }
  uint32_t v4 = +[MPMediaLibrary defaultMediaLibrary];
  [(NSNotificationCenter *)v3 removeObserver:self name:MPMediaLibraryEntitiesAddedOrRemovedNotification object:v4];
  [(MPMediaLibrary *)v4 endGeneratingLibraryChangeNotifications];
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0) {
    goto LABEL_25;
  }
  if (*p_nowPlayingInfo)
  {

    *p_nowPlayingInfo = 0;
  }
  p_nowPlayingAppIdentifier = &self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    goto LABEL_25;
  }
  if (*p_nowPlayingAppIdentifier)
  {

    *p_nowPlayingAppIdentifier = 0;
  }
  p_nowPlayingAppName = &self->_nowPlayingAppName;
  if (((unint64_t)&self->_nowPlayingAppName & 7) != 0) {
    goto LABEL_25;
  }
  if (*p_nowPlayingAppName)
  {

    *p_nowPlayingAppName = 0;
  }
  p_nowPlayingAppIsPlayingTimestamp = &self->_nowPlayingAppIsPlayingTimestamp;
  if (((unint64_t)&self->_nowPlayingAppIsPlayingTimestamp & 7) != 0) {
    goto LABEL_25;
  }
  if (*p_nowPlayingAppIsPlayingTimestamp)
  {

    *p_nowPlayingAppIsPlayingTimestamp = 0;
  }
  p_currentSupportedCommands = &self->_currentSupportedCommands;
  if (((unint64_t)&self->_currentSupportedCommands & 7) != 0) {
    goto LABEL_25;
  }
  if (*p_currentSupportedCommands)
  {
    CFRelease(*p_currentSupportedCommands);
    *p_currentSupportedCommands = 0;
  }
  p_pbqItems = &self->pbqItems;
  if (((unint64_t)&self->pbqItems & 7) != 0) {
    goto LABEL_25;
  }
  if (*p_pbqItems)
  {

    *p_pbqItems = 0;
  }
  if ((((_BYTE)self - 56) & 7) != 0
    || (self->_appStateMonitor,
        pthread_mutex_unlock(&self->_nowPlayingInfoLock),
        p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue,
        ((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0))
  {
LABEL_25:
    __break(0x5516u);
  }
  else if (*p_nowPlayingHandlerQueue)
  {
    dispatch_release((dispatch_object_t)*p_nowPlayingHandlerQueue);
    v12.receiver = self;
    v12.super_class = (Class)MediaPlayerHelper;
    [(MediaPlayerHelper *)&v12 dealloc];
    return;
  }
  __break(0x5510u);
}

+ (id)sharedSystemMusicPlayer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F810;
  block[3] = &unk_100121CA0;
  block[4] = a1;
  if (qword_10013BD18 != -1) {
    dispatch_once(&qword_10013BD18, block);
  }
  return (id)qword_10013BD10;
}

+ (id)sharedSystemMusicPlayerQueue
{
  if (qword_10013BD28 != -1) {
    dispatch_once(&qword_10013BD28, &stru_100124620);
  }
  return (id)qword_10013BD20;
}

- (void)postFakeShuffleModeChanged
{
  sub_1000EE49C(6u, @"MP: postFakeShuffleModeChanged");
  [(MediaPlayerHelper *)self performSelectorOnMainThread:"_shuffleModeChanged:" withObject:0 waitUntilDone:0];
  [(MediaPlayerHelper *)self performSelectorOnMainThread:"_nowPlayingItemChanged:" withObject:0 waitUntilDone:0];
}

- (int)prepareForPlaybackWithQuery:(id)a3 andFirstItem:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  if (dword_100139868) {
    goto LABEL_2;
  }
  *(_WORD *)&self->podcastAppSelected = 0;
  self->iTunesUAppSelected = 0;
  id v10 = [a3 items];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    LOBYTE(v13) = 1;
    int v14 = 1;
    int v15 = 1;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) mediaType];
        if (v17 == (id)1024) {
          int v18 = v15;
        }
        else {
          int v18 = 0;
        }
        if (v17 != (id)2) {
          int v15 = v18;
        }
        int v13 = (v17 == (id)4) & v13;
        if (v17 == (id)4096) {
          int v19 = v14;
        }
        else {
          int v19 = 0;
        }
        if (v17 != (id)8) {
          int v14 = v19;
        }
        if (((v15 | v13) & 1) == 0 && (v14 & 1) == 0)
        {
          LOBYTE(v14) = 0;
          int v13 = 0;
          goto LABEL_29;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_29:
    if (!v15 && (v13 & 1) == 0 && (v14 & 1) == 0)
    {
      uint64_t v7 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    int v15 = 1;
    int v13 = 1;
    LOBYTE(v14) = 1;
  }
  +[NSKeyedArchiver archivedDataWithRootObject:a3];
  uint64_t v7 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetLocalQueryData();
  if (v15)
  {
    NSLog(@"prepareForPlaybackWithQuery:andFirstItem: allPodcast, query=%@ count=%lu firstItem(%llu)=%@", a3, objc_msgSend(objc_msgSend(a3, "items"), "count"), objc_msgSend(a4, "persistentID"), a4);
    self->podcastAppSelected = 1;
    if (a4)
    {
      [a4 persistentID];
      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
    }
    goto LABEL_4;
  }
  if (v13)
  {
LABEL_2:
    NSLog(@"prepareForPlaybackWithQuery:andFirstItem: allAudioBooks, query=%@ count=%lu firstItem(%llu)=%@", a3, objc_msgSend(objc_msgSend(a3, "items"), "count"), objc_msgSend(a4, "persistentID"), a4);
    self->iBooksAppSelected = 1;
    if (a4)
    {
      [a4 persistentID];
      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
    }
LABEL_4:
    MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
    MRMediaRemoteSetAppPlaybackQueue();
    usleep(0x493E0u);
    goto LABEL_5;
  }
  if (v14)
  {
    NSLog(@"prepareForPlaybackWithQuery:andFirstItem: alliTunesU, query=%@ count=%lu firstItem(%llu)=%@", a3, objc_msgSend(objc_msgSend(a3, "items"), "count"), objc_msgSend(a4, "persistentID"), a4);
    self->iTunesUAppSelected = 1;
    if (a4)
    {
      [a4 persistentID];
      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
    }
    goto LABEL_4;
  }
LABEL_33:
  if (sub_10003C560()) {
    [a3 setIgnoreSystemFilterPredicates:1];
  }
  if (sub_10003CAB4())
  {
    int v9 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue];
    if (!v9)
    {
      __break(0x5510u);
      return (int)v9;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FD78;
    block[3] = &unk_100124648;
    block[4] = a3;
    void block[5] = a4;
    block[6] = &v26;
    dispatch_sync(v9, block);
    if (v7) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  NSLog(@"prepareForPlaybackWithQuery:andFirstItem: no systemMusicPlayer!");
LABEL_5:
  if (v7) {
LABEL_6:
  }
    MRSystemAppPlaybackQueueDestroy();
LABEL_7:
  int v8 = *((_DWORD *)v27 + 6);
  _Block_object_dispose(&v26, 8);
  LODWORD(v9) = v8;
  return (int)v9;
}

- (void)_nowPlayingItemChanged:(id)a3
{
  sub_1000EE49C(6u, @"MP: _nowPlayingItemChanged", a3);
  if (byte_10013C874 >= 2u) {
    goto LABEL_24;
  }
  if (byte_10013C874)
  {
    byte_10013C874 = 0;
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_23;
    }
    (*(void (**)(uint64_t))(*(void *)qword_10013BD48 + 680))(qword_10013BD48);
    id v4 = objc_alloc_init((Class)NSAutoreleasePool);
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_23;
    }
    (*(void (**)(uint64_t))(*(void *)qword_10013BD48 + 568))(qword_10013BD48);
    id v5 = objc_msgSend(objc_alloc((Class)MPMediaQuery), "initWithEntities:entityType:", objc_msgSend((id)qword_10013C878, "items"), 0);
    [(MediaPlayerHelper *)self prepareForPlaybackWithQuery:v5 andFirstItem:qword_10013C880];

    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_23;
    }
    (*(void (**)(uint64_t))(*(void *)qword_10013BD48 + 560))(qword_10013BD48);
    sub_10004005C();
  }
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  uint64_t v6 = qword_10013BD48;
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0)
  {
LABEL_23:
    __break(0x5516u);
LABEL_24:
    __break(0x550Au);
    return;
  }
  sub_10003E614(v6);
}

- (void)_repeatModeChanged:(id)a3
{
  sub_1000EE49C(6u, @"MP: _repeatModeChanged", a3);
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  uint64_t v3 = qword_10013BD48;
  if (qword_10013BD48) {
    BOOL v4 = (qword_10013BD48 & 7) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    sub_100040128(v3);
  }
  else
  {
    __break(0x5516u);
  }
}

- (void)_shuffleModeChanged:(id)a3
{
  sub_1000EE49C(6u, @"MP: _shuffleModeChanged", a3);
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  uint64_t v3 = qword_10013BD48;
  if (qword_10013BD48) {
    BOOL v4 = (qword_10013BD48 & 7) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    sub_1000401E8(v3);
  }
  else
  {
    __break(0x5516u);
  }
}

- (unsigned)nowPlayingAppIsValid
{
  p_nowPlayingAppIdentifier = (MediaPlayerHelper **)&self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    self = *p_nowPlayingAppIdentifier;
    if (*p_nowPlayingAppIdentifier) {
      LOBYTE(self) = [(MediaPlayerHelper *)self length] != 0;
    }
  }
  return self;
}

- (unsigned)nowPlayingAppIsIPodApp
{
  uint64_t v2 = self;
  if (self->_nowPlayingAppIsIPodIsValid) {
    goto LABEL_10;
  }
  p_nowPlayingAppIdentifier = &self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    goto LABEL_11;
  }
  if ([(NSString *)*p_nowPlayingAppIdentifier isEqualToString:@"com.apple.mobileipod"]) {
    LODWORD(self) = 1;
  }
  else {
    LODWORD(self) = [(NSString *)*p_nowPlayingAppIdentifier isEqualToString:@"com.apple.Music"];
  }
  v2->_nowPlayingAppIsIPod = self;
  v2->_nowPlayingAppIsIPodRadio = 0;
  if (!self) {
    goto LABEL_9;
  }
  if ((((_BYTE)v2 + 8) & 7) != 0)
  {
LABEL_11:
    __break(0x5516u);
    return self;
  }
  v2->_nowPlayingAppIsIPodRadio = [(NSMutableDictionary *)v2->_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoRadioStationName] != 0;
LABEL_9:
  v2->_nowPlayingAppIsIPodIsValid = 1;
LABEL_10:
  LOBYTE(self) = v2->_nowPlayingAppIsIPod;
  return self;
}

- (unsigned)nowPlayingAppIsiTunesRadio
{
  unsigned int v3 = [(MediaPlayerHelper *)self nowPlayingAppIsIPodApp];
  if (v3) {
    LOBYTE(v3) = self->_nowPlayingAppIsIPodRadio != 0;
  }
  return v3;
}

- (unsigned)nowPlayingAppIsVideosApp
{
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(NSString *)self->_nowPlayingAppIdentifier isEqualToString:@"com.apple.videos", v2, v3];
  }
  return self;
}

- (unsigned)nowPlayingAppIsPodcastApp
{
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(NSString *)self->_nowPlayingAppIdentifier isEqualToString:@"com.apple.podcasts", v2, v3];
  }
  return self;
}

- (unsigned)nowPlayingAppIsiBooksApp
{
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(NSString *)self->_nowPlayingAppIdentifier isEqualToString:@"com.apple.iBooks", v2, v3];
  }
  return self;
}

- (unsigned)nowPlayingAppIsiTunesUApp
{
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(NSString *)self->_nowPlayingAppIdentifier isEqualToString:@"com.apple.itunesu", v2, v3];
  }
  return self;
}

- (id)nowPlayingAppName
{
  if ((((unint64_t)self + 88) & 7) == 0)
  {
    uint64_t v2 = (void *)*((void *)self + 11);
    if (v2) {
      return v2;
    }
    if ((((unint64_t)self + 80) & 7) == 0) {
      return (id)*((void *)self + 10);
    }
  }
  __break(0x5516u);
  return self;
}

- (int)nowPlayingAppPlaybackState
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  uint64_t v3 = sub_10006FADC();
  p_lastTimeNowPlayingPBRateChangeToPauseOrStop = &self->_lastTimeNowPlayingPBRateChangeToPauseOrStop;
  if (((unint64_t)&self->_lastTimeNowPlayingPBRateChangeToPauseOrStop & 3) != 0) {
    goto LABEL_38;
  }
  id v5 = v3;
  BOOL v6 = 1;
  LODWORD(v3) = sub_100070ABC(*p_lastTimeNowPlayingPBRateChangeToPauseOrStop, v3, 1);
  if (!dword_100139850)
  {
    unsigned int explicitControlOccurred = self->_explicitControlOccurred;
    if (explicitControlOccurred >= 2) {
      goto LABEL_39;
    }
    BOOL v6 = v3 > 0x7D0 || explicitControlOccurred != 0;
  }
  if (self->_nowPlayingAppIsPlaying) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6;
  }
  if (!v9)
  {
    BOOL v10 = self->_explicitControlOccurred;
    if (v10 > 1) {
      goto LABEL_39;
    }
    sub_1000EE49C(6u, @"MP: nowPlayingAppPlaybackState: result=%d, _nowPlayingAppIsPlaying(%d) || ! pbRateChangeTimeExpired(%d), _explicitControlOccurred=%d curTime(%u) _lastTimeNowPlayingPBRateChangeToPauseOrStop(%u)", 1, self->_nowPlayingAppIsPlaying, v6, v10, v5, *p_lastTimeNowPlayingPBRateChangeToPauseOrStop);
  }
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
LABEL_38:
    __break(0x5516u);
    goto LABEL_39;
  }
  uint64_t v3 = (uint64_t *)[(NSMutableDictionary *)self->_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoPlaybackRate];
  id v11 = v3;
  if (v3)
  {
    LODWORD(v3) = [v3 floatValue];
    if (v12 == 0.0)
    {
      if (v6)
      {
        uint64_t nowPlayingAppIsPlaying = self->_nowPlayingAppIsPlaying;
LABEL_26:
        uint64_t v15 = 2;
        sub_1000EE49C(6u, @"MP: nowPlayingAppPlaybackState: result=%d, playbackRateObj=%@ _nowPlayingAppIsPlaying=%d pbRateChangeTimeExpired=%d", 2, v11, nowPlayingAppIsPlaying, 1);
        goto LABEL_33;
      }
      goto LABEL_30;
    }
    if (self->_nowPlayingAppIsPlaying) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v6;
    }
    if (v14)
    {
      uint64_t nowPlayingAppIsPlaying = 0;
      goto LABEL_26;
    }
  }
  if (!v9)
  {
LABEL_30:
    uint64_t v15 = 1;
    goto LABEL_33;
  }
  LODWORD(v3) = [(MediaPlayerHelper *)self isLoadingRadioStation];
  if (v3)
  {
    uint64_t v15 = 1;
    sub_1000EE49C(6u, @"MP: nowPlayingAppPlaybackState: result=%d, isLoadingRadioStation=%d", 1, [(MediaPlayerHelper *)self isLoadingRadioStation]);
  }
  else
  {
    BOOL v16 = self->_explicitControlOccurred;
    if (v16 > 1) {
      goto LABEL_39;
    }
    sub_1000EE49C(6u, @"MP: nowPlayingAppPlaybackState: result=%d, _nowPlayingAppIsPlaying(%d) || ! pbRateChangeTimeExpired(%d), _explicitControlOccurred=%d curTime(%u) _lastTimeNowPlayingPBRateChangeToPauseOrStop(%u) playbackRateObj=%@ isLoadingRadioStation=%d", 0, self->_nowPlayingAppIsPlaying, 1, v16, v5, self->_lastTimeNowPlayingPBRateChangeToPauseOrStop, v11, [(MediaPlayerHelper *)self isLoadingRadioStation]);
    uint64_t v15 = 0;
  }
LABEL_33:
  if (((unint64_t)&self->_cachedPlaybackStateResult & 3) != 0) {
    goto LABEL_38;
  }
  uint64_t cachedPlaybackStateResult = self->_cachedPlaybackStateResult;
  if (cachedPlaybackStateResult != v15)
  {
    BOOL v18 = self->_explicitControlOccurred;
    if (v18 <= 1)
    {
      NSLog(@"MP: nowPlayingAppPlaybackState: playbackState=%d->%d, _nowPlayingAppIsPlaying(%d) pbRateChangeTimeExpired(%d), _explicitControlOccurred=%d curTime(%u) _lastTimeNowPlayingPBRateChangeToPauseOrStop(%u) playbackRateObj=%@ isLoadingRadioStation=%d", cachedPlaybackStateResult, v15, self->_nowPlayingAppIsPlaying, v6, v18, v5, self->_lastTimeNowPlayingPBRateChangeToPauseOrStop, v11, [(MediaPlayerHelper *)self isLoadingRadioStation]);
      self->_uint64_t cachedPlaybackStateResult = v15;
      goto LABEL_37;
    }
LABEL_39:
    __break(0x550Au);
    return (int)v3;
  }
LABEL_37:
  pthread_mutex_unlock(&self->_nowPlayingInfoLock);
  LODWORD(v3) = v15;
  return (int)v3;
}

- (double)nowPlayingAppPlaybackRate
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_nowPlayingInfo)
    {
      id v5 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoPlaybackRate];
      [v5 floatValue];
      double v7 = v6;
      if (!v5)
      {
        if (self->_nowPlayingAppIsPlaying) {
          double v7 = 1.0;
        }
      }
    }
    else
    {
      double v7 = 0.0;
    }
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v7;
  }
  return result;
}

- (double)nowPlayingAppPlaybackSpeed
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    double v5 = 1.0;
    if (*p_nowPlayingInfo)
    {
      id v6 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate];
      if (v6)
      {
        [v6 floatValue];
        double v5 = v7;
      }
    }
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v5;
  }
  return result;
}

- (double)currentPlaybackTime
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) == 0)
  {
    if (*p_nowPlayingInfo)
    {
      id v5 = objc_alloc_init((Class)NSAutoreleasePool);
      id v6 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoElapsedTime];
      id v7 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoPlaybackRate];
      id v8 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoTimestamp];
      BOOL v9 = +[NSDate date];
      [v7 doubleValue];
      double v11 = v10;
      [v6 doubleValue];
      double v13 = v12;
      objc_msgSend(-[NSMutableDictionary objectForKey:](*p_nowPlayingInfo, "objectForKey:", kMRMediaRemoteNowPlayingInfoDuration), "doubleValue");
      double v15 = v14;
      if (!v7 && self->_nowPlayingAppIsPlaying) {
        double v11 = 1.0;
      }
      [(NSDate *)v9 timeIntervalSinceDate:v8];
      double v17 = v13 + v16 * v11;
      if (v17 < 0.0) {
        double v17 = 0.0;
      }
      if (v17 <= v15 || v15 <= 0.0) {
        double v19 = v17;
      }
      else {
        double v19 = v15;
      }
      goto LABEL_14;
    }
    if (!self->_nowPlayingAppIsPlaying)
    {
      double v19 = 0.0;
      goto LABEL_15;
    }
    id v5 = objc_alloc_init((Class)NSAutoreleasePool);
    v20 = +[NSDate date];
    if (((unint64_t)&self->_nowPlayingAppIsPlayingTimestamp & 7) == 0)
    {
      if (self->_nowPlayingAppIsPlayingTimestamp)
      {
        -[NSDate timeIntervalSinceDate:](v20, "timeIntervalSinceDate:");
        double v19 = v21;
      }
      else
      {
        double v19 = 0.0;
      }
LABEL_14:

LABEL_15:
      pthread_mutex_unlock(&self->_nowPlayingInfoLock);
      return v19;
    }
  }
  __break(0x5516u);
  return result;
}

- (double)currentNowPlayingInfoDuration
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v4 = [(NSMutableDictionary *)self->_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoDuration];
    if (v4)
    {
      [v4 doubleValue];
      double v6 = v5;
    }
    else
    {
      double v6 = -1.0;
    }
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v6;
  }
  return result;
}

- (unint64_t)currentNowPlayingInfoPID
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  unint64_t result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if ((((_BYTE)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_nowPlayingInfo, "objectForKey:", kMRMediaRemoteNowPlayingInfoUniqueIdentifier), "unsignedLongLongValue");
    if (self->_nowPlayingAppIsIPodRadio) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = (unint64_t)v5;
    }
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v6;
  }
  return result;
}

- (unsigned)currentNowPlayingInfoNumber:(id)a3
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  unsigned int result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    unsigned int v6 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_nowPlayingInfo, "objectForKey:", a3), "unsignedIntValue");
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v6;
  }
  return result;
}

- (id)currentNowPlayingInfoString:(id)a3
{
  [(MediaPlayerHelper *)self _waitForNowPlayingInfoReceived];
  id result = (id)pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v6 = [(NSMutableDictionary *)self->_nowPlayingInfo objectForKey:a3];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    pthread_mutex_unlock(&self->_nowPlayingInfoLock);
    return v7;
  }
  return result;
}

- (id)nowPlayingInfoTitleForAudiobookIndex:(unsigned int)a3
{
  if (![(MediaPlayerHelper *)self nowPlayingAppIsiBooksApp]) {
    return 0;
  }
  uint64_t v5 = [(MediaPlayerHelper *)self currentNowPlayingInfoChapterCount];
  if (v5 <= a3) {
    return 0;
  }
  id v6 = +[NSString stringWithFormat:@"%@ %u/%u", [(MediaPlayerHelper *)self currentNowPlayingInfoString:kMRMediaRemoteNowPlayingInfoAlbum], a3 + 1, v5];
  return v6;
}

- (unsigned)currentNowPlayingInfoTrack
{
  return [(MediaPlayerHelper *)self _currentNowPlayingInfoTrack:1];
}

- (unsigned)_currentNowPlayingInfoTrack:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoQueueIndex];
  uint64_t v6 = [(MediaPlayerHelper *)self fakeStreamTrackIndexTimeExpired];
  if (v6)
  {
    if ([(MediaPlayerHelper *)self nowPlayingAppIsiBooksApp])
    {
      uint64_t v6 = (uint64_t)self;
      return [(id)v6 currentNowPlayingInfoChapter];
    }
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    uint64_t v6 = qword_10013BD48;
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_21;
    }
    uint64_t v6 = sub_100040D30(qword_10013BD48, v3);
    if (!v6) {
      return v5;
    }
    if (dword_100139858 == 1) {
      return 0;
    }
    if ((dword_100139858 & 0xFFFFFFFE) != 2)
    {
      if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0) {
        goto LABEL_21;
      }
      if (!self->_fakeStreamTrackCount)
      {
        self->_fakeStreamTrackCount = 2;
        if (((unint64_t)&self->_fakeStreamTrackIndex & 3) != 0) {
          goto LABEL_21;
        }
        self->_fakeStreamTrackIndex = 1;
      }
    }
  }
  if (((unint64_t)&self->_fakeStreamTrackIndex & 3) == 0) {
    return self->_fakeStreamTrackIndex;
  }
LABEL_21:
  __break(0x5516u);
  return [(id)v6 currentNowPlayingInfoChapter];
}

- (unsigned)currentNowPlayingInfoTrackCount
{
  unsigned int fakeStreamTrackCount = [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoTotalQueueCount];
  if (![(MediaPlayerHelper *)self nowPlayingAppIsiBooksApp])
  {
    if (dword_100139858 == 4
      && ![(MediaPlayerHelper *)self fakeStreamTrackIndexTimeExpired])
    {
      return fakeStreamTrackCount;
    }
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    unsigned int result = qword_10013BD48;
    if (qword_10013BD48 && (qword_10013BD48 & 7) == 0)
    {
      if (fakeStreamTrackCount > 0x7FFFFFFE) {
        unsigned int fakeStreamTrackCount = 0;
      }
      unsigned int result = (*(uint64_t (**)(void))(*(void *)qword_10013BD48 + 512))();
      if (!result) {
        return fakeStreamTrackCount;
      }
      unsigned int fakeStreamTrackCount = dword_100139858;
      switch(dword_100139858)
      {
        case 1:
          return fakeStreamTrackCount;
        case 3:
          if (((unint64_t)&self->_fakeStreamTrackCount & 3) == 0)
          {
            unsigned int fakeStreamTrackCount = self->_fakeStreamTrackCount;
            if (!fakeStreamTrackCount)
            {
              [(MediaPlayerHelper *)self _calcNewFakeStreamIndexCount];
              return self->_fakeStreamTrackCount;
            }
            return fakeStreamTrackCount;
          }
          break;
        case 2:
          return fakeStreamTrackCount;
        default:
          if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0) {
            break;
          }
          unsigned int fakeStreamTrackCount = self->_fakeStreamTrackCount;
          if (fakeStreamTrackCount) {
            return fakeStreamTrackCount;
          }
          self->_unsigned int fakeStreamTrackCount = 2;
          if (((unint64_t)&self->_fakeStreamTrackIndex & 3) == 0)
          {
            self->_fakeStreamTrackIndex = 1;
            return 2;
          }
          break;
      }
    }
    __break(0x5516u);
    return result;
  }
  return [(MediaPlayerHelper *)self currentNowPlayingInfoChapterCount];
}

- (unsigned)currentNowPlayingInfoChapter
{
  return [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoChapterNumber];
}

- (unsigned)currentNowPlayingInfoChapterCount
{
  return [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoTotalChapterCount];
}

- (unsigned)currentNowPlayingInfoDisc
{
  return [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoDiscNumber];
}

- (unsigned)currentNowPlayingInfoDiscCount
{
  return [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoTotalDiscCount];
}

- (unsigned)currentNowPlayingInfoAlbumTrack
{
  return [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoTrackNumber];
}

- (unsigned)currentNowPlayingInfoAlbumTrackCount
{
  return [(MediaPlayerHelper *)self currentNowPlayingInfoNumber:kMRMediaRemoteNowPlayingInfoTotalTrackCount];
}

- (BOOL)isLoadingRadioStation
{
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    unint64_t v3 = (unint64_t)[(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier];
    unint64_t v4 = (unint64_t)[(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoRadioStationHash];
    LOBYTE(self) = (v3 | v4 | (unint64_t)[(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoRadioStationName]) != 0;
  }
  return (char)self;
}

- (int)currentShuffleMode
{
  int result = sub_10006FADC();
  p_expectedShuffleModeTimestamp = &self->expectedShuffleModeTimestamp;
  if (((unint64_t)&self->expectedShuffleModeTimestamp & 3) == 0)
  {
    int result = sub_100070ABC(*p_expectedShuffleModeTimestamp, result, 1);
    if (*p_expectedShuffleModeTimestamp && (!byte_10013BD30 ? (unsigned int v5 = 1700) : (unsigned int v5 = 5000), result < v5))
    {
      p_expectedShuffleMode = (unsigned int *)&self->expectedShuffleMode;
      if ((p_expectedShuffleMode & 3) == 0)
      {
        NSLog(@"MR: %s:%d return expectedShuffleMode=%d", "-[MediaPlayerHelper currentShuffleMode]", 1429, *p_expectedShuffleMode);
        return *p_expectedShuffleMode;
      }
    }
    else
    {
      p_expectedShuffleMode = (unsigned int *)&self->shuffleModeCache;
      if ((p_expectedShuffleMode & 3) == 0)
      {
        NSLog(@"MR: %s:%d return shuffleModeCache=%d", "-[MediaPlayerHelper currentShuffleMode]", 1432, *p_expectedShuffleMode);
        return *p_expectedShuffleMode;
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (int)currentRepeatMode
{
  int result = sub_10006FADC();
  p_expectedRepeatModeTimestamp = &self->expectedRepeatModeTimestamp;
  if (((unint64_t)&self->expectedRepeatModeTimestamp & 3) == 0)
  {
    int result = sub_100070ABC(*p_expectedRepeatModeTimestamp, result, 1);
    if (*p_expectedRepeatModeTimestamp && (!byte_10013BD30 ? (unsigned int v5 = 1700) : (unsigned int v5 = 5000), result < v5))
    {
      p_expectedRepeatMode = (unsigned int *)&self->expectedRepeatMode;
      if ((p_expectedRepeatMode & 3) == 0)
      {
        NSLog(@"MR: %s:%d return expectedRepeatMode=%d", "-[MediaPlayerHelper currentRepeatMode]", 1442, *p_expectedRepeatMode);
        return *p_expectedRepeatMode;
      }
    }
    else
    {
      int result = [(MediaPlayerHelper *)self nowPlayingAppIsiTunesRadio];
      if (result)
      {
        int v7 = 3;
        NSLog(@"MR: %s:%d return repeatModeCache=%d", "-[MediaPlayerHelper currentRepeatMode]", 1450, 3);
        return v7;
      }
      p_expectedRepeatMode = (unsigned int *)&self->repeatModeCache;
      if ((p_expectedRepeatMode & 3) == 0)
      {
        NSLog(@"MR: %s:%d return repeatModeCache=%d", "-[MediaPlayerHelper currentRepeatMode]", 1454, *p_expectedRepeatMode);
        return *p_expectedRepeatMode;
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (void)setExpectedShuffleMode:(int)a3
{
  NSLog(@"MR: %s:%d shuffleMode=%d", a2, "-[MediaPlayerHelper setExpectedShuffleMode:]", 1460, a3);
  if (((unint64_t)&self->shuffleModeCache & 3) != 0) {
    goto LABEL_7;
  }
  if (self->shuffleModeCache == a3) {
    return;
  }
  if (((unint64_t)&self->expectedShuffleMode & 3) != 0
    || (self->expectedShuffleMode = a3,
        unsigned int v5 = sub_10006FADC(),
        ((unint64_t)&self->expectedShuffleModeTimestamp & 3) != 0))
  {
LABEL_7:
    __break(0x5516u);
    return;
  }
  self->expectedShuffleModeTimestamp = v5;
  NSLog(@"MR: %s:%d expectedShuffleMode=%d expectedShuffleModeTimestamp=%u", "-[MediaPlayerHelper setExpectedShuffleMode:]", 1466, self->expectedShuffleMode, v5);
}

- (void)setExpectedRepeatMode:(int)a3
{
  NSLog(@"MR: %s:%d repeatMode=%d", a2, "-[MediaPlayerHelper setExpectedRepeatMode:]", 1472, a3);
  if (((unint64_t)&self->repeatModeCache & 3) != 0) {
    goto LABEL_7;
  }
  if (self->repeatModeCache == a3) {
    return;
  }
  if (((unint64_t)&self->expectedRepeatMode & 3) != 0
    || (self->expectedRepeatMode = a3,
        unsigned int v5 = sub_10006FADC(),
        ((unint64_t)&self->expectedRepeatModeTimestamp & 3) != 0))
  {
LABEL_7:
    __break(0x5516u);
    return;
  }
  self->expectedRepeatModeTimestamp = v5;
  NSLog(@"MR: %s:%d expectedRepeatMode=%d expectedRepeatModeTimestamp=%u", "-[MediaPlayerHelper setExpectedRepeatMode:]", 1478, self->expectedRepeatMode, v5);
}

- (id)currentNowPlayingInfoArtwork
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  id result = (id)pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_nowPlayingInfo)
    {
      id v6 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoArtworkData];
      int v7 = v6;
      if (v6) {
        id v8 = v6;
      }
    }
    else
    {
      int v7 = 0;
    }
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v7;
  }
  return result;
}

- (BOOL)currentNowPlayingInfoArtworkExists
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  BOOL result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = (id *)&self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    BOOL v7 = *p_nowPlayingInfo
      && (id v6 = [*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoArtworkData]) != 0
      && [v6 length] != 0;
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v7;
  }
  return result;
}

- (BOOL)currentNowPlayingInfoTrackCountExists
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  BOOL result = pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_nowPlayingInfo) {
      BOOL v6 = [(NSMutableDictionary *)*p_nowPlayingInfo objectForKey:kMRMediaRemoteNowPlayingInfoTotalQueueCount] != 0;
    }
    else {
      BOOL v6 = 0;
    }
    pthread_mutex_unlock(p_nowPlayingInfoLock);
    return v6;
  }
  return result;
}

- (void)initPBQItemsFromQueueQuery
{
  p_pbqItems = &self->pbqItems;
  if (((unint64_t)&self->pbqItems & 7) != 0)
  {
    __break(0x5516u);
  }
  else if (!*p_pbqItems)
  {
    if (sub_10003CAB4())
    {
      unint64_t v3 = (NSArray *)objc_msgSend(+[MediaPlayerHelper sharedSystemMusicPlayer](MediaPlayerHelper, "sharedSystemMusicPlayer"), "queueAsQuery");
      if (v3) {
        unint64_t v3 = (NSArray *)[(NSArray *)v3 items];
      }
      *p_pbqItems = v3;
    }
    else
    {
      NSLog(@"%s:%d no systemMusicPlayer!", "-[MediaPlayerHelper initPBQItemsFromQueueQuery]", 1553);
    }
  }
}

- (id)getPBQItemsFromQueueQuery
{
  if ((((unint64_t)self + 144) & 7) == 0) {
    return (id)*((void *)self + 18);
  }
  __break(0x5516u);
  return self;
}

- (id)_nowPlayingInfoDesc:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoUniqueIdentifier];
  id v30 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTitle];
  id v32 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoPlaybackRate];
  id v31 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoQueueIndex];
  id v29 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalQueueCount];
  id v28 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoChapterNumber];
  id v27 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalChapterCount];
  id v26 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoDiscNumber];
  id v25 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalDiscCount];
  id v24 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTrackNumber];
  id v23 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTotalTrackCount];
  id v22 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoDuration];
  id v21 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoElapsedTime];
  id v20 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoArtist];
  id v19 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoAlbum];
  id v6 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoComposer];
  id v7 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoGenre];
  id v8 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoStartTime];
  id v9 = [a3 objectForKey:kMRMediaRemoteNowPlayingInfoTimestamp];
  id v10 = v5;
  id v11 = [v5 unsignedLongLongValue];
  id result = +[NSDate date];
  if (((unint64_t)&self->repeatModeCache & 3) != 0 || ((unint64_t)&self->shuffleModeCache & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v13 = result;
    uint64_t repeatModeCache = self->repeatModeCache;
    uint64_t shuffleModeCache = self->shuffleModeCache;
    [result timeIntervalSinceDate:v8];
    uint64_t v17 = v16;
    [v13 timeIntervalSinceDate:v9];
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"    pid=%@,0x%qx track#:%@/%@ chap#:%@/%@ disc#:%@/%@\n    elapsed=%@/%@ playbackRate=%@\n    albumTrack#:%@/%@ cached:[repeat=%d shuffle=%d]\n    startTime=%@,%lf timeStamp=%@, %lf nowTime=%@\n    title=%@\n    artist=%@\n    album=%@\n    composer=%@\n    genre=%@", v10, v11, v31, v29, v28, v27, v26, v25, v21, v22, v32, v24, v23, repeatModeCache, shuffleModeCache, v8,
             v17,
             v9,
             v18,
             v13,
             v30,
             v20,
             v19,
             v6,
             v7);
  }
  return result;
}

- (void)_printNowPlayingInfo:(id)a3 forName:(id)a4
{
  if (sub_1000EE474(7))
  {
    NSLog(@"MR: %s:%d %@=%hhx", "-[MediaPlayerHelper _printNowPlayingInfo:forName:]", 1633, a4, a3);
    if (a3) {
      NSLog(@"MR: %s:%d\n%@", "-[MediaPlayerHelper _printNowPlayingInfo:forName:]", 1638, [(MediaPlayerHelper *)self _nowPlayingInfoDesc:a3]);
    }
  }
}

- (void)_handleNowPlayingInfo:(__CFDictionary *)a3
{
  id v81 = objc_alloc_init((Class)NSAutoreleasePool);
  unsigned int v85 = sub_1000D92E0();
  pthread_once(&stru_10013B910, sub_1000D8E78);
  if ((unint64_t)dword_10013B900 >= 0xFFFFFFFFFFFFFFF4) {
    goto LABEL_221;
  }
  if (dword_10013B90C)
  {
    pthread_once(&stru_1001398B0, sub_10004BBF8);
    pthread_mutex_lock(&stru_100139870);
    if (qword_10013BD08)
    {
      id v5 = (unsigned int *)qword_10013BD38;
      if (!qword_10013BD38 || (qword_10013BD38 & 7) != 0) {
        goto LABEL_220;
      }
      id v6 = (unsigned int *)sub_1000427D8((uint64_t)&qword_10013BCF8);
      if (v85 < *v6) {
        goto LABEL_223;
      }
      uint64_t v7 = v5[19];
      if (v7 >= 8) {
        goto LABEL_222;
      }
      if (v7 >= 4) {
        goto LABEL_224;
      }
      if (~(unint64_t)dword_10013B900 < 4 * v7) {
        goto LABEL_221;
      }
      if (dword_10013B900[v7]) {
        (*(void (**)(unsigned int *, void, void, void))(*(void *)v5 + 104))(v5, v85 - *v6, 0, 0);
      }
      sub_100042818((uint64_t)&qword_10013BCF8);
    }
    pthread_mutex_unlock(&stru_100139870);
    pthread_once(&stru_100139830, sub_10003E258);
    if (dword_10013C870)
    {
      if (!qword_10013C868 || (qword_10013C868 & 7) != 0) {
        goto LABEL_220;
      }
      if (v85 < dword_10013C870) {
        goto LABEL_223;
      }
      uint64_t v8 = *(unsigned int *)(qword_10013C868 + 76);
      if (v8 >= 8) {
        goto LABEL_222;
      }
      if (v8 >= 4) {
        goto LABEL_224;
      }
      if (~(unint64_t)dword_10013B900 < 4 * v8) {
        goto LABEL_221;
      }
      if (dword_10013B900[v8]) {
        (*(void (**)(void))(*(void *)qword_10013C868 + 104))();
      }
      dword_10013C870 = 0;
    }
  }
  NSLog(@"MR: %s:%d nowPlayingInfo=%hhx", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1670, a3);
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  if (((unint64_t)&self->_nowPlayingInfo & 7) != 0) {
    goto LABEL_220;
  }
  id v10 = *p_nowPlayingInfo;
  unsigned int v11 = *p_nowPlayingInfo != 0;
  if (*p_nowPlayingInfo)
  {
    objc_msgSend(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", kMRMediaRemoteNowPlayingInfoPlaybackRate), "floatValue");
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }
  if (!a3 || ![(__CFDictionary *)a3 count])
  {
    sub_1000EE49C(7u, @"MR: %s:%d nil nowPlayingInfo=%hhx oldNowPlayingInfo=%hhx tmpNowPlayingInfo=%hhx", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1706, a3, v10, 0);
    double v14 = 0;
    BOOL v83 = 0;
    unsigned __int8 v78 = 0;
    BOOL v82 = 0;
    BOOL v84 = 0;
    BOOL v77 = 0;
    int v79 = 0;
    BOOL v17 = 0;
    unsigned int v75 = 0;
    id v76 = 0;
    unsigned int v73 = -1;
    double v18 = 0.0;
    unsigned int v19 = v11;
    signed int v20 = -1;
    unsigned int v21 = v11;
    goto LABEL_33;
  }
  sub_1000EE49C(7u, @"MR: %s:%d copy nowPlayingInfo(%hhx) to tmpNowPlayingInfo(%hhx), oldNowPlayingInfo=%hhx", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1700, a3, 0, v10);
  double v14 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  +[NowPlayingHelper validateNowPlayingInfo:v14];
  if (!v14)
  {
    unsigned int v11 = 0;
    unsigned int v19 = 0;
    BOOL v83 = 0;
    unsigned __int8 v78 = 0;
    BOOL v82 = 0;
    BOOL v84 = 0;
    BOOL v77 = 0;
    int v79 = 0;
    BOOL v17 = 0;
    unsigned int v75 = 0;
    id v76 = 0;
    unsigned int v21 = 0;
    unsigned int v73 = -1;
    double v18 = 0.0;
    signed int v20 = -1;
    goto LABEL_33;
  }
  double v15 = v14;
  uint64_t v16 = kMRMediaRemoteNowPlayingInfoTimestamp;
  if (dword_100139840
    || ![(NSMutableDictionary *)v14 objectForKey:kMRMediaRemoteNowPlayingInfoTimestamp])
  {
    NSLog(@"%s:%s:%d nil timestamp for nowPlayingInfo, setting it to current time", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAP/link/MediaPlayer.mm", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1724);
    [(NSMutableDictionary *)v14 setObject:+[NSDate date] forKey:v16];
  }
  uint64_t v69 = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
  id v30 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  uint64_t v74 = kMRMediaRemoteNowPlayingInfoTotalQueueCount;
  id v31 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  uint64_t v71 = kMRMediaRemoteNowPlayingInfoPlaybackRate;
  id v32 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  id v33 = [(NSMutableDictionary *)v14 objectForKey:kMRMediaRemoteNowPlayingInfoIsMusicApp];
  id v34 = [(NSMutableDictionary *)v14 objectForKey:kMRMediaRemoteNowPlayingInfoRadioStationName];
  uint64_t v63 = kMRMediaRemoteNowPlayingInfoTitle;
  id v35 = -[NSMutableDictionary objectForKey:](v14, "objectForKey:");
  BOOL v83 = v32 != 0;
  v67 = v32;
  [v32 floatValue];
  double v18 = v36;
  BOOL v82 = v33 != 0;
  unsigned __int8 v78 = [v33 BOOLValue];
  id v80 = v34;
  BOOL v84 = v34 != 0;
  v37 = v30;
  id v76 = [v30 unsignedLongLongValue];
  v64 = v35;
  BOOL v77 = v35 != 0;
  id v68 = v31;
  unsigned int v75 = [v31 unsignedLongValue];
  if (!v10)
  {
    int v79 = 0;
    BOOL v17 = 0;
    unsigned int v73 = -1;
    unsigned int v11 = 1;
    unsigned int v19 = 1;
    signed int v20 = -1;
    unsigned int v21 = 1;
    goto LABEL_33;
  }
  uint64_t v38 = kMRMediaRemoteNowPlayingInfoQueueIndex;
  id v66 = [(NSMutableDictionary *)v14 objectForKey:kMRMediaRemoteNowPlayingInfoQueueIndex];
  uint64_t v39 = kMRMediaRemoteNowPlayingInfoChapterNumber;
  id v40 = [(NSMutableDictionary *)v14 objectForKey:kMRMediaRemoteNowPlayingInfoChapterNumber];
  uint64_t v41 = kMRMediaRemoteNowPlayingInfoArtworkData;
  id v65 = [(NSMutableDictionary *)v14 objectForKey:kMRMediaRemoteNowPlayingInfoArtworkData];
  id v42 = [(NSMutableDictionary *)v10 objectForKey:v69];
  id v70 = [(NSMutableDictionary *)v10 objectForKey:v38];
  id v43 = [(NSMutableDictionary *)v10 objectForKey:v74];
  id v44 = [(NSMutableDictionary *)v10 objectForKey:v71];
  id v72 = [(NSMutableDictionary *)v10 objectForKey:v41];
  id v45 = [(NSMutableDictionary *)v10 objectForKey:v39];
  v62 = v40;
  if (!v37)
  {
    v46 = v66;
    if (!v42) {
      goto LABEL_88;
    }
LABEL_94:
    unsigned int v21 = 1;
    v48 = v68;
    if (!v68) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }
  if (!v42)
  {
    unsigned int v21 = 1;
    v48 = v68;
    v46 = v66;
    if (!v68) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }
  v46 = v66;
  if (![v37 isEqualToNumber:v42]) {
    goto LABEL_94;
  }
LABEL_88:
  id v47 = [(NSMutableDictionary *)v10 objectForKey:v63];
  if (v64)
  {
    v48 = v68;
    if (!v47 || !objc_msgSend(v64, "isEqualToString:"))
    {
LABEL_108:
      unsigned int v21 = 1;
      if (!v48) {
        goto LABEL_110;
      }
      goto LABEL_109;
    }
  }
  else
  {
    v48 = v68;
    if (v47) {
      goto LABEL_108;
    }
  }
  if (v46)
  {
    if (!v70) {
      goto LABEL_108;
    }
    unsigned int v21 = objc_msgSend(v46, "isEqualToNumber:") ^ 1;
    if (!v48) {
      goto LABEL_110;
    }
  }
  else
  {
    unsigned int v21 = v70 != 0;
    if (!v48) {
      goto LABEL_110;
    }
  }
LABEL_109:
  if (!v43)
  {
LABEL_112:
    unsigned int v11 = 1;
    goto LABEL_113;
  }
LABEL_110:
  if (!v48 && v43) {
    goto LABEL_112;
  }
  unsigned int v11 = 0;
  if (v48 && v43) {
    unsigned int v11 = [v48 isEqualToNumber:v43] ^ 1;
  }
LABEL_113:
  if (!v44)
  {
    unsigned int v19 = 1;
    if (!v45) {
      goto LABEL_116;
    }
    goto LABEL_115;
  }
  unsigned int v19 = [v67 isEqualToNumber:v44] ^ 1;
  if (v45) {
LABEL_115:
  }
    [v62 isEqualToNumber:v45];
LABEL_116:
  if (v46) {
    unsigned int v73 = [v46 intValue];
  }
  else {
    unsigned int v73 = -1;
  }
  signed int v20 = -1;
  if (!v80 && v48 && !dword_100139858)
  {
    unsigned int v49 = [v48 intValue];
    signed int v20 = v49 == 0x7FFFFFFF ? 0 : v49;
    if (v20 >= 1)
    {
      if ((((_BYTE)self - 100) & 3) != 0) {
        goto LABEL_220;
      }
      self->_unsigned int fakeStreamTrackCount = v20;
      if (((unint64_t)&self->_fakeStreamTrackIndex & 3) != 0) {
        goto LABEL_220;
      }
      self->_fakeStreamTrackIndex = v20 - 1;
      signed int v20 = v49;
    }
  }
  if (![v65 length] && objc_msgSend(v72, "length")
    || [v65 length] && !objc_msgSend(v72, "length"))
  {
    BOOL v17 = [v65 length] != 0;
    int v79 = 1;
  }
  else
  {
    int v79 = 0;
    BOOL v17 = 0;
  }
LABEL_33:
  NSLog(@"MR: %s:%d\n%@\n.... changed to ....\n%@", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1832, [(MediaPlayerHelper *)self _nowPlayingInfoDesc:v10], [(MediaPlayerHelper *)self _nowPlayingInfoDesc:v14]);
  NSLog(@"MR: %s:%d isTrackChanged=%d isPBContentChanged=%d isPBRateChanged=%d tmpNowPlayingInfo=%hhx oldNowPlayingInfo=%hhx", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1836, v21, v11, v19, v14, v10);
  if (self->_nowPlayingAppChanged)
  {
    self->_nowPlayingAppChanged = 0;
    unsigned int v11 = 1;
  }
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  self->_nowPlayingInfo = v14;
  self->_unsigned int nowPlayingInfoEverReceived = 1;
  pthread_mutex_unlock(&self->_nowPlayingInfoLock);
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
    goto LABEL_220;
  }
  sub_1000428B8(qword_10013BD48, 1);
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
    goto LABEL_220;
  }
  sub_100042A04(qword_10013BD48);
  if (v82)
  {
    self->_int nowPlayingAppIsIPod = v78;
    self->_nowPlayingAppIsIPodIsValid = 1;
  }
  int nowPlayingAppIsIPodRadio = self->_nowPlayingAppIsIPodRadio;
  self->_int nowPlayingAppIsIPodRadio = 0;
  int nowPlayingAppIsIPod = self->_nowPlayingAppIsIPod;
  if (self->_nowPlayingAppIsIPod)
  {
    int nowPlayingAppIsIPod = v84;
    self->_int nowPlayingAppIsIPodRadio = v84;
  }
  if (nowPlayingAppIsIPod == (nowPlayingAppIsIPodRadio != 0)) {
    int v24 = v11;
  }
  else {
    int v24 = 1;
  }
  pthread_once(&stru_10013B910, sub_1000D8E78);
  if ((unint64_t)dword_10013B900 >= 0xFFFFFFFFFFFFFFF4) {
    goto LABEL_221;
  }
  if (dword_10013B90C)
  {
    unsigned int v25 = sub_1000D92E0();
    if (!qword_10013BD40 || (qword_10013BD40 & 7) != 0) {
      goto LABEL_220;
    }
    if (v25 >= v85)
    {
      uint64_t v26 = *(unsigned int *)(qword_10013BD40 + 76);
      if (v26 >= 8) {
        goto LABEL_222;
      }
      if (v26 < 4)
      {
        if (~(unint64_t)dword_10013B900 >= 4 * v26)
        {
          if (dword_10013B900[v26]) {
            (*(void (**)(void))(*(void *)qword_10013BD40 + 104))();
          }
          goto LABEL_60;
        }
LABEL_221:
        __break(0x5513u);
        goto LABEL_222;
      }
LABEL_224:
      __break(0x5512u);
      goto LABEL_225;
    }
LABEL_223:
    __break(0x5515u);
    goto LABEL_224;
  }
LABEL_60:
  if (self->_fakeStreamTrackIndexNeedChange > 1u) {
    goto LABEL_222;
  }
  if (self->_fakeStreamTrackIndexNeedChange)
  {
    self->_fakeStreamTrackIndexNeedChange = 0;
    unsigned int v21 = 1;
  }
  if (dword_100139858 == 4) {
    unsigned int v21 = 0;
  }
  if ((v17 | v21) == 1)
  {
    int v27 = v77;
    if (v76) {
      int v27 = 1;
    }
    if ((v84 | v27) == 1)
    {
      int v29 = v73 == -1 || v20 < 1 || v84;
      if (v29 == 1)
      {
        if (self->_fakeStreamTrackIndexSet > 1u) {
          goto LABEL_222;
        }
        if (self->_fakeStreamTrackIndexSet)
        {
          self->_unsigned int fakeStreamTrackIndexSet = 0;
        }
        else
        {
          if (dword_100139858)
          {
            if (dword_100139858 == 3)
            {
              [(MediaPlayerHelper *)self _calcNewFakeStreamIndexCount];
            }
            else if (dword_100139858 == 2)
            {
              if (((unint64_t)&self->_fakeStreamTrackIndex & 3) != 0) {
                goto LABEL_220;
              }
              self->_fakeStreamTrackIndex = (self->_fakeStreamTrackIndex & 1) == 0;
            }
          }
          else
          {
            p_unsigned int fakeStreamTrackCount = &self->_fakeStreamTrackCount;
            if (((unint64_t)&self->_fakeStreamTrackCount & 3) != 0) {
              goto LABEL_220;
            }
            if (*p_fakeStreamTrackCount - 1 < 0x1E847F) {
              int v51 = *p_fakeStreamTrackCount + 1;
            }
            else {
              int v51 = 2;
            }
            unsigned int *p_fakeStreamTrackCount = v51;
            if (!v51) {
              goto LABEL_223;
            }
            if (((unint64_t)&self->_fakeStreamTrackIndex & 3) != 0) {
              goto LABEL_220;
            }
            self->_fakeStreamTrackIndex = v51 - 1;
          }
          if (((unint64_t)&self->_fakeStreamTrackIndexSetTimestamp & 3) != 0) {
            goto LABEL_220;
          }
          self->_fakeStreamTrackIndexSetTimestamp = 0;
        }
        if (qword_10013BD50 != -1) {
          dispatch_once(&qword_10013BD50, &stru_1001246D0);
        }
        if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
          goto LABEL_220;
        }
        if ((v21 & (*(unsigned int (**)(void))(*(void *)qword_10013BD48 + 512))()) != 0) {
          int v24 = 1;
        }
      }
      if (v21)
      {
        if (qword_10013BD50 != -1) {
          dispatch_once(&qword_10013BD50, &stru_1001246D0);
        }
        if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
          goto LABEL_220;
        }
        sub_100042A90(qword_10013BD48);
        [(MediaPlayerHelper *)self performSelectorOnMainThread:"_nowPlayingItemChanged:" withObject:0 waitUntilDone:0];
      }
    }
    else if (v21)
    {
      [(MediaPlayerHelper *)self performSelectorOnMainThread:"_nowPlayingItemChanged:" withObject:0 waitUntilDone:0];
      if ((v24 & 1) == 0) {
        goto LABEL_170;
      }
      goto LABEL_163;
    }
  }
  if (!v24) {
    goto LABEL_170;
  }
LABEL_163:
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48) {
    goto LABEL_220;
  }
  if ((qword_10013BD48 & 7) != 0) {
    goto LABEL_220;
  }
  sub_100042B3C(qword_10013BD48);
  uint64_t v52 = sub_10005176C();
  if (!v52 || (v52 & 7) != 0) {
    goto LABEL_220;
  }
  sub_100056330(v52);
LABEL_170:
  if (v83)
  {
    if (v75) {
      BOOL v53 = self->_nowPlayingAppIsIPodRadio == 0;
    }
    else {
      BOOL v53 = 0;
    }
    BOOL v54 = !v53;
    self->_lastWasStreamPlayback = v54;
  }
  if (v19)
  {
    if (dword_100139850) {
      goto LABEL_190;
    }
    if (v13 != 0.0)
    {
      if (self->_explicitControlOccurred > 1u) {
        goto LABEL_222;
      }
      if (!self->_explicitControlOccurred)
      {
        if (self->_lastWasStreamPlayback > 1u) {
          goto LABEL_222;
        }
        BOOL v57 = v83;
        if (v18 == 0.0) {
          BOOL v57 = 0;
        }
        if (!v57 && self->_lastWasStreamPlayback)
        {
          unsigned int v58 = sub_10006FADC();
          if ((((_BYTE)self - 84) & 3) != 0) {
            goto LABEL_220;
          }
          self->_lastTimeNowPlayingPBRateChangeToPauseOrStop = v58;
          dispatch_time_t v59 = dispatch_time(0, 2000000000);
          p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue;
          if (((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0) {
            goto LABEL_220;
          }
          v61 = *p_nowPlayingHandlerQueue;
          if (!*p_nowPlayingHandlerQueue) {
            goto LABEL_225;
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100042B84;
          block[3] = &unk_100121CA0;
          block[4] = self;
          dispatch_after(v59, v61, block);
LABEL_189:
          self->_unsigned int explicitControlOccurred = 0;
LABEL_190:
          if (qword_10013BD50 != -1) {
            dispatch_once(&qword_10013BD50, &stru_1001246D0);
          }
          uint64_t v55 = qword_10013BD48;
          if (qword_10013BD48 && (qword_10013BD48 & 7) == 0)
          {
            [(MediaPlayerHelper *)self nowPlayingAppPlaybackState];
            (*(void (**)(uint64_t, uint64_t, void, void, void))(*(void *)v55 + 56))(v55, 524301, 0, 0, 0);
            goto LABEL_195;
          }
LABEL_220:
          __break(0x5516u);
          goto LABEL_221;
        }
      }
    }
    if (self->_explicitControlOccurred <= 1u)
    {
      if (self->_explicitControlOccurred || v13 == 0.0 && v18 != 0.0)
      {
        if (((unint64_t)&self->_lastTimeNowPlayingPBRateChangeToPauseOrStop & 3) != 0) {
          goto LABEL_220;
        }
        self->_lastTimeNowPlayingPBRateChangeToPauseOrStop = 0;
      }
      goto LABEL_189;
    }
LABEL_222:
    __break(0x550Au);
    goto LABEL_223;
  }
LABEL_195:
  if (v10)
  {
    sub_1000EE49C(7u, @"MR: %s:%d release oldNowPlayingInfo(%hhx)", "-[MediaPlayerHelper _handleNowPlayingInfo:]", 1991, v10);
  }
  if (!v79) {
    goto LABEL_203;
  }
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
    goto LABEL_220;
  }
  sub_100042C38(qword_10013BD48);
LABEL_203:
  if (!self->_nowPlayingAppIsIPodIsValid || !self->_nowPlayingAppIsIPod || self->_nowPlayingAppIsIPodRadio) {
    goto LABEL_208;
  }
  v56 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue];
  if (v56)
  {
    dispatch_sync(v56, &stru_100124668);
LABEL_208:

    return;
  }
LABEL_225:
  __break(0x5510u);
}

- (void)_handleNowPlayingAppIsPlayingDidChange:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  NSLog(@"MR: %s:%d nowPlayingAppIsPlaying=%d->%d", "-[MediaPlayerHelper _handleNowPlayingAppIsPlayingDidChange:]", 2027, self->_nowPlayingAppIsPlaying, v3);
  int nowPlayingAppIsPlaying = self->_nowPlayingAppIsPlaying;
  if (nowPlayingAppIsPlaying != v3)
  {
    self->_int nowPlayingAppIsPlaying = v3;
    p_nowPlayingAppIsPlayingTimestamp = &self->_nowPlayingAppIsPlayingTimestamp;
    if (((unint64_t)&self->_nowPlayingAppIsPlayingTimestamp & 7) != 0) {
      goto LABEL_20;
    }
    if (*p_nowPlayingAppIsPlayingTimestamp) {

    }
    uint64_t v8 = +[NSDate date];
    *p_nowPlayingAppIsPlayingTimestamp = v8;
    id v9 = v8;
  }
  pthread_mutex_unlock(&self->_nowPlayingInfoLock);
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
    goto LABEL_20;
  }
  sub_1000428B8(qword_10013BD48, 0);
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
    goto LABEL_20;
  }
  sub_100042A04(qword_10013BD48);

  if (nowPlayingAppIsPlaying == v3) {
    goto LABEL_18;
  }
  uint64_t v10 = sub_10005176C();
  if (!v10 || (v10 & 7) != 0)
  {
LABEL_20:
    __break(0x5516u);
    goto LABEL_21;
  }
  sub_100056374(v10, v3 != 0);
LABEL_18:
  global_queue = dispatch_get_global_queue(0, 0);
  if (global_queue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100042F44;
    block[3] = &unk_100121CA0;
    block[4] = self;
    dispatch_async(global_queue, block);
    return;
  }
LABEL_21:
  __break(0x5510u);
}

- (void)_handlePlaybackQueueDidChange
{
  NSLog(@"MR: %s:%d PlaybackQueueDidChange", a2, "-[MediaPlayerHelper _handlePlaybackQueueDidChange]", 2062);
  if (sub_10003CAB4())
  {
    unsigned int v3 = +[MediaPlayerHelper sharedSystemMusicPlayerQueue];
    if (!v3) {
      goto LABEL_11;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043104;
    block[3] = &unk_100121CA0;
    block[4] = self;
    dispatch_sync(v3, block);
  }
  else
  {
    NSLog(@"%s:%d no systemMusicPlayer!", "-[MediaPlayerHelper _handlePlaybackQueueDidChange]", 2066);
  }
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (qword_10013BD48 && (qword_10013BD48 & 7) == 0)
  {
    sub_100042B3C(qword_10013BD48);
    return;
  }
  __break(0x5516u);
LABEL_11:
  __break(0x5510u);
}

- (void)_handleNowPlayingAppDidChange:(id)a3
{
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  if (!a3) {
    goto LABEL_5;
  }
  p_nowPlayingAppIdentifier = (id *)&self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0) {
    goto LABEL_40;
  }
  if (!*p_nowPlayingAppIdentifier
    || ([*p_nowPlayingAppIdentifier isEqualToString:a3] & 1) == 0)
  {
LABEL_5:
    id v6 = &self->_nowPlayingAppIdentifier;
    if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) == 0)
    {
      NSLog(@"MR: %s:%d app='%@'->'%@'", "-[MediaPlayerHelper _handleNowPlayingAppDidChange:]", 2097, *v6, a3);
      if (*v6)
      {

        *id v6 = 0;
      }
      if (a3)
      {
        uint64_t v7 = +[NSString stringWithString:a3];
        self->_nowPlayingAppIdentifier = v7;
        uint64_t v8 = v7;
        self->_nowPlayingAppChanged = 1;
      }
      self->_nowPlayingAppIsIPodIsValid = 0;
      goto LABEL_11;
    }
LABEL_40:
    __break(0x5516u);
    goto LABEL_41;
  }
LABEL_11:
  pthread_mutex_unlock(&self->_nowPlayingInfoLock);
  if (self->podcastAppSelected >= 2u) {
    goto LABEL_41;
  }
  if (self->podcastAppSelected && [(MediaPlayerHelper *)self nowPlayingAppIsPodcastApp]) {
    goto LABEL_33;
  }
  if (self->iBooksAppSelected > 1u) {
    goto LABEL_41;
  }
  if (self->iBooksAppSelected && [(MediaPlayerHelper *)self nowPlayingAppIsiBooksApp]) {
    goto LABEL_33;
  }
  if (self->iTunesUAppSelected > 1u)
  {
LABEL_41:
    __break(0x550Au);
    return;
  }
  if (!self->iTunesUAppSelected || ![(MediaPlayerHelper *)self nowPlayingAppIsiTunesUApp])
  {
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_40;
    }
    sub_1000428B8(qword_10013BD48, 0);
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_40;
    }
    sub_100042A90(qword_10013BD48);
    if (qword_10013BD50 != -1) {
      dispatch_once(&qword_10013BD50, &stru_1001246D0);
    }
    if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
      goto LABEL_40;
    }
    sub_1000433D0((id *)qword_10013BD48, v9, v10);
  }
LABEL_33:
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0) {
    goto LABEL_40;
  }
  sub_100042A04(qword_10013BD48);
}

- (void)_setNowPlayingApp:(id)a3
{
  p_nowPlayingInfoLock = &self->_nowPlayingInfoLock;
  pthread_mutex_lock(&self->_nowPlayingInfoLock);
  p_nowPlayingAppIdentifier = &self->_nowPlayingAppIdentifier;
  if (((unint64_t)&self->_nowPlayingAppIdentifier & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_nowPlayingAppIdentifier)
    {

      id *p_nowPlayingAppIdentifier = 0;
    }
    if (a3)
    {
      uint64_t v7 = +[NSString stringWithString:a3];
      id *p_nowPlayingAppIdentifier = v7;
      uint64_t v8 = v7;
    }
    self->_nowPlayingAppIsIPodIsValid = 0;
    pthread_mutex_unlock(p_nowPlayingInfoLock);
  }
}

- (void)_canShowCloudTracksDidChangeNotification:(id)a3
{
  if (byte_10013984C >= 2u)
  {
    __break(0x550Au);
  }
  else
  {
    sub_1000EE49C(0, @"%s:%d __showCloudTracksSetting=%d->%d", "-[MediaPlayerHelper _canShowCloudTracksDidChangeNotification:]", 2157, byte_10013984C, objc_msgSend(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController", a3), "canShowCloudMusic"));
    byte_10013984C = objc_msgSend(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"), "canShowCloudMusic");
  }
}

- (void)_nowPlayingInfoChanged:(id)a3
{
  char v3 = (char)self;
  pthread_once(&stru_10013B910, sub_1000D8E78);
  if ((unint64_t)dword_10013B900 >= 0xFFFFFFFFFFFFFFF4) {
    goto LABEL_34;
  }
  if (dword_10013B90C)
  {
    unsigned int v8 = sub_1000D92E0();
    pthread_once(&stru_1001398B0, sub_10004BBF8);
    pthread_mutex_lock(&stru_100139870);
    sub_100043848((uint64_t)&qword_10013BCF8, &v8);
    pthread_mutex_unlock(&stru_100139870);
    pthread_once(&stru_100139830, sub_10003E258);
    if (dword_10013C860)
    {
      pthread_mutex_lock(&stru_1001397F0);
      if (dword_10013C860)
      {
        if (!qword_10013C838 || (qword_10013C838 & 7) != 0) {
          goto LABEL_33;
        }
        if (v8 < dword_10013C860)
        {
LABEL_36:
          __break(0x5515u);
          goto LABEL_37;
        }
        uint64_t v4 = *(unsigned int *)(qword_10013C838 + 76);
        if (v4 >= 8)
        {
LABEL_35:
          __break(0x550Au);
          goto LABEL_36;
        }
        if (v4 >= 4)
        {
LABEL_37:
          __break(0x5512u);
          JUMPOUT(0x100043838);
        }
        if (~(unint64_t)dword_10013B900 < 4 * v4)
        {
LABEL_34:
          __break(0x5513u);
          goto LABEL_35;
        }
        if (dword_10013B900[v4]) {
          (*(void (**)(void))(*(void *)qword_10013C838 + 104))();
        }
        if (dword_10013C864 >= 8) {
          goto LABEL_35;
        }
        switch(dword_10013C864)
        {
          case 1:
            uint64_t v5 = qword_10013C840;
            if (!qword_10013C840) {
              goto LABEL_33;
            }
            goto LABEL_22;
          case 2:
            uint64_t v5 = qword_10013C848;
            if (!qword_10013C848) {
              goto LABEL_33;
            }
            goto LABEL_22;
          case 3:
            uint64_t v5 = qword_10013C850;
            if (!qword_10013C850) {
              goto LABEL_33;
            }
            goto LABEL_22;
          case 4:
            uint64_t v5 = qword_10013C858;
            if (!qword_10013C858) {
              goto LABEL_33;
            }
LABEL_22:
            if ((v5 & 7) != 0) {
              goto LABEL_33;
            }
            if (v8 < dword_10013C860) {
              goto LABEL_36;
            }
            uint64_t v6 = *(unsigned int *)(v5 + 76);
            if (v6 >= 8) {
              goto LABEL_35;
            }
            if (v6 >= 4) {
              goto LABEL_37;
            }
            if (~(unint64_t)dword_10013B900 < 4 * v6) {
              goto LABEL_34;
            }
            if (dword_10013B900[v6]) {
              (*(void (**)(uint64_t, void, void, void))(*(void *)v5 + 104))(v5, v8 - dword_10013C860, 0, 0);
            }
LABEL_29:
            dword_10013C860 = 0;
            break;
          default:
            goto LABEL_29;
        }
      }
      pthread_mutex_unlock(&stru_1001397F0);
    }
  }
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  NSLog(@"MR: %s", "-[MediaPlayerHelper _nowPlayingInfoChanged:]");
  if (((v3 + 104) & 7) != 0)
  {
LABEL_33:
    __break(0x5516u);
    goto LABEL_34;
  }
  MRMediaRemoteGetNowPlayingInfo();
}

- (void)_nowPlayingAppIsPlayingChanged:(id)a3
{
  if ((((_BYTE)self + 104) & 7) != 0) {
    __break(0x5516u);
  }
  else {
    MRMediaRemoteGetNowPlayingApplicationIsPlaying();
  }
}

- (void)_playbackQueueDidChangeNotification:(id)a3
{
  sub_1000EE49C(7u, @"MR: %s, notification: %@", "-[MediaPlayerHelper _playbackQueueDidChangeNotification:]", a3);
  p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue;
  if (((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v5 = *p_nowPlayingHandlerQueue;
    if (*p_nowPlayingHandlerQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100043B0C;
      block[3] = &unk_100121CA0;
      block[4] = self;
      dispatch_async(v5, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)_nowPlayingAppChanged:(id)a3
{
  if ((((_BYTE)self + 104) & 7) != 0) {
    __break(0x5516u);
  }
  else {
    MRMediaRemoteGetNowPlayingApplicationPID();
  }
}

- (void)_mediaLibraryChanged:(id)a3
{
  sub_1000EE49C(6u, @"MP: _mediaLibraryChanged", a3);
  sub_100035148();
  if (qword_10013BD50 != -1) {
    dispatch_once(&qword_10013BD50, &stru_1001246D0);
  }
  uint64_t v3 = qword_10013BD48;
  if (!qword_10013BD48 || (qword_10013BD48 & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    sub_100043D30(v3);
  }
}

- (void)_itemPlaybackDidEnd:(id)a3
{
  sub_1000EE49C(6u, @"MP: _itemPlaybackDidEnd", a3);
  p_nowPlayingHandlerQueue = &self->nowPlayingHandlerQueue;
  if (((unint64_t)&self->nowPlayingHandlerQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_7;
  }
  uint64_t v5 = *p_nowPlayingHandlerQueue;
  if (!*p_nowPlayingHandlerQueue)
  {
LABEL_7:
    __break(0x5510u);
    return;
  }
  dispatch_async(v5, &stru_1001246B0);
}

- (void)notifyExplicitControlOccurred
{
  self->_unsigned int explicitControlOccurred = 1;
}

- (void)_checkShuffleRepeatModeChange
{
  p_currentSupportedCommands = &self->_currentSupportedCommands;
  if (((unint64_t)&self->_currentSupportedCommands & 7) != 0) {
    goto LABEL_33;
  }
  if (*p_currentSupportedCommands)
  {
    CFIndex Count = CFArrayGetCount(*p_currentSupportedCommands);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      int v7 = 0;
      int v8 = 0;
      while (1)
      {
        if (CFArrayGetValueAtIndex(*p_currentSupportedCommands, v6)
          && MRMediaRemoteCommandInfoGetEnabled())
        {
          uint64_t Command = MRMediaRemoteCommandInfoGetCommand();
          int v10 = Command;
          sub_1000EE49C(6u, @"MP: %s: index=%d command=%d", "-[MediaPlayerHelper _checkShuffleRepeatModeChange]", v6, Command);
          if (v10 == 26)
          {
            int v20 = -1431655766;
            CFNumberRef v11 = (const __CFNumber *)MRMediaRemoteCommandInfoCopyValueForKey();
            sub_1000EE49C(6u, @"MP: %s: tmpShuffleModeObj=%@", "-[MediaPlayerHelper _checkShuffleRepeatModeChange]", v11);
            if (!v11) {
              goto LABEL_14;
            }
            CFNumberGetValue(v11, kCFNumberIntType, &v20);
            int v8 = v20;
            goto LABEL_13;
          }
          if (v10 == 25)
          {
            int valuePtr = -1431655766;
            CFNumberRef v11 = (const __CFNumber *)MRMediaRemoteCommandInfoCopyValueForKey();
            sub_1000EE49C(6u, @"MP: %s: tmpRepeatModeObj=%@", "-[MediaPlayerHelper _checkShuffleRepeatModeChange]", v11);
            if (v11)
            {
              CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
              int v7 = valuePtr;
LABEL_13:
              CFRelease(v11);
            }
          }
        }
LABEL_14:
        int v12 = v6 + 1;
        if (__OFADD__(v6, 1))
        {
          __break(0x5500u);
          goto LABEL_33;
        }
        CFIndex v6 = v12;
        if (v5 <= v12) {
          goto LABEL_18;
        }
      }
    }
  }
  int v8 = 0;
  int v7 = 0;
LABEL_18:
  p_uint64_t repeatModeCache = &self->repeatModeCache;
  if (((unint64_t)&self->repeatModeCache & 3) != 0) {
    goto LABEL_33;
  }
  if (v7 != *p_repeatModeCache || *p_repeatModeCache == 0)
  {
    double v15 = (const void *)MRMediaRemoteCopyShuffleModeDescription();
    uint64_t v16 = (const void *)MRMediaRemoteCopyShuffleModeDescription();
    NSLog(@"MR: repeatMode %@->%@", v15, v16);
    CFRelease(v15);
    CFRelease(v16);
    self->uint64_t repeatModeCache = v7;
    if ((((int)self + 128) & 3) != 0) {
      goto LABEL_33;
    }
    self->expectedRepeatModeTimestamp = 0;
    [(MediaPlayerHelper *)self _repeatModeChanged:0];
  }
  p_uint64_t shuffleModeCache = &self->shuffleModeCache;
  if (((unint64_t)&self->shuffleModeCache & 3) != 0)
  {
LABEL_33:
    __break(0x5516u);
  }
  else if (v8 != *p_shuffleModeCache || !*p_shuffleModeCache)
  {
    double v18 = (const void *)MRMediaRemoteCopyShuffleModeDescription();
    unsigned int v19 = (const void *)MRMediaRemoteCopyShuffleModeDescription();
    NSLog(@"MR: shuffleMode %@->%@", v18, v19);
    CFRelease(v18);
    CFRelease(v19);
    self->uint64_t shuffleModeCache = v8;
    if ((((int)self + 132) & 3) != 0) {
      goto LABEL_33;
    }
    self->expectedShuffleModeTimestamp = 0;
    [(MediaPlayerHelper *)self _shuffleModeChanged:0];
  }
}

- (void)_supportedCommandsDidChange:(__CFArray *)a3
{
  p_currentSupportedCommands = &self->_currentSupportedCommands;
  if (((unint64_t)&self->_currentSupportedCommands & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    CFIndex v5 = self;
    NSLog(@"MR: %s:%d _currentSupportedCommands %@ ---> %@", a2, "-[MediaPlayerHelper _supportedCommandsDidChange:]", 2399, *p_currentSupportedCommands, a3);
    if (*p_currentSupportedCommands) {
      CFRelease(*p_currentSupportedCommands);
    }
    *p_currentSupportedCommands = a3;
    if (a3) {
      CFRetain(a3);
    }
    self = v5;
  }
  [(MediaPlayerHelper *)self _checkShuffleRepeatModeChange];
}

- (void)_supportedCommandsDidChangeNotification
{
  if ((((_BYTE)self + 104) & 7) != 0) {
    __break(0x5516u);
  }
  else {
    MRMediaRemoteCopySupportedCommands();
  }
}

- (BOOL)_isSetElapsedTimeAvailable
{
  if (self->_nowPlayingAppIsIPodRadio) {
    return 0;
  }
  else {
    return [(MediaPlayerHelper *)self _isCommandSupported:24];
  }
}

- (void)_findCommandRefForCommand:(unsigned int)a3
{
  if (((unint64_t)&self->_currentSupportedCommands & 7) != 0) {
    __break(0x5516u);
  }
  currentSupportedCommands = self->_currentSupportedCommands;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(__CFArray *)currentSupportedCommands countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(currentSupportedCommands);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (MRMediaRemoteCommandInfoGetCommand() == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(__CFArray *)currentSupportedCommands countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (BOOL)_isCommandSupported:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = -[MediaPlayerHelper _findCommandRefForCommand:](self, "_findCommandRefForCommand:");
  if (v4) {
    LODWORD(v4) = MRMediaRemoteCommandInfoGetCommand() == v3
  }
               && MRMediaRemoteCommandInfoGetEnabled() != 0;
  sub_1000EE49C(7u, @"command supported %d for command %d", v4, v3);
  return (char)v4;
}

- (int)repeatModeCache
{
  return self->repeatModeCache;
}

- (void)setRepeatModeCache:(int)a3
{
  if (((unint64_t)&self->repeatModeCache & 3) != 0) {
    __break(0x5516u);
  }
  else {
    self->uint64_t repeatModeCache = a3;
  }
}

- (int)shuffleModeCache
{
  return self->shuffleModeCache;
}

- (void)setShuffleModeCache:(int)a3
{
  if (((unint64_t)&self->shuffleModeCache & 3) != 0) {
    __break(0x5516u);
  }
  else {
    self->uint64_t shuffleModeCache = a3;
  }
}

- (BOOL)podcastAppSelected
{
  unsigned int podcastAppSelected = self->podcastAppSelected;
  if (podcastAppSelected >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = podcastAppSelected != 0;
  }
  return (char)self;
}

- (void)setPodcastAppSelected:(BOOL)a3
{
  self->unsigned int podcastAppSelected = a3;
}

- (BOOL)iBooksAppSelected
{
  unsigned int iBooksAppSelected = self->iBooksAppSelected;
  if (iBooksAppSelected >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = iBooksAppSelected != 0;
  }
  return (char)self;
}

- (void)setIBooksAppSelected:(BOOL)a3
{
  self->unsigned int iBooksAppSelected = a3;
}

- (BOOL)iTunesUAppSelected
{
  unsigned int iTunesUAppSelected = self->iTunesUAppSelected;
  if (iTunesUAppSelected >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = iTunesUAppSelected != 0;
  }
  return (char)self;
}

- (void)setITunesUAppSelected:(BOOL)a3
{
  self->unsigned int iTunesUAppSelected = a3;
}

- (OS_dispatch_queue)nowPlayingHandlerQueue
{
  return self->nowPlayingHandlerQueue;
}

- (BOOL)fakeStreamTrackIndexSet
{
  unsigned int fakeStreamTrackIndexSet = self->_fakeStreamTrackIndexSet;
  if (fakeStreamTrackIndexSet >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = fakeStreamTrackIndexSet != 0;
  }
  return (char)self;
}

@end