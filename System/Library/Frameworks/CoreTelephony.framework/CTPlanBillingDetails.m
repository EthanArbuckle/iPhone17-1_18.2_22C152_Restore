@interface CTPlanBillingDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlanBillingDetails)initWithCoder:(id)a3;
- (CTPlanBillingDetails)initWithName:(id)a3 PlanCost:(id)a4 PlanCurrency:(id)a5 PlanDataAmount:(id)a6 PlanDataMeasureUnit:(unint64_t)a7 PlanType:(unint64_t)a8;
- (NSNumber)planCost;
- (NSNumber)planDataAmount;
- (NSString)planCurrency;
- (NSString)planName;
- (id)description;
- (unint64_t)planDataMeasureUnit;
- (unint64_t)planType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTPlanBillingDetails

- (CTPlanBillingDetails)initWithName:(id)a3 PlanCost:(id)a4 PlanCurrency:(id)a5 PlanDataAmount:(id)a6 PlanDataMeasureUnit:(unint64_t)a7 PlanType:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CTPlanBillingDetails;
  v18 = [(CTPlanBillingDetails *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_planName, a3);
    objc_storeStrong((id *)&v19->_planCost, a4);
    objc_storeStrong((id *)&v19->_planCurrency, a5);
    objc_storeStrong((id *)&v19->_planDataAmount, a6);
    v19->_planDataMeasureUnit = a7;
    v19->_planType = a8;
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPlanBillingDetails *)self planName];
  [v3 appendFormat:@" PlanName=%@", v4];

  v5 = [(CTPlanBillingDetails *)self planCost];
  [v3 appendFormat:@" PlanCost=%@", v5];

  v6 = [(CTPlanBillingDetails *)self planCurrency];
  [v3 appendFormat:@" PlanCurrency=%@", v6];

  v7 = [(CTPlanBillingDetails *)self planDataAmount];
  [v3 appendFormat:@" PlanDataAmount=%@", v7];

  objc_msgSend(v3, "appendFormat:", @" PlanDataMeasureUnit=%lu", -[CTPlanBillingDetails planDataMeasureUnit](self, "planDataMeasureUnit"));
  objc_msgSend(v3, "appendFormat:", @" PlanType=%lu", -[CTPlanBillingDetails planType](self, "planType"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CTPlanBillingDetails *)a3;
  if (v5 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(CTPlanBillingDetails *)self planName];
      v7 = [(CTPlanBillingDetails *)v5 planName];
      if (v6 != v7)
      {
        v3 = [(CTPlanBillingDetails *)self planName];
        v8 = [(CTPlanBillingDetails *)v5 planName];
        if (![v3 isEqualToString:v8])
        {
          BOOL v9 = 0;
          goto LABEL_33;
        }
        v34 = v8;
      }
      v10 = [(CTPlanBillingDetails *)self planCost];
      v11 = [(CTPlanBillingDetails *)v5 planCost];
      if (v10 != v11)
      {
        v12 = [(CTPlanBillingDetails *)self planCost];
        v13 = [(CTPlanBillingDetails *)v5 planCost];
        if (![v12 isEqualToNumber:v13])
        {
          BOOL v9 = 0;
LABEL_31:

LABEL_32:
          v8 = v34;
          if (v6 == v7)
          {
LABEL_34:

            goto LABEL_35;
          }
LABEL_33:

          goto LABEL_34;
        }
        v32 = v13;
        v33 = v12;
      }
      id v14 = [(CTPlanBillingDetails *)self planCurrency];
      id v15 = [(CTPlanBillingDetails *)v5 planCurrency];
      if (v14 == v15)
      {
        v30 = v14;
      }
      else
      {
        id v16 = [(CTPlanBillingDetails *)self planCurrency];
        v31 = [(CTPlanBillingDetails *)v5 planCurrency];
        if (!objc_msgSend(v16, "isEqualToString:"))
        {
          BOOL v9 = 0;
LABEL_29:

LABEL_30:
          v13 = v32;
          v12 = v33;
          if (v10 == v11) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
        v28 = v16;
        v30 = v14;
      }
      id v17 = [(CTPlanBillingDetails *)self planDataAmount];
      v18 = [(CTPlanBillingDetails *)v5 planDataAmount];
      if (v17 == v18)
      {
        v26 = v3;
      }
      else
      {
        v25 = v10;
        v19 = v3;
        v20 = [(CTPlanBillingDetails *)self planDataAmount];
        [(CTPlanBillingDetails *)v5 planDataAmount];
        uint64_t v29 = v27 = v20;
        if (!objc_msgSend(v20, "isEqualToNumber:"))
        {
          BOOL v9 = 0;
          v3 = v19;
          v10 = v25;
          v23 = (void *)v29;
          goto LABEL_27;
        }
        v26 = v19;
        v10 = v25;
      }
      unint64_t v21 = [(CTPlanBillingDetails *)self planDataMeasureUnit];
      if (v21 == [(CTPlanBillingDetails *)v5 planDataMeasureUnit])
      {
        unint64_t v22 = [(CTPlanBillingDetails *)self planType];
        BOOL v9 = v22 == [(CTPlanBillingDetails *)v5 planType];
      }
      else
      {
        BOOL v9 = 0;
      }
      v3 = v26;
      v23 = (void *)v29;
      if (v17 == v18)
      {
LABEL_28:

        id v14 = v30;
        id v16 = v28;
        if (v30 == v15) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
LABEL_27:

      goto LABEL_28;
    }
    BOOL v9 = 0;
  }
LABEL_35:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanBillingDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTPlanBillingDetails;
  v5 = [(CTPlanBillingDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlanName"];
    planName = v5->_planName;
    v5->_planName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlanCost"];
    planCost = v5->_planCost;
    v5->_planCost = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlanCurrency"];
    planCurrency = v5->_planCurrency;
    v5->_planCurrency = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlanDataAmount"];
    planDataAmount = v5->_planDataAmount;
    v5->_planDataAmount = (NSNumber *)v12;

    v5->_planDataMeasureUnit = [v4 decodeIntegerForKey:@"PlanDataMeasureUnit"];
    v5->_planType = [v4 decodeIntegerForKey:@"PlanType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  planName = self->_planName;
  id v5 = a3;
  [v5 encodeObject:planName forKey:@"PlanName"];
  [v5 encodeObject:self->_planCost forKey:@"PlanCost"];
  [v5 encodeObject:self->_planCurrency forKey:@"PlanCurrency"];
  [v5 encodeObject:self->_planDataAmount forKey:@"PlanDataAmount"];
  [v5 encodeInteger:self->_planDataMeasureUnit forKey:@"PlanDataMeasureUnit"];
  [v5 encodeInteger:self->_planType forKey:@"PlanType"];
}

- (NSString)planName
{
  return self->_planName;
}

- (NSNumber)planCost
{
  return self->_planCost;
}

- (NSString)planCurrency
{
  return self->_planCurrency;
}

- (NSNumber)planDataAmount
{
  return self->_planDataAmount;
}

- (unint64_t)planDataMeasureUnit
{
  return self->_planDataMeasureUnit;
}

- (unint64_t)planType
{
  return self->_planType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planDataAmount, 0);
  objc_storeStrong((id *)&self->_planCurrency, 0);
  objc_storeStrong((id *)&self->_planCost, 0);

  objc_storeStrong((id *)&self->_planName, 0);
}

@end