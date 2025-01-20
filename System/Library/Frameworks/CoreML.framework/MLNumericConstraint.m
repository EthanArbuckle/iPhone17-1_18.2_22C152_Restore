@interface MLNumericConstraint
+ (BOOL)supportsSecureCoding;
+ (MLNumericConstraint)numericConstraintWithEnumeratedNumbers:(id)a3;
+ (MLNumericConstraint)numericConstraintWithMinNumber:(id)a3 maxNumber:(id)a4;
- (MLNumericConstraint)initWithCoder:(id)a3;
- (NSNumber)maxNumber;
- (NSNumber)minNumber;
- (NSSet)enumeratedNumbers;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnumeratedNumbers:(id)a3;
- (void)setMaxNumber:(id)a3;
- (void)setMinNumber:(id)a3;
@end

@implementation MLNumericConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedNumbers, 0);
  objc_storeStrong((id *)&self->_maxNumber, 0);

  objc_storeStrong((id *)&self->_minNumber, 0);
}

- (void)setEnumeratedNumbers:(id)a3
{
}

- (NSSet)enumeratedNumbers
{
  return self->_enumeratedNumbers;
}

- (void)setMaxNumber:(id)a3
{
}

- (NSNumber)maxNumber
{
  return self->_maxNumber;
}

- (void)setMinNumber:(id)a3
{
}

- (NSNumber)minNumber
{
  return self->_minNumber;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = NSString;
  v5 = [(MLNumericConstraint *)self minNumber];
  v6 = [v4 stringWithFormat:@"\nminValue: %@", v5];
  [v3 appendString:v6];

  v7 = NSString;
  v8 = [(MLNumericConstraint *)self maxNumber];
  v9 = [v7 stringWithFormat:@"\nmaxValue: %@", v8];
  [v3 appendString:v9];

  v10 = [(MLNumericConstraint *)self enumeratedNumbers];

  if (v10)
  {
    v11 = NSString;
    v12 = [(MLNumericConstraint *)self enumeratedNumbers];
    v13 = [v11 stringWithFormat:@"\nenumeratedNumbers: %@", v12];
    [v3 appendString:v13];
  }

  return v3;
}

- (MLNumericConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"minNumber"];
  v6 = [v4 decodeObjectForKey:@"maxNumber"];
  v7 = [v4 decodeObjectForKey:@"enumeratedNumbers"];

  if (v7) {
    +[MLNumericConstraint numericConstraintWithEnumeratedNumbers:v7];
  }
  else {
  v8 = +[MLNumericConstraint numericConstraintWithMinNumber:v5 maxNumber:v6];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MLNumericConstraint *)self minNumber];
  [v4 encodeObject:v5 forKey:@"minNumber"];

  v6 = [(MLNumericConstraint *)self maxNumber];
  [v4 encodeObject:v6 forKey:@"maxNumber"];

  id v7 = [(MLNumericConstraint *)self enumeratedNumbers];
  [v4 encodeObject:v7 forKey:@"enumeratedNumbers"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MLNumericConstraint)numericConstraintWithEnumeratedNumbers:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ![v3 count])
  {
    v6 = 0;
  }
  else
  {
    v5 = objc_alloc_init(MLNumericConstraint);
    v6 = v5;
    if (v5)
    {
      [(MLNumericConstraint *)v5 setEnumeratedNumbers:v4];
      id v7 = [v4 valueForKeyPath:@"@min.doubleValue"];
      [(MLNumericConstraint *)v6 setMinNumber:v7];

      v8 = [v4 valueForKeyPath:@"@max.doubleValue"];
      [(MLNumericConstraint *)v6 setMaxNumber:v8];
    }
  }

  return v6;
}

+ (MLNumericConstraint)numericConstraintWithMinNumber:(id)a3 maxNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 doubleValue];
  double v8 = v7;
  [v6 doubleValue];
  if (v8 <= v9)
  {
    v11 = objc_alloc_init(MLNumericConstraint);
    v10 = v11;
    if (v11)
    {
      [(MLNumericConstraint *)v11 setMinNumber:v5];
      [(MLNumericConstraint *)v10 setMaxNumber:v6];
      [(MLNumericConstraint *)v10 setEnumeratedNumbers:0];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end