@interface UAFAsset(Additions)
- (BOOL)_assetMetadataAvailable;
- (id)_assetId;
- (uint64_t)_preferOverServer;
- (uint64_t)_supportsAutoPunctuation;
- (uint64_t)_supportsContinuousListening;
- (uint64_t)_supportsEmojiRecognition;
- (uint64_t)_supportsOnDeviceSearch;
- (uint64_t)_supportsVoiceCommands;
@end

@implementation UAFAsset(Additions)

- (BOOL)_assetMetadataAvailable
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)_assetId
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:*MEMORY[0x1E4FB35C8]];

  return v2;
}

- (uint64_t)_preferOverServer
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:@"PreferOverServer"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_supportsVoiceCommands
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:@"SupportsVoiceCommands"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_supportsOnDeviceSearch
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:@"SupportsOnDeviceSearch"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_supportsEmojiRecognition
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:@"SupportsEmojiRecognition"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_supportsContinuousListening
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:@"SupportsContinuousListening"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_supportsAutoPunctuation
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 objectForKey:@"SupportsAutoPunctuation"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

@end