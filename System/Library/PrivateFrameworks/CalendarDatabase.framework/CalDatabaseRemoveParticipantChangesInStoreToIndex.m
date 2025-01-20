@interface CalDatabaseRemoveParticipantChangesInStoreToIndex
@end

@implementation CalDatabaseRemoveParticipantChangesInStoreToIndex

uint64_t ___CalDatabaseRemoveParticipantChangesInStoreToIndex_block_invoke(uint64_t a1)
{
  uint64_t result = _CalDatabaseRemoveParticipantChangesInStoreToIndexInternal(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end