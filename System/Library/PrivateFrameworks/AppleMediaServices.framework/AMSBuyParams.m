@interface AMSBuyParams
+ (BOOL)supportsSecureCoding;
+ (id)buyParamsWithString:(id)a3;
- (AMSBuyParams)init;
- (AMSBuyParams)initWithArray:(id)a3;
- (AMSBuyParams)initWithCoder:(id)a3;
- (AMSBuyParams)initWithString:(id)a3;
- (BOOL)containsKey:(id)a3;
- (BOOL)isFreeTrial;
- (NSDictionary)dictionary;
- (NSDictionary)normalizedDictionary;
- (double)price;
- (id)_convertParsedBuyParamIfNeeded:(id)a3;
- (id)_normalizedDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryForFPDI;
- (id)objectForKeyedSubscript:(id)a3;
- (id)parameterForKey:(id)a3;
- (id)requestDataWithError:(id *)a3;
- (id)stringValue;
- (void)_parseBuyParams:(id)a3;
- (void)_parseBuyParamsArray:(id)a3;
- (void)addBlindedData:(id)a3;
- (void)clear;
- (void)encodeWithCoder:(id)a3;
- (void)removeBlindedData;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setParameter:(id)a3 forKey:(id)a4;
@end

@implementation AMSBuyParams

- (id)dictionaryForFPDI
{
  v2 = self;
  unint64_t v3 = (unint64_t)AMSBuyParams.dictionaryForFPDI()();

  if (v3)
  {
    v4 = (void *)sub_18DD4DD80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)buyParamsWithString:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v3];

  return v4;
}

- (AMSBuyParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSBuyParams;
  v2 = [(AMSBuyParams *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (AMSBuyParams)initWithArray:(id)a3
{
  id v4 = a3;
  v5 = [(AMSBuyParams *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(AMSBuyParams *)v5 _parseBuyParamsArray:v4];
  }

  return v6;
}

- (AMSBuyParams)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [(AMSBuyParams *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(AMSBuyParams *)v5 _parseBuyParams:v4];
  }

  return v6;
}

- (NSDictionary)normalizedDictionary
{
  v2 = [(AMSBuyParams *)self _normalizedDictionary];
  uint64_t v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (void)addBlindedData:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"blinded-element";
  id v4 = a3;
  v5 = [v4 blindedElementString];
  v11[1] = @"timestamp";
  v12[0] = v5;
  objc_super v6 = [v4 timestamp];

  v12[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v9 = @"token-info";
  v10 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(AMSBuyParams *)self setParameter:v8 forKey:@"buySignatures"];
  [(AMSBuyParams *)self setParameter:0 forKey:@"sendBlindedData"];
}

- (void)removeBlindedData
{
}

- (void)clear
{
}

- (BOOL)containsKey:(id)a3
{
  backingDictionary = self->_backingDictionary;
  id v4 = a3;
  v5 = [(NSMutableDictionary *)backingDictionary allKeys];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isFreeTrial
{
  v2 = [(AMSBuyParams *)self objectForKeyedSubscript:@"offrd-free-trial"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  id v4 = [v3 lowercaseString];
  char v5 = [v4 isEqualToString:@"true"];

  return v5;
}

- (double)price
{
  v2 = [(AMSBuyParams *)self objectForKeyedSubscript:@"price"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if ([v3 length])
  {
    if (_MergedGlobals_88 != -1) {
      dispatch_once(&_MergedGlobals_88, &__block_literal_global_21);
    }
    id v4 = [(id)qword_1EB38D6E8 numberFromString:v3];
    char v5 = v4;
    if (v4)
    {
      [v4 doubleValue];
      double v7 = v6;
    }
    else
    {
      double v7 = 9.22337204e18;
    }
  }
  else
  {
    double v7 = 9.22337204e18;
  }

  return v7;
}

void __21__AMSBuyParams_price__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v0 setNumberStyle:1];
  v1 = (void *)qword_1EB38D6E8;
  qword_1EB38D6E8 = (uint64_t)v0;
}

- (NSDictionary)dictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_backingDictionary copy];
  return (NSDictionary *)v2;
}

- (id)parameterForKey:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary valueForKey:](self->_backingDictionary, "valueForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setParameter:(id)a3 forKey:(id)a4
{
  if (a4) {
    -[NSMutableDictionary setValue:forKey:](self->_backingDictionary, "setValue:forKey:", a3);
  }
}

- (id)requestDataWithError:(id *)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F98];
  char v5 = [(AMSBuyParams *)self _normalizedDictionary];
  double v6 = [v4 dataWithPropertyList:v5 format:100 options:0 error:a3];

  return v6;
}

