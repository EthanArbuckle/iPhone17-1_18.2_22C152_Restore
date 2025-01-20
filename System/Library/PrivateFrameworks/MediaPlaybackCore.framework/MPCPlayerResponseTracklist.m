@interface MPCPlayerResponseTracklist
+ (id)insertCommandForPlayerPath:(id)a3 devices:(id)a4;
+ (id)resetCommandForPlayerPath:(id)a3 devices:(id)a4;
- (MPCPlayerResponse)response;
- (MPCPlayerResponseItem)playingItem;
- (MPCPlayerResponseTracklist)initWithResponse:(id)a3;
- (MPSectionedCollection)displayItems;
- (MPSectionedCollection)items;
- (NSIndexPath)playingItemIndexPath;
- (NSString)uniqueIdentifier;
- (id)_stateDumpObject;
- (id)actionAtQueueEndCommand;
- (id)changeItemCommand;
- (id)displayIndexPathForStructuredIndexPath:(id)a3;
- (id)insertCommand;
- (id)prepareVocalsControlCommand;
- (id)reorderCommand;
- (id)repeatCommand;
- (id)representativeSectionForDisplaySection:(id)a3;
- (id)resetCommand;
- (id)shuffleCommand;
- (id)sleepTimerCommand;
- (id)structuredIndexPathForDisplayIndexPath:(id)a3;
- (id)vocalsControlCommand;
- (int64_t)actionAtQueueEnd;
- (int64_t)explicitContentState;
- (int64_t)globalItemCount;
- (int64_t)lastChangeDirection;
- (int64_t)playingItemGlobalIndex;
- (int64_t)repeatType;
- (int64_t)shuffleType;
- (int64_t)upNextItemCount;
- (unint64_t)_determineChangeItemSupport;
@end

@implementation MPCPlayerResponseTracklist

- (MPSectionedCollection)items
{
  return self->_items;
}

