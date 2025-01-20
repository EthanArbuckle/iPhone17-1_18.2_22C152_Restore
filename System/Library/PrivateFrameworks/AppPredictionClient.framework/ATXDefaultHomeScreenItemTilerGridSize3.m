@interface ATXDefaultHomeScreenItemTilerGridSize3
- (ATXDefaultHomeScreenItemTilerGridSize3)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8;
- (BOOL)_addFirstRow:(id)a3;
- (BOOL)_addMediumRow:(id)a3;
- (BOOL)_addRow:(id)a3 rowSizePreference:(unint64_t)a4 allowAlternateRowSizeAsBackup:(BOOL)a5;
- (BOOL)_addRow:(id)a3 rowType:(unint64_t)a4;
- (BOOL)_addSmallRow:(id)a3;
- (NSArray)tiledHomeScreenItems;
@end

@implementation ATXDefaultHomeScreenItemTilerGridSize3

- (ATXDefaultHomeScreenItemTilerGridSize3)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v29.receiver = self;
  v29.super_class = (Class)ATXDefaultHomeScreenItemTilerGridSize3;
  v18 = [(ATXDefaultHomeScreenItemTilerGridSize3 *)&v29 init];
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
      unint64_t v7 = [(ATXDefaultHomeScreenItemTilerGridSize3 *)self _addFirstRow:v3];
    }
    else {
      unint64_t v7 = 0;
    }
    v9 = &unk_1EFDF4B30;
    goto LABEL_11;
  }
  if ((widgetFamilyMask & 2) != 0)
  {
    unint64_t v7 = 0;
    v9 = &unk_1EFDF4B48;
    do
    {
LABEL_11:
      if ((unint64_t)[v3 count] > 6) {
        break;
      }
      v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", v7 % objc_msgSend(v9, "count"));
      uint64_t v11 = [v10 integerValue];

      ++v7;
    }
    while ([(ATXDefaultHomeScreenItemTilerGridSize3 *)self _addRow:v3 rowSizePreference:v11 allowAlternateRowSizeAsBackup:v6 == 6]);
    goto LABEL_13;
  }
  v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(ATXDefaultHomeScreenItemTilerGridSize2 *)p_widgetFamilyMask tiledHomeScreenItems];
  }

LABEL_13:

  return (NSArray *)v3;
}

- (BOOL)_addFirstRow:(id)a3
{
  id v4 = a3;
  if (![(ATXDefaultWidgetStack *)self->_defaultStack suggestedSize]
    && (unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] >= 2)
  {
    v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    uint64_t v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    unint64_t v7 = (void *)v6;
    if (self->_defaultStack && v5 && v6)
    {
      objc_msgSend(v4, "addObject:");
      [v4 addObject:v5];
      [v4 addObject:v7];

LABEL_12:
      BOOL v10 = 1;
LABEL_17:

      goto LABEL_18;
    }
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];

    goto LABEL_16;
  }
  v5 = [(ATXDefaultWidgetStack *)self->_defaultStack mediumDefaultStack];
  if (![v5 count]) {
    goto LABEL_16;
  }
  uint64_t v8 = [(NSMutableArray *)self->_defaultWidgetsSmall count];

  if (v8)
  {
    [(ATXDefaultWidgetStack *)self->_defaultStack setSuggestedSize:1];
    uint64_t v9 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    v5 = (void *)v9;
    if (self->_defaultStack && v9)
    {
      objc_msgSend(v4, "addObject:");
      [v4 addObject:v5];
      goto LABEL_12;
    }
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v9];
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)_addRow:(id)a3 rowSizePreference:(unint64_t)a4 allowAlternateRowSizeAsBackup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = [(ATXDefaultHomeScreenItemTilerGridSize3 *)self _addRow:v8 rowType:a4];
  if (!v9 && v5)
  {
    uint64_t v10 = 0;
    int v11 = 1;
    do
    {
      while (1)
      {
        int v12 = v11;
        if (v10 != a4) {
          break;
        }
        int v11 = 0;
        BOOL v9 = 0;
        uint64_t v10 = 1;
        if ((v12 & 1) == 0) {
          goto LABEL_9;
        }
      }
      BOOL v9 = -[ATXDefaultHomeScreenItemTilerGridSize3 _addRow:rowType:](self, "_addRow:rowType:", v8);
      if (v9) {
        break;
      }
      int v11 = 0;
      uint64_t v10 = 1;
    }
    while (((v12 ^ 1) & 1) == 0);
  }
LABEL_9:

  return v9;
}

- (BOOL)_addRow:(id)a3 rowType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    BOOL v7 = [(ATXDefaultHomeScreenItemTilerGridSize3 *)self _addMediumRow:v6];
  }
  else
  {
    if (a4)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    BOOL v7 = [(ATXDefaultHomeScreenItemTilerGridSize3 *)self _addSmallRow:v6];
  }
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)_addSmallRow:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] < 3)
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    id v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    uint64_t v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    BOOL v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      [v4 addObject:v5];
      [v4 addObject:v6];
      [v4 addObject:v8];
      BOOL v9 = 1;
    }
    else
    {
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v6];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v8];
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)_addMediumRow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsMedium];
  uint64_t v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (v8)
  {
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];
  }
  else
  {
    [v4 addObject:v5];
    [v4 addObject:v7];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilerHelper, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, 0);

  objc_storeStrong((id *)&self->_defaultStack, 0);
}

@end