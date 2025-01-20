@interface MPCPlaybackAccount
- (BOOL)canAutoPlay;
- (BOOL)hasCatalogPlaybackCapability;
- (BOOL)hasCloudLibraryEnabled;
- (BOOL)hasDelegationCapability;
- (BOOL)isActiveAccount;
- (BOOL)isDelegated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateListeningEnabled;
- (BOOL)usesLease;
- (ICMusicSubscriptionStatus)subscriptionStatus;
- (ICURLBag)bag;
- (ICUserIdentity)userIdentity;
- (MPCPlaybackAccount)initWithDelegatedUserIdentity:(id)a3;
- (MPCPlaybackAccount)initWithUserIdentity:(id)a3 subscriptionStatus:(id)a4;
- (NSString)hashedDSID;
- (NSString)shortHashedDSID;
- (NSString)storeFrontIdentifier;
- (id)_copyStreamerStorage:(id)a3;
- (id)_whaStreamerStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegateTokenAWithError:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)getDelegateTokenEWithTokenB:(_MPCProtoDelegateInfoTokenB *)a3 completion:(id)a4;
- (void)setActiveAccount:(BOOL)a3;
- (void)setBag:(id)a3;
- (void)setHasCloudLibraryEnabled:(BOOL)a3;
- (void)setHashedDSID:(id)a3;
- (void)setPrivateListeningEnabled:(BOOL)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)set_whaStreamerStorage:(id)a3;
@end

@implementation MPCPlaybackAccount

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL delegated = self->_delegated;
  v5 = [MPCPlaybackAccount alloc];
  userIdentity = self->_userIdentity;
  if (delegated) {
    uint64_t v7 = [(MPCPlaybackAccount *)v5 initWithDelegatedUserIdentity:userIdentity];
  }
  else {
    uint64_t v7 = [(MPCPlaybackAccount *)v5 initWithUserIdentity:userIdentity subscriptionStatus:self->_subscriptionStatus];
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(NSString *)self->_hashedDSID copy];
  v10 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v9;

  *(unsigned char *)(v8 + 8) = self->_hasCloudLibraryEnabled;
  uint64_t v11 = [(NSString *)self->_storeFrontIdentifier copy];
  v12 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v11;

  *(unsigned char *)(v8 + 9) = self->_activeAccount;
  *(unsigned char *)(v8 + 10) = self->_privateListeningEnabled;
  objc_storeStrong((id *)(v8 + 48), self->_bag);
  objc_storeStrong((id *)(v8 + 56), self->__whaStreamerStorage);
  return (id)v8;
}

- (MPCPlaybackAccount)initWithUserIdentity:(id)a3 subscriptionStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlaybackAccount;
  uint64_t v9 = [(MPCPlaybackAccount *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userIdentity, a3);
    objc_storeStrong((id *)&v10->_subscriptionStatus, a4);
  }

  return v10;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (id)description
{
  v3 = NSString;
  hashedDSID = self->_hashedDSID;
  userIdentity = self->_userIdentity;
  if (self->_activeAccount) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_delegated) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if (self->_hasCloudLibraryEnabled) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  if (self->_privateListeningEnabled) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if ([(MPCPlaybackAccount *)self canAutoPlay]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<MPCPlaybackAccount:%p hashedDSID=%@ identity=%@ isActiveAccount=%@ isDelegated=%@ cloudLibraryEnabled=%@ privateListeningEnabled=%@ canAutoPlay=%@ storeFront=%@ subscriptionStatus=%@ bag=%@>", self, hashedDSID, userIdentity, v6, v7, v8, v9, v10, self->_storeFrontIdentifier, self->_subscriptionStatus, self->_bag];
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (NSString)shortHashedDSID
{
  NSUInteger v3 = [(NSString *)self->_hashedDSID length];
  hashedDSID = self->_hashedDSID;
  if (v3 < 8)
  {
    v5 = hashedDSID;
  }
  else
  {
    v5 = [(NSString *)hashedDSID substringToIndex:7];
  }

  return v5;
}

- (BOOL)canAutoPlay
{
  if (self->_delegated) {
    return 1;
  }
  char v4 = [(ICMusicSubscriptionStatus *)self->_subscriptionStatus hasCapability:256];
  v5 = [(ICURLBag *)self->_bag radioConfiguration];
  char v6 = [v5 isContinueListeningAvailable];

  return v4 & [(MPCPlaybackAccount *)self hasCatalogPlaybackCapability] & v6;
}

- (BOOL)hasCatalogPlaybackCapability
{
  if (self->_delegated) {
    return 1;
  }
  else {
    return [(ICMusicSubscriptionStatus *)self->_subscriptionStatus hasCapability:128];
  }
}

- (BOOL)isDelegated
{
  return self->_delegated;
}

- (BOOL)isActiveAccount
{
  return self->_activeAccount;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (BOOL)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__whaStreamerStorage, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (void)set_whaStreamerStorage:(id)a3
{
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (void)setPrivateListeningEnabled:(BOOL)a3
{
  self->_privateListeningEnabled = a3;
}

- (void)setHashedDSID:(id)a3
{
}

- (void)setHasCloudLibraryEnabled:(BOOL)a3
{
  self->_hasCloudLibraryEnabled = a3;
}

- (void)setBag:(id)a3
{
}

- (void)setActiveAccount:(BOOL)a3
{
  self->_activeAccount = a3;
}

- (BOOL)usesLease
{
  if (self->_delegated) {
    return 1;
  }
  NSUInteger v3 = (void *)[objc_alloc(MEMORY[0x263F12300]) initWithICSubscriptionStatus:self->_subscriptionStatus];
  char v4 = [v3 shouldUseLease];

  return v4;
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (ICURLBag)bag
{
  return self->_bag;
}

- (id)_copyStreamerStorage:(id)a3
{
  id v5 = a3;
  char v6 = self;
  sub_21BC63FE8(a3, (uint64_t)v15);

  uint64_t v7 = v16;
  if (!v16) {
    return 0;
  }
  id v8 = __swift_project_boxed_opaque_existential_0Tm(v15, v16);
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v8, v8, v10);
  objc_super v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v12);
  v13 = (void *)sub_21BEAAE58();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return v13;
}

- (id)delegateTokenAWithError:(id *)a3
{
  NSUInteger v3 = self;
  id v4 = sub_21BC643E4();

  return v4;
}

- (void)getDelegateTokenEWithTokenB:(_MPCProtoDelegateInfoTokenB *)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  id v8 = a3;
  uint64_t v9 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C63B58, (uint64_t)v7);
}

