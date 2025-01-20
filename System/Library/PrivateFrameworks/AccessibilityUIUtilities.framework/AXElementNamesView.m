@interface AXElementNamesView
- (AXElementNamesStyleProvider)styleProvider;
- (AXElementNamesView)initWithFrame:(CGRect)a3;
- (BOOL)didUpdateItems;
- (CGRect)boundsForLastReload;
- (NSArray)items;
- (NSMutableArray)containers;
- (OS_os_log)loggingFacility;
- (void)_adjustLabelPositionForView:(id)a3 toAvoidCollidingWithView:(id)a4;
- (void)_arrangeNameViews:(id)a3 withinContainer:(id)a4;
- (void)_reloadViews;
- (void)layoutSubviews;
- (void)setBoundsForLastReload:(CGRect)a3;
- (void)setDidUpdateItems:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setLoggingFacility:(id)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation AXElementNamesView

- (AXElementNamesView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AXElementNamesView;
  v3 = -[AXElementNamesView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)*((void *)v3 + 58);
    *((void *)v3 + 58) = v4;

    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v3 + 472) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v3 + 488) = v6;
    uint64_t v7 = AXLogCommon();
    v8 = (void *)*((void *)v3 + 56);
    *((void *)v3 + 56) = v7;
  }
  return (AXElementNamesView *)v3;
}

- (void)setItems:(id)a3
{
  long long v6 = (NSArray *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [(AXElementNamesView *)self loggingFacility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[AXElementNamesView setItems:](a2, v7);
    }
  }
  if (self->_items != v6)
  {
    objc_storeStrong((id *)&self->_items, a3);
    [(AXElementNamesView *)self setDidUpdateItems:1];
    [(AXElementNamesView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)AXElementNamesView;
  [(AXElementNamesView *)&v15 layoutSubviews];
  [(AXElementNamesView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(AXElementNamesView *)self boundsForLastReload];
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (!CGRectEqualToRect(v16, v17) || [(AXElementNamesView *)self didUpdateItems])
  {
    [(AXElementNamesView *)self setDidUpdateItems:0];
    [(AXElementNamesView *)self bounds];
    -[AXElementNamesView setBoundsForLastReload:](self, "setBoundsForLastReload:");
    [(AXElementNamesView *)self _reloadViews];
  }
}

- (void)_reloadViews
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  double v3 = [(AXElementNamesView *)self containers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v87 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v86 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v86 objects:v96 count:16];
    }
    while (v5);
  }

  CGFloat v8 = [(AXElementNamesView *)self containers];
  [v8 removeAllObjects];

  [(AXCyclingView *)self endCycling];
  double v9 = [MEMORY[0x1E4F1CA48] array];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  CGFloat v10 = [(AXElementNamesView *)self items];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v83;
    *(void *)&long long v12 = 138412290;
    long long v69 = v12;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(v10);
        }
        CGRect v16 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        CGRect v17 = objc_msgSend(v16, "elementName", v69);
        uint64_t v18 = [v17 length];

        if (v18)
        {
          [(AXElementNamesView *)self bounds];
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          double v26 = v25;
          [(AXElementNamesView *)self safeAreaInsets];
          double v28 = v20 + v27;
          double v30 = v22 + v29;
          double v32 = v24 - (v27 + v31);
          double v34 = v26 - (v29 + v33);
          v35 = [AXElementNamesItemView alloc];
          v36 = [v16 elementName];
          [v16 elementFrame];
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          double v44 = v43;
          v45 = [(AXElementNamesView *)self styleProvider];
          v46 = -[AXElementNamesItemView initWithName:elementFrame:availableBounds:styleProvider:isSpacer:](v35, "initWithName:elementFrame:availableBounds:styleProvider:isSpacer:", v36, v45, [v16 isSpacer], v38, v40, v42, v44, v28, v30, v32, v34);

          [v16 elementLabelContainerSize];
          -[NSObject setForcedLabelContainerSize:](v46, "setForcedLabelContainerSize:");
          [v9 addObject:v46];
        }
        else
        {
          v46 = [(AXElementNamesView *)self loggingFacility];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v69;
            v94 = v16;
            _os_log_impl(&dword_1C39D1000, v46, OS_LOG_TYPE_INFO, "Found element with no name: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v13);
  }
  while (1)
  {

    if (![v9 count]) {
      break;
    }
    id v47 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(AXElementNamesView *)self bounds];
    CGFloat v10 = objc_msgSend(v47, "initWithFrame:");
    [(AXElementNamesView *)self _arrangeNameViews:v9 withinContainer:v10];
    v48 = [v10 subviews];
    uint64_t v49 = [v48 count];

    if (!v49)
    {

      break;
    }
    v50 = [MEMORY[0x1E4F1CA48] array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v51 = [v10 subviews];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v78 objects:v92 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = 0;
      uint64_t v55 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v79 != v55) {
            objc_enumerationMutation(v51);
          }
          v57 = *(void **)(*((void *)&v78 + 1) + 8 * k);
          if ([v57 isSpacer])
          {
            [v50 addObject:v57];
          }
          else
          {
            [v9 removeObject:v57];
            ++v54;
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v78 objects:v92 count:16];
      }
      while (v53);
    }
    else
    {
      uint64_t v54 = 0;
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v58 = v50;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v74 objects:v91 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v75 != v61) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v74 + 1) + 8 * m) removeFromSuperview];
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v74 objects:v91 count:16];
      }
      while (v60);
    }

    if (v54)
    {
      v63 = [(AXElementNamesView *)self containers];
      [v63 addObject:v10];

      [(AXElementNamesView *)self addSubview:v10];
    }
    else
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v64 = v58;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v70 objects:v90 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v71;
        do
        {
          for (uint64_t n = 0; n != v66; ++n)
          {
            if (*(void *)v71 != v67) {
              objc_enumerationMutation(v64);
            }
            [v9 removeObject:*(void *)(*((void *)&v70 + 1) + 8 * n)];
          }
          uint64_t v66 = [v64 countByEnumeratingWithState:&v70 objects:v90 count:16];
        }
        while (v66);
      }
    }
  }
  [(AXCyclingView *)self beginCycling];
}

