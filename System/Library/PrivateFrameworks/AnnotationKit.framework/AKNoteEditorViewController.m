@interface AKNoteEditorViewController
- (AKNoteEditorViewControllerDelegate)delegate;
- (AKPopupAnnotation)annotation;
- (UITextView)textView;
- (void)setAnnotation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKNoteEditorViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)AKNoteEditorViewController;
  [(AKNoteEditorViewController *)&v9 viewDidLoad];
  v3 = [(AKNoteEditorViewController *)self annotation];

  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    v5 = [(AKNoteEditorViewController *)self textView];
    [v5 setBackgroundColor:v4];

    v6 = [(AKNoteEditorViewController *)self annotation];
    v7 = [v6 contents];
    v8 = [(AKNoteEditorViewController *)self textView];
    [v8 setText:v7];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKNoteEditorViewController;
  [(AKNoteEditorViewController *)&v6 viewDidAppear:a3];
  v4 = [(AKNoteEditorViewController *)self textView];
  [v4 becomeFirstResponder];

  v5 = [(AKNoteEditorViewController *)self delegate];
  [v5 noteEditorViewControllerDidBeginEditing:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(AKNoteEditorViewController *)self delegate];
  [v5 noteEditorViewControllerDidEndEditing:self];

  v6.receiver = self;
  v6.super_class = (Class)AKNoteEditorViewController;
  [(AKNoteEditorViewController *)&v6 viewWillDisappear:v3];
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (AKPopupAnnotation)annotation
{
  return (AKPopupAnnotation *)objc_getProperty(self, a2, 984, 1);
}

- (void)setAnnotation:(id)a3
{
}

- (AKNoteEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKNoteEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end