@interface ACAccount
@end

@implementation ACAccount

uint64_t __49__ACAccount_CalAdditions__calCalDAVChildAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 calIsCalDAVAccount];
}

uint64_t __72__ACAccount_CalAdditions___diffPropertiesWithAccount_firstPropertyOnly___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result) {
    BOOL v3 = *(unsigned char *)(a1 + 48) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __53__ACAccount_CalAdditions___calDAVDataclassProperties__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"CalAccountPropertyCalDAVSyncHasTakenPlace";
  v4[1] = @"CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  BOOL v3 = (void *)_calDAVDataclassProperties_calDAVDataclassProperties;
  _calDAVDataclassProperties_calDAVDataclassProperties = v2;
}

@end