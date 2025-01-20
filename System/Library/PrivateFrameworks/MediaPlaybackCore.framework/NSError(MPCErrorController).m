@interface NSError(MPCErrorController)
- (BOOL)mpc_isAirplayDeviceBusyError;
- (BOOL)mpc_isAirplayStreamingNotSupportedError;
- (BOOL)mpc_isAssetUnavailableFailure;
- (BOOL)mpc_isFileDoesNotExistError;
- (BOOL)mpc_isKeyServerNoOfflineSlotError;
- (BOOL)mpc_isLeaseTakenError;
- (BOOL)mpc_isNetworkReachabilityError;
- (BOOL)mpc_isNoPermissionsToReadFileError;
- (BOOL)mpc_isQueueLoadingFailure;
- (BOOL)mpc_isRentalContentRequiresDownloadError;
- (BOOL)mpc_isResourceUnavailableError;
- (BOOL)mpc_isSubscriptionRequiredError;
- (BOOL)mpc_isUnrecoverableAssetLoadingError;
- (uint64_t)mpc_isStreamingSlotError;
@end

@implementation NSError(MPCErrorController)

- (BOOL)mpc_isNoPermissionsToReadFileError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1102);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isFileDoesNotExistError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1100);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isNetworkReachabilityError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", @"MPCError", 56);
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)mpc_isStreamingSlotError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F88F40]);
  uint64_t v2 = [v1 code];

  return ((unint64_t)(v2 - 3047) < 0xE) & (0x3005u >> (v2 + 25));
}

- (BOOL)mpc_isKeyServerNoOfflineSlotError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F88F40], -1004);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isLeaseTakenError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F89028], 3084);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isSubscriptionRequiredError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", @"MPCError", 17);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isResourceUnavailableError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1008);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isUnrecoverableAssetLoadingError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F88F00]);
  uint64_t v2 = [v1 code];

  return v2 == -7403 || v2 == -7007 || v2 == -7004;
}

- (BOOL)mpc_isAssetUnavailableFailure
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", @"MPCError", 24);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isQueueLoadingFailure
{
  BOOL v2 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F110C0], 3);
  if (v2)
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", @"MPCError", 62);
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (BOOL)mpc_isAirplayStreamingNotSupportedError
{
  BOOL v2 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263EF98B0], -11870);
  if (v2)
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08410], -17226);
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (BOOL)mpc_isRentalContentRequiresDownloadError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08410], -17220);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isAirplayDeviceBusyError
{
  v1 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08410], -12926);
  BOOL v2 = v1 != 0;

  return v2;
}

@end