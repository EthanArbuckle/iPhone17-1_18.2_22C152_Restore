@interface ATXDefaultHomeScreenItemUpdate
- (ATXDefaultHomeScreenItemUpdate)initWithDictionary:(id)a3;
- (ATXDefaultHomeScreenItemUpdate)initWithStack:(id)a3 todayStack:(id)a4 onboardingStacks:(id)a5 smallWidgets:(id)a6 mediumWidgets:(id)a7 largeWidgets:(id)a8 extraLargeWidgets:(id)a9 shouldSuggestStackInGallery:(BOOL)a10;
- (ATXDefaultWidgetStack)stack;
- (ATXDefaultWidgetStack)todayStack;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSuggestStackInGallery;
- (NSArray)extraLargeWidgets;
- (NSArray)largeWidgets;
- (NSArray)mediumWidgets;
- (NSArray)onboardingStacks;
- (NSArray)smallWidgets;
- (id)dictionaryRepresentation;
@end

@implementation ATXDefaultHomeScreenItemUpdate

- (ATXDefaultHomeScreenItemUpdate)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"defaultWidgetStack"];
  if (!v5
    || (v6 = (void *)v5,
        [v4 objectForKeyedSubscript:@"defaultWidgetStack"],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    v9 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:](v9, v47, v48, v49, v50, v51, v52, v53);
    }
    goto LABEL_38;
  }
  v9 = [v4 objectForKeyedSubscript:@"defaultWidgetStack"];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"defaultWidgetTodayStack"];
  if (!v10
    || (v11 = (void *)v10,
        [v4 objectForKeyedSubscript:@"defaultWidgetTodayStack"],
        v12 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v13 = objc_opt_isKindOfClass(),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    v14 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:](v14, v54, v55, v56, v57, v58, v59, v60);
    }
    goto LABEL_37;
  }
  v14 = [v4 objectForKeyedSubscript:@"defaultWidgetTodayStack"];
  uint64_t v15 = [v4 objectForKeyedSubscript:@"defaultWidgetOnboardingStacks"];
  if (!v15
    || (v16 = (void *)v15,
        [v4 objectForKeyedSubscript:@"defaultWidgetOnboardingStacks"],
        v17 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v18 = objc_opt_isKindOfClass(),
        v17,
        v16,
        (v18 & 1) == 0))
  {
    v19 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:](v19, v61, v62, v63, v64, v65, v66, v67);
    }
    goto LABEL_36;
  }
  v19 = [v4 objectForKeyedSubscript:@"defaultWidgetOnboardingStacks"];
  uint64_t v20 = [v4 objectForKeyedSubscript:@"defaultWidgetsSmall"];
  if (!v20
    || (v21 = (void *)v20,
        [v4 objectForKeyedSubscript:@"defaultWidgetsSmall"],
        v22 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v23 = objc_opt_isKindOfClass(),
        v22,
        v21,
        (v23 & 1) == 0))
  {
    v24 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.4(v24, v68, v69, v70, v71, v72, v73, v74);
    }
    goto LABEL_35;
  }
  v24 = [v4 objectForKeyedSubscript:@"defaultWidgetsSmall"];
  uint64_t v25 = [v4 objectForKeyedSubscript:@"defaultWidgetsMedium"];
  if (!v25
    || (v26 = (void *)v25,
        [v4 objectForKeyedSubscript:@"defaultWidgetsMedium"],
        v27 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v28 = objc_opt_isKindOfClass(),
        v27,
        v26,
        (v28 & 1) == 0))
  {
    v75 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.5(v75, v76, v77, v78, v79, v80, v81, v82);
    }
    goto LABEL_28;
  }
  v29 = [v4 objectForKeyedSubscript:@"defaultWidgetsMedium"];
  uint64_t v30 = [v4 objectForKeyedSubscript:@"defaultWidgetsLarge"];
  if (!v30) {
    goto LABEL_29;
  }
  v31 = (void *)v30;
  [v4 objectForKeyedSubscript:@"defaultWidgetsLarge"];
  v32 = v111 = v29;
  objc_opt_class();
  char v33 = objc_opt_isKindOfClass();

  v29 = v111;
  if ((v33 & 1) == 0)
  {
LABEL_29:
    v83 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.6(v83, v84, v85, v86, v87, v88, v89, v90);
    }

    goto LABEL_35;
  }
  v34 = [v4 objectForKeyedSubscript:@"defaultWidgetsLarge"];
  uint64_t v35 = [v4 objectForKeyedSubscript:@"defaultWidgetsExtraLarge"];
  if (!v35) {
    goto LABEL_32;
  }
  v36 = (void *)v35;
  [v4 objectForKeyedSubscript:@"defaultWidgetsExtraLarge"];
  v37 = v110 = v34;
  objc_opt_class();
  char v38 = objc_opt_isKindOfClass();

  v34 = v110;
  if ((v38 & 1) == 0)
  {
LABEL_32:
    v91 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.7(v91, v92, v93, v94, v95, v96, v97, v98);
    }

    goto LABEL_35;
  }
  v39 = [v4 objectForKeyedSubscript:@"defaultWidgetsExtraLarge"];
  uint64_t v40 = [v4 objectForKeyedSubscript:@"shouldSuggestSmartStackInGallery"];
  if (!v40
    || (v41 = (void *)v40,
        [v4 objectForKeyedSubscript:@"shouldSuggestSmartStackInGallery"],
        v42 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v43 = objc_opt_isKindOfClass(),
        v42,
        v41,
        (v43 & 1) == 0))
  {
    v100 = v39;
    v101 = __atxlog_handle_home_screen();
    v75 = v111;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.8(v101, v102, v103, v104, v105, v106, v107, v108);
    }

