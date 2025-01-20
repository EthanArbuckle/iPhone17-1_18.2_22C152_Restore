@interface GKAnonymousGuestPlayerInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)isGuestPlayer;
- (GKAnonymousGuestPlayerInternal)initWithHostPlayerInternal:(id)a3 guestIdentifier:(id)a4;
- (GKPlayerInternal)hostPlayerInternal;
- (id)guestIdentifier;
- (id)playerID;
- (void)setGuestIdentifier:(id)a3;
- (void)setHostPlayerInternal:(id)a3;
@end

@implementation GKAnonymousGuestPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAnonymousGuestPlayerInternal)initWithHostPlayerInternal:(id)a3 guestIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GKAnonymousGuestPlayerInternal;
  v9 = [(GKAnonymousGuestPlayerInternal *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hostPlayerInternal, a3);
    uint64_t v11 = [v8 copy];
    guestIdentifier = v10->_guestIdentifier;
    v10->_guestIdentifier = (NSString *)v11;

    v13 = NSString;
    v14 = +[GCFLocalizedStrings GUEST_DEFAULT_ALIAS_FORMAT];
    v15 = [v7 alias];
    v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);
    [(GKPlayerInternal *)v10 setAlias:v16];
  }
  return v10;
}

- (id)playerID
{
  v3 = NSString;
  v4 = [(GKPlayerInternal *)self->_hostPlayerInternal playerID];
  v5 = [v3 stringWithFormat:@"%@%@%@", v4, @"_", self->_guestIdentifier];

  return v5;
}

- (BOOL)isGuestPlayer
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GKAnonymousGuestPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_711 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_711, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_710;

  return v2;
}

void __57__GKAnonymousGuestPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___GKAnonymousGuestPlayerInternal;
  v1 = objc_msgSendSuper2(&v6, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v7[0] = @"guestIdentifier";
  uint64_t v3 = objc_opt_class();
  v7[1] = @"hostPlayerInternal";
  v8[0] = v3;
  v8[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 addEntriesFromDictionary:v4];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_710;
  secureCodedPropertyKeys_sSecureCodedKeys_710 = (uint64_t)v2;
}

- (GKPlayerInternal)hostPlayerInternal
{
  return self->_hostPlayerInternal;
}

- (void)setHostPlayerInternal:(id)a3
{
}

- (id)guestIdentifier
{
  return self->_guestIdentifier;
}

- (void)setGuestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestIdentifier, 0);

  objc_storeStrong((id *)&self->_hostPlayerInternal, 0);
}

@end