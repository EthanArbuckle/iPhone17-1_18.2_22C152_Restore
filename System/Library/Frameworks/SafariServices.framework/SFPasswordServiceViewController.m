@interface SFPasswordServiceViewController
+ (id)_remoteViewControllerInterface;
- (NSString)applicationIdentifier;
- (void)_willAppearInRemoteViewController;
@end

@implementation SFPasswordServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFBEF098];
}

- (void)_willAppearInRemoteViewController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Application identifier was empty", v1, 2u);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
}

@end