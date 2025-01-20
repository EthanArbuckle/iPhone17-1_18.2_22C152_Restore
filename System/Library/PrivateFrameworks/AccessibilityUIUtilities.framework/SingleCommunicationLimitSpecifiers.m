@interface SingleCommunicationLimitSpecifiers
@end

@implementation SingleCommunicationLimitSpecifiers

void __93___SingleCommunicationLimitSpecifiers_updateForCommunicationLimit_maximumCommunicationLimit___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) specifierForCommunicationLimit:a2];
  v5 = [NSNumber numberWithInt:*(void *)(a1 + 40) >= a3];
  [v6 setProperty:v5 forKey:*MEMORY[0x1E4F93130]];
}

@end