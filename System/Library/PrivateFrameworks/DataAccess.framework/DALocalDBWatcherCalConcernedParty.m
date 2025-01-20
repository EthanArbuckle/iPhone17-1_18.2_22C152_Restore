@interface DALocalDBWatcherCalConcernedParty
- (BOOL)isEqual:(id)a3;
- (DALocalDBWatcherCalConcernedParty)initWithConcernedParty:(id)a3 accountID:(id)a4;
- (NSString)accountID;
- (id)concernedParty;
- (unint64_t)hash;
@end

@implementation DALocalDBWatcherCalConcernedParty

- (DALocalDBWatcherCalConcernedParty)initWithConcernedParty:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DALocalDBWatcherCalConcernedParty;
  v8 = [(DALocalDBWatcherCalConcernedParty *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_concernedParty, v6);
    objc_storeStrong((id *)&v9->_accountID, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained(&self->_concernedParty);
    id v7 = [v5 concernedParty];
    if (WeakRetained == v7)
    {
      accountID = self->_accountID;
      v10 = [v5 accountID];
      char v8 = [(NSString *)accountID isEqual:v10];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained(&self->_concernedParty);
  uint64_t v4 = [WeakRetained hash];
  NSUInteger v5 = [(NSString *)self->_accountID hash] ^ v4;

  return v5;
}

- (id)concernedParty
{
  id WeakRetained = objc_loadWeakRetained(&self->_concernedParty);
  return WeakRetained;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_destroyWeak(&self->_concernedParty);
}

@end