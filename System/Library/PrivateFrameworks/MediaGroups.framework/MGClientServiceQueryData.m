@interface MGClientServiceQueryData
- (MGClientServiceQueryData)initWithPredicate:(id)a3 updateHandler:(id)a4;
- (NSPredicate)predicate;
- (id)handler;
@end

@implementation MGClientServiceQueryData

- (MGClientServiceQueryData)initWithPredicate:(id)a3 updateHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MGClientServiceQueryData;
  v9 = [(MGClientServiceQueryData *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    uint64_t v11 = MEMORY[0x223CA8220](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end