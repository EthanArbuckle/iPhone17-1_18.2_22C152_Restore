@interface CPUINowPlayingSnapshot
+ (NSArray)knownJumpIntervals;
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot;
- (BOOL)isRadioPlayback;
- (BOOL)shouldEnableBackButton;
- (BOOL)shouldEnableNextButton;
- (BOOL)showsStopButton;
- (CPUINowPlayingSnapshot)initWithResponse:(id)a3;
- (MPArtworkCatalog)artworkCatalog;
- (MPCPlayerResponse)response;
- (MPCPlayerResponseItem)responseItem;
- (MPCPlayerResponseTracklist)tracklist;
- (MPModelSong)nextSong;
- (MPModelSong)previousSong;
- (MPModelSong)song;
- (NSNumber)jumpBackInterval;
- (NSNumber)jumpForwardInterval;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleIdentifier;
- (NSString)title;
- (id)_getSongIsNext:(BOOL)a3;
- (id)commandWithType:(unint64_t)a3;
- (int64_t)state;
@end

@implementation CPUINowPlayingSnapshot

- (MPModelSong)nextSong
{
  return (MPModelSong *)[(CPUINowPlayingSnapshot *)self _getSongIsNext:1];
}

- (MPModelSong)previousSong
{
  return (MPModelSong *)[(CPUINowPlayingSnapshot *)self _getSongIsNext:0];
}

