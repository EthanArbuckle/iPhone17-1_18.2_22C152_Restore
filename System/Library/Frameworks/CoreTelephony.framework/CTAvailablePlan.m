@interface CTAvailablePlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTAvailablePlan)initWithCoder:(id)a3;
- (CTAvailablePlan)initWithIccid:(id)a3;
- (NSString)iccid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTAvailablePlan

- (CTAvailablePlan)initWithIccid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTAvailablePlan;
  v6 = [(CTAvailablePlan *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iccid, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", iccid=%@", self->_iccid];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTAvailablePlan;
  if ([(CTPlan *)&v11 isEqual:v4])
  {
    id v5 = [(CTAvailablePlan *)self iccid];
    v6 = [v4 iccid];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      v7 = [(CTAvailablePlan *)self iccid];
      v8 = [v4 iccid];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTAvailablePlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTAvailablePlan;
  id v5 = [(CTPlan *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTAvailablePlan;
  id v4 = a3;
  [(CTPlan *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_iccid, @"iccid", v5.receiver, v5.super_class);
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void).cxx_destruct
{
}

@end