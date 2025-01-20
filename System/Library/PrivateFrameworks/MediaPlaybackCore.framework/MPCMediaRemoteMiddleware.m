@interface MPCMediaRemoteMiddleware
- ($04B05C73ED6AEEF31C5815932084562D)playerItemDuration:(SEL)a3 atIndexPath:(id *)a4 chain:(id)a5;
- (BOOL)playerCommandEnabled:(BOOL)a3 command:(unsigned int)a4 chain:(id)a5;
- (BOOL)playerCommandSupported:(BOOL)a3 command:(unsigned int)a4 chain:(id)a5;
- (BOOL)playerIsSharedListeningSession:(BOOL)a3 chain:(id)a4;
- (BOOL)playerItemIsFavoritable:(BOOL)a3 atIndexPath:(id)a4 chain:(id)a5;
- (BOOL)playerItemIsPlaceholder:(BOOL)a3 atIndexPath:(id)a4 chain:(id)a5;
- (BOOL)playerItemShouldDisableJumpToItem:(BOOL)a3 atIndexPath:(id)a4 boundsCheck:(BOOL)a5 chain:(id)a6;
- (BOOL)playerVocalsControlActive:(BOOL)a3 chain:(id)a4;
- (BOOL)playerVocalsControlContinuous:(BOOL)a3 chain:(id)a4;
- (BOOL)sectionIsAutoPlaySection:(BOOL)a3 atIndex:(int64_t)a4 chain:(id)a5;
- (BOOL)skippedMetadata;
- (MPCFuture)controllerFuture;
- (MPCMediaRemoteController)controller;
- (MPCSupportedCommands)supportedCommands;
- (MPNowPlayingContentItem)lastSectionContentItem;
- (MPSectionedCollection)queueContentItems;
- (MPSectionedCollection)queueModelObjects;
- (NSArray)invalidationObservers;
- (NSDictionary)queueParticipants;
- (NSDictionary)queueProperties;
- (NSIndexPath)playingIndexPath;
- (NSString)queueIdentifier;
- (double)playerSleepTimerFireDate:(double)a3 chain:(id)a4;
- (double)playerSleepTimerTime:(double)a3 chain:(id)a4;
- (float)_playbackRateForContentItem:(id)a3;
- (float)playerMaxVocalsLevel:(float)a3 chain:(id)a4;
- (float)playerMinVocalsLevel:(float)a3 chain:(id)a4;
- (float)playerVocalsLevel:(float)a3 chain:(id)a4;
- (id)_stateDumpObject;
- (id)_supportedCommands:(unsigned int)a3 infoValueForKey:(id)a4;
- (id)activeAudioFormat:(id)a3 chain:(id)a4;
- (id)alternateAudioFormats:(id)a3 chain:(id)a4;
- (id)audioRoute:(id)a3 chain:(id)a4;
- (id)controller:(id)a3 chain:(id)a4;
- (id)lastSectionModelObject:(id)a3 propertySet:(id)a4 chain:(id)a5;
- (id)operationsForPlayerRequest:(id)a3;
- (id)operationsForRequest:(id)a3;
- (id)participant:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)playerCommandOptionValue:(id)a3 forKey:(id)a4 command:(unsigned int)a5 chain:(id)a6;
- (id)playerItemContentID:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)playerItemCurrentLanguageOptions:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)playerItemExplicitBadge:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)playerItemLanguageOptionGroups:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)playerItemLocalizedDurationString:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6;
- (id)playerPlayingItemIndexPath:(id)a3 chain:(id)a4;
- (id)preferredAudioFormat:(id)a3 chain:(id)a4;
- (id)queueItemIdentifier:(id)a3 atIndexPath:(id)a4 chain:(id)a5;
- (id)tracklistProperties:(id)a3 chain:(id)a4;
- (id)tracklistUniqueIdentifier:(id)a3 chain:(id)a4;
- (int64_t)activeAudioFormatJustification:(int64_t)a3 chain:(id)a4;
- (int64_t)playerCommandDisabledReason:(int64_t)a3 command:(unsigned int)a4 chain:(id)a5;
- (int64_t)playerExplicitContentState:(int64_t)a3 chain:(id)a4;
- (int64_t)playerGlobalItemCount:(int64_t)a3 chain:(id)a4;
- (int64_t)playerItemEditingStyleFlags:(int64_t)a3 atIndexPath:(id)a4 chain:(id)a5;
- (int64_t)playerLastChangeDirection:(int64_t)a3 chain:(id)a4;
- (int64_t)playerPlayingItemGlobalIndex:(int64_t)a3 chain:(id)a4;
- (int64_t)playerQueueEndAction:(int64_t)a3 chain:(id)a4;
- (int64_t)playerRepeatType:(int64_t)a3 chain:(id)a4;
- (int64_t)playerShuffleType:(int64_t)a3 chain:(id)a4;
- (int64_t)playerSleepTimerStopMode:(int64_t)a3 chain:(id)a4;
- (int64_t)playerState;
- (int64_t)playerState:(int64_t)a3 chain:(id)a4;
- (int64_t)playerUpNextItemCount:(int64_t)a3 chain:(id)a4;
- (unint64_t)audioFormatPreference:(unint64_t)a3 chain:(id)a4;
- (unint64_t)playerNumberOfItems:(unint64_t)a3 inSection:(unint64_t)a4 chain:(id)a5;
- (unint64_t)playerNumberOfSections:(unint64_t)a3 chain:(id)a4;
- (void)setController:(id)a3;
- (void)setControllerFuture:(id)a3;
- (void)setInvalidationObservers:(id)a3;
- (void)setLastSectionContentItem:(id)a3;
- (void)setPlayerState:(int64_t)a3;
- (void)setPlayingIndexPath:(id)a3;
- (void)setQueueContentItems:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setQueueModelObjects:(id)a3;
- (void)setQueueParticipants:(id)a3;
- (void)setQueueProperties:(id)a3;
- (void)setSupportedCommands:(id)a3;
@end

