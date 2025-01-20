@interface _GCGamepadEventKeyboardEventAdapter
- (NSArray)observers;
- (_GCGamepadEventKeyboardEventAdapter)init;
- (_GCGamepadEventKeyboardEventAdapter)initWithConfiguration:(id)a3 source:(id)a4;
- (id)observeGamepadEvents:(id)a3;
- (void)dealloc;
- (void)setObservers:(id)a3;
@end

@implementation _GCGamepadEventKeyboardEventAdapter

- (_GCGamepadEventKeyboardEventAdapter)initWithConfiguration:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GCGamepadEventKeyboardEventAdapter;
  v9 = [(_GCGamepadEventKeyboardEventAdapter *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __68___GCGamepadEventKeyboardEventAdapter_initWithConfiguration_source___block_invoke;
    v16[3] = &__block_descriptor_40_e28_v16__0____GCKeyboardEvent__8lu32l8;
    v16[4] = v10;
    uint64_t v11 = [v8 observeKeyboardEvents:v16];
    id observation = v10->_observation;
    v10->_id observation = (id)v11;

    uint64_t v13 = objc_opt_new();
    observers = v10->_observers;
    v10->_observers = (NSArray *)v13;
  }
  return v10;
}

- (_GCGamepadEventKeyboardEventAdapter)init
{
  return 0;
}

- (void)dealloc
{
  id observation = self->_observation;
  self->_id observation = 0;

  v4.receiver = self;
  v4.super_class = (Class)_GCGamepadEventKeyboardEventAdapter;
  [(_GCGamepadEventKeyboardEventAdapter *)&v4 dealloc];
}

- (id)observeGamepadEvents:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  v5 = [(_GCGamepadEventKeyboardEventAdapter *)self observers];
  v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      id v8 = [(_GCGamepadEventKeyboardEventAdapter *)self observers];
      v9 = (void *)[v8 mutableCopy];

      v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCGamepadEventKeyboardEventAdapter *)self setObservers:v9];
      uint64_t v11 = [(_GCGamepadEventKeyboardEventAdapter *)self observers];
      v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __60___GCGamepadEventKeyboardEventAdapter_observeGamepadEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong(&self->_observation, 0);
}

@end