- (id)_getSongIsNext:(BOOL)a3
{
  int v3 = a3;
  v5 = [(MPCPlayerResponseTracklist *)self->_tracklist items];
  uint64_t v6 = [v5 totalItemCount];

  v7 = [(MPCPlayerResponseTracklist *)self->_tracklist playingItem];
  v8 = [(MPCPlayerResponseTracklist *)self->_tracklist items];
  v9 = [v8 firstItem];
  int v10 = [v7 isEqual:v9];

  if (v6 == 3 || v6 == 2 && v10 == v3)
  {
    v12 = [(MPCPlayerResponseTracklist *)self->_tracklist items];
    v13 = v12;
    if (v3) {
      [v12 lastItem];
    }
    else {
    v14 = [v12 firstItem];
    }

    objc_opt_class();
    v15 = [v14 metadataObject];
    id v16 = [v15 anyObject];
    if (objc_opt_isKindOfClass()) {
      id v11 = v16;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (CPUINowPlayingSnapshot)initWithResponse:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CPUINowPlayingSnapshot;
  uint64_t v6 = [(CPUINowPlayingSnapshot *)&v55 init];
  if (v6)
  {
    v7 = [v5 playerPath];
    uint64_t v8 = [v7 representedBundleID];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_response, a3);
    int v10 = [v5 tracklist];
    id v11 = [v10 playingItemIndexPath];

    v12 = CarPlayUIGeneralLogging();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = [(CPUINowPlayingSnapshot *)v6 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_227AC2000, v12, OS_LOG_TYPE_DEFAULT, "Received MPRequestResponseController response for %@ with playing index path %@", buf, 0x16u);
      }
      v15 = [v5 tracklist];
      id v16 = [v15 items];
      v12 = [v16 itemAtIndexPath:v11];

      objc_storeStrong((id *)&v6->_responseItem, v12);
      uint64_t v62 = 0;
      long long v61 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v12) {
        [v12 duration];
      }
      v17 = [v12 metadataObject];
      v18 = [v17 anyObject];

      v19 = CarPlayUIGeneralLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v56 = 138412546;
        id v57 = v5;
        __int16 v58 = 2112;
        v59 = v12;
        _os_log_impl(&dword_227AC2000, v19, OS_LOG_TYPE_DEFAULT, "Received item metadata: %@ for %@", v56, 0x16u);
      }

      v20 = [v5 tracklist];
      v21 = [v20 items];
      v22 = objc_msgSend(v21, "sectionAtIndex:", objc_msgSend(v11, "section"));

      if (v22)
      {
        v23 = [v22 metadataObject];
        v6->_isRadioPlayback = [v23 type] == 13;
      }
      else
      {
        v6->_isRadioPlayback = 0;
      }
      uint64_t v24 = [v18 title];
      title = v6->_title;
      v6->_title = (NSString *)v24;

      if ([v18 shouldShowComposer]) {
        [v18 composer];
      }
      else {
      v26 = [v18 artist];
      }
      uint64_t v27 = [v26 name];
      artist = v6->_artist;
      v6->_artist = (NSString *)v27;

      if (v6->_isRadioPlayback)
      {
        v29 = [v22 metadataObject];
        v30 = [v29 radioStation];
        v31 = [v30 attributionLabel];

        if (v31)
        {
          v32 = v31;
          v33 = v6->_artist;
          v6->_artist = v32;
        }
        else
        {
          v33 = (NSString *)objc_alloc_init(MEMORY[0x263EFF980]);
          v34 = [v18 artist];
          v35 = [v34 name];

          if ([v35 length]) {
            [(NSString *)v33 addObject:v35];
          }
          v54 = v35;
          v36 = [v18 composer];
          v37 = [v36 name];

          if ([v18 shouldShowComposer] && objc_msgSend(v37, "length"))
          {
            v38 = NSString;
            v53 = CPUILocalizedStringForKey(@"COMPOSED_BY_TITLE_%@");
            v39 = objc_msgSend(v38, "localizedStringWithFormat:", v53, v37);

            [(NSString *)v33 addObject:v39];
          }
          uint64_t v40 = [(NSString *)v33 count];
          if (v40)
          {
            uint64_t v40 = [(NSString *)v33 componentsJoinedByString:@" — "];
          }
          v41 = v6->_artist;
          v6->_artist = (NSString *)v40;
        }
      }
      v42 = [v18 album];
      uint64_t v43 = [v42 title];
      album = v6->_album;
      v6->_album = (NSString *)v43;

      uint64_t v45 = [v18 artworkCatalog];
      artworkCatalog = v6->_artworkCatalog;
      v6->_artworkCatalog = (MPArtworkCatalog *)v45;

      long long v47 = *(_OWORD *)&buf[16];
      *(_OWORD *)&v6->_durationSnapshot.snapshotTime = *(_OWORD *)buf;
      *(_OWORD *)&v6->_durationSnapshot.endTime = v47;
      *(_OWORD *)&v6->_durationSnapshot.elapsedDuration = v61;
      *(void *)&v6->_durationSnapshot.isLiveContent = v62;
      v6->_state = [v5 state];
      uint64_t v48 = [v5 tracklist];
      tracklist = v6->_tracklist;
      v6->_tracklist = (MPCPlayerResponseTracklist *)v48;

      song = v6->_song;
      v6->_song = (MPModelSong *)v18;
      id v51 = v18;
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227AC2000, v12, OS_LOG_TYPE_DEFAULT, "Received MPRequestResponseController response without any available now playing item.", buf, 2u);
    }
  }
  return v6;
}

+ (NSArray)knownJumpIntervals
{
  if (knownJumpIntervals_onceToken != -1) {
    dispatch_once(&knownJumpIntervals_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)knownJumpIntervals___intervals;
  return (NSArray *)v2;
}

void __44__CPUINowPlayingSnapshot_knownJumpIntervals__block_invoke()
{
  v0 = (void *)knownJumpIntervals___intervals;
  knownJumpIntervals___intervals = (uint64_t)&unk_26DC1F208;
}

- (NSNumber)jumpBackInterval
{
  v2 = [(CPUINowPlayingSnapshot *)self responseItem];
  int v3 = [v2 seekCommand];
  v4 = [v3 preferredBackwardJumpIntervals];
  id v5 = [v4 firstObject];

  return (NSNumber *)v5;
}

- (NSNumber)jumpForwardInterval
{
  v2 = [(CPUINowPlayingSnapshot *)self responseItem];
  int v3 = [v2 seekCommand];
  v4 = [v3 preferredForwardJumpIntervals];
  id v5 = [v4 firstObject];

  return (NSNumber *)v5;
}

- (BOOL)shouldEnableBackButton
{
  int v3 = [(CPUINowPlayingSnapshot *)self jumpBackInterval];

  if (v3) {
    return 1;
  }
  id v5 = [(CPUINowPlayingSnapshot *)self tracklist];
  uint64_t v6 = [v5 changeItemCommand];
  v7 = [v6 previousItem];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(CPUINowPlayingSnapshot *)self song];
  BOOL v4 = v8 != 0;

  return v4;
}

