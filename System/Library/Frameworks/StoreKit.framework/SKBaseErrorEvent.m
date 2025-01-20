@interface SKBaseErrorEvent
- (BOOL)canCreatePayload;
- (NSError)mappedError;
- (NSError)primaryError;
- (NSString)environment;
- (NSString)eventName;
- (NSString)inAppPurchaseID;
- (NSString)serverCorrelationID;
- (id)createPayload;
- (int64_t)userAction;
- (void)setEnvironment:(id)a3;
- (void)setInAppPurchaseID:(id)a3;
- (void)setMappedError:(id)a3;
- (void)setPrimaryError:(id)a3;
- (void)setServerCorrelationID:(id)a3;
- (void)setUserAction:(int64_t)a3;
@end

@implementation SKBaseErrorEvent

- (BOOL)canCreatePayload
{
  v2 = [(SKBaseErrorEvent *)self primaryError];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)createPayload
{
  if ([(SKBaseErrorEvent *)self canCreatePayload])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];
    v6 = objc_msgSend(v5, "sk_SHA1Hash");
    [v3 setObject:v6 forKeyedSubscript:0x1F08A9080];

    v7 = [(SKBaseErrorEvent *)self inAppPurchaseID];
    v8 = objc_msgSend(v7, "sk_SHA1Hash");
    [v3 setObject:v8 forKeyedSubscript:0x1F08A90E0];

    v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKBaseErrorEvent userAction](self, "userAction"));
    [v3 setObject:v9 forKeyedSubscript:0x1F08A9240];

    v10 = [(SKBaseErrorEvent *)self primaryError];

    if (v10)
    {
      v11 = [(SKBaseErrorEvent *)self primaryError];
      v12 = [v11 userInfo];
      v13 = [v12 objectForKeyedSubscript:8330580000];
      [v3 setObject:v13 forKeyedSubscript:0x1F08A9260];

      v14 = [(SKBaseErrorEvent *)self primaryError];
      v15 = [v14 userInfo];
      v16 = [v15 objectForKeyedSubscript:0x1F08A9040];
      [v3 setObject:v16 forKeyedSubscript:0x1F08A90C0];

      v17 = [(SKBaseErrorEvent *)self primaryError];
      v18 = [v17 userInfo];
      v19 = [v18 objectForKeyedSubscript:0x1F08A9060];
      [v3 setObject:v19 forKeyedSubscript:0x1F08A9220];

      v20 = NSNumber;
      v21 = [(SKBaseErrorEvent *)self primaryError];
      v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "code"));
      [v3 setObject:v22 forKeyedSubscript:0x1F08A9160];

      v23 = [(SKBaseErrorEvent *)self primaryError];
      v24 = [v23 domain];
      [v3 setObject:v24 forKeyedSubscript:0x1F08A9180];
    }
    v25 = [(SKBaseErrorEvent *)self primaryError];
    v26 = [v25 underlyingErrors];
    v27 = [v26 firstObject];

    if (v27)
    {
      v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "code"));
      [v3 setObject:v28 forKeyedSubscript:0x1F08A91A0];

      v29 = [v27 domain];
      [v3 setObject:v29 forKeyedSubscript:0x1F08A91C0];
    }
    v30 = [v27 underlyingErrors];
    v31 = [v30 firstObject];

    if (v31)
    {
      v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "code"));
      [v3 setObject:v32 forKeyedSubscript:0x1F08A91E0];

      v33 = [v31 domain];
      [v3 setObject:v33 forKeyedSubscript:0x1F08A9200];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSError)primaryError
{
  return self->_primaryError;
}

- (void)setPrimaryError:(id)a3
{
}

- (NSError)mappedError
{
  return self->_mappedError;
}

- (void)setMappedError:(id)a3
{
}

- (NSString)inAppPurchaseID
{
  return self->_inAppPurchaseID;
}

- (void)setInAppPurchaseID:(id)a3
{
}

- (NSString)serverCorrelationID
{
  return self->_serverCorrelationID;
}

- (void)setServerCorrelationID:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (int64_t)userAction
{
  return self->_userAction;
}

- (void)setUserAction:(int64_t)a3
{
  self->_userAction = a3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_serverCorrelationID, 0);
  objc_storeStrong((id *)&self->_inAppPurchaseID, 0);
  objc_storeStrong((id *)&self->_mappedError, 0);

  objc_storeStrong((id *)&self->_primaryError, 0);
}

@end