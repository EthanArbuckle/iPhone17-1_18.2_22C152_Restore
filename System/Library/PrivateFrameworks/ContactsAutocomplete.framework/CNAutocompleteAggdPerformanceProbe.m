@interface CNAutocompleteAggdPerformanceProbe
- (CNAutocompleteAggdPerformanceProbe)init;
- (CNAutocompleteAggdPerformanceProbe)initWithAggdProbe:(id)a3;
- (CNAutocompleteAggdProbe)aggdProbe;
- (NSMutableDictionary)pendingAddData;
- (void)recordLatency:(double)a3 forResultCount:(unint64_t)a4 forSource:(id)a5;
- (void)recordNumberOfCalendarServerResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfContactResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfDirectoryServerResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfPredictionResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfRecentResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfResultsReturned:(unint64_t)a3 inTimeInterval:(double)a4 forBatch:(unint64_t)a5 includesServers:(BOOL)a6;
- (void)recordNumberOfStewieResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfSuggestionResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)recordNumberOfSupplementalResults:(unint64_t)a3 inTimeInterval:(double)a4;
- (void)sendData;
- (void)setAggdProbe:(id)a3;
@end

@implementation CNAutocompleteAggdPerformanceProbe

- (CNAutocompleteAggdPerformanceProbe)init
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"com.apple.contacts.autocomplete";
  v9[1] = @"performance";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v5 = CNAutocompleteProbeBuildKey(v3, v4);

  v6 = [[CNAutocompleteAggdProbe alloc] initWithKeyPrefix:v5];
  v7 = [(CNAutocompleteAggdPerformanceProbe *)self initWithAggdProbe:v6];

  return v7;
}

- (CNAutocompleteAggdPerformanceProbe)initWithAggdProbe:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNAutocompleteAggdPerformanceProbe;
  v6 = [(CNAutocompleteAggdPerformanceProbe *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_aggdProbe, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingAddData = v7->_pendingAddData;
    v7->_pendingAddData = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)recordNumberOfResultsReturned:(unint64_t)a3 inTimeInterval:(double)a4 forBatch:(unint64_t)a5 includesServers:(BOOL)a6
{
  BOOL v6 = a6;
  v28[2] = *MEMORY[0x1E4F143B8];
  v28[0] = @"latency";
  objc_super v11 = CNAutocompleteProbeBatchKey(a5);
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v14 = CNAutocompleteProbeBuildKey(v12, v13);

  if (v6)
  {
    v27[0] = v14;
    v27[1] = @"includingServers";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    uint64_t v17 = CNAutocompleteProbeBuildKey(v15, v16);

    v14 = (void *)v17;
  }
  v26[0] = @"numberOfResults";
  v18 = CNAutocompleteProbeBatchKey(a5);
  v26[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v21 = CNAutocompleteProbeBuildKey(v19, v20);

  v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
  v23 = [(CNAutocompleteAggdPerformanceProbe *)self pendingAddData];
  [v23 setObject:v22 forKeyedSubscript:v14];

  v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)a3];
  v25 = [(CNAutocompleteAggdPerformanceProbe *)self pendingAddData];
  [v25 setObject:v24 forKeyedSubscript:v21];
}

- (void)recordLatency:(double)a3 forResultCount:(unint64_t)a4 forSource:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v21[0] = @"latency";
  v21[1] = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  v10 = [v8 arrayWithObjects:v21 count:2];
  v12 = CNAutocompleteProbeBuildKey(v10, v11);

  v20[0] = @"numberOfResults";
  v20[1] = v9;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v15 = CNAutocompleteProbeBuildKey(v13, v14);

  v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  uint64_t v17 = [(CNAutocompleteAggdPerformanceProbe *)self pendingAddData];
  [v17 setObject:v16 forKeyedSubscript:v12];

  v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)a4];

  v19 = [(CNAutocompleteAggdPerformanceProbe *)self pendingAddData];
  [v19 setObject:v18 forKeyedSubscript:v15];
}

- (void)recordNumberOfRecentResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfStewieResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfContactResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfSuggestionResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfDirectoryServerResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfPredictionResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfSupplementalResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)recordNumberOfCalendarServerResults:(unint64_t)a3 inTimeInterval:(double)a4
{
}

- (void)sendData
{
  v3 = [(CNAutocompleteAggdPerformanceProbe *)self pendingAddData];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CNAutocompleteAggdPerformanceProbe_sendData__block_invoke;
  v5[3] = &unk_1E63DE588;
  v5[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  v4 = [(CNAutocompleteAggdPerformanceProbe *)self aggdProbe];
  [v4 sendData];
}

void __46__CNAutocompleteAggdPerformanceProbe_sendData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 aggdProbe];
  [v7 recordAddValue:v5 forKey:v6];
}

- (CNAutocompleteAggdProbe)aggdProbe
{
  return self->_aggdProbe;
}

- (void)setAggdProbe:(id)a3
{
}

- (NSMutableDictionary)pendingAddData
{
  return self->_pendingAddData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAddData, 0);
  objc_storeStrong((id *)&self->_aggdProbe, 0);
}

@end