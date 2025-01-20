@interface WKNSUndoManager
- (WKContentView)contentView;
- (WKNSUndoManager)initWithContentView:(id)a3;
- (void)beginUndoGrouping;
- (void)registerUndoWithTarget:(id)a3 handler:(id)a4;
- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
@end

@implementation WKNSUndoManager

- (WKNSUndoManager)initWithContentView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKNSUndoManager;
  v4 = [(WKNSUndoManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_isRegisteringUndoCommand = 0;
    objc_storeWeak((id *)&v4->_contentView, a3);
  }
  return v5;
}

- (void)beginUndoGrouping
{
  if (!self->_isRegisteringUndoCommand) {
    [objc_loadWeak((id *)&self->_contentView) _closeCurrentTypingCommand];
  }
  v3.receiver = self;
  v3.super_class = (Class)WKNSUndoManager;
  [(WKNSUndoManager *)&v3 beginUndoGrouping];
}

- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  BOOL isRegisteringUndoCommand = self->_isRegisteringUndoCommand;
  self->_BOOL isRegisteringUndoCommand = 1;
  v7.receiver = self;
  v7.super_class = (Class)WKNSUndoManager;
  [(WKNSUndoManager *)&v7 registerUndoWithTarget:a3 selector:a4 object:a5];
  self->_BOOL isRegisteringUndoCommand = isRegisteringUndoCommand;
}

- (void)registerUndoWithTarget:(id)a3 handler:(id)a4
{
  BOOL isRegisteringUndoCommand = self->_isRegisteringUndoCommand;
  self->_BOOL isRegisteringUndoCommand = 1;
  v6.receiver = self;
  v6.super_class = (Class)WKNSUndoManager;
  [(WKNSUndoManager *)&v6 registerUndoWithTarget:a3 handler:a4];
  self->_BOOL isRegisteringUndoCommand = isRegisteringUndoCommand;
}

- (WKContentView)contentView
{
  return (WKContentView *)objc_loadWeak((id *)&self->_contentView);
}

- (void).cxx_destruct
{
}

@end