@implementation MPCMediaRemoteMiddleware

- (void)setInvalidationObservers:(id)a3
{
}

- (int64_t)playerShuffleType:(int64_t)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54A30];
  id v7 = a4;
  v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:26 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 unsignedIntegerValue];
    a3 = MPShuffleTypeFromMediaRemoteShuffleMode();
  }
  v9 = [v7 nextObject];
  int64_t v10 = [v9 playerShuffleType:a3 chain:v7];

  return v10;
}

- (id)playerCommandOptionValue:(id)a3 forKey:(id)a4 command:(unsigned int)a5 chain:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  v13 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:v7 infoValueForKey:v12];
  v14 = v13;
  id v15 = v10;
  if (v13)
  {
    id v15 = v13;
  }
  v16 = [v11 nextObject];
  v17 = [v16 playerCommandOptionValue:v15 forKey:v12 command:v7 chain:v11];

  return v17;
}

- (id)_supportedCommands:(unsigned int)a3 infoValueForKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(MPCMediaRemoteMiddleware *)self supportedCommands];
  v8 = (void *)[v7 commandInfoForCommand:v4];

  if (v8) {
    v8 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
  }

  return v8;
}

- (BOOL)playerCommandEnabled:(BOOL)a3 command:(unsigned int)a4 chain:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(MPCMediaRemoteMiddleware *)self supportedCommands];
  uint64_t v10 = [v9 commandInfoForCommand:v5];

  if (v10) {
    BOOL v6 = MRMediaRemoteCommandInfoGetEnabled() != 0;
  }
  id v11 = [v8 nextObject];
  char v12 = [v11 playerCommandEnabled:v6 command:v5 chain:v8];

  return v12;
}

- (MPCSupportedCommands)supportedCommands
{
  return self->_supportedCommands;
}

- (id)controller:(id)a3 chain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self controller];

  v9 = v6;
  if (v8)
  {
    v9 = [(MPCMediaRemoteMiddleware *)self controller];
  }
  uint64_t v10 = [v7 nextObject];
  id v11 = [v10 controller:v9 chain:v7];

  return v11;
}

- (id)tracklistUniqueIdentifier:(id)a3 chain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self queueIdentifier];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:133 infoValueForKey:*MEMORY[0x263F549E8]];
    char v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v6;
    }
    id v10 = v13;
  }
  v14 = [v7 nextObject];
  id v15 = [v14 tracklistUniqueIdentifier:v10 chain:v7];

  return v15;
}

- (int64_t)playerUpNextItemCount:(int64_t)a3 chain:(id)a4
{
  id v5 = a4;
  id v6 = [(MPCMediaRemoteMiddleware *)self supportedCommands];
  uint64_t IntegerValueForKey = [v6 commandInfoForCommand:122];

  if (IntegerValueForKey) {
    uint64_t IntegerValueForKey = (int)MRMediaRemoteCommandInfoGetIntegerValueForKey();
  }
  id v8 = [v5 nextObject];
  int64_t v9 = [v8 playerUpNextItemCount:IntegerValueForKey chain:v5];

  return v9;
}

- (int64_t)playerState:(int64_t)a3 chain:(id)a4
{
  id v5 = a4;
  id v6 = [v5 nextObject];
  int64_t v7 = objc_msgSend(v6, "playerState:chain:", -[MPCMediaRemoteMiddleware playerState](self, "playerState"), v5);

  return v7;
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (int64_t)playerRepeatType:(int64_t)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54A28];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:25 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 unsignedIntegerValue];
    a3 = MPRepeatTypeFromMediaRemoteRepeatMode();
  }
  int64_t v9 = [v7 nextObject];
  int64_t v10 = [v9 playerRepeatType:a3 chain:v7];

  return v10;
}

