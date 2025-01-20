@interface EKDayGridViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHideEmptyHours;
- (BOOL)accessibilityIsPreviewGridView;
- (BOOL)isAccessibilityElement;
- (EKDayGridViewAccessibility)initWithFrame:(CGRect)a3 backgroundColor:(id)a4 opaque:(BOOL)a5 numberOfDaysToDisplay:(unint64_t)a6;
- (id)accessibilityElements;
- (void)_axResetChildren;
- (void)dealloc;
- (void)setAccessibilityIsPreviewGridView:(BOOL)a3;
@end

@implementation EKDayGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayGridView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKDayViewController"];
  [v3 validateClass:@"EKDayView"];
  [v3 validateClass:@"EKDayViewContent"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewController", @"currentDayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayView", @"dayContent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewContent", @"grid", "@", 0);
}

- (BOOL)accessibilityIsPreviewGridView
{
  return MEMORY[0x270F09620](self, &__EKDayGridViewAccessibility__accessibilityIsPreviewGridView);
}

- (void)setAccessibilityIsPreviewGridView:(BOOL)a3
{
}

- (EKDayGridViewAccessibility)initWithFrame:(CGRect)a3 backgroundColor:(id)a4 opaque:(BOOL)a5 numberOfDaysToDisplay:(unint64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)EKDayGridViewAccessibility;
  v6 = -[EKDayGridViewAccessibility initWithFrame:backgroundColor:opaque:numberOfDaysToDisplay:](&v9, sel_initWithFrame_backgroundColor_opaque_numberOfDaysToDisplay_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:v6 selector:sel__accessibilityOccurrencesChanged_ name:@"CalendarModelDisplayedOccurrencesChangedNotification" object:0];

  return v6;
}

