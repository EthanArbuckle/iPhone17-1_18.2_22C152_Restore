@interface KSBuddyAddKeyboardLanguageListControllerWrapper
- (KSAddKeyboardLanguageListController)controller;
- (id)completionBlock;
- (void)dismiss;
- (void)setCompletionBlock:(id)a3;
- (void)setController:(id)a3;
- (void)viewDidLoad;
@end

@implementation KSBuddyAddKeyboardLanguageListControllerWrapper

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSBuddyAddKeyboardLanguageListControllerWrapper;
  [(KSBuddyAddKeyboardLanguageListControllerWrapper *)&v4 viewDidLoad];
  v3 = objc_alloc_init(KSAddKeyboardLanguageListController);
  [(KSAddKeyboardLanguageListController *)v3 setReturnSuggestedInputModes:1];
  [(KSAddKeyboardLanguageListController *)v3 setRootController:self];
  [(KSAddKeyboardLanguageListController *)v3 setSpecifier:objc_alloc_init(MEMORY[0x263F5FC40])];
  [(KSAddKeyboardLanguageListController *)v3 setParentController:self];
  [(PSRootController *)self showController:v3];
  [(KSBuddyAddKeyboardLanguageListControllerWrapper *)self setController:v3];
}

- (void)dismiss
{
  v2 = *(void (**)(void))([(KSBuddyAddKeyboardLanguageListControllerWrapper *)self completionBlock]
                        + 16);
  v2();
}

- (KSAddKeyboardLanguageListController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

@end