@interface AXQSMenuHelper
+ (id)sharedInstance;
- (BOOL)isShowingLanguageChoices;
- (void)restoreMenu;
- (void)setShowingLanguageChoices:(BOOL)a3;
@end

@implementation AXQSMenuHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__shared_0;

  return v2;
}

uint64_t __32__AXQSMenuHelper_sharedInstance__block_invoke()
{
  sharedInstance__shared_0 = objc_alloc_init(AXQSMenuHelper);

  return MEMORY[0x270F9A758]();
}

- (void)restoreMenu
{
}

- (BOOL)isShowingLanguageChoices
{
  return self->_showingLanguageChoices;
}

- (void)setShowingLanguageChoices:(BOOL)a3
{
  self->_showingLanguageChoices = a3;
}

@end