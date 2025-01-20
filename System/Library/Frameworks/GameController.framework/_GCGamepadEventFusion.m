@interface _GCGamepadEventFusion
- (NSArray)observations;
- (NSArray)observers;
- (_GCGamepadEventFusion)init;
- (_GCGamepadEventFusion)initWithConfiguration:(id)a3 sources:(id)a4;
- (id)observeGamepadEvents:(id)a3;
- (void)dealloc;
- (void)setObservations:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation _GCGamepadEventFusion

- (_GCGamepadEventFusion)initWithConfiguration:(id)a3 sources:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_GCGamepadEventFusion;
  v10 = [(_GCGamepadEventFusion *)&v27 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a3);
    v11->_lastEvent = (id *)malloc_type_calloc([v9 count], 8uLL, 0x80040B8603338uLL);
    uint64_t v12 = [v8 sourceCount];
    if (v12 != [v9 count])
    {
      v25 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v25 handleFailureInMethod:a2 object:v11 file:@"_GCGamepadEventFusion.m" lineNumber:242 description:@"Sources count does not match the configuration"];
    }
    v13 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", objc_msgSend(v9, "count"));
    if ([v9 count])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = objc_opt_new();
        lastEvent = v11->_lastEvent;
        id v17 = lastEvent[v14];
        lastEvent[v14] = (id)v15;

        v18 = [v9 objectAtIndexedSubscript:v14];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke;
        v26[3] = &__block_descriptor_48_e27_v16__0____GCGamepadEvent__8lu32l8;
        v26[4] = v11;
        v26[5] = v14;
        v19 = [v18 observeGamepadEvents:v26];

        [v13 addObject:v19];
        ++v14;
      }
      while (v14 < [v9 count]);
    }
    uint64_t v20 = [v13 copy];
    observations = v11->_observations;
    v11->_observations = (NSArray *)v20;

    uint64_t v22 = objc_opt_new();
    observers = v11->_observers;
    v11->_observers = (NSArray *)v22;
  }
  return v11;
}

- (_GCGamepadEventFusion)init
{
  return 0;
}

- (void)dealloc
{
  observations = self->_observations;
  self->_observations = 0;

  if ([(_GCGamepadEventFusionConfig *)self->_config sourceCount])
  {
    unint64_t v4 = 0;
    do
    {
      lastEvent = self->_lastEvent;
      id v6 = lastEvent[v4];
      lastEvent[v4] = 0;

      ++v4;
    }
    while (v4 < [(_GCGamepadEventFusionConfig *)self->_config sourceCount]);
  }
  free(self->_lastEvent);
  v7.receiver = self;
  v7.super_class = (Class)_GCGamepadEventFusion;
  [(_GCGamepadEventFusion *)&v7 dealloc];
}

- (id)observeGamepadEvents:(id)a3
{
  unint64_t v4 = (void *)[a3 copy];
  v5 = [(_GCGamepadEventFusion *)self observers];
  id v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      id v8 = [(_GCGamepadEventFusion *)self observers];
      id v9 = (void *)[v8 mutableCopy];

      v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCGamepadEventFusion *)self setObservers:v9];
      v11 = [(_GCGamepadEventFusion *)self observers];
      uint64_t v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  unint64_t v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __46___GCGamepadEventFusion_observeGamepadEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observations, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end