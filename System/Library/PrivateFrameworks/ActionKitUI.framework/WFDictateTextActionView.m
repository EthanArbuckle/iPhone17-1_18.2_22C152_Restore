@interface WFDictateTextActionView
- (UITextView)textView;
- (WFDictateTextActionStopButton)stopButton;
- (WFDictateTextActionView)initWithFrame:(CGRect)a3;
- (WFDictateTextActionView)initWithFrame:(CGRect)a3 padded:(BOOL)a4;
- (WFDictateTextActionViewDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setStopButton:(id)a3;
- (void)setTextView:(id)a3;
- (void)stopButtonTapped;
- (void)updateWithTranscription:(id)a3;
@end

@implementation WFDictateTextActionView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stopButton);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setStopButton:(id)a3
{
}

- (WFDictateTextActionStopButton)stopButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stopButton);
  return (WFDictateTextActionStopButton *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFDictateTextActionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFDictateTextActionViewDelegate *)WeakRetained;
}

- (void)updateWithTranscription:(id)a3
{
  id v4 = a3;
  v5 = [(WFDictateTextActionView *)self textView];
  [v5 setText:v4];

  id v7 = [(WFDictateTextActionView *)self textView];
  uint64_t v6 = [v4 length];

  objc_msgSend(v7, "scrollRangeToVisible:", v6, 0);
}

- (void)stopButtonTapped
{
  v3 = [(WFDictateTextActionView *)self stopButton];
  [v3 setEnabled:0];

  id v4 = [(WFDictateTextActionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFDictateTextActionView *)self delegate];
    [v6 dictateTextActionViewDidTapStopButton:self];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EF9248] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFDictateTextActionView;
  [(WFDictateTextActionView *)&v4 dealloc];
}

- (WFDictateTextActionView)initWithFrame:(CGRect)a3 padded:(BOOL)a4
{
  BOOL v4 = a4;
  v30[1] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)WFDictateTextActionView;
  char v5 = -[WFDictateTextActionView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F82D60]);
    [v6 setEditable:0];
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    v8 = WFLocalizedString(@"Now listening…");
    uint64_t v29 = *MEMORY[0x263F81500];
    v9 = [MEMORY[0x263F825C8] placeholderTextColor];
    v30[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v11 = (void *)[v7 initWithString:v8 attributes:v10];
    [v6 setAttributedPlaceholder:v11];

    v12 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v6 setFont:v12];

    v13 = [MEMORY[0x263F825C8] labelColor];
    [v6 setTextColor:v13];

    v14 = [MEMORY[0x263F825C8] clearColor];
    [v6 setBackgroundColor:v14];

    objc_msgSend(v6, "setTextContainerInset:", 8.0, 8.0, 8.0, 8.0);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFDictateTextActionView *)v5 addSubview:v6];
    [(WFDictateTextActionView *)v5 setTextView:v6];
    v15 = objc_opt_new();
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 addTarget:v5 action:sel_stopButtonTapped forControlEvents:64];
    [v15 setRecording:1 animated:0];
    [(WFDictateTextActionView *)v5 addSubview:v15];
    [(WFDictateTextActionView *)v5 setStopButton:v15];
    BOOL v16 = !v4;
    if (v4) {
      v17 = @"H:|-8-[textView]-8-|";
    }
    else {
      v17 = @"H:|[textView]|";
    }
    v18 = @"V:|[textView]-10-[stopButton(50)]-|";
    if (!v16) {
      v18 = @"V:|-8-[textView]-10-[stopButton(50)]-16-|";
    }
    v19 = v18;
    v20 = v17;
    v21 = _NSDictionaryOfVariableBindings(&cfstr_TextviewStopbu.isa, v6, v15, 0);
    v22 = objc_opt_new();
    v23 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v19 options:512 metrics:0 views:v21];

    [v22 addObjectsFromArray:v23];
    v24 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v20 options:0 metrics:0 views:v21];

    [v22 addObjectsFromArray:v24];
    v25 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:50.0];
    [v22 addObject:v25];

    [MEMORY[0x263F08938] activateConstraints:v22];
    v26 = v5;
  }
  return v5;
}

- (WFDictateTextActionView)initWithFrame:(CGRect)a3
{
  return -[WFDictateTextActionView initWithFrame:padded:](self, "initWithFrame:padded:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end