@interface LPMediaRemotePlaybackObserver
+ (id)shared;
- (BOOL)isPlaying;
- (BOOL)playbackInformationMatchesPlayingItem:(id)a3;
- (double)elapsedFractionForPlaybackInformation:(id)a3;
- (double)minimumUpdateInterval;
- (void)addClient:(id)a3;
- (void)dispatchPlayingItemDidChangeToAllClients;
- (void)removeClient:(id)a3;
- (void)updatePlaybackState;
@end

@implementation LPMediaRemotePlaybackObserver

+ (id)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_20);
  }
  v2 = (void *)shared_observer_0;

  return v2;
}

void __39__LPMediaRemotePlaybackObserver_shared__block_invoke()
{
  v0 = objc_alloc_init(LPMediaRemotePlaybackObserver);
  v1 = (void *)shared_observer_0;
  shared_observer_0 = (uint64_t)v0;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  clients = self->_clients;
  id v14 = v4;
  if (!clients)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_clients;
    self->_clients = v6;

    clients = self->_clients;
    id v4 = v14;
  }
  [(NSHashTable *)clients addObject:v4];
  [(LPMediaRemotePlaybackObserver *)self minimumUpdateInterval];
  double v9 = v8;
  timer = self->_timer;
  if (timer)
  {
    [(NSTimer *)timer timeInterval];
    if (vabdd_f64(v11, v9) < 2.22044605e-16) {
      goto LABEL_7;
    }
    timer = self->_timer;
  }
  [(NSTimer *)timer invalidate];
  v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updatePlaybackState selector:0 userInfo:1 repeats:v9];
  v13 = self->_timer;
  self->_timer = v12;

LABEL_7:
}

- (void)removeClient:(id)a3
{
  id v5 = a3;
  -[NSHashTable removeObject:](self->_clients, "removeObject:");
  if (![(NSHashTable *)self->_clients count])
  {
    [(NSTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (double)minimumUpdateInterval
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_clients;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    double v6 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "desiredUpdateIntervalForMediaRemotePlaybackObserver:", self, (void)v12);
        if (v6 >= v9)
        {
          [v8 desiredUpdateIntervalForMediaRemotePlaybackObserver:self];
          double v6 = v10;
        }
      }
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = INFINITY;
  }

  return v6;
}

