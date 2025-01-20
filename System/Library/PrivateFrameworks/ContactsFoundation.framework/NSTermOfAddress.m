@interface NSTermOfAddress
@end

@implementation NSTermOfAddress

uint64_t __45__NSTermOfAddress_ContactsFoundation__os_log__block_invoke()
{
  os_log_cn_once_object_1_4 = (uint64_t)os_log_create("com.apple.contacts", "NSTermOfAddress+ContactsFoundation");

  return MEMORY[0x1F41817F8]();
}

uint64_t __58__NSTermOfAddress_ContactsFoundation__pronounDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pronoun];
}

id __91__NSTermOfAddress_ContactsFoundation__pronounDescriptionsForAddressingGrammars_uppercased___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 pronouns];
  BOOL v5 = off_1EE0248A0((uint64_t)&__block_literal_global_5, v4);

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    v7 = [v3 pronouns];
    v8 = [v7 firstObject];
    v9 = [v8 pronoun];

    if (*(unsigned char *)(a1 + 32))
    {
      v10 = [v3 locale];
      id v6 = [v9 uppercaseStringWithLocale:v10];
    }
    else
    {
      id v6 = v9;
    }
  }

  return v6;
}

@end