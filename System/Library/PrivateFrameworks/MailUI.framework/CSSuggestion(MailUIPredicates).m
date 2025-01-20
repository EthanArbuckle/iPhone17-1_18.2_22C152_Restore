@interface CSSuggestion(MailUIPredicates)
- (id)mui_messageListSearchPredicate;
@end

@implementation CSSuggestion(MailUIPredicates)

- (id)mui_messageListSearchPredicate
{
  v1 = [a1 suggestionTokens];
  v2 = objc_msgSend(v1, "ef_compactMap:", &__block_literal_global_0);

  if ([v2 count])
  {
    v3 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end