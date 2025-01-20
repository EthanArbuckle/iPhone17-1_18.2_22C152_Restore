@interface AMSDeviceOffer
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)offersSetFromArray:(id)a3;
- (AMSDeviceOffer)initWithDictionary:(id)a3;
- (AMSDeviceOffer)initWithOfferIdentifier:(id)a3;
- (BOOL)isDowngrading;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubscribed;
- (NSNumber)adamId;
- (NSNumber)dsid;
- (NSSet)serialNumbers;
- (NSString)description;
- (NSString)offerIdentifier;
- (unint64_t)hash;
- (unint64_t)offerType;
- (void)setAdamId:(id)a3;
- (void)setDescription:(id)a3;
- (void)setDowngrading:(BOOL)a3;
- (void)setDsid:(id)a3;
- (void)setOfferIdentifier:(id)a3;
- (void)setSubscribed:(BOOL)a3;
@end

@implementation AMSDeviceOffer

+ (id)offersSetFromArray:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_40);
  v5 = [v3 setWithArray:v4];

  return v5;
}

AMSDeviceOffer *__37__AMSDeviceOffer_offersSetFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[AMSDeviceOffer alloc] initWithDictionary:v2];

  return v3;
}

- (AMSDeviceOffer)initWithOfferIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDeviceOffer;
  v5 = [(AMSDeviceOffer *)&v11 init];
  v6 = v5;
  if (v5)
  {
    adamId = v5->_adamId;
    v5->_adamId = (NSNumber *)&unk_1EDD01198;

    uint64_t v8 = [v4 copy];
    offerIdentifier = v6->_offerIdentifier;
    v6->_offerIdentifier = (NSString *)v8;
  }
  return v6;
}

- (AMSDeviceOffer)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"offerIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      v7 = [(AMSDeviceOffer *)self initWithOfferIdentifier:v6];
      if (!v7)
      {
LABEL_48:
        self = v7;
        v10 = self;
        goto LABEL_49;
      }
      uint64_t v8 = [v4 objectForKeyedSubscript:@"adamId"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;

        if (v9) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      objc_super v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        objc_super v11 = +[AMSLogConfig sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v33 = 138543362;
        *(void *)&v33[4] = objc_opt_class();
        id v13 = *(id *)&v33[4];
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No adamId found in initializer dictionary, setting to 0", v33, 0xCu);
      }
      id v9 = &unk_1EDD01198;
LABEL_15:
      objc_storeStrong((id *)&v7->_adamId, v9);
      v14 = [v4 objectForKeyedSubscript:@"description"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }

      description = v7->_description;
      v7->_description = v15;

      v17 = [v4 objectForKeyedSubscript:@"isDowngrading"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }

      v7->_downgrading = [v18 BOOLValue];
      v19 = [v4 objectForKeyedSubscript:@"dsid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }

      dsid = v7->_dsid;
      v7->_dsid = v20;

      v22 = [v4 objectForKeyedSubscript:@"isSubscribed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }

      v7->_subscribed = [v23 BOOLValue];
      v24 = [v4 objectForKeyedSubscript:@"serialNumber"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v25 = v24;
      }
      else {
        id v25 = 0;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([MEMORY[0x1E4F1CAD0] setWithArray:v25], (uint64_t v26 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v27 = objc_msgSend(v4, "objectForKeyedSubscript:", @"serialNumber", *(_OWORD *)v33);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v28 = v27;
        }
        else {
          id v28 = 0;
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v28];
          if (v29)
          {
            v30 = (void *)v29;
            id v25 = v28;
LABEL_45:
            if (objc_msgSend(v30, "count", *(_OWORD *)v33)) {
              objc_storeStrong((id *)&v7->_serialNumbers, v30);
            }

            goto LABEL_48;
          }
        }
        v31 = [v4 objectForKeyedSubscript:@"serialNumbers"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v25 = v31;
        }
        else {
          id v25 = 0;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v30 = 0;
          goto LABEL_45;
        }
        uint64_t v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v25];
      }
      v30 = (void *)v26;
      goto LABEL_45;
    }
  }
  else
  {

    id v6 = 0;
  }
  v10 = 0;
LABEL_49:

  return v10;
}

