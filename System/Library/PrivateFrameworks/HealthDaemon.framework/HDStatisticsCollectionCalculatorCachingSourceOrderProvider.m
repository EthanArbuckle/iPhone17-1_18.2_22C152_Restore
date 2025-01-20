@interface HDStatisticsCollectionCalculatorCachingSourceOrderProvider
+ (id)sleepSourceOrderProviderForProfile:(id)a3;
- (HDStatisticsCollectionCalculatorCachingSourceOrderProvider)initWithProfile:(id)a3 quantityType:(id)a4;
- (id)orderedSourceIDsWithUnorderedIDs:(id)a3;
- (id)sourceForSourceID:(int64_t)a3;
@end

@implementation HDStatisticsCollectionCalculatorCachingSourceOrderProvider

+ (id)sleepSourceOrderProviderForProfile:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F2ACB8];
  uint64_t v4 = *MEMORY[0x1E4F29870];
  id v5 = a3;
  v6 = [v3 categoryTypeForIdentifier:v4];
  v7 = [MEMORY[0x1E4F2B618] countUnit];
  v8 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:v6 aggregationStyle:1 canonicalUnit:v7];

  v9 = [[HDStatisticsCollectionCalculatorCachingSourceOrderProvider alloc] initWithProfile:v5 quantityType:v8];

  return v9;
}

- (HDStatisticsCollectionCalculatorCachingSourceOrderProvider)initWithProfile:(id)a3 quantityType:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HDStatisticsCollectionCalculatorCachingSourceOrderProvider;
  uint64_t v4 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)&v10 initWithProfile:a3 quantityType:a4];
  if (v4)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedSources = v4->_cachedSources;
    v4->_cachedSources = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    cachedOrderedSourceIDs = v4->_cachedOrderedSourceIDs;
    v4->_cachedOrderedSourceIDs = v7;
  }
  return v4;
}

- (id)sourceForSourceID:(int64_t)a3
{
  cachedSources = self->_cachedSources;
  v6 = objc_msgSend(NSNumber, "numberWithLongLong:");
  v7 = [(NSMutableDictionary *)cachedSources objectForKeyedSubscript:v6];

  if (!v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDStatisticsCollectionCalculatorCachingSourceOrderProvider;
    v7 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)&v11 sourceForSourceID:a3];
    v8 = self->_cachedSources;
    v9 = [NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (id)orderedSourceIDsWithUnorderedIDs:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_cachedOrderedSourceIDs];
  v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  if (([v5 isEqualToSet:v6] & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDStatisticsCollectionCalculatorCachingSourceOrderProvider;
    v7 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)&v11 orderedSourceIDsWithUnorderedIDs:v4];
    cachedOrderedSourceIDs = self->_cachedOrderedSourceIDs;
    self->_cachedOrderedSourceIDs = v7;
  }
  v9 = self->_cachedOrderedSourceIDs;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOrderedSourceIDs, 0);

  objc_storeStrong((id *)&self->_cachedSources, 0);
}

@end