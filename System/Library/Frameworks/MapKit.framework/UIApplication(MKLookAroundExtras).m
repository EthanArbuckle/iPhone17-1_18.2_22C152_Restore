@interface UIApplication(MKLookAroundExtras)
- (id)_mklookaround_possiblePrimaryWindowScene;
- (id)_mklookaround_possibleWindowForControllingOverallAppearance;
@end

@implementation UIApplication(MKLookAroundExtras)

- (id)_mklookaround_possiblePrimaryWindowScene
{
  v1 = [a1 connectedScenes];
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_56];
  v3 = [v1 filteredSetUsingPredicate:v2];
  v4 = [v3 anyObject];

  return v4;
}

- (id)_mklookaround_possibleWindowForControllingOverallAppearance
{
  v2 = objc_msgSend(a1, "_mklookaround_possiblePrimaryWindowScene");
  if (v2)
  {
    v3 = [a1 _findWindowForControllingOverallAppearanceInWindowScene:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end