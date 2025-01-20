@interface MPCPlayerResponseItem
- ($04B05C73ED6AEEF31C5815932084562D)duration;
- (BOOL)_isDisliked;
- (BOOL)_isDislikedValueForSong:(id)a3;
- (BOOL)_isFavoriteEligible;
- (BOOL)_isFavoriteValueForSong:(id)a3;
- (BOOL)_isFavorited;
- (BOOL)isAutoPlay;
- (BOOL)isPlaceholder;
- (MPCPlayerAudioFormat)activeFormat;
- (MPCPlayerAudioFormat)preferredFormat;
- (MPCPlayerAudioRoute)audioRoute;
- (MPCPlayerResponse)response;
- (MPCPlayerResponseItem)initWithModelGenericObject:(id)a3 indexPath:(id)a4 enqueueingParticipant:(id)a5 response:(id)a6;
- (MPCPlayerResponseItemMusicAudio)musicAudio;
- (MPCPlayerResponseParticipant)enqueueingParticipant;
- (MPModelGenericObject)metadataObject;
- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat;
- (NSArray)alternateFormats;
- (NSArray)languageOptionGroups;
- (NSIndexPath)indexPath;
- (NSString)contentItemIdentifier;
- (NSString)description;
- (NSString)explicitBadge;
- (NSString)localizedDurationString;
- (NSString)queueItemIdentifier;
- (id)_buildLanguageOptionGroups:(id)a3 currentLanguageOptions:(id)a4;
- (id)_favoriteCommandWithMediaRemoteCommand:(unsigned int)a3;
- (id)_feedbackCommandWithMediaRemoteCommand:(unsigned int)a3;
- (id)_initWithContentItemID:(id)a3 autoPlay:(BOOL)a4;
- (id)_modelSongMetadataObject;
- (id)_stateDumpObject;
- (id)dislikeCommand;
- (id)likeCommand;
- (id)playbackRateCommand;
- (id)rateCommand;
- (id)remove;
- (id)seekCommand;
- (id)switchToAlternativeFormat:(id)a3;
- (id)wishlistCommand;
- (int64_t)activeFormatJustification;
- (int64_t)revision;
- (unint64_t)_determineSeekSupport;
- (unint64_t)preferredTiers;
@end

@implementation MPCPlayerResponseItem

- (MPModelGenericObject)metadataObject
{
  return self->_metadataObject;
}

