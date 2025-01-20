@interface _IDSCompletionHandler
- (_IDSCompletionHandler)initWithHandler:(id)a3 queue:(id)a4;
- (id)handler;
- (void)dealloc;
- (void)setHandler:(id)a3;
@end

@implementation _IDSCompletionHandler

- (_IDSCompletionHandler)initWithHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_IDSRunningInDaemon())
  {
    v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A2E4A8((uint64_t)self, v8);
    }

    v9 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_IDSCompletionHandler;
    v10 = [(_IDSCompletionHandler *)&v14 init];
    if (v10)
    {
      uint64_t v11 = [v6 copy];
      id handler = v10->_handler;
      v10->_id handler = (id)v11;

      [(IDSDelegateInfo *)v10 setQueue:v7];
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (void)dealloc
{
  id handler = self->_handler;
  self->_id handler = 0;

  [(IDSDelegateInfo *)self setQueue:0];
  v4.receiver = self;
  v4.super_class = (Class)_IDSCompletionHandler;
  [(_IDSCompletionHandler *)&v4 dealloc];
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end