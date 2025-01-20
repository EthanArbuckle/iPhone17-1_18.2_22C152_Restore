@interface STUsageReportAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityStringForDate:(id)a3 timePeriod:(unint64_t)a4;
- (id)_countedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5;
- (id)_timedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4;
- (id)_timedDataSetForItemType:(unint64_t)a3 useDarkColors:(BOOL)a4;
- (id)screenTimeDataSet;
- (unint64_t)_axTimePeriodForDescription;
@end

@implementation STUsageReportAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUsageReport";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"screenTimeDataSet", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"_countedDataSetForItemType:trustIdentifier:includeIndicatorImageName:", "@", "Q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"_timedDataSetForItemType:useDarkColors:", "@", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"_timedDataSetForItemType:trustIdentifier:", "@", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", "@", "Q", "Q", "B", "^@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"type", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataSet", @"dataPoints", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataPoint", @"date", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataPoint", @"segments", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"applicationUsageByStartOfDateIntervalByTrustIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"webUsageByStartOfDateIntervalByTrustIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"categoryUsageByStartOfDateIntervalByTrustIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"screenTimeByStartOfDateInterval", "@", 0);
}

- (id)_accessibilityStringForDate:(id)a3 timePeriod:(unint64_t)a4
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_6;
  }
  if (!a4)
  {
    uint64_t v6 = AXClockTimeStringForDate();
    goto LABEL_8;
  }
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      uint64_t v6 = AXDateStringForFormat();
LABEL_8:
      v7 = (void *)v6;
      goto LABEL_10;
    }
LABEL_6:
    v7 = 0;
    goto LABEL_10;
  }
  v8 = NSString;
  v9 = accessibilityLocalizedString(@"week.of");
  v10 = AXDateStringForFormat();
  v7 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

LABEL_10:

  return v7;
}

- (unint64_t)_axTimePeriodForDescription
{
  return [(STUsageReportAccessibility *)self safeUnsignedIntegerForKey:@"type"] == 0;
}

- (id)screenTimeDataSet
{
  v2 = self;
  uint64_t v30 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)STUsageReportAccessibility;
  id v3 = [(STUsageReportAccessibility *)&v28 screenTimeDataSet];
  uint64_t v4 = [(STUsageReportAccessibility *)v2 _axTimePeriodForDescription];
  id v5 = [(STUsageReportAccessibility *)v2 safeDictionaryForKey:@"screenTimeByStartOfDateInterval"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = v3;
  id obj = [v3 safeArrayForKey:@"dataPoints"];
  uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v23)
  {
    uint64_t v6 = *(void *)v25;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v9 = [v8 safeValueForKey:@"date"];
        v10 = [(STUsageReportAccessibility *)v2 _accessibilityStringForDate:v9 timePeriod:v4];
        objc_opt_class();
        v11 = [v5 objectForKeyedSubscript:v9];
        v12 = __UIAccessibilityCastAsClass();

        [v12 doubleValue];
        if (v13 > 0.0)
        {
          v14 = MEMORY[0x24565EF70](v13 < 60.0);
          __AXStringForVariables();
          uint64_t v15 = v4;
          v16 = v5;
          v18 = v17 = v2;
          objc_msgSend(v8, "setAccessibilityLabel:", v18, v14, @"__AXStringForVariablesSentinel");

          v2 = v17;
          id v5 = v16;
          uint64_t v4 = v15;
          uint64_t v6 = v21;
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v23);
  }

  return v20;
}

- (id)_timedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v33.receiver = self;
  v33.super_class = (Class)STUsageReportAccessibility;
  v7 = [(STUsageReportAccessibility *)&v33 _timedDataSetForItemType:a3 trustIdentifier:v6];
  unint64_t v8 = [(STUsageReportAccessibility *)self _axTimePeriodForDescription];
  if (a3 - 2 > 2)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = [(STUsageReportAccessibility *)self safeValueForKey:off_26514C428[a3 - 2]];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = v7;
  id obj = [v7 safeArrayForKey:@"dataPoints"];
  v9 = (void *)v25;
  uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v30;
    id v24 = v6;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [v11 safeValueForKey:@"date"];
        double v13 = [(STUsageReportAccessibility *)self _accessibilityStringForDate:v12 timePeriod:v8];
        v14 = [v9 objectForKeyedSubscript:v6];
        uint64_t v15 = [v14 objectForKeyedSubscript:v12];

        v16 = [v15 safeValueForKey:@"totalUsage"];
        [v16 doubleValue];
        if (v17 > 0.0)
        {
          v18 = MEMORY[0x24565EF70](v17 < 60.0);
          __AXStringForVariables();
          unint64_t v19 = v8;
          v21 = id v20 = self;
          objc_msgSend(v11, "setAccessibilityLabel:", v21, v18, @"__AXStringForVariablesSentinel");

          self = v20;
          unint64_t v8 = v19;
          v9 = (void *)v25;

          id v6 = v24;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v28);
  }

  return v23;
}

