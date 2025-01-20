@interface NSSQLConnectionManager
- (BOOL)handleStoreRequest:(id)a3;
- (NSSQLConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5;
- (NSSQLConnectionManager)initWithSQLCore:(id)a3 seedConnection:(id)a4;
- (id)sqlCore;
- (void)dealloc;
- (void)disconnectAllConnections;
- (void)scheduleBarrierBlock:(id)a3;
- (void)scheduleConnectionsBarrier:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLConnectionManager

uint64_t __66__NSSQLConnectionManager_initWithSQLCore_priority_seedConnection___block_invoke()
{
  return 1;
}

- (id)sqlCore
{
  return self->_sqlCore;
}

- (NSSQLConnectionManager)initWithSQLCore:(id)a3 seedConnection:(id)a4
{
  return [(NSSQLConnectionManager *)self initWithSQLCore:a3 priority:2 seedConnection:a4];
}

- (NSSQLConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLConnectionManager;
  v6 = [(NSSQLConnectionManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_sqlCore = (NSSQLCore *)a3;
    v6->_filter = (id)[&__block_literal_global_11 copy];
  }
  return v7;
}

- (void)dealloc
{
  self->_sqlCore = 0;
  self->_filter = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLConnectionManager;
  [(NSSQLConnectionManager *)&v3 dealloc];
}

- (void)disconnectAllConnections
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (BOOL)handleStoreRequest:(id)a3
{
  return 0;
}

- (void)scheduleBarrierBlock:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)scheduleConnectionsBarrier:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end