@interface TKSlotWatcher
- (BOOL)hasStarted;
- (TKHostTokenRegistry)registry;
- (TKSlotWatcher)initWithTokenRegistry:(id)a3;
- (void)dealloc;
- (void)removeSlotWatch:(id)a3;
- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6;
- (void)startWithSlotServer:(id)a3;
- (void)stop;
@end

@implementation TKSlotWatcher

- (TKSlotWatcher)initWithTokenRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSlotWatcher;
  v6 = [(TKSlotWatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_registry, a3);
  }

  return v7;
}

- (BOOL)hasStarted
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);
  BOOL v4 = WeakRetained != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)startWithSlotServer:(id)a3
{
  id v4 = a3;
  if (![(TKSlotWatcher *)self hasStarted])
  {
    id v5 = +[NSMutableArray array];
    slots = self->_slots;
    self->_slots = v5;

    p_connection = &self->_connection;
    objc_storeWeak((id *)&self->_connection, v4);
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKProtocolSlotClient];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    [WeakRetained setRemoteObjectInterface:v8];

    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKProtocolSlotClientNotification];
    id v11 = objc_loadWeakRetained((id *)&self->_connection);
    [v11 setExportedInterface:v10];

    id v12 = objc_loadWeakRetained((id *)&self->_connection);
    [v12 setExportedObject:self];

    id v13 = objc_loadWeakRetained((id *)&self->_connection);
    [v13 resume];

    id v14 = objc_loadWeakRetained((id *)&self->_connection);
    v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&stru_100020770];
    [v15 reportChangesForSlotType:0 reply:&stru_100020790];

    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_10000C9AC;
    v21 = &unk_100020650;
    objc_copyWeak(&v22, &location);
    [v4 setInterruptionHandler:&v18];
    v16 = sub_10000B334();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100014748((uint64_t)v24, (uint64_t)[(NSMutableArray *)self->_slots count], v16);
    }

    if (![(NSMutableArray *)self->_slots count])
    {
      id v17 = objc_loadWeakRetained((id *)&self->_connection);
      [v17 invalidate];

      objc_storeWeak((id *)p_connection, 0);
    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TKSlotWatcher;
  [(TKSlotWatcher *)&v4 dealloc];
}

- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if (v11)
  {
    id v14 = self;
    objc_sync_enter(v14);
    v15 = [[TKSlotWatch alloc] initWithName:v10 endpoint:v11 slotType:v12 watcher:v14];
    if (v15)
    {
      [(NSMutableArray *)v14->_slots addObject:v15];
      [(TKSlotWatch *)v15 startObserving];
      v16 = sub_10000B334();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [(NSMutableArray *)v14->_slots count];
        int v18 = 138543874;
        id v19 = v12;
        __int16 v20 = 2114;
        id v21 = v10;
        __int16 v22 = 2048;
        id v23 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "added slot: type=%{public}@, name=%{public}@ - total %lu slots", (uint8_t *)&v18, 0x20u);
      }
    }
    objc_sync_exit(v14);
  }
  v13[2](v13);
}

- (void)removeSlotWatch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableArray *)v5->_slots indexOfObject:v4] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)v5->_slots removeObject:v4];
    v6 = sub_10000B334();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [v4 name];
      sub_100014844(v7, v8, (uint64_t)[(NSMutableArray *)v5->_slots count], v6);
    }
  }
  objc_sync_exit(v5);
}

- (void)stop
{
  v3 = self;
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->_connection);
  [WeakRetained invalidate];

  id v5 = [(NSMutableArray *)v3->_slots copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remove];
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([(NSMutableArray *)v3->_slots count])
  {
    id v10 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, @"TKSlotWatcher.m", 342, @"%d slots still present after removing them", -[NSMutableArray count](v3->_slots, "count"));
  }
  objc_sync_exit(v3);
}

- (TKHostTokenRegistry)registry
{
  return self->_registry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_slots, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end