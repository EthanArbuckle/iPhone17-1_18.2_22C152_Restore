@interface _DKSyncWindow
+ (id)choppedWindowsFromSortedNormalizedWindows:(id)a3 betweenWindowMinimumDate:(id)a4 andWindowMaximumDate:(id)a5;
+ (id)completedWindowsFromWindows:(void *)a3 firstEvent:(void *)a4 lastEvent:(uint64_t)a5 fetchOrder:(uint64_t)a6 fillOrder:(int)a7 hitLimit:;
+ (id)completedWindowsWithSortedEvents:(void *)a3 windows:(uint64_t)a4 fetchOrder:(uint64_t)a5 fillOrder:(int)a6 hitLimit:;
+ (id)dictionaryArrayFromWindows:(uint64_t)a1;
+ (id)lastWindowMissingFromSortedNormalizedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:;
+ (id)lastWindowMissingFromSortedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:;
+ (id)redundantWindowsFromSortedWindows:(void *)a3 olderThanDate:;
+ (id)sortedUnionOfSortedWindows:(void *)a3 andSortedWindows:;
+ (id)syncWindowWithStartDate:(void *)a3 endDate:;
+ (id)unionOfSortedSyncWindows:(uint64_t)a1;
+ (id)windowsFromDictionaryArray:(uint64_t)a1;
+ (id)windowsMissingFromSortedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:;
+ (id)windowsThatOverlapWithWindowMinimumDate:(void *)a3 windowMaximumDate:(void *)a4 sortedSyncWindows:;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)event;
- (id)unionWithSyncWindow:(id *)a1;
- (int64_t)compare:(id)a3;
- (uint64_t)isEqualToWindow:(uint64_t)a1;
- (uint64_t)startDate;
- (unint64_t)hash;
- (void)initWithEvent:(void *)a1;
- (void)setEndDate:(uint64_t)a1;
- (void)setStartDate:(uint64_t)a1;
@end

@implementation _DKSyncWindow

- (void)setStartDate:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)initWithEvent:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_DKSyncWindow;
    id v5 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      uint64_t v6 = [v4 startDate];
      v7 = (void *)a1[2];
      a1[2] = v6;

      uint64_t v8 = [v4 endDate];
      v9 = (void *)a1[3];
      a1[3] = v8;
    }
  }

  return a1;
}

+ (id)syncWindowWithStartDate:(void *)a3 endDate:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_new();
  -[_DKSyncWindow setStartDate:]((uint64_t)v6, v5);

  -[_DKSyncWindow setEndDate:]((uint64_t)v6, v4);
  return v6;
}

