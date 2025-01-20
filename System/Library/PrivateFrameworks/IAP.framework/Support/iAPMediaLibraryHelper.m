@interface iAPMediaLibraryHelper
- (BOOL)_updateRadioLibraryList;
- (BOOL)showAudioBooks;
- (BOOL)showITunesU;
- (BOOL)showMusic;
- (BOOL)showPodcasts;
- (BOOL)stationGetError;
- (MediaLibraryHelper)mediaLibraryHelper;
- (NSArray)stationsGroupList;
- (OS_dispatch_queue)libraryUpdateQ;
- (iAPMediaLibraryHelper)init;
- (id)stationForIndex:(unint64_t)a3;
- (id)stationNameForIndex:(unint64_t)a3;
- (unsigned)stationCount;
- (void)_radioLibraryChanged:(id)a3;
- (void)dealloc;
- (void)handlMediaLibraryNeedFilterChange:(id)a3;
- (void)iterateStationsList:(id)a3;
@end

@implementation iAPMediaLibraryHelper

- (iAPMediaLibraryHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)iAPMediaLibraryHelper;
  v2 = [(iAPMediaLibraryHelper *)&v6 init];
  if (!v2) {
    return v2;
  }
  result = (iAPMediaLibraryHelper *)dispatch_queue_create("com.apple.iapd.mediaLibraryUpdateQ", 0);
  if ((((_BYTE)v2 + 16) & 7) == 0)
  {
    v2->_libraryUpdateQ = (OS_dispatch_queue *)result;
    result = objc_alloc_init(MediaLibraryHelper);
    if ((((_BYTE)v2 + 32) & 7) == 0)
    {
      v2->_mediaLibraryHelper = (MediaLibraryHelper *)result;
      v2->_stationGetError = 0;
      if ((((int)v2 + 8) & 3) == 0)
      {
        v2->_stationCount = 0;
        [(iAPMediaLibraryHelper *)v2 _updateRadioLibraryList];
        [+[MPMediaLibrary defaultMediaLibrary] beginGeneratingLibraryChangeNotifications];
        v4 = +[NSNotificationCenter defaultCenter];
        [(NSNotificationCenter *)v4 addObserver:v2 selector:"_radioLibraryChanged:" name:MPRadioLibraryStationsDidChangeNotification object:0];
        v5 = +[NSNotificationCenter defaultCenter];
        [(NSNotificationCenter *)v5 addObserver:v2 selector:"handlMediaLibraryNeedFilterChange:" name:off_10013B9C0 object:0];
        return v2;
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  [+[MPMediaLibrary defaultMediaLibrary] endGeneratingLibraryChangeNotifications];
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)iAPMediaLibraryHelper;
  [(iAPMediaLibraryHelper *)&v3 dealloc];
}

- (unsigned)stationCount
{
  LODWORD(v3) = [(iAPMediaLibraryHelper *)self showMusic];
  if ((v3 & 1) == 0)
  {
    LODWORD(v3) = 0;
    return v3;
  }
  if (self->_stationGetError >= 2u)
  {
LABEL_12:
    __break(0x550Au);
    return v3;
  }
  if (self->_stationGetError)
  {
    LODWORD(v3) = [(iAPMediaLibraryHelper *)self _updateRadioLibraryList];
    if (v3)
    {
      uint64_t v3 = sub_10003E5D0();
      if (!v3 || (v3 & 7) != 0) {
        goto LABEL_11;
      }
      LODWORD(v3) = sub_100043D30(v3);
    }
  }
  if (((unint64_t)&self->_stationCount & 3) != 0)
  {
LABEL_11:
    __break(0x5516u);
    goto LABEL_12;
  }
  LODWORD(v3) = self->_stationCount;
  return v3;
}

- (BOOL)_updateRadioLibraryList
{
  p_mediaLibraryHelper = &self->_mediaLibraryHelper;
  if (((unint64_t)&self->_mediaLibraryHelper & 7) != 0) {
    goto LABEL_33;
  }
  uint64_t v3 = self;
  NSLog(@"%s:%d iTunesRadioEnabled=%d", "-[iAPMediaLibraryHelper _updateRadioLibraryList]", 617, [(MediaLibraryHelper *)*p_mediaLibraryHelper iTunesRadioEnabled]);
  if ([(MediaLibraryHelper *)*p_mediaLibraryHelper iTunesRadioEnabled])
  {
    v4 = dispatch_semaphore_create(0);
    if (!v4
      || (v5 = v4,
          dispatch_retain(v4),
          uint64_t v32 = 0,
          v33 = &v32,
          uint64_t v34 = 0x2020000000,
          char v35 = 0,
          (global_queue = dispatch_get_global_queue(0, 0)) == 0))
    {
LABEL_35:
      __break(0x5510u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003486C;
    block[3] = &unk_100124050;
    block[5] = v5;
    block[6] = &v32;
    block[4] = v3;
    dispatch_async(global_queue, block);
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    intptr_t v8 = dispatch_semaphore_wait(v5, v7);
    BOOL v9 = v8 == 0;
    if (v8)
    {
      *((unsigned char *)v33 + 24) = 1;
      NSLog(@"%s:%d WARNING: timed out(%d) waiting for recent stations list, give up for now", "-[iAPMediaLibraryHelper _updateRadioLibraryList]", 664, 2);
    }
    dispatch_release(v5);
    p_stationCount = &v3->_stationCount;
    if (((unint64_t)&v3->_stationCount & 3) != 0) {
      goto LABEL_33;
    }
    v3->_stationCount = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    p_stationsGroupList = (id *)&v3->_stationsGroupList;
    if (((unint64_t)&v3->_stationsGroupList & 7) != 0) {
      goto LABEL_33;
    }
    char v25 = v9;
    v26 = v3;
    id v12 = *p_stationsGroupList;
    id v13 = [*p_stationsGroupList countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = *(void *)v28;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(v12);
      }
      v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
      sub_1000EE49C(0, @"%s:%d _stationCount: %d, [[stationsGroup stations] count]: %d, stations: %@", "-[iAPMediaLibraryHelper _updateRadioLibraryList]", 674, *p_stationCount, objc_msgSend(objc_msgSend(v16, "stations"), "count"), objc_msgSend(v16, "stations"));
      v17 = (char *)objc_msgSend(objc_msgSend(v16, "stations"), "count");
      uint64_t v18 = *p_stationCount;
      BOOL v19 = __CFADD__(v18, v17);
      unint64_t v20 = (unint64_t)&v17[v18];
      if (v19) {
        break;
      }
      if (HIDWORD(v20)) {
        goto LABEL_32;
      }
      unsigned int *p_stationCount = v20;
      if (v13 == (id)++v15)
      {
        id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (!v13)
        {
LABEL_18:
          _Block_object_dispose(&v32, 8);
          uint64_t v3 = v26;
          char v21 = v25;
          goto LABEL_22;
        }
        goto LABEL_11;
      }
    }
    __break(0x5500u);
LABEL_32:
    __break(0x5507u);
LABEL_33:
    __break(0x5516u);
LABEL_34:
    __break(0x550Au);
    goto LABEL_35;
  }
  if ((((_BYTE)v3 + 8) & 3) != 0) {
    goto LABEL_33;
  }
  v3->_stationCount = 0;
  v22 = (id *)&v3->_stationsGroupList;
  if (((unint64_t)&v3->_stationsGroupList & 7) != 0) {
    goto LABEL_33;
  }

  id *v22 = 0;
  char v21 = 1;
LABEL_22:
  if (v3->_stationGetError >= 2u) {
    goto LABEL_34;
  }
  if ((((_BYTE)v3 + 24) & 7) != 0) {
    goto LABEL_33;
  }
  NSLog(@"%s:%d _stationCount=%d max=%d _stationGetError=%d _stationsGroupList=%@", "-[iAPMediaLibraryHelper _updateRadioLibraryList]", 687, v3->_stationCount, dword_1001397D8, v3->_stationGetError, v3->_stationsGroupList);
  if ((signed int)v3->_stationCount > dword_1001397D8) {
    v3->_stationCount = dword_1001397D8;
  }
  if (v21) {
    return 1;
  }
  unsigned int stationGetError = v3->_stationGetError;
  if (stationGetError > 1) {
    goto LABEL_34;
  }
  return stationGetError != 0;
}

- (void)_radioLibraryChanged:(id)a3
{
  if ((((int)self + 32) & 7) != 0) {
    goto LABEL_9;
  }
  NSLog(@"%s:%d iTunesRadioEnabled=%d notification=%@", "-[iAPMediaLibraryHelper _radioLibraryChanged:]", 700, [(MediaLibraryHelper *)self->_mediaLibraryHelper iTunesRadioEnabled], a3);
  if (![(iAPMediaLibraryHelper *)self _updateRadioLibraryList]) {
    return;
  }
  uint64_t v4 = sub_10003E5D0();
  if (!v4 || (v4 & 7) != 0)
  {
LABEL_9:
    __break(0x5516u);
    return;
  }
  sub_100043D30(v4);
}

- (void)iterateStationsList:(id)a3
{
  if (self->_stationGetError >= 2u) {
LABEL_31:
  }
    __break(0x550Au);
  if (!self->_stationGetError) {
    goto LABEL_7;
  }
  sub_1000EE49C(0, @"%s:%d _stationGetError=%d, try retrieve station list again", "-[iAPMediaLibraryHelper iterateStationsList:]", 734, 1);
  if ([(iAPMediaLibraryHelper *)self _updateRadioLibraryList]) {
    goto LABEL_7;
  }
  uint64_t v5 = sub_10003E5D0();
  if (!v5 || (v5 & 7) != 0)
  {
LABEL_30:
    __break(0x5516u);
    goto LABEL_31;
  }
  sub_100043D30(v5);
LABEL_7:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  p_stationsGroupList = (id *)&self->_stationsGroupList;
  if (((unint64_t)&self->_stationsGroupList & 7) != 0) {
    goto LABEL_30;
  }
  id obj = *p_stationsGroupList;
  id v19 = [*p_stationsGroupList countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v19) {
    return;
  }
  unsigned int v23 = 0;
  uint64_t v7 = 0;
  uint64_t v21 = *(void *)v29;
  do
  {
    intptr_t v8 = 0;
    unint64_t v18 = ~v23;
    do
    {
      if (*(void *)v29 != v21) {
        objc_enumerationMutation(obj);
      }
      BOOL v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
      id v10 = [v9 stations];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v22 = v10;
      v11 = (char *)[v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        v17 = v8;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v25;
        do
        {
          uint64_t v15 = 0;
          int v16 = v7;
          do
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v22);
            }
            if (((*((uint64_t (**)(id, char *, void, char *, void *, void))a3 + 2))(a3, &v15[v7], v23, &v15[v13], v9, *(void *)(*((void *)&v24 + 1) + 8 * (void)v15)) & 1) != 0|| (int)v7 + (int)v15 >= dword_1001397D8)
            {
              return;
            }
            if ((char *)(v13 ^ 0xFFFFFFFFLL) == v15 || (char *)(v7 ^ 0xFFFFFFFFLL) == v15) {
              goto LABEL_29;
            }
            ++v15;
          }
          while (v12 != v15);
          id v12 = (char *)[v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
          uint64_t v13 = (v13 + v15);
          uint64_t v7 = (v7 + v15);
        }
        while (v12);
        uint64_t v7 = (v16 + v15);
        intptr_t v8 = v17;
      }
      if (v8 == (void *)v18)
      {
LABEL_29:
        __break(0x5500u);
        goto LABEL_30;
      }
      ++v23;
      intptr_t v8 = (char *)v8 + 1;
    }
    while (v8 != v19);
    id v19 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  }
  while (v19);
}

