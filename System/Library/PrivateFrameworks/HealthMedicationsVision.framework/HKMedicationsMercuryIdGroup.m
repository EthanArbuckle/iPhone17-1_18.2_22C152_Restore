@interface HKMedicationsMercuryIdGroup
- (BOOL)ingredientMatched;
- (NSArray)subHgIds;
- (float)maxJaccardSimilarity;
- (id)description;
- (int64_t)primaryHgId;
- (void)setIngredientMatched:(BOOL)a3;
- (void)setMaxJaccardSimilarity:(float)a3;
- (void)setPrimaryHgId:(int64_t)a3;
- (void)setSubHgIds:(id)a3;
@end

@implementation HKMedicationsMercuryIdGroup

- (id)description
{
  BOOL v3 = [(HKMedicationsMercuryIdGroup *)self ingredientMatched];
  v4 = @"no match";
  if (v3) {
    v4 = @"ingredient matched";
  }
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationsMercuryIdGroup;
  v5 = v4;
  v6 = [(HKMedicationsMercuryIdGroup *)&v11 description];
  int64_t v7 = [(HKMedicationsMercuryIdGroup *)self primaryHgId];
  [(HKMedicationsMercuryIdGroup *)self maxJaccardSimilarity];
  v9 = [v6 stringByAppendingFormat:@" %d %f %@", v7, v8, v5];

  return v9;
}

- (int64_t)primaryHgId
{
  return self->_primaryHgId;
}

- (void)setPrimaryHgId:(int64_t)a3
{
  self->_primaryHgId = a3;
}

- (float)maxJaccardSimilarity
{
  return self->_maxJaccardSimilarity;
}

- (void)setMaxJaccardSimilarity:(float)a3
{
  self->_maxJaccardSimilarity = a3;
}

- (NSArray)subHgIds
{
  return self->_subHgIds;
}

- (void)setSubHgIds:(id)a3
{
}

- (BOOL)ingredientMatched
{
  return self->_ingredientMatched;
}

- (void)setIngredientMatched:(BOOL)a3
{
  self->_ingredientMatched = a3;
}

- (void).cxx_destruct
{
}

@end