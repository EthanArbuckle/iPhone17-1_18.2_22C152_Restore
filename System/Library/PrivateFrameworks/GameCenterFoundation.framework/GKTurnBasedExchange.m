@interface GKTurnBasedExchange
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKTurnBasedExchange)initWithInternalRepresentation:(id)a3 daemonProxy:(id)a4;
- (GKTurnBasedExchangeInternal)internal;
- (GKTurnBasedExchangeStatus)status;
- (GKTurnBasedMatch)match;
- (GKTurnBasedParticipant)sender;
- (NSArray)recipients;
- (NSArray)replies;
- (NSString)message;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)_updateInternalFromMatchInternal:(id)a3;
- (void)cancelWithLocalizableMessageKey:(NSString *)key arguments:(NSArray *)arguments completionHandler:(void *)completionHandler;
- (void)replyWithLocalizableMessageKey:(NSString *)key arguments:(NSArray *)arguments data:(NSData *)data completionHandler:(void *)completionHandler;
- (void)setInternal:(id)a3;
- (void)setMatch:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setReplies:(id)a3;
- (void)setSender:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKTurnBasedExchange

- (GKTurnBasedExchange)initWithInternalRepresentation:(id)a3 daemonProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[GKInternalRepresentation internalRepresentation];
  }
  v11.receiver = self;
  v11.super_class = (Class)GKTurnBasedExchange;
  v8 = [(GKTurnBasedExchange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_storeStrong((id *)&v9->_daemonProxy, a4);
  }

  return v9;
}

- (NSString)message
{
  daemonProxy = self->_daemonProxy;
  v4 = [(GKTurnBasedExchangeInternal *)self->_internal localizableMessage];
  v5 = [(GKTurnBasedExchange *)self match];
  id v6 = [v5 bundleID];
  id v7 = [(GKDaemonProxy *)daemonProxy localizedMessageFromDictionary:v4 forBundleID:v6];

  return (NSString *)v7;
}

- (GKTurnBasedExchangeStatus)status
{
  v2 = [(GKTurnBasedExchange *)self internal];
  v3 = [v2 statusString];

  if (v3)
  {
    if ([v3 isEqualToString:@"A"])
    {
      GKTurnBasedExchangeStatus v4 = GKTurnBasedExchangeStatusActive;
    }
    else if (([v3 isEqualToString:@"C"] & 1) != 0 {
           || ([v3 isEqualToString:@"T"] & 1) != 0)
    }
    {
      GKTurnBasedExchangeStatus v4 = GKTurnBasedExchangeStatusComplete;
    }
    else if ([v3 isEqualToString:@"X"])
    {
      GKTurnBasedExchangeStatus v4 = GKTurnBasedExchangeStatusCanceled;
    }
    else
    {
      GKTurnBasedExchangeStatus v4 = GKTurnBasedExchangeStatusUnknown;
    }
  }
  else
  {
    GKTurnBasedExchangeStatus v4 = GKTurnBasedExchangeStatusUnknown;
  }

  return v4;
}

