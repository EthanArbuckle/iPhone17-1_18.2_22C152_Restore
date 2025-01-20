@interface GKFriendRequestInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (NSDate)date;
- (NSString)message;
- (int)defaultFamiliarity;
- (void)setDate:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation GKFriendRequestInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GKFriendRequestInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_601 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_601, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_600;

  return v2;
}

void __50__GKFriendRequestInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___GKFriendRequestInternal;
  v1 = objc_msgSendSuper2(&v6, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v7[0] = @"date";
  uint64_t v3 = objc_opt_class();
  v7[1] = @"message";
  v8[0] = v3;
  v8[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 addEntriesFromDictionary:v4];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_600;
  secureCodedPropertyKeys_sSecureCodedKeys_600 = (uint64_t)v2;
}

- (int)defaultFamiliarity
{
  return 3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end