- (void)dispatchPlayingItemDidChangeToAllClients
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_clients;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "mediaRemotePlaybackObserverPlayingItemDidChange:", self, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updatePlaybackState
{
  v76[2] = *MEMORY[0x1E4F143B8];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2050000000;
  v2 = (void *)getMPCPlayerRequestClass_softClass;
  uint64_t v68 = getMPCPlayerRequestClass_softClass;
  if (!getMPCPlayerRequestClass_softClass)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPCPlayerRequestClass_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    __getMPCPlayerRequestClass_block_invoke((uint64_t)&v60);
    v2 = (void *)v66[3];
  }
  v3 = v2;
  _Block_object_dispose(&v65, 8);
  v58 = (void *)[[v3 alloc] init];
  id v4 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v5 = (id *)getMPModelRelationshipGenericSongSymbolLoc_ptr;
  uint64_t v68 = getMPModelRelationshipGenericSongSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericSongSymbolLoc_ptr)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPModelRelationshipGenericSongSymbolLoc_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    uint64_t v6 = MediaPlayerLibrary_1();
    long long v7 = dlsym(v6, "MPModelRelationshipGenericSong");
    *(void *)(v64[1] + 24) = v7;
    getMPModelRelationshipGenericSongSymbolLoc_ptr = *(void *)(v64[1] + 24);
    uint64_t v5 = (id *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v5)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipGenericSong(void)"];
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"LPMediaRemotePlaybackObserver.m", 30, @"%s", dlerror());

    goto LABEL_28;
  }
  id v57 = *v5;
  v75[0] = v57;
  id v8 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  long long v9 = (id *)getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  uint64_t v68 = getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  if (!getMPModelRelationshipSongAlbumSymbolLoc_ptr)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPModelRelationshipSongAlbumSymbolLoc_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    long long v10 = MediaPlayerLibrary_1();
    double v11 = dlsym(v10, "MPModelRelationshipSongAlbum");
    *(void *)(v64[1] + 24) = v11;
    getMPModelRelationshipSongAlbumSymbolLoc_ptr = *(void *)(v64[1] + 24);
    long long v9 = (id *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v9)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    v46 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipSongAlbum(void)"];
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"LPMediaRemotePlaybackObserver.m", 33, @"%s", dlerror());

    goto LABEL_28;
  }
  id v56 = *v9;
  id v73 = v56;
  uint64_t v12 = (void *)[objc_alloc((Class)getMPPropertySetClass()) initWithProperties:0 relationships:0];
  v74 = v12;
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
  long long v14 = (void *)[v8 initWithProperties:0 relationships:v13];
  v76[0] = v14;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  long long v15 = (id *)getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr;
  uint64_t v68 = getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    v16 = MediaPlayerLibrary_1();
    uint64_t v17 = dlsym(v16, "MPModelRelationshipGenericPodcastEpisode");
    *(void *)(v64[1] + 24) = v17;
    getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr = *(void *)(v64[1] + 24);
    long long v15 = (id *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v15)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    v48 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipGenericPodcastEpisode(void)"];
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"LPMediaRemotePlaybackObserver.m", 28, @"%s", dlerror());

    goto LABEL_28;
  }
  id v18 = *v15;
  v75[1] = v18;
  id v19 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  v20 = (id *)getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr;
  uint64_t v68 = getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr;
  if (!getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    v21 = MediaPlayerLibrary_1();
    v22 = dlsym(v21, "MPModelRelationshipPodcastEpisodePodcast");
    *(void *)(v64[1] + 24) = v22;
    getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr = *(void *)(v64[1] + 24);
    v20 = (id *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v20)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    v50 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipPodcastEpisodePodcast(void)"];
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"LPMediaRemotePlaybackObserver.m", 32, @"%s", dlerror());

    goto LABEL_28;
  }
  id v23 = *v20;
  id v71 = v23;
  v24 = (void *)[objc_alloc((Class)getMPPropertySetClass()) initWithProperties:0 relationships:0];
  v72 = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v26 = (void *)[v19 initWithProperties:0 relationships:v25];
  v76[1] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
  v28 = (void *)[v4 initWithProperties:0 relationships:v27];
  [v58 setPlayingItemProperties:v28];

  id v29 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  v30 = (id *)getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
  uint64_t v68 = getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericPlaylistSymbolLoc_ptr)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPModelRelationshipGenericPlaylistSymbolLoc_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    v31 = MediaPlayerLibrary_1();
    v32 = dlsym(v31, "MPModelRelationshipGenericPlaylist");
    *(void *)(v64[1] + 24) = v32;
    getMPModelRelationshipGenericPlaylistSymbolLoc_ptr = *(void *)(v64[1] + 24);
    v30 = (id *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v30)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    v52 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipGenericPlaylist(void)"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"LPMediaRemotePlaybackObserver.m", 27, @"%s", dlerror());

    goto LABEL_28;
  }
  id v33 = *v30;
  v69[0] = v33;
  v34 = [getMPPropertySetClass() propertySetWithProperties:MEMORY[0x1E4F1CBF0]];
  v70[0] = v34;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  v35 = (id *)getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  uint64_t v68 = getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericRadioStationSymbolLoc_ptr)
  {
    uint64_t v60 = MEMORY[0x1E4F143A8];
    uint64_t v61 = 3221225472;
    v62 = __getMPModelRelationshipGenericRadioStationSymbolLoc_block_invoke;
    v63 = &unk_1E5B04EB8;
    v64 = &v65;
    v36 = MediaPlayerLibrary_1();
    v37 = dlsym(v36, "MPModelRelationshipGenericRadioStation");
    *(void *)(v64[1] + 24) = v37;
    getMPModelRelationshipGenericRadioStationSymbolLoc_ptr = *(void *)(v64[1] + 24);
    v35 = (id *)v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v35)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    v54 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipGenericRadioStation(void)"];
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"LPMediaRemotePlaybackObserver.m", 29, @"%s", dlerror());

