@interface SCATVisualScrollersAuxiliaryElementManager
- (BOOL)_isGroupingEnabled;
- (BOOL)_showScroller:(int64_t)a3 withElement:(id)a4;
- (BOOL)containsElement:(id)a3;
- (BOOL)hasActivatedScrollSinceContextUpdate;
- (BOOL)isTopLevel;
- (BOOL)providesElements;
- (BOOL)scrollViewController:(id)a3 showHorizontalScrollerForContextElement:(id)a4;
- (BOOL)scrollViewController:(id)a3 showVerticalScrollerForContextElement:(id)a4;
- (NSArray)scrollerElements;
- (NSArray)scrollerGroups;
- (SCATVisualScrollersAuxiliaryElementManager)init;
- (SCATVisualScrollersAuxiliaryElementManager)initWithMode:(int64_t)a3;
- (id)_groupForElement:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (id)scrollerElementsForContextElement;
- (id)scrollerGroupsForContextElement;
- (int64_t)mode;
- (void)dealloc;
- (void)scrollContainer:(id)a3 scrollInDirection:(int64_t)a4;
- (void)setContextElement:(id)a3;
- (void)setHasActivatedScrollSinceContextUpdate:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setScrollerElements:(id)a3;
- (void)setScrollerGroups:(id)a3;
@end

@implementation SCATVisualScrollersAuxiliaryElementManager

- (SCATVisualScrollersAuxiliaryElementManager)initWithMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCATVisualScrollersAuxiliaryElementManager;
  v4 = [(SCATVisualScrollersAuxiliaryElementManager *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = objc_opt_new();
    [(SCATAuxiliaryElementManager *)v5 setViewController:v6];
    [v6 setScrollDelegate:v5];
    [v6 setPositionRelativeToContextElement:a3 == 1];
    v7 = [v6 horizontalScroller];
    [v7 setDelegate:v5];

    v8 = [v6 verticalScroller];
    [v8 setDelegate:v5];
  }
  return v5;
}

- (SCATVisualScrollersAuxiliaryElementManager)init
{
  return [(SCATVisualScrollersAuxiliaryElementManager *)self initWithMode:0];
}

- (void)dealloc
{
  if ([(SCATAuxiliaryElementManager *)self isViewControllerLoaded])
  {
    v3 = [(SCATAuxiliaryElementManager *)self viewController];
    [v3 setScrollDelegate:0];
    v4 = [v3 verticalScroller];
    [v4 setDelegate:0];

    v5 = [v3 horizontalScroller];
    [v5 setDelegate:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)SCATVisualScrollersAuxiliaryElementManager;
  [(SCATVisualScrollersAuxiliaryElementManager *)&v6 dealloc];
}

- (BOOL)isTopLevel
{
  return self->_mode == 0;
}

- (NSArray)scrollerElements
{
  if (!self->_scrollerElements)
  {
    v3 = [(SCATAuxiliaryElementManager *)self viewController];

    if (v3)
    {
      v4 = [(SCATAuxiliaryElementManager *)self viewController];
      v21 = [v4 verticalScroller];
      v5 = [v21 scrollUpView];
      v27[0] = v5;
      objc_super v6 = [v4 verticalScroller];
      v7 = [v6 scrollDownView];
      v27[1] = v7;
      v8 = [v4 horizontalScroller];
      v9 = [v8 scrollLeftView];
      v27[2] = v9;
      objc_super v10 = [v4 horizontalScroller];
      v11 = [v10 scrollRightView];
      v27[3] = v11;
      v12 = +[NSArray arrayWithObjects:v27 count:4];
      scrollerElements = self->_scrollerElements;
      self->_scrollerElements = v12;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v14 = self->_scrollerElements;
      id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          v18 = 0;
          do
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * (void)v18) setScatAuxiliaryElementManager:self];
            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }
    }
  }
  v19 = self->_scrollerElements;

  return v19;
}

