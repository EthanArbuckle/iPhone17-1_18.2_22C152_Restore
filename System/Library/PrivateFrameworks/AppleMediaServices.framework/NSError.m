@interface NSError
- (BOOL)amsd_isCKChangeTokenExpiredError;
- (BOOL)amsd_isCKManateeUnavailable;
- (BOOL)amsd_isCKMissingManateeIdentity;
- (BOOL)amsd_isCKPartialFailureError;
- (BOOL)amsd_isCKServerRecordChangedError;
- (BOOL)amsd_isCKThrottledError;
- (BOOL)amsd_isCKUnknownItemError;
@end

@implementation NSError

- (BOOL)amsd_isCKChangeTokenExpiredError
{
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:21];
}

- (BOOL)amsd_isCKMissingManateeIdentity
{
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:112];
}

- (BOOL)amsd_isCKManateeUnavailable
{
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:110];
}

- (BOOL)amsd_isCKPartialFailureError
{
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:2];
}

- (BOOL)amsd_isCKServerRecordChangedError
{
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:14];
}

- (BOOL)amsd_isCKThrottledError
{
  if ([(NSError *)self ams_hasDomain:CKErrorDomain code:7]) {
    return 1;
  }
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:6];
}

- (BOOL)amsd_isCKUnknownItemError
{
  return [(NSError *)self ams_hasDomain:CKErrorDomain code:11];
}

@end