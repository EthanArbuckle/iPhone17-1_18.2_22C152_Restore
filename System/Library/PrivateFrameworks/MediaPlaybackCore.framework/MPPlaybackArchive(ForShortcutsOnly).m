@interface MPPlaybackArchive(ForShortcutsOnly)
- (uint64_t)containsAppleMusicRadioContent;
@end

@implementation MPPlaybackArchive(ForShortcutsOnly)

- (uint64_t)containsAppleMusicRadioContent
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([a1 type] != 1) {
    goto LABEL_4;
  }
  v2 = [a1 playbackSessionType];
  v3 = @"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack";
  if (v2 == @"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack")
  {
  }
  else
  {
    int v4 = [(__CFString *)v2 isEqual:@"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"];

    if (!v4)
    {
LABEL_4:
      char isKindOfClass = 0;
      return isKindOfClass & 1;
    }
  }
  v6 = (void *)MEMORY[0x263F54F00];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [a1 playbackSessionData];
  id v16 = 0;
  v12 = [v6 decodedObjectOfClasses:v10 fromData:v11 error:&v16];
  id v13 = v16;

  if (v13)
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = a1;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "MPPlaybackArchive containsAppleMusicRadioContent failed [decode failure] archive=%{public}@ error=%{public}@", buf, 0x16u);
    }
    char isKindOfClass = 0;
  }
  else
  {
    v14 = [v12 objectForKeyedSubscript:@"original"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end