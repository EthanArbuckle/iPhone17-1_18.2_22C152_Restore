@interface MUImpressionsCalculator
- (BOOL)hasImpressionElements;
- (BOOL)isActive;
- (MUImpressionsCalculator)initWithConfiguration:(id)a3;
- (MUImpressionsCalculatorConfiguration)configuration;
- (NSMutableDictionary)uiElementsByIdentifiers;
- (NSString)debugState;
- (NSUUID)sessionIdentifier;
- (UIScrollView)scrollView;
- (id)_uiElementForIdentifier:(id)a3;
- (id)observerBlock;
- (void)_checkVisibilityForAllItemsOnDate:(id)a3;
- (void)_checkVisibilityForElement:(id)a3 onDate:(id)a4;
- (void)_didEnterBackground:(id)a3;
- (void)_handleNotification:(id)a3 withProposedActiveState:(BOOL)a4;
- (void)_logEnterForImpressionUIElement:(id)a3 usingStartDate:(id)a4;
- (void)_logExitForImpressionUIElement:(id)a3 usingExitDate:(id)a4;
- (void)_logWorkingSetWithDidBecomeVisible:(BOOL)a3;
- (void)_registerForBackgroundingNotifications;
- (void)_willEnterForeground:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setObserverBlock:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation MUImpressionsCalculator

- (void)_logExitForImpressionUIElement:(id)a3 usingExitDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MUImpressionsCalculator *)self observerBlock];

  if (v8)
  {
    v9 = [(MUImpressionsCalculator *)self observerBlock];
    v9[2]();
  }
  id v12 = [(MUImpressionsCalculatorConfiguration *)self->_configuration logger];
  v10 = [v7 clientElement];
  v11 = [v7 startDate];

  [v12 logImpressionElementDidExit:v10 usingEnterDate:v11 exitDate:v6];
}

- (void)_logEnterForImpressionUIElement:(id)a3 usingStartDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MUImpressionsCalculator *)self observerBlock];

  if (v8)
  {
    v9 = [(MUImpressionsCalculator *)self observerBlock];
    v9[2]();
  }
  id v11 = [(MUImpressionsCalculatorConfiguration *)self->_configuration logger];
  v10 = [v7 clientElement];

  [v11 logImpressionElementDidEnter:v10 onDate:v6];
}

- (NSString)debugState
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = [(NSMutableDictionary *)self->_uiElementsByIdentifiers allValues];
  v3 = (void *)[v2 copy];

  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_25];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v11 = [v10 state];
        id v12 = NSString;
        v13 = [v10 clientElement];
        v14 = [v13 debugString];
        v15 = [v10 startDate];
        [v10 frame];
        v16 = NSStringFromCGRect(v51);
        v17 = [v12 stringWithFormat:@"%@ | %@    |   %@", v14, v15, v16];

        if (v11 == 1) {
          v18 = v5;
        }
        else {
          v18 = v40;
        }
        [v18 addObject:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }

  v37 = [NSString stringWithFormat:@"Session Identifier: %@\n", self->_sessionIdentifier];
  v19 = v5;
  [v5 insertObject:@"Visible Elements" atIndex:0];
  v36 = [v5 componentsJoinedByString:@"\n"];
  [v40 insertObject:@"Nonvisible Elements" atIndex:0];
  v20 = [v40 componentsJoinedByString:@"\n"];
  v21 = [(MUImpressionsCalculator *)self scrollView];
  [v21 contentOffset];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  v26 = NSString;
  [v21 frame];
  v27 = NSStringFromCGRect(v52);
  [v21 contentSize];
  v28 = NSStringFromCGSize(v49);
  v50.x = v23;
  v50.y = v25;
  v29 = NSStringFromCGPoint(v50);
  v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  v32 = [v26 stringWithFormat:@"Scrollview Metrics\nframe: %@\ncontentSize %@\ncontent offset: %@\ntype: %@", v27, v28, v29, v31];

  v45[0] = v37;
  v45[1] = v36;
  v45[2] = v20;
  v45[3] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  v34 = [v33 componentsJoinedByString:@"\n\n"];

  return (NSString *)v34;
}

uint64_t __37__MUImpressionsCalculator_debugState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (MUImpressionsCalculator)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUImpressionsCalculator;
  uint64_t v6 = [(MUImpressionsCalculator *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uiElementsByIdentifiers = v7->_uiElementsByIdentifiers;
    v7->_uiElementsByIdentifiers = v8;

    [(MUImpressionsCalculator *)v7 _registerForBackgroundingNotifications];
  }

  return v7;
}

