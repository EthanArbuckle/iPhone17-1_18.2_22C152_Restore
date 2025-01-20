@interface NSBundle(MediaRemoteUI)
+ (__CFString)mru_FaceTimeBundleIdentifier;
+ (__CFString)mru_TVRemoteIdentifier;
+ (id)mediaRemoteUIBundle;
+ (uint64_t)mru_isFaceTimeBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isHome;
+ (uint64_t)mru_isHomeBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isMediaRemoteDaemonBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isMediaRemoteUI;
+ (uint64_t)mru_isMediaRemoteUIBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isMusicBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isPodcastsBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isProximityControl;
+ (uint64_t)mru_isProximityControlBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isSiri;
+ (uint64_t)mru_isSiriBundleIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isSoundScapesIdentifier:()MediaRemoteUI;
+ (uint64_t)mru_isSpringBoard;
+ (uint64_t)mru_isSpringBoardBundleIdentifier:()MediaRemoteUI;
@end

@implementation NSBundle(MediaRemoteUI)

+ (uint64_t)mru_isFaceTimeBundleIdentifier:()MediaRemoteUI
{
  v4 = [a3 lowercaseString];
  v5 = objc_msgSend(a1, "mru_FaceTimeBundleIdentifier");
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

+ (__CFString)mru_FaceTimeBundleIdentifier
{
  return @"com.apple.facetime";
}

+ (id)mediaRemoteUIBundle
{
  if (mediaRemoteUIBundle___once != -1) {
    dispatch_once(&mediaRemoteUIBundle___once, &__block_literal_global_32);
  }
  v0 = (void *)mediaRemoteUIBundle___mediaRemoteUIBundle;

  return v0;
}

+ (uint64_t)mru_isHome
{
  v2 = [a1 mainBundle];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = objc_msgSend(a1, "mru_isHomeBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isSpringBoard
{
  v2 = [a1 mainBundle];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = objc_msgSend(a1, "mru_isSpringBoardBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isMediaRemoteUI
{
  v2 = [a1 mainBundle];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = objc_msgSend(a1, "mru_isMediaRemoteUIBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isProximityControl
{
  v2 = [a1 mainBundle];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = objc_msgSend(a1, "mru_isProximityControlBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isSiri
{
  v2 = [a1 mainBundle];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = objc_msgSend(a1, "mru_isSiriBundleIdentifier:", v3);

  return v4;
}

+ (__CFString)mru_TVRemoteIdentifier
{
  return @"com.apple.TVRemoteUIService";
}

+ (uint64_t)mru_isHomeBundleIdentifier:()MediaRemoteUI
{
  v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.home"];

  return v4;
}

+ (uint64_t)mru_isSpringBoardBundleIdentifier:()MediaRemoteUI
{
  v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.springboard"];

  return v4;
}

+ (uint64_t)mru_isMediaRemoteUIBundleIdentifier:()MediaRemoteUI
{
  v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.mediaremoteui"];

  return v4;
}

+ (uint64_t)mru_isMediaRemoteDaemonBundleIdentifier:()MediaRemoteUI
{
  v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.mediaremoted"];

  return v4;
}

+ (uint64_t)mru_isProximityControlBundleIdentifier:()MediaRemoteUI
{
  id v3 = a3;
  uint64_t v4 = [v3 lowercaseString];
  if ([v4 isEqualToString:@"com.apple.proximitycontrold"])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 lowercaseString];
    uint64_t v5 = [v6 isEqualToString:@"com.apple.pcviewservice"];
  }
  return v5;
}

+ (uint64_t)mru_isSiriBundleIdentifier:()MediaRemoteUI
{
  id v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.siri"];

  return v4;
}

+ (uint64_t)mru_isSoundScapesIdentifier:()MediaRemoteUI
{
  id v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.soundscapes"];

  return v4;
}

+ (uint64_t)mru_isMusicBundleIdentifier:()MediaRemoteUI
{
  return MRMediaRemoteApplicationIsSystemMediaApplication();
}

+ (uint64_t)mru_isPodcastsBundleIdentifier:()MediaRemoteUI
{
  return MRMediaRemoteApplicationIsSystemPodcastApplication();
}

@end