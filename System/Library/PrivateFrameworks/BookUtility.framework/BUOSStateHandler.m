@interface BUOSStateHandler
- (BUOSStateHandler)initWithTitle:(id)a3 block:(id)a4;
- (BUOSStateHandler)initWithTitle:(id)a3 queue:(id)a4 block:(id)a5;
- (unint64_t)osStateHandle;
- (void)dealloc;
- (void)setOsStateHandle:(unint64_t)a3;
@end

@implementation BUOSStateHandler

- (BUOSStateHandler)initWithTitle:(id)a3 block:(id)a4
{
  return (BUOSStateHandler *)MEMORY[0x270F9A6D0](self, sel_initWithTitle_queue_block_, a3);
}

- (BUOSStateHandler)initWithTitle:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BUOSStateHandler;
  v11 = [(BUOSStateHandler *)&v15 init];
  if (v11)
  {
    id v13 = v8;
    id v14 = v10;
    v11->_osStateHandle = os_state_add_handler();
  }
  return v11;
}

- (void)dealloc
{
  if (self->_osStateHandle) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)BUOSStateHandler;
  [(BUOSStateHandler *)&v3 dealloc];
}

- (unint64_t)osStateHandle
{
  return self->_osStateHandle;
}

- (void)setOsStateHandle:(unint64_t)a3
{
  self->_osStateHandle = a3;
}

@end