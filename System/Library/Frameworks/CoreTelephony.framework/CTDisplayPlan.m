@interface CTDisplayPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhysical;
- (CTDisplayPlan)initWithCoder:(id)a3;
- (CTDisplayPlan)initWithPlan:(id)a3 status:(int64_t)a4 attributes:(unint64_t)a5 isPhysical:(BOOL)a6 carrierName:(id)a7 phoneNumber:(id)a8 label:(id)a9;
- (CTPlan)plan;
- (NSString)carrierName;
- (NSString)label;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (unint64_t)attributes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTDisplayPlan

- (CTDisplayPlan)initWithPlan:(id)a3 status:(int64_t)a4 attributes:(unint64_t)a5 isPhysical:(BOOL)a6 carrierName:(id)a7 phoneNumber:(id)a8 label:(id)a9
{
  id v22 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CTDisplayPlan;
  v18 = [(CTDisplayPlan *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_plan, a3);
    v19->_status = a4;
    v19->_attributes = a5;
    v19->_isPhysical = a6;
    objc_storeStrong((id *)&v19->_carrierName, a7);
    objc_storeStrong((id *)&v19->_phoneNumber, a8);
    objc_storeStrong((id *)&v19->_label, a9);
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTDisplayPlan *)self plan];
  v5 = [v4 description];
  [v3 appendFormat:@" id=%@", v5];

  v6 = [(CTDisplayPlan *)self carrierName];
  [v3 appendFormat:@" carrierName=%@", v6];

  v7 = [(CTDisplayPlan *)self phoneNumber];
  [v3 appendFormat:@" phoneNumber=%@", v7];

  objc_msgSend(v3, "appendFormat:", @" status=%s", CTPlanStatusAsString(-[CTDisplayPlan status](self, "status")));
  v8 = CTPlanAttributeSetAsString([(CTDisplayPlan *)self attributes]);
  [v3 appendFormat:@" attributes=%@", v8];

  v9 = [(CTDisplayPlan *)self label];
  [v3 appendFormat:@" label=%@", v9];

  BOOL v10 = [(CTDisplayPlan *)self isPhysical];
  v11 = "NO";
  if (v10) {
    v11 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @" isPhysical=%s", v11);
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTDisplayPlan *)a3;
  if (v6 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CTDisplayPlan *)self plan];
      v8 = [(CTDisplayPlan *)v6 plan];
      if (v7 != v8)
      {
        v3 = [(CTDisplayPlan *)self plan];
        v4 = [(CTDisplayPlan *)v6 plan];
        if (![v3 isEqual:v4])
        {
          LOBYTE(v9) = 0;
          goto LABEL_17;
        }
      }
      int64_t v10 = [(CTDisplayPlan *)self status];
      if (v10 == [(CTDisplayPlan *)v6 status])
      {
        unint64_t v11 = [(CTDisplayPlan *)self attributes];
        if (v11 == [(CTDisplayPlan *)v6 attributes])
        {
          v12 = [(CTDisplayPlan *)self carrierName];
          v13 = [(CTDisplayPlan *)v6 carrierName];
          if ([v12 isEqualToString:v13])
          {
            v14 = [(CTDisplayPlan *)self phoneNumber];
            id v15 = [(CTDisplayPlan *)v6 phoneNumber];
            if ([v14 isEqualToString:v15])
            {
              id v22 = v14;
              uint64_t v16 = [(CTDisplayPlan *)self label];
              uint64_t v17 = [(CTDisplayPlan *)v6 label];
              objc_super v23 = (void *)v16;
              v18 = (void *)v16;
              v19 = (void *)v17;
              if ([v18 isEqualToString:v17])
              {
                BOOL v20 = [(CTDisplayPlan *)self isPhysical];
                BOOL v9 = v20 ^ [(CTDisplayPlan *)v6 isPhysical] ^ 1;
              }
              else
              {
                LOBYTE(v9) = 0;
              }

              v14 = v22;
            }
            else
            {
              LOBYTE(v9) = 0;
            }

LABEL_16:
            if (v7 == v8)
            {
LABEL_18:

              goto LABEL_19;
            }
LABEL_17:

            goto LABEL_18;
          }
        }
      }
      LOBYTE(v9) = 0;
      goto LABEL_16;
    }
    LOBYTE(v9) = 0;
  }
LABEL_19:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(CTPlan *)self->_plan copyWithZone:a3];
  int64_t status = self->_status;
  unint64_t attributes = self->_attributes;
  BOOL isPhysical = self->_isPhysical;
  int64_t v10 = (void *)[(NSString *)self->_carrierName copyWithZone:a3];
  unint64_t v11 = (void *)[(NSString *)self->_phoneNumber copyWithZone:a3];
  v12 = (void *)[(NSString *)self->_label copyWithZone:a3];
  v13 = (void *)[v5 initWithPlan:v6 status:status attributes:attributes isPhysical:isPhysical carrierName:v10 phoneNumber:v11 label:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTDisplayPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTDisplayPlan;
  v5 = [(CTDisplayPlan *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plan"];
    plan = v5->_plan;
    v5->_plan = (CTPlan *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierName"];
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    v5->_int64_t status = [v4 decodeIntegerForKey:@"status"];
    v5->_unint64_t attributes = [v4 decodeIntegerForKey:@"attributes"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v12;

    v5->_BOOL isPhysical = [v4 decodeBoolForKey:@"isPhysical"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_plan forKey:@"plan"];
  carrierName = self->_carrierName;
  if (carrierName) {
    [v6 encodeObject:carrierName forKey:@"carrierName"];
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    [v6 encodeObject:phoneNumber forKey:@"phoneNumber"];
  }
  [v6 encodeInteger:self->_status forKey:@"status"];
  [v6 encodeInteger:self->_attributes forKey:@"attributes"];
  [v6 encodeObject:self->_label forKey:@"label"];
  [v6 encodeBool:self->_isPhysical forKey:@"isPhysical"];
}

- (CTPlan)plan
{
  return self->_plan;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (BOOL)isPhysical
{
  return self->_isPhysical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);

  objc_storeStrong((id *)&self->_plan, 0);
}

@end