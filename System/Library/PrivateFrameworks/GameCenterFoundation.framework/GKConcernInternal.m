@interface GKConcernInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKPlayerInternal)player;
- (NSString)message;
- (unint64_t)hash;
- (unsigned)concernID;
- (void)setConcernID:(unsigned int)a3;
- (void)setMessage:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation GKConcernInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_734 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_734, &__block_literal_global_736);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_733;

  return v2;
}

void __44__GKConcernInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"player";
  v3[0] = objc_opt_class();
  v2[1] = @"concernID";
  v3[1] = objc_opt_class();
  v2[2] = @"message";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_733;
  secureCodedPropertyKeys_sSecureCodedKeys_733 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int concernID = self->_concernID;
    if (concernID == [v5 concernID])
    {
      message = self->_message;
      v8 = [v5 message];
      BOOL v9 = [(NSString *)message isEqualToString:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_concernID;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (unsigned)concernID
{
  return self->_concernID;
}

- (void)setConcernID:(unsigned int)a3
{
  self->_unsigned int concernID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end