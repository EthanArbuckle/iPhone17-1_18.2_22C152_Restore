@interface NSError(SHError)
- (uint64_t)isShazamPublicErrorWithCode:()SHError;
- (uint64_t)sh_hasShazamKitPublicErrorDomain;
- (uint64_t)sh_isAudioDiscontinuity;
- (uint64_t)sh_isCustomCatalogInvalid;
- (uint64_t)sh_isCustomCatalogInvalidURL;
- (uint64_t)sh_isInternalError;
- (uint64_t)sh_isInvalidAudioFormat;
- (uint64_t)sh_isMatchAttemptCancelledError;
- (uint64_t)sh_isMatchAttemptFailed;
- (uint64_t)sh_isMediaLibraryError;
- (uint64_t)sh_isMediaLibraryPublicError;
- (uint64_t)sh_isPrivacyDisclosureAcknowledgementNeededError;
- (uint64_t)sh_isSignatureDurationInvalid;
- (uint64_t)sh_isSignatureInvalid;
@end

@implementation NSError(SHError)

- (uint64_t)sh_hasShazamKitPublicErrorDomain
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.ShazamKit"];

  return v2;
}

- (uint64_t)sh_isMediaLibraryPublicError
{
  uint64_t result = objc_msgSend(a1, "sh_isMediaLibraryError");
  if (result) {
    return [a1 code] == 500;
  }
  return result;
}

- (uint64_t)isShazamPublicErrorWithCode:()SHError
{
  uint64_t result = objc_msgSend(a1, "sh_hasShazamKitPublicErrorDomain");
  if (result) {
    return [a1 code] == a3;
  }
  return result;
}

- (uint64_t)sh_isInvalidAudioFormat
{
  return [a1 isShazamPublicErrorWithCode:100];
}

- (uint64_t)sh_isAudioDiscontinuity
{
  return [a1 isShazamPublicErrorWithCode:101];
}

- (uint64_t)sh_isSignatureInvalid
{
  return [a1 isShazamPublicErrorWithCode:200];
}

- (uint64_t)sh_isSignatureDurationInvalid
{
  return [a1 isShazamPublicErrorWithCode:201];
}

- (uint64_t)sh_isMatchAttemptFailed
{
  return [a1 isShazamPublicErrorWithCode:202];
}

- (uint64_t)sh_isCustomCatalogInvalid
{
  return [a1 isShazamPublicErrorWithCode:300];
}

- (uint64_t)sh_isCustomCatalogInvalidURL
{
  return [a1 isShazamPublicErrorWithCode:301];
}

- (uint64_t)sh_isInternalError
{
  return [a1 isShazamPublicErrorWithCode:500];
}

- (uint64_t)sh_isMediaLibraryError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.ShazamKit.ShazamLibrary"];

  return v2;
}

- (uint64_t)sh_isMatchAttemptCancelledError
{
  uint64_t result = objc_msgSend(a1, "sh_hasShazamKitPublicErrorDomain");
  if (result) {
    return [a1 code] == 203;
  }
  return result;
}

- (uint64_t)sh_isPrivacyDisclosureAcknowledgementNeededError
{
  uint64_t result = objc_msgSend(a1, "sh_hasShazamKitPublicErrorDomain");
  if (result) {
    return [a1 code] == 204;
  }
  return result;
}

@end