- (int64_t)playerPlayingItemGlobalIndex:(int64_t)a3 chain:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];

  if (v7)
  {
    id v8 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
    int64_t v9 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];
    int64_t v10 = [v8 itemAtIndexPath:v9];

    uint64_t v11 = [v10 auxiliaryNowPlayingInfo];
    char v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F54BE8]];
    a3 = [v12 integerValue];
  }
  v13 = [v6 nextObject];
  int64_t v14 = [v13 playerPlayingItemGlobalIndex:a3 chain:v6];

  return v14;
}

- (BOOL)playerIsSharedListeningSession:(BOOL)a3 chain:(id)a4
{
  id v5 = a4;
  id v6 = [(MPCMediaRemoteMiddleware *)self supportedCommands];
  uint64_t v7 = [v6 commandInfoForCommand:139];

  uint64_t v8 = v7 != 0;
  int64_t v9 = [v5 nextObject];
  LOBYTE(v8) = [v9 playerIsSharedListeningSession:v8 chain:v5];

  return v8;
}

- (int64_t)playerGlobalItemCount:(int64_t)a3 chain:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MPCMediaRemoteMiddleware *)self queueProperties];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"totalItemCount"];

  if (v8)
  {
    a3 = [v8 integerValue];
  }
  else
  {
    int64_t v9 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];

    if (v9)
    {
      int64_t v10 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
      uint64_t v11 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];
      char v12 = [v10 itemAtIndexPath:v11];

      v13 = [v12 auxiliaryNowPlayingInfo];
      int64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F54C30]];
      a3 = [v14 integerValue];
    }
  }
  id v15 = [v6 nextObject];
  int64_t v16 = [v15 playerGlobalItemCount:a3 chain:v6];

  return v16;
}

- (id)tracklistProperties:(id)a3 chain:(id)a4
{
  id v5 = a4;
  id v6 = [(MPCMediaRemoteMiddleware *)self queueProperties];
  uint64_t v7 = [v5 nextObject];
  uint64_t v8 = [v7 tracklistProperties:v6 chain:v5];

  return v8;
}

- (NSDictionary)queueProperties
{
  return self->_queueProperties;
}

- (int64_t)playerExplicitContentState:(int64_t)a3 chain:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];

  if (v7)
  {
    uint64_t v8 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
    int64_t v9 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];
    int64_t v10 = [v8 itemAtIndexPath:v9];

    uint64_t v11 = [v10 userInfo];
    char v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F11B98]];
    a3 = [v12 integerValue];
  }
  v13 = [v6 nextObject];
  int64_t v14 = [v13 playerExplicitContentState:a3 chain:v6];

  return v14;
}

- (int64_t)playerLastChangeDirection:(int64_t)a3 chain:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];

  if (v7)
  {
    uint64_t v8 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
    int64_t v9 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];
    int64_t v10 = [v8 itemAtIndexPath:v9];

    uint64_t v11 = [v10 userInfo];
    char v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F11BB8]];

    a3 = [v12 integerValue];
  }
  v13 = [v6 nextObject];
  int64_t v14 = [v13 playerLastChangeDirection:a3 chain:v6];

  return v14;
}

- (NSIndexPath)playingIndexPath
{
  return self->_playingIndexPath;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (BOOL)sectionIsAutoPlaySection:(BOOL)a3 atIndex:(int64_t)a4 chain:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  int64_t v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  int64_t v10 = [v9 sectionAtIndex:a4];

  uint64_t v11 = [v10 userInfo];
  char v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F11BA0]];
  int v13 = [v12 BOOLValue];

  int64_t v14 = [v8 nextObject];
  LOBYTE(a4) = [v14 sectionIsAutoPlaySection:v13 | v6 atIndex:a4 chain:v8];

  return a4;
}

- (unint64_t)playerNumberOfItems:(unint64_t)a3 inSection:(unint64_t)a4 chain:(id)a5
{
  id v8 = a5;
  int64_t v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];

  if (v9)
  {
    int64_t v10 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
    a3 = [v10 numberOfItemsInSection:a4];
  }
  uint64_t v11 = [v8 nextObject];
  unint64_t v12 = [v11 playerNumberOfItems:a3 inSection:a4 chain:v8];

  return v12;
}

- (MPSectionedCollection)queueContentItems
{
  return self->_queueContentItems;
}

