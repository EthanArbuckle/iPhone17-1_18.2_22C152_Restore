@interface EMMailboxRepository
@end

@implementation EMMailboxRepository

BOOL __66__EMMailboxRepository_MailUI__mui_inboxExternalURLsFromMailboxes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isSmartMailbox] & 1) == 0 && objc_msgSend(v2, "type") == 7;

  return v3;
}

id __66__EMMailboxRepository_MailUI__mui_inboxExternalURLsFromMailboxes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ef_filter:", *MEMORY[0x1E4F60CE8]);
  BOOL v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_7);

  v4 = [MEMORY[0x1E4F60D70] futureWithResult:v3];

  return v4;
}

uint64_t __66__EMMailboxRepository_MailUI__mui_inboxExternalURLsFromMailboxes___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 externalURL];
}

@end