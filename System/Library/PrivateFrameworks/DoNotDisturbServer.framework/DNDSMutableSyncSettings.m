@interface DNDSMutableSyncSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setPairSyncEnabled:(BOOL)a3;
@end

@implementation DNDSMutableSyncSettings

- (void)setPairSyncEnabled:(BOOL)a3
{
  self->super._pairSyncEnabled = a3;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->super._cloudSyncEnabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSSyncSettings alloc];
  BOOL v5 = [(DNDSSyncSettings *)self isPairSyncEnabled];
  BOOL v6 = [(DNDSSyncSettings *)self isCloudSyncEnabled];
  return [(DNDSSyncSettings *)v4 initWithPairSyncEnabled:v5 cloudSyncEnabled:v6];
}

@end