- (void)setEndDate:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)event
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)unionWithSyncWindow:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    id v4 = a1 + 2;
    [a1[2] timeIntervalSinceReferenceDate];
    double v6 = v5;
    [a1[3] timeIntervalSinceReferenceDate];
    double v8 = v7;
    if (v3) {
      v9 = v3[2];
    }
    else {
      v9 = 0;
    }
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
    if (v3) {
      v12 = v3[3];
    }
    else {
      v12 = 0;
    }
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    if (v6 <= v11 && v11 <= v8)
    {
      if (v6 <= v13 && v13 <= v8)
      {
        v25 = a1;
LABEL_48:
        v18 = v25;
        goto LABEL_49;
      }
      v18 = objc_opt_new();
      -[_DKSyncWindow setStartDate:]((uint64_t)v18, *v4);
      if (v8 <= v14) {
        goto LABEL_29;
      }
      goto LABEL_39;
    }
    if (v11 <= v6 && v6 <= v13)
    {
      if (v11 <= v8 && v8 <= v13)
      {
        v25 = v3;
        goto LABEL_48;
      }
      uint64_t v23 = objc_opt_new();
      v18 = (void *)v23;
      if (v3) {
        v24 = v3[2];
      }
      else {
        v24 = 0;
      }
      -[_DKSyncWindow setStartDate:](v23, v24);
      if (v14 > v8)
      {
LABEL_29:
        if (v3)
        {
LABEL_30:
          id v21 = v3[3];
LABEL_40:
          -[_DKSyncWindow setEndDate:]((uint64_t)v18, v21);
          goto LABEL_49;
        }
        goto LABEL_58;
      }
LABEL_39:
      id v21 = a1[3];
      goto LABEL_40;
    }
    if (v6 <= v13 && v13 <= v8)
    {
      uint64_t v17 = objc_opt_new();
      v18 = (void *)v17;
      if (v6 >= v11)
      {
        if (!v3)
        {
          v19 = 0;
          goto LABEL_22;
        }
        id v4 = v3 + 2;
      }
      v19 = *v4;
LABEL_22:
      -[_DKSyncWindow setStartDate:](v17, v19);
      goto LABEL_39;
    }
    v18 = 0;
    if (v11 <= v8 && v8 <= v13)
    {
      uint64_t v26 = objc_opt_new();
      v18 = (void *)v26;
      if (v11 < v6)
      {
        if (!v3)
        {
          -[_DKSyncWindow setStartDate:](v26, 0);
          goto LABEL_58;
        }
        id v4 = v3 + 2;
      }
      -[_DKSyncWindow setStartDate:](v26, *v4);
      if (v3) {
        goto LABEL_30;
      }
LABEL_58:
      id v21 = 0;
      goto LABEL_40;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_49:

  return v18;
}

- (uint64_t)startDate
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

+ (id)sortedUnionOfSortedWindows:(void *)a3 andSortedWindows:
{
  id v4 = a3;
  id v5 = a2;
  self;
  double v6 = (void *)[v5 mutableCopy];

  [v6 addObjectsFromArray:v4];
  [v6 sortUsingSelector:sel_compare_];
  return v6;
}

+ (id)windowsThatOverlapWithWindowMinimumDate:(void *)a3 windowMaximumDate:(void *)a4 sortedSyncWindows:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  v9 = objc_opt_new();
  double v10 = (id *)objc_opt_new();
  -[_DKSyncWindow setStartDate:]((uint64_t)v10, v6);
  -[_DKSyncWindow setEndDate:]((uint64_t)v10, v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v17 = -[_DKSyncWindow unionWithSyncWindow:](v10, v16);

        if (v17) {
          objc_msgSend(v9, "addObject:", v16, (void)v19);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v9;
}

+ (id)choppedWindowsFromSortedNormalizedWindows:(id)a3 betweenWindowMinimumDate:(id)a4 andWindowMaximumDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count] && objc_msgSend(v7, "count"))
  {
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v12 = v11;
      if (v11) {
        id v11 = (void *)v11[3];
      }
      uint64_t v13 = [v11 compare:v8];

      if (v13 == 1) {
        break;
      }
      if (++v10 >= (unint64_t)[v7 count]) {
        goto LABEL_25;
      }
    }
    uint64_t v14 = [v7 count];
    uint64_t v15 = v14 - 1;
    while (1)
    {
      uint64_t v16 = v15;
      if (--v14 < 0) {
        break;
      }
      uint64_t v17 = [v7 objectAtIndexedSubscript:v14];
      v18 = v17;
      if (v17) {
        uint64_t v17 = (void *)v17[2];
      }
      uint64_t v19 = [v17 compare:v9];

      uint64_t v15 = v16 - 1;
      if (v19 == -1)
      {
        if (v10) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    uint64_t v14 = -1;
    if (v10) {
      goto LABEL_19;
    }
LABEL_17:
    if (v14 == [v7 count] - 1)
    {
      id v20 = v7;
      goto LABEL_24;
    }
LABEL_19:
    if (v14 < 0) {
      goto LABEL_25;
    }
    if (v16 < 0) {
      uint64_t v21 = -1;
    }
    else {
      uint64_t v21 = v16;
    }
    objc_msgSend(v7, "subarrayWithRange:", v10, v21 - v10 + 1);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
    long long v22 = v20;
  }
  else
  {
LABEL_25:
    long long v22 = 0;
  }

  return v22;
}

