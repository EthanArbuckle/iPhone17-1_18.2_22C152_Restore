@interface CTDanglingPlanItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isPrivateNetworkSim;
- (CTDanglingPlanItem)initWithCoder:(id)a3;
- (CTDanglingPlanItem)initWithIccid:(id)a3 phoneNumber:(id)a4 label:(id)a5 labelID:(id)a6 isPrivateNetworkSim:(BOOL)a7;
- (CTUserLabel)userLabel;
- (NSString)iccid;
- (NSString)phoneNumber;
- (NSString)simLabelID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIccid:(id)a3;
- (void)setIsPrivateNetworkSim:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSimLabelID:(id)a3;
- (void)setUserLabel:(id)a3;
@end

@implementation CTDanglingPlanItem

- (CTDanglingPlanItem)initWithIccid:(id)a3 phoneNumber:(id)a4 label:(id)a5 labelID:(id)a6 isPrivateNetworkSim:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CTDanglingPlanItem;
  v16 = [(CTDanglingPlanItem *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(CTDanglingPlanItem *)v16 setIccid:v12];
    [(CTDanglingPlanItem *)v17 setPhoneNumber:v13];
    [(CTDanglingPlanItem *)v17 setSimLabelID:v15];
    [(CTDanglingPlanItem *)v17 setUserLabel:v14];
    [(CTDanglingPlanItem *)v17 setIsPrivateNetworkSim:v7];
  }

  return v17;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTDanglingPlanItem *)self iccid];
  [v3 appendFormat:@", iccid=%@", v4];

  v5 = [(CTDanglingPlanItem *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber=%@", v5];

  v6 = [(CTDanglingPlanItem *)self simLabelID];
  [v3 appendFormat:@", simLabelID=%@", v6];

  BOOL v7 = [(CTDanglingPlanItem *)self userLabel];
  [v3 appendFormat:@", userLabel=%@", v7];

  [v3 appendFormat:@", isPrivateNetworkSim=%d", -[CTDanglingPlanItem isPrivateNetworkSim](self, "isPrivateNetworkSim")];
  [v3 appendString:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTDanglingPlanItem *)self iccid];
  v6 = (void *)[v5 copy];
  [v4 setIccid:v6];

  BOOL v7 = [(CTDanglingPlanItem *)self phoneNumber];
  v8 = (void *)[v7 copy];
  [v4 setPhoneNumber:v8];

  v9 = [(CTDanglingPlanItem *)self simLabelID];
  v10 = (void *)[v9 copy];
  [v4 setSimLabelID:v10];

  v11 = [(CTDanglingPlanItem *)self userLabel];
  id v12 = (void *)[v11 copy];
  [v4 setUserLabel:v12];

  objc_msgSend(v4, "setIsPrivateNetworkSim:", -[CTDanglingPlanItem isPrivateNetworkSim](self, "isPrivateNetworkSim"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(CTDanglingPlanItem *)self iccid];
  [v8 encodeObject:v4 forKey:@"iccid"];

  v5 = [(CTDanglingPlanItem *)self phoneNumber];
  [v8 encodeObject:v5 forKey:@"phoneNumber"];

  v6 = [(CTDanglingPlanItem *)self simLabelID];
  [v8 encodeObject:v6 forKey:@"simLabelID"];

  BOOL v7 = [(CTDanglingPlanItem *)self userLabel];
  [v8 encodeObject:v7 forKey:@"label"];

  objc_msgSend(v8, "encodeBool:forKey:", -[CTDanglingPlanItem isPrivateNetworkSim](self, "isPrivateNetworkSim"), @"isPrivateNetworkSim");
}

- (CTDanglingPlanItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTDanglingPlanItem;
  v5 = [(CTDanglingPlanItem *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    [(CTDanglingPlanItem *)v5 setIccid:v6];

    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    [(CTDanglingPlanItem *)v5 setPhoneNumber:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simLabelID"];
    [(CTDanglingPlanItem *)v5 setSimLabelID:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    [(CTDanglingPlanItem *)v5 setUserLabel:v9];

    -[CTDanglingPlanItem setIsPrivateNetworkSim:](v5, "setIsPrivateNetworkSim:", [v4 decodeBoolForKey:@"isPrivateNetworkSim"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)simLabelID
{
  return self->_simLabelID;
}

- (void)setSimLabelID:(id)a3
{
}

- (CTUserLabel)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
}

- (BOOL)isPrivateNetworkSim
{
  return self->_isPrivateNetworkSim;
}

- (void)setIsPrivateNetworkSim:(BOOL)a3
{
  self->_isPrivateNetworkSim = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_simLabelID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end