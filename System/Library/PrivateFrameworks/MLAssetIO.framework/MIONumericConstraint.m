@interface MIONumericConstraint
- (BOOL)isEqual:(id)a3;
- (MIONumericConstraint)initWithEnumeratedNumbers:(id)a3;
- (MIONumericConstraint)initWithMinimum:(id)a3 maximum:(id)a4;
- (NSNumber)maxNumber;
- (NSNumber)minNumber;
- (NSSet)enumeratedNumbers;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation MIONumericConstraint

- (MIONumericConstraint)initWithMinimum:(id)a3 maximum:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIONumericConstraint;
  v9 = [(MIONumericConstraint *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_minNumber, a3);
    objc_storeStrong((id *)&v10->_maxNumber, a4);
  }

  return v10;
}

- (MIONumericConstraint)initWithEnumeratedNumbers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MIONumericConstraint;
  v5 = [(MIONumericConstraint *)&v27 init];
  if (![v4 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"MIONumericConstraint cannot be initialized with the empty enumerated numbers."];
  }
  if (v5)
  {
    v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v4 objectAtIndexedSubscript:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (-[NSNumber compare:](v6, "compare:", v13, (void)v23) == NSOrderedDescending)
          {
            v14 = v13;

            v6 = v14;
          }
          if ([(NSNumber *)v7 compare:v13] == NSOrderedAscending)
          {
            v15 = v13;

            id v7 = v15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    minNumber = v5->_minNumber;
    v5->_minNumber = v6;
    v17 = v6;

    maxNumber = v5->_maxNumber;
    v5->_maxNumber = v7;
    v19 = v7;

    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    enumeratedNumbers = v5->_enumeratedNumbers;
    v5->_enumeratedNumbers = (NSSet *)v20;
  }
  return v5;
}

- (NSString)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"MIONumericConstraint "];
  id v4 = [(MIONumericConstraint *)self enumeratedNumbers];

  if (v4)
  {
    v5 = [(MIONumericConstraint *)self enumeratedNumbers];
    v6 = [v5 allObjects];
    id v7 = [v6 componentsJoinedByString:@", "];
    [v3 appendFormat:@"[%@]", v7];
  }
  else
  {
    v5 = [(MIONumericConstraint *)self minNumber];
    v6 = [(MIONumericConstraint *)self maxNumber];
    [v3 appendFormat:@"min: %@ max: %@", v5, v6];
  }

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIONumericConstraint *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MIONumericConstraint *)self enumeratedNumbers];

      if (v6)
      {
        id v7 = [(MIONumericConstraint *)self enumeratedNumbers];
        id v8 = [(MIONumericConstraint *)v5 enumeratedNumbers];
        char v9 = [v7 isEqual:v8];

        if ((v9 & 1) == 0)
        {
LABEL_11:
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v11 = [(MIONumericConstraint *)self minNumber];
        objc_super v12 = [(MIONumericConstraint *)v5 minNumber];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_11;
        }
        v14 = [(MIONumericConstraint *)self maxNumber];
        v15 = [(MIONumericConstraint *)v5 maxNumber];
        int v16 = [v14 isEqual:v15];

        if (!v16) {
          goto LABEL_11;
        }
      }
      BOOL v10 = 1;
LABEL_12:

      goto LABEL_13;
    }
    BOOL v10 = 0;
  }
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(MIONumericConstraint *)self minNumber];
  uint64_t v4 = [v3 hash];
  v5 = [(MIONumericConstraint *)self maxNumber];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(MIONumericConstraint *)self enumeratedNumbers];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSNumber)minNumber
{
  return self->_minNumber;
}

- (NSNumber)maxNumber
{
  return self->_maxNumber;
}

- (NSSet)enumeratedNumbers
{
  return self->_enumeratedNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedNumbers, 0);
  objc_storeStrong((id *)&self->_maxNumber, 0);
  objc_storeStrong((id *)&self->_minNumber, 0);
}

@end