- (void)_axResetChildren
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(EKDayGridViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      uint64_t v14 = v3;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v20 + 1) + 8 * v5);
        [v6 setAccessibilityContainer:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 setAccessibilityDelegate:0];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 setDayGrid:0];
          v7 = [v6 children];
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v17;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v17 != v10) {
                  objc_enumerationMutation(v7);
                }
                v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v12 setDayGridView:0];
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v9);
          }

          uint64_t v3 = v14;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v3);
  }

  [(EKDayGridViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

- (BOOL)_accessibilityHideEmptyHours
{
  uint64_t v2 = [(EKDayGridViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Ncwidgetviewco.isa)];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityElements
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  BOOL v3 = [(EKDayGridViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  uint64_t v4 = [v3 _accessibilityViewController];

  uint64_t v5 = [v4 safeValueForKeyPath:@"currentDayView.dayContent.grid"];
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == self;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v11 = 0;
    goto LABEL_78;
  }
  uint64_t v8 = (void *)MEMORY[0x263F81490];
  uint64_t v9 = [(EKDayGridViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v9)
  {
    id v10 = (id)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    [(EKDayGridViewAccessibility *)self _accessibilitySetRetainedValue:v10 forKey:*v8];
    v12 = [(EKDayGridViewAccessibility *)self safeValueForKey:@"superview"];
    if (v12)
    {
      NSClassFromString(&cfstr_Ekdayviewconte.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _AXAssert();
        id v11 = 0;
LABEL_76:

        goto LABEL_77;
      }
    }
    v13 = [v12 safeValueForKey:@"_dayStarts"];
    if ([v13 count])
    {
      uint64_t v14 = [v13 objectAtIndex:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        _AXAssert();
        goto LABEL_73;
      }
      buf[0] = 0;
      objc_opt_class();
      long long v16 = [v13 objectAtIndex:0];
      long long v17 = [v16 objectForKey:@"startDate"];
      long long v18 = __UIAccessibilityCastAsClass();

      id v11 = [v18 date];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _AXAssert();

LABEL_73:
        id v11 = 0;
        goto LABEL_75;
      }
    }
    else
    {
      buf[0] = 0;
      objc_opt_class();
      long long v19 = [v12 safeValueForKey:@"_startDate"];
      long long v20 = __UIAccessibilityCastAsClass();

      id v11 = [v20 date];
    }
    if (!v11)
    {
      _AXAssert();
      goto LABEL_75;
    }
    v91 = v6;
    v92 = v4;
    long long v21 = [MEMORY[0x263EFF8F0] currentCalendar];
    long long v22 = [v21 components:62 fromDate:v11];
    [v22 setHour:0];
    v95 = v21;
    v88 = v22;
    v96 = [v21 dateFromComponents:v22];

    BOOL v104 = [(EKDayGridViewAccessibility *)self _accessibilityHideEmptyHours];
    v89 = v13;
    uint64_t v23 = [v13 count];
    v90 = v12;
    v100 = [v12 safeValueForKey:@"occurrenceViews"];
    uint64_t v102 = v23;
    id v99 = v10;
    if (v23 >= 1)
    {
      uint64_t v24 = 0;
      do
      {
        v25 = (void *)[objc_allocWithZone((Class)MobileCalDayContainerAccessibilityElement) initWithAccessibilityContainer:self];
        id v26 = objc_alloc_init(MEMORY[0x263EFF918]);
        [v26 setDay:v24];
        uint64_t v27 = [v95 dateByAddingComponents:v26 toDate:v96 options:0];
        if (!v27)
        {
          v28 = AXLogAppAccessibility();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v122 = v96;
            __int16 v123 = 2112;
            id v124 = v26;
            _os_log_error_impl(&dword_2420FB000, v28, OS_LOG_TYPE_ERROR, "Unable to get date from start date %@ adding date components %@", buf, 0x16u);
          }

          uint64_t v27 = [v96 dateByAddingTimeInterval:(double)(86400 * v24)];
        }
        v108 = v26;
        [v25 setDate:v27];
        [v25 setIndexInArray:v24];
        [v25 setDayGrid:self];
        [v10 addObject:v25];
        v29 = [MEMORY[0x263EFF8F0] currentCalendar];
        v106 = (void *)v27;
        v30 = [v29 components:62 fromDate:v27];

        v31 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) initWithCapacity:24];
        uint64_t v32 = 0;
        v33 = 0;
        do
        {
          [v30 setHour:v32];
          v34 = [MEMORY[0x263EFF8F0] currentCalendar];
          v35 = [v34 dateFromComponents:v30];

          if (([v35 isEqualToDate:v33] & 1) == 0)
          {
            v36 = [[MobileCalHourAccessibilityElement alloc] initWithAccessibilityContainer:v25];
            [(MobileCalHourAccessibilityElement *)v36 setHourDate:v35];
            [(MobileCalHourAccessibilityElement *)v36 setIsAccessibilityElement:!v104];
            [(MobileCalHourAccessibilityElement *)v36 setDayGridView:self];
            [v31 addObject:v36];
          }
          ++v32;
          v33 = v35;
        }
        while (v32 != 24);
        [v25 setChildren:v31];
        if (v104 && ![v100 count])
        {
          v37 = [[MobileCalDayPlaceholderElement alloc] initWithAccessibilityContainer:v25];
          v38 = accessibilityLocalizedString(@"no.events.today");
          [(MobileCalDayPlaceholderElement *)v37 setAccessibilityLabel:v38];

          v120 = v37;
          v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
          v40 = (void *)[v39 mutableCopy];
          [v25 setChildren:v40];
        }
        ++v24;
        id v10 = v99;
      }
      while (v24 != v102);
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v41 = v100;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v114 objects:v119 count:16];
    if (!v42)
    {
LABEL_71:

      id v11 = v10;
      v6 = v91;
      uint64_t v4 = v92;
      v13 = v89;
      v12 = v90;
LABEL_75:

      goto LABEL_76;
    }
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v115;
    id v97 = v41;
    uint64_t v98 = *(void *)v115;
LABEL_33:
    uint64_t v45 = 0;
    uint64_t v101 = v43;
    while (1)
    {
      if (*(void *)v115 != v44) {
        objc_enumerationMutation(v41);
      }
      v46 = *(void **)(*((void *)&v114 + 1) + 8 * v45);
      if (![v46 isAccessibilityElement]) {
        goto LABEL_69;
      }
      v47 = [v46 safeValueForKey:@"occurrence"];
      v48 = v47;
      if (v47) {
        break;
      }
LABEL_68:

LABEL_69:
      if (++v45 == v43)
      {
        uint64_t v43 = [v41 countByEnumeratingWithState:&v114 objects:v119 count:16];
        if (!v43) {
          goto LABEL_71;
        }
        goto LABEL_33;
      }
    }
    v49 = [v47 startDate];
    if (!v49)
    {
      _AXAssert();
LABEL_67:

      goto LABEL_68;
    }
    v105 = v48;
    v50 = [MEMORY[0x263EFF8F0] currentCalendar];
    v107 = v49;
    v51 = [v50 components:62 fromDate:v49];

    v109 = v51;
    v52 = (void *)[v51 copyWithZone:0];
    [v52 setHour:0];
    [v52 setMinute:0];
    [v52 setSecond:0];
    v53 = [MEMORY[0x263EFF8F0] currentCalendar];
    v103 = v52;
    v54 = [v53 dateFromComponents:v52];

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v55 = v10;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v110 objects:v118 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v111;
LABEL_41:
      uint64_t v59 = 0;
      while (1)
      {
        if (*(void *)v111 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = *(void **)(*((void *)&v110 + 1) + 8 * v59);
        v61 = [v60 date];
        char v62 = [v54 isEqualToDate:v61];

        if (v62) {
          break;
        }
        if (v57 == ++v59)
        {
          uint64_t v57 = [v55 countByEnumeratingWithState:&v110 objects:v118 count:16];
          if (!v57)
          {
            id v63 = v55;
            id v10 = v99;
            uint64_t v43 = v101;
            id v41 = v97;
            uint64_t v44 = v98;
            goto LABEL_65;
          }
          goto LABEL_41;
        }
      }
      id v63 = v60;

      id v10 = v99;
      uint64_t v43 = v101;
      id v41 = v97;
      uint64_t v44 = v98;
      v49 = v107;
      if (!v63) {
        goto LABEL_66;
      }
      v64 = [v63 children];
      if (v64)
      {
        unint64_t v65 = [v109 hour];
        BOOL v66 = v65 >= [v64 count];
        uint64_t v43 = v101;
        if (!v66)
        {
          v67 = objc_msgSend(v64, "objectAtIndex:", objc_msgSend(v109, "hour"));
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v46 setAccessibilityContainer:v63];
            buf[0] = 0;
            objc_opt_class();
            v68 = __UIAccessibilityCastAsSafeCategory();
            if (buf[0]) {
              goto LABEL_81;
            }
            v69 = v68;
            [v68 _axSetDropPointDescriptorsProvider:v67];

            objc_msgSend(v64, "replaceObjectAtIndex:withObject:", objc_msgSend(v109, "hour"), v46);
          }
          else
          {
            objc_opt_class();
            v70 = v67;
            v94 = v67;
            if (objc_opt_isKindOfClass())
            {
              [v46 setAccessibilityContainer:v67];
              buf[0] = 0;
              objc_opt_class();
              v71 = [v67 children];
              v72 = [v71 firstObject];
              v73 = __UIAccessibilityCastAsSafeCategory();

              if (buf[0]) {
                goto LABEL_81;
              }
              v74 = [v73 _axDropPointDescriptorsProvider];
              buf[0] = 0;
              objc_opt_class();
              v75 = __UIAccessibilityCastAsSafeCategory();
              if (buf[0]) {
                goto LABEL_81;
              }
              v76 = v75;
              [v75 _axSetDropPointDescriptorsProvider:v74];

              v67 = v94;
              v77 = [v94 children];
              [v77 addObject:v46];

              uint64_t v43 = v101;
            }
            else
            {
              v78 = (void *)[objc_allocWithZone((Class)MobileCalOccurrencyContainerAccessibilityElement) initWithAccessibilityContainer:v63];
              v79 = [MEMORY[0x263EFF980] array];
              [v78 setChildren:v79];

              [v70 setAccessibilityContainer:v78];
              v80 = [v78 children];
              [v80 addObject:v70];

              v93 = v78;
              [v46 setAccessibilityContainer:v78];
              buf[0] = 0;
              objc_opt_class();
              v81 = __UIAccessibilityCastAsSafeCategory();
              if (buf[0]
                || (v82 = v81,
                    [v81 _axDropPointDescriptorsProvider],
                    v83 = objc_claimAutoreleasedReturnValue(),
                    buf[0] = 0,
                    objc_opt_class(),
                    __UIAccessibilityCastAsSafeCategory(),
                    v84 = objc_claimAutoreleasedReturnValue(),
                    buf[0]))
              {
LABEL_81:
                abort();
              }
              v85 = v84;
              [v84 _axSetDropPointDescriptorsProvider:v83];

              v86 = [v93 children];
              [v86 addObject:v46];

              objc_msgSend(v64, "replaceObjectAtIndex:withObject:", objc_msgSend(v109, "hour"), v93);
              uint64_t v43 = v101;
              v67 = v94;
            }
          }

          uint64_t v44 = v98;
        }
      }
    }
    else
    {
      id v63 = v55;
    }
LABEL_65:

    v49 = v107;
LABEL_66:

    v48 = v105;
    goto LABEL_67;
  }
  id v10 = v9;
  id v11 = v10;
LABEL_77:

LABEL_78:

  return v11;
}

uint64_t __51__EKDayGridViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Ekdayviewcontr_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(EKDayGridViewAccessibility *)self _axResetChildren];
  v4.receiver = self;
  v4.super_class = (Class)EKDayGridViewAccessibility;
  [(EKDayGridViewAccessibility *)&v4 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end