@interface CUState
- (CUState)initWithName:(id)a3 parent:(id)a4;
- (NSString)name;
- (id)description;
- (id)eventHandler;
- (void)dealloc;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
@end

@implementation CUState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lcaMap, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setEventHandler:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)invalidate
{
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0;

  [(NSPointerArray *)self->_lcaMap setCount:0];
  lcaMap = self->_lcaMap;
  self->_lcaMap = 0;

  parent = self->_parent;
  self->_parent = 0;
}

- (id)description
{
  v2 = (void *)[(NSString *)self->_name copy];
  return v2;
}

- (void)dealloc
{
  if (self->_eventHandler || self->_lcaMap || self->_parent) {
    FatalErrorF((uint64_t)"State %@: invalidate not called", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_name);
  }
  name = self->_name;
  self->_name = 0;

  v10.receiver = self;
  v10.super_class = (Class)CUState;
  [(CUState *)&v10 dealloc];
}

- (CUState)initWithName:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CUState;
  v8 = [(CUState *)&v22 init];
  if (!v8) {
    FatalErrorF((uint64_t)"init failed", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v22.receiver);
  }
  v16 = v8;
  uint64_t v17 = [v6 copy];
  name = v16->_name;
  v16->_name = (NSString *)v17;

  v19 = (CUState *)v7;
  parent = v16->_parent;
  v16->_parent = v19;

  return v16;
}

@end