- (unint64_t)hash
{
  v2 = [(GKTurnBasedExchange *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GKTurnBasedExchange *)self internal];
    id v6 = [v4 internal];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (description_onceToken_622 != -1) {
    dispatch_once(&description_onceToken_622, &__block_literal_global_624);
  }
  unint64_t v3 = (void *)description_statusEnumLookupDict;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKTurnBasedExchange status](self, "status"));
  uint64_t v5 = [v3 objectForKey:v4];

  id v6 = @"INVALID";
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  v34 = v6;
  char v7 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v33 = self;
  v8 = [(GKTurnBasedExchange *)self recipients];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v14 = NSString;
        v15 = [v13 internal];
        uint64_t v16 = [v15 playerID];
        v17 = (void *)v16;
        if (v16) {
          v18 = (void *)v16;
        }
        else {
          v18 = v13;
        }
        v19 = [v14 stringWithFormat:@"%@", v18];
        [v7 addObject:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v10);
  }

  v32 = NSString;
  v20 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v20);
  v38 = [(GKTurnBasedExchange *)v33 exchangeID];
  v37 = [(GKTurnBasedExchange *)v33 sendDate];
  v36 = [(GKTurnBasedExchange *)v33 timeoutDate];
  v35 = [(GKTurnBasedExchange *)v33 completionDate];
  v31 = [(GKTurnBasedExchange *)v33 sender];
  v21 = [v31 internal];
  v22 = [v21 player];
  v23 = [v22 playerID];
  v24 = v23;
  if (!v23)
  {
    v24 = [(GKTurnBasedExchange *)v33 sender];
  }
  v25 = [(GKTurnBasedExchange *)v33 message];
  v26 = [(GKTurnBasedExchange *)v33 data];
  uint64_t v27 = [v26 length];
  v28 = [(GKTurnBasedExchange *)v33 replies];
  v29 = [v32 stringWithFormat:@"<%@ %p - exchangeID:%@ status:%@ sendDate:%@ timeoutDate:%@ completionDate:%@ sender:%@ recipients:%@ message:%@ data.length:%ld replies:%@>", v39, v33, v38, v34, v37, v36, v35, v24, v7, v25, v27, v28];

  if (!v23) {

  }
  return v29;
}

