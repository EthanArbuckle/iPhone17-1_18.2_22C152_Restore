@interface DDCallKitVideoAction
+ (BOOL)facetimeAvailable;
+ (BOOL)providerIsValid:(id)a3 forHandleType:(int64_t)a4;
+ (BOOL)video;
+ (id)facetimeScheme;
+ (id)matchingSchemes;
+ (id)patchedSchemeForScheme:(id)a3;
- (id)_serviceIdentifier;
- (id)iconName;
- (id)menuName;
@end

@implementation DDCallKitVideoAction

+ (BOOL)providerIsValid:(id)a3 forHandleType:(int64_t)a4
{
  id v5 = a3;
  if ([v5 supportsAudioAndVideo]) {
    char v6 = [v5 supportsHandleType:a4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)menuName
{
  return DDLocalizedStringWithDefaultValue(@"VIDEO_CALL", 0, 0, @"Video");
}

+ (id)matchingSchemes
{
  return &unk_1EF510D40;
}

+ (id)patchedSchemeForScheme:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"facetime-audio"])
  {
    char v6 = @"facetime";
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"facetime-audio-prompt"])
  {
    char v6 = @"facetime-prompt";
    goto LABEL_9;
  }
  v7 = [a1 matchingSchemes];
  int v8 = [v7 containsObject:v5];

  if (v8) {
    char v6 = v5;
  }
  else {
LABEL_8:
  }
    char v6 = 0;
LABEL_9:

  return v6;
}

- (id)iconName
{
  return @"video";
}

+ (BOOL)facetimeAvailable
{
  return [MEMORY[0x1E4FADA88] supportsFaceTimeVideoCalls];
}

+ (BOOL)video
{
  return 1;
}

+ (id)facetimeScheme
{
  return @"facetime";
}

- (id)_serviceIdentifier
{
  v5.receiver = self;
  v5.super_class = (Class)DDCallKitVideoAction;
  v2 = [(DDCallKitAudioAction *)&v5 _serviceIdentifier];
  v3 = [v2 stringByAppendingString:@"-video"];

  return v3;
}

@end