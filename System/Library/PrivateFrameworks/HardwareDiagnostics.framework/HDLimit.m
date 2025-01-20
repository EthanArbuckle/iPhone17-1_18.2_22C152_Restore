@interface HDLimit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLimit:(id)a3;
- (BOOL)measurementWithinBounds:(id)a3;
- (HDBound)lowerBound;
- (HDBound)upperBound;
- (HDLimit)initWithCoder:(id)a3;
- (HDLimit)initWithName:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setLowerBound:(id)a3;
- (void)setName:(id)a3;
- (void)setUpperBound:(id)a3;
@end

@implementation HDLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDLimit)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDLimit;
  v5 = [(HDLimit *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (HDLimit)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDLimit;
  v5 = [(HDLimit *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDLimit.name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDLimit.upperBound"];
    upperBound = v5->_upperBound;
    v5->_upperBound = (HDBound *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDLimit.lowerBound"];
    lowerBound = v5->_lowerBound;
    v5->_lowerBound = (HDBound *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:", self->_name);
  id v6 = [(HDBound *)self->_upperBound copyWithZone:a3];
  [v5 setUpperBound:v6];

  id v7 = [(HDBound *)self->_lowerBound copyWithZone:a3];
  [v5 setLowerBound:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"HDLimit.name"];
  [v5 encodeObject:self->_upperBound forKey:@"HDLimit.upperBound"];
  [v5 encodeObject:self->_lowerBound forKey:@"HDLimit.lowerBound"];
}

- (BOOL)measurementWithinBounds:(id)a3
{
  id v4 = a3;
  upperBound = self->_upperBound;
  if (upperBound)
  {
    id v6 = [(HDBound *)upperBound value];
    id v7 = [v6 unit];
    int v8 = [v4 canBeConvertedToUnit:v7];

    if (!v8) {
      goto LABEL_12;
    }
    objc_super v9 = [(HDBound *)self->_upperBound value];
    uint64_t v10 = [v9 unit];
    v11 = [v4 measurementByConvertingToUnit:v10];

    v12 = [(HDBound *)self->_upperBound value];
    [v12 doubleValue];
    double v14 = v13;
    [v11 doubleValue];
    double v16 = v14 - v15;

    if ([(HDBound *)self->_upperBound open] && v16 <= 0.0) {
      goto LABEL_11;
    }
    BOOL v17 = [(HDBound *)self->_upperBound open];

    if (!v17 && v16 < 0.0) {
      goto LABEL_12;
    }
  }
  lowerBound = self->_lowerBound;
  if (!lowerBound) {
    goto LABEL_15;
  }
  v19 = [(HDBound *)lowerBound value];
  v20 = [v19 unit];
  int v21 = [v4 canBeConvertedToUnit:v20];

  if (v21)
  {
    v22 = [(HDBound *)self->_lowerBound value];
    v23 = [v22 unit];
    v11 = [v4 measurementByConvertingToUnit:v23];

    v24 = [(HDBound *)self->_lowerBound value];
    [v24 doubleValue];
    double v26 = v25;
    [v11 doubleValue];
    double v28 = v26 - v27;

    if ([(HDBound *)self->_lowerBound open] && v28 >= 0.0)
    {
LABEL_11:

      goto LABEL_12;
    }
    BOOL v30 = [(HDBound *)self->_lowerBound open];

    if (!v30 && v28 > 0.0) {
      goto LABEL_12;
    }
LABEL_15:
    BOOL v29 = 1;
    goto LABEL_16;
  }
LABEL_12:
  BOOL v29 = 0;
LABEL_16:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDLimit *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HDLimit *)self isEqualToLimit:v4];
  }

  return v5;
}

- (BOOL)isEqualToLimit:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  upperBound = self->_upperBound;
  if (upperBound) {
    goto LABEL_4;
  }
  id v7 = [v4 upperBound];

  if (v7)
  {
    upperBound = self->_upperBound;
LABEL_4:
    int v8 = [v5 upperBound];
    char v9 = [(HDBound *)upperBound isEqualToBound:v8];

    goto LABEL_5;
  }
  char v9 = 1;
LABEL_5:
  lowerBound = self->_lowerBound;
  if (lowerBound)
  {
LABEL_8:
    v12 = [v5 lowerBound];
    char v13 = [(HDBound *)lowerBound isEqualToBound:v12];

    goto LABEL_9;
  }
  v11 = [v5 lowerBound];

  if (v11)
  {
    lowerBound = self->_lowerBound;
    goto LABEL_8;
  }
  char v13 = 1;
LABEL_9:
  name = self->_name;
  double v15 = [v5 name];
  if ([(NSString *)name isEqualToString:v15]) {
    char v16 = v9 & v13;
  }
  else {
    char v16 = 0;
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  upperBound = self->_upperBound;
  if (upperBound)
  {
    BOOL v5 = [(HDBound *)upperBound dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"upper-bound"];
  }
  lowerBound = self->_lowerBound;
  if (lowerBound)
  {
    id v7 = [(HDBound *)lowerBound dictionaryRepresentation];
    [v3 setObject:v7 forKeyedSubscript:@"lower-bound"];
  }
  int v8 = (void *)[v3 copy];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (HDBound)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(id)a3
{
}

- (HDBound)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerBound, 0);
  objc_storeStrong((id *)&self->_upperBound, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end