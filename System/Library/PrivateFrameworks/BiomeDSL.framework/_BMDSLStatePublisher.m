@interface _BMDSLStatePublisher
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BMDSLState)DSLState;
- (BMDSLStateValue)state;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (BPSPublisher)upstream;
- (_BMDSLStatePublisher)initWithUpstream:(id)a3 state:(id)a4 DSLState:(id)a5;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (void)applyBookmark:(id)a3;
- (void)setState:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation _BMDSLStatePublisher

- (_BMDSLStatePublisher)initWithUpstream:(id)a3 state:(id)a4 DSLState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_BMDSLStatePublisher;
  v12 = [(_BMDSLStatePublisher *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    objc_storeStrong((id *)&v13->_DSLState, a5);
  }

  return v13;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_BMDSLStatePublisher subscribe:]((uint64_t)self, v5);
  }

  v6 = [[_BMDSLStatePublisherInner alloc] initWithDownstream:v4 state:self->_state DSLState:self->_DSLState];
  v7 = [(_BMDSLStatePublisher *)self upstream];
  [v7 subscribe:v6];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_BMDSLStatePublisher *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  v3 = [(_BMDSLStatePublisher *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    state = self->_state;
    if (!state) {
      state = v4;
    }
    v6 = state;
    v7 = [(BMDSLState *)self->_DSLState upstreamCombinedState];
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v9 = [(BMDSLState *)self->_DSLState key];
    id v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, 0);

    id v11 = v10;
    v12 = v11;
    if (v7)
    {
      v12 = [v7 reduceWithNext:v11];
    }
    [(BMDSLState *)self->_DSLState setCombinedValue:v12];
    v13 = v4;
  }
  return v4;
}

- (id)bookmark
{
  v3 = [(BMDSLState *)self->_DSLState combinedValue];
  uint64_t v4 = [(BMDSLState *)self->_DSLState value];
  if (v4
    && (v5 = (void *)v4,
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    DSLState = self->_DSLState;
    id v8 = v3;
    id v9 = [(BMDSLState *)DSLState key];
    id v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)validateBookmark:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F501D0];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v7;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v4 = [v8 errorWithDomain:v9 code:2 userInfo:v10];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)applyBookmark:(id)a3
{
  if (a3)
  {
    -[_BMDSLStatePublisher setState:](self, "setState:");
  }
  else
  {
    id v5 = [(_BMDSLStatePublisher *)self DSLState];
    uint64_t v4 = [v5 value];
    [(_BMDSLStatePublisher *)self setState:v4];
  }
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BMDSLStateValue)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (BMDSLState)DSLState
{
  return self->_DSLState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSLState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = [v7 DSLState];
    id v11 = [v12 value];
  }
  v13 = [_BMDSLStatePublisher alloc];
  v14 = [v8 objectAtIndexedSubscript:0];
  objc_super v15 = [v7 DSLState];
  v16 = [(_BMDSLStatePublisher *)v13 initWithUpstream:v14 state:v11 DSLState:v15];

  return v16;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_BMDSLStatePublisher *)self upstream];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_debug_impl(&dword_1B3086000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v3, 0xCu);
}

@end