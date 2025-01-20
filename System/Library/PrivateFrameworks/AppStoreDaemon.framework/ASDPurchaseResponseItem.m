@interface ASDPurchaseResponseItem
+ (BOOL)supportsSecureCoding;
- (ASDPurchase)purchase;
- (ASDPurchaseResponseItem)init;
- (ASDPurchaseResponseItem)initWithCoder:(id)a3;
- (ASDPurchaseResponseItem)initWithResults:(id)a3;
- (BOOL)cancelsPurchaseBatch;
- (BOOL)success;
- (NSArray)results;
- (NSDictionary)responseMetrics;
- (NSDictionary)transationIDs;
- (NSError)error;
- (NSNumber)itemID;
- (NSString)bundleID;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)transactionIdentifierForItemIdentifier:(int64_t)a3;
- (void)_setBundleID:(id)a3;
- (void)_setError:(id)a3;
- (void)_setItemID:(id)a3;
- (void)_setPurchase:(id)a3;
- (void)_setResponseMetrics:(id)a3;
- (void)_setSuccess:(BOOL)a3;
- (void)_setTransactionIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseStartTime:(double)a3;
@end

@implementation ASDPurchaseResponseItem

- (ASDPurchaseResponseItem)init
{
  return [(ASDPurchaseResponseItem *)self initWithResults:MEMORY[0x1E4F1CBF0]];
}

- (ASDPurchaseResponseItem)initWithResults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseResponseItem;
  v6 = [(ASDPurchaseResponseItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_results, a3);
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%@]: cancelsPurchasesBatch: %d error: %@ purchase: %@ result: %d]", objc_opt_class(), self->_cancelsPurchaseBatch, self->_error, self->_purchase, self->_success];
}

- (id)transactionIdentifierForItemIdentifier:(int64_t)a3
{
  v3 = 0;
  if (a3 >= 1)
  {
    transationIDs = self->_transationIDs;
    if (transationIDs)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
      v3 = [(NSDictionary *)transationIDs objectForKey:v5];
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  *((unsigned char *)v5 + 9) = self->_cancelsPurchaseBatch;
  uint64_t v8 = [(NSError *)self->_error copyWithZone:a3];
  objc_super v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSNumber *)self->_itemID copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(ASDPurchase *)self->_purchase copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSArray *)self->_results copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  uint64_t v16 = [(NSDictionary *)self->_responseMetrics copyWithZone:a3];
  v17 = (void *)v5[10];
  v5[10] = v16;

  *((unsigned char *)v5 + 8) = self->_success;
  uint64_t v18 = [(NSDictionary *)self->_transationIDs copyWithZone:a3];
  v19 = (void *)v5[11];
  v5[11] = v18;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseResponseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDPurchaseResponseItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_cancelsPurchaseBatch = [v4 decodeBoolForKey:@"cancelsPurchaseBatch"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchase"];
    purchase = v5->_purchase;
    v5->_purchase = (ASDPurchase *)v12;

    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"results"];
    results = v5->_results;
    v5->_results = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"responseMetrics"];
    responseMetrics = v5->_responseMetrics;
    v5->_responseMetrics = (NSDictionary *)v25;

    [v4 decodeDoubleForKey:@"requestStartTime"];
    v5->_requestStartTime = v27;
    [v4 decodeDoubleForKey:@"responseEndTime"];
    v5->_responseEndTime = v28;
    [v4 decodeDoubleForKey:@"responseStartTime"];
    v5->_responseStartTime = v29;
    v5->_success = [v4 decodeBoolForKey:@"success"];
    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"transactionIdentifiers"];
    transationIDs = v5->_transationIDs;
    v5->_transationIDs = (NSDictionary *)v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v7 encodeBool:self->_cancelsPurchaseBatch forKey:@"cancelsPurchaseBatch"];
  error = self->_error;
  if (error)
  {
    id v5 = ASDErrorWithSafeUserInfo(error);
    [v7 encodeObject:v5 forKey:@"error"];
  }
  itemID = self->_itemID;
  if (itemID) {
    [v7 encodeObject:itemID forKey:@"itemID"];
  }
  [v7 encodeObject:self->_purchase forKey:@"purchase"];
  [v7 encodeObject:self->_results forKey:@"results"];
  [v7 encodeDouble:@"requestStartTime" forKey:self->_requestStartTime];
  [v7 encodeDouble:@"responseEndTime" forKey:self->_responseEndTime];
  [v7 encodeDouble:@"responseStartTime" forKey:self->_responseStartTime];
  [v7 encodeObject:self->_responseMetrics forKey:@"responseMetrics"];
  [v7 encodeBool:self->_success forKey:@"success"];
  [v7 encodeObject:self->_transationIDs forKey:@"transactionIdentifiers"];
}

- (void)_setBundleID:(id)a3
{
  self->_bundleID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)_setItemID:(id)a3
{
}

- (void)_setError:(id)a3
{
}

- (void)_setPurchase:(id)a3
{
}

- (void)_setResponseMetrics:(id)a3
{
}

- (void)_setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)_setTransactionIDs:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (ASDPurchase)purchase
{
  return self->_purchase;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (NSArray)results
{
  return self->_results;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)cancelsPurchaseBatch
{
  return self->_cancelsPurchaseBatch;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (NSDictionary)responseMetrics
{
  return self->_responseMetrics;
}

- (NSDictionary)transationIDs
{
  return self->_transationIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transationIDs, 0);
  objc_storeStrong((id *)&self->_responseMetrics, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end