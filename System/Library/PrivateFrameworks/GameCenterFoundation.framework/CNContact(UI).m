@interface CNContact(UI)
- (uint64_t)_gkCompositeName;
@end

@implementation CNContact(UI)

- (uint64_t)_gkCompositeName
{
  return [MEMORY[0x1E4F1B910] stringFromContact:a1 style:0];
}

@end