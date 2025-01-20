@interface CTPNRDataType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTPNRDataType:(id)a3;
- (CTPNRDataType)init;
- (CTPNRDataType)initWithCoder:(id)a3;
- (NSString)destAddr;
- (NSString)svcCenterAddr;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)pnrMechanism;
- (void)encodeWithCoder:(id)a3;
- (void)setDestAddr:(id)a3;
- (void)setPnrMechanism:(int64_t)a3;
- (void)setSvcCenterAddr:(id)a3;
@end

@implementation CTPNRDataType

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", mechanism=%ld", -[CTPNRDataType pnrMechanism](self, "pnrMechanism")];
  v4 = [(CTPNRDataType *)self svcCenterAddr];
  [v3 appendFormat:@", serviceCenter=%@", v4];

  v5 = [(CTPNRDataType *)self destAddr];
  [v3 appendFormat:@", destination=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (CTPNRDataType)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTPNRDataType;
  result = [(CTPNRDataType *)&v3 init];
  if (result) {
    result->_pnrMechanism = 0;
  }
  return result;
}

- (BOOL)isEqualToCTPNRDataType:(id)a3
{
  id v7 = a3;
  if (!v7 || (int64_t v8 = -[CTPNRDataType pnrMechanism](self, "pnrMechanism"), v8 != [v7 pnrMechanism]))
  {
    BOOL v11 = 0;
    goto LABEL_18;
  }
  v9 = [(CTPNRDataType *)self svcCenterAddr];
  if (!v9)
  {
    objc_super v3 = [v7 svcCenterAddr];
    if (!v3)
    {
      int v12 = 0;
      goto LABEL_10;
    }
  }
  v4 = [(CTPNRDataType *)self svcCenterAddr];
  v10 = [v7 svcCenterAddr];
  if (v4 == v10)
  {
    int v12 = 1;
LABEL_10:
    v13 = [(CTPNRDataType *)self destAddr];
    if (v13 || ([v7 destAddr], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(CTPNRDataType *)self destAddr];
      v15 = [v7 destAddr];
      BOOL v11 = v14 == v15;

      if (v13)
      {

        if (!v12) {
          goto LABEL_15;
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      BOOL v11 = 1;
    }

    if ((v12 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  BOOL v11 = 0;
LABEL_15:
  if (!v9) {

  }
LABEL_18:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPNRDataType *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTPNRDataType *)self isEqualToCTPNRDataType:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTPNRDataType allocWithZone:a3];
  [(CTPNRDataType *)v4 setPnrMechanism:self->_pnrMechanism];
  [(CTPNRDataType *)v4 setSvcCenterAddr:self->_svcCenterAddr];
  [(CTPNRDataType *)v4 setDestAddr:self->_destAddr];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t pnrMechanism = self->_pnrMechanism;
  id v5 = a3;
  [v5 encodeInteger:pnrMechanism forKey:@"pnr_mechanism"];
  [v5 encodeObject:self->_svcCenterAddr forKey:@"svc_center_addr"];
  [v5 encodeObject:self->_destAddr forKey:@"dst_addr"];
}

- (CTPNRDataType)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPNRDataType;
  id v5 = [(CTPNRDataType *)&v11 init];
  if (v5)
  {
    v5->_int64_t pnrMechanism = [v4 decodeIntegerForKey:@"pnr_mechanism"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"svc_center_addr"];
    svcCenterAddr = v5->_svcCenterAddr;
    v5->_svcCenterAddr = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dst_addr"];
    destAddr = v5->_destAddr;
    v5->_destAddr = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pnrMechanism
{
  return self->_pnrMechanism;
}

- (void)setPnrMechanism:(int64_t)a3
{
  self->_int64_t pnrMechanism = a3;
}

- (NSString)svcCenterAddr
{
  return self->_svcCenterAddr;
}

- (void)setSvcCenterAddr:(id)a3
{
}

- (NSString)destAddr
{
  return self->_destAddr;
}

- (void)setDestAddr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destAddr, 0);

  objc_storeStrong((id *)&self->_svcCenterAddr, 0);
}

@end