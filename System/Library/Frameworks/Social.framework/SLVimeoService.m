@interface SLVimeoService
- (BOOL)isFirstClassService;
- (id)accountTypeIdentifier;
- (id)activityImage;
- (id)activityTitle;
- (id)serviceType;
- (int64_t)authenticationStyle;
- (int64_t)maximumImageCount;
- (int64_t)maximumURLCount;
- (int64_t)maximumVideoCount;
- (int64_t)maximumVideoDataSize;
- (int64_t)maximumVideoTimeLimit;
@end

@implementation SLVimeoService

- (id)serviceType
{
  return @"com.apple.social.vimeo";
}

- (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17870];
}

- (int64_t)authenticationStyle
{
  return 0;
}

- (BOOL)isFirstClassService
{
  return _SLServiceRegionIsChina() ^ 1;
}

- (int64_t)maximumURLCount
{
  return 0;
}

- (int64_t)maximumImageCount
{
  return 0;
}

- (int64_t)maximumVideoCount
{
  return -1;
}

- (int64_t)maximumVideoDataSize
{
  return 0x140000000;
}

- (int64_t)maximumVideoTimeLimit
{
  return -1;
}

- (id)activityTitle
{
  return @"Vimeo";
}

- (id)activityImage
{
  return 0;
}

@end