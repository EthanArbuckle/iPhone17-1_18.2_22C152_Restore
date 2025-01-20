@interface AXElementGrouper
- (AXElementGrouper)init;
- (AXElementGrouper)initWithHeuristics:(int64_t)a3;
- (BOOL)_frame:(CGRect)a3 isApproximatelySameSizeAsFrame:(CGRect)a4;
- (NSArray)transformationPasses;
- (double)thresholdForDeterminingEqualSize;
- (id)_applyTransformationPass:(id)a3 toGroup:(id)a4;
- (id)_applyTransformationPassesToRootGroup:(id)a3;
- (id)_buildHierarchyForGroup:(id)a3 indexOfKeyboard:(unint64_t *)a4;
- (id)_flattenHierarchyForGroup:(id)a3 rootLevel:(BOOL)a4;
- (id)_groupRemovingImpossibleGroups:(id)a3 isRootLevel:(BOOL)a4;
- (id)_groupablesForItems:(id)a3;
- (id)groupElementsInRootGroup:(id)a3;
- (int64_t)heuristics;
- (unint64_t)maximumGroupSize;
- (unint64_t)minimumGroupSize;
- (unint64_t)preferredGroupSize;
- (void)setHeuristics:(int64_t)a3;
@end

@implementation AXElementGrouper

- (AXElementGrouper)init
{
  return 0;
}

- (AXElementGrouper)initWithHeuristics:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXElementGrouper;
  result = [(AXElementGrouper *)&v5 init];
  if (result) {
    result->_heuristics = a3;
  }
  return result;
}

- (unint64_t)minimumGroupSize
{
  return 3;
}

- (unint64_t)maximumGroupSize
{
  if (self->_heuristics == 2) {
    return 10;
  }
  else {
    return 9;
  }
}

- (unint64_t)preferredGroupSize
{
  if (self->_heuristics == 2) {
    return 10;
  }
  else {
    return 5;
  }
}

- (double)thresholdForDeterminingEqualSize
{
  int64_t heuristics = self->_heuristics;
  double result = 10.0;
  if (heuristics == 1) {
    double result = 16.0;
  }
  if (heuristics == 2) {
    return 25.0;
  }
  return result;
}

- (NSArray)transformationPasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (id)groupElementsInRootGroup:(id)a3
{
  v4 = [(AXElementGrouper *)self _buildHierarchyForGroup:a3 indexOfKeyboard:0];
  objc_super v5 = [(AXElementGrouper *)self _flattenHierarchyForGroup:v4 rootLevel:1];

  v6 = [(AXElementGrouper *)self _applyTransformationPassesToRootGroup:v5];

  return v6;
}

- (id)_groupRemovingImpossibleGroups:(id)a3 isRootLevel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 allowsChangingExistingGroupingOfContents])
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v13 isGroup])
          {
            v14 = [(AXElementGrouper *)self _groupRemovingImpossibleGroups:v13 isRootLevel:0];
            if ([v14 canBeReplacedByChildren]
              && (unint64_t v15 = [v14 count], v15 < -[AXElementGrouper minimumGroupSize](self, "minimumGroupSize"))
              || [v14 shouldBeUngrouped])
            {
              [v7 addObjectsFromArray:v14];
            }
            else
            {
              [v7 addObject:v14];
            }
          }
          else
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    if (v4 && (unint64_t v16 = [v7 count], v16 < -[AXElementGrouper minimumGroupSize](self, "minimumGroupSize")))
    {
      v17 = [MEMORY[0x1E4F1CA48] array];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v7;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
            if (objc_msgSend(v23, "isGroup", (void)v28)
              && [v23 canBeReplacedByChildren])
            {
              [v17 addObjectsFromArray:v23];
            }
            else
            {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v20);
      }
    }
    else
    {
      v17 = v7;
    }
    v25 = objc_msgSend(v8, "label", (void)v28);
    id v24 = +[AXElementGroup groupWithElements:v17 label:v25];

    objc_msgSend(v24, "setGroupTraits:", objc_msgSend(v8, "groupTraits"));
    objc_msgSend(v24, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v8, "userDefinedScanningBehaviorTraits"));
    v26 = [v8 identifier];
    [v24 setIdentifier:v26];
  }
  else
  {
    id v24 = v6;
  }

  return v24;
}

