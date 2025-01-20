@interface CTQoS
+ (BOOL)supportsSecureCoding;
- (CTQoS)initWithCoder:(id)a3;
- (NSArray)filters;
- (NSNumber)bitRateMax;
- (NSNumber)bitRateMin;
- (NSNumber)gbr;
- (NSNumber)qci;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBitRateMax:(id)a3;
- (void)setBitRateMin:(id)a3;
- (void)setFilters:(id)a3;
- (void)setQci:(id)a3;
@end

@implementation CTQoS

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTQoS *)self qci];

  if (v4)
  {
    v5 = [(CTQoS *)self qci];
    [v3 appendFormat:@", qci=%@", v5];
  }
  v6 = [(CTQoS *)self bitRateMax];

  if (v6)
  {
    v7 = [(CTQoS *)self bitRateMax];
    [v3 appendFormat:@", bitRateMax=%@", v7];
  }
  v8 = [(CTQoS *)self bitRateMin];

  if (v8)
  {
    v9 = [(CTQoS *)self bitRateMin];
    [v3 appendFormat:@", bitRateMin=%@", v9];
  }
  v10 = [(CTQoS *)self filters];

  if (v10)
  {
    v11 = [(CTQoS *)self filters];
    [v3 appendFormat:@", filters=%@", v11];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTQoS *)self qci];
  v6 = (void *)[v5 copy];
  [v4 setQci:v6];

  v7 = [(CTQoS *)self bitRateMax];
  v8 = (void *)[v7 copy];
  [v4 setBitRateMax:v8];

  v9 = [(CTQoS *)self bitRateMin];
  v10 = (void *)[v9 copy];
  [v4 setBitRateMin:v10];

  v11 = [(CTQoS *)self filters];
  v12 = (void *)[v11 copy];
  [v4 setFilters:v12];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTQoS *)self qci];
  [v4 encodeObject:v5 forKey:@"qci"];

  v6 = [(CTQoS *)self bitRateMax];
  [v4 encodeObject:v6 forKey:@"bitRateMax"];

  v7 = [(CTQoS *)self bitRateMin];
  [v4 encodeObject:v7 forKey:@"bitRateMin"];

  id v8 = [(CTQoS *)self filters];
  [v4 encodeObject:v8 forKey:@"filters"];
}

- (CTQoS)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CTQoS;
  v5 = [(CTQoS *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qci"];
    qci = v5->_qci;
    v5->_qci = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitRateMax"];
    bitRateMax = v5->_bitRateMax;
    v5->_bitRateMax = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitRateMin"];
    bitRateMin = v5->_bitRateMin;
    v5->_bitRateMin = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"filters"];
    filters = v5->_filters;
    v5->_filters = (NSArray *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)gbr
{
  v3 = [(CTQoS *)self qci];

  if (v3)
  {
    id v4 = [(CTQoS *)self qci];
    int v5 = [v4 unsignedIntValue];

    uint64_t v6 = 1;
    char v7 = v5 - 65;
    if ((v5 - 65) <= 0x14)
    {
      if (((1 << v7) & 0xFC7) != 0)
      {
LABEL_8:
        uint64_t v8 = (void *)[objc_alloc(NSNumber) initWithBool:v6];
        goto LABEL_10;
      }
      if (((1 << v7) & 0x1EC030) != 0) {
        goto LABEL_6;
      }
    }
    if ((v5 - 5) < 5)
    {
LABEL_6:
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    if ((v5 - 1) < 4) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
LABEL_10:

  return (NSNumber *)v8;
}

- (NSNumber)qci
{
  return self->_qci;
}

- (void)setQci:(id)a3
{
}

- (NSNumber)bitRateMax
{
  return self->_bitRateMax;
}

- (void)setBitRateMax:(id)a3
{
}

- (NSNumber)bitRateMin
{
  return self->_bitRateMin;
}

- (void)setBitRateMin:(id)a3
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_bitRateMin, 0);
  objc_storeStrong((id *)&self->_bitRateMax, 0);

  objc_storeStrong((id *)&self->_qci, 0);
}

@end