- (NSArray)scrollerGroups
{
  if (!self->_scrollerGroups)
  {
    v3 = [(SCATAuxiliaryElementManager *)self viewController];

    if (v3)
    {
      v4 = [(SCATAuxiliaryElementManager *)self viewController];
      id v5 = objc_alloc((Class)AXElementGroup);
      objc_super v6 = [v4 verticalScroller];
      v7 = [v6 scrollUpView];
      v47[0] = v7;
      v8 = [v4 verticalScroller];
      v9 = [v8 scrollDownView];
      v47[1] = v9;
      objc_super v10 = +[NSArray arrayWithObjects:v47 count:2];
      id v11 = [v5 initWithElements:v10 label:0];

      v12 = sub_100040EC8(@"ScrollUpDownContainer");
      [v11 setAccessibilityLabel:v12];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * (void)v17) setScatAuxiliaryElementManager:self];
            uint64_t v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v39 objects:v46 count:16];
        }
        while (v15);
      }

      [v13 setScatAuxiliaryElementManager:self];
      id v18 = objc_alloc((Class)AXElementGroup);
      v19 = [v4 horizontalScroller];
      v20 = [v19 scrollLeftView];
      v45[0] = v20;
      v21 = [v4 horizontalScroller];
      long long v22 = [v21 scrollRightView];
      v45[1] = v22;
      long long v23 = +[NSArray arrayWithObjects:v45 count:2];
      id v24 = [v18 initWithElements:v23 label:0];

      long long v25 = sub_100040EC8(@"ScrollLeftRightContainer");
      [v24 setAccessibilityLabel:v25];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v26 = v24;
      id v27 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v36;
        do
        {
          v30 = 0;
          do
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v26);
            }
            objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)v30), "setScatAuxiliaryElementManager:", self, (void)v35);
            v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          id v28 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v28);
      }

      [v26 setScatAuxiliaryElementManager:self];
      v43[0] = v13;
      v43[1] = v26;
      v31 = +[NSArray arrayWithObjects:v43 count:2];
      scrollerGroups = self->_scrollerGroups;
      self->_scrollerGroups = v31;
    }
  }
  v33 = self->_scrollerGroups;

  return v33;
}