- (MPCPlayerResponseItem)initWithModelGenericObject:(id)a3 indexPath:(id)a4 enqueueingParticipant:(id)a5 response:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v84.receiver = self;
  v84.super_class = (Class)MPCPlayerResponseItem;
  v15 = [(MPCPlayerResponseItem *)&v84 init];
  if (v15)
  {
    v16 = [v11 identifiers];
    uint64_t v17 = [v16 contentItemID];
    v18 = (void *)*((void *)v15 + 9);
    *((void *)v15 + 9) = v17;

    *((void *)v15 + 11) = 0;
    objc_storeWeak((id *)v15 + 15, v14);
    objc_storeStrong((id *)v15 + 18, a5);
    objc_storeStrong((id *)v15 + 16, a4);
    objc_storeStrong((id *)v15 + 17, a3);
    v19 = [v14 builder];
    uint64_t v20 = *((void *)v15 + 16);
    v21 = [v14 chain];
    v22 = [v19 queueItemIdentifier:0 atIndexPath:v20 chain:v21];
    v23 = v22;
    if (!v22) {
      v23 = (void *)*((void *)v15 + 9);
    }
    objc_storeStrong((id *)v15 + 10, v23);

    v24 = [v14 builder];
    uint64_t v25 = *((void *)v15 + 16);
    v26 = [v14 chain];
    v15[17] = [v24 playerItemIsPlaceholder:0 atIndexPath:v25 chain:v26];

    v27 = [v14 builder];
    uint64_t v28 = *((void *)v15 + 16);
    v29 = [v14 chain];
    if (v27)
    {
      uint64_t v79 = 0;
      memset(v78, 0, sizeof(v78));
      [v27 playerItemDuration:v78 atIndexPath:v28 chain:v29];
    }
    else
    {
      uint64_t v83 = 0;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v80 = 0u;
    }
    long long v30 = v81;
    *(_OWORD *)(v15 + 152) = v80;
    *(_OWORD *)(v15 + 168) = v30;
    *(_OWORD *)(v15 + 184) = v82;
    *((void *)v15 + 25) = v83;

    v31 = [v14 builder];
    uint64_t v32 = *((void *)v15 + 16);
    v33 = [v14 chain];
    uint64_t v34 = [v31 playerItemLocalizedDurationString:0 atIndexPath:v32 chain:v33];
    v35 = (void *)*((void *)v15 + 12);
    *((void *)v15 + 12) = v34;

    v36 = [v14 builder];
    uint64_t v37 = *((void *)v15 + 16);
    v38 = [v14 chain];
    uint64_t v39 = [v36 playerItemExplicitBadge:0 atIndexPath:v37 chain:v38];
    v40 = (void *)*((void *)v15 + 13);
    *((void *)v15 + 13) = v39;

    v41 = [v14 builder];
    uint64_t v42 = [*((id *)v15 + 16) section];
    v43 = [v14 chain];
    v15[18] = [v41 sectionIsAutoPlaySection:0 atIndex:v42 chain:v43];

    v44 = [v14 builder];
    uint64_t v45 = *((void *)v15 + 16);
    v46 = [v14 chain];
    v47 = [v44 playerItemLanguageOptionGroups:0 atIndexPath:v45 chain:v46];

    v48 = [v14 builder];
    uint64_t v49 = *((void *)v15 + 16);
    v50 = [v14 chain];
    v51 = [v48 playerItemCurrentLanguageOptions:0 atIndexPath:v49 chain:v50];

    uint64_t v52 = [v15 _buildLanguageOptionGroups:v47 currentLanguageOptions:v51];
    v53 = (void *)*((void *)v15 + 14);
    *((void *)v15 + 14) = v52;

    v54 = [v14 builder];
    v55 = [v14 chain];
    uint64_t v56 = [v54 preferredAudioFormat:0 chain:v55];
    v57 = (void *)*((void *)v15 + 3);
    *((void *)v15 + 3) = v56;

    v58 = [v14 builder];
    v59 = [v14 chain];
    uint64_t v60 = [v58 activeAudioFormat:0 chain:v59];
    v61 = (void *)*((void *)v15 + 4);
    *((void *)v15 + 4) = v60;

    v62 = [v14 builder];
    v63 = [v14 chain];
    *((void *)v15 + 6) = [v62 activeAudioFormatJustification:0 chain:v63];

    v64 = [v14 builder];
    v65 = [v14 chain];
    *((void *)v15 + 5) = [v64 audioFormatPreference:0 chain:v65];

    v66 = [v14 builder];
    v67 = [v14 chain];
    uint64_t v68 = [v66 alternateAudioFormats:0 chain:v67];
    v69 = (void *)*((void *)v15 + 7);
    *((void *)v15 + 7) = v68;

    v70 = [v14 builder];
    v71 = [v14 chain];
    uint64_t v72 = [v70 audioRoute:0 chain:v71];
    v73 = (void *)*((void *)v15 + 8);
    *((void *)v15 + 8) = v72;

    v74 = [v14 builder];
    uint64_t v75 = *((void *)v15 + 16);
    v76 = [v14 chain];
    v15[16] = [v74 playerItemIsFavoritable:0 atIndexPath:v75 chain:v76];
  }
  return (MPCPlayerResponseItem *)v15;
}

- (id)_buildLanguageOptionGroups:(id)a3 currentLanguageOptions:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    p_response = &self->_response;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v15 = [MPCPlayerLanguageOptionGroup alloc];
        id WeakRetained = objc_loadWeakRetained((id *)p_response);
        uint64_t v17 = [(MPCPlayerLanguageOptionGroup *)v15 initWithLanguageOptionGroups:v14 currentLanguageOptions:v7 response:WeakRetained];
        [v8 addObject:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v18 = (void *)[v8 copy];

  return v18;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  return [(MPCPlayerAudioFormat *)self->_activeFormat nowPlayingAudioFormat];
}

- (NSString)contentItemIdentifier
{
  return self->_contentItemIdentifier;
}

