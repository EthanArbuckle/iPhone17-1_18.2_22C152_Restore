@interface CCUIStatusUpdateQueue
- (CCUIStatusUpdateQueue)init;
- (id)dequeueNextStatusUpdate;
- (void)enqueueStatusUpdate:(id)a3 forIdentifier:(id)a4;
- (void)removeAllStatusUpdates;
@end

@implementation CCUIStatusUpdateQueue

- (CCUIStatusUpdateQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIStatusUpdateQueue;
  v2 = [(CCUIStatusUpdateQueue *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queuedIdentifiers = v2->_queuedIdentifiers;
    v2->_queuedIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    latestUpdateByIdentifier = v2->_latestUpdateByIdentifier;
    v2->_latestUpdateByIdentifier = v5;
  }
  return v2;
}

- (void)removeAllStatusUpdates
{
  [(NSMutableArray *)self->_queuedIdentifiers removeAllObjects];
  latestUpdateByIdentifier = self->_latestUpdateByIdentifier;

  [(NSMutableDictionary *)latestUpdateByIdentifier removeAllObjects];
}

- (void)enqueueStatusUpdate:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v6;
  objc_super v8 = [(NSMutableDictionary *)self->_latestUpdateByIdentifier bs_takeObjectForKey:v7];
  if (!v8
    || ((-[NSMutableArray removeObject:](self->_queuedIdentifiers, "removeObject:", v7), [v8 type] != 1)
     || [v9 type] != 2)
    && ([v8 type] != 2 || objc_msgSend(v9, "type") != 1))
  {
    if (!v9) {
      goto LABEL_9;
    }
    [(NSMutableArray *)self->_queuedIdentifiers addObject:v7];
    [(NSMutableDictionary *)self->_latestUpdateByIdentifier setObject:v9 forKey:v7];
  }

LABEL_9:
}

- (id)dequeueNextStatusUpdate
{
  v3 = [(NSMutableArray *)self->_queuedIdentifiers firstObject];
  if (v3)
  {
    [(NSMutableArray *)self->_queuedIdentifiers removeObjectAtIndex:0];
    v4 = [(NSMutableDictionary *)self->_latestUpdateByIdentifier bs_takeObjectForKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestUpdateByIdentifier, 0);

  objc_storeStrong((id *)&self->_queuedIdentifiers, 0);
}

@end