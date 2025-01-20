@interface CTRemotePlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlanSignUpDetails)signUpDetails;
- (CTPlanTransferAttributes)transferAttributes;
- (CTRemotePlan)init;
- (CTRemotePlan)initWithCoder:(id)a3;
- (CTRemotePlanIdentifier)planID;
- (NSNumber)primaryAccount;
- (id)carrierName;
- (id)countryCode;
- (id)description;
- (id)iccid;
- (id)label;
- (id)phoneNumber;
- (unint64_t)addOnCarrierFlowType;
- (unint64_t)addOnPurchaseType;
- (void)encodeWithCoder:(id)a3;
- (void)setAddOnCarrierFlowType:(unint64_t)a3;
- (void)setAddOnPurchaseType:(unint64_t)a3;
- (void)setPlanID:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)setSignUpDetails:(id)a3;
- (void)setTransferAttributes:(id)a3;
@end

@implementation CTRemotePlan

- (CTRemotePlan)init
{
  v9.receiver = self;
  v9.super_class = (Class)CTRemotePlan;
  v2 = [(CTRemotePlan *)&v9 init];
  v3 = v2;
  if (v2)
  {
    planID = v2->_planID;
    v2->_planID = 0;

    transferAttributes = v3->_transferAttributes;
    v3->_transferAttributes = 0;

    signUpDetails = v3->_signUpDetails;
    v3->_signUpDetails = 0;

    v3->_addOnPurchaseType = 0;
    v3->_addOnCarrierFlowType = 0;
    primaryAccount = v3->_primaryAccount;
    v3->_primaryAccount = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTRemotePlan *)self planID];
  [v3 appendFormat:@" planID=%@", v4];

  v5 = [(CTRemotePlan *)self transferAttributes];
  [v3 appendFormat:@" transferAttributes=%@", v5];

  v6 = [(CTRemotePlan *)self signUpDetails];
  [v3 appendFormat:@" signUpDetails=%@", v6];

  objc_msgSend(v3, "appendFormat:", @" addOnPurchaseType=%s", CTPlanAddOnPurchaseTypeAsString(-[CTRemotePlan addOnPurchaseType](self, "addOnPurchaseType")));
  objc_msgSend(v3, "appendFormat:", @" addOnCarrierFlowType=%s", CTPlanAddOnCarrierFlowTypeAsString(-[CTRemotePlan addOnCarrierFlowType](self, "addOnCarrierFlowType")));
  v7 = [(CTRemotePlan *)self primaryAccount];

  if (v7)
  {
    v8 = [(CTRemotePlan *)self primaryAccount];
    objc_msgSend(v3, "appendFormat:", @" primaryAccount=%d", objc_msgSend(v8, "BOOLValue"));
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CTRemotePlan *)a3;
  if (v5 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(CTRemotePlan *)self planID];
      v7 = [(CTRemotePlan *)v5 planID];
      if (v6 != v7)
      {
        v8 = [(CTRemotePlan *)self planID];
        objc_super v9 = [(CTRemotePlan *)v5 planID];
        if (![v8 isEqual:v9])
        {
          BOOL v10 = 0;
          goto LABEL_27;
        }
        v26 = v9;
        v27 = v8;
      }
      v11 = [(CTRemotePlan *)self transferAttributes];
      v12 = [(CTRemotePlan *)v5 transferAttributes];
      if (v11 != v12)
      {
        v13 = [(CTRemotePlan *)self transferAttributes];
        v14 = [(CTRemotePlan *)v5 transferAttributes];
        if (![v13 isEqual:v14])
        {
          BOOL v10 = 0;
LABEL_25:

          goto LABEL_26;
        }
        v24 = v14;
        v25 = v13;
      }
      v15 = [(CTRemotePlan *)self signUpDetails];
      v16 = [(CTRemotePlan *)v5 signUpDetails];
      if (v15 != v16)
      {
        v17 = [(CTRemotePlan *)self signUpDetails];
        v3 = [(CTRemotePlan *)v5 signUpDetails];
        if (![v17 isEqual:v3]) {
          goto LABEL_21;
        }
        v23 = v17;
      }
      unint64_t v18 = [(CTRemotePlan *)self addOnPurchaseType];
      if (v18 == [(CTRemotePlan *)v5 addOnPurchaseType])
      {
        unint64_t v19 = [(CTRemotePlan *)self addOnCarrierFlowType];
        if (v19 == [(CTRemotePlan *)v5 addOnCarrierFlowType])
        {
          v20 = [(CTRemotePlan *)self primaryAccount];
          v21 = [(CTRemotePlan *)v5 primaryAccount];
          BOOL v10 = v20 == v21;

          if (v15 == v16)
          {

            if (v11 != v12)
            {
            }
LABEL_26:

            objc_super v9 = v26;
            v8 = v27;
            if (v6 == v7)
            {
LABEL_28:

              goto LABEL_29;
            }
LABEL_27:

            goto LABEL_28;
          }
          v17 = v23;
          goto LABEL_22;
        }
      }
      v17 = v23;
      if (v15 == v16)
      {

        BOOL v10 = 0;
LABEL_24:
        v14 = v24;
        v13 = v25;
        if (v11 == v12) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_21:
      BOOL v10 = 0;
LABEL_22:

      goto LABEL_24;
    }
    BOOL v10 = 0;
  }
