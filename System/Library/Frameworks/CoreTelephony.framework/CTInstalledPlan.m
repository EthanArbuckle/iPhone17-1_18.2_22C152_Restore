@interface CTInstalledPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (CTInstalledPlan)init;
- (CTInstalledPlan)initWithCoder:(id)a3;
- (CTPlanIdentifier)planID;
- (CTPlanTransferAttributes)transferAttributes;
- (id)carrierName;
- (id)description;
- (id)iccid;
- (id)phoneNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setPlanID:(id)a3;
- (void)setTransferAttributes:(id)a3;
@end

@implementation CTInstalledPlan

- (CTInstalledPlan)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTInstalledPlan;
  v2 = [(CTInstalledPlan *)&v7 init];
  v3 = v2;
  if (v2)
  {
    planID = v2->_planID;
    v2->_planID = 0;

    v3->_isSelected = 0;
    transferAttributes = v3->_transferAttributes;
    v3->_transferAttributes = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTInstalledPlan *)self planID];
  [v3 appendFormat:@" planID=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" isSelected=%d", -[CTInstalledPlan isSelected](self, "isSelected"));
  v5 = [(CTInstalledPlan *)self transferAttributes];
  [v3 appendFormat:@" transferAttributes=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTInstalledPlan *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(CTInstalledPlan *)self planID];
      v8 = [(CTInstalledPlan *)v6 planID];
      if (v7 == v8
        || ([(CTInstalledPlan *)self planID],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTInstalledPlan *)v6 planID],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        BOOL v10 = [(CTInstalledPlan *)self isSelected];
        if (v10 == [(CTInstalledPlan *)v6 isSelected])
        {
          v11 = [(CTInstalledPlan *)self transferAttributes];
          uint64_t v12 = [(CTInstalledPlan *)v6 transferAttributes];
          if (v11 == (void *)v12)
          {

            char v9 = 1;
          }
          else
          {
            v13 = (void *)v12;
            v14 = [(CTInstalledPlan *)self transferAttributes];
            v15 = [(CTInstalledPlan *)v6 transferAttributes];
            char v9 = [v14 isEqual:v15];
          }
        }
        else
        {
          char v9 = 0;
        }
        if (v7 == v8) {
          goto LABEL_15;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    char v9 = 0;
  }
LABEL_16:

  return v9;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTInstalledPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTInstalledPlan;
  v5 = [(CTInstalledPlan *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planID"];
    planID = v5->_planID;
    v5->_planID = (CTPlanIdentifier *)v6;

    v5->_isSelected = [v4 decodeBoolForKey:@"isSelected"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferAttributes"];
    transferAttributes = v5->_transferAttributes;
    v5->_transferAttributes = (CTPlanTransferAttributes *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  planID = self->_planID;
  id v5 = a3;
  [v5 encodeObject:planID forKey:@"planID"];
  [v5 encodeBool:self->_isSelected forKey:@"isSelected"];
  [v5 encodeObject:self->_transferAttributes forKey:@"transferAttributes"];
}

- (CTPlanIdentifier)planID
{
  return self->_planID;
}

- (void)setPlanID:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (CTPlanTransferAttributes)transferAttributes
{
  return self->_transferAttributes;
}

- (void)setTransferAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferAttributes, 0);

  objc_storeStrong((id *)&self->_planID, 0);
}

@end