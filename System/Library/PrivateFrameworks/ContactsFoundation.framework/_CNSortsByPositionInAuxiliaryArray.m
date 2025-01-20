@interface _CNSortsByPositionInAuxiliaryArray
+ (id)comparatorForSortingAccordingToAuxiliaryValues:(id)a3 transform:(id)a4;
- (NSArray)auxiliaryValues;
- (NSDictionary)ranks;
- (_CNSortsByPositionInAuxiliaryArray)initWithAuxiliaryValues:(id)a3 transform:(id)a4;
- (id)comparator;
- (id)rankForObject:(id)a3;
- (id)transform;
- (void)prepareRankingIndex;
@end

@implementation _CNSortsByPositionInAuxiliaryArray

+ (id)comparatorForSortingAccordingToAuxiliaryValues:(id)a3 transform:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAuxiliaryValues:v7 transform:v6];

  v9 = [v8 comparator];

  return v9;
}

- (_CNSortsByPositionInAuxiliaryArray)initWithAuxiliaryValues:(id)a3 transform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNSortsByPositionInAuxiliaryArray;
  v8 = [(_CNSortsByPositionInAuxiliaryArray *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    auxiliaryValues = v8->_auxiliaryValues;
    v8->_auxiliaryValues = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    id transform = v8->_transform;
    v8->_id transform = (id)v11;

    [(_CNSortsByPositionInAuxiliaryArray *)v8 prepareRankingIndex];
    v13 = v8;
  }

  return v8;
}

- (void)prepareRankingIndex
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  auxiliaryValues = self->_auxiliaryValues;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57___CNSortsByPositionInAuxiliaryArray_prepareRankingIndex__block_invoke;
  v8[3] = &unk_1E56A18A0;
  id v9 = v3;
  id v5 = v3;
  [(NSArray *)auxiliaryValues enumerateObjectsUsingBlock:v8];
  id v6 = (NSDictionary *)[v5 copy];
  ranks = self->_ranks;
  self->_ranks = v6;
}

- (id)comparator
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48___CNSortsByPositionInAuxiliaryArray_comparator__block_invoke;
  v4[3] = &unk_1E56A18C8;
  v4[4] = self;
  v2 = (void *)[v4 copy];

  return v2;
}

- (id)rankForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNSortsByPositionInAuxiliaryArray *)self ranks];
  id v6 = [(_CNSortsByPositionInAuxiliaryArray *)self transform];
  id v7 = ((void (**)(void, id))v6)[2](v6, v4);

  v8 = [v5 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = NSNumber;
    v12 = [(_CNSortsByPositionInAuxiliaryArray *)self auxiliaryValues];
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)transform
{
  return self->_transform;
}

- (NSDictionary)ranks
{
  return self->_ranks;
}

- (NSArray)auxiliaryValues
{
  return self->_auxiliaryValues;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_auxiliaryValues, 0);

  objc_storeStrong((id *)&self->_ranks, 0);
}

@end