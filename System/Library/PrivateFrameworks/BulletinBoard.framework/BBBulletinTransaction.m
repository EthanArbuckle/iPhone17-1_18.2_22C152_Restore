@interface BBBulletinTransaction
+ (id)transactionWithBulletinID:(id)a3;
- (BBBulletinTransaction)initWithBulletinID:(id)a3;
- (NSString)bulletinID;
- (id)description;
- (unint64_t)incrementTransactionID;
- (unint64_t)transactionID;
@end

@implementation BBBulletinTransaction

+ (id)transactionWithBulletinID:(id)a3
{
  id v3 = a3;
  v4 = [[BBBulletinTransaction alloc] initWithBulletinID:v3];

  return v4;
}

- (BBBulletinTransaction)initWithBulletinID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBBulletinTransaction;
  v5 = [(BBBulletinTransaction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bulletinID = v5->_bulletinID;
    v5->_bulletinID = (NSString *)v6;

    v5->_transactionID = 1;
  }

  return v5;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)BBBulletinTransaction;
  id v4 = [(BBBulletinTransaction *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: bulletinID: %@; transactionID: %llu",
    v4,
    self->_bulletinID,
  v5 = self->_transactionID);

  return v5;
}

- (unint64_t)incrementTransactionID
{
  unint64_t transactionID = self->_transactionID;
  if (transactionID == -1)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"BBObserverProxy.m", 676, @"You sent NSUIntegerMax transactions to a single observer for bulletinID %@. You lose.", self->_bulletinID object file lineNumber description];

    unint64_t transactionID = self->_transactionID;
  }
  unint64_t result = transactionID + 1;
  self->_unint64_t transactionID = transactionID + 1;
  return result;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
}

@end