@interface PKFakeNotesDelegate
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (PKFakeNotesDelegate)initWithTextView:(id)a3;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
@end

@implementation PKFakeNotesDelegate

- (PKFakeNotesDelegate)initWithTextView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKFakeNotesDelegate;
  v5 = [(PKFakeNotesDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_textView, v4);
  }

  return v6;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  [WeakRetained setEditable:1];
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained ink];
    char v7 = [v6 _isHandwritingInk];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end