@interface MSPContainerCoalescingToken
- (MSPContainerCoalescingToken)init;
- (MSPContainerCoalescingToken)initWithContainerOwner:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)endCoalescingEdits;
@end

@implementation MSPContainerCoalescingToken

- (MSPContainerCoalescingToken)init
{
  result = (MSPContainerCoalescingToken *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MSPContainerCoalescingToken)initWithContainerOwner:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSPContainerCoalescingToken;
  v8 = [(MSPContainerCoalescingToken *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_container, v6);
    uint64_t v10 = [v7 copy];
    context = v9->_context;
    v9->_context = v10;
  }
  return v9;
}

- (void)endCoalescingEdits
{
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    [WeakRetained _endCoalescingEditsForContext:self->_context];

    self->_invalidated = 1;
  }
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(MSPContainerCoalescingToken *)self endCoalescingEdits];
  }
  v3.receiver = self;
  v3.super_class = (Class)MSPContainerCoalescingToken;
  [(MSPContainerCoalescingToken *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_container);
}

@end