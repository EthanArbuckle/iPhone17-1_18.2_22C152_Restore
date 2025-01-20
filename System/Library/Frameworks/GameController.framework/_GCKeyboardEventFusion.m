@interface _GCKeyboardEventFusion
- (NSArray)observations;
- (NSArray)observers;
- (_GCKeyboardEventFusion)init;
- (_GCKeyboardEventFusion)initWithSources:(id)a3;
- (id)observeKeyboardEvents:(id)a3;
- (void)dealloc;
- (void)setObservations:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation _GCKeyboardEventFusion

- (_GCKeyboardEventFusion)initWithSources:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_GCKeyboardEventFusion;
  v5 = [(_GCKeyboardEventFusion *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", objc_msgSend(v4, "count"));
    if ([v4 count])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [v4 objectAtIndexedSubscript:v7];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __42___GCKeyboardEventFusion_initWithSources___block_invoke;
        v15[3] = &__block_descriptor_40_e28_v16__0____GCKeyboardEvent__8lu32l8;
        v15[4] = v5;
        v9 = [v8 observeKeyboardEvents:v15];

        [v6 addObject:v9];
        ++v7;
      }
      while (v7 < [v4 count]);
    }
    uint64_t v10 = [v6 copy];
    observations = v5->_observations;
    v5->_observations = (NSArray *)v10;

    uint64_t v12 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (NSArray *)v12;
  }
  return v5;
}

- (_GCKeyboardEventFusion)init
{
  return 0;
}

- (void)dealloc
{
  observations = self->_observations;
  self->_observations = 0;

  v4.receiver = self;
  v4.super_class = (Class)_GCKeyboardEventFusion;
  [(_GCKeyboardEventFusion *)&v4 dealloc];
}

- (id)observeKeyboardEvents:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  v5 = [(_GCKeyboardEventFusion *)self observers];
  v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      v8 = [(_GCKeyboardEventFusion *)self observers];
      v9 = (void *)[v8 mutableCopy];

      uint64_t v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCKeyboardEventFusion *)self setObservers:v9];
      v11 = [(_GCKeyboardEventFusion *)self observers];
      uint64_t v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __48___GCKeyboardEventFusion_observeKeyboardEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  objc_super v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

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
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_observations, 0);
}

@end