+ (id)lastWindowMissingFromSortedNormalizedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  if (![v6 count])
  {
    uint64_t v15 = objc_opt_new();
    -[_DKSyncWindow setStartDate:]((uint64_t)v15, v7);
    -[_DKSyncWindow setEndDate:]((uint64_t)v15, v8);
    goto LABEL_39;
  }
  uint64_t v9 = [v6 lastObject];
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = *(void **)(v9 + 16);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  if ([v12 isEqualToDate:v7])
  {
    if (v10) {
      uint64_t v13 = (void *)v10[3];
    }
    else {
      uint64_t v13 = 0;
    }
    char v14 = [v13 isEqualToDate:v8];

    if (v14) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  if (v10) {
    uint64_t v16 = (void *)v10[2];
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;
  if ([v17 compare:v7] == 1)
  {
  }
  else
  {
    if (v10) {
      v18 = (void *)v10[3];
    }
    else {
      v18 = 0;
    }
    uint64_t v19 = [v18 compare:v8];

    if (v19 != -1)
    {
LABEL_18:
      uint64_t v15 = 0;
      goto LABEL_38;
    }
  }
  if (v10) {
    id v20 = (void *)v10[3];
  }
  else {
    id v20 = 0;
  }
  if ([v20 compare:v8] == -1)
  {
    uint64_t v15 = objc_opt_new();
    if (v10) {
      uint64_t v23 = (void *)v10[3];
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v24 = [v23 laterDate:v7];
    -[_DKSyncWindow setStartDate:]((uint64_t)v15, v24);

    uint64_t v22 = (uint64_t)v15;
    uint64_t v21 = v8;
  }
  else
  {
    if ([v6 count] != 1)
    {
      uint64_t v25 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 2);
      uint64_t v26 = (void *)v25;
      if (v25) {
        uint64_t v27 = *(void *)(v25 + 24);
      }
      else {
        uint64_t v27 = 0;
      }
      v28 = [v7 laterDate:v27];
      if (v10) {
        v29 = (void *)v10[2];
      }
      else {
        v29 = 0;
      }
      id v30 = v29;
      [v30 timeIntervalSinceReferenceDate];
      double v32 = v31;
      [v28 timeIntervalSinceReferenceDate];
      if (v32 - v33 <= 0.000001)
      {
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = objc_opt_new();
        -[_DKSyncWindow setStartDate:]((uint64_t)v15, v28);
        -[_DKSyncWindow setEndDate:]((uint64_t)v15, v30);
      }

      goto LABEL_38;
    }
    uint64_t v15 = objc_opt_new();
    -[_DKSyncWindow setStartDate:]((uint64_t)v15, v7);
    if (v10) {
      uint64_t v21 = (void *)v10[2];
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v22 = (uint64_t)v15;
  }
  -[_DKSyncWindow setEndDate:](v22, v21);
LABEL_38:

LABEL_39:
  return v15;
}

+ (id)lastWindowMissingFromSortedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  if ([v6 count])
  {
    uint64_t v10 = +[_DKSyncWindow unionOfSortedSyncWindows:]((uint64_t)_DKSyncWindow, v6);

    +[_DKSyncWindow windowsThatOverlapWithWindowMinimumDate:windowMaximumDate:sortedSyncWindows:]((uint64_t)_DKSyncWindow, v7, v8, v10);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = +[_DKSyncWindow lastWindowMissingFromSortedNormalizedWindows:windowMinimumDate:windowMaximumDate:](v9, v6, v7, v8);

  return v11;
}

+ (id)windowsMissingFromSortedWindows:(void *)a3 windowMinimumDate:(void *)a4 windowMaximumDate:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  if ([v6 count])
  {
    id v11 = +[_DKSyncWindow unionOfSortedSyncWindows:]((uint64_t)_DKSyncWindow, v6);

    id v12 = +[_DKSyncWindow windowsThatOverlapWithWindowMinimumDate:windowMaximumDate:sortedSyncWindows:]((uint64_t)_DKSyncWindow, v7, v8, v11);

    uint64_t v13 = (void *)[v12 copy];
    id v14 = v8;
    uint64_t v15 = 0;
    while (1)
    {
      [v14 timeIntervalSinceReferenceDate];
      double v17 = v16;
      [v7 timeIntervalSinceReferenceDate];
      if (v17 <= v18)
      {
        id v6 = v13;
        uint64_t v19 = v15;
        goto LABEL_11;
      }
      +[_DKSyncWindow lastWindowMissingFromSortedNormalizedWindows:windowMinimumDate:windowMaximumDate:]((uint64_t)v9, v13, v7, v14);
      uint64_t v19 = (id *)objc_claimAutoreleasedReturnValue();

      if (!v19) {
        break;
      }
      [v10 insertObject:v19 atIndex:0];
      id v20 = v19[2];

      id v6 = [v9 choppedWindowsFromSortedNormalizedWindows:v13 betweenWindowMinimumDate:v7 andWindowMaximumDate:v20];

      if (v6)
      {
        uint64_t v13 = v6;
        uint64_t v15 = v19;
        id v14 = v20;
        if ([v6 count]) {
          continue;
        }
      }
      goto LABEL_12;
    }
    id v6 = v13;
LABEL_11:
    id v20 = v14;
LABEL_12:
    if (![v10 count])
    {

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v19 = (id *)objc_opt_new();
    -[_DKSyncWindow setStartDate:]((uint64_t)v19, v7);
    -[_DKSyncWindow setEndDate:]((uint64_t)v19, v8);
    [v10 addObject:v19];
  }

  return v10;
}

+ (id)redundantWindowsFromSortedWindows:(void *)a3 olderThanDate:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if ((unint64_t)[v4 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_opt_new();
    uint64_t v7 = [v4 firstObject];
    id v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = *(void **)(v7 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    +[_DKSyncWindow lastWindowMissingFromSortedWindows:windowMinimumDate:windowMaximumDate:]((uint64_t)_DKSyncWindow, v4, v9, v5);
    uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v40 = v10;
      id v11 = v10[3];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v12 = v4;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v46;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 8 * v16);
            if (v17) {
              double v18 = *(void **)(v17 + 16);
            }
            else {
              double v18 = 0;
            }
            id v19 = v18;
            [v19 timeIntervalSinceReferenceDate];
            double v21 = v20;
            [v11 timeIntervalSinceReferenceDate];
            double v23 = v22;

            if (v21 >= v23)
            {
              if (v17) {
                uint64_t v24 = *(void **)(v17 + 24);
              }
              else {
                uint64_t v24 = 0;
              }
              [v24 timeIntervalSinceReferenceDate];
              double v26 = v25;
              [v5 timeIntervalSinceReferenceDate];
              if (v26 > v27) {
                goto LABEL_22;
              }
              [v6 addObject:v17];
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v28 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
          uint64_t v14 = v28;
        }
        while (v28);
      }
LABEL_22:

      uint64_t v10 = v40;
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v11 = v4;
      uint64_t v29 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v42;
LABEL_26:
        uint64_t v32 = 0;
        while (1)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v11);
          }
          uint64_t v33 = *(void *)(*((void *)&v41 + 1) + 8 * v32);
          v34 = v33 ? *(void **)(v33 + 24) : 0;
          [v34 timeIntervalSinceReferenceDate];
          double v36 = v35;
          [v5 timeIntervalSinceReferenceDate];
          if (v36 > v37) {
            break;
          }
          [v6 addObject:v33];
          if (v30 == ++v32)
          {
            uint64_t v38 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
            uint64_t v30 = v38;
            if (v38) {
              goto LABEL_26;
            }
            break;
          }
        }
        uint64_t v10 = 0;
      }
    }

    if ((unint64_t)[v6 count] <= 1)
    {

      id v6 = 0;
    }
  }
  return v6;
}

