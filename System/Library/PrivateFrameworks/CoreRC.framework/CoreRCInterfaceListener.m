@interface CoreRCInterfaceListener
- (CoreRCInterfaceListener)init;
- (CoreRCInterfaceListener)initWithInterfaceController:(id)a3;
- (CoreRCInterfaceListenerDelegate)delegate;
- (NSArray)interfaces;
- (id)firstInterface;
- (void)addInterface:(id)a3;
- (void)dealloc;
- (void)removeInterface:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation CoreRCInterfaceListener

- (CoreRCInterfaceListener)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithInterfaceController:"];
  return 0;
}

- (CoreRCInterfaceListener)initWithInterfaceController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreRCInterfaceListener;
  v3 = [(CoreRCInterfaceListener *)&v6 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    v3->_interfaces = (NSMutableArray *)v4;
    if (!v4)
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreRCInterfaceListener;
  [(CoreRCInterfaceListener *)&v3 dealloc];
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 60
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    sel_getName(a2);
    LogPrintF();
  }
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 60
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    sel_getName(a2);
    LogPrintF();
  }
}

- (void)addInterface:(id)a3
{
  -[NSMutableArray addObject:](self->_interfaces, "addObject:");
  v5 = [(CoreRCInterfaceListener *)self delegate];
  [(CoreRCInterfaceListenerDelegate *)v5 interfaceListener:self didAddInterface:a3];
}

- (void)removeInterface:(id)a3
{
  [(CoreRCInterfaceListenerDelegate *)[(CoreRCInterfaceListener *)self delegate] interfaceListener:self didRemoveInterface:a3];
  interfaces = self->_interfaces;
  [(NSMutableArray *)interfaces removeObject:a3];
}

- (id)firstInterface
{
  return (id)[(NSMutableArray *)self->_interfaces firstObject];
}

- (CoreRCInterfaceListenerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CoreRCInterfaceListenerDelegate *)a3;
}

- (NSArray)interfaces
{
  return &self->_interfaces->super;
}

@end