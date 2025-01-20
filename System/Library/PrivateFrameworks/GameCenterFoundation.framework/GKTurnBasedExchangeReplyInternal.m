@interface GKTurnBasedExchangeReplyInternal
+ (id)secureCodedPropertyKeys;
- (NSData)data;
- (NSDate)replyDate;
- (NSDictionary)localizableMessage;
- (unsigned)recipientIndex;
- (void)setData:(id)a3;
- (void)setLocalizableMessage:(id)a3;
- (void)setRecipientIndex:(unsigned __int8)a3;
- (void)setReplyDate:(id)a3;
@end

@implementation GKTurnBasedExchangeReplyInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_443 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_443, &__block_literal_global_445);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_442;

  return v2;
}

void __59__GKTurnBasedExchangeReplyInternal_secureCodedPropertyKeys__block_invoke()
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0, @"recipientIndex", @"localizableMessage");
  v9[1] = v5;
  v8[2] = @"data";
  v9[2] = objc_opt_class();
  v8[3] = @"replyDate";
  v9[3] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  v7 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_442;
  secureCodedPropertyKeys_sSecureCodedKeys_442 = v6;
}

- (unsigned)recipientIndex
{
  return self->_recipientIndex;
}

- (void)setRecipientIndex:(unsigned __int8)a3
{
  self->_recipientIndex = a3;
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDate)replyDate
{
  return self->_replyDate;
}

- (void)setReplyDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyDate, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_localizableMessage, 0);
}

@end