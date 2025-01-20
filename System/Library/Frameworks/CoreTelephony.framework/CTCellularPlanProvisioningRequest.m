@interface CTCellularPlanProvisioningRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCellularPlanProvisioningRequest)init;
- (CTCellularPlanProvisioningRequest)initWithCoder:(id)a3;
- (NSString)EID;
- (NSString)ICCID;
- (NSString)OID;
- (NSString)address;
- (NSString)confirmationCode;
- (NSString)matchingID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(NSString *)address;
- (void)setConfirmationCode:(NSString *)confirmationCode;
- (void)setEID:(NSString *)EID;
- (void)setICCID:(NSString *)ICCID;
- (void)setMatchingID:(NSString *)matchingID;
- (void)setOID:(NSString *)OID;
@end

@implementation CTCellularPlanProvisioningRequest

- (id)description
{
  return (id)[NSString stringWithFormat:@"CTCellularPlanProvisioningRequest (%p) {\n\tAddress: [%@]\n\tMatchingId: [%@]\n\tOID:[%@]\n\tConfirmation Code:[%@]\n\tICCID [%@]\n\tEID [%@]}\n", self, self->_address, self->_matchingID, self->_OID, self->_confirmationCode, self->_ICCID, self->_EID];
}

- (CTCellularPlanProvisioningRequest)init
{
  v11.receiver = self;
  v11.super_class = (Class)CTCellularPlanProvisioningRequest;
  v2 = [(CTCellularPlanProvisioningRequest *)&v11 init];
  v3 = v2;
  if (v2)
  {
    address = v2->_address;
    v2->_address = 0;

    matchingID = v3->_matchingID;
    v3->_matchingID = 0;

    OID = v3->_OID;
    v3->_OID = 0;

    confirmationCode = v3->_confirmationCode;
    v3->_confirmationCode = 0;

    ICCID = v3->_ICCID;
    v3->_ICCID = 0;

    EID = v3->_EID;
    v3->_EID = 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCellularPlanProvisioningRequest *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else if ([(CTCellularPlanProvisioningRequest *)v4 isMemberOfClass:objc_opt_class()])
  {
    address = self->_address;
    v6 = [(CTCellularPlanProvisioningRequest *)v4 address];
    if (IsEqualString(address, v6))
    {
      matchingID = self->_matchingID;
      v8 = [(CTCellularPlanProvisioningRequest *)v4 matchingID];
      if (IsEqualString(matchingID, v8))
      {
        OID = self->_OID;
        v10 = [(CTCellularPlanProvisioningRequest *)v4 OID];
        if (IsEqualString(OID, v10))
        {
          confirmationCode = self->_confirmationCode;
          v12 = [(CTCellularPlanProvisioningRequest *)v4 confirmationCode];
          if (IsEqualString(confirmationCode, v12))
          {
            ICCID = self->_ICCID;
            v14 = [(CTCellularPlanProvisioningRequest *)v4 ICCID];
            if (IsEqualString(ICCID, v14))
            {
              EID = self->_EID;
              v16 = [(CTCellularPlanProvisioningRequest *)v4 EID];
              char v17 = IsEqualString(EID, v16);
            }
            else
            {
              char v17 = 0;
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSString *)self->_address copyWithZone:a3];
  [v5 setAddress:v6];

  v7 = (void *)[(NSString *)self->_matchingID copyWithZone:a3];
  [v5 setMatchingID:v7];

  v8 = (void *)[(NSString *)self->_OID copyWithZone:a3];
  [v5 setOID:v8];

  v9 = (void *)[(NSString *)self->_confirmationCode copyWithZone:a3];
  [v5 setConfirmationCode:v9];

  v10 = (void *)[(NSString *)self->_ICCID copyWithZone:a3];
  [v5 setICCID:v10];

  objc_super v11 = (void *)[(NSString *)self->_EID copyWithZone:a3];
  [v5 setEID:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  address = self->_address;
  id v5 = a3;
  [v5 encodeObject:address forKey:@"address"];
  [v5 encodeObject:self->_matchingID forKey:@"matchingID"];
  [v5 encodeObject:self->_OID forKey:@"OID"];
  [v5 encodeObject:self->_confirmationCode forKey:@"confirmationCode"];
  [v5 encodeObject:self->_ICCID forKey:@"ICCID"];
  [v5 encodeObject:self->_EID forKey:@"EID"];
}

- (CTCellularPlanProvisioningRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCellularPlanProvisioningRequest;
  id v5 = [(CTCellularPlanProvisioningRequest *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingID"];
    matchingID = v5->_matchingID;
    v5->_matchingID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OID"];
    OID = v5->_OID;
    v5->_OID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationCode"];
    confirmationCode = v5->_confirmationCode;
    v5->_confirmationCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCID"];
    ICCID = v5->_ICCID;
    v5->_ICCID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EID"];
    EID = v5->_EID;
    v5->_EID = (NSString *)v16;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(NSString *)address
{
}

- (NSString)matchingID
{
  return self->_matchingID;
}

- (void)setMatchingID:(NSString *)matchingID
{
}

- (NSString)OID
{
  return self->_OID;
}

- (void)setOID:(NSString *)OID
{
}

- (NSString)confirmationCode
{
  return self->_confirmationCode;
}

- (void)setConfirmationCode:(NSString *)confirmationCode
{
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (void)setICCID:(NSString *)ICCID
{
}

- (NSString)EID
{
  return self->_EID;
}

- (void)setEID:(NSString *)EID
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EID, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
  objc_storeStrong((id *)&self->_OID, 0);
  objc_storeStrong((id *)&self->_matchingID, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end