LABEL_28:
    __break(1u);
  }
  id v38 = *v35;
  v69[1] = v38;
  v39 = [getMPPropertySetClass() propertySetWithProperties:MEMORY[0x1E4F1CBF0]];
  v70[1] = v39;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
  v41 = (void *)[v29 initWithProperties:0 relationships:v40];
  [v58 setQueueSectionProperties:v41];

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke;
  v59[3] = &unk_1E5B069B0;
  v59[4] = self;
  id v42 = (id)[v58 performWithCompletion:v59];
}

void __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_2;
  aBlock[3] = &unk_1E5B04DF0;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v5 = [v3 tracklist];
  uint64_t v6 = [v5 playingItemIndexPath];

  if (v6)
  {
    long long v7 = [v3 tracklist];
    id v8 = [v7 items];
    long long v9 = [v3 tracklist];
    long long v10 = [v9 playingItemIndexPath];
    double v11 = [v8 itemAtIndexPath:v10];

    uint64_t v12 = [v11 metadataObject];
    long long v13 = (void *)v12;
    if (v11 && v12)
    {
      long long v14 = [v3 tracklist];
      long long v15 = [v14 items];
      v16 = [v3 tracklist];
      uint64_t v17 = [v16 playingItemIndexPath];
      id v18 = objc_msgSend(v15, "sectionAtIndex:", objc_msgSend(v17, "indexAtPosition:", 0));

      id v19 = [v18 metadataObject];
      uint64_t v37 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      [v11 duration];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v21 = (v20 - 0.0) * 0.0 + 0.0;
      if (v21 >= 0.0) {
        double v21 = *((double *)&v35 + 1);
      }
      double v22 = fmax(v21, 0.0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_4;
      block[3] = &unk_1E5B06988;
      block[4] = *(void *)(a1 + 32);
      char v33 = 0;
      id v25 = v13;
      id v26 = v19;
      long long v27 = v34;
      long long v28 = v35;
      long long v29 = v36;
      uint64_t v30 = v37;
      double v31 = v22;
      uint64_t v32 = 0;
      id v23 = v19;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v4[2](v4);
    }
  }
  else
  {
    v4[2](v4);
  }
}

void __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_3;
  block[3] = &unk_1E5B04DF0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 dispatchPlayingItemDidChangeToAllClients];
}

uint64_t __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = *(unsigned char *)(a1 + 128);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = *(unsigned char *)(a1 + 104);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 112);
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 120);
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 dispatchPlayingItemDidChangeToAllClients];
}