- (id)resetCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandEnabled:0 command:122 chain:v4];

  if (v5)
  {
    v6 = [(_MPCPlayerCommand *)[_MPCPlayerResetTracklistCommand alloc] initWithResponse:WeakRetained];
    [(_MPCPlayerResetTracklistCommand *)v6 setSupportsSetQueueCommand:1];
    v7 = [WeakRetained builder];
    uint64_t v8 = *MEMORY[0x263F54A50];
    v9 = [WeakRetained chain];
    uint64_t v10 = MEMORY[0x263EFFA78];
    uint64_t v11 = [v7 playerCommandOptionValue:MEMORY[0x263EFFA78] forKey:v8 command:122 chain:v9];
    v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v10;
    }
    [(_MPCPlayerResetTracklistCommand *)v6 setSupportedSpecializedQueues:v13];

    v14 = [WeakRetained builder];
    uint64_t v15 = *MEMORY[0x263F54A68];
    v16 = [WeakRetained chain];
    v17 = (void *)MEMORY[0x263EFFA68];
    uint64_t v18 = [v14 playerCommandOptionValue:MEMORY[0x263EFFA68] forKey:v15 command:122 chain:v16];
    v19 = (void *)v18;
    if (v18) {
      v20 = (void *)v18;
    }
    else {
      v20 = v17;
    }
    id v21 = v20;

    v22 = [MEMORY[0x263EFFA08] setWithArray:v21];
    [(_MPCPlayerResetTracklistCommand *)v6 setSupportedQueueTypes:v22];

    v23 = [WeakRetained builder];
    uint64_t v24 = *MEMORY[0x263F54A58];
    v25 = [WeakRetained chain];
    uint64_t v26 = [v23 playerCommandOptionValue:v17 forKey:v24 command:122 chain:v25];
    v27 = (void *)v26;
    if (v26) {
      v28 = (void *)v26;
    }
    else {
      v28 = v17;
    }
    id v29 = v28;

    v30 = [MEMORY[0x263EFFA08] setWithArray:v29];

    [(_MPCPlayerResetTracklistCommand *)v6 setSupportedCustomDataQueueIdentifiers:v30];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)insertCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandEnabled:0 command:125 chain:v4];

  v6 = [WeakRetained builder];
  v7 = [WeakRetained chain];
  int v8 = [v6 playerCommandEnabled:0 command:121 chain:v7];

  if ((v5 & 1) != 0 || v8)
  {
    v9 = [(_MPCPlayerCommand *)[_MPCPlayerInsertItemsCommand alloc] initWithResponse:WeakRetained];
    if (!v5) {
      goto LABEL_18;
    }
  }
  else
  {
    v9 = 0;
    if (!v5) {
      goto LABEL_18;
    }
  }
  uint64_t v10 = [WeakRetained builder];
  uint64_t v11 = *MEMORY[0x263F54A60];
  v12 = [WeakRetained chain];
  uint64_t v13 = (void *)MEMORY[0x263EFFA68];
  uint64_t v14 = [v10 playerCommandOptionValue:MEMORY[0x263EFFA68] forKey:v11 command:125 chain:v12];
  uint64_t v15 = (void *)v14;
  if (v14) {
    v16 = (void *)v14;
  }
  else {
    v16 = v13;
  }
  id v17 = v16;

  uint64_t v18 = [MEMORY[0x263EFFA08] setWithArray:v17];
  [(_MPCPlayerInsertItemsCommand *)v9 setSupportedInsertionPositions:v18];

  v19 = [WeakRetained builder];
  uint64_t v20 = *MEMORY[0x263F54A68];
  id v21 = [WeakRetained chain];
  uint64_t v22 = [v19 playerCommandOptionValue:v13 forKey:v20 command:125 chain:v21];
  v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = (void *)v22;
  }
  else {
    uint64_t v24 = v13;
  }
  id v25 = v24;

  uint64_t v26 = [MEMORY[0x263EFFA08] setWithArray:v25];
  [(_MPCPlayerInsertItemsCommand *)v9 setSupportedQueueTypes:v26];

  v27 = [WeakRetained builder];
  uint64_t v28 = *MEMORY[0x263F54A58];
  id v29 = [WeakRetained chain];
  uint64_t v30 = [v27 playerCommandOptionValue:v13 forKey:v28 command:125 chain:v29];
  v31 = (void *)v30;
  if (v30) {
    v32 = (void *)v30;
  }
  else {
    v32 = v13;
  }
  id v33 = v32;

  v34 = [MEMORY[0x263EFFA08] setWithArray:v33];

  [(_MPCPlayerInsertItemsCommand *)v9 setSupportedCustomDataQueueIdentifiers:v34];
  v35 = [WeakRetained builder];
  v36 = [WeakRetained request];
  v37 = [v36 queueSectionProperties];
  v38 = [WeakRetained chain];
  v39 = [v35 lastSectionModelObject:0 propertySet:v37 chain:v38];

  if (v39)
  {
    v40 = [[MPCPlayerResponseSection alloc] initWithModelGenericObject:v39 sectionIndex:0x7FFFFFFFFFFFFFFFLL response:WeakRetained];
    [(_MPCPlayerInsertItemsCommand *)v9 setLastSection:v40];
  }
LABEL_18:
  if (v8) {
    [(_MPCPlayerInsertItemsCommand *)v9 setSupportsCreateStation:1];
  }

  return v9;
}

