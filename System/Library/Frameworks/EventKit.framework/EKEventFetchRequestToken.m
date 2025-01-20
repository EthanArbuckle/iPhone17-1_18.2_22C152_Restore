@interface EKEventFetchRequestToken
- (EKEventFetchRequestToken)initWithEventStore:(id)a3 token:(int)a4;
- (EKEventStore)eventStore;
- (unsigned)token;
- (void)cancel;
@end

@implementation EKEventFetchRequestToken

- (void).cxx_destruct
{
}

- (EKEventFetchRequestToken)initWithEventStore:(id)a3 token:(int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKEventFetchRequestToken;
  v7 = [(EKEventFetchRequestToken *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_eventStore, v6);
    v8->_token = a4;
  }

  return v8;
}

- (void)cancel
{
  id v4 = [(EKEventFetchRequestToken *)self eventStore];
  v3 = [v4 connection];
  objc_msgSend(v3, "cancelRemoteOperation:", -[EKEventFetchRequestToken token](self, "token"));
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (unsigned)token
{
  return self->_token;
}

@end