@interface AXFrontBoardSortedNonSystemAppProcessesAndScenes
@end

@implementation AXFrontBoardSortedNonSystemAppProcessesAndScenes

void ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 accessibilitySceneOwnerIsAUIApplication]) {
    goto LABEL_23;
  }
  v4 = [v3 clientProcess];
  v5 = [v4 bundleIdentifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x263F227C8]];

  if (v6) {
    goto LABEL_23;
  }
  v7 = [v3 identifier];
  char v8 = [v7 containsString:@"searchBar"];

  if (v8 & 1) != 0 || ([v3 accessibilitySceneIsDismissedSearchScreen]) {
    goto LABEL_23;
  }
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_8;
  }
  if (([v3 accessibilityIsSceneOnCarScreen] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 48)) {
      goto LABEL_23;
    }
LABEL_8:
    if (([v3 accessibilityIsSceneOnMainScreen] & 1) == 0
      && ![v3 accessibilityIsSceneOnExternalScreen])
    {
      goto LABEL_23;
    }
  }
  if (([v3 accessibilitySceneIsDismissedInCallService] & 1) == 0
    && ([v3 accessibilitySceneIsCallServiceBanner] & 1) == 0
    && ([v3 accessibilitySceneBelongsToTheSystemApp] & 1) == 0
    && (*(unsigned char *)(a1 + 49) || ([v3 accessibilitySceneIsDeactivatedBySidebar] & 1) == 0))
  {
    BOOL v9 = _AXFrontBoardSceneBelongsToContinuityDisplay(v3);
    if (!*(unsigned char *)(a1 + 50))
    {
      BOOL v10 = v9;
      v11 = [*(id *)(a1 + 32) _accessibilityRecentlyActivatedApplicationBundleIdentifiers];
      v12 = [v3 identifier];
      if ([v11 containsObject:v12])
      {
      }
      else
      {
        int v13 = [v3 accessibilitySceneIsDeactivatedBySwitcher];

        if ((v13 ^ 1 | v10) != 1) {
          goto LABEL_23;
        }
      }
    }
    v14 = [v3 accessibilitySceneProcess];
    if (v14 && [v3 accessibilitySceneIsForegroundVisible])
    {
      v15 = *(void **)(a1 + 40);
      v17[0] = @"scene";
      v17[1] = @"process";
      v18[0] = v3;
      v18[1] = v14;
      v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
      [v15 addObject:v16];
    }
  }
LABEL_23:
}

uint64_t ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  char v6 = [a2 objectForKeyedSubscript:@"scene"];
  v7 = [v5 objectForKeyedSubscript:@"scene"];

  [v6 accessibilitySceneFrame];
  double v9 = v8;
  double v11 = v10;
  [v7 accessibilitySceneFrame];
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  uint64_t v17 = *(void *)(a1 + 32);
  BOOL v18 = v13 == v9;
  BOOL v19 = v13 < v9;
  BOOL v20 = v11 == v15;
  BOOL v21 = v11 < v15;
  BOOL v22 = v18;
  BOOL v23 = v9 < v13;
  if (v17 == 4)
  {
    BOOL v23 = v15 < v11;
    BOOL v22 = v15 == v11;
  }
  if (v17 != 3)
  {
    BOOL v21 = v23;
    BOOL v20 = v22;
  }
  if (v17 != 2)
  {
    BOOL v19 = v21;
    BOOL v18 = v20;
  }
  BOOL v24 = v9 == v13;
  BOOL v25 = v15 == v11;
  BOOL v26 = v15 < v11;
  BOOL v27 = v24;
  BOOL v28 = v13 < v9;
  if (v17 == 4)
  {
    BOOL v28 = v11 < v15;
    BOOL v27 = v11 == v15;
  }
  if (v17 != 3)
  {
    BOOL v26 = v28;
    BOOL v25 = v27;
  }
  BOOL v29 = v17 == 2;
  if (v17 == 2) {
    BOOL v30 = v9 < v13;
  }
  else {
    BOOL v30 = v26;
  }
  if (!v29) {
    BOOL v24 = v25;
  }
  if (v16 == 1) {
    BOOL v18 = v24;
  }
  else {
    BOOL v30 = v19;
  }
  BOOL v29 = !v30;
  uint64_t v31 = -1;
  if (v29) {
    uint64_t v31 = 1;
  }
  if (v18) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = v31;
  }

  return v32;
}

@end