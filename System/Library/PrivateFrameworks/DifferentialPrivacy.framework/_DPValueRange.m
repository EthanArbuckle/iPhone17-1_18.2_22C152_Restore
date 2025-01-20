@interface _DPValueRange
+ (id)rangeWithMin:(id)a3 max:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToValueRange:(id)a3;
- (NSNumber)maxPossible;
- (NSNumber)minPossible;
- (NSNumber)range;
- (_DPValueRange)init;
- (_DPValueRange)initWithMin:(id)a3 max:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _DPValueRange

- (_DPValueRange)init
{
  return 0;
}

- (_DPValueRange)initWithMin:(id)a3 max:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 compare:v8] == 1)
  {
    v9 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_DPValueRange;
    v10 = [(_DPValueRange *)&v20 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_minPossible, a3);
      objc_storeStrong((id *)&v11->_maxPossible, a4);
      [v7 doubleValue];
      double v13 = v12;
      [v8 doubleValue];
      if (v14 >= 0.0)
      {
        v15 = NSNumber;
        if (v13 <= 0.0) {
          double v16 = v14 + fabs(v13);
        }
        else {
          double v16 = v14 - v13;
        }
      }
      else
      {
        v15 = NSNumber;
        double v16 = fabs(v13) - fabs(v14);
      }
      uint64_t v17 = [v15 numberWithDouble:v16];
      range = v11->_range;
      v11->_range = (NSNumber *)v17;
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

+ (id)rangeWithMin:(id)a3 max:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithMin:v7 max:v6];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { min=%@ ; max=%@ ; range=%@ }",
    v5,
    self->_minPossible,
    self->_maxPossible,
  id v6 = self->_range);

  return v6;
}

- (BOOL)isEqualToValueRange:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(_DPValueRange *)self maxPossible];
  id v6 = [v4 maxPossible];
  char v7 = [v5 isEqual:v6];

  id v8 = [(_DPValueRange *)self minPossible];
  v9 = [v4 minPossible];
  char v10 = [v8 isEqual:v9];

  v11 = [(_DPValueRange *)self range];
  double v12 = [v4 range];

  LOBYTE(v4) = [v11 isEqual:v12];
  return v7 & v10 & v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPValueRange *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPValueRange *)self isEqualToValueRange:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPValueRange *)self maxPossible];
  uint64_t v4 = [v3 unsignedIntegerValue];
  v5 = [(_DPValueRange *)self minPossible];
  uint64_t v6 = [v5 unsignedIntegerValue] ^ v4;
  char v7 = [(_DPValueRange *)self range];
  unint64_t v8 = v6 ^ [v7 unsignedIntegerValue];

  return v8;
}

- (NSNumber)minPossible
{
  return self->_minPossible;
}

- (NSNumber)maxPossible
{
  return self->_maxPossible;
}

- (NSNumber)range
{
  return self->_range;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_maxPossible, 0);
  objc_storeStrong((id *)&self->_minPossible, 0);
}

@end