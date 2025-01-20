@interface HMMTRSystemCommissionerPairingManagerPairingIdentity
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)isIdentifiable;
- (HMMTRSystemCommissionerPairingManagerPairingIdentity)initWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)serialNumber;
- (NSString)setupPayload;
- (NSUUID)uuid;
@end

@implementation HMMTRSystemCommissionerPairingManagerPairingIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)setupPayload
{
  return self->_setupPayload;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self vendorID];
  if (!v5) {
    goto LABEL_14;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self productID];
  if (!v7) {
    goto LABEL_13;
  }
  v8 = (void *)v7;
  uint64_t v9 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self serialNumber];
  if (!v9)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v10 = (void *)v9;
  uint64_t v11 = [v4 vendorID];
  if (!v11)
  {
LABEL_11:

    goto LABEL_12;
  }
  v12 = (void *)v11;
  uint64_t v13 = [v4 productID];
  if (!v13)
  {

    goto LABEL_11;
  }
  v14 = (void *)v13;
  v15 = [v4 serialNumber];

  if (!v15)
  {
LABEL_14:
    v16 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self setupPayload];
    v17 = [v4 setupPayload];
    char v22 = [v16 isEqual:v17];
    goto LABEL_15;
  }
  v16 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self vendorID];
  v17 = [v4 vendorID];
  if ([v16 isEqual:v17])
  {
    v18 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self productID];
    v19 = [v4 productID];
    if ([v18 isEqual:v19])
    {
      v20 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self serialNumber];
      v21 = [v4 serialNumber];
      char v22 = [v20 isEqual:v21];
    }
    else
    {
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }
LABEL_15:

  return v22;
}

- (BOOL)isIdentifiable
{
  id v4 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self vendorID];
  if (v4)
  {
    v2 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self productID];
    if (v2)
    {
      uint64_t v5 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self serialNumber];
      if (v5)
      {

        BOOL v6 = 1;
LABEL_6:

        goto LABEL_7;
      }
    }
  }
  uint64_t v7 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)self setupPayload];
  BOOL v6 = v7 != 0;

  if (v4) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (HMMTRSystemCommissionerPairingManagerPairingIdentity)initWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRSystemCommissionerPairingManagerPairingIdentity;
  v17 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_vendorID, a4);
    objc_storeStrong((id *)&v18->_productID, a5);
    objc_storeStrong((id *)&v18->_serialNumber, a6);
    objc_storeStrong((id *)&v18->_setupPayload, a7);
  }

  return v18;
}

@end