@interface UIApplication(AVAdditions)
- (id)avkit_possiblePrimaryWindowScene;
- (id)avkit_possibleWindowForControllingOverallAppearance;
- (id)avkit_windowSceneWithSessionIdentifier:()AVAdditions;
@end

@implementation UIApplication(AVAdditions)

- (id)avkit_possibleWindowForControllingOverallAppearance
{
  v2 = objc_msgSend(a1, "avkit_possiblePrimaryWindowScene");
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

- (id)avkit_possiblePrimaryWindowScene
{
  v1 = [a1 connectedScenes];
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_4556];
  v3 = [v1 filteredSetUsingPredicate:v2];
  v4 = [v3 anyObject];

  return v4;
}

- (id)avkit_windowSceneWithSessionIdentifier:()AVAdditions
{
  id v4 = a3;
  v5 = [a1 openSessions];
  v6 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__UIApplication_AVAdditions__avkit_windowSceneWithSessionIdentifier___block_invoke;
  v13[3] = &unk_1E5FC24F0;
  id v14 = v4;
  id v7 = v4;
  v8 = [v6 predicateWithBlock:v13];
  v9 = [v5 filteredSetUsingPredicate:v8];
  v10 = [v9 anyObject];

  v11 = [v10 scene];

  return v11;
}

@end