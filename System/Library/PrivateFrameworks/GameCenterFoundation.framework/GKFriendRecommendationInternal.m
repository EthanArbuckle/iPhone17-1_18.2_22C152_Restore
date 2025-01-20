@interface GKFriendRecommendationInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (NSString)reason;
- (NSString)reason2;
- (int)defaultFamiliarity;
- (int)source;
- (unsigned)rid;
- (void)setReason2:(id)a3;
- (void)setReason:(id)a3;
- (void)setRid:(unsigned int)a3;
- (void)setSource:(int)a3;
@end

@implementation GKFriendRecommendationInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GKFriendRecommendationInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_625 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_625, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_624;

  return v2;
}

void __57__GKFriendRecommendationInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKFriendRecommendationInternal;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"reason";
  v7[0] = objc_opt_class();
  v6[1] = @"reason2";
  v7[1] = objc_opt_class();
  v6[2] = @"rid";
  v7[2] = objc_opt_class();
  v6[3] = @"source";
  v7[3] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_624;
  secureCodedPropertyKeys_sSecureCodedKeys_624 = (uint64_t)v2;
}

- (int)defaultFamiliarity
{
  return 4;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason2
{
  return self->_reason2;
}

- (void)setReason2:(id)a3
{
}

- (unsigned)rid
{
  return self->_rid;
}

- (void)setRid:(unsigned int)a3
{
  self->_rid = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason2, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end