@interface GKLocalPlayerInternal
+ (BOOL)supportsSecureCoding;
+ (id)minimalInternalFromSourcePlayer:(id)a3;
+ (id)secureCodedPropertyKeys;
- (BOOL)allowChallengeFriendInvites;
- (BOOL)allowMultiplayerFriendInvites;
- (BOOL)hasAcknowledgedLatestGDPR;
- (BOOL)isDefaultContactsIntegrationConsent;
- (BOOL)isDefaultNickname;
- (BOOL)isDefaultPrivacyVisibility;
- (BOOL)isFindable;
- (BOOL)isFriend;
- (BOOL)isLocalPlayer;
- (BOOL)isPhotoPending;
- (BOOL)isPurpleBuddyAccount;
- (BOOL)isUnderage;
- (id)accountName;
- (id)minimalInternal;
- (int)defaultFamiliarity;
- (int)globalFriendListAccess;
- (unint64_t)loginStatus;
- (unsigned)numberOfChallenges;
- (unsigned)numberOfRequests;
- (unsigned)numberOfTurns;
- (void)setAccountName:(id)a3;
- (void)setAllowChallengeFriendInvites:(BOOL)a3;
- (void)setAllowMultiplayerFriendInvites:(BOOL)a3;
- (void)setDefaultContactsIntegrationConsent:(BOOL)a3;
- (void)setDefaultNickname:(BOOL)a3;
- (void)setDefaultPrivacyVisibility:(BOOL)a3;
- (void)setFindable:(BOOL)a3;
- (void)setGlobalFriendListAccess:(int)a3;
- (void)setLoginStatus:(unint64_t)a3;
- (void)setNumberOfChallenges:(unsigned __int16)a3;
- (void)setNumberOfRequests:(unsigned __int16)a3;
- (void)setNumberOfTurns:(unsigned __int16)a3;
- (void)setPhotoPending:(BOOL)a3;
- (void)setPurpleBuddyAccount:(BOOL)a3;
- (void)setUnderage:(BOOL)a3;
@end

@implementation GKLocalPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GKLocalPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_520 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_520, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_519;

  return v2;
}

void __48__GKLocalPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKLocalPlayerInternal;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"accountName";
  v7[0] = objc_opt_class();
  v6[1] = @"numberOfRequests";
  v7[1] = objc_opt_class();
  v6[2] = @"numberOfTurns";
  v7[2] = objc_opt_class();
  v6[3] = @"numberOfChallenges";
  v7[3] = objc_opt_class();
  v6[4] = @"loginStatus";
  v7[4] = objc_opt_class();
  v6[5] = @"allowChallengeFriendInvites";
  v7[5] = objc_opt_class();
  v6[6] = @"allowMultiplayerFriendInvites";
  v7[6] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:7];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_519;
  secureCodedPropertyKeys_sSecureCodedKeys_519 = (uint64_t)v2;
}

- (id)minimalInternal
{
  v3 = objc_opt_class();

  return (id)[v3 minimalInternalFromSourcePlayer:self];
}

+ (id)minimalInternalFromSourcePlayer:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() internalRepresentation];
  objc_super v5 = [v3 playerID];
  [v4 setPlayerID:v5];

  v6 = [v3 scopedIDs];
  [v4 setScopedIDs:v6];

  v7 = [v3 alias];
  [v4 setAlias:v7];

  v8 = [v3 firstName];
  [v4 setFirstName:v8];

  v9 = [v3 lastName];
  [v4 setLastName:v9];

  v10 = [v3 friendLevel];
  [v4 setFriendLevel:v10];

  v11 = [v3 friendBiDirectional];
  [v4 setFriendBiDirectional:v11];

  v12 = [v3 friendPlayedWith];
  [v4 setFriendPlayedWith:v12];

  v13 = [v3 friendPlayedNearby];
  [v4 setFriendPlayedNearby:v13];

  v14 = [v3 compositeName];
  [v4 setCompositeName:v14];

  v15 = [v3 accountName];
  [v4 setAccountName:v15];

  v16 = [v3 contactsAssociationID];
  [v4 setContactsAssociationID:v16];

  objc_msgSend(v4, "setContactsIntegrationConsent:", objc_msgSend(v3, "contactsIntegrationConsent"));
  v17 = [v3 serviceLastUpdatedTimestamp];

  [v4 setServiceLastUpdatedTimestamp:v17];

  return v4;
}