- (id)_whaStreamerStorage
{
  return self->__whaStreamerStorage;
}

- (BOOL)hasCloudLibraryEnabled
{
  return self->_hasCloudLibraryEnabled;
}

- (BOOL)hasDelegationCapability
{
  if (self->_delegated) {
    return 0;
  }
  char v4 = [(ICMusicSubscriptionStatus *)self->_subscriptionStatus hasCapability:256];
  return [(MPCPlaybackAccount *)self hasCatalogPlaybackCapability] & v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_11;
  }
  id v5 = (id *)v4;
  char v6 = v5;
  if (!self->_delegated == (*((unsigned char *)v5 + 11) != 0)
    || !self->_activeAccount == (*((unsigned char *)v5 + 9) != 0)
    || !self->_hasCloudLibraryEnabled == (*((unsigned char *)v5 + 8) != 0)
    || !self->_privateListeningEnabled == (*((unsigned char *)v5 + 10) != 0))
  {
    goto LABEL_8;
  }
  subscriptionStatus = self->_subscriptionStatus;
  id v8 = (ICMusicSubscriptionStatus *)v5[3];
  if (subscriptionStatus == v8)
  {

LABEL_13:
    userIdentity = self->_userIdentity;
    id v15 = v6[2];
    uint64_t v16 = [MEMORY[0x263F893C8] defaultIdentityStore];
    v17 = userIdentity;
    v18 = (ICUserIdentity *)v15;
    id v19 = v16;
    v20 = v19;
    if (v17 == v18)
    {
    }
    else
    {
      if (!v17 || !v18)
      {

        char v12 = 0;
        goto LABEL_31;
      }
      int v21 = [(ICUserIdentity *)v17 isEqualToIdentity:v18 inStore:v19];

      if (!v21) {
        goto LABEL_26;
      }
    }
    hashedDSID = self->_hashedDSID;
    v23 = (NSString *)v6[4];
    if (hashedDSID == v23)
    {
    }
    else
    {
      v24 = v23;
      v25 = hashedDSID;
      int v26 = [(NSString *)v25 isEqual:v24];

      if (!v26) {
        goto LABEL_26;
      }
    }
    storeFrontIdentifier = self->_storeFrontIdentifier;
    v28 = (NSString *)v6[5];
    if (storeFrontIdentifier == v28)
    {
    }
    else
    {
      v29 = v28;
      v30 = storeFrontIdentifier;
      int v31 = [(NSString *)v30 isEqual:v29];

      if (!v31)
      {
LABEL_26:
        char v12 = 0;
LABEL_32:

        goto LABEL_9;
      }
    }
    bag = self->_bag;
    v33 = (ICURLBag *)v6[6];
    v34 = bag;
    v17 = v34;
    if (v34 == v33) {
      char v12 = 1;
    }
    else {
      char v12 = [(ICURLBag *)v34 isEqual:v33];
    }
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v9 = v8;
  uint64_t v10 = subscriptionStatus;
  int v11 = [(ICMusicSubscriptionStatus *)v10 isEqual:v9];

  if (v11) {
    goto LABEL_13;
  }
LABEL_8:
  char v12 = 0;
LABEL_9:

LABEL_11:
  return v12;
}

- (unint64_t)hash
{
  userIdentity = self->_userIdentity;
  NSUInteger v3 = [MEMORY[0x263F893C8] defaultIdentityStore];
  unint64_t v4 = [(ICUserIdentity *)userIdentity hashInStore:v3];

  return v4;
}

- (MPCPlaybackAccount)initWithDelegatedUserIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCPlaybackAccount;
  char v6 = [(MPCPlaybackAccount *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userIdentity, a3);
    *(_WORD *)&v7->_privateListeningEnabled = 257;
  }

  return v7;
}

@end