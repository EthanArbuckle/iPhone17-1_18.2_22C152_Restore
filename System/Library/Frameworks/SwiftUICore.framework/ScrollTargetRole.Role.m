@interface ScrollTargetRole.Role
- (uint64_t):(@inout [ScrollTargetRole.Role :)[ScrollableCollection]];
- (void):;
@end

@implementation ScrollTargetRole.Role

- (uint64_t):(@inout [ScrollTargetRole.Role :)[ScrollableCollection]]
{
  return a2();
}

- (void):
{
  if (!lazy cache variable for type metadata for [ScrollTargetRole.Role : [ScrollableCollection]])
  {
    _s7SwiftUI16TimelineSchedule_pSgMaTm_0(255, (unint64_t *)&lazy cache variable for type metadata for [ScrollableCollection], (unint64_t *)&lazy cache variable for type metadata for ScrollableCollection, (uint64_t)&protocol descriptor for ScrollableCollection, MEMORY[0x263F8D488]);
    lazy protocol witness table accessor for type ScrollTargetRole.Role and conformance ScrollTargetRole.Role();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ScrollTargetRole.Role : [ScrollableCollection]]);
    }
  }
}

@end