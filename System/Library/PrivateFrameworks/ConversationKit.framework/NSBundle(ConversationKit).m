@interface NSBundle(ConversationKit)
+ (uint64_t)conversationKit;
@end

@implementation NSBundle(ConversationKit)

+ (uint64_t)conversationKit
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

@end