- (id)playerItemContentID:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  int64_t v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  int64_t v10 = [v9 itemAtIndexPath:v8];

  uint64_t v11 = [v7 nextObject];
  unint64_t v12 = [v10 identifier];
  int v13 = [v11 playerItemContentID:v12 atIndexPath:v8 chain:v7];

  return v13;
}

- (id)preferredAudioFormat:(id)a3 chain:(id)a4
{
  id v7 = (MPCPlayerAudioFormat *)a3;
  id v8 = a4;
  int64_t v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  int64_t v10 = [v9 itemAtIndexPath:self->_playingIndexPath];

  if (!v10)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 436, @"Could not find content item at indexPath: %@", self->_playingIndexPath object file lineNumber description];
  }
  uint64_t v11 = [v10 preferredFormat];

  unint64_t v12 = v7;
  if (v11)
  {
    int v13 = [MPCPlayerAudioFormat alloc];
    int64_t v14 = [v10 preferredFormat];
    unint64_t v12 = [(MPCPlayerAudioFormat *)v13 initWithNowPlayingInfoAudioFormat:v14];
  }
  id v15 = [v8 nextObject];
  int64_t v16 = [v15 preferredAudioFormat:v12 chain:v8];

  return v16;
}

- (id)playerItemLocalizedDurationString:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  int v13 = [v12 itemAtIndexPath:v10];

  if (!v13)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 223, @"Could not find content item at indexPath: %@", v10 object file lineNumber description];
  }
  int64_t v14 = [v13 localizedDurationString];
  id v15 = [v11 nextObject];
  int64_t v16 = [v15 playerItemLocalizedDurationString:v14 atIndexPath:v10 chain:v11];

  return v16;
}

- (id)playerItemLanguageOptionGroups:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v11 = [v10 itemAtIndexPath:v8];

  if (!v11)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 323, @"Could not find content item at indexPath: %@", v8 object file lineNumber description];
  }
  unint64_t v12 = [v9 nextObject];
  int v13 = [v11 availableLanguageOptions];
  int64_t v14 = (void *)[v13 copy];
  id v15 = [v12 playerItemLanguageOptionGroups:v14 atIndexPath:v8 chain:v9];

  return v15;
}

- (BOOL)playerItemIsPlaceholder:(BOOL)a3 atIndexPath:(id)a4 chain:(id)a5
{
  uint64_t v6 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  unint64_t v12 = [v11 itemAtIndexPath:v9];

  if (!v12)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 254, @"Could not find content item at indexPath: %@", v9 object file lineNumber description];
  }
  int v13 = [v12 userInfo];
  int64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F11BB0]];

  if (v14) {
    uint64_t v6 = [v14 BOOLValue];
  }
  id v15 = [v10 nextObject];
  char v16 = [v15 playerItemIsPlaceholder:v6 atIndexPath:v9 chain:v10];

  return v16;
}

- (BOOL)playerItemIsFavoritable:(BOOL)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v11 = [v10 itemAtIndexPath:v8];

  if (!v11)
  {
    char v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 428, @"Could not find content item at indexPath: %@", v8 object file lineNumber description];
  }
  if ([v11 mediaType]) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = ((unint64_t)[v11 mediaType] >> 11) & 1;
  }
  int v13 = [v9 nextObject];
  char v14 = [v13 playerItemIsFavoritable:v12 atIndexPath:v8 chain:v9];

  return v14;
}

- ($04B05C73ED6AEEF31C5815932084562D)playerItemDuration:(SEL)a3 atIndexPath:(id *)a4 chain:(id)a5
{
  id v10 = a5;
  id v11 = a6;
  unint64_t v12 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  int v13 = [v12 itemAtIndexPath:v10];

  if (!v13)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a3, self, @"MPCMediaRemoteMiddleware.m", 198, @"Could not find content item at indexPath: %@", v10 object file lineNumber description];
  }
  if ([v13 isLoading])
  {
    char v40 = 1;
  }
  else
  {
    char v14 = [v13 userInfo];
    id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F11BA8]];
    char v40 = [v15 BOOLValue];
  }
  [v13 elapsedTimeTimestamp];
  uint64_t v17 = v16;
  [v13 startTime];
  uint64_t v19 = v18;
  v20 = [v13 userInfo];
  v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F11B88]];
  [v21 doubleValue];
  uint64_t v23 = v22;
  [v13 duration];
  uint64_t v25 = v24;
  [v13 elapsedTime];
  uint64_t v27 = v26;
  [(MPCMediaRemoteMiddleware *)self _playbackRateForContentItem:v13];
  int v29 = v28;
  [v13 defaultPlaybackRate];
  int v31 = v30;
  char v32 = [v13 isAlwaysLiveItem];
  int64_t v33 = [(MPCMediaRemoteMiddleware *)self playerState];
  char v34 = [v13 isInTransition];

  v35 = [v11 nextObject];
  v36 = v35;
  if (v35)
  {
    char v37 = v40;
    if (v33 != 2) {
      char v37 = 0;
    }
    v41[0] = v17;
    v41[1] = v19;
    v41[2] = v23;
    v41[3] = v25;
    v41[4] = v27;
    int v42 = v29;
    int v43 = v31;
    char v44 = v32;
    char v45 = v37;
    char v46 = v34;
    int v47 = 0;
    char v48 = 0;
    [v35 playerItemDuration:v41 atIndexPath:v10 chain:v11];
  }
  else
  {
    *(void *)&retstr->var7 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  return result;
}