- (unint64_t)offerType
{
  id v2 = [(AMSDeviceOffer *)self offerIdentifier];
  v3 = [v2 lowercaseString];

  id v4 = [AMSDeviceOfferIdentifierAppleMusic lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    unint64_t v6 = 1;
  }
  else
  {
    v7 = [AMSDeviceOfferIdentifieriCloud lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      unint64_t v6 = 2;
    }
    else
    {
      id v9 = [(id)AMSDeviceOfferIdentifierAppleCare lowercaseString];
      char v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        unint64_t v6 = 3;
      }
      else
      {
        objc_super v11 = [(id)AMSDeviceOfferIdentifierTV lowercaseString];
        int v12 = [v3 isEqualToString:v11];

        if (v12) {
          unint64_t v6 = 4;
        }
        else {
          unint64_t v6 = 0;
        }
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [(AMSDeviceOffer *)self adamId];
  uint64_t v4 = [v3 hash];
  char v5 = [(AMSDeviceOffer *)self description];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = v6 ^ [(AMSDeviceOffer *)self isDowngrading];
  uint64_t v8 = [(AMSDeviceOffer *)self isSubscribed];
  id v9 = [(AMSDeviceOffer *)self offerIdentifier];
  uint64_t v10 = v7 ^ v8 ^ [v9 hash];
  objc_super v11 = [(AMSDeviceOffer *)self serialNumbers];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  char v5 = (AMSDeviceOffer *)a3;
  if (self == v5)
  {
    char v7 = 1;
    goto LABEL_5;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v9 = [(AMSDeviceOffer *)self adamId];
    if (v9 || ([(AMSDeviceOffer *)v5 adamId], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v10 = [(AMSDeviceOffer *)self adamId];
      objc_super v11 = [(AMSDeviceOffer *)v5 adamId];
      int v12 = [v10 isEqual:v11];

      if (v9)
      {

        if (!v12) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v12 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    id v13 = [(AMSDeviceOffer *)self description];
    if (v13
      || ([(AMSDeviceOffer *)v5 description], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(AMSDeviceOffer *)self description];
      v15 = [(AMSDeviceOffer *)v5 description];
      int v16 = [v14 isEqual:v15];

      if (v13)
      {

        if (!v16) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v16 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    BOOL v17 = [(AMSDeviceOffer *)self isDowngrading];
    if (v17 != [(AMSDeviceOffer *)v5 isDowngrading]) {
      goto LABEL_3;
    }
    BOOL v18 = [(AMSDeviceOffer *)self isSubscribed];
    if (v18 != [(AMSDeviceOffer *)v5 isSubscribed]) {
      goto LABEL_3;
    }
    v19 = [(AMSDeviceOffer *)self offerIdentifier];
    if (v19
      || ([(AMSDeviceOffer *)v5 offerIdentifier],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = [(AMSDeviceOffer *)self offerIdentifier];
      v21 = [(AMSDeviceOffer *)v5 offerIdentifier];
      int v22 = [v20 isEqual:v21];

      if (v19)
      {

        if (!v22) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v22 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    id v23 = [(AMSDeviceOffer *)self serialNumbers];
    if (v23
      || ([(AMSDeviceOffer *)v5 serialNumbers], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = [(AMSDeviceOffer *)self serialNumbers];
      id v25 = [(AMSDeviceOffer *)v5 serialNumbers];
      int v26 = [v24 isEqual:v25] ^ 1;

      if (v23)
      {
LABEL_32:

        char v7 = v26 ^ 1;
        goto LABEL_5;
      }
    }
    else
    {
      LOBYTE(v26) = 0;
    }

    goto LABEL_32;
  }
LABEL_3:
  char v7 = 0;
LABEL_5:

  return v7;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_99 != -1) {
    dispatch_once(&_MergedGlobals_99, &__block_literal_global_52);
  }
  id v2 = (void *)qword_1EB38D7F8;
  return (NSString *)v2;
}

void __31__AMSDeviceOffer_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D7F8;
  qword_1EB38D7F8 = @"AMSDeviceOffers";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D800 != -1) {
    dispatch_once(&qword_1EB38D800, &__block_literal_global_57);
  }
  id v2 = (void *)qword_1EB38D808;
  return (NSString *)v2;
}

void __38__AMSDeviceOffer_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D808;
  qword_1EB38D808 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (NSNumber)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSSet)serialNumbers
{
  return self->_serialNumbers;
}

- (BOOL)isDowngrading
{
  return self->_downgrading;
}

- (void)setDowngrading:(BOOL)a3
{
  self->_downgrading = a3;
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferIdentifier:(id)a3
{
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
}

@end