@interface WFReferenceLibraryViewController
- (WFReferenceLibraryViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFReferenceLibraryViewController

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (WFReferenceLibraryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFReferenceLibraryViewControllerDelegate *)WeakRetained;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFReferenceLibraryViewController;
  [(WFReferenceLibraryViewController *)&v5 viewWillDisappear:a3];
  v4 = [(WFReferenceLibraryViewController *)self delegate];
  [v4 libraryControllerDidDismiss:self];
}

@end