@interface GEOMapDataSubscriptionDownloadState
@end

@implementation GEOMapDataSubscriptionDownloadState

uint64_t __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if ([*(id *)(a1 + 32) isFullyLoadedForDataType:a2 dataSubtype:a4 version:1 associatedDataCount:&v12 associatedDataSize:&v11])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v12;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v11;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t result = [*(id *)(a1 + 32) isFullyLoadedForDataType:a2 dataSubtype:a4 version:0 associatedDataCount:0 associatedDataSize:0];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0;
  }
  *a5 = v10;
  return result;
}

uint64_t __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 unsignedIntValue];
  uint64_t v9 = [v7 unsignedLongLongValue];

  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t result = [*(id *)(a1 + 32) isFullyLoadedForDataType:1024 dataSubtype:v8 version:v9 associatedDataCount:&v12 associatedDataSize:&v11];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v12;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v11;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) ^ 1;
  return result;
}

uint64_t __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 unsignedIntValue];
  uint64_t v9 = [v7 unsignedLongLongValue];

  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t result = [*(id *)(a1 + 32) isFullyLoadedForDataType:1024 dataSubtype:v8 version:v9 associatedDataCount:&v12 associatedDataSize:&v11];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v12;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v11;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) ^ 1;
  return result;
}

@end