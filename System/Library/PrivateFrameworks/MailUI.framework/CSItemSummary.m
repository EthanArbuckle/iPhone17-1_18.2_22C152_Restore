@interface CSItemSummary
@end

@implementation CSItemSummary

uint64_t __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F60398] spotlightSenderSearchPredicateForValue:a2 operator:*(void *)(a1 + 32)];
}

uint64_t __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F60398] spotlightRecipientSearchPredicateForValue:a2 operator:*(void *)(a1 + 32)];
}

id __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = (void *)MEMORY[0x1E4F60398];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  v7 = [v4 spotlightSenderSearchPredicateForValue:v6 operator:v5];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F60398] spotlightRecipientSearchPredicateForValue:v6 operator:*(void *)(a1 + 32)];

  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v3 orPredicateWithSubpredicates:v9];

  return v10;
}

@end