- (id)playerItemCurrentLanguageOptions:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v11 = [v10 itemAtIndexPath:v8];

  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 329, @"Could not find content item at indexPath: %@", v8 object file lineNumber description];
  }
  unint64_t v12 = [v9 nextObject];
  int v13 = [v11 currentLanguageOptions];
  char v14 = (void *)[v13 copy];
  id v15 = [v12 playerItemCurrentLanguageOptions:v14 atIndexPath:v8 chain:v9];

  return v15;
}

- (id)audioRoute:(id)a3 chain:(id)a4
{
  id v7 = (MPCPlayerAudioRoute *)a3;
  id v8 = a4;
  id v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v10 = [v9 itemAtIndexPath:self->_playingIndexPath];

  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 482, @"Could not find content item at indexPath: %@", self->_playingIndexPath object file lineNumber description];
  }
  id v11 = [v10 audioRoute];

  unint64_t v12 = v7;
  if (v11)
  {
    int v13 = [MPCPlayerAudioRoute alloc];
    char v14 = [v10 audioRoute];
    unint64_t v12 = [(MPCPlayerAudioRoute *)v13 initWithNowPlayingInfoAudioRoute:v14];
  }
  id v15 = [v8 nextObject];
  uint64_t v16 = [v15 audioRoute:v12 chain:v8];

  return v16;
}

- (unint64_t)audioFormatPreference:(unint64_t)a3 chain:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v8 = [v7 itemAtIndexPath:self->_playingIndexPath];

  if (!v8)
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 464, @"Could not find content item at indexPath: %@", self->_playingIndexPath object file lineNumber description];
  }
  uint64_t v9 = [v8 formatTierPreference];
  id v10 = [v6 nextObject];
  unint64_t v11 = [v10 audioFormatPreference:v9 chain:v6];

  return v11;
}

- (id)alternateAudioFormats:(id)a3 chain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v10 = [v9 itemAtIndexPath:self->_playingIndexPath];

  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 472, @"Could not find content item at indexPath: %@", self->_playingIndexPath object file lineNumber description];
  }
  unint64_t v11 = [v10 alternativeFormats];
  unint64_t v12 = objc_msgSend(v11, "msv_map:", &__block_literal_global_12474);

  int v13 = [v8 nextObject];
  char v14 = [v13 alternateAudioFormats:v12 chain:v8];

  return v14;
}

- (int64_t)activeAudioFormatJustification:(int64_t)a3 chain:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v8 = [v7 itemAtIndexPath:self->_playingIndexPath];

  if (!v8)
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 456, @"Could not find content item at indexPath: %@", self->_playingIndexPath object file lineNumber description];
  }
  uint64_t v9 = [v8 activeFormatJustification];
  id v10 = [v6 nextObject];
  int64_t v11 = [v10 activeAudioFormatJustification:v9 chain:v6];

  return v11;
}

- (id)activeAudioFormat:(id)a3 chain:(id)a4
{
  id v7 = (MPCPlayerAudioFormat *)a3;
  id v8 = a4;
  uint64_t v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v10 = [v9 itemAtIndexPath:self->_playingIndexPath];

  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 446, @"Could not find content item at indexPath: %@", self->_playingIndexPath object file lineNumber description];
  }
  int64_t v11 = [v10 activeFormat];

  unint64_t v12 = v7;
  if (v11)
  {
    int v13 = [MPCPlayerAudioFormat alloc];
    char v14 = [v10 activeFormat];
    unint64_t v12 = [(MPCPlayerAudioFormat *)v13 initWithNowPlayingInfoAudioFormat:v14];
  }
  id v15 = [v8 nextObject];
  uint64_t v16 = [v15 activeAudioFormat:v12 chain:v8];

  return v16;
}

- (float)_playbackRateForContentItem:(id)a3
{
  id v4 = a3;
  [v4 playbackRate];
  float v6 = v5;
  switch([(MPCMediaRemoteMiddleware *)self playerState])
  {
    case 1:
    case 4:
    case 6:
      float v6 = 0.0;
      break;
    case 2:
      [v4 _mediaRemoteContentItem];
      if (!MRContentItemHasPlaybackRate()) {
        float v6 = 1.0;
      }
      break;
    default:
      break;
  }

  return v6;
}