- (id)_timedDataSetForItemType:(unint64_t)a3 useDarkColors:(BOOL)a4
{
  v75[2] = *MEMORY[0x263EF8340];
  v70.receiver = self;
  v70.super_class = (Class)STUsageReportAccessibility;
  id v35 = [(STUsageReportAccessibility *)&v70 _timedDataSetForItemType:a3 useDarkColors:a4];
  unint64_t v38 = [(STUsageReportAccessibility *)self _axTimePeriodForDescription];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy_;
  v68 = __Block_byref_object_dispose_;
  id v69 = 0;
  uint64_t v57 = MEMORY[0x263EF8330];
  uint64_t v58 = 3221225472;
  v59 = __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke;
  v60 = &unk_26514C3E0;
  v62 = &v64;
  unint64_t v63 = a3;
  v61 = self;
  AXPerformSafeBlock();
  id v40 = (id)v65[5];
  _Block_object_dispose(&v64, 8);

  switch(a3)
  {
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
      v72 = &unk_26F7A93E8;
      id v5 = [(STUsageReportAccessibility *)self safeValueForKey:@"categoryUsageByStartOfDateIntervalByTrustIdentifier"];
      id v6 = v5;
      if (!v5) {
        id v6 = objc_opt_new();
      }
      v73 = v6;
      v39 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      if (v5) {
        goto LABEL_16;
      }
LABEL_15:

LABEL_16:
      goto LABEL_18;
    case 4uLL:
LABEL_4:
      v74[0] = &unk_26F7A93B8;
      id v5 = [(STUsageReportAccessibility *)self safeValueForKey:@"applicationUsageByStartOfDateIntervalByTrustIdentifier"];
      id v6 = v5;
      if (!v5) {
        id v6 = objc_opt_new();
      }
      v74[1] = &unk_26F7A93D0;
      v75[0] = v6;
      v7 = [(STUsageReportAccessibility *)self safeValueForKey:@"webUsageByStartOfDateIntervalByTrustIdentifier"];
      unint64_t v8 = v7;
      if (!v7) {
        unint64_t v8 = objc_opt_new();
      }
      v75[1] = v8;
      v39 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
      if (!v7) {

      }
      if (v5) {
        goto LABEL_16;
      }
      goto LABEL_15;
  }
  v39 = 0;
LABEL_18:
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v35 safeArrayForKey:@"dataPoints"];
  uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v71 count:16];
  if (v42)
  {
    uint64_t v37 = *(void *)v54;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v54 != v37)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v44 = v9;
        v11 = *(void **)(*((void *)&v53 + 1) + 8 * v9);
        v12 = [v11 safeArrayForKey:@"segments"];
        double v13 = [v11 safeValueForKey:@"date"];
        v45 = [(STUsageReportAccessibility *)self _accessibilityStringForDate:v13 timePeriod:v38];
        v14 = [MEMORY[0x263EFF980] array];
        uint64_t v15 = (void *)[v12 mutableCopy];
        v16 = [MEMORY[0x263EFF980] array];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke_346;
        v46[3] = &unk_26514C408;
        id v47 = v39;
        id v43 = v13;
        id v48 = v43;
        id v17 = v14;
        id v49 = v17;
        id v18 = v16;
        id v50 = v18;
        id v19 = v12;
        id v51 = v19;
        id v20 = v15;
        id v52 = v20;
        [v40 enumerateObjectsUsingBlock:v46];
        uint64_t v21 = accessibilityLabelForUsageItemsOverridingUsages(v18, v17, 0);
        if (![v20 count] || !objc_msgSend(v20, "count")) {
          goto LABEL_30;
        }
        unint64_t v22 = 0;
        double v23 = 0.0;
        do
        {
          LOBYTE(v64) = 0;
          objc_opt_class();
          id v24 = [v19 objectAtIndexedSubscript:v22];
          uint64_t v25 = [v24 safeValueForKey:@"amount"];
          long long v26 = __UIAccessibilityCastAsClass();

          if ((_BYTE)v64) {
            abort();
          }
          [v26 doubleValue];
          double v28 = v27;

          double v23 = v23 + v28;
          ++v22;
        }
        while (v22 < [v20 count]);
        if (v23 > 0.0)
        {
          long long v29 = MEMORY[0x24565EF70](v23 < 60.0, v23);
          long long v30 = NSString;
          long long v31 = accessibilityLocalizedString(@"other.usage.format");
          long long v32 = objc_msgSend(v30, "stringWithFormat:", v31, v29);
        }
        else
        {
LABEL_30:
          long long v32 = 0;
        }
        objc_super v33 = __AXStringForVariables();
        objc_msgSend(v11, "setAccessibilityLabel:", v33, v21, v32, @"__AXStringForVariablesSentinel");

        uint64_t v9 = v44 + 1;
      }
      while (v44 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v71 count:16];
    }
    while (v42);
  }

  return v35;
}

