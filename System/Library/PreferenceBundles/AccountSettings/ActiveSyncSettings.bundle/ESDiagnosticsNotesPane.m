@interface ESDiagnosticsNotesPane
- (BOOL)becomeFirstResponder;
- (ESDiagnosticsNotesPane)initWithFrame:(CGRect)a3;
- (id)preferenceValue;
@end

@implementation ESDiagnosticsNotesPane

- (ESDiagnosticsNotesPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)ESDiagnosticsNotesPane;
  v7 = -[ESDiagnosticsNotesPane initWithFrame:](&v13, "initWithFrame:");
  if (v7)
  {
    v8 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", x, y, width, height);
    notesView = v7->_notesView;
    v7->_notesView = v8;

    [(UITextView *)v7->_notesView setAutoresizingMask:18];
    [(UITextView *)v7->_notesView setEditable:1];
    -[UITextView setSelectedRange:](v7->_notesView, "setSelectedRange:", 0, 0);
    [(UITextView *)v7->_notesView setKeyboardType:0];
    v10 = v7->_notesView;
    v11 = +[UIFont systemFontOfSize:16.0];
    [(UITextView *)v10 setFont:v11];

    [(UITextView *)v7->_notesView setBounces:1];
    [(ESDiagnosticsNotesPane *)v7 addSubview:v7->_notesView];
  }
  return v7;
}

- (BOOL)becomeFirstResponder
{
  return [(UITextView *)self->_notesView becomeFirstResponder];
}

- (id)preferenceValue
{
  return [(UITextView *)self->_notesView text];
}

- (void).cxx_destruct
{
}

@end