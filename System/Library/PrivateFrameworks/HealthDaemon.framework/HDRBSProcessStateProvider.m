@interface HDRBSProcessStateProvider
- (id)stateForProcessIdentifier:(id)a3;
@end

@implementation HDRBSProcessStateProvider

- (id)stateForProcessIdentifier:(id)a3
{
  uint64_t v6 = 0;
  v3 = [MEMORY[0x1E4F963E8] handleForIdentifier:a3 error:&v6];
  v4 = [v3 currentState];

  return v4;
}

@end