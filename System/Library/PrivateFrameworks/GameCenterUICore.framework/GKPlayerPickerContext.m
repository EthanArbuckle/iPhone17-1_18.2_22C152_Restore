@interface GKPlayerPickerContext
+ (id)secureCodedPropertyKeys;
- (GKMatch)match;
- (NSArray)excludedPlayers;
- (int64_t)maxPlayers;
- (int64_t)pickerOrigin;
- (void)setExcludedPlayers:(id)a3;
- (void)setMatch:(id)a3;
- (void)setMaxPlayers:(int64_t)a3;
- (void)setPickerOrigin:(int64_t)a3;
@end

@implementation GKPlayerPickerContext

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys;
  return v2;
}

void __48__GKPlayerPickerContext_secureCodedPropertyKeys__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"maxPlayers";
  v6[0] = objc_opt_class();
  v5[1] = @"excludedPlayers";
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v6[1] = v2;
  v5[2] = @"pickerOrigin";
  v6[2] = objc_opt_class();
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys;
  secureCodedPropertyKeys_sSecureCodedKeys = v3;
}

- (GKMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (int64_t)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(int64_t)a3
{
  self->_maxPlayers = a3;
}

- (NSArray)excludedPlayers
{
  return self->_excludedPlayers;
}

- (void)setExcludedPlayers:(id)a3
{
}

- (int64_t)pickerOrigin
{
  return self->_pickerOrigin;
}

- (void)setPickerOrigin:(int64_t)a3
{
  self->_pickerOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedPlayers, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

@end