- ($04B05C73ED6AEEF31C5815932084562D)duration
{
  long long v3 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[3].var2;
  *(double *)&retstr->var7 = self[3].var4;
  return self;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (id)seekCommand
{
  unint64_t seekSupport = self->_seekSupport;
  if ((seekSupport & 1) == 0)
  {
    unint64_t seekSupport = [(MPCPlayerResponseItem *)self _determineSeekSupport];
    self->_unint64_t seekSupport = seekSupport;
  }
  if (seekSupport == 1)
  {
    v4 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v4 = [[_MPCPlayerSeekCommand alloc] initWithResponse:WeakRetained seekSupport:self->_seekSupport];
    [(_MPCPlayerItemCommand *)v4 setContentItemID:self->_contentItemIdentifier];
    if (([(_MPCPlayerSeekCommand *)v4 seekSupport] & 0x20) != 0)
    {
      id v6 = [WeakRetained builder];
      uint64_t v7 = *MEMORY[0x263F549F8];
      v8 = [WeakRetained chain];
      uint64_t v9 = [v6 playerCommandOptionValue:&unk_26CC195E0 forKey:v7 command:17 chain:v8];
      uint64_t v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (void *)v9;
      }
      else {
        uint64_t v11 = &unk_26CC195E0;
      }
      [(_MPCPlayerSeekCommand *)v4 setPreferredForwardJumpIntervals:v11];
    }
    if (([(_MPCPlayerSeekCommand *)v4 seekSupport] & 0x40) != 0)
    {
      id v12 = [WeakRetained builder];
      uint64_t v13 = *MEMORY[0x263F549F8];
      uint64_t v14 = [WeakRetained chain];
      v15 = [v12 playerCommandOptionValue:&unk_26CC195E0 forKey:v13 command:18 chain:v14];
      v16 = v15;
      uint64_t v17 = v15 ? v15 : &unk_26CC195E0;
      [(_MPCPlayerSeekCommand *)v4 setPreferredBackwardJumpIntervals:v17];

      v18 = [(_MPCPlayerSeekCommand *)v4 preferredBackwardJumpIntervals];
      v19 = [v18 firstObject];
      [v19 doubleValue];
      double v21 = v20;
      BOOL v22 = v20 < 0.0;

      [(_MPCPlayerSeekCommand *)v4 setPrefersNegativeBackwardSkipIntervals:v22];
      if (v21 >= 0.0)
      {
        long long v23 = [(_MPCPlayerSeekCommand *)v4 preferredBackwardJumpIntervals];
        long long v24 = (void *)[v23 mutableCopy];

        if ([v24 count])
        {
          unint64_t v25 = 0;
          do
          {
            uint64_t v26 = NSNumber;
            v27 = [v24 objectAtIndexedSubscript:v25];
            [v27 doubleValue];
            double v29 = v28;

            double v30 = -v29;
            if (v29 < 0.0) {
              double v30 = v29;
            }
            v31 = [v26 numberWithDouble:v30];
            [v24 replaceObjectAtIndex:v25 withObject:v31];

            ++v25;
          }
          while (v25 < [v24 count]);
        }
        [(_MPCPlayerSeekCommand *)v4 setPreferredBackwardJumpIntervals:v24];
      }
    }
  }

  return v4;
}

