@interface CNAutocompleteProbeKeyBuilder
+ (id)builderWithKey:(id)a3;
- (CNAutocompleteProbeKeyBuilder)init;
- (CNAutocompleteProbeKeyBuilder)initWithKey:(id)a3;
- (NSArray)prefixes;
- (NSArray)suffixes;
- (NSString)key;
- (id)addBatchIndex:(unint64_t)a3;
- (id)addDuetModelID;
- (id)addDuetReturnedResults:(BOOL)a3;
- (id)build;
- (id)prediction;
- (id)prefixedSearch;
- (void)setKey:(id)a3;
- (void)setPrefixes:(id)a3;
- (void)setSuffixes:(id)a3;
- (void)useString:(id)a3 forSuffixAtIndex:(unint64_t)a4;
@end

@implementation CNAutocompleteProbeKeyBuilder

+ (id)builderWithKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithKey:v4];

  return v5;
}

- (CNAutocompleteProbeKeyBuilder)init
{
  return [(CNAutocompleteProbeKeyBuilder *)self initWithKey:&stru_1F1A2F2D8];
}

- (CNAutocompleteProbeKeyBuilder)initWithKey:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNAutocompleteProbeKeyBuilder;
  v6 = [(CNAutocompleteProbeKeyBuilder *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    prefixes = v7->_prefixes;
    v7->_prefixes = (NSArray *)MEMORY[0x1E4F1CBF0];

    suffixes = v7->_suffixes;
    v7->_suffixes = (NSArray *)&unk_1F1A3BF50;
  }
  return v7;
}

- (void)useString:(id)a3 forSuffixAtIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CNAutocompleteProbeKeyBuilder *)self suffixes];
  id v9 = (id)[v7 mutableCopy];

  [v9 replaceObjectAtIndex:a4 withObject:v6];
  v8 = (void *)[v9 copy];
  [(CNAutocompleteProbeKeyBuilder *)self setSuffixes:v8];
}

- (id)addDuetReturnedResults:(BOOL)a3
{
  id v4 = CNAutocompleteProbeKeyUsageMonitorDuetReturnedResults;
  if (!a3) {
    id v4 = CNAutocompleteProbeKeyUsageMonitorNoResultsFromDuet;
  }
  [(CNAutocompleteProbeKeyBuilder *)self useString:*v4 forSuffixAtIndex:1];
  return self;
}

- (id)addBatchIndex:(unint64_t)a3
{
  id v4 = CNAutocompleteProbeBatchKey(a3);
  [(CNAutocompleteProbeKeyBuilder *)self useString:v4 forSuffixAtIndex:0];

  return self;
}

- (id)prediction
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = @"prediction";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [(CNAutocompleteProbeKeyBuilder *)self prefixes];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];
  [(CNAutocompleteProbeKeyBuilder *)self setPrefixes:v5];

  return self;
}

- (id)prefixedSearch
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = @"prefixed";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [(CNAutocompleteProbeKeyBuilder *)self prefixes];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];
  [(CNAutocompleteProbeKeyBuilder *)self setPrefixes:v5];

  return self;
}

- (id)addDuetModelID
{
  v3 = CNAutocompleteProbeDuetModelID();
  [(CNAutocompleteProbeKeyBuilder *)self useString:v3 forSuffixAtIndex:2];

  return self;
}

- (id)build
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(CNAutocompleteProbeKeyBuilder *)self prefixes];
  id v5 = [v3 arrayWithArray:v4];

  id v6 = [(CNAutocompleteProbeKeyBuilder *)self key];
  [v5 addObject:v6];

  v7 = [(CNAutocompleteProbeKeyBuilder *)self suffixes];
  v8 = objc_msgSend(v7, "_cn_filter:", &__block_literal_global_17);
  [v5 addObjectsFromArray:v8];

  v10 = CNAutocompleteProbeBuildKey(v5, v9);

  return v10;
}

uint64_t __38__CNAutocompleteProbeKeyBuilder_build__block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))() ^ 1;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (void)setSuffixes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end