@interface CTPlanIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlanIdentifier)initWithCoder:(id)a3;
- (CTPlanIdentifier)initWithIccid:(id)a3 carrierName:(id)a4 phoneNumber:(id)a5 countryCode:(id)a6 label:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11;
- (NSString)carrierName;
- (NSString)countryCode;
- (NSString)gid1;
- (NSString)gid2;
- (NSString)iccid;
- (NSString)label;
- (NSString)mcc;
- (NSString)mnc;
- (NSString)phoneNumber;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setGid1:(id)a3;
- (void)setGid2:(id)a3;
- (void)setIccid:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMcc:(id)a3;
- (void)setMnc:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation CTPlanIdentifier

- (CTPlanIdentifier)initWithIccid:(id)a3 carrierName:(id)a4 phoneNumber:(id)a5 countryCode:(id)a6 label:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v46.receiver = self;
  v46.super_class = (Class)CTPlanIdentifier;
  v26 = [(CTPlanIdentifier *)&v46 init];
  if (v26)
  {
    uint64_t v27 = [v17 copy];
    iccid = v26->_iccid;
    v26->_iccid = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    carrierName = v26->_carrierName;
    v26->_carrierName = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    phoneNumber = v26->_phoneNumber;
    v26->_phoneNumber = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    countryCode = v26->_countryCode;
    v26->_countryCode = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    label = v26->_label;
    v26->_label = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    mcc = v26->_mcc;
    v26->_mcc = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    mnc = v26->_mnc;
    v26->_mnc = (NSString *)v39;

    uint64_t v41 = [v24 copy];
    gid1 = v26->_gid1;
    v26->_gid1 = (NSString *)v41;

    uint64_t v43 = [v25 copy];
    gid2 = v26->_gid2;
    v26->_gid2 = (NSString *)v43;
  }
  return v26;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPlanIdentifier *)self iccid];
  [v3 appendFormat:@" iccid=%@", v4];

  v5 = [(CTPlanIdentifier *)self carrierName];
  [v3 appendFormat:@" carrierName=%@", v5];

  v6 = [(CTPlanIdentifier *)self phoneNumber];
  [v3 appendFormat:@" phoneNumber=%@", v6];

  v7 = [(CTPlanIdentifier *)self countryCode];
  [v3 appendFormat:@" countryCode=%@", v7];

  v8 = [(CTPlanIdentifier *)self label];
  [v3 appendFormat:@" label=%@", v8];

  v9 = [(CTPlanIdentifier *)self mcc];
  [v3 appendFormat:@" mcc=%@", v9];

  v10 = [(CTPlanIdentifier *)self mnc];
  [v3 appendFormat:@" mnc=%@", v10];

  v11 = [(CTPlanIdentifier *)self gid1];
  [v3 appendFormat:@" gid1=%@", v11];

  v12 = [(CTPlanIdentifier *)self gid2];
  [v3 appendFormat:@" gid2=%@", v12];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CTPlanIdentifier *)a3;
  if (v5 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(CTPlanIdentifier *)self iccid];
      v7 = [(CTPlanIdentifier *)v5 iccid];
      if (v6 != v7)
      {
        v8 = [(CTPlanIdentifier *)self iccid];
        v3 = [(CTPlanIdentifier *)v5 iccid];
        v64 = v8;
        if (![v8 isEqualToString:v3])
        {
          char v9 = 0;
          goto LABEL_49;
        }
      }
      v10 = [(CTPlanIdentifier *)self carrierName];
      v11 = [(CTPlanIdentifier *)v5 carrierName];
      if (v10 != v11)
      {
        v12 = [(CTPlanIdentifier *)self carrierName];
        v13 = [(CTPlanIdentifier *)v5 carrierName];
        if (![v12 isEqualToString:v13])
        {
          char v9 = 0;
LABEL_47:

LABEL_48:
          if (v6 == v7)
          {
LABEL_50:

            goto LABEL_51;
          }
LABEL_49:

          goto LABEL_50;
        }
        v61 = v13;
        v62 = v12;
      }
      v14 = [(CTPlanIdentifier *)self phoneNumber];
      v15 = [(CTPlanIdentifier *)v5 phoneNumber];
      if (v14 != v15)
      {
        v16 = v3;
        id v17 = [(CTPlanIdentifier *)self phoneNumber];
        v59 = [(CTPlanIdentifier *)v5 phoneNumber];
        v60 = v17;
        if (!objc_msgSend(v17, "isEqualToString:"))
        {
          char v9 = 0;
          v3 = v16;
LABEL_45:

LABEL_46:
          v13 = v61;
          v12 = v62;
          if (v10 == v11) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }
        v3 = v16;
      }
      uint64_t v18 = [(CTPlanIdentifier *)self countryCode];
      uint64_t v58 = [(CTPlanIdentifier *)v5 countryCode];
      v63 = (void *)v18;
      if (v18 != v58)
      {
        id v19 = [(CTPlanIdentifier *)self countryCode];
        v55 = [(CTPlanIdentifier *)v5 countryCode];
        v56 = v19;
        if (!objc_msgSend(v19, "isEqualToString:"))
        {
          char v9 = 0;
          id v20 = (void *)v58;
LABEL_43:

LABEL_44:
          if (v14 == v15) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
      }
      uint64_t v21 = [(CTPlanIdentifier *)self label];
      [(CTPlanIdentifier *)v5 label];
      uint64_t v54 = v57 = (void *)v21;
      if (v21 != v54)
      {
        id v22 = [(CTPlanIdentifier *)self label];
        v51 = [(CTPlanIdentifier *)v5 label];
        v52 = v22;
        if (!objc_msgSend(v22, "isEqualToString:"))
        {
          char v9 = 0;
          id v23 = (void *)v54;
LABEL_41:

LABEL_42:
          id v20 = (void *)v58;
          if (v63 == (void *)v58) {
            goto LABEL_44;
          }
          goto LABEL_43;
        }
      }
      uint64_t v24 = [(CTPlanIdentifier *)self mcc];
      uint64_t v50 = [(CTPlanIdentifier *)v5 mcc];
      v53 = (void *)v24;
      if (v24 != v50)
      {
        id v25 = [(CTPlanIdentifier *)self mcc];
        objc_super v46 = [(CTPlanIdentifier *)v5 mcc];
        v47 = v25;
        if (!objc_msgSend(v25, "isEqualToString:"))
        {
          char v9 = 0;
          v26 = (void *)v50;
LABEL_39:

LABEL_40:
          id v23 = (void *)v54;
          if (v57 == (void *)v54) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
      }
      uint64_t v27 = [(CTPlanIdentifier *)self mnc];
      uint64_t v48 = [(CTPlanIdentifier *)v5 mnc];
      v49 = (void *)v27;
      if (v27 != v48)
      {
        v28 = [(CTPlanIdentifier *)self mnc];
        uint64_t v43 = [(CTPlanIdentifier *)v5 mnc];
        v44 = v28;
        if (!objc_msgSend(v28, "isEqualToString:"))
        {
          char v9 = 0;
          uint64_t v29 = (void *)v48;
LABEL_37:

LABEL_38:
          v26 = (void *)v50;
          if (v53 == (void *)v50) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
      }
      uint64_t v30 = [(CTPlanIdentifier *)self gid1];
      [(CTPlanIdentifier *)v5 gid1];
      uint64_t v42 = v45 = (void *)v30;
      if (v30 == v42
        || ([(CTPlanIdentifier *)self gid1],
            uint64_t v31 = objc_claimAutoreleasedReturnValue(),
            [(CTPlanIdentifier *)v5 gid1],
            v40 = objc_claimAutoreleasedReturnValue(),
            uint64_t v41 = v31,
            objc_msgSend(v31, "isEqualToString:")))
      {
        uint64_t v33 = [(CTPlanIdentifier *)self gid2];
        uint64_t v34 = [(CTPlanIdentifier *)v5 gid2];
        if (v33 == (void *)v34)
        {

          char v9 = 1;
        }
        else
        {
          uint64_t v39 = (void *)v34;
          uint64_t v37 = [(CTPlanIdentifier *)self gid2];
          [(CTPlanIdentifier *)v5 gid2];
          uint64_t v35 = v38 = v33;
          char v9 = [v37 isEqualToString:v35];
        }
        v32 = (void *)v42;
        if (v45 == (void *)v42)
        {
LABEL_36:

          uint64_t v29 = (void *)v48;
          if (v49 == (void *)v48) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
      }
      else
      {
        char v9 = 0;
        v32 = (void *)v42;
      }

      goto LABEL_36;
    }
    char v9 = 0;
  }
LABEL_51:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTPlanIdentifier;
  v5 = [(CTPlanIdentifier *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierName"];
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcc"];
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnc"];
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid1"];
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid2"];
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  iccid = self->_iccid;
  id v5 = a3;
  [v5 encodeObject:iccid forKey:@"iccid"];
  [v5 encodeObject:self->_carrierName forKey:@"carrierName"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_mcc forKey:@"mcc"];
  [v5 encodeObject:self->_mnc forKey:@"mnc"];
  [v5 encodeObject:self->_gid1 forKey:@"gid1"];
  [v5 encodeObject:self->_gid2 forKey:@"gid2"];
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
}

- (NSString)gid1
{
  return self->_gid1;
}

- (void)setGid1:(id)a3
{
}

- (NSString)gid2
{
  return self->_gid2;
}

- (void)setGid2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);

  objc_storeStrong((id *)&self->_iccid, 0);
}

@end