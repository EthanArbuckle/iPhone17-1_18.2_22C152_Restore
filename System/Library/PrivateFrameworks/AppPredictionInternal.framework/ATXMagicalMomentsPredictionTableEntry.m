@interface ATXMagicalMomentsPredictionTableEntry
+ (BOOL)supportsSecureCoding;
+ (id)compoundPredicateFromPredicateArray:(id)a3;
- (ATXMagicalMomentsPrediction)prediction;
- (ATXMagicalMomentsPredictionTableEntry)initWithCoder:(id)a3;
- (ATXMagicalMomentsPredictionTableEntry)initWithPrediction:(id)a3 applicableCompoundPredicate:(id)a4;
- (ATXMagicalMomentsPredictionTableEntry)initWithPrediction:(id)a3 applicablePredicates:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSCompoundPredicate)compoundPredicate;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXMagicalMomentsPredictionTableEntry

- (ATXMagicalMomentsPredictionTableEntry)initWithPrediction:(id)a3 applicablePredicates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7 && [v7 count])
  {
    v9 = [(id)objc_opt_class() compoundPredicateFromPredicateArray:v8];
    self = [(ATXMagicalMomentsPredictionTableEntry *)self initWithPrediction:v6 applicableCompoundPredicate:v9];

    v10 = self;
  }
  else
  {
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicablePredicates:]();
    }

    v10 = 0;
  }

  return v10;
}

- (ATXMagicalMomentsPredictionTableEntry)initWithPrediction:(id)a3 applicableCompoundPredicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)ATXMagicalMomentsPredictionTableEntry;
    v10 = [(ATXMagicalMomentsPredictionTableEntry *)&v15 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_prediction, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicableCompoundPredicate:]();
    }

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ATXMagicalMomentsPrediction *)self->_prediction predictionIdentifier];
  [(ATXMagicalMomentsPrediction *)self->_prediction confidence];
  id v6 = [v3 stringWithFormat:@"Prediction: %@, Confidence: %f, Predicate: %@", v4, v5, self->_compoundPredicate];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXMagicalMomentsPredictionTableEntry *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      prediction = self->_prediction;
      id v7 = [(ATXMagicalMomentsPredictionTableEntry *)v5 prediction];
      if ([(ATXMagicalMomentsPrediction *)prediction isEqual:v7])
      {
        compoundPredicate = self->_compoundPredicate;
        v9 = [(ATXMagicalMomentsPredictionTableEntry *)v5 compoundPredicate];
        char v10 = [(NSCompoundPredicate *)compoundPredicate isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return [(ATXMagicalMomentsPrediction *)self->_prediction hash];
}

+ (id)compoundPredicateFromPredicateArray:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"ATXMagicalMomentsPredictionTable.m", 84, @"Invalid parameter not satisfying: %@", @"predicateArray" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  prediction = self->_prediction;
  id v5 = a3;
  [v5 encodeObject:prediction forKey:@"prediction"];
  [v5 encodeObject:self->_compoundPredicate forKey:@"compoundPredicate"];
}

- (ATXMagicalMomentsPredictionTableEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prediction"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compoundPredicate"];

  id v7 = [(ATXMagicalMomentsPredictionTableEntry *)self initWithPrediction:v5 applicableCompoundPredicate:v6];
  return v7;
}

- (ATXMagicalMomentsPrediction)prediction
{
  return self->_prediction;
}

- (NSCompoundPredicate)compoundPredicate
{
  return self->_compoundPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundPredicate, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

- (void)initWithPrediction:applicablePredicates:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXMM: Failed to create a prediction table entry because either the prediction or applicablePredicates was empty.", v2, v3, v4, v5, v6);
}

- (void)initWithPrediction:applicableCompoundPredicate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXMM: Failed to create a prediction table entry because either the prediction or applicableCompoundPredicate was empty.", v2, v3, v4, v5, v6);
}

@end