- (BOOL)_isGroupingEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (BOOL)_showScroller:(int64_t)a3 withElement:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(SCATVisualScrollersAuxiliaryElementManager *)self _isGroupingEnabled];
  int64_t v8 = [(SCATVisualScrollersAuxiliaryElementManager *)self mode];
  int64_t v9 = v8;
  if (v7)
  {
    unint64_t v10 = (unint64_t)[v6 scatScanningBehaviorTraits];
    if (v9)
    {
      if (a3) {
        LOBYTE(v11) = v10 & 1;
      }
      else {
        BOOL v11 = (v10 & 2) != 0;
      }
    }
    else if (a3)
    {
      if ((v10 & 1) != 0 && ([v6 isGroup] & 1) == 0)
      {
        id v13 = [v6 parentGroup];
        id v14 = [v13 parentGroup];
        LOBYTE(v11) = v14 == 0;
      }
      else
      {
        BOOL v11 = ((unint64_t)[v6 scatScanningBehaviorTraits] >> 2) & 1;
      }
    }
    else
    {
      BOOL v11 = (v10 >> 3) & 1;
    }
  }
  else if (v8)
  {
    unsigned __int8 v12 = [v6 scatScanningBehaviorTraits];
    if (a3) {
      LOBYTE(v11) = (v12 & 5) != 0;
    }
    else {
      LOBYTE(v11) = (v12 & 0xA) != 0;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (id)scrollerElementsForContextElement
{
  unsigned __int8 v3 = [(SCATAuxiliaryElementManager *)self contextElement];
  unsigned int v25 = [(SCATVisualScrollersAuxiliaryElementManager *)self _showScroller:1 withElement:v3];

  v4 = [(SCATAuxiliaryElementManager *)self contextElement];
  unsigned int v5 = [(SCATVisualScrollersAuxiliaryElementManager *)self _showScroller:0 withElement:v4];

  id v6 = [(SCATAuxiliaryElementManager *)self viewController];
  id v24 = +[NSMutableArray arrayWithCapacity:4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerElements];
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (!v25)
        {
LABEL_9:
          if (!v5) {
            continue;
          }
          goto LABEL_13;
        }
        unsigned __int8 v12 = [v6 horizontalScroller];
        uint64_t v13 = [v12 scrollLeftView];
        if (v11 == (void *)v13)
        {
        }
        else
        {
          id v14 = (void *)v13;
          id v15 = [v6 horizontalScroller];
          uint64_t v16 = [v15 scrollRightView];

          if (v11 != v16) {
            goto LABEL_9;
          }
        }
        [v24 addObject:v11];
        if (!v5) {
          continue;
        }
LABEL_13:
        uint64_t v17 = [v6 verticalScroller];
        uint64_t v18 = [v17 scrollUpView];
        if (v11 == (void *)v18)
        {
        }
        else
        {
          v19 = (void *)v18;
          v20 = [v6 verticalScroller];
          v21 = [v20 scrollDownView];

          if (v11 != v21) {
            continue;
          }
        }
        [v24 addObject:v11];
      }
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  return v24;
}

- (id)scrollerGroupsForContextElement
{
  unsigned __int8 v3 = [(SCATAuxiliaryElementManager *)self contextElement];
  unsigned int v4 = [(SCATVisualScrollersAuxiliaryElementManager *)self _showScroller:1 withElement:v3];

  unsigned int v5 = [(SCATAuxiliaryElementManager *)self contextElement];
  unsigned int v6 = [(SCATVisualScrollersAuxiliaryElementManager *)self _showScroller:0 withElement:v5];

  id v7 = [(SCATAuxiliaryElementManager *)self viewController];
  id v20 = +[NSMutableArray arrayWithCapacity:2];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerGroups];
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v4)
        {
          uint64_t v13 = [v7 horizontalScroller];
          id v14 = [v13 scrollLeftView];
          unsigned int v15 = [v12 containsObject:v14];

          if (v15) {
            [v20 addObject:v12];
          }
        }
        if (v6)
        {
          uint64_t v16 = [v7 verticalScroller];
          uint64_t v17 = [v16 scrollUpView];
          unsigned int v18 = [v12 containsObject:v17];

          if (v18) {
            [v20 addObject:v12];
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  return v20;
}

- (id)_groupForElement:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerGroupsForContextElement];
  if ([v5 containsObject:v4])
  {
    id v6 = v5;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "isGroup", (void)v14)
            && ([v12 containsObject:v4] & 1) != 0)
          {
            id v6 = v12;

            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v6 = 0;
  }
LABEL_14:

  return v6;
}

- (void)setContextElement:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCATVisualScrollersAuxiliaryElementManager;
  [(SCATAuxiliaryElementManager *)&v15 setContextElement:v4];
  [(SCATVisualScrollersAuxiliaryElementManager *)self setHasActivatedScrollSinceContextUpdate:0];
  if ((id)[(SCATVisualScrollersAuxiliaryElementManager *)self mode] == (id)1)
  {
    unsigned int v5 = [v4 isGroup];
    if (!v4 || v5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerGroups];
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setParentGroup:v4];
            uint64_t v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  if ([(SCATVisualScrollersAuxiliaryElementManager *)self _isGroupingEnabled]) {
    [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerGroupsForContextElement];
  }
  else {
  id v4 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerElementsForContextElement];
  }
  unsigned int v5 = [v4 firstObject];

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  if ([(SCATVisualScrollersAuxiliaryElementManager *)self _isGroupingEnabled]) {
    [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerGroupsForContextElement];
  }
  else {
  id v4 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerElementsForContextElement];
  }
  unsigned int v5 = [v4 lastObject];

  return v5;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  if ([(SCATVisualScrollersAuxiliaryElementManager *)self _isGroupingEnabled]) {
    [(SCATVisualScrollersAuxiliaryElementManager *)self _groupForElement:v7];
  }
  else {
  id v8 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerElementsForContextElement];
  }
  uint64_t v9 = v8;
  if (v8 && (uint64_t v10 = (char *)[v8 indexOfObject:v7], v10 != (char *)0x7FFFFFFFFFFFFFFFLL))
  {
    long long v14 = v10;
    objc_super v15 = (char *)[v9 count];
    BOOL v12 = v14 == 0;
    if (v14) {
      long long v16 = v14;
    }
    else {
      long long v16 = v15;
    }
    long long v11 = [v9 objectAtIndex:v16 - 1];
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    long long v11 = 0;
    BOOL v12 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }
  *a4 = v12;