- (id)stationForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = sub_100034E2C;
  id v10 = sub_100034E3C;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034E48;
  v5[3] = &unk_100124078;
  v5[4] = &v6;
  v5[5] = a3;
  [(iAPMediaLibraryHelper *)self iterateStationsList:v5];
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)stationNameForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = sub_100034E2C;
  id v10 = sub_100034E3C;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034FA4;
  v5[3] = &unk_100124078;
  v5[4] = &v6;
  v5[5] = a3;
  [(iAPMediaLibraryHelper *)self iterateStationsList:v5];
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)handlMediaLibraryNeedFilterChange:(id)a3
{
  sub_1000EE49C(0, @"%s:%d notification=%@", "-[iAPMediaLibraryHelper handlMediaLibraryNeedFilterChange:]", 826, a3);
  dword_1001397E0 = -1;
  dword_1001397E4 = -1;
  if (!dword_1001397DC) {
    [(id)qword_10013BCC8 reset];
  }
  [(iAPMediaLibraryHelper *)self _updateRadioLibraryList];
  uint64_t v4 = sub_10003E5D0();
  if (!v4 || (v4 & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    sub_100043D30(v4);
  }
}

- (BOOL)showMusic
{
  if (((unint64_t)&self->_mediaLibraryHelper & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(MediaLibraryHelper *)self->_mediaLibraryHelper showMusic];
  }
  return (char)self;
}

- (BOOL)showPodcasts
{
  if (((unint64_t)&self->_mediaLibraryHelper & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(MediaLibraryHelper *)self->_mediaLibraryHelper showPodcasts];
  }
  return (char)self;
}

- (BOOL)showITunesU
{
  if (((unint64_t)&self->_mediaLibraryHelper & 7) == 0) {
    return [(MediaLibraryHelper *)self->_mediaLibraryHelper showiTunesU];
  }
  __break(0x5516u);
  return [(iAPMediaLibraryHelper *)self showiTunesU];
}

- (BOOL)showAudioBooks
{
  if (((unint64_t)&self->_mediaLibraryHelper & 7) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = [(MediaLibraryHelper *)self->_mediaLibraryHelper showAudioBooks];
  }
  return (char)self;
}

- (OS_dispatch_queue)libraryUpdateQ
{
  return self->_libraryUpdateQ;
}

- (NSArray)stationsGroupList
{
  return self->_stationsGroupList;
}

- (BOOL)stationGetError
{
  unsigned int stationGetError = self->_stationGetError;
  if (stationGetError >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = stationGetError != 0;
  }
  return (char)self;
}

- (MediaLibraryHelper)mediaLibraryHelper
{
  return self->_mediaLibraryHelper;
}

@end