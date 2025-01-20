@interface CSSuggestion
@end

@implementation CSSuggestion

void __31__CSSuggestion_MailUI__mui_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)mui_log_log;
  mui_log_log = (uint64_t)v1;
}

uint64_t __43__CSSuggestion_MailUI__mui_emptySuggestion__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F23870] emptySuggestion];
  uint64_t v1 = mui_emptySuggestion_emptySuggestion;
  mui_emptySuggestion_emptySuggestion = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __64__CSSuggestion_MailUIPredicates__mui_messageListSearchPredicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mui_messageListSearchPredicate");
}

@end