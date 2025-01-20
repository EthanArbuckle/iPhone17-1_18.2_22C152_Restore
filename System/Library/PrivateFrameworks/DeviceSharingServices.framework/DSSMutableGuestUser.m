@interface DSSMutableGuestUser
+ (BOOL)supportsSecureCoding;
+ (id)newGuestUser;
- (DSSMutableGuestUser)init;
- (DSSMutableGuestUser)initWithCoder:(id)a3;
- (void)setHasSeenGuestSafetyNotice:(BOOL)a3;
- (void)setLastSwitchTime:(id)a3;
- (void)setManagedAssetsProfileUUID:(id)a3;
- (void)setSynced:(BOOL)a3;
- (void)setTemporaryUser:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation DSSMutableGuestUser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newGuestUser
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DSSMutableGuestUser;
  id v2 = objc_msgSendSuper2(&v5, sel_newGuestUser);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (DSSMutableGuestUser)init
{
  v3.receiver = self;
  v3.super_class = (Class)DSSMutableGuestUser;
  return [(DSSGuestUser *)&v3 init];
}

- (DSSMutableGuestUser)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSSMutableGuestUser;
  return [(DSSGuestUser *)&v4 initWithCoder:a3];
}

- (void)setUuid:(id)a3
{
}

- (void)setManagedAssetsProfileUUID:(id)a3
{
}

- (void)setHasSeenGuestSafetyNotice:(BOOL)a3
{
  self->super._hasSeenGuestSafetyNotice = a3;
}

- (void)setLastSwitchTime:(id)a3
{
}

- (void)setTemporaryUser:(BOOL)a3
{
  self->super._temporaryUser = a3;
}

- (void)setSynced:(BOOL)a3
{
  self->super._synced = a3;
}

@end