LABEL_29:

  return v10;
}

- (id)iccid
{
  return [(CTPlanIdentifier *)self->_planID iccid];
}

- (id)carrierName
{
  return [(CTPlanIdentifier *)self->_planID carrierName];
}

- (id)phoneNumber
{
  return [(CTPlanIdentifier *)self->_planID phoneNumber];
}

- (id)countryCode
{
  return [(CTPlanIdentifier *)self->_planID countryCode];
}

- (id)label
{
  return [(CTPlanIdentifier *)self->_planID label];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemotePlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTRemotePlan;
  v5 = [(CTRemotePlan *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planID"];
    planID = v5->_planID;
    v5->_planID = (CTRemotePlanIdentifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferAttributes"];
    transferAttributes = v5->_transferAttributes;
    v5->_transferAttributes = (CTPlanTransferAttributes *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signUpDetails"];
    signUpDetails = v5->_signUpDetails;
    v5->_signUpDetails = (CTPlanSignUpDetails *)v10;

    v5->_addOnPurchaseType = [v4 decodeIntegerForKey:@"addOnFlowType"];
    v5->_addOnCarrierFlowType = [v4 decodeIntegerForKey:@"addOnCarrierFlowType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccount"];
    primaryAccount = v5->_primaryAccount;
    v5->_primaryAccount = (NSNumber *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_planID forKey:@"planID"];
  [v5 encodeObject:self->_transferAttributes forKey:@"transferAttributes"];
  [v5 encodeObject:self->_signUpDetails forKey:@"signUpDetails"];
  [v5 encodeInteger:self->_addOnPurchaseType forKey:@"addOnFlowType"];
  [v5 encodeInteger:self->_addOnCarrierFlowType forKey:@"addOnCarrierFlowType"];
  primaryAccount = self->_primaryAccount;
  if (primaryAccount) {
    [v5 encodeObject:primaryAccount forKey:@"primaryAccount"];
  }
}

- (CTRemotePlanIdentifier)planID
{
  return self->_planID;
}

- (void)setPlanID:(id)a3
{
}

- (CTPlanTransferAttributes)transferAttributes
{
  return self->_transferAttributes;
}

- (void)setTransferAttributes:(id)a3
{
}

- (CTPlanSignUpDetails)signUpDetails
{
  return self->_signUpDetails;
}

- (void)setSignUpDetails:(id)a3
{
}

- (unint64_t)addOnCarrierFlowType
{
  return self->_addOnCarrierFlowType;
}

- (void)setAddOnCarrierFlowType:(unint64_t)a3
{
  self->_addOnCarrierFlowType = a3;
}

- (NSNumber)primaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
}

- (unint64_t)addOnPurchaseType
{
  return self->_addOnPurchaseType;
}

- (void)setAddOnPurchaseType:(unint64_t)a3
{
  self->_addOnPurchaseType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_signUpDetails, 0);
  objc_storeStrong((id *)&self->_transferAttributes, 0);

  objc_storeStrong((id *)&self->_planID, 0);
}

@end