@interface CAStateControllerUndo
- (CAState)state;
- (CAStateControllerUndo)next;
- (NSMutableArray)elements;
- (NSMutableArray)transitions;
- (void)addElement:(id)a3;
- (void)addTransition:(id)a3;
- (void)dealloc;
- (void)setElements:(id)a3;
- (void)setState:(id)a3;
- (void)setTransitions:(id)a3;
@end

@implementation CAStateControllerUndo

- (void)addElement:(id)a3
{
  elements = self->_elements;
  if (!elements)
  {
    elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_elements = elements;
  }

  [(NSMutableArray *)elements addObject:a3];
}

- (void)setState:(id)a3
{
}

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

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerUndo;
  [(CAStateControllerUndo *)&v3 dealloc];
}

- (void)setTransitions:(id)a3
{
}

- (NSMutableArray)transitions
{
  return self->_transitions;
}

- (void)setElements:(id)a3
{
}

- (CAState)state
{
  return self->_state;
}

- (CAStateControllerUndo)next
{
  return self->_next;
}

@end