LABEL_28:
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
    v46 = 0;
    goto LABEL_39;
  }
  v44 = [v4 objectForKeyedSubscript:@"shouldSuggestSmartStackInGallery"];
  char v45 = [v44 BOOLValue];

  LOBYTE(v109) = v45;
  self = [(ATXDefaultHomeScreenItemUpdate *)self initWithStack:v9 todayStack:v14 onboardingStacks:v19 smallWidgets:v24 mediumWidgets:v111 largeWidgets:v110 extraLargeWidgets:v39 shouldSuggestStackInGallery:v109];

  v46 = self;
LABEL_39:

  return v46;
}

- (ATXDefaultHomeScreenItemUpdate)initWithStack:(id)a3 todayStack:(id)a4 onboardingStacks:(id)a5 smallWidgets:(id)a6 mediumWidgets:(id)a7 largeWidgets:(id)a8 extraLargeWidgets:(id)a9 shouldSuggestStackInGallery:(BOOL)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXDefaultHomeScreenItemUpdate;
  v19 = [(ATXDefaultHomeScreenItemUpdate *)&v27 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_stack, a3);
    objc_storeStrong((id *)&v20->_todayStack, a4);
    objc_storeStrong((id *)&v20->_onboardingStacks, a5);
    objc_storeStrong((id *)&v20->_smallWidgets, a6);
    objc_storeStrong((id *)&v20->_mediumWidgets, a7);
    objc_storeStrong((id *)&v20->_largeWidgets, a8);
    objc_storeStrong((id *)&v20->_extraLargeWidgets, a9);
    v20->_shouldSuggestStackInGallery = a10;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_stack forKeyedSubscript:@"defaultWidgetStack"];
  [v3 setObject:self->_todayStack forKeyedSubscript:@"defaultWidgetTodayStack"];
  [v3 setObject:self->_onboardingStacks forKeyedSubscript:@"defaultWidgetOnboardingStacks"];
  [v3 setObject:self->_smallWidgets forKeyedSubscript:@"defaultWidgetsSmall"];
  [v3 setObject:self->_mediumWidgets forKeyedSubscript:@"defaultWidgetsMedium"];
  [v3 setObject:self->_largeWidgets forKeyedSubscript:@"defaultWidgetsLarge"];
  [v3 setObject:self->_extraLargeWidgets forKeyedSubscript:@"defaultWidgetsExtraLarge"];
  id v4 = [NSNumber numberWithBool:self->_shouldSuggestStackInGallery];
  [v3 setObject:v4 forKeyedSubscript:@"shouldSuggestSmartStackInGallery"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXDefaultHomeScreenItemUpdate *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      stack = self->_stack;
      v7 = (ATXDefaultWidgetStack *)v5[2];
      if (stack == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = stack;
        BOOL v10 = [(ATXDefaultWidgetStack *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_31;
        }
      }
      todayStack = self->_todayStack;
      char v13 = (ATXDefaultWidgetStack *)v5[3];
      if (todayStack == v13)
      {
      }
      else
      {
        v14 = v13;
        uint64_t v15 = todayStack;
        BOOL v16 = [(ATXDefaultWidgetStack *)v15 isEqual:v14];

        if (!v16) {
          goto LABEL_31;
        }
      }
      onboardingStacks = self->_onboardingStacks;
      id v18 = (NSArray *)v5[4];
      if (onboardingStacks == v18)
      {
      }
      else
      {
        v19 = v18;
        uint64_t v20 = onboardingStacks;
        char v21 = [(NSArray *)v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_31;
        }
      }
      smallWidgets = self->_smallWidgets;
      id v23 = (NSArray *)v5[5];
      if (smallWidgets == v23)
      {
      }
      else
      {
        id v24 = v23;
        id v25 = smallWidgets;
        char v26 = [(NSArray *)v25 isEqual:v24];

        if ((v26 & 1) == 0) {
          goto LABEL_31;
        }
      }
      mediumWidgets = self->_mediumWidgets;
      char v28 = (NSArray *)v5[6];
      if (mediumWidgets == v28)
      {
      }
      else
      {
        v29 = v28;
        uint64_t v30 = mediumWidgets;
        char v31 = [(NSArray *)v30 isEqual:v29];

        if ((v31 & 1) == 0) {
          goto LABEL_31;
        }
      }
      largeWidgets = self->_largeWidgets;
      char v33 = (NSArray *)v5[7];
      if (largeWidgets == v33)
      {
      }
      else
      {
        v34 = v33;
        uint64_t v35 = largeWidgets;
        char v36 = [(NSArray *)v35 isEqual:v34];

        if ((v36 & 1) == 0) {
          goto LABEL_31;
        }
      }
      extraLargeWidgets = self->_extraLargeWidgets;
      char v38 = (NSArray *)v5[8];
      if (extraLargeWidgets == v38)
      {
      }
      else
      {
        v39 = v38;
        uint64_t v40 = extraLargeWidgets;
        char v41 = [(NSArray *)v40 isEqual:v39];

        if ((v41 & 1) == 0)
        {
LABEL_31:
          BOOL v11 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      int shouldSuggestStackInGallery = self->_shouldSuggestStackInGallery;
      BOOL v11 = shouldSuggestStackInGallery == [v5 shouldSuggestStackInGallery];
      goto LABEL_32;
    }
    BOOL v11 = 0;
  }
LABEL_33:

  return v11;
}

- (ATXDefaultWidgetStack)stack
{
  return self->_stack;
}

- (ATXDefaultWidgetStack)todayStack
{
  return self->_todayStack;
}

- (NSArray)onboardingStacks
{
  return self->_onboardingStacks;
}

- (NSArray)smallWidgets
{
  return self->_smallWidgets;
}

- (NSArray)mediumWidgets
{
  return self->_mediumWidgets;
}

- (NSArray)largeWidgets
{
  return self->_largeWidgets;
}

- (NSArray)extraLargeWidgets
{
  return self->_extraLargeWidgets;
}

- (BOOL)shouldSuggestStackInGallery
{
  return self->_shouldSuggestStackInGallery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeWidgets, 0);
  objc_storeStrong((id *)&self->_largeWidgets, 0);
  objc_storeStrong((id *)&self->_mediumWidgets, 0);
  objc_storeStrong((id *)&self->_smallWidgets, 0);
  objc_storeStrong((id *)&self->_onboardingStacks, 0);
  objc_storeStrong((id *)&self->_todayStack, 0);

  objc_storeStrong((id *)&self->_stack, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end