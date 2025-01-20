@interface LACUIKeyboardView
- (CGSize)intrinsicContentSize;
- (LACUIKeyboardView)init;
- (void)_setup;
@end

@implementation LACUIKeyboardView

- (LACUIKeyboardView)init
{
  v5.receiver = self;
  v5.super_class = (Class)LACUIKeyboardView;
  v2 = [(LACUIKeyboardView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LACUIKeyboardView *)v2 _setup];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)MEMORY[0x263F828A0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboard);
  objc_msgSend(v2, "keyboardSizeForInterfaceOrientation:", objc_msgSend(WeakRetained, "interfaceOrientation"));
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_setup
{
  [(LACUIKeyboardView *)self setUserInteractionEnabled:1];
  obj = [[LACUIKeyboardInternal alloc] initWithDefaultSize];
  [(LACUIKeyboardView *)self addSubview:obj];
  objc_storeWeak((id *)&self->_keyboard, obj);
}

- (void).cxx_destruct
{
}

@end