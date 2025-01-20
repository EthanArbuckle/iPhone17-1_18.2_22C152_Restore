@interface NSXPCInterface(MessageComposeExtension)
+ (id)__mf_messageComposerExtensionInterface;
+ (id)__mf_messageComposerHostInterface;
@end

@implementation NSXPCInterface(MessageComposeExtension)

+ (id)__mf_messageComposerHostInterface
{
  if (__mf_messageComposerHostInterface_onceToken != -1) {
    dispatch_once(&__mf_messageComposerHostInterface_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)__mf_messageComposerHostInterface_interface;

  return v0;
}

+ (id)__mf_messageComposerExtensionInterface
{
  if (__mf_messageComposerExtensionInterface_onceToken != -1) {
    dispatch_once(&__mf_messageComposerExtensionInterface_onceToken, &__block_literal_global_130);
  }
  v0 = (void *)__mf_messageComposerExtensionInterface_interface;

  return v0;
}

@end