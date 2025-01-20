@interface _EDThreadQueryUnderlyingHandlers
- (BOOL)_isCurrentObservationToken:(id)a3;
- (EDInMemoryThreadQueryHandler)inMemoryQueryHandler;
- (EDPrecomputedThreadQueryHandler)precomputedQueryHandler;
- (EDThreadMigrator)threadMigrator;
- (EMObjectID)inMemoryObservationID;
- (EMObjectID)precomputedObservationID;
- (void)setInMemoryObservationID:(id)a3;
- (void)setInMemoryQueryHandler:(id)a3;
- (void)setPrecomputedObservationID:(id)a3;
- (void)setPrecomputedQueryHandler:(id)a3;
- (void)setThreadMigrator:(id)a3;
@end

@implementation _EDThreadQueryUnderlyingHandlers

- (EDPrecomputedThreadQueryHandler)precomputedQueryHandler
{
  return self->_precomputedQueryHandler;
}

- (EDInMemoryThreadQueryHandler)inMemoryQueryHandler
{
  return self->_inMemoryQueryHandler;
}

- (EDThreadMigrator)threadMigrator
{
  return self->_threadMigrator;
}

- (BOOL)_isCurrentObservationToken:(id)a3
{
  id v4 = a3;
  v5 = [(_EDThreadQueryUnderlyingHandlers *)self inMemoryObservationID];
  if ([v4 isEqual:v5])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(_EDThreadQueryUnderlyingHandlers *)self precomputedObservationID];
    char v6 = [v4 isEqual:v7];
  }
  return v6;
}

- (EMObjectID)precomputedObservationID
{
  return self->_precomputedObservationID;
}

- (EMObjectID)inMemoryObservationID
{
  return self->_inMemoryObservationID;
}

- (void)setPrecomputedQueryHandler:(id)a3
{
}

- (void)setPrecomputedObservationID:(id)a3
{
}

- (void)setInMemoryObservationID:(id)a3
{
}

- (void)setInMemoryQueryHandler:(id)a3
{
}

- (void)setThreadMigrator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadMigrator, 0);
  objc_storeStrong((id *)&self->_precomputedQueryHandler, 0);
  objc_storeStrong((id *)&self->_inMemoryQueryHandler, 0);
  objc_storeStrong((id *)&self->_precomputedObservationID, 0);

  objc_storeStrong((id *)&self->_inMemoryObservationID, 0);
}

@end