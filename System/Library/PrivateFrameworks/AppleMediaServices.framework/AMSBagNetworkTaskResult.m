@interface AMSBagNetworkTaskResult
- (AMSBagNetworkTaskResult)initWithData:(id)a3 expirationDate:(id)a4 loadedBagIdentifier:(id)a5 loadedBagPartialIdentifier:(id)a6 storefront:(id)a7 accountIdentifier:(id)a8;
- (BOOL)expired;
- (NSDate)expirationDate;
- (NSDictionary)data;
- (NSString)accountIdentifier;
- (NSString)loadedBagIdentifier;
- (NSString)loadedBagPartialIdentifier;
- (NSString)storefront;
@end

@implementation AMSBagNetworkTaskResult

- (NSDictionary)data
{
  return self->_data;
}

- (NSString)loadedBagPartialIdentifier
{
  return self->_loadedBagPartialIdentifier;
}

- (NSString)loadedBagIdentifier
{
  return self->_loadedBagIdentifier;
}

- (BOOL)expired
{
  v2 = [(AMSBagNetworkTaskResult *)self expirationDate];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v4 = [v3 compare:v2] == 1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (AMSBagNetworkTaskResult)initWithData:(id)a3 expirationDate:(id)a4 loadedBagIdentifier:(id)a5 loadedBagPartialIdentifier:(id)a6 storefront:(id)a7 accountIdentifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_8:
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagNetworkTask.m", 60, @"Unexpected nil reference: %s", "expirationDate");

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagNetworkTask.m", 59, @"Unexpected nil reference: %s", "data");

  if (!v16) {
    goto LABEL_8;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_9:
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagNetworkTask.m", 61, @"Unexpected nil reference: %s", "loadedBagIdentifier");

LABEL_4:
  v36.receiver = self;
  v36.super_class = (Class)AMSBagNetworkTaskResult;
  v21 = [(AMSBagNetworkTaskResult *)&v36 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    data = v21->_data;
    v21->_data = (NSDictionary *)v22;

    uint64_t v24 = [v19 copy];
    storefront = v21->_storefront;
    v21->_storefront = (NSString *)v24;

    objc_storeStrong((id *)&v21->_expirationDate, a4);
    uint64_t v26 = [v17 copy];
    loadedBagIdentifier = v21->_loadedBagIdentifier;
    v21->_loadedBagIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    loadedBagPartialIdentifier = v21->_loadedBagPartialIdentifier;
    v21->_loadedBagPartialIdentifier = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    accountIdentifier = v21->_accountIdentifier;
    v21->_accountIdentifier = (NSString *)v30;
  }
  return v21;
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_loadedBagPartialIdentifier, 0);
  objc_storeStrong((id *)&self->_loadedBagIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end