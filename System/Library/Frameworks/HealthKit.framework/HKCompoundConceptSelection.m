@interface HKCompoundConceptSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKCompoundConceptSelection)initWithCoder:(id)a3;
- (HKCompoundConceptSelection)initWithSelections:(id)a3 operationType:(unint64_t)a4;
- (NSArray)selections;
- (id)description;
- (unint64_t)operationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCompoundConceptSelection

- (HKCompoundConceptSelection)initWithSelections:(id)a3 operationType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKCompoundConceptSelection.m", 20, @"Invalid parameter not satisfying: %@", @"selections" object file lineNumber description];
  }
  if ([v7 count])
  {
    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKCompoundConceptSelection.m", 21, @"Invalid parameter not satisfying: %@", @"selections.count" object file lineNumber description];

    if (a4) {
      goto LABEL_7;
    }
  }
  if ([v7 count] != 1)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKCompoundConceptSelection.m", 23, @"Invalid parameter not satisfying: %@", @"selections.count == 1" object file lineNumber description];
  }
LABEL_7:
  v15.receiver = self;
  v15.super_class = (Class)HKCompoundConceptSelection;
  v8 = [(HKConceptSelection *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    selections = v8->_selections;
    v8->_selections = (NSArray *)v9;

    v8->_operationType = a4;
  }

  return v8;
}

- (id)description
{
  unint64_t operationType = self->_operationType;
  v4 = NSString;
  if (operationType) {
    v5 = &stru_1EEC60288;
  }
  else {
    v5 = @"NOT ";
  }
  if (operationType) {
    unint64_t v6 = self->_operationType;
  }
  else {
    unint64_t v6 = 2;
  }
  id v7 = HKStringFromCompoundOperatorType(v6);
  v8 = [v4 stringWithFormat:@" %@ ", v7];

  uint64_t v9 = NSString;
  uint64_t v10 = objc_opt_class();
  v11 = [(NSArray *)self->_selections componentsJoinedByString:v8];
  v12 = [v9 stringWithFormat:@"<%@: %@(%@)>", v10, v5, v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCompoundConceptSelection)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"SelectionsKey"];
  uint64_t v9 = [v5 decodeIntegerForKey:@"OperationTypeKey"];

  if (v8)
  {
    self = [(HKCompoundConceptSelection *)self initWithSelections:v8 operationType:v9];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  selections = self->_selections;
  id v5 = a3;
  [v5 encodeObject:selections forKey:@"SelectionsKey"];
  [v5 encodeInteger:self->_operationType forKey:@"OperationTypeKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKCompoundConceptSelection;
  if ([(HKConceptSelection *)&v17 isEqual:v4])
  {
    id v5 = v4;
    unint64_t v6 = [(HKCompoundConceptSelection *)self operationType];
    if (v6 == [v5 operationType])
    {
      id v7 = [(HKCompoundConceptSelection *)self selections];
      uint64_t v8 = [v5 selections];
      if (v7 == (void *)v8)
      {

        goto LABEL_9;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [v5 selections];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = [(HKCompoundConceptSelection *)self selections];
        v13 = [v5 selections];
        char v14 = [v12 isEqual:v13];

        if ((v14 & 1) == 0) {
          goto LABEL_11;
        }
LABEL_9:
        BOOL v15 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (NSArray)selections
{
  return self->_selections;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void).cxx_destruct
{
}

@end