@interface _GEOSearchAttributionListener
- (NSString)identifier;
- (_GEOSearchAttributionListener)initWithIdentifier:(id)a3;
- (void)addCompletionHandler:(id)a3 errorHandler:(id)a4;
- (void)handleError:(id)a3;
- (void)handleInfo:(id)a3;
@end

@implementation _GEOSearchAttributionListener

- (_GEOSearchAttributionListener)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOSearchAttributionListener;
  v5 = [(_GEOSearchAttributionListener *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)addCompletionHandler:(id)a3 errorHandler:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    if (!self->_completionHandlers)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      completionHandlers = self->_completionHandlers;
      self->_completionHandlers = v7;
    }
    v9 = (void *)[v17 copy];
    objc_super v10 = self->_completionHandlers;
    v11 = (void *)MEMORY[0x18C120660]();
    [(NSMutableArray *)v10 addObject:v11];
  }
  if (v6)
  {
    if (!self->_errorHandlers)
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      errorHandlers = self->_errorHandlers;
      self->_errorHandlers = v12;
    }
    v14 = (void *)[v6 copy];
    v15 = self->_errorHandlers;
    v16 = (void *)MEMORY[0x18C120660]();
    [(NSMutableArray *)v15 addObject:v16];
  }
}

- (void)handleInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_completionHandlers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)handleError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_errorHandlers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end