+ (id)unionOfSortedSyncWindows:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v3, "count", (void)v16))
        {
          [v3 addObject:v9];
          continue;
        }
        uint64_t v10 = [v3 lastObject];
        uint64_t v11 = -[_DKSyncWindow unionWithSyncWindow:](v10, v9);
        id v12 = (void *)v11;
        if (!v11)
        {
          uint64_t v13 = v3;
          uint64_t v14 = v9;
          goto LABEL_12;
        }
        if ((id *)v11 != v10)
        {
          objc_msgSend(v3, "removeObjectAtIndex:", objc_msgSend(v3, "count") - 1);
          uint64_t v13 = v3;
          uint64_t v14 = v12;
LABEL_12:
          [v13 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)completedWindowsWithSortedEvents:(void *)a3 windows:(uint64_t)a4 fetchOrder:(uint64_t)a5 fillOrder:(int)a6 hitLimit:
{
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = self;
  uint64_t v13 = [v11 firstObject];
  uint64_t v14 = [v11 lastObject];

  uint64_t v15 = +[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:](v12, v10, v13, v14, a4, a5, a6);

  return v15;
}

+ (id)completedWindowsFromWindows:(void *)a3 firstEvent:(void *)a4 lastEvent:(uint64_t)a5 fetchOrder:(uint64_t)a6 fillOrder:(int)a7 hitLimit:
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v71 = a4;
  uint64_t v67 = self;
  uint64_t v14 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = [(id)objc_opt_class() description];
    v56 = @"UNKNOWN";
    v57 = @"oldest";
    if (a5 != 1) {
      v57 = @"UNKNOWN";
    }
    if (a5 == 2) {
      v57 = @"newest";
    }
    id obja = (id)v55;
    v77 = v57;
    switch(a6)
    {
      case 1:
        v56 = @"always-full";
        break;
      case 2:
        v56 = @"old-to-new";
        break;
      case 3:
        v56 = @"new-to-old";
        break;
    }
    v61 = v56;
    v58 = @"was not";
    if (a7) {
      v58 = @"was";
    }
    v66 = v58;
    v79 = objc_msgSend(v13, "UUID", v61);
    v59 = [v79 UUIDString];
    v75 = [v13 creationDate];
    v69 = -[NSDate dk_localtimeString](v75);
    v73 = [v71 UUID];
    v63 = [v73 UUIDString];
    v60 = [v71 creationDate];
    v65 = -[NSDate dk_localtimeString](v60);
    v64 = _DKSyncLoggingWindowsDescription(v12);
    *(_DWORD *)buf = 138545410;
    id v88 = obja;
    __int16 v89 = 2114;
    v90 = v77;
    __int16 v91 = 2114;
    uint64_t v92 = v62;
    __int16 v93 = 2114;
    v94 = v66;
    __int16 v95 = 2114;
    v96 = v59;
    __int16 v97 = 2114;
    v98 = v69;
    __int16 v99 = 2114;
    v100 = v63;
    __int16 v101 = 2114;
    v102 = v65;
    __int16 v103 = 2114;
    v104 = v64;
    _os_log_debug_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Computing completed windows using fetch order %{public}@, fill order %{public}@, limit %{public}@ hit, first event %{public}@ (created %{public}@), last event %{public}@ (created %{public}@) from windows %{public}@", buf, 0x5Cu);
  }
  if (a6 == 1 || (uint64_t v15 = 0, v13) && v71)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    switch(a6)
    {
      case 3:
        if (a5 != 1) {
          a7 = 0;
        }
        BOOL v17 = 1;
        goto LABEL_21;
      case 2:
        if (a5 == 2) {
          BOOL v17 = a7;
        }
        else {
          BOOL v17 = 0;
        }
        a7 = 1;
        goto LABEL_21;
      case 1:
        if (a7)
        {
          BOOL v16 = a5 == 2;
          BOOL v17 = a5 == 2;
          a7 = !v16;
          goto LABEL_21;
        }
        break;
      default:
        a7 = 0;
        break;
    }
    BOOL v17 = 0;