- (BOOL)shouldEnableNextButton
{
  int v3 = [(CPUINowPlayingSnapshot *)self jumpForwardInterval];

  if (v3) {
    return 1;
  }
  id v5 = [(CPUINowPlayingSnapshot *)self tracklist];
  uint64_t v6 = [v5 changeItemCommand];
  v7 = [v6 nextItem];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(CPUINowPlayingSnapshot *)self song];
  BOOL v4 = v8 != 0;

  return v4;
}

- (BOOL)showsStopButton
{
  int v3 = [(CPUINowPlayingSnapshot *)self response];
  BOOL v4 = [v3 stop];
  BOOL v5 = v4 != 0;

  if (v4)
  {
    [(CPUINowPlayingSnapshot *)self durationSnapshot];
    if (!v9) {
      return 0;
    }
    uint64_t v6 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Playing livestreaming content.";
LABEL_7:
      _os_log_impl(&dword_227AC2000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Stop command is disabled.";
      goto LABEL_7;
    }
  }

  return v5;
}

- (id)commandWithType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self response];
      uint64_t v4 = [v3 stop];
      goto LABEL_11;
    case 1uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self response];
      uint64_t v4 = [v3 play];
      goto LABEL_11;
    case 2uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self response];
      uint64_t v4 = [v3 pause];
      goto LABEL_11;
    case 3uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self tracklist];
      uint64_t v6 = [v3 changeItemCommand];
      uint64_t v7 = [v6 nextItem];
      goto LABEL_16;
    case 4uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self tracklist];
      uint64_t v6 = [v3 changeItemCommand];
      uint64_t v7 = [v6 previousItem];
      goto LABEL_16;
    case 5uLL:
      uint64_t v8 = [(CPUINowPlayingSnapshot *)self responseItem];
      int v3 = [v8 seekCommand];

      char v9 = [v3 preferredForwardJumpIntervals];
      goto LABEL_10;
    case 6uLL:
      int v10 = [(CPUINowPlayingSnapshot *)self responseItem];
      int v3 = [v10 seekCommand];

      char v9 = [v3 preferredBackwardJumpIntervals];
LABEL_10:
      id v11 = v9;
      v12 = [v9 firstObject];
      [v12 doubleValue];
      double v14 = v13;

      uint64_t v4 = [v3 jumpByInterval:v14];
LABEL_11:
      BOOL v5 = (void *)v4;
      goto LABEL_17;
    case 7uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self responseItem];
      v15 = [v3 seekCommand];
      uint64_t v6 = v15;
      uint64_t v16 = 1;
      goto LABEL_15;
    case 8uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self responseItem];
      v15 = [v3 seekCommand];
      uint64_t v6 = v15;
      uint64_t v16 = -1;
LABEL_15:
      uint64_t v7 = [v15 beginSeekWithDirection:v16];
      goto LABEL_16;
    case 9uLL:
      int v3 = [(CPUINowPlayingSnapshot *)self responseItem];
      uint64_t v6 = [v3 seekCommand];
      uint64_t v7 = [v6 endSeek];
LABEL_16:
      BOOL v5 = (void *)v7;

LABEL_17:
      break;
    default:
      BOOL v5 = 0;
      break;
  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)album
{
  return self->_album;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  long long v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[2].var2;
  *(double *)&retstr->var7 = self[2].var4;
  return self;
}

- (int64_t)state
{
  return self->_state;
}

- (MPCPlayerResponseTracklist)tracklist
{
  return self->_tracklist;
}

- (MPModelSong)song
{
  return self->_song;
}

- (BOOL)isRadioPlayback
{
  return self->_isRadioPlayback;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MPCPlayerResponseItem)responseItem
{
  return self->_responseItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end