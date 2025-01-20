@interface GKFamiliarPlayerInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)allowReceivingFriendInvites;
- (id)compositeName;
- (id)firstName;
- (id)lastName;
- (void)setAllowReceivingFriendInvites:(BOOL)a3;
- (void)setCompositeName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
@end

@implementation GKFamiliarPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GKFamiliarPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_462 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_462, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_461;

  return v2;
}

void __51__GKFamiliarPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKFamiliarPlayerInternal;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"firstName";
  v7[0] = objc_opt_class();
  v6[1] = @"lastName";
  v7[1] = objc_opt_class();
  v6[2] = @"friendLevel";
  v7[2] = objc_opt_class();
  v6[3] = @"compositeName";
  v7[3] = objc_opt_class();
  v6[4] = @"allowReceivingFriendInvites";
  v7[4] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_461;
  secureCodedPropertyKeys_sSecureCodedKeys_461 = (uint64_t)v2;
}

- (id)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (id)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (id)compositeName
{
  return self->_compositeName;
}

- (void)setCompositeName:(id)a3
{
}

- (BOOL)allowReceivingFriendInvites
{
  return self->_allowReceivingFriendInvites;
}

- (void)setAllowReceivingFriendInvites:(BOOL)a3
{
  self->_allowReceivingFriendInvites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositeName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end