@interface ATXDefaultHomeScreenItemTilerWrapper
- (ATXDefaultHomeScreenItemTilerWrapper)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8 gridSize:(unint64_t)a9;
- (NSArray)tiledHomeScreenItems;
@end

@implementation ATXDefaultHomeScreenItemTilerWrapper

- (ATXDefaultHomeScreenItemTilerWrapper)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8 gridSize:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXDefaultHomeScreenItemTilerWrapper;
  v20 = [(ATXDefaultHomeScreenItemTilerWrapper *)&v25 init];
  switch(a9)
  {
    case 0uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize2;
      goto LABEL_6;
    case 1uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize3;
      goto LABEL_6;
    case 2uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize4;
      goto LABEL_6;
    case 3uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize5;
LABEL_6:
      uint64_t v22 = [[v21 alloc] initWithDefaultStack:v15 defaultWidgetsSmall:v16 defaultWidgetsMedium:v17 defaultWidgetsLarge:v18 defaultWidgetsExtraLarge:v19 widgetFamilyMask:a8];
      tiler = v20->_tiler;
      v20->_tiler = (ATXDefaultHomeScreenItemTiler *)v22;
      goto LABEL_7;
    case 4uLL:
      tiler = __atxlog_handle_modes();
      if (os_log_type_enabled(tiler, OS_LOG_TYPE_FAULT)) {
        -[ATXDefaultHomeScreenItemTilerWrapper initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:](tiler);
      }
LABEL_7:

      break;
    default:
      break;
  }

  return v20;
}

- (NSArray)tiledHomeScreenItems
{
  return (NSArray *)[(ATXDefaultHomeScreenItemTiler *)self->_tiler tiledHomeScreenItems];
}

- (void).cxx_destruct
{
}

- (void)initWithDefaultStack:(os_log_t)log defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 4;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXDefaultHomeScreenItemTiler: grid size is not valid: %lu", (uint8_t *)&v1, 0xCu);
}

@end