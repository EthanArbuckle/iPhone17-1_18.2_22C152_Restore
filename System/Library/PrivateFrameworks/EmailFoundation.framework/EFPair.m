@interface EFPair
+ (BOOL)supportsSecureCoding;
+ (id)pairWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPair:(id)a3;
- (EFPair)initWithCoder:(id)a3;
- (EFPair)initWithFirst:(id)a3 second:(id)a4;
- (NSObject)first;
- (NSObject)second;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EFPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithFirst:v6 second:v7];

  return v8;
}

- (EFPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EFPair;
  v9 = [(EFPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

- (NSObject)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EFPair *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(EFPair *)self isEqualToPair:v4];
  }

  return v5;
}

- (BOOL)isEqualToPair:(id)a3
{
  BOOL v5 = (EFPair *)a3;
  id v6 = v5;
  if (self == v5)
  {
    char v14 = 1;
    goto LABEL_18;
  }
  if (!v5) {
    goto LABEL_15;
  }
  first = self->_first;
  id v8 = first;
  if (first)
  {
LABEL_6:
    v9 = [(EFPair *)v6 first];
    char v10 = [v8 isEqual:v9];

    if (first)
    {
      if (v10) {
        goto LABEL_8;
      }
    }
    else
    {

      if (v10) {
        goto LABEL_8;
      }
    }
LABEL_15:
    char v14 = 0;
    goto LABEL_18;
  }
  v3 = [(EFPair *)v5 first];
  if (v3)
  {
    id v8 = self->_first;
    goto LABEL_6;
  }
LABEL_8:
  second = self->_second;
  objc_super v12 = second;
  if (!second)
  {
    v3 = [(EFPair *)v6 second];
    if (!v3)
    {
      char v14 = 1;
LABEL_17:

      goto LABEL_18;
    }
    objc_super v12 = self->_second;
  }
  v13 = [(EFPair *)v6 second];
  char v14 = [v12 isEqual:v13];

  if (!second) {
    goto LABEL_17;
  }
LABEL_18:

  return v14;
}

- (NSObject)first
{
  return self->_first;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> (%@, %@)", objc_opt_class(), self, self->_first, self->_second];
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return 33 * v3 + [self->_second hash] + 1089;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(EFPair *)self first];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_first"];

  BOOL v5 = [(EFPair *)self second];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_second"];
}

- (EFPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFPair;
  BOOL v5 = [(EFPair *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_first"];
    first = v5->_first;
    v5->_first = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_second"];
    second = v5->_second;
    v5->_second = v8;
  }
  return v5;
}

@end