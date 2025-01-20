@interface UIView(MKCrossPlatformOperations)
+ (uint64_t)_maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary:()MKCrossPlatformOperations;
+ (void)_mapkit_animateFromCurrentStateWithDuration:()MKCrossPlatformOperations animations:completion:;
+ (void)_mapkit_animateWithDuration:()MKCrossPlatformOperations animations:completion:;
- (BOOL)_mapkit_isRTL;
- (double)_mapkit_YCoordinateAtDistance:()MKCrossPlatformOperations inDirection:fromYCoordinate:;
- (double)_mapkit_rectWithSize:()MKCrossPlatformOperations XCoordinate:atDistance:inDirection:fromEdge:;
- (id)_mapkit_constraintsPinningSubviewToBounds:()MKCrossPlatformOperations;
- (uint64_t)_mapkit_YCoordinate:()MKCrossPlatformOperations liesInDirection:startingFromYCoordinate:;
- (uint64_t)_mapkit_YCoordinateAtDistance:()MKCrossPlatformOperations inDirection:fromEdge:;
- (uint64_t)_mapkit_fittingSize;
- (uint64_t)_mapkit_insertSubviewBelowAllOtherSubviews:()MKCrossPlatformOperations;
@end

@implementation UIView(MKCrossPlatformOperations)

- (BOOL)_mapkit_isRTL
{
  return [a1 effectiveUserInterfaceLayoutDirection] == 1;
}

+ (uint64_t)_maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary:()MKCrossPlatformOperations
{
  return [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_68];
}

+ (void)_mapkit_animateWithDuration:()MKCrossPlatformOperations animations:completion:
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__UIView_MKCrossPlatformOperations___mapkit_animateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E54B9268;
  double v12 = a2;
  id v11 = v8;
  id v9 = v8;
  [a1 animateWithDuration:v10 animations:a5 completion:a2];
}

+ (void)_mapkit_animateFromCurrentStateWithDuration:()MKCrossPlatformOperations animations:completion:
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__UIView_MKCrossPlatformOperations___mapkit_animateFromCurrentStateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E54B9268;
  double v12 = a2;
  id v11 = v8;
  id v9 = v8;
  [a1 animateWithDuration:4 delay:v10 options:a5 animations:a2 completion:0.0];
}

- (uint64_t)_mapkit_fittingSize
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
}

- (uint64_t)_mapkit_insertSubviewBelowAllOtherSubviews:()MKCrossPlatformOperations
{
  return [a1 insertSubview:a3 atIndex:0];
}

- (id)_mapkit_constraintsPinningSubviewToBounds:()MKCrossPlatformOperations
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18 = [a1 leadingAnchor];
  v17 = [v4 leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  v5 = [a1 trailingAnchor];
  v6 = [v4 trailingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  id v8 = [a1 topAnchor];
  id v9 = [v4 topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  id v11 = [a1 bottomAnchor];
  double v12 = [v4 bottomAnchor];

  v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];

  return v14;
}

- (uint64_t)_mapkit_YCoordinateAtDistance:()MKCrossPlatformOperations inDirection:fromEdge:
{
  [a1 bounds];
  if (a5 == 3 || a5 == 1)
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v9);
  }
  else
  {
    double v13 = 0.0;
    if (a5) {
      goto LABEL_7;
    }
    double MaxY = CGRectGetMinY(*(CGRect *)&v9);
  }
  double v13 = MaxY;
LABEL_7:

  return objc_msgSend(a1, "_mapkit_YCoordinateAtDistance:inDirection:fromYCoordinate:", a4, a2, v13);
}

- (double)_mapkit_rectWithSize:()MKCrossPlatformOperations XCoordinate:atDistance:inDirection:fromEdge:
{
  return a4;
}

- (double)_mapkit_YCoordinateAtDistance:()MKCrossPlatformOperations inDirection:fromYCoordinate:
{
  if (a5 != 1) {
    a1 = -a1;
  }
  return a1 + a2;
}

- (uint64_t)_mapkit_YCoordinate:()MKCrossPlatformOperations liesInDirection:startingFromYCoordinate:
{
  if (a1 == a2) {
    return 0;
  }
  else {
    return (a5 != 0) ^ (a1 < a2);
  }
}

@end