- (MPCPlayerResponseTracklist)initWithResponse:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MPCPlayerResponseTracklist;
  int v5 = [(MPCPlayerResponseTracklist *)&v44 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_response, v4);
    v7 = [v4 builder];
    int v8 = [v4 chain];
    uint64_t v9 = [v7 tracklistUniqueIdentifier:@"<missing queue identifier>" chain:v8];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 builder];
    v12 = [v4 chain];
    v6->_lastChangeDirection = [v11 playerLastChangeDirection:0 chain:v12];

    uint64_t v13 = [v4 builder];
    uint64_t v14 = [v4 chain];
    uint64_t v15 = [v13 playerPlayingItemIndexPath:0 chain:v14];
    playingItemIndexPath = v6->_playingItemIndexPath;
    v6->_playingItemIndexPath = (NSIndexPath *)v15;

    id v17 = [v4 builder];
    uint64_t v18 = [v4 chain];
    v6->_playingItemGlobalIndex = [v17 playerPlayingItemGlobalIndex:0 chain:v18];

    v19 = [v4 builder];
    uint64_t v20 = [v4 chain];
    v6->_globalItemCount = [v19 playerGlobalItemCount:0 chain:v20];

    id v21 = [v4 builder];
    uint64_t v22 = [v4 chain];
    v6->_upNextItemCount = [v21 playerUpNextItemCount:0 chain:v22];

    v23 = [v4 builder];
    uint64_t v24 = [v4 chain];
    v6->_explicitContentState = [v23 playerExplicitContentState:0 chain:v24];

    id v25 = [v4 builder];
    uint64_t v26 = [v4 chain];
    v6->_repeatType = [v25 playerRepeatType:0 chain:v26];

    v27 = [v4 builder];
    uint64_t v28 = [v4 chain];
    v6->_shuffleType = [v27 playerShuffleType:0 chain:v28];

    id v29 = [v4 builder];
    uint64_t v30 = [v4 chain];
    v6->_actionAtQueueEnd = [v29 playerQueueEndAction:1 chain:v30];

    id v31 = objc_alloc(MEMORY[0x263F11DC0]);
    v32 = [[_MPCPlayerResponseTracklistDataSource alloc] initWithResponse:v4 playingItemIndexPath:v6->_playingItemIndexPath];
    uint64_t v33 = [v31 initWithDataSource:v32];
    items = v6->_items;
    v6->_items = (MPSectionedCollection *)v33;

    v35 = [v4 builder];
    v36 = [v4 chain];
    v37 = [v35 tracklistProperties:MEMORY[0x263EFFA78] chain:v36];

    v38 = [v37 objectForKeyedSubscript:@"tailInsertionContentItemID"];
    id v39 = objc_alloc(MEMORY[0x263F11DC0]);
    v40 = [[_MPCPlayerResponseTracklistDisplayDataSource alloc] initWithResponse:v4 tracklistItems:v6->_items playingItemIndexPath:v6->_playingItemIndexPath tailInsertionContentItemID:v38];
    uint64_t v41 = [v39 initWithDataSource:v40];
    displayItems = v6->_displayItems;
    v6->_displayItems = (MPSectionedCollection *)v41;
  }
  return v6;
}

- (unint64_t)_determineChangeItemSupport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  id v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandEnabled:0 command:5 chain:v4];

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [WeakRetained builder];
  int v8 = [WeakRetained chain];
  int v9 = [v7 playerCommandEnabled:0 command:110 chain:v8];

  if (v9) {
    v6 |= 4uLL;
  }
  uint64_t v10 = [WeakRetained builder];
  uint64_t v11 = [WeakRetained chain];
  int v12 = [v10 playerCommandEnabled:0 command:101 chain:v11];

  if (v12) {
    v6 |= 8uLL;
  }
  uint64_t v13 = [WeakRetained builder];
  uint64_t v14 = [WeakRetained chain];
  int v15 = [v13 playerCommandEnabled:0 command:4 chain:v14];

  if (v15) {
    v6 |= 0x10uLL;
  }
  v16 = [WeakRetained builder];
  id v17 = [WeakRetained chain];
  int v18 = [v16 playerCommandEnabled:0 command:109 chain:v17];

  if (v18) {
    v6 |= 0x20uLL;
  }
  v19 = [WeakRetained builder];
  uint64_t v20 = [WeakRetained chain];
  int v21 = [v19 playerCommandEnabled:0 command:100 chain:v20];

  if (v21) {
    v6 |= 0x40uLL;
  }
  uint64_t v22 = [WeakRetained builder];
  v23 = [WeakRetained chain];
  int v24 = [v22 playerCommandEnabled:0 command:131 chain:v23];

  if (v24) {
    unint64_t v25 = v6 | 0x80;
  }
  else {
    unint64_t v25 = v6;
  }

  return v25;
}

- (MPCPlayerResponseItem)playingItem
{
  if (self->_playingItemIndexPath)
  {
    v2 = -[MPSectionedCollection itemAtIndexPath:](self->_items, "itemAtIndexPath:");
  }
  else
  {
    v2 = 0;
  }

  return (MPCPlayerResponseItem *)v2;
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (id)changeItemCommand
{
  unint64_t changeItemSupport = self->_changeItemSupport;
  if ((changeItemSupport & 1) == 0)
  {
    unint64_t changeItemSupport = [(MPCPlayerResponseTracklist *)self _determineChangeItemSupport];
    self->_unint64_t changeItemSupport = changeItemSupport;
  }
  if (changeItemSupport == 1)
  {
    id v4 = 0;
  }
  else
  {
    int v5 = [_MPCPlayerChangeItemCommand alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    id v4 = [(_MPCPlayerChangeItemCommand *)v5 initWithResponse:WeakRetained changeItemSupport:self->_changeItemSupport];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_response);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)globalItemCount
{
  return self->_globalItemCount;
}

- (int64_t)playingItemGlobalIndex
{
  return self->_playingItemGlobalIndex;
}

- (MPSectionedCollection)displayItems
{
  return self->_displayItems;
}

- (MPCPlayerResponse)response
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);

  return (MPCPlayerResponse *)WeakRetained;
}

