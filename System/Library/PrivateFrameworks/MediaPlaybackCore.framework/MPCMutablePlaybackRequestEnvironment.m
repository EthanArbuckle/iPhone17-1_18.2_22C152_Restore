@interface MPCMutablePlaybackRequestEnvironment
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setDelegationProperties:(id)a3;
- (void)setRequestingBundleIdentifier:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPCMutablePlaybackRequestEnvironment

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(MPCPlaybackRequestEnvironment *)self _copyWithPlaybackRequestEnvironmentClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(MPCPlaybackRequestEnvironment *)self _copyWithPlaybackRequestEnvironmentClass:v4];
}

- (void)setUserIdentity:(id)a3
{
  if (self->super._userIdentity != a3)
  {
    uint64_t v4 = (ICUserIdentity *)[a3 copy];
    userIdentity = self->super._userIdentity;
    self->super._userIdentity = v4;
  }
}

- (void)setRequestingBundleVersion:(id)a3
{
  if (self->super._requestingBundleVersion != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    requestingBundleVersion = self->super._requestingBundleVersion;
    self->super._requestingBundleVersion = v4;
  }
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  if (self->super._requestingBundleIdentifier != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    requestingBundleIdentifier = self->super._requestingBundleIdentifier;
    self->super._requestingBundleIdentifier = v4;
  }
}

- (void)setDelegationProperties:(id)a3
{
  if (self->super._delegationProperties != a3)
  {
    uint64_t v4 = (MPCPlaybackDelegationProperties *)[a3 copy];
    delegationProperties = self->super._delegationProperties;
    self->super._delegationProperties = v4;
  }
}

- (void)setClientVersion:(id)a3
{
  if (self->super._clientVersion != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    clientVersion = self->super._clientVersion;
    self->super._clientVersion = v4;
  }
}

- (void)setClientIdentifier:(id)a3
{
  if (self->super._clientIdentifier != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    clientIdentifier = self->super._clientIdentifier;
    self->super._clientIdentifier = v4;
  }
}

@end