@interface SKPaymentTransaction
- (BOOL)canMergeWithTransaction:(id)a3;
- (BOOL)mergeWithServerTransaction:(id)a3;
- (BOOL)mergeWithTransaction:(id)a3;
- (NSArray)downloads;
- (NSData)transactionReceipt;
- (NSDate)transactionDate;
- (NSError)error;
- (NSString)_transactionIdentifier;
- (NSString)matchingIdentifier;
- (NSString)transactionIdentifier;
- (SKPayment)payment;
- (SKPaymentTransaction)init;
- (SKPaymentTransaction)initWithPayment:(id)a3;
- (SKPaymentTransaction)initWithServerTransaction:(id)a3;
- (SKPaymentTransaction)originalTransaction;
- (SKPaymentTransactionState)transactionState;
- (id)UUID;
- (id)appleIDAccountDetails;
- (void)_setAuthorizationResponse:(id)a3;
- (void)_setDownloads:(id)a3;
- (void)_setError:(id)a3;
- (void)_setOriginalTransaction:(id)a3;
- (void)_setTemporaryIdentifier:(id)a3;
- (void)_setTransactionDate:(id)a3;
- (void)_setTransactionIdentifier:(id)a3;
- (void)_setTransactionReceipt:(id)a3;
- (void)_setTransactionState:(int64_t)a3;
@end

@implementation SKPaymentTransaction

- (SKPaymentTransaction)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKPaymentTransaction;
  v2 = [(SKPaymentTransaction *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentTransactionInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (SKPaymentTransaction)initWithPayment:(id)a3
{
  id v4 = a3;
  v5 = [(SKPaymentTransaction *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    v7 = v5->_internal;
    uint64_t v8 = [v4 copy];
    v9 = (void *)v7[5];
    v7[5] = v8;
  }
  return v6;
}

- (NSArray)downloads
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 3);
}

- (SKPaymentTransaction)originalTransaction
{
  return (SKPaymentTransaction *)*((id *)self->_internal + 4);
}

- (SKPayment)payment
{
  return (SKPayment *)*((id *)self->_internal + 5);
}

- (NSDate)transactionDate
{
  return (NSDate *)*((id *)self->_internal + 7);
}

- (NSString)transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (NSData)transactionReceipt
{
  return (NSData *)*((id *)self->_internal + 9);
}

- (SKPaymentTransactionState)transactionState
{
  return *((void *)self->_internal + 10);
}

- (id)appleIDAccountDetails
{
  return *((id *)self->_internal + 11);
}

- (id)UUID
{
  return *((id *)self->_internal + 1);
}

- (BOOL)canMergeWithTransaction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = *((id *)self->_internal + 5);
  id v7 = *(id *)(v4[1] + 40);
  uint64_t v8 = v7;
  if (isKindOfClass)
  {
    if (v6 == v7) {
      int v9 = 1;
    }
    else {
      int v9 = [v6 isEqual:v7];
    }
  }
  else
  {
    int v9 = 0;
  }
  id v10 = *((id *)self->_internal + 8);

  if (v10)
  {
    id v11 = *(id *)(v4[1] + 64);

    if (v9)
    {
      if (v10 == v11)
      {
        LOBYTE(v9) = 1;
        id v11 = v10;
      }
      else
      {
        LOBYTE(v9) = [v10 isEqualToString:v11];
      }
    }
  }
  else
  {
    id v11 = v8;
  }

  return v9;
}

- (NSString)matchingIdentifier
{
  id v3 = *((id *)self->_internal + 8);
  if (!v3) {
    id v3 = *((id *)self->_internal + 6);
  }

  return (NSString *)v3;
}

- (BOOL)mergeWithTransaction:(id)a3
{
  id v4 = (id *)a3;
  v5 = (id *)self->_internal;
  id v6 = v4[1];
  id v7 = (id)v6[3];
  if (v5[3] != v7) {
    objc_storeStrong(v5 + 3, v7);
  }
  id v8 = v5[10];
  id v9 = (id)v6[10];
  BOOL v10 = v8 != v9;
  if (v8 != v9) {
    v5[10] = v9;
  }
  id v11 = (id)v6[4];
  if (v5[4] != v11) {
    objc_storeStrong(v5 + 4, v11);
  }
  id v12 = (id)v6[7];
  if (v5[7] != v12) {
    objc_storeStrong(v5 + 7, v12);
  }
  id v13 = (id)v6[8];
  if (v5[8] != v13)
  {
    uint64_t v14 = [v13 copy];
    id v15 = v5[8];
    v5[8] = (id)v14;
  }
  id v16 = (id)v6[6];
  if (v5[6] != v16)
  {
    uint64_t v17 = [v16 copy];
    id v18 = v5[6];
    v5[6] = (id)v17;
  }
  id v19 = (id)v6[9];
  if (v5[9] != v19) {
    objc_storeStrong(v5 + 9, v19);
  }
  id v20 = v5[2];
  if (v20 != (id)v6[2] && (objc_msgSend(v20, "isEqualToArray:") & 1) == 0)
  {
    [(SKPaymentTransaction *)self _setDownloads:v6[2]];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_setDownloads:(id)a3
{
  id internal = (id *)self->_internal;
  id v4 = internal[2];
  if (v4 != a3)
  {
    BOOL v10 = internal;
    id v7 = a3;
    [v4 makeObjectsPerformSelector:sel__setTransaction_ withObject:0];
    uint64_t v8 = [v7 copy];

    id v9 = internal[2];
    internal[2] = (id)v8;

    [internal[2] makeObjectsPerformSelector:sel__setTransaction_ withObject:self];
  }
}

- (void)_setError:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 3);
  id v7 = (id *)(internal + 24);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)_setOriginalTransaction:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 4);
  id v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)_setTemporaryIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    id v7 = internal;
    uint64_t v5 = [a3 copy];
    id v6 = (void *)internal[6];
    internal[6] = v5;
  }
}

