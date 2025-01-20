@interface CTCellularPlanCrossPlatformLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCellularPlanCrossPlatformLabel)initWithCoder:(id)a3;
- (CTCellularPlanCrossPlatformLabel)initWithPhoneNumber:(id)a3 labelName:(id)a4;
- (NSString)labelName;
- (NSString)phoneNumber;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCellularPlanCrossPlatformLabel

- (CTCellularPlanCrossPlatformLabel)initWithPhoneNumber:(id)a3 labelName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTCellularPlanCrossPlatformLabel;
  v9 = [(CTCellularPlanCrossPlatformLabel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_phoneNumber, a3);
    objc_storeStrong((id *)&v10->_labelName, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularPlanCrossPlatformLabel *)self phoneNumber];

  if (v4)
  {
    v5 = [(CTCellularPlanCrossPlatformLabel *)self phoneNumber];
    [v3 appendFormat:@" phoneNumber=%@", v5];
  }
  v6 = [(CTCellularPlanCrossPlatformLabel *)self labelName];

  if (v6)
  {
    id v7 = [(CTCellularPlanCrossPlatformLabel *)self labelName];
    [v3 appendFormat:@" labelName=%@", v7];
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCellularPlanCrossPlatformLabel *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTCellularPlanCrossPlatformLabel *)self phoneNumber];
      v6 = [(CTCellularPlanCrossPlatformLabel *)v4 phoneNumber];
      if ([v5 isEqualToString:v6])
      {
        id v7 = [(CTCellularPlanCrossPlatformLabel *)self labelName];
        id v8 = [(CTCellularPlanCrossPlatformLabel *)v4 labelName];
        char v9 = [v7 isEqualToString:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanCrossPlatformLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCellularPlanCrossPlatformLabel;
  v5 = [(CTCellularPlanCrossPlatformLabel *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelName"];
    labelName = v5->_labelName;
    v5->_labelName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTCellularPlanCrossPlatformLabel *)self phoneNumber];
  [v4 encodeObject:v5 forKey:@"phoneNumber"];

  id v6 = [(CTCellularPlanCrossPlatformLabel *)self labelName];
  [v4 encodeObject:v6 forKey:@"labelName"];
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelName, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end