void __34__GKTurnBasedExchange_description__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1E7EB70;
  v2[1] = &unk_1F1E7EB88;
  v3[0] = @"Unknown";
  v3[1] = @"Active";
  v2[2] = &unk_1F1E7EBA0;
  v2[3] = &unk_1F1E7EBB8;
  v3[2] = @"Complete";
  v3[3] = @"X-Canceled";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)description_statusEnumLookupDict;
  description_statusEnumLookupDict = v0;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedExchange;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  char v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedExchange;
  uint64_t v5 = -[GKTurnBasedExchange methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(GKTurnBasedExchange *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedExchange;
  if (-[GKTurnBasedExchange respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKTurnBasedExchange *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      int v4 = GKApplicationLinkedOnOrAfter(393216, 657920);
      if (v4)
      {
        LOBYTE(v4) = +[GKTurnBasedExchangeInternal instancesRespondToSelector:a3];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  char v5 = [(GKTurnBasedExchange *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKTurnBasedExchange *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (void)_updateInternalFromMatchInternal:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(a3, "exchanges", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [(GKTurnBasedExchange *)self exchangeID];
        uint64_t v11 = [v9 exchangeID];
        int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          [(GKTurnBasedExchange *)self setInternal:v9];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)cancelWithLocalizableMessageKey:(NSString *)key arguments:(NSArray *)arguments completionHandler:(void *)completionHandler
{
  id v8 = key;
  objc_super v9 = arguments;
  objc_super v10 = completionHandler;
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 2121, "-[GKTurnBasedExchange cancelWithLocalizableMessageKey:arguments:completionHandler:]");
  int v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  long long v13 = +[GKPreferences shared];
  uint64_t v14 = [v13 multiplayerAllowedPlayerType];

  if (v14)
  {
    if (!v8)
    {
      id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil or invalid localizable message key" userInfo:0];
      objc_exception_throw(v20);
    }
    if (!v9) {
      objc_super v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    long long v15 = [MEMORY[0x1E4F28B50] mainBundle];
    long long v16 = [v15 _gkLocalizedStringForKey:v8 defaultValue:v8 arguments:v9];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke;
    v24[3] = &unk_1E646F940;
    v25 = v8;
    objc_super v9 = v9;
    v26 = v9;
    id v27 = v16;
    v28 = self;
    id v29 = v12;
    id v17 = v16;
    [v29 perform:v24];
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    [v12 setError:v15];
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_3;
  v21[3] = &unk_1E646E578;
  id v22 = v12;
  id v23 = v10;
  v21[4] = self;
  id v18 = v12;
  id v19 = v10;
  [v18 notifyOnMainQueueWithBlock:v21];
}

void __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKTurnBasedMatch _localizableMessageWithKey:*(void *)(a1 + 32) arguments:*(void *)(a1 + 40) defaultMessage:*(void *)(a1 + 48)];
  uint64_t v5 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v6 = [v5 turnBasedService];
  uint64_t v7 = [*(id *)(a1 + 56) exchangeID];
  id v8 = [*(id *)(a1 + 56) match];
  objc_super v9 = [v8 internal];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6470270;
  objc_super v10 = *(void **)(a1 + 64);
  v12[4] = *(void *)(a1 + 56);
  id v13 = v10;
  id v14 = v3;
  id v11 = v3;
  [v6 cancelExchange:v7 withMessage:v4 match:v9 handler:v12];
}

void __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = a2;
    [v5 _updateInternalFromMatchInternal:v6];
    uint64_t v7 = [*(id *)(a1 + 32) match];
    [v7 setInternal:v6];
  }
  [*(id *)(a1 + 40) setError:v8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __83__GKTurnBasedExchange_cancelWithLocalizableMessageKey_arguments_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) match];
  id v4 = [v3 matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v4];

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)replyWithLocalizableMessageKey:(NSString *)key arguments:(NSArray *)arguments data:(NSData *)data completionHandler:(void *)completionHandler
{
  objc_super v10 = key;
  id v11 = arguments;
  int v12 = data;
  id v13 = completionHandler;
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 2154, "-[GKTurnBasedExchange replyWithLocalizableMessageKey:arguments:data:completionHandler:]");
  long long v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  long long v16 = +[GKPreferences shared];
  uint64_t v17 = [v16 multiplayerAllowedPlayerType];

  if (v17)
  {
    if (!v10)
    {
      id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil or invalid localizable message key" userInfo:0];
      objc_exception_throw(v23);
    }
    if (!v11) {
      id v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    id v18 = [MEMORY[0x1E4F28B50] mainBundle];
    id v19 = [v18 _gkLocalizedStringForKey:v10 defaultValue:v10 arguments:v11];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke;
    v27[3] = &unk_1E646DA90;
    v28 = v10;
    id v11 = v11;
    id v29 = v11;
    id v30 = v19;
    v31 = self;
    v32 = v12;
    id v33 = v15;
    id v20 = v19;
    [v33 perform:v27];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    [v15 setError:v18];
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_3;
  v24[3] = &unk_1E646E578;
  id v25 = v15;
  id v26 = v13;
  void v24[4] = self;
  id v21 = v15;
  id v22 = v13;
  [v21 notifyOnMainQueueWithBlock:v24];
}

void __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKTurnBasedMatch _localizableMessageWithKey:*(void *)(a1 + 32) arguments:*(void *)(a1 + 40) defaultMessage:*(void *)(a1 + 48)];
  uint64_t v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v6 = [v5 turnBasedService];
  uint64_t v7 = [*(id *)(a1 + 56) exchangeID];
  uint64_t v8 = *(void *)(a1 + 64);
  objc_super v9 = [*(id *)(a1 + 56) match];
  objc_super v10 = [v9 internal];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6470270;
  v12[4] = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 72);
  id v14 = v3;
  id v11 = v3;
  [v6 replyToExchange:v7 withMessage:v4 data:v8 match:v10 handler:v12];
}

void __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = a2;
    [v5 _updateInternalFromMatchInternal:v6];
    uint64_t v7 = [*(id *)(a1 + 32) match];
    [v7 setInternal:v6];
  }
  [*(id *)(a1 + 40) setError:v8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __87__GKTurnBasedExchange_replyWithLocalizableMessageKey_arguments_data_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v3 = [*(id *)(a1 + 32) match];
  id v4 = [v3 matchID];
  [v2 postNotificationName:@"GKInternalTurnBasedGameEvent" object:v4];

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (GKTurnBasedParticipant)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (GKTurnBasedExchangeInternal)internal
{
  return (GKTurnBasedExchangeInternal *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternal:(id)a3
{
}

- (NSArray)replies
{
  return self->_replies;
}

- (void)setReplies:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

@end