- (id)operationsForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v5 = [(MPCMediaRemoteMiddleware *)self operationsForPlayerRequest:v4];
  }
  else
  {
    float v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)operationsForPlayerRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  float v6 = [MPCMediaRemoteMiddlewareControllerOperation alloc];
  id v7 = [v4 playerPath];
  id v8 = [(MPCMediaRemoteMiddlewareControllerOperation *)v6 initWithMiddleware:self playerPath:v7];

  [v5 addObject:v8];
  uint64_t v9 = [v4 playingItemProperties];
  if (v9 || ([v4 queueSectionProperties], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v10 = [[MPCMediaRemoteMiddlewareMetadataOperation alloc] initWithMiddleware:self request:v4];
    [(MPCMediaRemoteMiddlewareMetadataOperation *)v10 addDependency:v8];
    [v5 addObject:v10];
    int64_t v11 = [[MPCMediaRemoteMiddlewareParticipantsOperation alloc] initWithMiddleware:self];
    [(MPCMediaRemoteMiddlewareParticipantsOperation *)v11 addDependency:v8];
    [v5 addObject:v11];

    goto LABEL_5;
  }
  id v15 = [v4 queueItemProperties];

  if (v15) {
    goto LABEL_4;
  }
  self->_skippedMetadata = 1;
LABEL_5:
  unint64_t v12 = [[MPCMediaRemoteMiddlewareCommandsOperation alloc] initWithMiddleware:self];
  [(MPCMediaRemoteMiddlewareCommandsOperation *)v12 addDependency:v8];
  [v5 addObject:v12];
  int v13 = [[MPCMediaRemoteMiddlewarePlaybackStateOperation alloc] initWithMiddleware:self];
  [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)v13 addDependency:v8];
  [v5 addObject:v13];

  return v5;
}

- (void)setQueueParticipants:(id)a3
{
}

- (void)setPlayerState:(int64_t)a3
{
  self->_playerState = a3;
}

- (void)setSupportedCommands:(id)a3
{
}

- (void)setController:(id)a3
{
}

- (MPCMediaRemoteController)controller
{
  return self->_controller;
}

- (MPCFuture)controllerFuture
{
  return self->_controllerFuture;
}

- (void)setControllerFuture:(id)a3
{
}

- (unint64_t)playerNumberOfSections:(unint64_t)a3 chain:(id)a4
{
  id v5 = a4;
  float v6 = [v5 nextObject];
  id v7 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  unint64_t v8 = objc_msgSend(v6, "playerNumberOfSections:chain:", objc_msgSend(v7, "numberOfSections"), v5);

  return v8;
}

- (void)setQueueProperties:(id)a3
{
}

- (void)setQueueModelObjects:(id)a3
{
}

- (void)setQueueIdentifier:(id)a3
{
}

- (void)setQueueContentItems:(id)a3
{
}

- (void)setPlayingIndexPath:(id)a3
{
}

- (int64_t)playerQueueEndAction:(int64_t)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F549A8];
  id v7 = a4;
  unint64_t v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:135 infoValueForKey:v6];
  if (_NSIsNSNumber()) {
    a3 = [v8 unsignedIntegerValue];
  }
  uint64_t v9 = [v7 nextObject];
  int64_t v10 = [v9 playerQueueEndAction:a3 chain:v7];

  return v10;
}

- (id)playerPlayingItemIndexPath:(id)a3 chain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MPCMediaRemoteMiddleware *)self playingIndexPath];
  uint64_t v9 = (void *)v8;
  if (v8) {
    int64_t v10 = (void *)v8;
  }
  else {
    int64_t v10 = v7;
  }
  id v11 = v10;

  unint64_t v12 = [v6 nextObject];
  int v13 = [v12 playerPlayingItemIndexPath:v11 chain:v6];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueProperties, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_playingIndexPath, 0);
  objc_storeStrong((id *)&self->_lastSectionContentItem, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_queueModelObjects, 0);
  objc_storeStrong((id *)&self->_queueParticipants, 0);
  objc_storeStrong((id *)&self->_queueContentItems, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_controllerFuture, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)lastSectionModelObject:(id)a3 propertySet:(id)a4 chain:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(MPCMediaRemoteMiddleware *)self lastSectionContentItem];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F11E70] translatorForMPModelClass:objc_opt_class()];
    id v9 = objc_alloc_init(MEMORY[0x263F11E78]);
    int64_t v10 = [(MPCMediaRemoteMiddleware *)self controller];
    [v9 setArtworkGenerator:v10];

    if (!v6)
    {
      id v11 = (void *)MEMORY[0x263F12180];
      v17[0] = *MEMORY[0x263F11998];
      unint64_t v12 = [MEMORY[0x263F12180] emptyPropertySet];
      v18[0] = v12;
      v17[1] = *MEMORY[0x263F119D8];
      int v13 = [MEMORY[0x263F12180] emptyPropertySet];
      v18[1] = v13;
      char v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
      id v6 = [v11 propertySetWithRelationships:v14];
    }
    id v15 = [v8 sectionObjectForPropertySet:v6 contentItem:v7 context:v9];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (MPNowPlayingContentItem)lastSectionContentItem
{
  return self->_lastSectionContentItem;
}