- (void)_setTransactionDate:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 7);
  id v7 = (id *)(internal + 56);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)_setTransactionIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[8] != a3)
  {
    id v7 = internal;
    uint64_t v5 = [a3 copy];
    id v6 = (void *)internal[8];
    internal[8] = v5;
  }
}

- (void)_setTransactionReceipt:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    id v7 = internal;
    uint64_t v5 = [a3 copy];
    id v6 = (void *)internal[9];
    internal[9] = v5;
  }
}

- (void)_setTransactionState:(int64_t)a3
{
  *((void *)self->_internal + 10) = a3;
}

- (void)_setAuthorizationResponse:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 11);
  id v7 = (id *)(internal + 88);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (NSString)_transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (SKPaymentTransaction)initWithServerTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(SKPaymentTransaction *)self init];
  id v6 = v5;
  if (v5) {
    [(SKPaymentTransaction *)v5 mergeWithServerTransaction:v4];
  }

  return v6;
}

- (BOOL)mergeWithServerTransaction:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id *)self->_internal;
  id v6 = [v4 objectForKeyedSubscript:0x1F08A8920];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 1, v6);
  }
  id v7 = [v4 objectForKeyedSubscript:0x1F08A8940];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong(v5 + 8, v7);
    v5[10] = (id)1;
  }
  id v8 = [v4 objectForKeyedSubscript:0x1F08A89A0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 7, v8);
  }
  id v9 = [v4 objectForKeyedSubscript:0x1F08A89C0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 9, v9);
  }
  BOOL v10 = [v4 objectForKeyedSubscript:0x1F08A89E0];

  if (objc_opt_respondsToSelector()) {
    v5[10] = (id)[v10 integerValue];
  }
  v83 = v5;
  id v11 = [v4 objectForKeyedSubscript:SKServerKeyAuthorizationResponse];

  objc_opt_class();
  id v84 = v4;
  if (objc_opt_isKindOfClass())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v94 = self;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received credential", buf, 0xCu);
    }
    id v91 = 0;
    id v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v91];
    id v13 = v91;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SKPaymentTransaction mergeWithServerTransaction:]();
      }
      uint64_t v14 = [SKPaymentTransactionAuthorizationResponse alloc];
      id v15 = 0;
      id v16 = v13;
    }
    else
    {
      uint64_t v14 = [SKPaymentTransactionAuthorizationResponse alloc];
      id v15 = v12;
      id v16 = 0;
    }
    uint64_t v17 = [(SKPaymentTransactionAuthorizationResponse *)v14 initWithAuthorizationCredential:v15 error:v16];
    if (v17) {
      [(SKPaymentTransaction *)self _setAuthorizationResponse:v17];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    _SKErrorFromNSError(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKPaymentTransaction mergeWithServerTransaction:]();
    }
    uint64_t v17 = [[SKPaymentTransactionAuthorizationResponse alloc] initWithAuthorizationCredential:0 error:v13];
    [(SKPaymentTransaction *)self _setAuthorizationResponse:v17];
  }

  id v4 = v84;
