@interface HKMedicationsResolverResult
- (BOOL)looksGeneric;
- (NSArray)ngramList;
- (NSArray)resolvedIds;
- (NSArray)usedNgrams;
- (id)description;
- (int64_t)numberOfNewNgrams;
- (int64_t)numberOfUsedNgrams;
- (void)setLooksGeneric:(BOOL)a3;
- (void)setNgramList:(id)a3;
- (void)setNumberOfNewNgrams:(int64_t)a3;
- (void)setNumberOfUsedNgrams:(int64_t)a3;
- (void)setResolvedIds:(id)a3;
- (void)setUsedNgrams:(id)a3;
@end

@implementation HKMedicationsResolverResult

- (id)description
{
  BOOL v3 = [(HKMedicationsResolverResult *)self looksGeneric];
  v4 = @"Not Generic";
  if (v3) {
    v4 = @"Generic";
  }
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationsResolverResult;
  v5 = v4;
  v6 = [(HKMedicationsResolverResult *)&v11 description];
  v7 = [(HKMedicationsResolverResult *)self resolvedIds];
  v8 = [(HKMedicationsResolverResult *)self usedNgrams];
  v9 = [v6 stringByAppendingFormat:@" %@ %@ %@", v5, v7, v8];

  return v9;
}

- (BOOL)looksGeneric
{
  return self->_looksGeneric;
}

- (void)setLooksGeneric:(BOOL)a3
{
  self->_looksGeneric = a3;
}

- (NSArray)resolvedIds
{
  return self->_resolvedIds;
}

- (void)setResolvedIds:(id)a3
{
}

- (NSArray)ngramList
{
  return self->_ngramList;
}

- (void)setNgramList:(id)a3
{
}

- (int64_t)numberOfNewNgrams
{
  return self->_numberOfNewNgrams;
}

- (void)setNumberOfNewNgrams:(int64_t)a3
{
  self->_numberOfNewNgrams = a3;
}

- (int64_t)numberOfUsedNgrams
{
  return self->_numberOfUsedNgrams;
}

- (void)setNumberOfUsedNgrams:(int64_t)a3
{
  self->_numberOfUsedNgrams = a3;
}

- (NSArray)usedNgrams
{
  return self->_usedNgrams;
}

- (void)setUsedNgrams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedNgrams, 0);
  objc_storeStrong((id *)&self->_ngramList, 0);
  objc_storeStrong((id *)&self->_resolvedIds, 0);
}

@end