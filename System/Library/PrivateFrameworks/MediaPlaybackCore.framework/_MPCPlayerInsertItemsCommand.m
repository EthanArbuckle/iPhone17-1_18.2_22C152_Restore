@interface _MPCPlayerInsertItemsCommand
- (BOOL)_isSupportedPlaybackIntent:(id)a3 forRemotePlayer:(BOOL)a4 atInsertionPosition:(int)a5;
- (BOOL)supportsCreateStation;
- (MPCPlayerResponseSection)lastSection;
- (MPCPlayerResponseSection)section;
- (NSArray)devices;
- (NSSet)supportedCustomDataQueueIdentifiers;
- (NSSet)supportedInsertionPositions;
- (NSSet)supportedQueueTypes;
- (id)_createRadioStationCommandRequest;
- (id)_insertWithOptions:(id)a3;
- (id)insertAfterLastSection;
- (id)insertAfterPlayingItemWithPlaybackIntent:(id)a3;
- (id)insertAtEndOfTracklistWithPlaybackIntent:(id)a3;
- (id)insertAtEndOfUpNextWithPlaybackIntent:(id)a3;
- (id)insertPlaybackIntent:(id)a3 afterItem:(id)a4;
- (id)insertWithPlaybackIntent:(id)a3;
- (void)setDevices:(id)a3;
- (void)setLastSection:(id)a3;
- (void)setSupportedCustomDataQueueIdentifiers:(id)a3;
- (void)setSupportedInsertionPositions:(id)a3;
- (void)setSupportedQueueTypes:(id)a3;
- (void)setSupportsCreateStation:(BOOL)a3;
@end

@implementation _MPCPlayerInsertItemsCommand

- (void)setSupportedQueueTypes:(id)a3
{
}

- (void)setSupportedInsertionPositions:(id)a3
{
}

- (void)setSupportedCustomDataQueueIdentifiers:(id)a3
{
}

- (id)insertAfterPlayingItemWithPlaybackIntent:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 prefersEnqueuingUsingAirPlay])
  {
    v5 = [(_MPCPlayerCommand *)self playerPath];
    v6 = [v5 route];
    int v7 = [v6 isDeviceRoute];

    if (!v7)
    {
      v18 = 0;
      goto LABEL_14;
    }
  }
  v8 = [v4 tracklistToken];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  v10 = [(_MPCPlayerCommand *)self response];
  v11 = [v10 tracklist];
  v12 = [v11 playingItem];
  v13 = [v12 metadataObject];
  v14 = [v13 identifiers];

  if (!v14)
  {
LABEL_9:

LABEL_10:
    v19 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v20 = *MEMORY[0x263F54D18];
    v26[0] = @"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent";
    v26[1] = v20;
    v27[0] = v4;
    v27[1] = &unk_26CC190B0;
    v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v14 = [v19 dictionaryWithDictionary:v21];

    v22 = [(_MPCPlayerCommand *)self response];
    v23 = [v22 tracklist];
    v24 = [v23 playingItem];
    v15 = [v24 contentItemIdentifier];

    if (v15) {
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F54CF8]];
    }
    v18 = [(_MPCPlayerInsertItemsCommand *)self _insertWithOptions:v14];
    goto LABEL_13;
  }
  v15 = [v4 tracklistToken];
  v16 = [v15 seedContentReference];
  v17 = [v16 referenceModelObjectIdentifiers];

  if (([v17 intersectsSet:v14] & 1) == 0)
  {

    goto LABEL_9;
  }
  v18 = [(_MPCPlayerInsertItemsCommand *)self _createRadioStationCommandRequest];

LABEL_13:
LABEL_14:

  return v18;
}

- (id)insertAtEndOfTracklistWithPlaybackIntent:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 prefersEnqueuingUsingAirPlay]
    && ([(_MPCPlayerCommand *)self playerPath],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 route],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isDeviceRoute],
        v6,
        v5,
        !v7))
  {
    v10 = 0;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F54D18];
    v12[0] = @"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent";
    v12[1] = v8;
    v13[0] = v4;
    v13[1] = &unk_26CC190E0;
    v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v10 = [(_MPCPlayerInsertItemsCommand *)self _insertWithOptions:v9];
  }

  return v10;
}