LABEL_8:

  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  if ([(SCATVisualScrollersAuxiliaryElementManager *)self _isGroupingEnabled]) {
    [(SCATVisualScrollersAuxiliaryElementManager *)self _groupForElement:v7];
  }
  else {
  id v8 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerElementsForContextElement];
  }
  uint64_t v9 = (char *)[v8 indexOfObject:v7];

  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = (char *)[v8 count] - 1;
    BOOL v11 = v9 == v12;
    if (v9 == v12) {
      long long v13 = 0;
    }
    else {
      long long v13 = v9 + 1;
    }
    uint64_t v10 = [v8 objectAtIndex:v13];
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  BOOL v11 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v11;
LABEL_12:

  return v10;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  if ([(SCATVisualScrollersAuxiliaryElementManager *)self _isGroupingEnabled])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unsigned int v5 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerGroups];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) containsObject:v4])
          {

            unsigned __int8 v10 = 1;
            goto LABEL_13;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v10 = 0;
  }
  else
  {
    BOOL v11 = [(SCATVisualScrollersAuxiliaryElementManager *)self scrollerElements];
    unsigned __int8 v10 = [v11 containsObject:v4];
  }
LABEL_13:

  return v10;
}

- (void)scrollContainer:(id)a3 scrollInDirection:(int64_t)a4
{
  unsigned __int8 v6 = [(SCATVisualScrollersAuxiliaryElementManager *)self hasActivatedScrollSinceContextUpdate];
  [(SCATVisualScrollersAuxiliaryElementManager *)self setHasActivatedScrollSinceContextUpdate:1];
  if ((unint64_t)a4 > 3)
  {
    uint64_t v7 = 0;
    if (v6)
    {
LABEL_10:
      unsigned __int8 v10 = *(void (**)(uint64_t))(v7 + 16);
      v10(v7);
      return;
    }
  }
  else
  {
    uint64_t v7 = (uint64_t)*(&off_1001ADAC8 + a4);
    if (v6) {
      goto LABEL_10;
    }
  }
  if (![(SCATVisualScrollersAuxiliaryElementManager *)self mode]) {
    goto LABEL_10;
  }
  uint64_t v8 = [(SCATAuxiliaryElementManager *)self contextElement];
  unsigned __int8 v9 = [v8 isGroup];

  if ((v9 & 1) == 0)
  {
    _AXAssert();
    goto LABEL_10;
  }
  id v13 = [(SCATAuxiliaryElementManager *)self contextElement];
  if ([v13 containsNativeFocusElement])
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  else
  {
    switch(a4)
    {
      case 0:
        uint64_t v11 = [v13 topMostLeafAXElement];
        goto LABEL_19;
      case 1:
        uint64_t v11 = [v13 bottomMostLeafAXElement];
        goto LABEL_19;
      case 2:
        uint64_t v11 = [v13 leftMostLeafAXElement];
        goto LABEL_19;
      case 3:
        uint64_t v11 = [v13 rightMostLeafAXElement];
LABEL_19:
        BOOL v12 = (void *)v11;
        break;
      default:
        BOOL v12 = 0;
        break;
    }
    [v12 setNativeFocus];
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

- (BOOL)scrollViewController:(id)a3 showHorizontalScrollerForContextElement:(id)a4
{
  return [(SCATVisualScrollersAuxiliaryElementManager *)self _showScroller:1 withElement:a4];
}

- (BOOL)scrollViewController:(id)a3 showVerticalScrollerForContextElement:(id)a4
{
  return [(SCATVisualScrollersAuxiliaryElementManager *)self _showScroller:0 withElement:a4];
}

- (void)setScrollerElements:(id)a3
{
}

- (void)setScrollerGroups:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)hasActivatedScrollSinceContextUpdate
{
  return self->_hasActivatedScrollSinceContextUpdate;
}

- (void)setHasActivatedScrollSinceContextUpdate:(BOOL)a3
{
  self->_hasActivatedScrollSinceContextUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollerGroups, 0);

  objc_storeStrong((id *)&self->_scrollerElements, 0);
}

@end