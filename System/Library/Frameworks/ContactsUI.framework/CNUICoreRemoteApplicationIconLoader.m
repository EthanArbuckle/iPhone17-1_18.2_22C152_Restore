@interface CNUICoreRemoteApplicationIconLoader
- (id)iconOfApplictionWithBundleIdentifier:(id)a3;
@end

@implementation CNUICoreRemoteApplicationIconLoader

- (id)iconOfApplictionWithBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

@end