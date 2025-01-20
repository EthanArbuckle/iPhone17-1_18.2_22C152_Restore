@interface GKScopedIDs
+ (BOOL)availableForPlayerID:(id)a3;
+ (id)makeNonpersistentWithPlayerID:(id)a3 gameBundleID:(id)a4;
+ (id)makePersistentWithPlayerID:(id)a3 gameBundleID:(id)a4 gamePlayerID:(id)a5 teamPlayerID:(id)a6;
+ (id)makePlayerIDtoScopedIDsDictFromScopedIDs:(id)a3;
+ (id)secureCodedPropertyKeys;
- (BOOL)arePersistent;
- (BOOL)isForPlayerID:(id)a3 gameBundleID:(id)a4;
- (GKScopedIDs)initWithNonpersistentPlayerID:(id)a3 gameBundleID:(id)a4 salt:(int)a5;
- (GKScopedIDs)initWithPersistentPlayerID:(id)a3 gameBundleID:(id)a4 gamePlayerID:(id)a5 teamPlayerID:(id)a6;
- (NSNumber)createdPersistent;
- (NSString)gameBundleID;
- (NSString)gamePlayerID;
- (NSString)playerID;
- (NSString)teamPlayerID;
- (void)setCreatedPersistent:(id)a3;
@end

@implementation GKScopedIDs

+ (id)makePlayerIDtoScopedIDsDictFromScopedIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "playerID", (void)v14);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];

  return v12;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_12 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_12, &__block_literal_global_48);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_12;

  return v2;
}

void __38__GKScopedIDs_secureCodedPropertyKeys__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"createdPersistent";
  v3[0] = objc_opt_class();
  v2[1] = @"playerID";
  v3[1] = objc_opt_class();
  v2[2] = @"gameBundleID";
  v3[2] = objc_opt_class();
  v2[3] = @"gamePlayerID";
  v3[3] = objc_opt_class();
  v2[4] = @"teamPlayerID";
  v3[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_12;
  secureCodedPropertyKeys_sSecureCodedKeys_12 = v0;
}

- (GKScopedIDs)initWithPersistentPlayerID:(id)a3 gameBundleID:(id)a4 gamePlayerID:(id)a5 teamPlayerID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GKScopedIDs;
  long long v15 = [(GKScopedIDs *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [NSNumber numberWithBool:1];
    createdPersistent = v15->_createdPersistent;
    v15->_createdPersistent = (NSNumber *)v16;

    objc_storeStrong((id *)&v15->_playerID, a3);
    objc_storeStrong((id *)&v15->_gameBundleID, a4);
    objc_storeStrong((id *)&v15->_gamePlayerID, a5);
    objc_storeStrong((id *)&v15->_teamPlayerID, a6);
  }

  return v15;
}

- (GKScopedIDs)initWithNonpersistentPlayerID:(id)a3 gameBundleID:(id)a4 salt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GKScopedIDs;
  id v11 = [(GKScopedIDs *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [NSNumber numberWithBool:0];
    createdPersistent = v11->_createdPersistent;
    v11->_createdPersistent = (NSNumber *)v12;

    objc_storeStrong((id *)&v11->_playerID, a3);
    objc_storeStrong((id *)&v11->_gameBundleID, a4);
    id v14 = [NSString stringWithFormat:@"A:%@:%@:%d", v9, v10, v5];
    long long v15 = [v14 _gkSHA256HashData];
    uint64_t v16 = [v15 _gkAsHexString];
    gamePlayerID = v11->_gamePlayerID;
    v11->_gamePlayerID = (NSString *)v16;

    v18 = [NSString stringWithFormat:@"T:%@:%@:%d", v9, v10, v5];
    objc_super v19 = [v18 _gkSHA256HashData];
    uint64_t v20 = [v19 _gkAsHexString];
    teamPlayerID = v11->_teamPlayerID;
    v11->_teamPlayerID = (NSString *)v20;
  }
  return v11;
}

- (BOOL)arePersistent
{
  v2 = [(GKScopedIDs *)self createdPersistent];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isForPlayerID:(id)a3 gameBundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(GKScopedIDs *)self playerID];
  int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    id v10 = [(GKScopedIDs *)self gameBundleID];
    char v11 = [v10 isEqualToString:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)makePersistentWithPlayerID:(id)a3 gameBundleID:(id)a4 gamePlayerID:(id)a5 teamPlayerID:(id)a6
{
  id v6 = 0;
  if (a3 && a4 && a5 && a6)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v6 = [[GKScopedIDs alloc] initWithPersistentPlayerID:v13 gameBundleID:v12 gamePlayerID:v11 teamPlayerID:v10];
  }

  return v6;
}

+ (id)makeNonpersistentWithPlayerID:(id)a3 gameBundleID:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  id v6 = (__CFString *)a3;
  id v7 = [GKScopedIDs alloc];
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = @"UnknownID";
  }
  if (v5) {
    int v9 = v5;
  }
  else {
    int v9 = @"UnknownBundleID";
  }
  id v10 = [MEMORY[0x1E4F28F80] processInfo];
  id v11 = -[GKScopedIDs initWithNonpersistentPlayerID:gameBundleID:salt:](v7, "initWithNonpersistentPlayerID:gameBundleID:salt:", v8, v9, [v10 processIdentifier]);

  return v11;
}

+ (BOOL)availableForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3
    || ([v3 isEqualToString:@"AnonymousID"] & 1) != 0
    || ([v4 isEqualToString:@"AutoMatchID"] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = [v4 isEqualToString:@"UnknownID"] ^ 1;
  }

  return v5;
}

- (NSNumber)createdPersistent
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCreatedPersistent:(id)a3
{
}

- (NSString)playerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)gameBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)gamePlayerID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)teamPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamPlayerID, 0);
  objc_storeStrong((id *)&self->_gamePlayerID, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);

  objc_storeStrong((id *)&self->_createdPersistent, 0);
}

@end