- (BOOL)isPurpleBuddyAccount
{
  return HIBYTE(LOWORD(self->super.super.super._flags._value)) & 1;
}

- (void)setPurpleBuddyAccount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xFEFF | v3;
}

- (BOOL)isDefaultNickname
{
  return (LOWORD(self->super.super.super._flags._value) >> 12) & 1;
}

- (void)setDefaultNickname:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xEFFF | v3;
}

- (BOOL)isDefaultPrivacyVisibility
{
  return (LOWORD(self->super.super.super._flags._value) >> 13) & 1;
}

- (void)setDefaultPrivacyVisibility:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xDFFF | v3;
}

- (BOOL)isDefaultContactsIntegrationConsent
{
  return (LOWORD(self->super.super.super._flags._value) >> 14) & 1;
}

- (void)setDefaultContactsIntegrationConsent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xBFFF | v3;
}

- (int)globalFriendListAccess
{
  return self->super.super.super._globalFriendListAccess;
}

- (void)setGlobalFriendListAccess:(int)a3
{
  self->super.super.super._globalFriendListAccess = a3;
}

- (BOOL)isUnderage
{
  __int16 v3 = +[GKPreferences shared];
  char v4 = [v3 forceUnderage];

  if (v4) {
    LOBYTE(v5) = 1;
  }
  else {
    return (LOWORD(self->super.super.super._flags._value) >> 9) & 1;
  }
  return v5;
}

- (void)setUnderage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xFDFF | v3;
}

- (BOOL)isFindable
{
  return (LOWORD(self->super.super.super._flags._value) >> 11) & 1;
}

- (void)setFindable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xF7FF | v3;
}

- (BOOL)isPhotoPending
{
  return (LOWORD(self->super.super.super._flags._value) >> 10) & 1;
}

- (void)setPhotoPending:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xFBFF | v3;
}

- (BOOL)isLocalPlayer
{
  return 1;
}

- (BOOL)isFriend
{
  return 0;
}

- (int)defaultFamiliarity
{
  return 1;
}

- (BOOL)hasAcknowledgedLatestGDPR
{
  v2 = [(GKPlayerInternal *)self onboarding];
  char v3 = [v2 hasAcknowledgedLatestGDPR];

  return v3;
}

- (id)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (unsigned)numberOfRequests
{
  return self->_numberOfRequests;
}

- (void)setNumberOfRequests:(unsigned __int16)a3
{
  self->_numberOfRequests = a3;
}

- (unsigned)numberOfTurns
{
  return self->_numberOfTurns;
}

- (void)setNumberOfTurns:(unsigned __int16)a3
{
  self->_numberOfTurns = a3;
}

- (unsigned)numberOfChallenges
{
  return self->_numberOfChallenges;
}

- (void)setNumberOfChallenges:(unsigned __int16)a3
{
  self->_numberOfChallenges = a3;
}

- (unint64_t)loginStatus
{
  return self->_loginStatus;
}

- (void)setLoginStatus:(unint64_t)a3
{
  self->_loginStatus = a3;
}

- (BOOL)allowChallengeFriendInvites
{
  return self->_allowChallengeFriendInvites;
}

- (void)setAllowChallengeFriendInvites:(BOOL)a3
{
  self->_allowChallengeFriendInvites = a3;
}

- (BOOL)allowMultiplayerFriendInvites
{
  return self->_allowMultiplayerFriendInvites;
}

- (void)setAllowMultiplayerFriendInvites:(BOOL)a3
{
  self->_allowMultiplayerFriendInvites = a3;
}

- (void).cxx_destruct
{
}

@end