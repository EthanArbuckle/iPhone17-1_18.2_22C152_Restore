@interface HKMedicationsMapResult
- (HKMedicationsNumberToNumberMap)commonDict;
- (HKMedicationsNumberToNumberMap)commonSetSizeDict;
- (HKMedicationsNumberToNumberMap)uniqueSetSizeDict;
- (HKMedicationsNumberToNumberPairListMap)uniqueDict;
- (NSSet)distinctHgIds;
- (int64_t)ngramCount;
- (void)setCommonDict:(id)a3;
- (void)setCommonSetSizeDict:(id)a3;
- (void)setDistinctHgIds:(id)a3;
- (void)setNgramCount:(int64_t)a3;
- (void)setUniqueDict:(id)a3;
- (void)setUniqueSetSizeDict:(id)a3;
@end

@implementation HKMedicationsMapResult

- (int64_t)ngramCount
{
  return self->_ngramCount;
}

- (void)setNgramCount:(int64_t)a3
{
  self->_ngramCount = a3;
}

- (HKMedicationsNumberToNumberMap)commonDict
{
  return self->_commonDict;
}

- (void)setCommonDict:(id)a3
{
}

- (HKMedicationsNumberToNumberPairListMap)uniqueDict
{
  return self->_uniqueDict;
}

- (void)setUniqueDict:(id)a3
{
}

- (HKMedicationsNumberToNumberMap)commonSetSizeDict
{
  return self->_commonSetSizeDict;
}

- (void)setCommonSetSizeDict:(id)a3
{
}

- (HKMedicationsNumberToNumberMap)uniqueSetSizeDict
{
  return self->_uniqueSetSizeDict;
}

- (void)setUniqueSetSizeDict:(id)a3
{
}

- (NSSet)distinctHgIds
{
  return self->_distinctHgIds;
}

- (void)setDistinctHgIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distinctHgIds, 0);
  objc_storeStrong((id *)&self->_uniqueSetSizeDict, 0);
  objc_storeStrong((id *)&self->_commonSetSizeDict, 0);
  objc_storeStrong((id *)&self->_uniqueDict, 0);
  objc_storeStrong((id *)&self->_commonDict, 0);
}

@end