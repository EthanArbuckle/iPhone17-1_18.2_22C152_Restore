@interface MFBlockDataConsumer
- (MFBlockDataConsumer)initWithAppendHandler:(id)a3 doneHandler:(id)a4;
- (int64_t)appendData:(id)a3;
- (void)done;
@end

@implementation MFBlockDataConsumer

- (MFBlockDataConsumer)initWithAppendHandler:(id)a3 doneHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MFBlockDataConsumer;
  v8 = [(MFBlockDataConsumer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id appendHandler = v8->_appendHandler;
    v8->_id appendHandler = (id)v9;

    uint64_t v11 = [v7 copy];
    id doneHandler = v8->_doneHandler;
    v8->_id doneHandler = (id)v11;
  }
  return v8;
}

- (int64_t)appendData:(id)a3
{
  id v4 = a3;
  id appendHandler = (uint64_t (**)(id, id))self->_appendHandler;
  if (appendHandler) {
    uint64_t v6 = appendHandler[2](appendHandler, v4);
  }
  else {
    uint64_t v6 = [v4 length];
  }
  int64_t v7 = v6;

  return v7;
}

- (void)done
{
  id doneHandler = (void (**)(id, SEL))self->_doneHandler;
  if (doneHandler) {
    doneHandler[2](doneHandler, a2);
  }
  id appendHandler = self->_appendHandler;
  self->_id appendHandler = 0;

  id v5 = self->_doneHandler;
  self->_id doneHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong(&self->_appendHandler, 0);
}

@end