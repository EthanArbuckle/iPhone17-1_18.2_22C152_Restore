@interface CDPurgeableOperationResult
- (CDPurgeableOperationResult)initWithVolumes:(id)a3;
- (NSArray)volumes;
- (NSMutableArray)mutableResults;
- (unint64_t)totalPurgeableBytes;
- (void)addResult:(id)a3;
- (void)setMutableResults:(id)a3;
@end

@implementation CDPurgeableOperationResult

- (void)addResult:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = [(CDResult *)self isFinished];
  if (v6 && (v4 & 1) == 0)
  {
    v5 = [(CDPurgeableOperationResult *)self mutableResults];
    [v5 addObject:v6];
  }
}

- (NSMutableArray)mutableResults
{
  return self->_mutableResults;
}

- (CDPurgeableOperationResult)initWithVolumes:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPurgeableOperationResult;
  id v6 = [(CDResult *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumes, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableResults = v7->_mutableResults;
    v7->_mutableResults = v8;
  }
  return v7;
}

- (NSArray)volumes
{
  return self->_volumes;
}

- (unint64_t)totalPurgeableBytes
{
  return self->_totalPurgeableBytes;
}

- (void)setMutableResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
}

@end