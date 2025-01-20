@interface NSString(CSBundles)
- (BOOL)isPommes;
- (uint64_t)cs_isCslinguistics;
- (uint64_t)cs_isPommesCtl;
- (uint64_t)isMail;
- (uint64_t)isPhotos;
@end

@implementation NSString(CSBundles)

- (uint64_t)isMail
{
  return [a1 isEqualToString:@"com.apple.mobilemail"];
}

- (uint64_t)isPhotos
{
  return [a1 isEqualToString:@"com.apple.mobileslideshow"];
}

- (BOOL)isPommes
{
  return ([a1 isMail] & 1) != 0
      || ([a1 isPhotos] & 1) != 0
      || (objc_msgSend(a1, "cs_isPommesCtl") & 1) != 0
      || [a1 isEqualToString:@"com.apple.mobilesafari"]
      && (_os_feature_enabled_impl() & 1) != 0;
}

- (uint64_t)cs_isPommesCtl
{
  return [a1 isEqualToString:@"com.apple.pommesctl"];
}

- (uint64_t)cs_isCslinguistics
{
  return [a1 isEqualToString:@"com.apple.cslinguistics"];
}

@end