@interface CPLEngineComponentEnumerator
- (CPLEngineComponentEnumerator)initWithComponents:(id)a3 handler:(id)a4;
- (void)handleNextComponent;
@end

@implementation CPLEngineComponentEnumerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (void)handleNextComponent
{
  if (self->_handler)
  {
    v3 = (void *)MEMORY[0x1BA993DF0]();
    v4 = [(NSEnumerator *)self->_enumerator nextObject];
    (*((void (**)(void))self->_handler + 2))();
    if (!v4)
    {
      id handler = self->_handler;
      self->_id handler = 0;
    }
  }
}

- (CPLEngineComponentEnumerator)initWithComponents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLEngineComponentEnumerator;
  v8 = [(CPLEngineComponentEnumerator *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectEnumerator];
    enumerator = v8->_enumerator;
    v8->_enumerator = (NSEnumerator *)v9;

    uint64_t v11 = [v7 copy];
    id handler = v8->_handler;
    v8->_id handler = (id)v11;
  }
  return v8;
}

@end