- (id)stringValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(AMSBuyParams *)self _normalizedDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__AMSBuyParams_stringValue__block_invoke;
  v9[3] = &unk_1E55A0958;
  id v10 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v6 setQueryItems:v5];
  double v7 = [v6 percentEncodedQuery];

  return v7;
}

void __27__AMSBuyParams_stringValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;

    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [NSString stringWithFormat:@"%@", v11];
LABEL_6:
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v8 base64EncodedStringWithOptions:0], (id v9 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [NSString stringWithFormat:@"%@", v8];
  }
LABEL_13:
  id v10 = [MEMORY[0x1E4F290C8] queryItemWithName:v7 value:v9];
  if (v10) {
    [*(id *)(a1 + 32) addObject:v10];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [(NSMutableDictionary *)self->_backingDictionary mutableCopyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<AMSBuyParams: %p buyParams = %@>", self, self->_backingDictionary];
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_backingDictionary objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (id)_convertParsedBuyParamIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((!objc_msgSend(v5, "hasPrefix:", @"(")
     || ([v5 hasSuffix:@""]) & 1) == 0)
    && (![v5 hasPrefix:@"{"]
     || ![v5 hasSuffix:@"}"]))
  {
    goto LABEL_21;
  }
  uint64_t v6 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = AMSLogKey();
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v4 = v10;
    if (v8)
    {
      uint64_t v3 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v4, v3];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    id v11 = };
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing buyParams object value: %@", buf, 0x16u);
    if (v8)
    {

      id v11 = (void *)v3;
    }
  }
  v12 = [v5 dataUsingEncoding:4];
  id v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:0 error:0];
  if (!v13)
  {

LABEL_21:
    id v13 = v5;
    goto LABEL_27;
  }
  v14 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = AMSLogKey();
    v17 = NSString;
    if (v16)
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v4 = AMSLogKey();
      [v17 stringWithFormat:@"%@: [%@] ", v18, v4];
    }
    else
    {
      [NSString stringWithFormat:@"%@: ", objc_opt_class()];
    v19 = };
    *(_DWORD *)buf = 138543618;
    v22 = v19;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Deserialized buyParam object value to: %@", buf, 0x16u);
    if (v16)
    {

      v19 = (void *)v4;
    }
  }
LABEL_27:

  return v13;
}

- (id)_normalizedDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  backingDictionary = self->_backingDictionary;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AMSBuyParams__normalizedDictionary__block_invoke;
  v7[3] = &unk_1E55A0958;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)backingDictionary enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __37__AMSBuyParams__normalizedDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 base64EncodedStringWithOptions:0];

    id v5 = (id)v6;
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
}

