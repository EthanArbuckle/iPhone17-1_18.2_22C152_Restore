@interface AFUtilities
+ (BOOL)isInternalBuild;
+ (BOOL)openAppleIDPrefWithLaunchParameters:(id)a3;
+ (BOOL)screenLockIsEnabled;
+ (id)bundleIdentifier;
+ (id)bundleVersion;
+ (id)currentApplicationIdentifier;
+ (id)currentApplicationVersion;
+ (id)urlForBundleIdentifier:(id)a3;
@end

@implementation AFUtilities

+ (id)bundleIdentifier
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

+ (id)bundleVersion
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 infoDictionary];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F1D020]];

  return v4;
}

+ (id)currentApplicationIdentifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  int v3 = [v2 processIdentifier];

  LODWORD(v2) = proc_pidpath(v3, buffer, 0x1000u);
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = (void *)[[NSString alloc] initWithBytes:buffer length:(int)v2 encoding:4];
  v6 = [v4 fileURLWithPath:v5];

  if (v6)
  {
    v7 = _CFBundleCopyBundleURLForExecutableURL();
    v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
    v9 = [v8 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CFF8]];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)currentApplicationVersion
{
  int v3 = [a1 currentApplicationIdentifier];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28B50];
    v5 = [a1 currentApplicationIdentifier];
    v6 = [v4 bundleWithIdentifier:v5];

    v7 = [v6 infoDictionary];
    v8 = [v7 objectForKey:*MEMORY[0x1E4F1D020]];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)urlForBundleIdentifier:(id)a3
{
  return 0;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global);
  }
  return isInternalBuild_isInternalBuild;
}

uint64_t __30__AFUtilities_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)openAppleIDPrefWithLaunchParameters:(id)a3
{
  return 0;
}

+ (BOOL)screenLockIsEnabled
{
  return 0;
}

@end