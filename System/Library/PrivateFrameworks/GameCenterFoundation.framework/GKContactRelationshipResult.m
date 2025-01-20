@interface GKContactRelationshipResult
+ (id)secureCodedPropertyKeys;
- (GKPlayerInternal)relatedPlayer;
- (NSString)handle;
- (int)relationship;
- (void)setHandle:(id)a3;
- (void)setRelatedPlayer:(id)a3;
- (void)setRelationship:(int)a3;
@end

@implementation GKContactRelationshipResult

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys;

  return v2;
}

void __54__GKContactRelationshipResult_secureCodedPropertyKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"handle";
  v3[0] = objc_opt_class();
  v2[1] = @"relatedPlayer";
  v3[1] = objc_opt_class();
  v2[2] = @"relationship";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys;
  secureCodedPropertyKeys_sSecureCodedKeys = v0;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (GKPlayerInternal)relatedPlayer
{
  return self->_relatedPlayer;
}

- (void)setRelatedPlayer:(id)a3
{
}

- (int)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(int)a3
{
  self->_relationship = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlayer, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end