- (void)_parseBuyParamsArray:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = off_1E559C000;
  id v7 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = AMSLogKey();
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = v11;
    if (v9)
    {
      uint64_t v3 = AMSLogKey();
      [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
    }
    else
    {
      [v10 stringWithFormat:@"%@: ", v11];
    id v13 = };
    v14 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = (uint64_t)v13;
    __int16 v61 = 2112;
    v62 = v14;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing buyParams array: %@", buf, 0x16u);
    if (v9)
    {

      id v13 = (void *)v3;
    }

    uint64_t v6 = off_1E559C000;
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v15 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v20 = [v19 rangeOfString:@"="];
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v22 = +[AMSUnitTests isRunningUnitTests];
          uint64_t v23 = [(__objc2_class *)v6[17] sharedPurchaseConfig];
          id v24 = (void *)v23;
          if (v22)
          {
            if (!v23)
            {
              id v24 = [(__objc2_class *)v6[17] sharedConfig];
            }
            uint64_t v25 = [v24 OSLogObject];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = AMSLogKey();
              v27 = NSString;
              uint64_t v28 = objc_opt_class();
              uint64_t v29 = v28;
              if (v26)
              {
                uint64_t v50 = AMSLogKey();
                uint64_t v30 = [v27 stringWithFormat:@"%@: [%@] ", v29, v50];
                v48 = (void *)v30;
                v31 = v52;
              }
              else
              {
                uint64_t v30 = [v27 stringWithFormat:@"%@: ", v28];
                v31 = (void *)v30;
              }
              v43 = AMSHashIfNeeded(v19);
              *(_DWORD *)buf = 138543618;
              uint64_t v60 = v30;
              __int16 v61 = 2114;
              v62 = v43;
              _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@Malformed buy param: %{public}@", buf, 0x16u);
              v52 = v31;
              v44 = v31;
              uint64_t v6 = off_1E559C000;
              if (v26)
              {

                v44 = (void *)v50;
              }
            }
            id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v35 = [(__objc2_class *)v6[17] sharedPurchaseConfig];
            [v24 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v35 userInfo:0];
          }
          else
          {
            if (!v23)
            {
              id v24 = [(__objc2_class *)v6[17] sharedConfig];
            }
            v35 = [v24 OSLogObject];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              v37 = AMSLogKey();
              v38 = NSString;
              uint64_t v39 = objc_opt_class();
              uint64_t v40 = v39;
              if (v37)
              {
                uint64_t v49 = AMSLogKey();
                uint64_t v41 = [v38 stringWithFormat:@"%@: [%@] ", v40, v49];
                v47 = (void *)v41;
                v42 = v51;
              }
              else
              {
                uint64_t v41 = [v38 stringWithFormat:@"%@: ", v39];
                v42 = (void *)v41;
              }
              v45 = AMSHashIfNeeded(v19);
              *(_DWORD *)buf = 138543618;
              uint64_t v60 = v41;
              __int16 v61 = 2114;
              v62 = v45;
              _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_FAULT, "%{public}@Malformed buy param: %{public}@", buf, 0x16u);
              v51 = v42;
              v46 = v42;
              uint64_t v6 = off_1E559C000;
              if (v37)
              {

                v46 = (void *)v49;
              }
            }
          }
        }
        else
        {
          uint64_t v32 = v20;
          uint64_t v33 = v21;
          id v24 = [v19 substringToIndex:v20];
          v34 = [v19 substringFromIndex:v32 + v33];
          v35 = [v34 stringByRemovingPercentEncoding];

          v36 = [(AMSBuyParams *)self _convertParsedBuyParamIfNeeded:v35];
          [(NSMutableDictionary *)self->_backingDictionary setObject:v36 forKeyedSubscript:v24];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v16);
  }
}

- (void)_parseBuyParams:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = AMSLogKey();
    id v8 = NSString;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v9;
    if (v7)
    {
      uint64_t v11 = AMSLogKey();
      uint64_t v12 = [v8 stringWithFormat:@"%@: [%@] ", v10, v11];
    }
    else
    {
      uint64_t v12 = [v8 stringWithFormat:@"%@: ", v9];
      uint64_t v11 = v12;
    }
    id v13 = AMSHashIfNeeded(v4);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v12;
    __int16 v29 = 2112;
    uint64_t v30 = v13;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing buyParams string: %@", buf, 0x16u);
    if (v7) {
  }
    }
  id v14 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v14 setPercentEncodedQuery:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [v14 queryItems];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v20 = [v19 name];
        if ([v20 length])
        {
          uint64_t v21 = [v19 value];
          if (v21) {
            [(NSMutableDictionary *)self->_backingDictionary setObject:v21 forKeyedSubscript:v20];
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBuyParams *)self stringValue];
  [v4 encodeObject:v5 forKey:@"kCodingKeyBuyParamsString"];
}

- (AMSBuyParams)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyBuyParamsString"];

  uint64_t v6 = [(AMSBuyParams *)self initWithString:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end