- (unint64_t)_determineSeekSupport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  long long v3 = [WeakRetained builder];
  v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandEnabled:0 command:8 chain:v4];

  if (v5) {
    uint64_t v6 = 7;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [WeakRetained builder];
  v8 = [WeakRetained chain];
  int v9 = [v7 playerCommandEnabled:0 command:10 chain:v8];

  if (v9) {
    v6 |= 0x18uLL;
  }
  uint64_t v10 = [WeakRetained builder];
  uint64_t v11 = [WeakRetained chain];
  int v12 = [v10 playerCommandEnabled:0 command:17 chain:v11];

  if (v12) {
    v6 |= 0x20uLL;
  }
  uint64_t v13 = [WeakRetained builder];
  uint64_t v14 = [WeakRetained chain];
  int v15 = [v13 playerCommandEnabled:0 command:18 chain:v14];

  if (v15) {
    v6 |= 0x40uLL;
  }
  v16 = [WeakRetained builder];
  uint64_t v17 = [WeakRetained chain];
  int v18 = [v16 playerCommandEnabled:0 command:24 chain:v17];

  if (v18) {
    uint64_t v19 = v6 | 0x80;
  }
  else {
    uint64_t v19 = v6;
  }
  double v20 = [WeakRetained builder];
  uint64_t v21 = *MEMORY[0x263F54AA0];
  BOOL v22 = [WeakRetained chain];
  long long v23 = [v20 playerCommandOptionValue:MEMORY[0x263EFFA80] forKey:v21 command:24 chain:v22];
  int v24 = [v23 BOOLValue];

  if (v24) {
    unint64_t v25 = v19 | 0x100;
  }
  else {
    unint64_t v25 = v19;
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueueingParticipant, 0);
  objc_storeStrong((id *)&self->_metadataObject, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_response);
  objc_storeStrong((id *)&self->_languageOptionGroups, 0);
  objc_storeStrong((id *)&self->_explicitBadge, 0);
  objc_storeStrong((id *)&self->_localizedDurationString, 0);
  objc_storeStrong((id *)&self->_queueItemIdentifier, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_alternateFormats, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);

  objc_storeStrong((id *)&self->_preferredFormat, 0);
}

- (BOOL)isAutoPlay
{
  return self->_autoPlay;
}

- (MPCPlayerResponseParticipant)enqueueingParticipant
{
  return self->_enqueueingParticipant;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (MPCPlayerResponse)response
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);

  return (MPCPlayerResponse *)WeakRetained;
}

- (NSArray)languageOptionGroups
{
  return self->_languageOptionGroups;
}

- (NSString)explicitBadge
{
  return self->_explicitBadge;
}

- (NSString)localizedDurationString
{
  return self->_localizedDurationString;
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)queueItemIdentifier
{
  return self->_queueItemIdentifier;
}

- (MPCPlayerAudioRoute)audioRoute
{
  return self->_audioRoute;
}

- (NSArray)alternateFormats
{
  return self->_alternateFormats;
}

- (int64_t)activeFormatJustification
{
  return self->_activeFormatJustification;
}

- (unint64_t)preferredTiers
{
  return self->_preferredTiers;
}

- (MPCPlayerAudioFormat)activeFormat
{
  return self->_activeFormat;
}

- (MPCPlayerAudioFormat)preferredFormat
{
  return self->_preferredFormat;
}

- (BOOL)_isDislikedValueForSong:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 hasLoadedValueForKey:*MEMORY[0x263F11838]]) {
    char v5 = [v4 isDisliked];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isDisliked
{
  id v3 = [(MPCPlayerResponseItem *)self _modelSongMetadataObject];
  v4 = [MEMORY[0x263F11F58] sharedDeviceLibraryController];
  uint64_t v5 = [v4 transientFavoriteStateForModelObject:v3];
  if (v5) {
    BOOL v6 = v5 == 3;
  }
  else {
    BOOL v6 = [(MPCPlayerResponseItem *)self _isDislikedValueForSong:v3];
  }

  return v6;
}

- (BOOL)_isFavoriteValueForSong:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 hasLoadedValueForKey:*MEMORY[0x263F11840]]) {
    char v5 = [v4 isFavorite];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isFavorited
{
  id v3 = [(MPCPlayerResponseItem *)self _modelSongMetadataObject];
  v4 = [MEMORY[0x263F11F58] sharedDeviceLibraryController];
  uint64_t v5 = [v4 transientFavoriteStateForModelObject:v3];
  if (v5) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = [(MPCPlayerResponseItem *)self _isFavoriteValueForSong:v3];
  }

  return v6;
}

