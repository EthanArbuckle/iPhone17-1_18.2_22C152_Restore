@interface NSArray
@end

@implementation NSArray

BOOL __55__NSArray_EMSmartMailbox__em_containsSmartMailboxType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 isSmartMailbox] && objc_msgSend(v3, "smartMailboxType") == *(void *)(a1 + 32);

  return v4;
}

id __39__NSArray_EMSender__em_senderAddresses__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 addresses];
  return v2;
}

@end