@interface NSArray(EMSender)
- (uint64_t)em_senderAddresses;
@end

@implementation NSArray(EMSender)

- (uint64_t)em_senderAddresses
{
  return objc_msgSend(a1, "ef_flatMap:", &__block_literal_global_84);
}

@end