@interface GKPlayerActivityRelationshipGame
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityRelationshipGame)initWithDictionary:(id)a3;
- (GKPlayerActivityRelationshipIcon)icon;
- (NSNumber)adamId;
- (id)description;
- (void)setAdamId:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation GKPlayerActivityRelationshipGame

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__GKPlayerActivityRelationshipGame_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_408 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_408, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_407;

  return v2;
}

void __59__GKPlayerActivityRelationshipGame_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipGame;
  v1 = objc_msgSendSuper2(&v6, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v7[0] = @"adamId";
  uint64_t v3 = objc_opt_class();
  v7[1] = @"icon";
  v8[0] = v3;
  v8[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 addEntriesFromDictionary:v4];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_407;
  secureCodedPropertyKeys_sSecureCodedKeys_407 = (uint64_t)v2;
}

- (GKPlayerActivityRelationshipGame)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipGame;
  v5 = [(GKPlayerActivityRelationshipBase *)&v11 initWithDictionary:v4];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:@"adam-id"];
    [(GKPlayerActivityRelationshipGame *)v5 setAdamId:v6];

    v7 = [GKPlayerActivityRelationshipIcon alloc];
    v8 = [v4 objectForKeyedSubscript:@"icon"];
    v9 = [(GKPlayerActivityRelationshipIcon *)v7 initWithDictionary:v8];
    [(GKPlayerActivityRelationshipGame *)v5 setIcon:v9];
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)GKPlayerActivityRelationshipGame;
  id v4 = [(GKPlayerActivityRelationshipBase *)&v9 description];
  v5 = [(GKPlayerActivityRelationshipGame *)self adamId];
  objc_super v6 = [(GKPlayerActivityRelationshipGame *)self icon];
  v7 = [v3 stringWithFormat:@"%@ \nadamId: %@\nicon: %@", v4, v5, v6];

  return v7;
}

- (NSNumber)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
}

- (GKPlayerActivityRelationshipIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_adamId, 0);
}

@end