LABEL_21:
    id v70 = v13;
    v76 = [v13 creationDate];
    [v76 timeIntervalSinceReferenceDate];
    double v19 = v18;
    v78 = [v71 creationDate];
    [v78 timeIntervalSinceReferenceDate];
    double v21 = v20;
    v74 = [MEMORY[0x1E4F1C9C8] date];
    [v74 timeIntervalSinceReferenceDate];
    double v23 = v22;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v68 = v12;
    id obj = v12;
    uint64_t v24 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
    if (!v24) {
      goto LABEL_67;
    }
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v83;
    int v72 = a7;
    while (1)
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v83 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v82 + 1) + 8 * v27);
        if (v28)
        {
          id v29 = *(id *)(v28 + 16);
          uint64_t v30 = *(void **)(v28 + 24);
        }
        else
        {
          id v29 = 0;
          uint64_t v30 = 0;
        }
        id v31 = v30;
        [v29 timeIntervalSinceReferenceDate];
        double v33 = v32;
        [v31 timeIntervalSinceReferenceDate];
        if (v34 < v19 && v17)
        {
LABEL_32:
          double v36 = 0;
          goto LABEL_63;
        }
        double v36 = 0;
        if (v33 > v21) {
          char v37 = a7;
        }
        else {
          char v37 = 0;
        }
        if ((v37 & 1) == 0 && v33 <= v23)
        {
          double v38 = v34;
          if (v34 > v23)
          {
            id v39 = v74;

            id v31 = v39;
            double v38 = v23;
          }
          BOOL v40 = v33 < v19 && v17;
          if (v40 && v19 < v38)
          {
            uint64_t v41 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v76, v31);
            double v36 = (void *)v41;
            if (v33 < v21) {
              int v42 = a7;
            }
            else {
              int v42 = 0;
            }
            if (v42 == 1 && v21 < v38)
            {
              if (v41)
              {
                +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, *(void **)(v41 + 16), v78);
                v44 = long long v43 = v15;

                double v36 = (void *)v44;
                uint64_t v15 = v43;
                a7 = v72;
                goto LABEL_52;
              }
LABEL_59:
              double v36 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v29, v78);
              if (!v36)
              {
LABEL_60:
                id v46 = (id)v28;
                if (!v28) {
                  goto LABEL_32;
                }
                double v36 = v46;
              }
            }
            else
            {
LABEL_52:
              if (!v36) {
                goto LABEL_60;
              }
            }
            [v15 addObject:v36];
            goto LABEL_63;
          }
          if (v33 < v21) {
            int v45 = a7;
          }
          else {
            int v45 = 0;
          }
          if (v45 == 1 && v21 < v38) {
            goto LABEL_59;
          }
          goto LABEL_60;
        }
