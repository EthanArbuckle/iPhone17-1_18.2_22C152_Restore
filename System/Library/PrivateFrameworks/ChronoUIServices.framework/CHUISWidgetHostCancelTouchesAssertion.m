@interface CHUISWidgetHostCancelTouchesAssertion
- (BOOL)isInvalidated;
- (CHUISWidgetHostCancelTouchesAssertion)init;
- (CHUISWidgetHostCancelTouchesAssertion)initWithAssertions:(id)a3;
- (NSArray)assertions;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation CHUISWidgetHostCancelTouchesAssertion

- (CHUISWidgetHostCancelTouchesAssertion)initWithAssertions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWidgetHostCancelTouchesAssertion;
  v5 = [(CHUISWidgetHostCancelTouchesAssertion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assertions = v5->_assertions;
    v5->_assertions = (NSArray *)v6;
  }
  return v5;
}

- (CHUISWidgetHostCancelTouchesAssertion)init
{
  return [(CHUISWidgetHostCancelTouchesAssertion *)self initWithAssertions:MEMORY[0x1E4F1CBF0]];
}

- (void)dealloc
{
  if (![(CHUISWidgetHostCancelTouchesAssertion *)self isInvalidated]) {
    [(CHUISWidgetHostCancelTouchesAssertion *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)CHUISWidgetHostCancelTouchesAssertion;
  [(CHUISWidgetHostCancelTouchesAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![(CHUISWidgetHostCancelTouchesAssertion *)self isInvalidated])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    objc_super v3 = [(CHUISWidgetHostCancelTouchesAssertion *)self assertions];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invalidate];
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    [(CHUISWidgetHostCancelTouchesAssertion *)self setInvalidated:1];
  }
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
}

@end