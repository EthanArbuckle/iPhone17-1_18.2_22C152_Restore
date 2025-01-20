@interface SASessionValidationFailed
- (BOOL)ad_shouldRetry;
- (int64_t)ad_afErrorCode;
@end

@implementation SASessionValidationFailed

- (int64_t)ad_afErrorCode
{
  v2 = [(SASessionValidationFailed *)self errorCode];
  if ([v2 isEqualToString:SAValidationFailedErrorCodeAppleConnectAuthFailedValue]) {
    int64_t v3 = 7000;
  }
  else {
    int64_t v3 = 3;
  }

  return v3;
}

- (BOOL)ad_shouldRetry
{
  v2 = [(SASessionValidationFailed *)self errorCode];
  if (([v2 isEqualToString:SAValidationFailedErrorCodeInvalidSessionInfoValue] & 1) != 0
    || ([v2 isEqualToString:SAValidationFailedErrorCodeInvalidValidationDataValue] & 1) != 0
    || ([v2 isEqualToString:SAValidationFailedErrorCodeInvalidFingerprintValue] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    unsigned __int8 v3 = [v2 isEqualToString:SAValidationFailedErrorCodeAppleConnectServerUnreachableValue];
  }

  return v3;
}

@end