- (void)setSessionIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(NSUUID *)self->_sessionIdentifier isEqual:v5] & 1) == 0)
  {
    uint64_t v6 = MUGetMUImpressionVisibilityCheckingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      sessionIdentifier = self->_sessionIdentifier;
      int v9 = 138412546;
      v10 = sessionIdentifier;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_INFO, "Rotating Session Identifier %@ with %@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)&self->_sessionIdentifier, a3);
    [(NSMutableDictionary *)self->_uiElementsByIdentifiers removeAllObjects];
    uint64_t v8 = MUGetMUImpressionVisibilityCheckingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "Finished removing items and removed the working set", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)_checkVisibilityForAllItemsOnDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MUImpressionsCalculator *)self isActive])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(NSMutableDictionary *)self->_uiElementsByIdentifiers allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(MUImpressionsCalculator *)self _checkVisibilityForElement:*(void *)(*((void *)&v10 + 1) + 8 * v9++) onDate:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_checkVisibilityForElement:(id)a3 onDate:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(MUImpressionsCalculator *)self isActive])
  {
    uint64_t v8 = [v6 clientElement];
    [v8 visibilityThreshold];
    double v10 = v9;

    uint64_t v11 = [v6 state];
    double v12 = 0.0;
    if (v11 != 1) {
      double v12 = v10;
    }
    double v55 = v12;
    long long v13 = [(MUImpressionsCalculator *)self scrollView];
    [v6 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = [(MUImpressionsCalculatorConfiguration *)self->_configuration hostingContainerView];
    objc_msgSend(v13, "convertRect:toView:", v22, v15, v17, v19, v21);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    double v30 = v29;

    [v13 frame];
    v69.origin.CGFloat x = v31;
    v69.origin.CGFloat y = v32;
    v69.size.CGFloat width = v33;
    v69.size.double height = v34;
    v63.origin.CGFloat x = v24;
    v63.origin.CGFloat y = v26;
    v63.size.CGFloat width = v28;
    v63.size.double height = v30;
    CGRect v64 = CGRectIntersection(v63, v69);
    CGFloat x = v64.origin.x;
    CGFloat y = v64.origin.y;
    CGFloat width = v64.size.width;
    double height = v64.size.height;
    v39 = [v6 clientElement];
    id v40 = [v39 sessionIdentifier];
    char v41 = [v40 isEqual:self->_sessionIdentifier];

    if ((v41 & 1) == 0)
    {
      long long v42 = MUGetMUImpressionVisibilityCheckingLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        long long v43 = [v6 clientElement];
        long long v44 = [v43 sessionIdentifier];
        sessionIdentifier = self->_sessionIdentifier;
        *(_DWORD *)buf = 138412546;
        v57 = v44;
        __int16 v58 = 2112;
        v59 = sessionIdentifier;
        _os_log_impl(&dword_1931EA000, v42, OS_LOG_TYPE_INFO, "Mismatch of session identifiers %@ with element identifier %@", buf, 0x16u);
      }
    }
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.double height = height;
    if (CGRectIsNull(v65)
      || (v66.origin.CGFloat x = x,
          v66.origin.CGFloat y = y,
          v66.size.CGFloat width = width,
          v66.size.double height = height,
          CGRectGetHeight(v66) <= 0.0))
    {
      CGRect v51 = MUGetMUImpressionVisibilityCheckingLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1931EA000, v51, OS_LOG_TYPE_DEBUG, "No intersection", buf, 2u);
      }
    }
    else
    {
      double v54 = height / v30;
      v46 = MUGetMUImpressionVisibilityCheckingLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = y;
        v67.size.CGFloat width = width;
        v67.size.double height = height;
        uint64_t v47 = NSStringFromCGRect(v67);
        v68.origin.CGFloat x = v24;
        v68.origin.CGFloat y = v26;
        v68.size.CGFloat width = v28;
        v68.size.double height = v30;
        NSStringFromCGRect(v68);
        v48 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v57 = v47;
        __int16 v58 = 2112;
        v59 = v48;
        __int16 v60 = 2048;
        double v61 = height / v30;
        _os_log_impl(&dword_1931EA000, v46, OS_LOG_TYPE_DEBUG, "Comparing a intersection %@ within parent frame %@ and visible percent is %f", buf, 0x20u);
      }
      double v50 = height / v30;
      double v49 = v55;
      if (v54 >= v55)
      {
        if (!objc_msgSend(v6, "state", v55, v54))
        {
          [v6 setState:1];
          [v6 setStartDate:v7];
          [(MUImpressionsCalculator *)self _logEnterForImpressionUIElement:v6 usingStartDate:v7];
        }
LABEL_24:

        goto LABEL_25;
      }
    }
    if (objc_msgSend(v6, "state", v49, v50, *(void *)&v54) == 1)
    {
      [v6 setState:0];
      CGRect v52 = [v6 startDate];

      if (v52)
      {
        [(MUImpressionsCalculator *)self _logExitForImpressionUIElement:v6 usingExitDate:v7];
      }
      else
      {
        v53 = MUGetMUImpressionVisibilityCheckingLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1931EA000, v53, OS_LOG_TYPE_DEBUG, "For some reason we have a nil start date", buf, 2u);
        }
      }
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (id)_uiElementForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uiElementsByIdentifiers, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[MUImpressionsCalculator _logWorkingSetWithDidBecomeVisible:](self, "_logWorkingSetWithDidBecomeVisible:");
  }
}

