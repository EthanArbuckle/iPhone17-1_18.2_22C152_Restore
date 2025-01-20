@interface ATXSuggestedPagesUtils
+ (id)_createStackOfSize:(unint64_t)a3;
+ (id)createLargeStack;
+ (id)createMediumStack;
+ (id)createSmallStack;
+ (id)filterWidgets:(id)a3 bySize:(unint64_t)a4 usedPersonalities:(id)a5;
+ (id)semanticTypeForSuggestedPageType:(int64_t)a3;
+ (id)sortWidgetsByDescendingScore:(id)a3 limit:(unint64_t)a4;
+ (unint64_t)modeForSuggestedPageType:(int64_t)a3;
+ (void)evenlyDistributeWidgets:(id)a3 inRange:(_NSRange)a4 amongStacks:(id)a5 usedPersonalities:(id)a6 maxWidgetsInStack:(unint64_t)a7;
@end

@implementation ATXSuggestedPagesUtils

+ (unint64_t)modeForSuggestedPageType:(int64_t)a3
{
  if ((unint64_t)a3 < 0xD) {
    return qword_1D142B980[a3];
  }
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    +[ATXSuggestedPagesUtils modeForSuggestedPageType:](a3, v5);
  }

  return 16;
}

+ (id)semanticTypeForSuggestedPageType:(int64_t)a3
{
  uint64_t v6 = 0;
  v7 = 0;
  switch(a3)
  {
    case 0:
    case 1:
      return v7;
    case 2:
      uint64_t v6 = -1;
      goto LABEL_15;
    case 4:
      uint64_t v6 = 1;
      goto LABEL_15;
    case 5:
      uint64_t v6 = 2;
      goto LABEL_15;
    case 6:
      uint64_t v6 = 3;
      goto LABEL_15;
    case 7:
      uint64_t v6 = 4;
      goto LABEL_15;
    case 8:
      uint64_t v6 = 5;
      goto LABEL_15;
    case 9:
      uint64_t v6 = 6;
      goto LABEL_15;
    case 10:
      uint64_t v6 = 7;
      goto LABEL_15;
    case 11:
      uint64_t v6 = 8;
      goto LABEL_15;
    case 12:
      uint64_t v6 = 9;
      goto LABEL_15;
    default:
LABEL_15:
      v7 = objc_msgSend(NSNumber, "numberWithInteger:", v6, v3);
      return v7;
  }
}

+ (id)createSmallStack
{
  return (id)[a1 _createStackOfSize:0];
}

+ (id)createMediumStack
{
  return (id)[a1 _createStackOfSize:1];
}

+ (id)createLargeStack
{
  return (id)[a1 _createStackOfSize:2];
}

+ (id)_createStackOfSize:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F4B0B8]);
  [v4 setStackLayoutSize:a3];
  v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];
  [v4 setIdentifier:v6];

  return v4;
}

+ (id)filterWidgets:(id)a3 bySize:(unint64_t)a4 usedPersonalities:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F4B440]);
        v15 = [v13 extensionBundleId];
        v16 = [v13 widgetKind];
        v17 = (void *)[v14 initWithExtensionBundleId:v15 kind:v16];

        if (([v7 containsObject:v17] & 1) == 0 && objc_msgSend(v13, "size") == a4) {
          [v19 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v19;
}

+ (void)evenlyDistributeWidgets:(id)a3 inRange:(_NSRange)a4 amongStacks:(id)a5 usedPersonalities:(id)a6 maxWidgetsInStack:(unint64_t)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a5;
  id v13 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__ATXSuggestedPagesUtils_evenlyDistributeWidgets_inRange_amongStacks_usedPersonalities_maxWidgetsInStack___block_invoke;
  v16[3] = &unk_1E68B4170;
  NSUInteger v19 = location;
  NSUInteger v20 = length;
  unint64_t v21 = a7;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [a3 enumerateObjectsUsingBlock:v16];
}

void __106__ATXSuggestedPagesUtils_evenlyDistributeWidgets_inRange_amongStacks_usedPersonalities_maxWidgetsInStack___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = *(void *)(a1 + 48);
  BOOL v8 = a3 >= v6;
  unint64_t v7 = a3 - v6;
  BOOL v8 = !v8 || v7 >= *(void *)(a1 + 56);
  if (!v8)
  {
    id v23 = v5;
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 % objc_msgSend(*(id *)(a1 + 32), "count"));
    uint64_t v10 = [v9 widgets];
    uint64_t v11 = [v10 count];
    uint64_t v12 = *(void *)(a1 + 64);

    if (v11 != v12)
    {
      id v13 = [v9 widgets];
      id v14 = v13;
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = (id)objc_opt_new();
      }
      v16 = v15;

      id v17 = [v16 arrayByAddingObject:v23];
      [v9 setWidgets:v17];

      id v18 = *(void **)(a1 + 40);
      id v19 = objc_alloc(MEMORY[0x1E4F4B440]);
      NSUInteger v20 = [v23 extensionBundleId];
      unint64_t v21 = [v23 widgetKind];
      long long v22 = (void *)[v19 initWithExtensionBundleId:v20 kind:v21];
      [v18 addObject:v22];
    }
    id v5 = v23;
  }
}

+ (id)sortWidgetsByDescendingScore:(id)a3 limit:(unint64_t)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v14[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  BOOL v8 = [v5 sortedArrayUsingDescriptors:v7];

  if (a4)
  {
    unint64_t v9 = [v5 count];
    if (v9 >= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v9;
    }
    objc_msgSend(v8, "subarrayWithRange:", 0, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v8;
  }
  uint64_t v12 = v11;

  return v12;
}

+ (void)modeForSuggestedPageType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXSuggestedPagesUtils: unhandled page type: %ld", (uint8_t *)&v2, 0xCu);
}

@end