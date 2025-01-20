@interface TKSmartCardTokenSession
- (TKSmartCard)smartCard;
- (TKSmartCardTokenSession)initWithToken:(id)a3;
- (id)name;
- (void)beginRequest;
- (void)endRequest;
@end

@implementation TKSmartCardTokenSession

- (TKSmartCardTokenSession)initWithToken:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardTokenSession;
  v3 = [(TKTokenSession *)&v9 initWithToken:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(TKTokenSession *)v3 token];
    uint64_t v6 = [v5 smartCard];
    smartCard = v4->_smartCard;
    v4->_smartCard = (TKSmartCard *)v6;
  }
  return v4;
}

- (void)beginRequest
{
  v4.receiver = self;
  v4.super_class = (Class)TKSmartCardTokenSession;
  [(TKTokenSession *)&v4 beginRequest];
  errorCard = self->_errorCard;
  self->_errorCard = 0;
}

- (TKSmartCard)smartCard
{
  v3 = [(TKTokenSession *)self token];
  errorCard = self->_errorCard;
  if (errorCard) {
    goto LABEL_14;
  }
  v5 = [v3 AID];
  if (v5)
  {
    BOOL hasSession = self->_hasSession;

    if (!hasSession)
    {
      smartCard = self->_smartCard;
      id v20 = 0;
      BOOL v8 = [(TKSmartCard *)smartCard beginSessionWithError:&v20];
      id v9 = v20;
      v10 = v9;
      if (v8)
      {
        v11 = self->_smartCard;
        v12 = [v3 AID];
        id v19 = v10;
        BOOL v13 = [(TKSmartCard *)v11 selectApplication:v12 error:&v19];
        id v14 = v19;

        if (v13)
        {
          self->_BOOL hasSession = 1;
LABEL_11:

          goto LABEL_12;
        }
        [(TKSmartCard *)self->_smartCard endSession];
        if (!v14) {
          goto LABEL_12;
        }
LABEL_10:
        v15 = [[TKSmartCardWithError alloc] initWithCard:self->_smartCard error:v14];
        v16 = self->_errorCard;
        self->_errorCard = &v15->super;

        goto LABEL_11;
      }
      id v14 = v9;
      if (v9) {
        goto LABEL_10;
      }
    }
  }
LABEL_12:
  errorCard = self->_errorCard;
  if (!errorCard) {
    errorCard = self->_smartCard;
  }
LABEL_14:
  v17 = errorCard;

  return v17;
}

- (void)endRequest
{
  if (self->_hasSession)
  {
    [(TKSmartCard *)self->_smartCard endSession];
    self->_BOOL hasSession = 0;
  }
  errorCard = self->_errorCard;
  self->_errorCard = 0;

  v4.receiver = self;
  v4.super_class = (Class)TKSmartCardTokenSession;
  [(TKTokenSession *)&v4 endRequest];
}

- (id)name
{
  v2 = [(TKSmartCard *)self->_smartCard slot];
  v3 = [v2 name];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCard, 0);

  objc_storeStrong((id *)&self->_smartCard, 0);
}

@end