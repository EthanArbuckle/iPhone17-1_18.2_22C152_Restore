@interface ATXDefaultHomeScreenItemTilerGridSize2
- (ATXDefaultHomeScreenItemTilerGridSize2)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8;
- (BOOL)_addFirstRow:(id)a3;
- (BOOL)_addLargeRow:(id)a3;
- (BOOL)_addMediumRow:(id)a3;
- (BOOL)_addRow:(id)a3 rowSizePreference:(unint64_t)a4 allowAlternateRowSizeAsBackup:(BOOL)a5;
- (BOOL)_addRow:(id)a3 rowType:(unint64_t)a4;
- (BOOL)_addSmallRow:(id)a3;
- (NSArray)tiledHomeScreenItems;
- (void)tiledHomeScreenItems;
@end

@implementation ATXDefaultHomeScreenItemTilerGridSize2

- (ATXDefaultHomeScreenItemTilerGridSize2)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v29.receiver = self;
  v29.super_class = (Class)ATXDefaultHomeScreenItemTilerGridSize2;
  v18 = [(ATXDefaultHomeScreenItemTilerGridSize2 *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_defaultStack, a3);
    uint64_t v20 = [v15 mutableCopy];
    defaultWidgetsSmall = v19->_defaultWidgetsSmall;
    v19->_defaultWidgetsSmall = (NSMutableArray *)v20;

    uint64_t v22 = [v16 mutableCopy];
    defaultWidgetsMedium = v19->_defaultWidgetsMedium;
    v19->_defaultWidgetsMedium = (NSMutableArray *)v22;

    uint64_t v24 = [v17 mutableCopy];
    defaultWidgetsLarge = v19->_defaultWidgetsLarge;
    v19->_defaultWidgetsLarge = (NSMutableArray *)v24;

    v19->_widgetFamilyMask = a8;
    uint64_t v26 = objc_opt_new();
    tilerHelper = v19->_tilerHelper;
    v19->_tilerHelper = (ATXDefaultHomeScreenItemTilerHelper *)v26;
  }
  return v19;
}

- (NSArray)tiledHomeScreenItems
{
  v3 = objc_opt_new();
  p_unint64_t widgetFamilyMask = (uint64_t *)&self->_widgetFamilyMask;
  unint64_t widgetFamilyMask = self->_widgetFamilyMask;
  unint64_t v6 = widgetFamilyMask & 6;
  if (v6 == 6)
  {
    if (self->_defaultStack) {
      unint64_t v7 = [(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addFirstRow:v3];
    }
    else {
      unint64_t v7 = 0;
    }
    v8 = &unk_1EFDF4980;
    goto LABEL_11;
  }
  if ((widgetFamilyMask & 2) != 0) {
    v8 = &unk_1EFDF4998;
  }
  else {
    v8 = &unk_1EFDF49B0;
  }
  if ((widgetFamilyMask & 6) != 0)
  {
    unint64_t v7 = 0;
    do
    {
LABEL_11:
      if ((unint64_t)[v3 count] > 0xB) {
        break;
      }
      v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", v7 % objc_msgSend(v8, "count"));
      uint64_t v10 = [v9 integerValue];

      ++v7;
    }
    while ([(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addRow:v3 rowSizePreference:v10 allowAlternateRowSizeAsBackup:v6 == 6]);
    goto LABEL_13;
  }
  if ((widgetFamilyMask & 8) != 0)
  {
    unint64_t v7 = 0;
    v8 = &unk_1EFDF49C8;
    goto LABEL_11;
  }
  v12 = __atxlog_handle_modes();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    [(ATXDefaultHomeScreenItemTilerGridSize2 *)p_widgetFamilyMask tiledHomeScreenItems];
  }

LABEL_13:

  return (NSArray *)v3;
}

- (BOOL)_addFirstRow:(id)a3
{
  id v4 = a3;
  if (![(ATXDefaultWidgetStack *)self->_defaultStack suggestedSize]
    && [(NSMutableArray *)self->_defaultWidgetsSmall count])
  {
    uint64_t v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    v8 = (void *)v7;
    if (self->_defaultStack && v7)
    {
      objc_msgSend(v4, "addObject:");
      [v4 addObject:v8];

      goto LABEL_9;
    }
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];

LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  v5 = [(ATXDefaultWidgetStack *)self->_defaultStack mediumDefaultStack];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_11;
  }
  [(ATXDefaultWidgetStack *)self->_defaultStack setSuggestedSize:1];
  if (!self->_defaultStack) {
    goto LABEL_11;
  }
  objc_msgSend(v4, "addObject:");
LABEL_9:
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_addRow:(id)a3 rowSizePreference:(unint64_t)a4 allowAlternateRowSizeAsBackup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = [(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addRow:v8 rowType:a4];
  if (!v9 && v5)
  {
    uint64_t v10 = 0;
    while (a4 == 2
         || a4 == v10
         || ![(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addRow:v8 rowType:v10])
    {
      if (++v10 == 3)
      {
        BOOL v9 = 0;
        goto LABEL_10;
      }
    }
    BOOL v9 = 1;
  }
LABEL_10:

  return v9;
}

- (BOOL)_addRow:(id)a3 rowType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    BOOL v7 = [(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addLargeRow:v6];
  }
  else if (a4 == 1)
  {
    BOOL v7 = [(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addMediumRow:v6];
  }
  else
  {
    if (a4)
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }
    BOOL v7 = [(ATXDefaultHomeScreenItemTilerGridSize2 *)self _addSmallRow:v6];
  }
  BOOL v8 = v7;
LABEL_9:

  return v8;
}

- (BOOL)_addSmallRow:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] < 2)
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    uint64_t v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    BOOL v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];
      BOOL v9 = 0;
    }
    else
    {
      [v4 addObject:v5];
      [v4 addObject:v7];
      BOOL v9 = 1;
    }
  }
  return v9;
}

- (BOOL)_addMediumRow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsMedium];
  if (v5) {
    [v4 addObject:v5];
  }

  return v5 != 0;
}

- (BOOL)_addLargeRow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsLarge];
  if (v5) {
    [v4 addObject:v5];
  }

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilerHelper, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, 0);

  objc_storeStrong((id *)&self->_defaultStack, 0);
}

- (void)tiledHomeScreenItems
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemTilerGridSize4: no tiling blueprint for the requested size family: %lu", (uint8_t *)&v3, 0xCu);
}

@end