- (void)_adjustLabelPositionForView:(id)a3 toAvoidCollidingWithView:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = *MEMORY[0x1E4F1DB28];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  while (1)
  {
    [v6 labelContainerFrame];
    v18.origin.x = v8;
    v18.origin.y = v9;
    v18.size.width = v10;
    v18.size.height = v11;
    if (!CGRectEqualToRect(v17, v18) && ![v6 collidesWithView:v7]) {
      break;
    }
    if ([v6 labelPosition] == 4)
    {
      long long v12 = [(AXElementNamesView *)self loggingFacility];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v6 name];
        int v14 = 138412290;
        objc_super v15 = v13;
        _os_log_impl(&dword_1C39D1000, v12, OS_LOG_TYPE_INFO, "Could not find a non-colliding position for label for %@", (uint8_t *)&v14, 0xCu);
      }
      [v6 removeFromSuperview];
      break;
    }
    objc_msgSend(v6, "setLabelPosition:", objc_msgSend(v6, "labelPosition") + 1);
  }
}

- (void)_arrangeNameViews:(id)a3 withinContainer:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  uint64_t v7 = [v21 count];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    CGFloat v10 = *MEMORY[0x1E4F1DB28];
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      int v14 = [v21 objectAtIndexedSubscript:v9];
      if ([v14 isSpacer])
      {
        [v14 setLabelPosition:4];
        [v6 addSubview:v14];
      }
      else
      {
        [v14 setLabelPosition:0];
        [v6 addSubview:v14];
        while ([v14 labelPosition] != 4)
        {
          [v14 labelContainerFrame];
          v24.origin.x = v10;
          v24.origin.y = v11;
          v24.size.width = v12;
          v24.size.height = v13;
          if (!CGRectEqualToRect(v23, v24)) {
            break;
          }
          objc_msgSend(v14, "setLabelPosition:", objc_msgSend(v14, "labelPosition") + 1);
        }
        if (v9)
        {
          for (uint64_t i = 0; ; uint64_t i = 0)
          {
            while (1)
            {
              uint64_t v16 = [v21 objectAtIndexedSubscript:i];
              id v17 = [v16 superview];

              if (v17 == v6)
              {
                uint64_t v18 = [v14 labelPosition];
                [(AXElementNamesView *)self _adjustLabelPositionForView:v14 toAvoidCollidingWithView:v16];
                if (v18 != [v14 labelPosition]) {
                  break;
                }
              }

              if (++i == v9) {
                goto LABEL_17;
              }
            }
            double v19 = [v14 superview];

            if (!v19) {
              break;
            }
          }
        }
LABEL_17:
        if ([v14 hasExtendedArrow])
        {
          id v20 = [v14 superview];

          if (v20 == v6)
          {
            [v14 removeFromSuperview];
            [v6 insertSubview:v14 atIndex:0];
          }
        }
      }

      ++v9;
    }
    while (v9 != v8);
  }
}

- (NSArray)items
{
  return self->_items;
}

- (OS_os_log)loggingFacility
{
  return self->_loggingFacility;
}

- (void)setLoggingFacility:(id)a3
{
}

- (AXElementNamesStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (NSMutableArray)containers
{
  return self->_containers;
}

- (CGRect)boundsForLastReload
{
  double x = self->_boundsForLastReload.origin.x;
  double y = self->_boundsForLastReload.origin.y;
  double width = self->_boundsForLastReload.size.width;
  double height = self->_boundsForLastReload.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundsForLastReload:(CGRect)a3
{
  self->_boundsForLastReload = a3;
}

- (BOOL)didUpdateItems
{
  return self->_didUpdateItems;
}

- (void)setDidUpdateItems:(BOOL)a3
{
  self->_didUpdateItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_loggingFacility, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)setItems:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_FAULT, "-[AXElementNamesView %@] called off the main thread!", (uint8_t *)&v4, 0xCu);
}

@end