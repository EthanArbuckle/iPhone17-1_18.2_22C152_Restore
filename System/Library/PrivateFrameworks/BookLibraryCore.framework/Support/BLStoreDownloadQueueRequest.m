@interface BLStoreDownloadQueueRequest
+ (id)_downloadKindQueueIdentifierMapping;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)purchaseSuppressNetworkEvaluatorDialogs;
- (NSNumber)accountIdentifier;
- (NSNumber)purchaseStoreIdentifier;
- (NSString)queueContentsURLBagKey;
- (NSString)queueCountURLBagKey;
- (NSString)queueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAccountIdentifier:(id)a3;
- (void)setPurchaseStoreIdentifier:(id)a3;
- (void)setPurchaseSuppressNetworkEvaluatorDialogs:(BOOL)a3;
- (void)setQueueIdentifier:(id)a3;
@end

@implementation BLStoreDownloadQueueRequest

- (NSString)queueContentsURLBagKey
{
  return (NSString *)[(id)qword_1001C81E0 objectForKeyedSubscript:self->_queueIdentifier];
}

- (NSString)queueCountURLBagKey
{
  return (NSString *)[(id)qword_1001C81E8 objectForKeyedSubscript:self->_queueIdentifier];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)BLStoreDownloadQueueRequest;
  v3 = [(BLStoreDownloadQueueRequest *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@: %@ / %@", v3, self->_queueIdentifier, self->_accountIdentifier];

  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_queueIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v9 = [(BLStoreDownloadQueueRequest *)self accountIdentifier];
    v10 = [v6 accountIdentifier];
    if (v9 == v10
      || ([(BLStoreDownloadQueueRequest *)self accountIdentifier],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 accountIdentifier],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v11 = [(BLStoreDownloadQueueRequest *)self queueIdentifier];
      uint64_t v12 = [v6 queueIdentifier];
      if (v11 == (void *)v12)
      {

        unsigned __int8 v8 = 1;
      }
      else
      {
        v13 = (void *)v12;
        v14 = [(BLStoreDownloadQueueRequest *)self queueIdentifier];
        v15 = [v6 queueIdentifier];
        unsigned __int8 v8 = [v14 isEqual:v15];
      }
      if (v9 == v10) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  unsigned __int8 v8 = 0;
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_queueIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v8[0] = @"books";
    v8[1] = @"media";
    v9[0] = @"pendingBooks";
    v9[1] = @"pendingSongs";
    uint64_t v2 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    v3 = (void *)qword_1001C81E0;
    qword_1001C81E0 = v2;

    v6[0] = @"books";
    v6[1] = @"media";
    v7[0] = @"checkBookQueue";
    v7[1] = @"check-download-queue";
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    v5 = (void *)qword_1001C81E8;
    qword_1001C81E8 = v4;
  }
}

+ (id)_downloadKindQueueIdentifierMapping
{
  if (qword_1001C81F8 != -1) {
    dispatch_once(&qword_1001C81F8, &stru_1001A2990);
  }
  uint64_t v2 = (void *)qword_1001C81F0;

  return v2;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
}

- (NSNumber)purchaseStoreIdentifier
{
  return self->_purchaseStoreIdentifier;
}

- (void)setPurchaseStoreIdentifier:(id)a3
{
}

- (BOOL)purchaseSuppressNetworkEvaluatorDialogs
{
  return self->_purchaseSuppressNetworkEvaluatorDialogs;
}

- (void)setPurchaseSuppressNetworkEvaluatorDialogs:(BOOL)a3
{
  self->_purchaseSuppressNetworkEvaluatorDialogs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end