@interface PIVAuthOperation
- (BOOL)finishWithError:(id *)a3;
- (PIVAuthOperation)initWithSession:(id)a3;
- (PIVTokenSession)session;
@end

@implementation PIVAuthOperation

- (PIVAuthOperation)initWithSession:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PIVAuthOperation;
  v6 = [(PIVAuthOperation *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = [v5 smartCard];
    [(PIVAuthOperation *)v7 setSmartCard:v8];

    v9 = [(PIVAuthOperation *)v7 session];
    v10 = [v9 smartCard];
    unsigned __int8 v18 = [v10 cla];
    int v19 = 142606368;
    uint64_t v20 = -1;

    v11 = +[NSData dataWithBytes:&v18 length:13];
    [(PIVAuthOperation *)v7 setAPDUTemplate:v11];

    id v12 = objc_alloc_init((Class)TKSmartCardPINFormat);
    [(PIVAuthOperation *)v7 setPINFormat:v12];

    v13 = [(PIVAuthOperation *)v7 PINFormat];
    [v13 setCharset:1];

    v14 = [(PIVAuthOperation *)v7 PINFormat];
    [v14 setMinPINLength:6];

    v15 = [(PIVAuthOperation *)v7 PINFormat];
    [v15 setMaxPINLength:8];
  }
  return v7;
}

- (BOOL)finishWithError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PIVAuthOperation;
  BOOL v4 = [(PIVAuthOperation *)&v9 finishWithError:a3];
  if (v4)
  {
    id v5 = [(PIVAuthOperation *)self session];
    v6 = [v5 smartCard];
    [v6 setContext:&__kCFBooleanTrue];

    v7 = [(PIVAuthOperation *)self session];
    [v7 setAuthState:1];
  }
  return v4;
}

- (PIVTokenSession)session
{
  return (PIVTokenSession *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end