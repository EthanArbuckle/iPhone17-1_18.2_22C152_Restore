@interface ATXDefaultHomeScreenItemTilerGridSize5
- (BOOL)_addTwoSmallWidgets:(id)a3;
- (BOOL)_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:(id)a3;
- (id)_tilingBlueprint;
- (id)tiledHomeScreenItems;
- (void)_tilingBlueprint;
@end

@implementation ATXDefaultHomeScreenItemTilerGridSize5

- (id)tiledHomeScreenItems
{
  v3 = objc_opt_new();
  v4 = [(ATXDefaultHomeScreenItemTilerGridSize5 *)self _tilingBlueprint];
  if (v4)
  {
    BOOL v5 = [(ATXDefaultHomeScreenItemTilerGridSize5 *)self _shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:v4];
    unint64_t v6 = 0;
    do
    {
      if ((unint64_t)[v3 count] >= 0xA && (v6 & 1) == 0
        || (v6 & 1) == 0
        && ![(ATXDefaultHomeScreenItemTilerGridSize5 *)self _addTwoSmallWidgets:v3])
      {
        break;
      }
      v7 = objc_msgSend(v4, "objectAtIndexedSubscript:", v6 % objc_msgSend(v4, "count"));
      uint64_t v8 = [v7 integerValue];

      if (v6) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v5;
      }
      if (v9) {
        unint64_t v6 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self addFirstPod:v3];
      }
      unint64_t v10 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self addPod:v3 podType:v8 allowAlternatePodTypeAsBackup:v5 podsAdded:v6];
      v6 += v10;
    }
    while (v10);
  }

  return v3;
}

- (id)_tilingBlueprint
{
  if ((~[(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 0x1E) == 0) {
    return &unk_1EFDF4908;
  }
  if ((~[(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 0xE) == 0) {
    return &unk_1EFDF4920;
  }
  if (([(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 2) != 0) {
    return &unk_1EFDF4938;
  }
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(ATXDefaultHomeScreenItemTilerGridSize5 *)self _tilingBlueprint];
  }

  return 0;
}

- (BOOL)_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToArray:&unk_1EFDF4950]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToArray:&unk_1EFDF4968];
  }

  return v4;
}

- (BOOL)_addTwoSmallWidgets:(id)a3
{
  id v4 = a3;
  if (([(ATXDefaultHomeScreenItemTilerPodBuilder *)self widgetFamilyMask] & 2) != 0
    && ([(ATXDefaultHomeScreenItemTilerPodBuilder *)self defaultWidgetsSmall],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 >= 2))
  {
    v7 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self tilerHelper];
    uint64_t v8 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self defaultWidgetsSmall];
    BOOL v9 = [v7 filterForNextUnusedWidgetDescriptor:v8];

    unint64_t v10 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self tilerHelper];
    v11 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self defaultWidgetsSmall];
    v12 = [v10 filterForNextUnusedWidgetDescriptor:v11];

    if (v9 && v12)
    {
      [v4 addObject:v9];
      [v4 addObject:v12];
      BOOL v13 = 1;
    }
    else
    {
      v14 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self tilerHelper];
      [v14 unmarkWidgetAsUsed:v9];

      v15 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self tilerHelper];
      [v15 unmarkWidgetAsUsed:v12];

      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_tilingBlueprint
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 widgetFamilyMask];
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemTilerGridSize5: no tiling blueprint for the requested size family: %lu", (uint8_t *)&v3, 0xCu);
}

@end