- (id)insertAtEndOfUpNextWithPlaybackIntent:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_MPCPlayerInsertItemsCommand *)self supportedInsertionPositions];
  int v6 = [v5 containsObject:&unk_26CC190F8];

  if (!v6) {
    goto LABEL_3;
  }
  int v7 = [(_MPCPlayerInsertItemsCommand *)self lastSection];

  if (v7
    || [v4 prefersEnqueuingUsingAirPlay]
    && ([(_MPCPlayerCommand *)self playerPath],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 route],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isDeviceRoute],
        v11,
        v10,
        !v12))
  {
LABEL_3:
    uint64_t v8 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v14 = *MEMORY[0x263F54D18];
    v21[0] = @"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent";
    v21[1] = v14;
    v22[0] = v4;
    v22[1] = &unk_26CC190F8;
    v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    v16 = [v13 dictionaryWithDictionary:v15];

    v17 = [(_MPCPlayerCommand *)self response];
    v18 = [v17 tracklist];
    v19 = [v18 playingItem];
    uint64_t v20 = [v19 contentItemIdentifier];

    if (v20) {
      [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x263F54CF8]];
    }
    uint64_t v8 = [(_MPCPlayerInsertItemsCommand *)self _insertWithOptions:v16];
  }

  return v8;
}

- (id)_insertWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(_MPCPlayerCommand *)self response];
  int v6 = [(_MPCPlayerCommand *)self playerPath];
  int v7 = [v6 isInProcess];

  if (v5)
  {
    uint64_t v8 = v7 ^ 1u;
    v9 = [v4 objectForKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent"];
    v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F54D18]];
    uint64_t v11 = [v10 integerValue];

    if ([(_MPCPlayerInsertItemsCommand *)self _isSupportedPlaybackIntent:v9 forRemotePlayer:v8 atInsertionPosition:v11])
    {
      int v12 = [MPCPlayerCommandRequest alloc];
      v13 = [v5 controller];
      uint64_t v14 = [v5 request];
      v15 = [v14 label];
      v16 = [(MPCPlayerCommandRequest *)v12 initWithMediaRemoteCommand:125 options:v4 controller:v13 label:v15];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v17 = [MPCPlayerCommandRequest alloc];
    v9 = [(_MPCPlayerCommand *)self playerPath];
    v16 = [(MPCPlayerCommandRequest *)v17 initWithMediaRemoteCommand:125 options:v4 playerPath:v9 label:@"presumptuous command"];
  }

  return v16;
}

- (BOOL)_isSupportedPlaybackIntent:(id)a3 forRemotePlayer:(BOOL)a4 atInsertionPosition:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MPCPlayerInsertItemsCommand *)self supportedInsertionPositions];
  v10 = [NSNumber numberWithInt:v5];
  int v11 = [v9 containsObject:v10];

  if (!v11) {
    goto LABEL_17;
  }
  if (v5 == 2)
  {
    int v12 = [(_MPCPlayerInsertItemsCommand *)self supportedInsertionPositions];
    char v13 = [v12 containsObject:&unk_26CC190F8];

    if (v13) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = [v8 tracklistSource];
  if (v14 > 3)
  {
    if (v14 == 4)
    {
      v25 = [(_MPCPlayerInsertItemsCommand *)self supportedQueueTypes];
      int v16 = [v25 containsObject:&unk_26CC19098];

      if (v16)
      {
        v17 = [(_MPCPlayerInsertItemsCommand *)self supportedCustomDataQueueIdentifiers];
        v18 = v17;
        v19 = @"com.apple.mediaplayer.playbackcontext";
        goto LABEL_21;
      }
    }
    else
    {
      LOBYTE(v16) = v14 == 500;
    }
    goto LABEL_18;
  }
  if (v14 != 1)
  {
    if (v14 == 3)
    {
      if (!v6)
      {
        LOBYTE(v16) = 1;
        goto LABEL_18;
      }
      v15 = [(_MPCPlayerInsertItemsCommand *)self supportedQueueTypes];
      int v16 = [v15 containsObject:&unk_26CC19098];

      if (v16)
      {
        v17 = [(_MPCPlayerInsertItemsCommand *)self supportedCustomDataQueueIdentifiers];
        v18 = v17;
        v19 = @"com.apple.music.playbackqueue.tracklist";
LABEL_21:
        LOBYTE(v16) = [v17 containsObject:v19];

        goto LABEL_18;
      }
      goto LABEL_18;
    }
LABEL_17:
    LOBYTE(v16) = 0;
    goto LABEL_18;
  }
  if (v5 != 2) {
    goto LABEL_17;
  }
  uint64_t v20 = [(_MPCPlayerInsertItemsCommand *)self supportedInsertionPositions];
  v21 = [NSNumber numberWithInt:2];
  int v22 = [v20 containsObject:v21];

  if (!v22) {
    goto LABEL_17;
  }
  v23 = [(_MPCPlayerInsertItemsCommand *)self supportedQueueTypes];
  int v16 = [v23 containsObject:&unk_26CC19110];

  if (v16 && v6)
  {
    v17 = [(_MPCPlayerInsertItemsCommand *)self supportedCustomDataQueueIdentifiers];
    v18 = v17;
    v19 = @"com.apple.music.playbackqueue.radio";
    goto LABEL_21;
  }
LABEL_18:

  return v16;
}

