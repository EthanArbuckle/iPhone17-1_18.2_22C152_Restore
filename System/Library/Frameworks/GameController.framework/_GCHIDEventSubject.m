@interface _GCHIDEventSubject
- (BOOL)isStopped;
- (_GCHIDEventSubject)init;
- (id)observeHIDEvents:(id)a3;
- (id)observeHIDEvents:(id)a3 forService:(id)a4;
- (void)publishHIDEvent:(__IOHIDEvent *)a3;
- (void)setStopped:(BOOL)a3;
@end

@implementation _GCHIDEventSubject

- (_GCHIDEventSubject)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GCHIDEventSubject;
  v2 = [(_GCHIDEventSubject *)&v6 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)&off_26D2B4C80);
    handlersByService = v2->_handlersByService;
    v2->_handlersByService = v3;
  }
  return v2;
}

- (BOOL)isStopped
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_stopped);
  return v2 & 1;
}

- (void)setStopped:(BOOL)a3
{
}

- (void)publishHIDEvent:(__IOHIDEvent *)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_stopped);
  if ((v3 & 1) == 0)
  {
    uint64_t SenderID = IOHIDEventGetSenderID();
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = self->_handlersByService;
    os_unfair_lock_unlock(p_lock);
    if ((unint64_t)(SenderID - 1) > 0xFFFFFFFFFFFFFFFDLL)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __38___GCHIDEventSubject_publishHIDEvent___block_invoke;
      v20[3] = &__block_descriptor_40_e34_v32__0__NSNumber_8__NSArray_16_B24l;
      v20[4] = a3;
      [(NSDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v20];
    }
    else
    {
      v9 = +[NSNumber numberWithUnsignedLongLong:SenderID];
      v10 = [(NSDictionary *)v8 objectForKeyedSubscript:v9];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * v14++) + 16))();
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v12);
      }
      v15 = [(NSDictionary *)v8 objectForKeyedSubscript:&unk_26D2864B0];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v19++) + 16))();
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v17);
      }
    }
  }
}

- (id)observeHIDEvents:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = (id)[v6 copy];
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)[(NSDictionary *)self->_handlersByService mutableCopy];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke;
  v20[3] = &unk_26D22AC98;
  id v9 = v8;
  id v21 = v9;
  long long v22 = v23;
  uint64_t v10 = MEMORY[0x223C6E420](v20);
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v7)
  {
    uint64_t v12 = [v7 registryID];
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    else {
      uint64_t v14 = &unk_26D2864B0;
    }
    ((void (**)(void, void *, id))v11)[2](v11, v14, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, &unk_26D2864B0, v6);
  }
  v15 = (NSDictionary *)[v9 copy];
  handlersByService = self->_handlersByService;
  self->_handlersByService = v15;

  os_unfair_lock_unlock(&self->_lock);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_2;
  v19[3] = &unk_26D22ACE8;
  v19[4] = self;
  v19[5] = v23;
  uint64_t v17 = [[_GCObservation alloc] initWithCleanupHandler:v19];
  _Block_object_dispose(v23, 8);

  return v17;
}

- (id)observeHIDEvents:(id)a3
{
  return [(_GCHIDEventSubject *)self observeHIDEvents:a3 forService:0];
}

- (void).cxx_destruct
{
}

@end