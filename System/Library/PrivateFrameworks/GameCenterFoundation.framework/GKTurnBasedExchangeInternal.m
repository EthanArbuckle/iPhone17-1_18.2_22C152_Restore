@interface GKTurnBasedExchangeInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (NSArray)recipientIndexes;
- (NSArray)replies;
- (NSData)data;
- (NSDate)completionDate;
- (NSDate)sendDate;
- (NSDate)timeoutDate;
- (NSDictionary)localizableMessage;
- (NSString)exchangeID;
- (NSString)statusString;
- (unint64_t)hash;
- (unsigned)senderIndex;
- (void)setCompletionDate:(id)a3;
- (void)setData:(id)a3;
- (void)setExchangeID:(id)a3;
- (void)setLocalizableMessage:(id)a3;
- (void)setRecipientIndexes:(id)a3;
- (void)setReplies:(id)a3;
- (void)setSendDate:(id)a3;
- (void)setSenderIndex:(unsigned __int8)a3;
- (void)setStatusString:(id)a3;
- (void)setTimeoutDate:(id)a3;
@end

@implementation GKTurnBasedExchangeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_369 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_369, &__block_literal_global_371_0);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_368;

  return v2;
}

void __54__GKTurnBasedExchangeInternal_secureCodedPropertyKeys__block_invoke()
{
  v17[10] = *MEMORY[0x1E4F143B8];
  v16[0] = @"exchangeID";
  v17[0] = objc_opt_class();
  v16[1] = @"senderIndex";
  v17[1] = objc_opt_class();
  v16[2] = @"statusString";
  v17[2] = objc_opt_class();
  v16[3] = @"recipientIndexes";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v17[3] = v3;
  v16[4] = @"localizableMessage";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v17[4] = v9;
  v16[5] = @"data";
  v17[5] = objc_opt_class();
  v16[6] = @"sendDate";
  v17[6] = objc_opt_class();
  v16[7] = @"timeoutDate";
  v17[7] = objc_opt_class();
  v16[8] = @"completionDate";
  v17[8] = objc_opt_class();
  v16[9] = @"replies";
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v17[9] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:10];

  v15 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_368;
  secureCodedPropertyKeys_sSecureCodedKeys_368 = v14;
}

- (unint64_t)hash
{
  return [(NSString *)self->_exchangeID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    exchangeID = self->_exchangeID;
    uint64_t v6 = [v4 exchangeID];
    BOOL v7 = exchangeID == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)exchangeID
{
  return self->_exchangeID;
}

- (void)setExchangeID:(id)a3
{
}

- (unsigned)senderIndex
{
  return self->_senderIndex;
}

- (void)setSenderIndex:(unsigned __int8)a3
{
  self->_senderIndex = a3;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
}

- (NSArray)recipientIndexes
{
  return self->_recipientIndexes;
}

- (void)setRecipientIndexes:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDate)timeoutDate
{
  return self->_timeoutDate;
}

- (void)setTimeoutDate:(id)a3
{
}

- (NSArray)replies
{
  return self->_replies;
}

- (void)setReplies:(id)a3
{
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (void)setSendDate:(id)a3
{
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_recipientIndexes, 0);

  objc_storeStrong((id *)&self->_exchangeID, 0);
}

@end