- (BOOL)_frame:(CGRect)a3 isApproximatelySameSizeAsFrame:(CGRect)a4
{
  double height = a4.size.height;
  double v5 = a3.size.height;
  double v7 = vabdd_f64(a3.size.width, a4.size.width);
  [(AXElementGrouper *)self thresholdForDeterminingEqualSize];
  if (v7 >= v8) {
    return 0;
  }
  [(AXElementGrouper *)self thresholdForDeterminingEqualSize];
  return vabdd_f64(v5, height) < v9;
}

- (id)_flattenHierarchyForGroup:(id)a3 rootLevel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(AXElementGrouper *)self _groupRemovingImpossibleGroups:v6 isRootLevel:1];

    id v6 = (id)v7;
  }
  if ([v6 allowsChangingExistingGroupingOfContents])
  {
    uint64_t v8 = [v6 count];
    if (v8)
    {
      uint64_t v9 = v8;
      while (1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        double v12 = 0.0;
        do
        {
          v13 = [v6 objectAtIndex:v10];
          if ([v13 isGroup])
          {
            id v14 = v13;
            if ([v14 canBeReplacedByChildren])
            {
              [v14 frame];
              CGFloat x = v49.origin.x;
              CGFloat y = v49.origin.y;
              CGFloat width = v49.size.width;
              CGFloat height = v49.size.height;
              double v19 = CGRectGetWidth(v49);
              v50.origin.CGFloat x = x;
              v50.origin.CGFloat y = y;
              v50.size.CGFloat width = width;
              v50.size.CGFloat height = height;
              double v20 = v19 * CGRectGetHeight(v50);
              if (v20 > v12)
              {
                unint64_t v21 = v9 - 1 + [v14 count];
                if (v21 <= [(AXElementGrouper *)self maximumGroupSize])
                {
                  int v22 = v9 - [(AXElementGrouper *)self preferredGroupSize];
                  if (v22 >= 0) {
                    unsigned int v23 = v22;
                  }
                  else {
                    unsigned int v23 = -v22;
                  }
                  int v24 = v21 - [(AXElementGrouper *)self preferredGroupSize];
                  if (v24 < 0) {
                    int v24 = -v24;
                  }
                  if (v23 >= v24)
                  {
                    uint64_t v11 = v10;
                    double v12 = v20;
                  }
                }
              }
            }
          }
          ++v10;
        }
        while (v9 != v10);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v25 = [v6 objectAtIndex:v11];
        if (!v25) {
          break;
        }
        v26 = (void *)v25;
        v27 = [MEMORY[0x1E4F1CA48] array];
        for (uint64_t i = 0; i != v9; ++i)
        {
          long long v29 = [v6 objectAtIndex:i];
          if (v11 == i) {
            [v27 addObjectsFromArray:v29];
          }
          else {
            [v27 addObject:v29];
          }
        }
        long long v30 = [MEMORY[0x1E4F1CA48] array];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v31 = v27;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v43 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              if ([v36 isGroup])
              {
                v37 = [(AXElementGrouper *)self _flattenHierarchyForGroup:v36 rootLevel:0];
                [v30 addObject:v37];
              }
              else
              {
                [v30 addObject:v36];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v33);
        }

        uint64_t v38 = [v6 label];
        v39 = +[AXElementGroup groupWithElements:v30 label:v38];

        objc_msgSend(v39, "setGroupTraits:", objc_msgSend(v6, "groupTraits"));
        objc_msgSend(v39, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v6, "userDefinedScanningBehaviorTraits"));
        v40 = [v6 identifier];
        [v39 setIdentifier:v40];

        uint64_t v9 = [v39 count];
        id v6 = v39;
        if (!v9) {
          goto LABEL_40;
        }
      }
    }
  }
  v39 = v6;
LABEL_40:
  return v39;
}

- (id)_applyTransformationPass:(id)a3 toGroup:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v15, "isGroup", (void)v24))
        {
          unint64_t v16 = [(AXElementGrouper *)self _applyTransformationPass:v6 toGroup:v15];
          v12 |= v16 != v15;
          [v8 addObject:v16];
        }
        else
        {
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);

    id v17 = v9;
    id v18 = v17;
    if (v12)
    {
      double v19 = [v17 label];
      double v20 = +[AXElementGroup groupWithElements:v8 label:v19];

      objc_msgSend(v20, "setGroupTraits:", objc_msgSend(v18, "groupTraits"));
      objc_msgSend(v20, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v18, "userDefinedScanningBehaviorTraits"));
      unint64_t v21 = [v18 identifier];
      [v20 setIdentifier:v21];

      id v18 = v20;
    }
  }
  else
  {

    id v18 = v9;
  }
  if (objc_msgSend(v6, "shouldTransformGroup:forGrouper:", v18, self, (void)v24))
  {
    uint64_t v22 = [v6 transformGroup:v18 forGrouper:self];

    id v18 = (id)v22;
  }

  return v18;
}

