@interface CALNUNNotificationCategoryMapper
+ (id)_calnNotificationCategoryFromUNNotificationCategory:(id)a3;
+ (id)_unNotificationCategoryFromCALNNotificationCategory:(id)a3;
+ (id)calnNotificationCategoriesFromUNNotificationCategories:(id)a3;
+ (id)unNotificationCategoriesFromCALNNotificationCategories:(id)a3;
+ (unint64_t)_calnNotificationCategoryOptionsFromUNNotificationCategoryOptions:(unint64_t)a3;
+ (unint64_t)_unNotificationCategoryOptionsFromCALNNotificationCategoryOptions:(unint64_t)a3;
@end

@implementation CALNUNNotificationCategoryMapper

+ (id)unNotificationCategoriesFromCALNNotificationCategories:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 set];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __91__CALNUNNotificationCategoryMapper_unNotificationCategoriesFromCALNNotificationCategories___block_invoke;
  v13 = &unk_2645C12E8;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __91__CALNUNNotificationCategoryMapper_unNotificationCategoriesFromCALNNotificationCategories___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) _unNotificationCategoryFromCALNNotificationCategory:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)calnNotificationCategoriesFromUNNotificationCategories:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 set];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __91__CALNUNNotificationCategoryMapper_calnNotificationCategoriesFromUNNotificationCategories___block_invoke;
  v13 = &unk_2645C1310;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __91__CALNUNNotificationCategoryMapper_calnNotificationCategoriesFromUNNotificationCategories___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) _calnNotificationCategoryFromUNNotificationCategory:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)_unNotificationCategoryFromCALNNotificationCategory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actions];
  v6 = +[CALNUNNotificationActionMapper unNotificationActionsFromCALNNotificationActions:v5];

  uint64_t v7 = objc_msgSend(a1, "_unNotificationCategoryOptionsFromCALNNotificationCategoryOptions:", objc_msgSend(v4, "options"));
  v8 = (void *)MEMORY[0x263F1DF28];
  v9 = [v4 identifier];
  uint64_t v10 = [v4 hiddenPreviewsBodyPlaceholder];
  uint64_t v11 = [v4 categorySummaryFormat];

  v12 = [v8 categoryWithIdentifier:v9 actions:v6 intentIdentifiers:MEMORY[0x263EFFA68] hiddenPreviewsBodyPlaceholder:v10 categorySummaryFormat:v11 options:v7];

  return v12;
}

+ (id)_calnNotificationCategoryFromUNNotificationCategory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actions];
  v6 = +[CALNUNNotificationActionMapper calnNotificationActionsFromUNNotificationActions:v5];

  uint64_t v7 = objc_msgSend(a1, "_calnNotificationCategoryOptionsFromUNNotificationCategoryOptions:", objc_msgSend(v4, "options"));
  v8 = [v4 identifier];
  v9 = [v4 hiddenPreviewsBodyPlaceholder];
  uint64_t v10 = [v4 categorySummaryFormat];

  uint64_t v11 = +[CALNNotificationCategory categoryWithIdentifier:v8 actions:v6 hiddenPreviewsBodyPlaceholder:v9 options:v7 categorySummaryFormat:v10];

  return v11;
}

+ (unint64_t)_unNotificationCategoryOptionsFromCALNNotificationCategoryOptions:(unint64_t)a3
{
  uint64_t v3 = 8388609;
  if ((a3 & 4) == 0) {
    uint64_t v3 = 1;
  }
  return a3 & 2 | (((a3 >> 3) & 1) << 17) | v3;
}

+ (unint64_t)_calnNotificationCategoryOptionsFromUNNotificationCategoryOptions:(unint64_t)a3
{
  return (a3 >> 21) & 4 | a3 & 2 | (a3 >> 14) & 8;
}

@end