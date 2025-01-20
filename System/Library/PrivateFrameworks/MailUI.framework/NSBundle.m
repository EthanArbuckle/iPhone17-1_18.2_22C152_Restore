@interface NSBundle
@end

@implementation NSBundle

void __36__NSBundle_MailUI__mui_MailUIBundle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MailUI"];
  v3 = (void *)mui_MailUIBundle_bundle;
  mui_MailUIBundle_bundle = v2;

  if (!mui_MailUIBundle_bundle)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"NSBundle+MailUI.m" lineNumber:20 description:@"Failed to load com.apple.MailUI bundle"];
  }
}

@end