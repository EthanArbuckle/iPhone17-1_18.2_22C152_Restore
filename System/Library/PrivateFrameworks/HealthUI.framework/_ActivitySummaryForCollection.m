@interface _ActivitySummaryForCollection
- (BOOL)hasNoData;
- (HKActivitySummary)summaryResult;
- (_ActivitySummaryForCollection)initWithActivitySummary:(id)a3 timeScope:(int64_t)a4 hasNoData:(BOOL)a5;
- (int64_t)timeScope;
@end

@implementation _ActivitySummaryForCollection

- (_ActivitySummaryForCollection)initWithActivitySummary:(id)a3 timeScope:(int64_t)a4 hasNoData:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ActivitySummaryForCollection;
  v10 = [(_ActivitySummaryForCollection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_summaryResult, a3);
    v11->_timeScope = a4;
    v11->_hasNoData = a5;
  }

  return v11;
}

- (HKActivitySummary)summaryResult
{
  return self->_summaryResult;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (BOOL)hasNoData
{
  return self->_hasNoData;
}

- (void).cxx_destruct
{
}

@end