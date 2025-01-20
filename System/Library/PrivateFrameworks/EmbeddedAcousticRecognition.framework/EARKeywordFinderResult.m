@interface EARKeywordFinderResult
- (NSArray)correctedUtterances;
- (id)_initWithCorrectedUtterances:(id)a3;
- (id)description;
@end

@implementation EARKeywordFinderResult

- (id)_initWithCorrectedUtterances:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EARKeywordFinderResult;
  v5 = [(EARKeywordFinderResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    correctedUtterances = v5->_correctedUtterances;
    v5->_correctedUtterances = (NSArray *)v6;
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)EARKeywordFinderResult;
  v3 = [(EARKeywordFinderResult *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" correctedUtterances=%@", self->_correctedUtterances];

  return v4;
}

- (NSArray)correctedUtterances
{
  return self->_correctedUtterances;
}

- (void).cxx_destruct
{
}

@end