- (void)_logWorkingSetWithDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
  id v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    *(void *)&long long v9 = 138412290;
    long long v22 = v9;
    BOOL v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "state", v22) == 1)
        {
          if (v3)
          {
            double v14 = [v13 startDate];

            if (!v14)
            {
              double v15 = MUGetMUImpressionVisibilityCheckingLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                double v16 = [v13 clientElement];
                double v17 = [v16 elementIdentifier];
                *(_DWORD *)buf = v22;
                double v29 = v17;
                _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_INFO, "Did become visible so Start date of element is nil %@", buf, 0xCu);

                BOOL v3 = v23;
              }
            }
            [v13 setStartDate:v5];
            [(MUImpressionsCalculator *)self _logEnterForImpressionUIElement:v13 usingStartDate:v5];
          }
          else
          {
            [(MUImpressionsCalculator *)self _logExitForImpressionUIElement:v13 usingExitDate:v5];
            double v18 = [v13 startDate];

            if (!v18)
            {
              double v19 = MUGetMUImpressionVisibilityCheckingLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                double v20 = [v13 clientElement];
                double v21 = [v20 elementIdentifier];
                *(_DWORD *)buf = v22;
                double v29 = v21;
                _os_log_impl(&dword_1931EA000, v19, OS_LOG_TYPE_INFO, "Start date is already nil %@", buf, 0xCu);

                BOOL v3 = v23;
              }
            }
            [v13 setStartDate:0];
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v10);
  }
}

- (UIScrollView)scrollView
{
  return [(MUImpressionsCalculatorConfiguration *)self->_configuration scrollView];
}

- (BOOL)hasImpressionElements
{
  v2 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_registerForBackgroundingNotifications
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__willEnterForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__didEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
}

- (void)_willEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = MUGetMUImpressionCalculatorBackgroundingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "Will enter foreground", v6, 2u);
  }

  [(MUImpressionsCalculator *)self _handleNotification:v4 withProposedActiveState:1];
}

- (void)_didEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = MUGetMUImpressionCalculatorBackgroundingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "Did enter background", v6, 2u);
  }

  [(MUImpressionsCalculator *)self _handleNotification:v4 withProposedActiveState:0];
}

- (void)_handleNotification:(id)a3 withProposedActiveState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v9 = [v6 object];
    uint64_t v10 = [(MUImpressionsCalculator *)self scrollView];
    uint64_t v11 = [v10 window];
    double v12 = [v11 windowScene];

    long long v13 = MUGetMUImpressionCalculatorBackgroundingLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v9 == v12)
    {
      if (v14)
      {
        v16[0] = 67109120;
        v16[1] = v4;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "Updating scene with proposed state %d", (uint8_t *)v16, 8u);
      }

      [(MUImpressionsCalculator *)self setActive:v4];
    }
    else
    {
      if (v14)
      {
        LOWORD(v16[0]) = 0;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "Scene notification belongs to another window. Early exit.", (uint8_t *)v16, 2u);
      }
    }
  }
  else
  {
    double v15 = MUGetMUImpressionCalculatorBackgroundingLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_INFO, "Notification is not a scene. Early exit.", (uint8_t *)v16, 2u);
    }
  }
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (void)setObserverBlock:(id)a3
{
}

- (MUImpressionsCalculatorConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSMutableDictionary)uiElementsByIdentifiers
{
  return self->_uiElementsByIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiElementsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_observerBlock, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end