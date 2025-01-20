@interface CTSweetgumPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)planPurchasable;
- (CTSweetgumPlan)init;
- (CTSweetgumPlan)initWithCoder:(id)a3;
- (NSString)planDetailsURL;
- (NSString)planId;
- (NSString)planLabel;
- (NSString)planPurchaseURL;
- (NSString)planTermsURL;
- (NSString)planValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)planStatus;
- (int64_t)planType;
- (unsigned)planSubscriptionStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setPlanDetailsURL:(id)a3;
- (void)setPlanId:(id)a3;
- (void)setPlanLabel:(id)a3;
- (void)setPlanPurchasable:(BOOL)a3;
- (void)setPlanPurchaseURL:(id)a3;
- (void)setPlanSubscriptionStatus:(unsigned __int8)a3;
- (void)setPlanTermsURL:(id)a3;
- (void)setPlanType:(int64_t)a3;
- (void)setPlanValue:(id)a3;
@end

@implementation CTSweetgumPlan

- (CTSweetgumPlan)init
{
  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumPlan;
  v2 = [(CTSweetgumPlan *)&v11 init];
  v3 = v2;
  if (v2)
  {
    planId = v2->_planId;
    v2->_planId = 0;

    planLabel = v3->_planLabel;
    v3->_planLabel = 0;

    planValue = v3->_planValue;
    v3->_planValue = 0;

    *(_WORD *)&v3->_planPurchasable = 769;
    planDetailsURL = v3->_planDetailsURL;
    v3->_planDetailsURL = 0;

    planTermsURL = v3->_planTermsURL;
    v3->_planTermsURL = 0;

    planPurchaseURL = v3->_planPurchaseURL;
    v3->_planPurchaseURL = 0;

    v3->_planType = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumPlan *)self planId];
  [v3 appendFormat:@", planId=%@", v4];

  v5 = [(CTSweetgumPlan *)self planLabel];
  [v3 appendFormat:@", planLabel=%@", v5];

  v6 = [(CTSweetgumPlan *)self planValue];
  [v3 appendFormat:@", planValue=%@", v6];

  [v3 appendFormat:@", planStatus=%s", CTSweetgumPlanStatusAsString(-[CTSweetgumPlan planStatus](self, "planStatus"))];
  [v3 appendFormat:@", planPurchasable=%d", -[CTSweetgumPlan planPurchasable](self, "planPurchasable")];
  v7 = [(CTSweetgumPlan *)self planDetailsURL];
  [v3 appendFormat:@", planDetailsURL=%@", v7];

  v8 = [(CTSweetgumPlan *)self planTermsURL];
  [v3 appendFormat:@", planTermsURL=%@", v8];

  v9 = [(CTSweetgumPlan *)self planPurchaseURL];
  [v3 appendFormat:@", planPurchaseURL=%@", v9];

  [v3 appendFormat:@", planType=%ld", -[CTSweetgumPlan planType](self, "planType")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CTSweetgumPlan *)a3;
  if (v5 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(CTSweetgumPlan *)self planId];
      v7 = [(CTSweetgumPlan *)v5 planId];
      if (v6 != v7)
      {
        v38 = [(CTSweetgumPlan *)self planId];
        v3 = [(CTSweetgumPlan *)v5 planId];
        if (![v38 isEqualToString:v3])
        {
          char v8 = 0;
          goto LABEL_21;
        }
      }
      v9 = [(CTSweetgumPlan *)self planLabel];
      v10 = [(CTSweetgumPlan *)v5 planLabel];
      if (v9 != v10)
      {
        v37 = [(CTSweetgumPlan *)self planLabel];
        v35 = [(CTSweetgumPlan *)v5 planLabel];
        if (!objc_msgSend(v37, "isEqualToString:"))
        {
          char v8 = 0;
LABEL_19:

LABEL_20:
          if (v6 == v7)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      objc_super v11 = [(CTSweetgumPlan *)self planValue];
      v12 = [(CTSweetgumPlan *)v5 planValue];
      if (v11 != v12)
      {
        v36 = [(CTSweetgumPlan *)self planValue];
        v34 = [(CTSweetgumPlan *)v5 planValue];
        if (!objc_msgSend(v36, "isEqualToString:"))
        {
          char v8 = 0;
          goto LABEL_17;
        }
      }
      int v13 = [(CTSweetgumPlan *)self planSubscriptionStatus];
      if (v13 != [(CTSweetgumPlan *)v5 planSubscriptionStatus]
        || (BOOL v14 = [(CTSweetgumPlan *)self planPurchasable],
            v14 != [(CTSweetgumPlan *)v5 planPurchasable]))
      {
        char v8 = 0;
        if (v11 == v12) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      uint64_t v16 = [(CTSweetgumPlan *)self planDetailsURL];
      [(CTSweetgumPlan *)v5 planDetailsURL];
      uint64_t v32 = v31 = v3;
      if (v16 != v32)
      {
        v30 = [(CTSweetgumPlan *)self planDetailsURL];
        v26 = [(CTSweetgumPlan *)v5 planDetailsURL];
        if (!objc_msgSend(v30, "isEqualToString:"))
        {
          char v8 = 0;
          v17 = (void *)v16;
          v18 = (void *)v32;
LABEL_36:

LABEL_37:
          v3 = v31;
          if (v11 == v12)
          {
LABEL_18:

            if (v9 == v10) {
              goto LABEL_20;
            }
            goto LABEL_19;
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      v29 = (void *)v16;
      uint64_t v33 = [(CTSweetgumPlan *)self planTermsURL];
      uint64_t v28 = [(CTSweetgumPlan *)v5 planTermsURL];
      if (v33 == v28
        || ([(CTSweetgumPlan *)self planTermsURL],
            v27 = objc_claimAutoreleasedReturnValue(),
            [(CTSweetgumPlan *)v5 planTermsURL],
            v24 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v27, "isEqualToString:")))
      {
        v25 = [(CTSweetgumPlan *)self planPurchaseURL];
        v23 = [(CTSweetgumPlan *)v5 planPurchaseURL];
        if (v25 == v23)
        {

          char v8 = 1;
        }
        else
        {
          v22 = [(CTSweetgumPlan *)self planPurchaseURL];
          v21 = [(CTSweetgumPlan *)v5 planPurchaseURL];
          char v8 = [v22 isEqualToString:v21];
        }
        v19 = (void *)v33;
        v20 = (void *)v28;
        if (v33 == v28)
        {
LABEL_35:

          v18 = (void *)v32;
          v17 = v29;
          if (v29 == (void *)v32) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
      }
      else
      {
        char v8 = 0;
        v19 = (void *)v33;
        v20 = (void *)v28;
      }

      goto LABEL_35;
    }
    char v8 = 0;
  }
LABEL_23:

  return v8;
}

- (int64_t)planStatus
{
  unint64_t planSubscriptionStatus = (char)self->_planSubscriptionStatus;
  if (planSubscriptionStatus > 2) {
    return 0;
  }
  else {
    return qword_1845DCB98[planSubscriptionStatus];
  }
}

- (BOOL)planPurchasable
{
  return self->_planSubscriptionStatus != 2 && self->_planPurchasable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSString *)self->_planId copyWithZone:a3];
  [v5 setPlanId:v6];

  v7 = (void *)[(NSString *)self->_planLabel copyWithZone:a3];
  [v5 setPlanLabel:v7];

  char v8 = (void *)[(NSString *)self->_planValue copyWithZone:a3];
  [v5 setPlanValue:v8];

  [v5 setPlanSubscriptionStatus:self->_planSubscriptionStatus];
  [v5 setPlanPurchasable:self->_planPurchasable];
  v9 = (void *)[(NSString *)self->_planDetailsURL copyWithZone:a3];
  [v5 setPlanDetailsURL:v9];

  v10 = (void *)[(NSString *)self->_planTermsURL copyWithZone:a3];
  [v5 setPlanTermsURL:v10];

  objc_super v11 = (void *)[(NSString *)self->_planPurchaseURL copyWithZone:a3];
  [v5 setPlanPurchaseURL:v11];

  objc_msgSend(v5, "setPlanType:", -[CTSweetgumPlan planType](self, "planType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_planId forKey:@"planId"];
  [v4 encodeObject:self->_planLabel forKey:@"planLabel"];
  [v4 encodeObject:self->_planValue forKey:@"planValue"];
  [v4 encodeInt:self->_planSubscriptionStatus forKey:@"planSubscriptionStatus"];
  [v4 encodeBool:self->_planPurchasable forKey:@"planPurchasable"];
  [v4 encodeObject:self->_planDetailsURL forKey:@"planDetailsURL"];
  [v4 encodeObject:self->_planTermsURL forKey:@"planTermsURL"];
  [v4 encodeObject:self->_planPurchaseURL forKey:@"planPurchaseURL"];
  [v4 encodeInteger:self->_planType forKey:@"planType"];
}

- (CTSweetgumPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTSweetgumPlan;
  v5 = [(CTSweetgumPlan *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planId"];
    planId = v5->_planId;
    v5->_planId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planLabel"];
    planLabel = v5->_planLabel;
    v5->_planLabel = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planValue"];
    planValue = v5->_planValue;
    v5->_planValue = (NSString *)v10;

    v5->_unint64_t planSubscriptionStatus = [v4 decodeIntForKey:@"planSubscriptionStatus"];
    v5->_planPurchasable = [v4 decodeBoolForKey:@"planPurchasable"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planDetailsURL"];
    planDetailsURL = v5->_planDetailsURL;
    v5->_planDetailsURL = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planTermsURL"];
    planTermsURL = v5->_planTermsURL;
    v5->_planTermsURL = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planPurchaseURL"];
    planPurchaseURL = v5->_planPurchaseURL;
    v5->_planPurchaseURL = (NSString *)v16;

    v5->_planType = [v4 decodeIntegerForKey:@"planType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)planId
{
  return self->_planId;
}

- (void)setPlanId:(id)a3
{
}

- (NSString)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
}

- (NSString)planValue
{
  return self->_planValue;
}

- (void)setPlanValue:(id)a3
{
}

- (void)setPlanPurchasable:(BOOL)a3
{
  self->_planPurchasable = a3;
}

- (NSString)planDetailsURL
{
  return self->_planDetailsURL;
}

- (void)setPlanDetailsURL:(id)a3
{
}

- (NSString)planTermsURL
{
  return self->_planTermsURL;
}

- (void)setPlanTermsURL:(id)a3
{
}

- (NSString)planPurchaseURL
{
  return self->_planPurchaseURL;
}

- (void)setPlanPurchaseURL:(id)a3
{
}

- (int64_t)planType
{
  return self->_planType;
}

- (void)setPlanType:(int64_t)a3
{
  self->_planType = a3;
}

- (unsigned)planSubscriptionStatus
{
  return self->_planSubscriptionStatus;
}

- (void)setPlanSubscriptionStatus:(unsigned __int8)a3
{
  self->_unint64_t planSubscriptionStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planPurchaseURL, 0);
  objc_storeStrong((id *)&self->_planTermsURL, 0);
  objc_storeStrong((id *)&self->_planDetailsURL, 0);
  objc_storeStrong((id *)&self->_planValue, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);

  objc_storeStrong((id *)&self->_planId, 0);
}

@end