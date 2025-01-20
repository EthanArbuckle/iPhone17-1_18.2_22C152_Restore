@interface CDPeriodicOperationResult
- (CDPeriodicOperationResult)initWithVolumes:(id)a3;
- (NSArray)volumeNames;
- (NSMutableArray)mutableResults;
- (void)addResult:(id)a3;
- (void)setMutableResults:(id)a3;
@end

@implementation CDPeriodicOperationResult

- (CDPeriodicOperationResult)initWithVolumes:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPeriodicOperationResult;
  v6 = [(CDResult *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumeNames, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableResults = v7->_mutableResults;
    v7->_mutableResults = v8;
  }
  return v7;
}

- (void)addResult:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = [(CDResult *)self isFinished];
  if (v6 && (v4 & 1) == 0)
  {
    id v5 = [(CDPeriodicOperationResult *)self mutableResults];
    [v5 addObject:v6];
  }
}

- (NSArray)volumeNames
{
  return self->_volumeNames;
}

- (NSMutableArray)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_volumeNames, 0);
}

@end