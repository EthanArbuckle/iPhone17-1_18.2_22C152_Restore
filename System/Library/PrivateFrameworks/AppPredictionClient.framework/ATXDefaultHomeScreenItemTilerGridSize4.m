@interface ATXDefaultHomeScreenItemTilerGridSize4
- (BOOL)_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:(id)a3;
- (id)_tilingBlueprint;
- (id)tiledHomeScreenItems;
- (void)_tilingBlueprint;
@end

@implementation ATXDefaultHomeScreenItemTilerGridSize4

- (id)tiledHomeScreenItems
{
  v3 = objc_opt_new();
  v4 = [(ATXDefaultHomeScreenItemTilerGridSize4 *)self _tilingBlueprint];
  if (v4)
  {
    BOOL v5 = [(ATXDefaultHomeScreenItemTilerGridSize4 *)self _shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:v4];
    if (v5) {
      unint64_t v6 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self addFirstPod:v3];
    }
    else {
      unint64_t v6 = 0;
    }
    do
    {
      if ((unint64_t)[v3 count] >= 7 && (v6 & 1) == 0) {
        break;
      }
      v7 = objc_msgSend(v4, "objectAtIndexedSubscript:", v6 % objc_msgSend(v4, "count"));
      uint64_t v8 = [v7 integerValue];

      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self addPod:v3 podType:v8 allowAlternatePodTypeAsBackup:v5 podsAdded:v6];
      v6 += v9;
    }
    while (v9);
  }

  return v3;
}

- (id)_tilingBlueprint
{
  if ((~[(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 0x1E) == 0) {
    return &unk_1EFDF4A28;
  }
  if ((~[(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 0xE) == 0) {
    return &unk_1EFDF4A40;
  }
  if (([(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 2) != 0) {
    return &unk_1EFDF4A58;
  }
  if (([(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 4) != 0) {
    return &unk_1EFDF4A70;
  }
  if (([(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 8) != 0) {
    return &unk_1EFDF4A88;
  }
  if (([(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 0x10) != 0) {
    return &unk_1EFDF4AA0;
  }
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(ATXDefaultHomeScreenItemTilerGridSize4 *)self _tilingBlueprint];
  }

  return 0;
}

- (BOOL)_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToArray:&unk_1EFDF4AB8]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToArray:&unk_1EFDF4AD0];
  }

  return v4;
}

- (void)_tilingBlueprint
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 widgetFamilyMask];
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemTilerGridSize4: no tiling blueprint for the requested size family: %lu", (uint8_t *)&v3, 0xCu);
}

@end