@interface EDSQLQueryStatistics
- (EDSQLQueryStatistics)initWithQuery:(id)a3 transactionLabel:(id)a4 firstRowExecutionTime:(id)a5 timePerRowExecutionTime:(id)a6 totalExecutionTime:(id)a7;
- (NSDictionary)queryCountByTransactionLabel;
- (NSString)redactedQuery;
- (unint64_t)firstRowEightyPercentileExecutionTime;
- (unint64_t)firstRowMaxExecutionTime;
- (unint64_t)firstRowMeanExecutionTime;
- (unint64_t)firstRowMinExecutionTime;
- (unint64_t)firstRowTwentyPercentileExecutionTime;
- (unint64_t)queryCount;
- (unint64_t)timePerRowEightyPercentileExecutionTime;
- (unint64_t)timePerRowMaxExecutionTime;
- (unint64_t)timePerRowMeanExecutionTime;
- (unint64_t)timePerRowMinExecutionTime;
- (unint64_t)timePerRowTwentyPercentileExecutionTime;
- (unint64_t)totalEightyPercentileExecutionTime;
- (unint64_t)totalMaxExecutionTime;
- (unint64_t)totalMeanExecutionTime;
- (unint64_t)totalMinExecutionTime;
- (unint64_t)totalTwentyPercentileExecutionTime;
- (void)addStatisticWithTransactionLabel:(id)a3 firstRowExecutionTime:(id)a4 timePerRowExecutionTime:(id)a5 totalExecutionTime:(id)a6;
@end

@implementation EDSQLQueryStatistics

- (EDSQLQueryStatistics)initWithQuery:(id)a3 transactionLabel:(id)a4 firstRowExecutionTime:(id)a5 timePerRowExecutionTime:(id)a6 totalExecutionTime:(id)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)EDSQLQueryStatistics;
  v18 = [(EDSQLQueryStatistics *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_redactedQuery, a3);
    id v24 = v14;
    v25[0] = &unk_1F35BB150;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    queryCountByTransactionLabel = v19->_queryCountByTransactionLabel;
    v19->_queryCountByTransactionLabel = (NSDictionary *)v20;

    v19->_queryCount = 1;
    v19->_firstRowMinExecutionTime = [v15 unsignedIntegerValue];
    v19->_firstRowMaxExecutionTime = [v15 unsignedIntegerValue];
    v19->_timePerRowMinExecutionTime = [v16 unsignedIntegerValue];
    v19->_timePerRowMaxExecutionTime = [v16 unsignedIntegerValue];
    v19->_totalMinExecutionTime = [v17 unsignedIntegerValue];
    v19->_totalMaxExecutionTime = [v17 unsignedIntegerValue];
  }

  return v19;
}

- (void)addStatisticWithTransactionLabel:(id)a3 firstRowExecutionTime:(id)a4 timePerRowExecutionTime:(id)a5 totalExecutionTime:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[(NSDictionary *)self->_queryCountByTransactionLabel mutableCopy];
  id v14 = [v13 objectForKeyedSubscript:v17];
  id v15 = v14;
  if (v14)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);

    id v15 = (void *)v16;
    [v13 setObject:v16 forKeyedSubscript:v17];
  }
  else
  {
    [v13 setObject:&unk_1F35BB150 forKeyedSubscript:v17];
  }
  objc_storeStrong((id *)&self->_queryCountByTransactionLabel, v13);
  self->_queryCount = [(EDSQLQueryStatistics *)self queryCount] + 1;
  if ([v10 unsignedIntegerValue] >= self->_firstRowMaxExecutionTime) {
    self->_firstRowMaxExecutionTime = [v10 unsignedIntegerValue];
  }
  if ([v10 unsignedIntegerValue] <= self->_firstRowMinExecutionTime) {
    self->_firstRowMinExecutionTime = [v10 unsignedIntegerValue];
  }
  if ([v11 unsignedIntegerValue] >= self->_timePerRowMaxExecutionTime) {
    self->_timePerRowMaxExecutionTime = [v11 unsignedIntegerValue];
  }
  if ([v11 unsignedIntegerValue] <= self->_firstRowMinExecutionTime) {
    self->_firstRowMinExecutionTime = [v11 unsignedIntegerValue];
  }
  if ([v12 unsignedIntegerValue] >= self->_totalMaxExecutionTime) {
    self->_totalMaxExecutionTime = [v12 unsignedIntegerValue];
  }
  if ([v12 unsignedIntegerValue] <= self->_totalMinExecutionTime) {
    self->_totalMinExecutionTime = [v12 unsignedIntegerValue];
  }
}

- (NSString)redactedQuery
{
  return self->_redactedQuery;
}

- (NSDictionary)queryCountByTransactionLabel
{
  return self->_queryCountByTransactionLabel;
}

- (unint64_t)queryCount
{
  return self->_queryCount;
}

- (unint64_t)firstRowMinExecutionTime
{
  return self->_firstRowMinExecutionTime;
}

- (unint64_t)firstRowMaxExecutionTime
{
  return self->_firstRowMaxExecutionTime;
}

- (unint64_t)firstRowMeanExecutionTime
{
  return self->_firstRowMeanExecutionTime;
}

- (unint64_t)firstRowTwentyPercentileExecutionTime
{
  return self->_firstRowTwentyPercentileExecutionTime;
}

- (unint64_t)firstRowEightyPercentileExecutionTime
{
  return self->_firstRowEightyPercentileExecutionTime;
}

- (unint64_t)timePerRowMinExecutionTime
{
  return self->_timePerRowMinExecutionTime;
}

- (unint64_t)timePerRowMaxExecutionTime
{
  return self->_timePerRowMaxExecutionTime;
}

- (unint64_t)timePerRowMeanExecutionTime
{
  return self->_timePerRowMeanExecutionTime;
}

- (unint64_t)timePerRowTwentyPercentileExecutionTime
{
  return self->_timePerRowTwentyPercentileExecutionTime;
}

- (unint64_t)timePerRowEightyPercentileExecutionTime
{
  return self->_timePerRowEightyPercentileExecutionTime;
}

- (unint64_t)totalMinExecutionTime
{
  return self->_totalMinExecutionTime;
}

- (unint64_t)totalMaxExecutionTime
{
  return self->_totalMaxExecutionTime;
}

- (unint64_t)totalMeanExecutionTime
{
  return self->_totalMeanExecutionTime;
}

- (unint64_t)totalTwentyPercentileExecutionTime
{
  return self->_totalTwentyPercentileExecutionTime;
}

- (unint64_t)totalEightyPercentileExecutionTime
{
  return self->_totalEightyPercentileExecutionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCountByTransactionLabel, 0);

  objc_storeStrong((id *)&self->_redactedQuery, 0);
}

@end