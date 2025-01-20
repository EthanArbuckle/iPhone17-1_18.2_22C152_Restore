@interface KSBuddyAddKeyboardLanguageViewController
- (KSBuddyAddKeyboardLanguageListControllerWrapper)wrapper;
- (KSBuddyAddKeyboardLanguageViewController)initWithCompletion:(id)a3;
- (NSArray)suggestedInputModes;
- (void)setWrapper:(id)a3;
- (void)viewDidLoad;
@end

@implementation KSBuddyAddKeyboardLanguageViewController

- (KSBuddyAddKeyboardLanguageViewController)initWithCompletion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)KSBuddyAddKeyboardLanguageViewController;
  v4 = [(KSBuddyAddKeyboardLanguageViewController *)&v7 init];
  if (v4)
  {
    v5 = objc_opt_new();
    [v5 setCompletionBlock:a3];
    [(KSBuddyAddKeyboardLanguageViewController *)v4 setWrapper:v5];
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)KSBuddyAddKeyboardLanguageViewController;
  [(KSBuddyAddKeyboardLanguageViewController *)&v3 viewDidLoad];
  [(KSBuddyAddKeyboardLanguageViewController *)self showViewController:[(KSBuddyAddKeyboardLanguageViewController *)self wrapper] sender:self];
}

- (NSArray)suggestedInputModes
{
  return self->_suggestedInputModes;
}

- (KSBuddyAddKeyboardLanguageListControllerWrapper)wrapper
{
  return self->_wrapper;
}

- (void)setWrapper:(id)a3
{
}

@end