- (double)elapsedFractionForPlaybackInformation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  double v6 = 1.0;
  if (!self->_enqueuedItemIsLive)
  {
    long long v7 = [v4 lyricExcerpt];

    if (v7)
    {
      id v8 = [v5 lyricExcerpt];
      long long v9 = [v8 startTime];
      [v9 doubleValue];
      double v11 = v10;

      uint64_t v12 = [v8 endTime];
      [v12 doubleValue];
      double v13 = v11 + -1.0;
      double v6 = 1.0;
      double v15 = v14 + 1.0;

      if (v15 - v13 != 0.0) {
        double v6 = fmax((self->_elapsedTime - v13) / (v15 - v13), 0.0);
      }
    }
    else
    {
      double v6 = self->_elapsedTime / self->_totalTime;
    }
  }

  return v6;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)playbackInformationMatchesPlayingItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_enqueuedItem)
  {
    switch([v4 type])
    {
      case 0:
        if ([(MPModelGenericObject *)self->_enqueuedItem type] != 1) {
          goto LABEL_38;
        }
        double v6 = NSNumber;
        long long v7 = [(MPModelGenericObject *)self->_enqueuedItem identifiers];
        id v8 = [v7 universalStore];
        long long v9 = objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(v8, "adamID"));
        double v10 = [v9 stringValue];

        if (!v10) {
          goto LABEL_30;
        }
        double v11 = [v5 lyricExcerpt];

        if (!v11) {
          goto LABEL_25;
        }
        uint64_t v12 = [v5 lyricExcerpt];
        double v13 = [v12 startTime];
        [v13 doubleValue];
        double v15 = v14;

        v16 = [v12 endTime];
        [v16 doubleValue];
        double v18 = v17;
        double v19 = v15 + -1.0;

        double elapsedTime = self->_elapsedTime;
        char v21 = 0;
        if (elapsedTime >= v19 && elapsedTime <= v18 + 1.0) {
          goto LABEL_25;
        }
        goto LABEL_31;
      case 1:
        if ([(MPModelGenericObject *)self->_enqueuedItem type] != 1) {
          goto LABEL_38;
        }
        v40 = NSNumber;
        v41 = [(MPModelGenericObject *)self->_enqueuedItem song];
        id v42 = [v41 album];
        v43 = [v42 identifiers];
        v44 = [v43 universalStore];
        v45 = objc_msgSend(v40, "numberWithLongLong:", objc_msgSend(v44, "adamID"));
        v39 = [v45 stringValue];

        if (v39) {
          goto LABEL_22;
        }
        goto LABEL_32;
      case 2:
        double v31 = [(MPModelGenericObject *)self->_enqueuedItemContext identifiers];
        uint64_t v32 = [v31 radio];
        double v10 = [v32 stationStringID];

        if (v10) {
          goto LABEL_25;
        }
        goto LABEL_30;
      case 3:
        if ([(MPModelGenericObject *)self->_enqueuedItem type] != 12) {
          goto LABEL_38;
        }
        char v33 = NSNumber;
        long long v34 = [(MPModelGenericObject *)self->_enqueuedItem podcastEpisode];
        long long v35 = [v34 podcast];
        long long v36 = [v35 identifiers];
        uint64_t v37 = [v36 universalStore];
        id v38 = objc_msgSend(v33, "numberWithLongLong:", objc_msgSend(v37, "adamID"));
        v39 = [v38 stringValue];

        if (v39)
        {
LABEL_22:
          v46 = [v5 storeIdentifier];
          char v21 = [v46 isEqualToString:v39];
        }
        else
        {
LABEL_32:
          char v21 = 0;
        }

        break;
      case 4:
        if ([(MPModelGenericObject *)self->_enqueuedItem type] != 12) {
          goto LABEL_38;
        }
        double v22 = NSNumber;
        id v23 = [(MPModelGenericObject *)self->_enqueuedItem identifiers];
        v24 = [v23 universalStore];
        id v25 = objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v24, "adamID"));
        id v26 = [v25 stringValue];

        if (v26)
        {
          id v27 = v26;
          long long v28 = v27;
          if (([v27 hasPrefix:@"1000"] & 1) == 0)
          {
            uint64_t v29 = [@"1000" stringByAppendingString:v27];

            long long v28 = (void *)v29;
          }
          uint64_t v30 = [v5 storeIdentifier];
          if ([v30 isEqualToString:v27])
          {
            char v21 = 1;
          }
          else
          {
            v54 = [v5 storeIdentifier];
            char v21 = [v54 isEqualToString:v28];
          }
        }
        else
        {
          char v21 = 0;
        }

        break;
      case 5:
        if ([(MPModelGenericObject *)self->_enqueuedItem type] != 1) {
          goto LABEL_38;
        }
        v47 = [(MPModelGenericObject *)self->_enqueuedItemContext identifiers];
        v48 = [v47 universalStore];
        double v10 = [v48 globalPlaylistID];

        if (!v10) {
          goto LABEL_30;
        }
LABEL_25:
        v49 = [v5 storeIdentifier];
        char v21 = [v49 isEqualToString:v10];
        goto LABEL_29;
      case 6:
        if ([(MPModelGenericObject *)self->_enqueuedItem type] != 1) {
          goto LABEL_38;
        }
        v50 = [(MPModelGenericObject *)self->_enqueuedItem song];
        v51 = [v50 identifiers];
        double v10 = [v51 contentItemID];

        if (v10)
        {
          v52 = NSString;
          v49 = [v5 persistentIdentifier];
          v53 = [v52 stringWithFormat:@"id=%@_", v49];
          char v21 = [v10 containsString:v53];

LABEL_29:
        }
        else
        {
LABEL_30:
          char v21 = 0;
        }
LABEL_31:

        break;
      default:
        goto LABEL_38;
    }
  }
  else
  {
LABEL_38:
    char v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_enqueuedItemContext, 0);

  objc_storeStrong((id *)&self->_enqueuedItem, 0);
}

- (void)playbackInformationMatchesPlayingItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPMediaRemotePlaybackObserver -matchesNowPlayingItem threw an exception: %@", (uint8_t *)&v2, 0xCu);
}

@end