LABEL_27:
  id v18 = [v4 objectForKeyedSubscript:0x1F08A88C0];

  objc_opt_class();
  id v19 = v83;
  if (objc_opt_isKindOfClass())
  {
    id v20 = v18;
    v21 = [v20 domain];
    if ([v21 isEqualToString:@"com.apple.commerce.client"])
    {
      uint64_t v22 = [v20 code];

      BOOL v23 = v22 == 1000;
      id v4 = v84;
      if (v23) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    v24 = [v20 domain];
    if (![v24 isEqualToString:@"ASDErrorDomain"])
    {

      goto LABEL_39;
    }
    uint64_t v25 = [v20 code];

    BOOL v23 = v25 == 1052;
    id v4 = v84;
    if (!v23)
    {
LABEL_39:
      if (v83[8] || v83[7] || v83[9]) {
        goto LABEL_42;
      }
      uint64_t v73 = _SKErrorFromNSError(v20);
      id v74 = v83[3];
      v83[3] = (id)v73;

      uint64_t v26 = 2;
LABEL_37:
      v83[10] = (id)v26;
LABEL_42:

      goto LABEL_43;
    }
LABEL_36:
    uint64_t v26 = 4;
    goto LABEL_37;
  }
LABEL_43:
  uint64_t v27 = [v4 objectForKeyedSubscript:0x1F08A8960];
  v28 = [v4 objectForKeyedSubscript:0x1F08A8980];
  v29 = (void *)v27;
  objc_opt_class();
  v82 = v28;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v30 = objc_alloc_init(SKPaymentTransaction);
    id internal = v30->_internal;
    id v32 = v29;
    v33 = (void *)internal[7];
    internal[7] = v32;
    v34 = internal;

    uint64_t v35 = [v28 copy];
    v36 = (void *)v34[8];
    v34[8] = v35;

    v34[10] = 1;
  }
  else
  {
    v30 = 0;
  }
  v37 = [v4 objectForKeyedSubscript:SKPaymentOptionLegacyOfferName];
  v38 = [v4 objectForKeyedSubscript:SKPaymentOptionLegacyQuantity];
  objc_opt_class();
  v81 = self;
  if (objc_opt_isKindOfClass())
  {
    v39 = v38;
    if (objc_opt_respondsToSelector())
    {
      v40 = v30;
      v41 = objc_alloc_init(SKMutablePayment);
      v80 = v37;
      [(SKMutablePayment *)v41 setProductIdentifier:v37];
      -[SKMutablePayment setQuantity:](v41, "setQuantity:", [v38 integerValue]);
      v42 = [v4 objectForKeyedSubscript:SKPaymentOptionLegacyRequestData];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SKMutablePayment *)v41 setRequestData:v42];
      }
      v43 = [v83[5] applicationUsername];
      v44 = (void *)[v43 copy];
      [(SKMutablePayment *)v41 setApplicationUsername:v44];

      v45 = [v83[5] partnerIdentifier];
      v46 = (void *)[v45 copy];
      [(SKMutablePayment *)v41 setPartnerIdentifier:v46];

      v47 = [v83[5] partnerTransactionIdentifier];
      v48 = (void *)[v47 copy];
      [(SKMutablePayment *)v41 setPartnerTransactionIdentifier:v48];

      v49 = [v83[5] requestParameters];
      v50 = (void *)[v49 copy];
      [(SKMutablePayment *)v41 setRequestParameters:v50];

      v51 = [v83[5] paymentDiscount];
      [(SKMutablePayment *)v41 setPaymentDiscount:v51];

      uint64_t v52 = [(SKMutablePayment *)v41 copy];
      id v53 = v83[5];
      v83[5] = (id)v52;

      if (v40)
      {
        v54 = v40->_internal;
        uint64_t v55 = [(SKMutablePayment *)v41 copy];
        v56 = (void *)v54[5];
        v54[5] = v55;
      }
      v30 = v40;
      v39 = v38;
      v37 = v80;
    }
    else
    {
      v42 = v18;
    }
  }
  else
  {
    v42 = v18;
    v39 = v38;
  }
  objc_storeStrong(v83 + 4, v30);
  v57 = [v4 objectForKeyedSubscript:0x1F08A8A20];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v58 = v57;
    v86 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v58, "count"));
    uint64_t v59 = [v4 objectForKeyedSubscript:SKServerKeyId];
    v60 = v4;
    v61 = (void *)v59;
    uint64_t v62 = [v60 objectForKeyedSubscript:SKPaymentOptionLegacyOfferName];
    v63 = (void *)v62;
    if (v61 && v62)
    {
      v76 = v57;
      v77 = v30;
      v78 = v29;
      v79 = v39;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v75 = v58;
      id obj = v58;
      uint64_t v64 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v65; ++i)
          {
            if (*(void *)v88 != v66) {
              objc_enumerationMutation(obj);
            }
            v68 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            v69 = objc_alloc_init(SKDownload);
            [(SKDownload *)v69 _setDownloadID:v61];
            [(SKDownload *)v69 _setContentIdentifier:v63];
            v70 = [v68 objectForKeyedSubscript:0x1F08A8CC0];
            [(SKDownload *)v69 _setContentLength:v70];

            v71 = [v68 objectForKeyedSubscript:0x1F08A8CA0];
            [(SKDownload *)v69 _setVersion:v71];

            [v86 addObject:v69];
          }
          uint64_t v65 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
        }
        while (v65);
      }

      id v19 = v83;
      v30 = v77;
      v39 = v79;
      id v58 = v75;
      v57 = v76;
    }
    -[SKPaymentTransaction _setDownloads:](v81, "_setDownloads:", v86, v75, v76, v77, v78);

    id v4 = v84;
  }

  return 1;
}

- (void).cxx_destruct
{
}

- (void)mergeWithServerTransaction:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to unarchive auth response: %{public}@", v0, 0x16u);
}

- (void)mergeWithServerTransaction:.cold.2()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Auth credential failed: %{public}@", v0, 0x16u);
}

@end