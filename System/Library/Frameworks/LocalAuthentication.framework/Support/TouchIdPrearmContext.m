@interface TouchIdPrearmContext
+ (void)prearmForUser:(id)a3 request:(id)a4 reply:(id)a5;
- (NSError)failure;
- (TouchIdPrearmContext)initWithUserId:(id)a3;
- (void)setFailure:(id)a3;
@end

@implementation TouchIdPrearmContext

- (TouchIdPrearmContext)initWithUserId:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TouchIdPrearmContext;
  v5 = [(TouchIdPrearmContext *)&v18 init];
  if (v5)
  {
    v6 = +[BiometryHelper touchIdInstance];
    v7 = [v6 device];

    id v17 = 0;
    uint64_t v8 = [v7 createMatchOperationWithError:&v17];
    id v9 = v17;
    matchOperation = v5->_matchOperation;
    v5->_matchOperation = (BKMatchOperation *)v8;

    [(BKMatchOperation *)v5->_matchOperation setPriority:50];
    [(BKMatchOperation *)v5->_matchOperation setPurpose:5];
    [(BKMatchOperation *)v5->_matchOperation setUserID:v4];
    v11 = v5->_matchOperation;
    id v16 = v9;
    unsigned __int8 v12 = [(BKMatchOperation *)v11 startWithError:&v16];
    id v13 = v16;
    id v14 = v16;

    if ((v12 & 1) == 0) {
      objc_storeStrong((id *)&v5->_failure, v13);
    }
  }
  return v5;
}

+ (void)prearmForUser:(id)a3 request:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, TouchIdPrearmContext *, id))a5;
  v10 = +[ContextManager sharedInstance];
  id v23 = 0;
  v11 = [v10 loadModule:1 error:&v23];
  id v12 = v23;

  if (v11)
  {
    id v13 = [v11 mechanismManager];
    CFStringRef v24 = @"UserId";
    id v25 = v7;
    id v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v22 = v12;
    v15 = [v13 loadMechanism:1 initParams:v14 request:v8 error:&v22];
    id v16 = v22;

    id v21 = v16;
    LODWORD(v14) = [v15 isAvailableForPurpose:0 error:&v21];
    id v12 = v21;

    if (v14)
    {
      id v17 = [[TouchIdPrearmContext alloc] initWithUserId:v7];
      objc_super v18 = [(TouchIdPrearmContext *)v17 failure];

      if (v18)
      {
        v19 = [(TouchIdPrearmContext *)v17 failure];
        uint64_t v20 = +[LAErrorHelper errorWithCode:-1 message:@"Failed to prearm" suberror:v19];

        id v17 = 0;
        id v12 = (id)v20;
      }
    }
    else
    {
      id v17 = 0;
    }
    v9[2](v9, v17, v12);
  }
  else
  {
    v9[2](v9, 0, v12);
  }
}

- (NSError)failure
{
  return self->_failure;
}

- (void)setFailure:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);

  objc_storeStrong((id *)&self->_matchOperation, 0);
}

@end