- (int64_t)actionAtQueueEnd
{
  return self->_actionAtQueueEnd;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (int64_t)explicitContentState
{
  return self->_explicitContentState;
}

- (int64_t)upNextItemCount
{
  return self->_upNextItemCount;
}

- (int64_t)lastChangeDirection
{
  return self->_lastChangeDirection;
}

- (id)_stateDumpObject
{
  v10[3] = *MEMORY[0x263EF8340];
  int64_t lastChangeDirection = self->_lastChangeDirection;
  v10[0] = self->_uniqueIdentifier;
  v9[0] = @"uniqueID";
  v9[1] = @"lastChangeDirection";
  if ((unint64_t)(lastChangeDirection + 1) > 6) {
    v3 = @"MPCPlayerDirectionReverseJump";
  }
  else {
    v3 = off_2643C29F0[lastChangeDirection + 1];
  }
  v10[1] = v3;
  v9[2] = @"playingItem";
  uint64_t v4 = [(MPCPlayerResponseTracklist *)self playingItem];
  int v5 = (void *)v4;
  uint64_t v6 = @"<NONE>";
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v10[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)sleepTimerCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  uint64_t v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandSupported:0 command:124 chain:v4];

  if (v5)
  {
    uint64_t v6 = [WeakRetained builder];
    v7 = [WeakRetained chain];
    int v8 = [v6 playerCommandEnabled:0 command:124 chain:v7];

    int v9 = [WeakRetained builder];
    uint64_t v10 = [WeakRetained chain];
    uint64_t v11 = [v9 playerCommandDisabledReason:0 command:124 chain:v10];

    if ((v8 & 1) != 0 || (int v12 = 0, v11))
    {
      int v12 = [(_MPCPlayerCommand *)[_MPCSleepTimerCommand alloc] initWithResponse:WeakRetained];
      [(_MPCSleepTimerCommand *)v12 setDisabled:v8 ^ 1u];
      if ([(_MPCSleepTimerCommand *)v12 isDisabled]) {
        [(_MPCSleepTimerCommand *)v12 setDisabledReason:v11];
      }
      uint64_t v13 = [WeakRetained builder];
      uint64_t v14 = [WeakRetained chain];
      [v13 playerSleepTimerTime:v14 chain:0.0];
      -[_MPCSleepTimerCommand setTime:](v12, "setTime:");

      int v15 = [WeakRetained builder];
      v16 = [WeakRetained chain];
      [v15 playerSleepTimerFireDate:v16 chain:0.0];
      -[_MPCSleepTimerCommand setFireDate:](v12, "setFireDate:");

      id v17 = [WeakRetained builder];
      int v18 = [WeakRetained chain];
      -[_MPCSleepTimerCommand setStopMode:](v12, "setStopMode:", [v17 playerSleepTimerStopMode:0 chain:v18]);
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)vocalsControlCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  uint64_t v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandSupported:0 command:142 chain:v4];

  if (v5)
  {
    uint64_t v6 = [WeakRetained builder];
    v7 = [WeakRetained chain];
    int v8 = [v6 playerCommandEnabled:0 command:142 chain:v7];

    int v9 = [WeakRetained builder];
    uint64_t v10 = [WeakRetained chain];
    uint64_t v11 = [v9 playerCommandDisabledReason:0 command:142 chain:v10];

    if ((v8 & 1) != 0 || (int v12 = 0, v11))
    {
      int v12 = [(_MPCPlayerCommand *)[_MPCVocalsControlCommand alloc] initWithResponse:WeakRetained];
      [(_MPCVocalsControlCommand *)v12 setDisabled:v8 ^ 1u];
      if ([(_MPCVocalsControlCommand *)v12 isDisabled]) {
        [(_MPCVocalsControlCommand *)v12 setDisabledReason:v11];
      }
      uint64_t v13 = [WeakRetained builder];
      uint64_t v14 = [WeakRetained chain];
      -[_MPCVocalsControlCommand setActive:](v12, "setActive:", [v13 playerVocalsControlActive:0 chain:v14]);

      int v15 = [WeakRetained builder];
      v16 = [WeakRetained chain];
      [v15 playerVocalsLevel:v16 chain:0.0];
      -[_MPCVocalsControlCommand setLevel:](v12, "setLevel:");

      id v17 = [WeakRetained builder];
      int v18 = [WeakRetained chain];
      [v17 playerMinVocalsLevel:v18 chain:0.0];
      -[_MPCVocalsControlCommand setMinLevel:](v12, "setMinLevel:");

      v19 = [WeakRetained builder];
      uint64_t v20 = [WeakRetained chain];
      [v19 playerMaxVocalsLevel:v20 chain:0.0];
      -[_MPCVocalsControlCommand setMaxLevel:](v12, "setMaxLevel:");

      int v21 = [WeakRetained builder];
      uint64_t v22 = [WeakRetained chain];
      -[_MPCVocalsControlCommand setContinuous:](v12, "setContinuous:", [v21 playerVocalsControlContinuous:1 chain:v22]);
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)prepareVocalsControlCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  uint64_t v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandEnabled:0 command:143 chain:v4];

  if (v5) {
    uint64_t v6 = [(_MPCPlayerCommand *)[_MPCPrepareVocalsControlCommand alloc] initWithResponse:WeakRetained];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)actionAtQueueEndCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  uint64_t v4 = [WeakRetained builder];
  int v5 = [WeakRetained chain];
  int v6 = [v4 playerCommandEnabled:0 command:135 chain:v5];

  if (v6)
  {
    v7 = [(_MPCPlayerCommand *)[_MPCPlayerActionAtQueueEndCommand alloc] initWithResponse:WeakRetained];
    [(_MPCPlayerActionAtQueueEndCommand *)v7 setActionAtQueueEnd:[(MPCPlayerResponseTracklist *)self actionAtQueueEnd]];
    int v8 = [WeakRetained builder];
    uint64_t v9 = *MEMORY[0x263F54A88];
    uint64_t v10 = [WeakRetained chain];
    uint64_t v11 = [v8 playerCommandOptionValue:&unk_26CC195C8 forKey:v9 command:135 chain:v10];
    int v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    else {
      uint64_t v13 = &unk_26CC195C8;
    }
    [(_MPCPlayerActionAtQueueEndCommand *)v7 setSupportedActions:v13];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)shuffleCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  uint64_t v4 = [WeakRetained builder];
  int v5 = [WeakRetained chain];
  uint64_t v6 = [v4 playerCommandEnabled:0 command:26 chain:v5];

  v7 = [WeakRetained builder];
  int v8 = [WeakRetained chain];
  uint64_t v9 = [v7 playerCommandEnabled:0 command:6 chain:v8];

  if ((v6 & 1) != 0 || v9)
  {
    uint64_t v10 = [(_MPCPlayerCommand *)[_MPCPlayerShuffleCommand alloc] initWithResponse:WeakRetained];
    [(_MPCPlayerShuffleCommand *)v10 setCurrentShuffleType:[(MPCPlayerResponseTracklist *)self shuffleType]];
    [(_MPCPlayerShuffleCommand *)v10 setSupportsChangeShuffle:v6];
    [(_MPCPlayerShuffleCommand *)v10 setSupportsAdvanceShuffle:v9];
    uint64_t v11 = [WeakRetained builder];
    uint64_t v12 = *MEMORY[0x263F54A98];
    uint64_t v13 = [WeakRetained chain];
    uint64_t v14 = [v11 playerCommandOptionValue:&unk_26CC195B0 forKey:v12 command:26 chain:v13];
    int v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = &unk_26CC195B0;
    }
    [(_MPCPlayerShuffleCommand *)v10 setSupportedShuffleTypes:v16];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)repeatCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  uint64_t v4 = [WeakRetained builder];
  int v5 = [WeakRetained chain];
  uint64_t v6 = [v4 playerCommandEnabled:0 command:25 chain:v5];

  v7 = [WeakRetained builder];
  int v8 = [WeakRetained chain];
  uint64_t v9 = [v7 playerCommandEnabled:0 command:7 chain:v8];

  if ((v6 & 1) != 0 || v9)
  {
    uint64_t v10 = [(_MPCPlayerCommand *)[_MPCPlayerRepeatCommand alloc] initWithResponse:WeakRetained];
    [(_MPCPlayerRepeatCommand *)v10 setCurrentRepeatType:[(MPCPlayerResponseTracklist *)self repeatType]];
    [(_MPCPlayerRepeatCommand *)v10 setSupportsChangeRepeat:v6];
    [(_MPCPlayerRepeatCommand *)v10 setSupportsAdvanceRepeat:v9];
    uint64_t v11 = [WeakRetained builder];
    uint64_t v12 = *MEMORY[0x263F54A90];
    uint64_t v13 = [WeakRetained chain];
    uint64_t v14 = [v11 playerCommandOptionValue:&unk_26CC19598 forKey:v12 command:25 chain:v13];
    int v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = &unk_26CC19598;
    }
    [(_MPCPlayerRepeatCommand *)v10 setSupportedRepeatTypes:v16];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)reorderCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  v3 = [WeakRetained builder];
  uint64_t v4 = [WeakRetained chain];
  int v5 = [v3 playerCommandEnabled:0 command:130 chain:v4];

  if (v5) {
    uint64_t v6 = [(_MPCPlayerCommand *)[_MPCPlayerReorderItemsCommand alloc] initWithResponse:WeakRetained];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)representativeSectionForDisplaySection:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  int v5 = v4;
  if (v4 == @"MPCPlayerResponseTracklistDisplaySectionNextItems"
    || (int v6 = [(__CFString *)v4 isEqual:@"MPCPlayerResponseTracklistDisplaySectionNextItems"],
        v5,
        v6))
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    displayItems = self->_displayItems;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__MPCPlayerResponseTracklist_representativeSectionForDisplaySection___block_invoke;
    v10[3] = &unk_2643C29D0;
    void v10[4] = self;
    v10[5] = &v11;
    [(MPSectionedCollection *)displayItems enumerateSectionsUsingBlock:v10];
    if (v12[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v8 = 0;
    }
    else
    {
      int v8 = -[MPSectionedCollection sectionAtIndex:](self->_items, "sectionAtIndex:");
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

void __69__MPCPlayerResponseTracklist_representativeSectionForDisplaySection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = a2;
  int v15 = v7;
  if (v7 == @"MPCPlayerResponseTracklistDisplaySectionNextItems"
    || (int v8 = [(__CFString *)v7 isEqual:@"MPCPlayerResponseTracklistDisplaySectionNextItems"],
        v15,
        uint64_t v9 = v15,
        v8))
  {
    uint64_t v10 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:a3];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "numberOfItemsInSection:", a3) - 1, a3);
    uint64_t v12 = [*(id *)(a1 + 32) structuredIndexPathForDisplayIndexPath:v10];
    uint64_t v13 = [*(id *)(a1 + 32) structuredIndexPathForDisplayIndexPath:v11];
    uint64_t v14 = [v12 section];
    if (v14 == [v13 section])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v12 section];
      *a4 = 1;
    }

    uint64_t v9 = v15;
  }
}

- (id)displayIndexPathForStructuredIndexPath:(id)a3
{
  displayItems = self->_displayItems;
  id v4 = a3;
  int v5 = [(MPSectionedCollection *)displayItems dataSource];
  int v6 = [v5 displayIndexPathForStructuredIndexPath:v4];

  return v6;
}

- (id)structuredIndexPathForDisplayIndexPath:(id)a3
{
  displayItems = self->_displayItems;
  id v4 = a3;
  int v5 = [(MPSectionedCollection *)displayItems dataSource];
  int v6 = [v5 structuredIndexPathForDisplayIndexPath:v4];

  return v6;
}

+ (id)insertCommandForPlayerPath:(id)a3 devices:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(_MPCPlayerCommand *)[_MPCPlayerInsertItemsCommand alloc] initWithPlayerPath:v6];

  [(_MPCPlayerInsertItemsCommand *)v7 setDevices:v5];

  return v7;
}

+ (id)resetCommandForPlayerPath:(id)a3 devices:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(_MPCPlayerCommand *)[_MPCPlayerResetTracklistCommand alloc] initWithPlayerPath:v6];

  [(_MPCPlayerResetTracklistCommand *)v7 setDevices:v5];

  return v7;
}

@end