- (BOOL)_isFavoriteEligible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  if (_os_feature_enabled_impl()
    && [MEMORY[0x263F11E40] authorizationStatus] == 3
    && self->_metadataObject
    && self->_isFavoritable)
  {
    v4 = [WeakRetained requestingUserSubscriptionStatus];
    __int16 v5 = [v4 capabilities];

    BOOL v6 = [(MPCPlayerResponseItem *)self _modelSongMetadataObject];
    uint64_t v7 = v6;
    if (v5 & 0x200) != 0 && ([v6 isLibraryAddEligible]) {
      char v8 = 1;
    }
    else {
      char v8 = [v7 isLibraryAdded];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_modelSongMetadataObject
{
  uint64_t v3 = [(MPModelGenericObject *)self->_metadataObject type];
  if (v3 == 5)
  {
    __int16 v5 = [(MPModelGenericObject *)self->_metadataObject playlistEntry];
    v4 = [v5 song];
  }
  else if (v3 == 1)
  {
    v4 = [(MPModelGenericObject *)self->_metadataObject song];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_feedbackCommandWithMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  BOOL v6 = [WeakRetained builder];
  uint64_t v7 = [WeakRetained chain];
  int v8 = [v6 playerCommandEnabled:0 command:v3 chain:v7];

  int v9 = [WeakRetained builder];
  uint64_t v10 = *MEMORY[0x263F54A08];
  uint64_t v11 = [WeakRetained chain];
  uint64_t v12 = [v9 playerCommandOptionValue:&unk_26CC19158 forKey:v10 command:v3 chain:v11];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  else {
    uint64_t v14 = &unk_26CC19158;
  }
  id v15 = v14;

  uint64_t v16 = [v15 integerValue];
  uint64_t v17 = 0;
  if (v8 && v16 != 2)
  {
    uint64_t v17 = [[_MPCPlayerFeedbackCommand alloc] initWithResponse:WeakRetained mediaRemoteCommand:v3];
    [(_MPCPlayerItemCommand *)v17 setContentItemID:self->_contentItemIdentifier];
    [(_MPCPlayerFeedbackCommand *)v17 setPresentationStyle:v16];
    if (v3 == 22)
    {
      long long v23 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      uint64_t v19 = [v23 localizedStringForKey:@"REMOTE_CONTROL_DISLIKE_TRACK_RADIO" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];

      double v20 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      uint64_t v21 = v20;
      BOOL v22 = @"REMOTE_CONTROL_DISLIKE_TRACK_SHORT";
    }
    else
    {
      if (v3 != 21)
      {
        uint64_t v19 = 0;
        int v24 = 0;
        goto LABEL_12;
      }
      int v18 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      uint64_t v19 = [v18 localizedStringForKey:@"REMOTE_CONTROL_LIKE_TRACK_RADIO" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];

      double v20 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      uint64_t v21 = v20;
      BOOL v22 = @"REMOTE_CONTROL_LIKE_TRACK_SHORT";
    }
    int v24 = [v20 localizedStringForKey:v22 value:&stru_26CBCA930 table:@"MediaPlaybackCore"];

LABEL_12:
    unint64_t v25 = [WeakRetained builder];
    uint64_t v26 = *MEMORY[0x263F549D0];
    v27 = [WeakRetained chain];
    double v28 = [v25 playerCommandOptionValue:v19 forKey:v26 command:v3 chain:v27];
    [(_MPCPlayerFeedbackCommand *)v17 setLocalizedTitle:v28];

    double v29 = [WeakRetained builder];
    uint64_t v30 = *MEMORY[0x263F549C8];
    v31 = [WeakRetained chain];
    uint64_t v32 = [v29 playerCommandOptionValue:v24 forKey:v30 command:v3 chain:v31];
    [(_MPCPlayerFeedbackCommand *)v17 setLocalizedShortTitle:v32];

    v33 = [WeakRetained builder];
    uint64_t v34 = *MEMORY[0x263F549B8];
    v35 = [WeakRetained chain];
    v36 = (void *)MEMORY[0x263EFFA80];
    uint64_t v37 = [v33 playerCommandOptionValue:MEMORY[0x263EFFA80] forKey:v34 command:v3 chain:v35];
    v38 = (void *)v37;
    if (v37) {
      uint64_t v39 = (void *)v37;
    }
    else {
      uint64_t v39 = v36;
    }
    id v40 = v39;

    uint64_t v41 = [v40 BOOLValue];
    [(_MPCPlayerFeedbackCommand *)v17 setValue:v41];
  }

  return v17;
}

- (id)switchToAlternativeFormat:(id)a3
{
  return 0;
}

- (MPCPlayerResponseItemMusicAudio)musicAudio
{
  if (self->_activeFormat) {
    v2 = self;
  }
  else {
    v2 = 0;
  }

  return (MPCPlayerResponseItemMusicAudio *)v2;
}

- (id)_stateDumpObject
{
  v46[11] = *MEMORY[0x263EF8340];
  uint64_t v41 = (void *)MEMORY[0x263EFF9A0];
  contentItemIdentifier = (__CFString *)self->_contentItemIdentifier;
  if (!contentItemIdentifier) {
    contentItemIdentifier = @"@";
  }
  v44[0] = contentItemIdentifier;
  v43[0] = @"contentItemID";
  v43[1] = @"revision";
  uint64_t v42 = [NSNumber numberWithInteger:self->_revision];
  v44[1] = v42;
  v43[2] = @"duration";
  double snapshotTime = self->_duration.snapshotTime;
  double startTime = self->_duration.startTime;
  double endTime = self->_duration.endTime;
  double duration = self->_duration.duration;
  double elapsedDuration = self->_duration.elapsedDuration;
  float rate = self->_duration.rate;
  float defaultRate = self->_duration.defaultRate;
  BOOL isLiveContent = self->_duration.isLiveContent;
  BOOL isLoading = self->_duration.isLoading;
  BOOL isInTransition = self->_duration.isInTransition;
  v45[0] = @"snapshotTime";
  id v40 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:snapshotTime];
  v46[0] = v40;
  v45[1] = @"startTime";
  uint64_t v39 = [NSNumber numberWithDouble:startTime];
  v46[1] = v39;
  v45[2] = @"endTime";
  uint64_t v14 = [NSNumber numberWithDouble:endTime];
  v46[2] = v14;
  v45[3] = @"duration";
  id v15 = [NSNumber numberWithDouble:duration];
  v46[3] = v15;
  v45[4] = @"elapsedDuration";
  uint64_t v16 = [NSNumber numberWithDouble:elapsedDuration];
  v46[4] = v16;
  v45[5] = @"rate";
  *(float *)&double v17 = rate;
  int v18 = [NSNumber numberWithFloat:v17];
  v46[5] = v18;
  v45[6] = @"defaultRate";
  *(float *)&double v19 = defaultRate;
  uint64_t v20 = [NSNumber numberWithFloat:v19];
  uint64_t v21 = (void *)v20;
  if (isLiveContent) {
    BOOL v22 = @"YES";
  }
  else {
    BOOL v22 = @"NO";
  }
  v46[6] = v20;
  v46[7] = v22;
  v45[7] = @"isLiveContent";
  v45[8] = @"isLoading";
  if (isLoading) {
    long long v23 = @"YES";
  }
  else {
    long long v23 = @"NO";
  }
  v46[8] = v23;
  v45[9] = @"isInTransition";
  int v24 = [NSNumber numberWithBool:isInTransition];
  v46[9] = v24;
  v45[10] = @"_calculatedElapsedTime";
  unint64_t v25 = NSNumber;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v27 = elapsedDuration + (v26 - snapshotTime) * rate;
  if (v27 >= duration) {
    double v27 = duration;
  }
  double v28 = objc_msgSend(v25, "numberWithDouble:", fmax(v27, 0.0));
  v46[10] = v28;
  double v29 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:11];

  metadataObject = self->_metadataObject;
  if (!metadataObject) {
    metadataObject = (MPModelGenericObject *)@"@";
  }
  v44[2] = v29;
  v44[3] = metadataObject;
  v43[3] = @"metadataObject";
  v43[4] = @"isPlaceholder";
  uint64_t v31 = [NSNumber numberWithBool:self->_placeholder];
  uint64_t v32 = (void *)v31;
  indexPath = self->_indexPath;
  if (!indexPath) {
    indexPath = (NSIndexPath *)@"@";
  }
  v44[4] = v31;
  v44[5] = indexPath;
  v43[5] = @"indexPath";
  v43[6] = @"explicitBadge";
  explicitBadge = (__CFString *)self->_explicitBadge;
  if (!explicitBadge) {
    explicitBadge = @"@";
  }
  v44[6] = explicitBadge;
  v35 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:7];
  v36 = [v41 dictionaryWithDictionary:v35];

  localizedDurationString = self->_localizedDurationString;
  if (localizedDurationString) {
    [v36 setObject:localizedDurationString forKeyedSubscript:@"localizedDurationString"];
  }
  if ([(NSArray *)self->_languageOptionGroups count]) {
    [v36 setObject:self->_languageOptionGroups forKeyedSubscript:@"languageOptionGroups"];
  }

  return v36;
}