LABEL_63:

        ++v27;
      }
      while (v25 != v27);
      uint64_t v47 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
      uint64_t v25 = v47;
      if (!v47)
      {
LABEL_67:

        id v12 = v68;
        id v13 = v70;
        break;
      }
    }
  }
  uint64_t v48 = [v15 lastObject];
  v49 = (void *)v48;
  if (v48) {
    v50 = *(void **)(v48 + 24);
  }
  else {
    v50 = 0;
  }
  id v51 = v50;
  v52 = [MEMORY[0x1E4F1C9C8] distantFuture];
  if ([v51 isEqualToDate:v52]) {
    +[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:]();
  }

  v53 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    +[_DKSyncWindow completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:](v67, v15, v53);
  }

  return v15;
}

+ (id)dictionaryArrayFromWindows:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = @"startDate";
    uint64_t v9 = *(void *)v24;
    *(void *)&long long v6 = 138543874;
    long long v22 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        if (v11)
        {
          id v12 = *(id *)(v11 + 16);
          id v13 = *(void **)(v11 + 24);
        }
        else
        {
          id v12 = 0;
          id v13 = 0;
        }
        id v14 = v13;
        uint64_t v15 = v14;
        if (v12 && v14)
        {
          v33[0] = v8;
          v33[1] = @"endDate";
          v34[0] = v12;
          v34[1] = v14;
          BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
          [v3 addObject:v16];
        }
        else
        {
          BOOL v16 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            [(id)objc_opt_class() description];
            v18 = BOOL v17 = v8;
            *(_DWORD *)buf = v22;
            uint64_t v28 = v18;
            __int16 v29 = 2112;
            id v30 = v12;
            __int16 v31 = 2112;
            double v32 = v15;
            _os_log_error_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to encode window due to missing date where startDate = %@ and endDate = %@", buf, 0x20u);

            id v8 = v17;
          }
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v19 = [v4 countByEnumeratingWithState:&v23 objects:v35 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }

  double v20 = (void *)[v3 copy];
  return v20;
}

