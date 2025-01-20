@interface CTPNRContextInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPNRContextInfo:(id)a3;
- (BOOL)isReady;
- (CTPNRContextInfo)init;
- (CTPNRContextInfo)initWithCoder:(id)a3;
- (NSString)imsi;
- (NSString)phoneNumber;
- (NSString)phoneNumberOnSIM;
- (NSString)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImsi:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberOnSIM:(id)a3;
- (void)setPlmn:(id)a3;
@end

@implementation CTPNRContextInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", isReady=%d", -[CTPNRContextInfo isReady](self, "isReady")];
  v4 = [(CTPNRContextInfo *)self plmn];
  [v3 appendFormat:@", plmn=%@", v4];

  v5 = [(CTPNRContextInfo *)self imsi];
  [v3 appendFormat:@", imsi=%@", v5];

  v6 = [(CTPNRContextInfo *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber=%@", v6];

  v7 = [(CTPNRContextInfo *)self phoneNumberOnSIM];
  [v3 appendFormat:@", phoneNumberOnSIM=%@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (CTPNRContextInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTPNRContextInfo;
  v2 = [(CTPNRContextInfo *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CTPNRContextInfo *)v2 setIsReady:0];
  }
  return v3;
}

- (BOOL)isEqualToPNRContextInfo:(id)a3
{
  id v8 = a3;
  int v9 = [(CTPNRContextInfo *)self isReady];
  if (v9 != [v8 isReady])
  {
    char v10 = 0;
    goto LABEL_43;
  }
  v11 = [(CTPNRContextInfo *)self imsi];
  if (!v11)
  {
    v6 = [v8 imsi];
    if (!v6)
    {
      int v33 = 0;
      goto LABEL_9;
    }
  }
  v4 = [(CTPNRContextInfo *)self imsi];
  objc_super v5 = [v8 imsi];
  if ([v4 isEqualToString:v5])
  {
    int v33 = 1;
LABEL_9:
    v12 = [(CTPNRContextInfo *)self plmn];
    if (v12 || ([v8 plmn], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(CTPNRContextInfo *)self plmn];
      v32 = [v8 plmn];
      if (!objc_msgSend(v13, "isEqualToString:"))
      {
        char v10 = 0;
        goto LABEL_35;
      }
      v28 = v13;
      int v31 = 1;
    }
    else
    {
      int v31 = 0;
    }
    v14 = [(CTPNRContextInfo *)self phoneNumber];
    if (v14 || ([v8 phoneNumber], (v24 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = v6;
      v16 = [(CTPNRContextInfo *)self phoneNumber];
      v29 = [v8 phoneNumber];
      v30 = v16;
      if (!objc_msgSend(v16, "isEqualToString:"))
      {
        char v10 = 0;
        v6 = v15;
LABEL_30:

        goto LABEL_31;
      }
      v27 = v3;
      int v26 = 1;
      v6 = v15;
    }
    else
    {
      v27 = v3;
      v24 = 0;
      int v26 = 0;
    }
    v17 = [(CTPNRContextInfo *)self phoneNumberOnSIM];
    if (v17 || ([v8 phoneNumberOnSIM], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v25 = v6;
      v18 = [(CTPNRContextInfo *)self phoneNumberOnSIM];
      v19 = [v8 phoneNumberOnSIM];
      char v10 = [v18 isEqualToString:v19];

      if (v17)
      {

        if (v26)
        {
          v6 = v25;
          v3 = v27;
          goto LABEL_30;
        }
        v6 = v25;
        v3 = v27;
LABEL_31:
        if (!v14) {

        }
        if (!v31) {
          goto LABEL_36;
        }
        v13 = v28;
LABEL_35:

LABEL_36:
        if (!v12) {

        }
        if (v33)
        {
        }
        goto LABEL_40;
      }
      v6 = v25;
      v3 = v27;
      char v20 = v26;
      v21 = (void *)v23;
    }
    else
    {
      v21 = 0;
      char v10 = 1;
      v3 = v27;
      char v20 = v26;
    }

    if (v20) {
      goto LABEL_30;
    }
    goto LABEL_31;
  }

  char v10 = 0;
LABEL_40:
  if (!v11) {

  }
LABEL_43:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPNRContextInfo *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTPNRContextInfo *)self isEqualToPNRContextInfo:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTPNRContextInfo allocWithZone:a3];
  [(CTPNRContextInfo *)v4 setIsReady:self->_isReady];
  [(CTPNRContextInfo *)v4 setImsi:self->_imsi];
  [(CTPNRContextInfo *)v4 setPlmn:self->_plmn];
  [(CTPNRContextInfo *)v4 setPhoneNumber:self->_phoneNumber];
  [(CTPNRContextInfo *)v4 setPhoneNumberOnSIM:self->_phoneNumberOnSIM];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isReady = self->_isReady;
  id v5 = a3;
  [v5 encodeBool:isReady forKey:@"registered"];
  [v5 encodeObject:self->_plmn forKey:@"plmn"];
  [v5 encodeObject:self->_imsi forKey:@"imsi"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phone_number"];
  [v5 encodeObject:self->_phoneNumberOnSIM forKey:@"phone_number_on_sim"];
}

- (CTPNRContextInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTPNRContextInfo;
  id v5 = [(CTPNRContextInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plmn"];
    plmn = v5->_plmn;
    v5->_plmn = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imsi"];
    imsi = v5->_imsi;
    v5->_imsi = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phone_number"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phone_number_on_sim"];
    phoneNumberOnSIM = v5->_phoneNumberOnSIM;
    v5->_phoneNumberOnSIM = (NSString *)v12;

    v5->_BOOL isReady = [v4 decodeBoolForKey:@"registered"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_BOOL isReady = a3;
}

- (NSString)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (NSString)imsi
{
  return self->_imsi;
}

- (void)setImsi:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumberOnSIM
{
  return self->_phoneNumberOnSIM;
}

- (void)setPhoneNumberOnSIM:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberOnSIM, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_imsi, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end