@interface SLService
+ (id)allServices;
+ (id)serviceForServiceType:(id)a3;
- (BOOL)hasAccounts;
- (BOOL)isFirstClassService;
- (BOOL)supportsImageURL:(id)a3;
- (BOOL)supportsVideoURL:(id)a3;
- (id)accountType;
- (id)activityImage;
- (id)activityTitle;
- (id)composeViewController;
- (id)serviceType;
- (int64_t)maximumImageCount;
- (int64_t)maximumImageDataSize;
- (int64_t)maximumURLCount;
- (int64_t)maximumVideoCount;
- (int64_t)maximumVideoDataSize;
- (int64_t)maximumVideoTimeLimit;
@end

@implementation SLService

+ (id)serviceForServiceType:(id)a3
{
  v3 = +[SLRemoteService remoteServiceForTypeIdentifier:a3];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

+ (id)allServices
{
  v2 = +[SLRemoteService remoteServices];
  v3 = [v2 valueForKey:@"serviceType"];
  v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (BOOL)hasAccounts
{
  v2 = [(SLService *)self accountTypeIdentifier];
  int v3 = [MEMORY[0x1E4F179C8] accountsWithAccountTypeIdentifierExist:v2];
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F179C8]);
    int v3 = [v4 updateExistenceCacheOfAccountWithTypeIdentifier:v2];
  }
  return v3 != 2;
}

- (BOOL)isFirstClassService
{
  return 1;
}

- (id)serviceType
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Someone didn't override -serviceType" userInfo:0];
  objc_exception_throw(v2);
}

- (id)accountType
{
  return 0;
}

- (int64_t)maximumURLCount
{
  return -1;
}

- (int64_t)maximumImageCount
{
  return -1;
}

- (int64_t)maximumImageDataSize
{
  return -1;
}

- (int64_t)maximumVideoCount
{
  return -1;
}

- (int64_t)maximumVideoDataSize
{
  return -1;
}

- (int64_t)maximumVideoTimeLimit
{
  return -1;
}

- (BOOL)supportsImageURL:(id)a3
{
  return 0;
}

- (BOOL)supportsVideoURL:(id)a3
{
  return 0;
}

- (id)activityTitle
{
  return 0;
}

- (id)activityImage
{
  return 0;
}

- (id)composeViewController
{
  return 0;
}

@end