@interface NSString(SKAdNetworkAdditions)
+ (__CFString)skan_versionStringFromSKAdNetworkVersion:()SKAdNetworkAdditions;
- (uint64_t)skan_version;
@end

@implementation NSString(SKAdNetworkAdditions)

- (uint64_t)skan_version
{
  v1 = objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[.,]", @".", 1024, 0, objc_msgSend(a1, "length"));
  if (skan_version_onceToken != -1) {
    dispatch_once(&skan_version_onceToken, &__block_literal_global_0);
  }
  v2 = [(id)skan_version_versionMap objectForKeyedSubscript:v1];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (__CFString)skan_versionStringFromSKAdNetworkVersion:()SKAdNetworkAdditions
{
  v3 = @"2.2";
  uint64_t v4 = @"3.0";
  v5 = @"4.0";
  if (a3 != 400) {
    v5 = 0;
  }
  if (a3 != 300) {
    uint64_t v4 = v5;
  }
  if (a3 != 202) {
    v3 = v4;
  }
  v6 = @"2.1";
  if (a3 != 201) {
    v6 = 0;
  }
  if (a3 == 200) {
    v6 = @"2.0";
  }
  if (a3 == 100) {
    v6 = @"1.0";
  }
  if (a3 <= 201) {
    return v6;
  }
  else {
    return v3;
  }
}

@end