- (id)remove
{
  v19[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v4 = [WeakRetained builder];
  __int16 v5 = [WeakRetained chain];
  int v6 = [v4 playerCommandEnabled:0 command:129 chain:v5];

  if (v6)
  {
    uint64_t v7 = [WeakRetained builder];
    indexPath = self->_indexPath;
    int v9 = [WeakRetained chain];
    LOBYTE(indexPath) = [v7 playerItemEditingStyleFlags:0 atIndexPath:indexPath chain:v9];

    uint64_t v10 = 0;
    if ((indexPath & 2) != 0)
    {
      uint64_t v11 = self->_contentItemIdentifier;
      if ([(NSString *)v11 length])
      {
        uint64_t v18 = *MEMORY[0x263F54C98];
        v19[0] = v11;
        uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
        uint64_t v13 = [MPCPlayerCommandRequest alloc];
        uint64_t v14 = [WeakRetained controller];
        id v15 = [WeakRetained request];
        uint64_t v16 = [v15 label];
        uint64_t v10 = [(MPCPlayerCommandRequest *)v13 initWithMediaRemoteCommand:129 options:v12 controller:v14 label:v16];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)rateCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v4 = [WeakRetained builder];
  __int16 v5 = [WeakRetained chain];
  int v6 = [v4 playerCommandEnabled:0 command:20 chain:v5];

  if (v6)
  {
    uint64_t v7 = [WeakRetained builder];
    uint64_t v8 = *MEMORY[0x263F549E0];
    int v9 = [WeakRetained chain];
    uint64_t v10 = [v7 playerCommandOptionValue:&unk_26CC19718 forKey:v8 command:20 chain:v9];
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = &unk_26CC19718;
    }
    id v13 = v12;

    uint64_t v14 = [WeakRetained builder];
    uint64_t v15 = *MEMORY[0x263F549D8];
    uint64_t v16 = [WeakRetained chain];
    uint64_t v17 = [v14 playerCommandOptionValue:&unk_26CC19708 forKey:v15 command:20 chain:v16];
    uint64_t v18 = (void *)v17;
    if (v17) {
      double v19 = (void *)v17;
    }
    else {
      double v19 = &unk_26CC19708;
    }
    id v20 = v19;

    uint64_t v21 = [(_MPCPlayerCommand *)[_MPCPlayerRateCommand alloc] initWithResponse:WeakRetained];
    [(_MPCPlayerItemCommand *)v21 setContentItemID:self->_contentItemIdentifier];
    [v13 floatValue];
    int v23 = v22;

    LODWORD(v24) = v23;
    [(_MPCPlayerRateCommand *)v21 setMinimumValue:v24];
    [v20 floatValue];
    int v26 = v25;

    LODWORD(v27) = v26;
    [(_MPCPlayerRateCommand *)v21 setMaximumValue:v27];
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)_favoriteCommandWithMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (![(MPCPlayerResponseItem *)self _isFavoriteEligible]
    || (LODWORD(v5) = [(MPCPlayerResponseItem *)self _isDisliked],
        BOOL v6 = [(MPCPlayerResponseItem *)self _isFavorited],
        v3 == 22)
    && v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    BOOL v8 = v3 == 21 && v6;
    BOOL v9 = v3 == 22;
    if (v3 == 22) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = v8;
    }
    uint64_t v10 = [_MPCPlayerFeedbackCommand alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    uint64_t v7 = [(_MPCPlayerFeedbackCommand *)v10 initWithResponse:WeakRetained mediaRemoteCommand:v3];

    uint64_t v12 = [(MPCPlayerResponseItem *)self _modelSongMetadataObject];
    [(_MPCPlayerFeedbackCommand *)v7 setFavoritableModelObject:v12];

    [(_MPCPlayerFeedbackCommand *)v7 setIsDislikingFavoritableModelObject:v9];
    [(_MPCPlayerFeedbackCommand *)v7 setValue:v5];
    [(_MPCPlayerFeedbackCommand *)v7 setPresentationStyle:1];
  }

  return v7;
}

- (id)wishlistCommand
{
  return [(MPCPlayerResponseItem *)self _feedbackCommandWithMediaRemoteCommand:23];
}

- (id)dislikeCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v4 = [WeakRetained controller];
  uint64_t v5 = [v4 resolvedPlayerPath];
  int v6 = [v5 isSystemMusicPath];

  if (v6) {
    [(MPCPlayerResponseItem *)self _favoriteCommandWithMediaRemoteCommand:22];
  }
  else {
  uint64_t v7 = [(MPCPlayerResponseItem *)self _feedbackCommandWithMediaRemoteCommand:22];
  }

  return v7;
}

- (id)likeCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v4 = [WeakRetained controller];
  uint64_t v5 = [v4 resolvedPlayerPath];
  int v6 = [v5 isSystemMusicPath];

  if (v6) {
    [(MPCPlayerResponseItem *)self _favoriteCommandWithMediaRemoteCommand:21];
  }
  else {
  uint64_t v7 = [(MPCPlayerResponseItem *)self _feedbackCommandWithMediaRemoteCommand:21];
  }

  return v7;
}

