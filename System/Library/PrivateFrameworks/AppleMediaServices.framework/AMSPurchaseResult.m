@interface AMSPurchaseResult
+ (BOOL)supportsSecureCoding;
- (AMSPurchase)purchase;
- (AMSPurchaseResult)initWithCoder:(id)a3;
- (BOOL)didShowPaymentSheet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPurchaseResult:(id)a3;
- (NSDictionary)loadURLEventDictionary;
- (NSDictionary)responseDictionary;
- (NSError)error;
- (NSString)correlationID;
- (NSURLResponse)URLResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setDidShowPaymentSheet:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setLoadURLEventDictionary:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setURLResponse:(id)a3;
@end

@implementation AMSPurchaseResult

- (unint64_t)hash
{
  v3 = [(AMSPurchaseResult *)self correlationID];
  uint64_t v4 = [v3 hash];
  v5 = [(AMSPurchaseResult *)self error];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(AMSPurchaseResult *)self purchase];
  uint64_t v8 = [v7 hash];
  v9 = [(AMSPurchaseResult *)self responseDictionary];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(AMSPurchaseResult *)self URLResponse];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v10 ^ v12 ^ [(AMSPurchaseResult *)self didShowPaymentSheet];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AMSPurchaseResult *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AMSPurchaseResult *)self isEqualToPurchaseResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToPurchaseResult:(id)a3
{
  id v7 = a3;
  uint64_t v8 = [(AMSPurchaseResult *)self correlationID];
  if (v8 || ([v7 correlationID], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(AMSPurchaseResult *)self correlationID];
    uint64_t v4 = [v7 correlationID];
    if (![v3 isEqual:v4])
    {
      LOBYTE(v10) = 0;
LABEL_45:

      goto LABEL_46;
    }
    int v9 = 1;
  }
  else
  {
    v43 = 0;
    int v9 = 0;
  }
  v11 = [(AMSPurchaseResult *)self error];
  if (v11 || ([v7 error], (v37 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = [(AMSPurchaseResult *)self error];
    BOOL v5 = [v7 error];
    v42 = v12;
    if (![v12 isEqual:v5])
    {
      LOBYTE(v10) = 0;
      goto LABEL_43;
    }
    int v40 = v9;
    int v41 = 1;
  }
  else
  {
    int v40 = v9;
    v37 = 0;
    int v41 = 0;
  }
  unint64_t v13 = [(AMSPurchaseResult *)self purchase];
  if (v13 || ([v7 purchase], (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = [(AMSPurchaseResult *)self purchase];
    uint64_t v38 = [v7 purchase];
    v39 = v14;
    if (![v14 isEqual:v38])
    {
      LOBYTE(v10) = 0;
LABEL_38:
      v23 = (void *)v38;
LABEL_39:

LABEL_40:
      if (v13) {
        goto LABEL_41;
      }
LABEL_54:

      if (v41) {
        goto LABEL_42;
      }
      goto LABEL_55;
    }
    uint64_t v15 = 1;
  }
  else
  {
    v33 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v36 = [(AMSPurchaseResult *)self responseDictionary];
  if (v36 || ([v7 responseDictionary], (v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v13;
    v17 = [(AMSPurchaseResult *)self responseDictionary];
    v34 = [v7 responseDictionary];
    v35 = v17;
    if (![v17 isEqual:v34])
    {
      LOBYTE(v10) = 0;
      unint64_t v13 = v16;
      goto LABEL_36;
    }
    int v31 = 1;
    unint64_t v13 = v16;
  }
  else
  {
    v29 = 0;
    int v31 = 0;
  }
  int v32 = v15;
  v18 = [(AMSPurchaseResult *)self URLResponse];
  if (!v18)
  {
    uint64_t v25 = [v7 URLResponse];
    if (!v25)
    {
      v26 = 0;
      int v27 = 0;
LABEL_31:
      BOOL v20 = [(AMSPurchaseResult *)self didShowPaymentSheet];
      int v10 = v20 ^ [v7 didShowPaymentSheet] ^ 1;
      if (!v27) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  v30 = v18;
  v19 = [(AMSPurchaseResult *)self URLResponse];
  uint64_t v15 = [v7 URLResponse];
  v28 = v19;
  if ([v19 isEqual:v15])
  {
    int v27 = 1;
    v18 = v30;
    goto LABEL_31;
  }
  LOBYTE(v10) = 0;
  v18 = v30;
LABEL_32:

LABEL_33:
  if (v18)
  {

    v21 = v43;
    LODWORD(v15) = v32;
    if (v31)
    {
LABEL_35:
      v43 = v21;
LABEL_36:

      v22 = (void *)v36;
      if (v36) {
        goto LABEL_37;
      }
      goto LABEL_51;
    }
  }
  else
  {

    v21 = v43;
    LODWORD(v15) = v32;
    if (v31) {
      goto LABEL_35;
    }
  }
  v22 = (void *)v36;
  v43 = v21;
  if (v36)
  {
LABEL_37:

    if (!v15) {
      goto LABEL_40;
    }
    goto LABEL_38;
  }
LABEL_51:

  if (v15)
  {
    v23 = (void *)v38;
    goto LABEL_39;
  }
  if (!v13) {
    goto LABEL_54;
  }
LABEL_41:

  if (v41)
  {
LABEL_42:
    int v9 = v40;
LABEL_43:

    if (v11) {
      goto LABEL_44;
    }
    goto LABEL_56;
  }
LABEL_55:
  int v9 = v40;
  if (v11)
  {
LABEL_44:

    if (!v9) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_56:

  if (v9) {
    goto LABEL_45;
  }
LABEL_46:
  if (!v8) {

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_alloc_init(AMSPurchaseResult);
  uint64_t v6 = [(AMSPurchaseResult *)self correlationID];
  uint64_t v7 = [v6 copyWithZone:a3];
  correlationID = v5->_correlationID;
  v5->_correlationID = (NSString *)v7;

  int v9 = [(AMSPurchaseResult *)self error];
  uint64_t v10 = [v9 copyWithZone:a3];
  error = v5->_error;
  v5->_error = (NSError *)v10;

  uint64_t v12 = [(AMSPurchaseResult *)self loadURLEventDictionary];
  uint64_t v13 = [v12 copyWithZone:a3];
  loadURLEventDictionary = v5->_loadURLEventDictionary;
  v5->_loadURLEventDictionary = (NSDictionary *)v13;

  uint64_t v15 = [(AMSPurchaseResult *)self purchase];
  uint64_t v16 = [v15 copyWithZone:a3];
  purchase = v5->_purchase;
  v5->_purchase = (AMSPurchase *)v16;

  v18 = [(AMSPurchaseResult *)self responseDictionary];
  uint64_t v19 = [v18 copyWithZone:a3];
  responseDictionary = v5->_responseDictionary;
  v5->_responseDictionary = (NSDictionary *)v19;

  v21 = [(AMSPurchaseResult *)self URLResponse];
  uint64_t v22 = [v21 copyWithZone:a3];
  URLResponse = v5->_URLResponse;
  v5->_URLResponse = (NSURLResponse *)v22;

  v5->_didShowPaymentSheet = self->_didShowPaymentSheet;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(AMSPurchaseResult *)self correlationID];
  [v12 encodeObject:v4 forKey:@"correlationID"];

  BOOL v5 = [(AMSPurchaseResult *)self error];
  [v12 encodeObject:v5 forKey:@"error"];

  uint64_t v6 = [(AMSPurchaseResult *)self loadURLEventDictionary];

  if (v6)
  {
    uint64_t v7 = [(AMSPurchaseResult *)self loadURLEventDictionary];
    objc_msgSend(v12, "ams_encodePropertyListDictionary:format:forKey:", v7, 200, @"loadURLEventDictionary");
  }
  uint64_t v8 = [(AMSPurchaseResult *)self purchase];
  [v12 encodeObject:v8 forKey:@"purchase"];

  int v9 = [(AMSPurchaseResult *)self responseDictionary];

  if (v9)
  {
    uint64_t v10 = [(AMSPurchaseResult *)self responseDictionary];
    objc_msgSend(v12, "ams_encodePropertyListDictionary:format:forKey:", v10, 200, @"responseDictionary");
  }
  v11 = [(AMSPurchaseResult *)self URLResponse];
  [v12 encodeObject:v11 forKey:@"URLResponse"];

  objc_msgSend(v12, "encodeBool:forKey:", -[AMSPurchaseResult didShowPaymentSheet](self, "didShowPaymentSheet"), @"didShowPaymentSheet");
}

- (AMSPurchaseResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSPurchaseResult;
  BOOL v5 = [(AMSPurchaseResult *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"correlationID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchase"];
    purchase = v5->_purchase;
    v5->_purchase = (AMSPurchase *)v10;

    uint64_t v12 = objc_msgSend(v4, "ams_decodePropertyListDictionaryForKey:", @"responseDictionary");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLResponse"];
    URLResponse = v5->_URLResponse;
    v5->_URLResponse = (NSURLResponse *)v14;

    uint64_t v16 = objc_msgSend(v4, "ams_decodePropertyListDictionaryForKey:", @"loadURLEventDictionary");
    loadURLEventDictionary = v5->_loadURLEventDictionary;
    v5->_loadURLEventDictionary = (NSDictionary *)v16;

    v5->_didShowPaymentSheet = [v4 decodeBoolForKey:@"didShowPaymentSheet"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AMSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (NSDictionary)loadURLEventDictionary
{
  return self->_loadURLEventDictionary;
}

- (void)setLoadURLEventDictionary:(id)a3
{
}

- (NSURLResponse)URLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
}

- (BOOL)didShowPaymentSheet
{
  return self->_didShowPaymentSheet;
}

- (void)setDidShowPaymentSheet:(BOOL)a3
{
  self->_didShowPaymentSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_loadURLEventDictionary, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
}

@end