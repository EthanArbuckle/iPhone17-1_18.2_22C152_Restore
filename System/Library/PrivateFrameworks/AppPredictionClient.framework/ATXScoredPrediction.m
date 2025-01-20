@interface ATXScoredPrediction
+ (BOOL)supportsSecureCoding;
+ (id)predictionsFrom:(id)a3;
- (ATXScoredPrediction)initWithCoder:(id)a3;
- (ATXScoredPrediction)initWithPredictedItem:(id)a3 score:(float)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScoredPredictionItem:(id)a3;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)predictedItem;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setScore:(float)a3;
@end

@implementation ATXScoredPrediction

- (ATXScoredPrediction)initWithPredictedItem:(id)a3 score:(float)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ATXScoredPrediction.m", 28, @"Invalid parameter not satisfying: %@", @"predictedItem" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)ATXScoredPrediction;
  v9 = [(ATXScoredPrediction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_predictedItem, a3);
    v10->_score = a4;
  }

  return v10;
}

+ (id)predictionsFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "predictedItem", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ATXScoredPrediction allocWithZone:a3];
  id predictedItem = self->_predictedItem;
  *(float *)&double v6 = self->_score;

  return [(ATXScoredPrediction *)v4 initWithPredictedItem:predictedItem score:v6];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXScoredPrediction *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXScoredPrediction *)self isEqualToScoredPredictionItem:v5];

  return v6;
}

- (BOOL)isEqualToScoredPredictionItem:(id)a3
{
  if (self->_score == *((float *)a3 + 2)) {
    return [self->_predictedItem isEqual:*((void *)a3 + 2)];
  }
  else {
    return 0;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%f>", self->_predictedItem, self->_score];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXScoredPrediction)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"predictedItem"];
  [v5 decodeFloatForKey:@"score"];
  int v10 = v9;

  LODWORD(v11) = v10;
  long long v12 = [(ATXScoredPrediction *)self initWithPredictedItem:v8 score:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id predictedItem = self->_predictedItem;
  id v6 = a3;
  [v6 encodeObject:predictedItem forKey:@"predictedItem"];
  *(float *)&double v5 = self->_score;
  [v6 encodeFloat:@"score" forKey:v5];
}

- (unint64_t)hash
{
  return [self->_predictedItem hash];
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (id)predictedItem
{
  return self->_predictedItem;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end