- (id)playbackRateCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v4 = [WeakRetained builder];
  uint64_t v5 = [WeakRetained chain];
  uint64_t v6 = [v4 playerState:0 chain:v5];

  uint64_t v7 = [WeakRetained builder];
  uint64_t v8 = *MEMORY[0x263F54A00];
  BOOL v9 = [WeakRetained chain];
  uint64_t v10 = [v7 playerCommandOptionValue:0 forKey:v8 command:19 chain:v9];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v6 == 2;
  }
  if (!v11)
  {
    uint64_t v12 = [WeakRetained request];
    int v13 = [v12 disablePlaybackRateValidation];

    if (!v13)
    {
      uint64_t v10 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v14 = [WeakRetained request];
  if (![v14 disablePlaybackRateValidation])
  {
    uint64_t v15 = [WeakRetained builder];
    uint64_t v16 = [WeakRetained chain];
    int v17 = [v15 playerCommandEnabled:0 command:19 chain:v16];

    if (v17) {
      goto LABEL_9;
    }
LABEL_16:
    uint64_t v18 = 0;
    goto LABEL_20;
  }

LABEL_9:
  uint64_t v18 = [(_MPCPlayerCommand *)[_MPCPlayerPlaybackRateCommand alloc] initWithResponse:WeakRetained];
  [(_MPCPlayerItemCommand *)v18 setContentItemID:self->_contentItemIdentifier];
  double v19 = [WeakRetained builder];
  uint64_t v20 = *MEMORY[0x263F54A70];
  uint64_t v21 = [WeakRetained chain];
  uint64_t v22 = [v19 playerCommandOptionValue:&unk_26CC195F8 forKey:v20 command:19 chain:v21];
  int v23 = (void *)v22;
  if (v22) {
    double v24 = (void *)v22;
  }
  else {
    double v24 = &unk_26CC195F8;
  }
  [(_MPCPlayerPlaybackRateCommand *)v18 setSupportedPlaybackRates:v24];

  if (!v10)
  {
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    int v25 = [WeakRetained builder];
    indexPath = self->_indexPath;
    double v27 = [WeakRetained chain];
    if (v25)
    {
      uint64_t v31 = 0;
      memset(v30, 0, sizeof(v30));
      [v25 playerItemDuration:v30 atIndexPath:indexPath chain:v27];
    }
    else
    {
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
    }

    LODWORD(v28) = DWORD2(v34);
    uint64_t v10 = [NSNumber numberWithFloat:v28];
  }
  [v10 floatValue];
  -[_MPCPlayerPlaybackRateCommand setPreferredPlaybackRate:](v18, "setPreferredPlaybackRate:");
LABEL_20:

  return v18;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p %@ autoPlay=%d>", objc_opt_class(), self, self->_contentItemIdentifier, self->_autoPlay];
}

- (id)_initWithContentItemID:(id)a3 autoPlay:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCPlayerResponseItem;
  uint64_t v7 = [(MPCPlayerResponseItem *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    contentItemIdentifier = v7->_contentItemIdentifier;
    v7->_contentItemIdentifier = (NSString *)v8;

    v7->_autoPlay = a4;
  }

  return v7;
}

@end