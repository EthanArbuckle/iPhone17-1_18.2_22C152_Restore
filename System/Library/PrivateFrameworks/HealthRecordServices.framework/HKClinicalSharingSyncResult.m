@interface HKClinicalSharingSyncResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalSharingSyncResult)init;
- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 error:(id)a4;
- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 lookupInfo:(id)a4;
- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 lookupInfo:(id)a4 error:(id)a5;
- (HKClinicalSharingSyncResult)initWithCoder:(id)a3;
- (NSError)error;
- (NSString)lookupInfo;
- (NSUUID)accountID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalSharingSyncResult

- (HKClinicalSharingSyncResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 lookupInfo:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKClinicalSharingSyncResult;
  v11 = [(HKClinicalSharingSyncResult *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    accountID = v11->_accountID;
    v11->_accountID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    lookupInfo = v11->_lookupInfo;
    v11->_lookupInfo = (NSString *)v14;

    objc_storeStrong((id *)&v11->_error, a5);
  }

  return v11;
}

- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 lookupInfo:(id)a4
{
  return [(HKClinicalSharingSyncResult *)self initWithAccountID:a3 lookupInfo:a4 error:0];
}

- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 error:(id)a4
{
  return [(HKClinicalSharingSyncResult *)self initWithAccountID:a3 lookupInfo:0 error:a4];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKClinicalSharingSyncResult *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v13) = 0;
LABEL_31:

      goto LABEL_32;
    }
    accountID = self->_accountID;
    id v8 = [(HKClinicalSharingSyncResult *)v6 accountID];
    if (accountID != v8)
    {
      uint64_t v9 = [(HKClinicalSharingSyncResult *)v6 accountID];
      if (!v9)
      {
        LOBYTE(v13) = 0;
        goto LABEL_30;
      }
      id v10 = (void *)v9;
      v11 = self->_accountID;
      uint64_t v12 = [(HKClinicalSharingSyncResult *)v6 accountID];
      if (![(NSUUID *)v11 isEqual:v12])
      {
        LOBYTE(v13) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v29 = v10;
      v30 = v12;
    }
    lookupInfo = self->_lookupInfo;
    v15 = [(HKClinicalSharingSyncResult *)v6 lookupInfo];
    if (lookupInfo != v15)
    {
      v13 = [(HKClinicalSharingSyncResult *)v6 lookupInfo];
      if (!v13) {
        goto LABEL_24;
      }
      v16 = self->_lookupInfo;
      objc_super v17 = [(HKClinicalSharingSyncResult *)v6 lookupInfo];
      if (![(NSString *)v16 isEqualToString:v17])
      {

        LOBYTE(v13) = 0;
LABEL_27:
        BOOL v24 = accountID == v8;
        id v10 = v29;
LABEL_28:
        uint64_t v12 = v30;
        if (!v24) {
          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_31;
      }
      v26 = v17;
      v28 = v13;
    }
    error = self->_error;
    uint64_t v19 = [(HKClinicalSharingSyncResult *)v6 error];
    LOBYTE(v13) = error == (NSError *)v19;
    if (error == (NSError *)v19)
    {
    }
    else
    {
      v20 = (void *)v19;
      uint64_t v21 = [(HKClinicalSharingSyncResult *)v6 error];
      if (v21)
      {
        v22 = (void *)v21;
        v13 = self->_error;
        v23 = [(HKClinicalSharingSyncResult *)v6 error];
        LOBYTE(v13) = [v13 isEqual:v23];

        if (lookupInfo == v15)
        {

          goto LABEL_27;
        }

        goto LABEL_25;
      }
    }
    if (lookupInfo == v15)
    {
LABEL_25:

      goto LABEL_27;
    }

LABEL_24:
    id v10 = v29;

    BOOL v24 = accountID == v8;
    goto LABEL_28;
  }
  LOBYTE(v13) = 1;
LABEL_32:

  return (char)v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_accountID hash];
  NSUInteger v4 = [(NSString *)self->_lookupInfo hash] ^ v3;
  return v4 ^ [(NSError *)self->_error hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  accountID = self->_accountID;
  id v5 = a3;
  [v5 encodeObject:accountID forKey:@"accountID"];
  [v5 encodeObject:self->_lookupInfo forKey:@"lookupInfo"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (HKClinicalSharingSyncResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lookupInfo"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    self = [(HKClinicalSharingSyncResult *)self initWithAccountID:v5 lookupInfo:v6 error:v7];

    id v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v8 = 0;
  }

  return v8;
}

- (NSUUID)accountID
{
  return self->_accountID;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)lookupInfo
{
  return self->_lookupInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end