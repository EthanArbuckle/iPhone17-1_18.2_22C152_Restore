@interface MPCMutablePlaybackDelegationProperties
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setDeviceGUID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRequestUserAgent:(id)a3;
- (void)setStoreAccountID:(unint64_t)a3;
- (void)setSystemReleaseType:(int64_t)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation MPCMutablePlaybackDelegationProperties

- (void)setTimeZone:(id)a3
{
  if (self->super._timeZone != a3)
  {
    v4 = (NSTimeZone *)[a3 copy];
    timeZone = self->super._timeZone;
    self->super._timeZone = v4;
  }
}

- (void)setSystemReleaseType:(int64_t)a3
{
  self->super._systemReleaseType = a3;
}

- (void)setRequestUserAgent:(id)a3
{
  if (self->super._requestUserAgent != a3)
  {
    v4 = (NSString *)[a3 copy];
    requestUserAgent = self->super._requestUserAgent;
    self->super._requestUserAgent = v4;
  }
}

- (void)setDeviceName:(id)a3
{
  if (self->super._deviceName != a3)
  {
    v4 = (NSString *)[a3 copy];
    deviceName = self->super._deviceName;
    self->super._deviceName = v4;
  }
}

- (void)setDeviceGUID:(id)a3
{
  if (self->super._deviceGUID != a3)
  {
    v4 = (NSString *)[a3 copy];
    deviceGUID = self->super._deviceGUID;
    self->super._deviceGUID = v4;
  }
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->super._storeAccountID = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPCPlaybackDelegationProperties *)self _copyWithClass:v5 zone:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPCPlaybackDelegationProperties *)self _copyWithClass:v5 zone:a3];
}

@end