- (id)insertAfterLastSection
{
  v3 = [(_MPCPlayerInsertItemsCommand *)self supportedInsertionPositions];
  int v4 = [v3 containsObject:&unk_26CC190F8];

  if (v4
    && ([(_MPCPlayerInsertItemsCommand *)self lastSection],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSSet)supportedInsertionPositions
{
  return self->_supportedInsertionPositions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSection, 0);
  objc_storeStrong((id *)&self->_supportedCustomDataQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedQueueTypes, 0);
  objc_storeStrong((id *)&self->_supportedInsertionPositions, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)setLastSection:(id)a3
{
}

- (MPCPlayerResponseSection)lastSection
{
  return self->_lastSection;
}

- (NSSet)supportedCustomDataQueueIdentifiers
{
  return self->_supportedCustomDataQueueIdentifiers;
}

- (NSSet)supportedQueueTypes
{
  return self->_supportedQueueTypes;
}

- (void)setSupportsCreateStation:(BOOL)a3
{
  self->_supportsCreateStation = a3;
}

- (BOOL)supportsCreateStation
{
  return self->_supportsCreateStation;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (id)_createRadioStationCommandRequest
{
  if ([(_MPCPlayerInsertItemsCommand *)self supportsCreateStation])
  {
    v3 = [(_MPCPlayerCommand *)self response];
    int v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    uint64_t v5 = [v3 tracklist];
    BOOL v6 = [v5 playingItem];
    int v7 = [v6 contentItemIdentifier];

    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54CF8]];
    }
    id v8 = [MPCPlayerCommandRequest alloc];
    v9 = [v3 controller];
    v10 = [v3 request];
    int v11 = [v10 label];
    int v12 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:121 options:v4 controller:v9 label:v11];
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)insertWithPlaybackIntent:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = [(_MPCPlayerInsertItemsCommand *)self lastSection];

  if (!v6)
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MPCPlayerResponseTracklist.m" lineNumber:919 description:@"Invalid attempt to access insertWithPlaybackIntent [insertAfterLastSection command is nil]"];
  }
  if ([v5 prefersEnqueuingUsingAirPlay]
    && ([(_MPCPlayerCommand *)self playerPath],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [v7 route],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isDeviceRoute],
        v8,
        v7,
        !v9))
  {
    v18 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v11 = *MEMORY[0x263F54D18];
    v21[0] = @"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent";
    v21[1] = v11;
    v22[0] = v5;
    v22[1] = &unk_26CC190F8;
    int v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    char v13 = [v10 dictionaryWithDictionary:v12];

    uint64_t v14 = [(_MPCPlayerCommand *)self response];
    v15 = [v14 tracklist];
    int v16 = [v15 playingItem];
    v17 = [v16 contentItemIdentifier];

    if (v17) {
      [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x263F54CF8]];
    }
    v18 = [(_MPCPlayerInsertItemsCommand *)self _insertWithOptions:v13];
  }

  return v18;
}

- (MPCPlayerResponseSection)section
{
  int v4 = [(_MPCPlayerInsertItemsCommand *)self lastSection];

  if (!v4)
  {
    BOOL v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPCPlayerResponseTracklist.m" lineNumber:914 description:@"Invalid attempt to access section [insertAfterLastSection command is nil]"];
  }

  return [(_MPCPlayerInsertItemsCommand *)self lastSection];
}

- (id)insertPlaybackIntent:(id)a3 afterItem:(id)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 prefersEnqueuingUsingAirPlay]
    && ([(_MPCPlayerCommand *)self playerPath],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 route],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isDeviceRoute],
        v9,
        v8,
        !v10))
  {
    int v16 = 0;
  }
  else
  {
    uint64_t v11 = [v7 metadataObject];
    int v12 = [v11 identifiers];
    char v13 = [v12 contentItemID];

    if ([v13 length])
    {
      uint64_t v14 = *MEMORY[0x263F54D18];
      v18[0] = @"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent";
      v18[1] = v14;
      v19[0] = v6;
      v19[1] = &unk_26CC190C8;
      v18[2] = *MEMORY[0x263F54CD8];
      v19[2] = v13;
      v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
      int v16 = [(_MPCPlayerInsertItemsCommand *)self _insertWithOptions:v15];
    }
    else
    {
      int v16 = 0;
    }
  }

  return v16;
}

@end