+ (id)windowsFromDictionaryArray:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v6 = 138543874;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"startDate", v18);
        id v12 = [v10 objectForKeyedSubscript:@"endDate"];
        id v13 = v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          uint64_t v15 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = v18;
            long long v25 = v19;
            __int16 v26 = 2112;
            uint64_t v27 = v11;
            __int16 v28 = 2112;
            __int16 v29 = v13;
            _os_log_error_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode window due to missing date where startDate = %@ and endDate = %@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v15 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v11, v12);
          [v3 addObject:v15];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v7);
  }

  BOOL v16 = (void *)[v3 copy];
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_event);
    objc_storeStrong(v5 + 2, self->_startDate);
    objc_storeStrong(v5 + 3, self->_endDate);
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = 31 * [(NSDate *)self->_startDate hash];
  return [(NSDate *)self->_endDate hash] ^ v3;
}

- (uint64_t)isEqualToWindow:(uint64_t)a1
{
  uint64_t v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 16) isEqualToDate:v4[2]]) {
      uint64_t v5 = [*(id *)(a1 + 24) isEqualToDate:v4[3]];
    }
    else {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DKSyncWindow *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = -[_DKSyncWindow isEqualToWindow:]((uint64_t)self, v4);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v5 = v4[2];
  }
  else {
    uint64_t v5 = 0;
  }
  NSComparisonResult v6 = [(NSDate *)self->_startDate compare:v5];
  if (v6 == NSOrderedSame)
  {
    if (v4) {
      uint64_t v7 = v4[3];
    }
    else {
      uint64_t v7 = 0;
    }
    NSComparisonResult v6 = [(NSDate *)self->_endDate compare:v7];
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = -[NSDate dk_localtimeString](self->_startDate);
  uint64_t v5 = -[NSDate dk_localtimeString](self->_endDate);
  NSComparisonResult v6 = [v3 stringWithFormat:@"[%@ to %@]", v4, v5];

  return v6;
}

- (id)debugDescription
{
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  double v6 = v4 - v5;
  event = self->_event;
  uint64_t v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  uint64_t v11 = [(_DKSyncWindow *)self description];
  id v12 = (void *)v11;
  if (event)
  {
    id v13 = [(_DKObject *)self->_event UUID];
    BOOL v14 = [v8 stringWithFormat:@"<%@ %p: %@ (delta=%f), event=%@>", v10, self, v12, *(void *)&v6, v13];
  }
  else
  {
    BOOL v14 = [v8 stringWithFormat:@"<%@ %p: %@ (delta=%f)>", v10, self, v11, *(void *)&v6];
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (void)completedWindowsFromWindows:firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:.cold.1()
{
}

+ (void)completedWindowsFromWindows:(NSObject *)a3 firstEvent:lastEvent:fetchOrder:fillOrder:hitLimit:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v5 = [(id)objc_opt_class() description];
  double v6 = _DKSyncLoggingWindowsDescription(a2);
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Computed completed windows %{public}@", (uint8_t *)&v7, 0x16u);
}

@end