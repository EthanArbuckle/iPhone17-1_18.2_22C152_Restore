@interface FCSortActivities
@end

@implementation FCSortActivities

uint64_t ___FCSortActivities_block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _dndMode];
  uint64_t v3 = [v2 semanticType];

  if ((unint64_t)(v3 - 1) > 4) {
    return 3;
  }
  else {
    return qword_21F17CAD8[v3 - 1];
  }
}

@end