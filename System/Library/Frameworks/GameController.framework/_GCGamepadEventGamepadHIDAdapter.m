@interface _GCGamepadEventGamepadHIDAdapter
- (NSArray)observers;
- (_GCGamepadEventGamepadHIDAdapter)init;
- (_GCGamepadEventGamepadHIDAdapter)initWithSource:(id)a3 service:(id)a4;
- (_GCHIDEventSource)HIDEventSource;
- (id)HIDEventObservation;
- (id)observeGamepadEvents:(id)a3;
- (void)dealloc;
- (void)setHIDEventObservation:(id)a3;
- (void)setHIDEventSource:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation _GCGamepadEventGamepadHIDAdapter

- (_GCGamepadEventGamepadHIDAdapter)initWithSource:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GCGamepadEventGamepadHIDAdapter;
  v9 = [(_GCGamepadEventGamepadHIDAdapter *)&v19 init];
  if (v9)
  {
    v10 = [v8 registryID];
    uint64_t v11 = [v10 unsignedLongLongValue];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __59___GCGamepadEventGamepadHIDAdapter_initWithSource_service___block_invoke;
    v18[3] = &__block_descriptor_48_e23_v16__0____IOHIDEvent__8lu40l8;
    v18[4] = v11;
    v18[5] = v9;
    v12 = (void *)MEMORY[0x223C6E420](v18);
    uint64_t v13 = objc_opt_new();
    observers = v9->_observers;
    v9->_observers = (NSArray *)v13;

    objc_storeStrong((id *)&v9->_HIDEventSource, a3);
    uint64_t v15 = [v7 observeHIDEvents:v12 forService:v8];
    id HIDEventObservation = v9->_HIDEventObservation;
    v9->_id HIDEventObservation = (id)v15;
  }
  return v9;
}

- (_GCGamepadEventGamepadHIDAdapter)init
{
  return 0;
}

- (void)dealloc
{
  id HIDEventObservation = self->_HIDEventObservation;
  self->_id HIDEventObservation = 0;

  HIDEventSource = self->_HIDEventSource;
  self->_HIDEventSource = 0;

  v5.receiver = self;
  v5.super_class = (Class)_GCGamepadEventGamepadHIDAdapter;
  [(_GCGamepadEventGamepadHIDAdapter *)&v5 dealloc];
}

- (id)observeGamepadEvents:(id)a3
{
  v4 = (void *)[a3 copy];
  objc_super v5 = [(_GCGamepadEventGamepadHIDAdapter *)self observers];
  v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      id v8 = [(_GCGamepadEventGamepadHIDAdapter *)self observers];
      v9 = (void *)[v8 mutableCopy];

      v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCGamepadEventGamepadHIDAdapter *)self setObservers:v9];
      uint64_t v11 = [(_GCGamepadEventGamepadHIDAdapter *)self observers];
      v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __57___GCGamepadEventGamepadHIDAdapter_observeGamepadEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (_GCHIDEventSource)HIDEventSource
{
  return self->_HIDEventSource;
}

- (void)setHIDEventSource:(id)a3
{
}

- (id)HIDEventObservation
{
  return self->_HIDEventObservation;
}

- (void)setHIDEventObservation:(id)a3
{
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
  objc_storeStrong(&self->_HIDEventObservation, 0);

  objc_storeStrong((id *)&self->_HIDEventSource, 0);
}

@end