- (id)_applyTransformationPassesToRootGroup:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(AXElementGrouper *)self transformationPasses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v4 = [(AXElementGrouper *)self _applyTransformationPass:*(void *)(*((void *)&v12 + 1) + 8 * v9) toGroup:v10];

        ++v9;
        uint64_t v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_buildHierarchyForGroup:(id)a3 indexOfKeyboard:(unint64_t *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 allowsChangingExistingGroupingOfContents])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v35 = v5;
      v36 = a4;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v40;
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v14, "isGroup", v35, v36))
          {
            uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
            long long v15 = [(AXElementGrouper *)self _buildHierarchyForGroup:v14 indexOfKeyboard:&v38];
            unint64_t v16 = v15;
            if (v15)
            {
              id v17 = v7;
              unint64_t v18 = v38;
              if (v38 == 0x7FFFFFFFFFFFFFFFLL || v18 >= [v15 count])
              {
                [v6 addObject:v16];
                unint64_t v27 = v10 + 1;
                if (![v16 isKeyboardContainer]) {
                  unint64_t v10 = v12;
                }
                id v7 = v17;
              }
              else
              {
                double v19 = objc_msgSend(v16, "subarrayWithRange:", 0, v38);
                if ([v19 count])
                {
                  double v20 = +[AXElementGroup groupWithElements:v19];
                  [v6 addObject:v20];

                  ++v10;
                }
                unint64_t v21 = [v16 objectAtIndex:v38];
                [v6 addObject:v21];

                unint64_t v22 = v38;
                if (v22 >= [v16 count] - 1)
                {
                  unint64_t v27 = v10 + 1;
                }
                else
                {
                  uint64_t v23 = v38 + 1;
                  uint64_t v24 = [v16 count];
                  long long v25 = objc_msgSend(v16, "subarrayWithRange:", v23, v24 + ~v38);
                  long long v26 = +[AXElementGroup groupWithElements:v25];
                  [v6 addObject:v26];

                  unint64_t v27 = v10 + 2;
                }
                id v7 = v17;
              }
            }
            else
            {
              unint64_t v27 = v10;
              unint64_t v10 = v12;
            }
            unint64_t v12 = v10;

            unint64_t v10 = v27;
          }
          else
          {
            [v6 addObject:v14];
            ++v10;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v9);

      id v28 = v6;
      id v5 = v35;
      a4 = v36;
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v29 = v28;
LABEL_33:
        if ([v29 count])
        {
          uint64_t v32 = [v7 label];
          id v30 = +[AXElementGroup groupWithElements:v29 label:v32];

          objc_msgSend(v30, "setGroupTraits:", objc_msgSend(v7, "groupTraits"));
          objc_msgSend(v30, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v7, "userDefinedScanningBehaviorTraits"));
          uint64_t v33 = [v7 identifier];
          [v30 setIdentifier:v33];
        }
        else
        {
          id v30 = 0;
        }

        if (!a4) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    else
    {

      id v31 = v6;
    }
    if ([v7 allowsVisualGroupingOfChildren])
    {
      uint64_t v29 = [(AXElementGrouper *)self _groupablesForItems:v6];

      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v29 = v6;
    }
    goto LABEL_33;
  }
  id v30 = v5;
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4) {
LABEL_37:
  }
    *a4 = v12;
LABEL_38:

  return v30;
}

- (id)_groupablesForItems:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = [v4 count];
  if (v6 >= [(AXElementGrouper *)self maximumGroupSize])
  {
    if (v6)
    {
      unint64_t v7 = 0;
      do
      {
        unint64_t v8 = [(AXElementGrouper *)self preferredGroupSize];
        if (v8 + v7 > v6 || (unint64_t v9 = v8, v6 - v7 < [(AXElementGrouper *)self maximumGroupSize])) {
          unint64_t v9 = v6 - v7;
        }
        unint64_t v10 = objc_msgSend(v4, "subarrayWithRange:", v7, v9);
        uint64_t v11 = +[AXElementGroup groupWithElements:v10];

        if (v11) {
          [v5 addObject:v11];
        }
        v7 += v9;
      }
      while (v7 < v6);
    }
  }
  else
  {
    [v5 addObjectsFromArray:v4];
  }

  return v5;
}

- (int64_t)heuristics
{
  return self->_heuristics;
}

- (void)setHeuristics:(int64_t)a3
{
  self->_int64_t heuristics = a3;
}

@end