uint64_t __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) topUsageItemsWithMaxCount:3 type:*(void *)(a1 + 48) includeAggregateItem:0 nonAggregateItems:0 darkColors:0];

  return MEMORY[0x270F9A758]();
}

void __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke_346(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "safeIntegerForKey:", @"itemType"));
  id v5 = [v3 safeValueForKey:@"trustIdentifier"];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  v7 = [v6 objectForKeyedSubscript:v5];
  unint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v9 = [v8 safeValueForKey:@"totalUsage"];

  [v9 doubleValue];
  if (v10 > 0.0)
  {
    id v18 = v5;
    id v19 = v4;
    [*(id *)(a1 + 48) addObject:v9];
    [*(id *)(a1 + 56) addObject:v3];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *(id *)(a1 + 64);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) safeValueForKey:@"amount"];
          int v17 = [v16 isEqual:v9];

          if (v17)
          {
            [*(id *)(a1 + 72) removeObject:*(void *)(a1 + 64)];
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v5 = v18;
    uint64_t v4 = v19;
  }
}

- (id)_countedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)STUsageReportAccessibility;
  id v25 = a4;
  id v6 = -[STUsageReportAccessibility _countedDataSetForItemType:trustIdentifier:includeIndicatorImageName:](&v34, sel__countedDataSetForItemType_trustIdentifier_includeIndicatorImageName_, a3);
  long long v29 = self;
  unint64_t v28 = [(STUsageReportAccessibility *)self _axTimePeriodForDescription];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v6;
  id obj = [v6 safeArrayForKey:@"dataPoints"];
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = [v11 safeValueForKey:@"date"];
        uint64_t v13 = [(STUsageReportAccessibility *)v29 _accessibilityStringForDate:v12 timePeriod:v28];
        uint64_t v14 = [v11 safeArrayForKey:@"segments"];
        uint64_t v15 = [v14 firstObject];

        objc_opt_class();
        v16 = [v15 safeValueForKey:@"amount"];
        int v17 = __UIAccessibilityCastAsClass();

        if (!v17)
        {
LABEL_10:
          long long v20 = 0;
          goto LABEL_13;
        }
        if (a3 == 6)
        {
          id v18 = NSString;
          id v19 = @"pickups.count.format";
        }
        else
        {
          if (a3 != 5) {
            goto LABEL_10;
          }
          id v18 = NSString;
          id v19 = @"notifications.count.format";
        }
        long long v21 = accessibilityLocalizedString(v19);
        long long v20 = objc_msgSend(v18, "stringWithFormat:", v21, objc_msgSend(v17, "unsignedIntegerValue"));

LABEL_13:
        long long v22 = __AXStringForVariables();
        objc_msgSend(v11, "setAccessibilityLabel:", v22, v20, @"__AXStringForVariablesSentinel");
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  return v24;
}

@end