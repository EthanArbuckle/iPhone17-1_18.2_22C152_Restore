@interface CCPersonaSyncManager
- (CCPersonaSyncManager)initWithQueue:(id)a3;
- (id)syncEngineForCurrentPersona;
@end

@implementation CCPersonaSyncManager

- (CCPersonaSyncManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCPersonaSyncManager;
  v6 = [(CCPersonaSyncManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = [[CCRapportSyncEngine alloc] initWithQueue:v7->_queue];
    syncEngine = v7->_syncEngine;
    v7->_syncEngine = v8;
  }
  return v7;
}

- (id)syncEngineForCurrentPersona
{
  return self->_syncEngine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
}

@end