- (id)playerItemExplicitBadge:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v9 = [v8 itemAtIndexPath:v7];

  if (!v9)
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 231, @"Could not find content item at indexPath: %@", v7 object file lineNumber description];
  }
  int64_t v10 = [v9 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F11B90]];

  return v11;
}

- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  if ([v11 length] == 1)
  {
    char v14 = -[MPSectionedCollection sectionAtIndex:](self->_queueModelObjects, "sectionAtIndex:", [v11 section]);
    goto LABEL_5;
  }
  if ([v11 length] == 2)
  {
    char v14 = [(MPSectionedCollection *)self->_queueModelObjects itemAtIndexPath:v11];
LABEL_5:
    id v15 = v14;
    if ([v14 type])
    {
      if (v15) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (![0 type])
  {
    id v15 = 0;
LABEL_10:
  }
LABEL_11:
  id v15 = v10;
LABEL_12:
  uint64_t v16 = [v12 nextObject];
  uint64_t v17 = [v16 playerModelObject:v15 propertySet:v13 atIndexPath:v11 chain:v12];

  return v17;
}

- (id)participant:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v10 = [v9 itemAtIndexPath:v7];

  id v11 = [v10 associatedParticipantIdentifier];
  if (v11)
  {
    id v12 = [(MPCMediaRemoteMiddleware *)self queueParticipants];
    id v13 = [v12 objectForKeyedSubscript:v11];
  }
  else
  {
    id v13 = 0;
  }
  char v14 = [v8 nextObject];
  id v15 = [v14 participant:v13 atIndexPath:v7 chain:v8];

  return v15;
}

- (BOOL)skippedMetadata
{
  return self->_skippedMetadata;
}

- (void)setLastSectionContentItem:(id)a3
{
}

- (MPSectionedCollection)queueModelObjects
{
  return self->_queueModelObjects;
}

- (NSDictionary)queueParticipants
{
  return self->_queueParticipants;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (id)_stateDumpObject
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"_obj";
  v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v12[0] = v3;
  v11[1] = @"_skippedMetadata";
  id v4 = [NSNumber numberWithBool:self->_skippedMetadata];
  v12[1] = v4;
  v11[2] = @"controller";
  id v5 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self->_controller];
  v12[2] = v5;
  v11[3] = @"invalidationObservers";
  uint64_t v6 = [(MPCMediaRemoteMiddleware *)self invalidationObservers];
  id v7 = (void *)v6;
  id v8 = @"<NULL>";
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  v12[3] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (int64_t)playerSleepTimerStopMode:(int64_t)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54A40];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:124 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 unsignedIntegerValue];
    a3 = MPSleepTimerStopModeFromMediaRemoteSleepTimerStopMode();
  }
  id v9 = [v7 nextObject];
  int64_t v10 = [v9 playerSleepTimerStopMode:a3 chain:v7];

  return v10;
}

- (double)playerSleepTimerFireDate:(double)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54A38];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:124 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 doubleValue];
    a3 = v9;
  }
  int64_t v10 = [v7 nextObject];
  [v10 playerSleepTimerFireDate:v7 chain:a3];
  double v12 = v11;

  return v12;
}

- (double)playerSleepTimerTime:(double)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54A48];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:124 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 doubleValue];
    a3 = v9;
  }
  int64_t v10 = [v7 nextObject];
  [v10 playerSleepTimerTime:v7 chain:a3];
  double v12 = v11;

  return v12;
}

- (BOOL)playerVocalsControlContinuous:(BOOL)a3 chain:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v6 = *MEMORY[0x263F54AB8];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:142 infoValueForKey:v6];
  if (_NSIsNSNumber()) {
    uint64_t v4 = [v8 BOOLValue];
  }
  double v9 = [v7 nextObject];
  char v10 = [v9 playerVocalsControlContinuous:v4 chain:v7];

  return v10;
}

