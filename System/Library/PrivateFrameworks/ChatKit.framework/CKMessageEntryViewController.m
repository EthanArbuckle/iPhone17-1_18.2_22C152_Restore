@interface CKMessageEntryViewController
+ (BOOL)_requiresProxyInterface;
- (BOOL)inputAccessoryViewControllerEnabled;
- (CKMessageEntryView)entryView;
- (CKMessageEntryViewController)initWithEntryView:(id)a3;
- (void)loadView;
- (void)setInputAccessoryViewControllerEnabled:(BOOL)a3;
@end

@implementation CKMessageEntryViewController

- (CKMessageEntryViewController)initWithEntryView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEntryViewController;
  v6 = [(CKMessageEntryViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryView, a3);
  }

  return v7;
}

- (void)loadView
{
  if ([(CKMessageEntryViewController *)self inputAccessoryViewControllerEnabled])
  {
    id v3 = [(CKMessageEntryViewController *)self entryView];
    [(UIInputViewController *)self setView:v3];
  }
}

+ (BOOL)_requiresProxyInterface
{
  return 0;
}

- (CKMessageEntryView)entryView
{
  return self->_entryView;
}

- (BOOL)inputAccessoryViewControllerEnabled
{
  return self->_inputAccessoryViewControllerEnabled;
}

- (void)setInputAccessoryViewControllerEnabled:(BOOL)a3
{
  self->_inputAccessoryViewControllerEnabled = a3;
}

- (void).cxx_destruct
{
}

@end