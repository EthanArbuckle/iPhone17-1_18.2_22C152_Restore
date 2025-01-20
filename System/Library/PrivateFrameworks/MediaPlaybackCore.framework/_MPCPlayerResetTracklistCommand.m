@interface _MPCPlayerResetTracklistCommand
- (BOOL)supportsSetQueueCommand;
- (NSArray)devices;
- (NSArray)specializedIntents;
- (NSDictionary)supportedSpecializedQueues;
- (NSSet)supportedCustomDataQueueIdentifiers;
- (NSSet)supportedQueueTypes;
- (id)clear;
- (id)clearUpNextItems;
- (id)replaceWithPlaybackIntent:(id)a3;
- (id)replaceWithPlaybackIntent:(id)a3 replaceIntent:(int64_t)a4;
- (void)setDevices:(id)a3;
- (void)setSupportedCustomDataQueueIdentifiers:(id)a3;
- (void)setSupportedQueueTypes:(id)a3;
- (void)setSupportedSpecializedQueues:(id)a3;
- (void)setSupportsSetQueueCommand:(BOOL)a3;
@end

@implementation _MPCPlayerResetTracklistCommand

- (void)setSupportsSetQueueCommand:(BOOL)a3
{
  self->_supportsSetQueueCommand = a3;
}

- (void)setSupportedSpecializedQueues:(id)a3
{
}

- (void)setSupportedQueueTypes:(id)a3
{
}

- (void)setSupportedCustomDataQueueIdentifiers:(id)a3
{
}

- (id)clearUpNextItems
{
  v2 = [(_MPCPlayerCommand *)self response];
  v3 = [v2 builder];
  v4 = [v2 chain];
  int v5 = [v3 playerCommandEnabled:0 command:144 chain:v4];

  if (v5)
  {
    v6 = [MPCPlayerCommandRequest alloc];
    v7 = [v2 controller];
    v8 = [v2 request];
    v9 = [v8 label];
    v10 = [(MPCPlayerCommandRequest *)v6 initWithMediaRemoteCommand:144 options:MEMORY[0x263EFFA78] controller:v7 label:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCustomDataQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedQueueTypes, 0);
  objc_storeStrong((id *)&self->_supportedSpecializedQueues, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

- (NSSet)supportedCustomDataQueueIdentifiers
{
  return self->_supportedCustomDataQueueIdentifiers;
}

- (NSSet)supportedQueueTypes
{
  return self->_supportedQueueTypes;
}

- (BOOL)supportsSetQueueCommand
{
  return self->_supportsSetQueueCommand;
}

- (NSDictionary)supportedSpecializedQueues
{
  return self->_supportedSpecializedQueues;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (id)replaceWithPlaybackIntent:(id)a3 replaceIntent:(int64_t)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(_MPCPlayerCommand *)self response];
  if (v7 && ![(_MPCPlayerResetTracklistCommand *)self supportsSetQueueCommand]
    || [v6 tracklistSource] == 100 && !_os_feature_enabled_impl())
  {
    v17 = 0;
    goto LABEL_20;
  }
  v8 = [(_MPCPlayerCommand *)self playerPath];
  char v9 = [v8 isInProcess];

  if (v9) {
    goto LABEL_6;
  }
  uint64_t v18 = [v6 tracklistSource];
  int v10 = 0;
  if (v18 <= 3)
  {
    if (v18 == 1)
    {
      v30 = [(_MPCPlayerResetTracklistCommand *)self supportedQueueTypes];
      char v31 = [v30 containsObject:&unk_26CC19098];

      if (v31) {
        goto LABEL_6;
      }
      v23 = [(_MPCPlayerResetTracklistCommand *)self supportedCustomDataQueueIdentifiers];
      v24 = v23;
      v25 = @"com.apple.music.playbackqueue.radio";
    }
    else
    {
      if (v18 != 3) {
        goto LABEL_7;
      }
      v21 = [(_MPCPlayerResetTracklistCommand *)self supportedQueueTypes];
      char v22 = [v21 containsObject:&unk_26CC19098];

      if (v22)
      {
LABEL_6:
        int v10 = 1;
        goto LABEL_7;
      }
      v23 = [(_MPCPlayerResetTracklistCommand *)self supportedCustomDataQueueIdentifiers];
      v24 = v23;
      v25 = @"com.apple.music.playbackqueue.tracklist";
    }
LABEL_33:
    int v10 = [v23 containsObject:v25];

    goto LABEL_7;
  }
  switch(v18)
  {
    case 4:
      v26 = [(_MPCPlayerResetTracklistCommand *)self supportedQueueTypes];
      char v27 = [v26 containsObject:&unk_26CC19098];

      if (v27) {
        goto LABEL_6;
      }
      v23 = [(_MPCPlayerResetTracklistCommand *)self supportedCustomDataQueueIdentifiers];
      v24 = v23;
      v25 = @"com.apple.mediaplayer.playbackcontext";
      goto LABEL_33;
    case 100:
      v28 = [(_MPCPlayerResetTracklistCommand *)self supportedQueueTypes];
      char v29 = [v28 containsObject:&unk_26CC19098];

      if (v29) {
        goto LABEL_6;
      }
      v23 = [(_MPCPlayerResetTracklistCommand *)self supportedCustomDataQueueIdentifiers];
      v24 = v23;
      v25 = @"com.apple.music.playbackqueue.sharedlistening";
      goto LABEL_33;
    case 500:
      goto LABEL_6;
  }
LABEL_7:
  v32[0] = @"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent";
  v32[1] = @"MPCPlayerCommandRequestMediaRemoteOptionReplaceIntent";
  v33[0] = v6;
  v11 = [NSNumber numberWithInteger:a4];
  v33[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  if (v7)
  {
    if (!v10)
    {
      v17 = 0;
      goto LABEL_19;
    }
    v13 = [MPCPlayerCommandRequest alloc];
    v14 = [v7 controller];
    v15 = [v7 request];
    v16 = [v15 label];
    v17 = [(MPCPlayerCommandRequest *)v13 initWithMediaRemoteCommand:122 options:v12 controller:v14 label:v16];
  }
  else
  {
    v19 = [MPCPlayerCommandRequest alloc];
    v14 = [(_MPCPlayerCommand *)self playerPath];
    v17 = [(MPCPlayerCommandRequest *)v19 initWithMediaRemoteCommand:122 options:v12 playerPath:v14 label:@"presumptuous command"];
  }

LABEL_19:
LABEL_20:

  return v17;
}

- (id)replaceWithPlaybackIntent:(id)a3
{
  return [(_MPCPlayerResetTracklistCommand *)self replaceWithPlaybackIntent:a3 replaceIntent:1];
}

- (id)clear
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = [(_MPCPlayerCommand *)self response];
  if (v3
    && ([(_MPCPlayerResetTracklistCommand *)self supportedQueueTypes],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 containsObject:&unk_26CC19080],
        v4,
        !v5))
  {
    v12 = 0;
  }
  else
  {
    MRSystemAppPlaybackQueueCreate();
    MRSystemAppPlaybackQueueSetReplaceIntent();
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    uint64_t v14 = *MEMORY[0x263F54DA8];
    v15[0] = ExternalRepresentation;
    v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v8 = [MPCPlayerCommandRequest alloc];
    char v9 = [v3 controller];
    int v10 = [v3 request];
    v11 = [v10 label];
    v12 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:122 options:v7 controller:v9 label:v11];
  }

  return v12;
}

- (NSArray)specializedIntents
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

@end