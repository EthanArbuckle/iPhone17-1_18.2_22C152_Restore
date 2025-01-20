@interface LACUIKeyboardInternal
- (LACUIKeyboardInternal)init;
- (LACUIKeyboardInternal)initWithCoder:(id)a3;
- (LACUIKeyboardInternal)initWithDefaultSize;
- (LACUIKeyboardInternal)initWithFrame:(CGRect)a3;
- (void)_setup;
@end

@implementation LACUIKeyboardInternal

- (LACUIKeyboardInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)LACUIKeyboardInternal;
  v2 = [(LACUIKeyboardInternal *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LACUIKeyboardInternal *)v2 _setup];
  }
  return v3;
}

- (LACUIKeyboardInternal)initWithDefaultSize
{
  v5.receiver = self;
  v5.super_class = (Class)LACUIKeyboardInternal;
  v2 = [(UIKeyboard *)&v5 initWithDefaultSize];
  v3 = v2;
  if (v2) {
    [(LACUIKeyboardInternal *)v2 _setup];
  }
  return v3;
}

- (LACUIKeyboardInternal)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LACUIKeyboardInternal;
  v3 = -[UIKeyboard initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LACUIKeyboardInternal *)v3 _setup];
  }
  return v4;
}

- (LACUIKeyboardInternal)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LACUIKeyboardInternal;
  v3 = [(LACUIKeyboardInternal *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(LACUIKeyboardInternal *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v3 = [(LACUIKeyboardInternal *)self layer];
  [v3 setDisableUpdateMask:16];

  v4 = [(UIKeyboard *)self defaultTextInputTraits];
  objc_super v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__LACUIKeyboardInternal__setup__block_invoke;
    v7[3] = &unk_2653BCD18;
    id v8 = v4;
    objc_super v6 = __31__LACUIKeyboardInternal__setup__block_invoke((uint64_t)v7);
    [(UIKeyboard *)self setDefaultTextInputTraits:v6];
  }
}

id __31__LACUIKeyboardInternal__setup__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setKeyboardType:127];
  [*(id *)(a1 + 32) setKeyboardAppearance:127];
  [*(id *)(a1 + 32) setReturnKeyType:4];
  [*(id *)(a1 + 32) setAutocapitalizationType:0];
  [*(id *)(a1 + 32) setAutocorrectionType:1];
  [*(id *)(a1 + 32) setSpellCheckingType:1];
  [*(id *)(a1 + 32) setSmartQuotesType:1];
  [*(id *)(a1 + 32) setSmartDashesType:1];
  [*(id *)(a1 + 32) setSmartInsertDeleteType:1];
  [*(id *)(a1 + 32) setAcceptsEmoji:0];
  [*(id *)(a1 + 32) setHidePrediction:1];
  [*(id *)(a1 + 32) setDisablePrediction:1];
  [*(id *)(a1 + 32) setDevicePasscodeEntry:1];
  v2 = *(void **)(a1 + 32);
  return v2;
}

@end