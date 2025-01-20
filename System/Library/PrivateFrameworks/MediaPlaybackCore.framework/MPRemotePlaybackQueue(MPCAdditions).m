@interface MPRemotePlaybackQueue(MPCAdditions)
+ (id)inProcessPlaybackContext:()MPCAdditions;
- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:;
- (void)getRemoteRepresentationForPlayerPath:()MPCAdditions completion:;
@end

@implementation MPRemotePlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  v6 = (void *)MEMORY[0x263F087E8];
  v7 = a4;
  objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 58, @"RemotePlaybackQueue doesn't support conversion to music playback context: %@", a1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void, id))a4)[2](v7, 0, v8);
}

- (void)getRemoteRepresentationForPlayerPath:()MPCAdditions completion:
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__MPRemotePlaybackQueue_MPCAdditions__getRemoteRepresentationForPlayerPath_completion___block_invoke;
  v7[3] = &unk_2643C3E98;
  id v8 = 0;
  id v9 = v5;
  id v6 = v5;
  [a1 getMusicPlaybackContextWithOptions:0 completion:v7];
}

+ (id)inProcessPlaybackContext:()MPCAdditions
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionaryWithCapacity:3];
  [v5 setObject:v4 forKeyedSubscript:@"playbackContext"];
  id v6 = [v4 siriReferenceIdentifier];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F54CA0]];

  v7 = [v4 privateListeningOverride];

  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54D40]];
  id v8 = objc_alloc(MEMORY[0x263F11D80]);
  id v9 = objc_opt_new();
  v10 = (void *)[v8 initWithIdentifier:@"InProcess-com.apple.mediaplayer.playbackcontext" data:v9 options:v5];

  return v10;
}

@end