- (float)playerMaxVocalsLevel:(float)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54AC8];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:142 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 floatValue];
    a3 = v9;
  }
  char v10 = [v7 nextObject];
  *(float *)&double v11 = (float)(uint64_t)a3;
  [v10 playerMaxVocalsLevel:v7 chain:v11];
  float v13 = v12;

  return v13;
}

- (float)playerMinVocalsLevel:(float)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54AD0];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:142 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 floatValue];
    a3 = v9;
  }
  char v10 = [v7 nextObject];
  *(float *)&double v11 = a3;
  [v10 playerMinVocalsLevel:v7 chain:v11];
  float v13 = v12;

  return v13;
}

- (float)playerVocalsLevel:(float)a3 chain:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F54AC0];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:142 infoValueForKey:v6];
  if (_NSIsNSNumber())
  {
    [v8 floatValue];
    a3 = v9;
  }
  char v10 = [v7 nextObject];
  *(float *)&double v11 = a3;
  [v10 playerVocalsLevel:v7 chain:v11];
  float v13 = v12;

  return v13;
}

- (BOOL)playerVocalsControlActive:(BOOL)a3 chain:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v6 = *MEMORY[0x263F54AB0];
  id v7 = a4;
  id v8 = [(MPCMediaRemoteMiddleware *)self _supportedCommands:142 infoValueForKey:v6];
  if (_NSIsNSNumber()) {
    uint64_t v4 = [v8 BOOLValue];
  }
  float v9 = [v7 nextObject];
  char v10 = [v9 playerVocalsControlActive:v4 chain:v7];

  return v10;
}

MPCPlayerAudioFormat *__82__MPCMediaRemoteMiddleware_MPCPlayerResponseBuilder__alternateAudioFormats_chain___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MPCPlayerAudioFormat alloc] initWithNowPlayingInfoAudioFormat:v2];

  return v3;
}

- (int64_t)playerCommandDisabledReason:(int64_t)a3 command:(unsigned int)a4 chain:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  float v9 = [(MPCMediaRemoteMiddleware *)self supportedCommands];
  uint64_t v10 = [v9 commandInfoForCommand:v5];

  if (v10)
  {
    uint64_t v11 = MRMediaRemoteCommandInfoGetIntegerValueForKey() - 1;
    if (v11 > 5) {
      a3 = 0;
    }
    else {
      a3 = v11 + 1;
    }
  }
  float v12 = [v8 nextObject];
  int64_t v13 = [v12 playerCommandDisabledReason:a3 command:v5 chain:v8];

  return v13;
}

- (BOOL)playerCommandSupported:(BOOL)a3 command:(unsigned int)a4 chain:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  LODWORD(v6) = a3;
  id v8 = a5;
  float v9 = [(MPCMediaRemoteMiddleware *)self supportedCommands];
  uint64_t v10 = [v9 commandInfoForCommand:v5];

  if (v10) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v6;
  }
  uint64_t v11 = [v8 nextObject];
  char v12 = [v11 playerCommandSupported:v6 command:v5 chain:v8];

  return v12;
}

- (BOOL)playerItemShouldDisableJumpToItem:(BOOL)a3 atIndexPath:(id)a4 boundsCheck:(BOOL)a5 chain:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v11 = a4;
  id v12 = a6;
  int64_t v13 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  char v14 = [v13 itemAtIndexPath:v11];

  if (v7 && !v14)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v19 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
    v20 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
    [v18 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 293, @"Could not find content item at indexPath: %@ queueContentItems: %p queueContentItems.totalItemCount: %ld", v11, v19, objc_msgSend(v20, "totalItemCount") object file lineNumber description];
  }
  id v15 = [v12 nextObject];
  char v16 = [v15 playerItemShouldDisableJumpToItem:v8 atIndexPath:v11 boundsCheck:v7 chain:v12];

  return v16;
}

- (id)queueItemIdentifier:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  float v9 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  uint64_t v10 = [v9 itemAtIndexPath:v8];

  id v11 = v10;
  id v12 = [v11 _mediaRemoteContentItem];
  int64_t v13 = [v12 queueIdentifier];
  char v14 = [v7 nextObject];
  id v15 = [v14 queueItemIdentifier:v13 atIndexPath:v8 chain:v7];

  return v15;
}

- (int64_t)playerItemEditingStyleFlags:(int64_t)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(MPCMediaRemoteMiddleware *)self queueContentItems];
  id v11 = [v10 itemAtIndexPath:v8];

  if (!v11)
  {
    char v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPCMediaRemoteMiddleware.m", 239, @"Could not find content item at indexPath: %@", v8 object file lineNumber description];
  }
  uint64_t v12 = [v11 editingStyleFlags];
  int64_t v13 = [v9 nextObject];
  int64_t v14 = [v13 playerItemEditingStyleFlags:v12 atIndexPath:v8 chain:v9];

  return v14;
}

@end