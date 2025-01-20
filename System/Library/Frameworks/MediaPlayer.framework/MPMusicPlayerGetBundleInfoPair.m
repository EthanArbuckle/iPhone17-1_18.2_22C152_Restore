@interface MPMusicPlayerGetBundleInfoPair
@end

@implementation MPMusicPlayerGetBundleInfoPair

void ___MPMusicPlayerGetBundleInfoPair_block_invoke()
{
  id v15 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v0 = v15;
    v1 = [v0 bundleIdentifier];
    if ([v1 length])
    {
      id v2 = v1;
      v3 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleIdentifier;
      _MPMusicPlayerGetBundleInfoPair___bundleIdentifier = (uint64_t)v2;
    }
    else
    {
      v3 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v4 = [v3 bundleIdentifier];
      v5 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleIdentifier;
      _MPMusicPlayerGetBundleInfoPair___bundleIdentifier = v4;
    }
    v6 = [v0 shortVersionString];
    v7 = [v0 bundleVersion];
    uint64_t v8 = [v6 length];
    v9 = v6;
    if (v8 || (uint64_t v10 = [v7 length], v9 = v7, v10)) {
      objc_storeStrong((id *)&_MPMusicPlayerGetBundleInfoPair___bundleVersion, v9);
    }
  }
  v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE6ED718];
  v12 = v11;
  if (_MPMusicPlayerGetBundleInfoPair___bundleIdentifier && objc_msgSend(v11, "containsObject:"))
  {
    v13 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleIdentifier;
    _MPMusicPlayerGetBundleInfoPair___bundleIdentifier = (uint64_t)&stru_1EE680640;

    v14 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleVersion;
    _MPMusicPlayerGetBundleInfoPair___bundleVersion = (uint64_t)&stru_1EE680640;
  }
}

@end