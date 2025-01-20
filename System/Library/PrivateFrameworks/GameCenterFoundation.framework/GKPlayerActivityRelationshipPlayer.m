@interface GKPlayerActivityRelationshipPlayer
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityRelationshipPlayer)initWithDictionary:(id)a3;
- (GKPlayerInternal)playerInternal;
- (id)description;
- (void)setPlayerInternal:(id)a3;
@end

@implementation GKPlayerActivityRelationshipPlayer

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GKPlayerActivityRelationshipPlayer_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_337 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_337, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_336;

  return v2;
}

void __61__GKPlayerActivityRelationshipPlayer_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipPlayer;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6 = @"playerInternal";
  v7[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_336;
  secureCodedPropertyKeys_sSecureCodedKeys_336 = (uint64_t)v2;
}

- (GKPlayerActivityRelationshipPlayer)initWithDictionary:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipPlayer;
  v3 = [(GKPlayerActivityRelationshipBase *)&v11 initWithDictionary:a3];
  if (v3)
  {
    v4 = objc_opt_new();
    objc_super v5 = [(GKPlayerActivityRelationshipBase *)v3 name];
    [v4 setAlias:v5];

    v6 = [(GKPlayerActivityRelationshipBase *)v3 identifier];
    [v4 setPlayerID:v6];

    v7 = [(GKPlayerActivityRelationshipBase *)v3 image];

    if (v7)
    {
      v12 = @"template";
      v8 = [(GKPlayerActivityRelationshipBase *)v3 image];
      v13[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [v4 setPhotos:v9];
    }
    [(GKPlayerActivityRelationshipPlayer *)v3 setPlayerInternal:v4];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GKPlayerActivityRelationshipPlayer;
  v4 = [(GKPlayerActivityRelationshipBase *)&v8 description];
  objc_super v5 = [(GKPlayerActivityRelationshipPlayer *)self playerInternal];
  v6 = [v3 stringWithFormat:@"%@ \nplayer: %@", v4, v5];

  return v6;
}

- (GKPlayerInternal)playerInternal
{
  return self->_playerInternal;
}

- (void)setPlayerInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end