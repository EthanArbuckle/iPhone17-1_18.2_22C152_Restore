@interface CAStateControllerLayer
- (CALayer)layer;
- (CAState)currentState;
- (CAStateControllerLayer)initWithLayer:(id)a3;
- (CAStateControllerUndo)undoStack;
- (void)addTransition:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeTransition:(id)a3;
- (void)setCurrentState:(id)a3;
@end

@implementation CAStateControllerLayer

- (void)addTransition:(id)a3
{
  transitions = self->_transitions;
  if (!transitions)
  {
    transitions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_transitions = transitions;
  }

  [(NSMutableArray *)transitions addObject:a3];
}

- (void)setCurrentState:(id)a3
{
}

- (CAState)currentState
{
  return self->_currentState;
}

- (CAStateControllerLayer)initWithLayer:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateControllerLayer;
  v4 = [(CAStateControllerLayer *)&v6 init];
  if (v4) {
    v4->_layer = (CALayer *)a3;
  }
  return v4;
}

- (void)removeTransition:(id)a3
{
}

- (CAStateControllerUndo)undoStack
{
  return self->_undoStack;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(CAStateControllerLayer *)self invalidate];

  [(NSTimer *)self->_nextTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerLayer;
  [(CAStateControllerLayer *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  transitions = self->_transitions;
  self->_transitions = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(NSMutableArray *)transitions countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(transitions);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)transitions countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }

  self->_layer = 0;
}

@end