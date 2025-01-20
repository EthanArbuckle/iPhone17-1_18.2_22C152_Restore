@interface KGGraphManagerRecord
- (BOOL)decrementUseCount;
- (KGGraphManager)graphManager;
- (KGGraphManagerRecord)initWithGraphManager:(id)a3;
- (unint64_t)useCount;
- (void)incrementUseCount;
- (void)setGraphManager:(id)a3;
- (void)setUseCount:(unint64_t)a3;
@end

@implementation KGGraphManagerRecord

- (void).cxx_destruct
{
}

- (void)setUseCount:(unint64_t)a3
{
  self->_useCount = a3;
}

- (unint64_t)useCount
{
  return self->_useCount;
}

- (void)setGraphManager:(id)a3
{
}

- (KGGraphManager)graphManager
{
  return self->_graphManager;
}

- (BOOL)decrementUseCount
{
  unint64_t v2 = self->_useCount - 1;
  self->_useCount = v2;
  return v2 == 0;
}

- (void)incrementUseCount
{
}

- (KGGraphManagerRecord)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGGraphManagerRecord;
  v6 = [(KGGraphManagerRecord *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    v7->_useCount = 1;
  }

  return v7;
}

@end