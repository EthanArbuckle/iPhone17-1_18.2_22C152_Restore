@interface MPPlaybackContext(MPCSharedListening)
- (id)getSharedListeningTracklistWithCompletion:()MPCSharedListening;
@end

@implementation MPPlaybackContext(MPCSharedListening)

- (id)getSharedListeningTracklistWithCompletion:()MPCSharedListening
{
  v3 = (void *)MEMORY[0x263F08AB8];
  id v4 = a3;
  v5 = [v3 progressWithTotalUnitCount:1];
  v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 1, @"Unsupported content (unknown subclass %@)", objc_opt_class());
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v6);

  [v5 setCompletedUnitCount:1];

  return v5;
}

@end