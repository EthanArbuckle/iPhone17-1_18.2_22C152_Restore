@interface GenerateBuiltInAppInstallID
@end

@implementation GenerateBuiltInAppInstallID

void ___GenerateBuiltInAppInstallID_block_invoke()
{
  id v4 = (id)_CFCopySystemVersionDictionary();
  v0 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  v1 = [v4 objectForKeyedSubscript:@"ReleaseType"];
  uint64_t v2 = [NSString stringWithFormat:@"%@/%@", v0, v1];
  v3 = (void *)_GenerateBuiltInAppInstallID_osVersion;
  _GenerateBuiltInAppInstallID_osVersion = v2;
}

@end