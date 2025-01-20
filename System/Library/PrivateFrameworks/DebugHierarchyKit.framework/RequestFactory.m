@interface RequestFactory
+ (id)_crossPlatformPropertyActions;
+ (id)_effectViewClassNames;
+ (id)_propertyActionsForMac;
+ (id)_propertyActionsForMacCatalyst;
+ (id)_propertyActionsForPlatform:(id)a3;
+ (id)_propertyActionsForTvOS;
+ (id)_propertyActionsForWatchOS;
+ (id)_propertyActionsForiOS;
+ (id)_requestForEncodedLayersWithSnapshot:(id)a3;
+ (id)_requestForEncodedSceneKitScenesWithSnapshot:(id)a3;
+ (id)_requestForRenderedEffectViewsWithSnapshot:(id)a3;
+ (id)_requestForRenderedMultiLayerViewsWithSnapshot:(id)a3;
+ (id)_requestForRenderedSpriteKitTexturesWithSnapshot:(id)a3;
+ (id)_requestForRenderedViewsWithSnapshot:(id)a3;
+ (id)additionalRequestsWithSnapshot:(id)a3;
+ (id)initialRequestForPlatform:(id)a3;
+ (id)requestForRemainingLazyPropertiesWithSnapshot:(id)a3;
@end

@implementation RequestFactory

+ (id)initialRequestForPlatform:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [a1 _crossPlatformPropertyActions];
  [v5 addObjectsFromArray:v6];

  v7 = [a1 _propertyActionsForPlatform:v4];

  [v5 addObjectsFromArray:v7];
  v8 = +[DebugHierarchyRequest requestWithName:@"Initial request" discoveryType:1 actions:v5 completion:0];

  return v8;
}

+ (id)additionalRequestsWithSnapshot:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [a1 _requestForEncodedLayersWithSnapshot:v4];
  if (v6) {
    [v5 addObject:v6];
  }
  v7 = [a1 _requestForRenderedEffectViewsWithSnapshot:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  v8 = [a1 _requestForRenderedMultiLayerViewsWithSnapshot:v4];

  if (v8) {
    [v5 addObject:v8];
  }
  v9 = [a1 _requestForRenderedViewsWithSnapshot:v4];

  if (v9) {
    [v5 addObject:v9];
  }
  v10 = [a1 _requestForRenderedSpriteKitTexturesWithSnapshot:v4];

  if (v10) {
    [v5 addObject:v10];
  }
  v11 = [a1 _requestForEncodedSceneKitScenesWithSnapshot:v4];

  if (v11) {
    [v5 addObject:v11];
  }

  return v5;
}

+ (id)requestForRemainingLazyPropertiesWithSnapshot:(id)a3
{
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setPropertyNames:&off_2FC98 exlusive:1];
  id v7 = v3;
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = +[DebugHierarchyRequest requestWithName:@"Fetch remaining lazy properties" discoveryType:2 actions:v4 completion:0];

  [v5 setTimeout:180.0];

  return v5;
}

+ (id)_requestForEncodedLayersWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"groupingIdentifier == 'com.apple.QuartzCore.CALayer'"];
  v5 = [v3 rootLevelSnapshotGroups];
  v6 = [v5 filteredArrayUsingPredicate:v4];
  id v7 = [v6 firstObject];

  v8 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = objc_msgSend(v7, "allObjects", 0);
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) identifier];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v15 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
    id v16 = [v8 copy];
    [v15 setObjectIdentifiers:v16 exlusive:0];

    [v15 setPropertyNames:&off_2FCB0 exlusive:0];
    id v24 = v15;
    v17 = +[NSArray arrayWithObjects:&v24 count:1];
    v18 = +[DebugHierarchyRequest requestWithName:@"Fetch encoded layers" discoveryType:2 actions:v17 completion:0];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_requestForRenderedEffectViewsWithSnapshot:(id)a3
{
  id v25 = a3;
  id v4 = [a1 _effectViewClassNames];
  if ([v4 count])
  {
    v5 = +[NSMutableArray array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v23 = v4;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = [v25 nodesKindOfRuntimeClass:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v27;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
                if ([v15 hasPropertyWithName:@"snapshotImageRenderedUsingDrawHierarchyInRect"])
                {
                  id v16 = [v15 identifier];
                  [v5 addObject:v16];
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
            }
            while (v12);
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    if ([v5 count])
    {
      id v17 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
      id v18 = [v5 copy];
      [v17 setObjectIdentifiers:v18 exlusive:0];

      [v17 setPropertyNames:&off_2FCC8 exlusive:0];
      id v19 = objc_alloc_init((Class)DebugHierarchyRunLoopAction);
      v34[0] = v17;
      v34[1] = v19;
      long long v20 = +[NSArray arrayWithObjects:v34 count:2];
      long long v21 = +[DebugHierarchyRequest requestWithName:@"Fetch rendered effect view snapshots" discoveryType:2 actions:v20 completion:0];
    }
    else
    {
      long long v21 = 0;
    }
    id v4 = v23;
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

+ (id)_requestForRenderedMultiLayerViewsWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  v5 = +[NSPredicate predicateWithBlock:&__block_literal_global_0];
  id v6 = [v3 nodesMatchingPredicate:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPropertyWithName:", @"snapshotImageRenderedUsingDrawHierarchyInRect", (void)v20))
        {
          uint64_t v13 = [v12 identifier];
          [v4 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  if ([v4 count])
  {
    id v14 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
    id v15 = [v4 copy];
    [v14 setObjectIdentifiers:v15 exlusive:0];

    [v14 setPropertyNames:&off_2FCE0 exlusive:0];
    id v16 = objc_alloc_init((Class)DebugHierarchyRunLoopAction);
    v24[0] = v14;
    v24[1] = v16;
    id v17 = +[NSArray arrayWithObjects:v24 count:2];
    id v18 = +[DebugHierarchyRequest requestWithName:@"Fetch rendered multi-layer view snapshots" discoveryType:2 actions:v17 completion:0];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

BOOL __65__RequestFactory__requestForRenderedMultiLayerViewsWithSnapshot___block_invoke(id a1, DBGSnapshotNode *a2, NSDictionary *a3)
{
  id v3 = [(DBGSnapshotNode *)a2 propertyWithName:@"dbgRenderingModeIsMultiLayer"];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)_requestForRenderedViewsWithSnapshot:(id)a3
{
  id v4 = a3;
  v45 = [a1 _effectViewClassNames];
  +[NSMutableArray array];
  v43 = v42 = v4;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  unsigned __int8 v5 = [v4 identifierToNodeMap];
  id v6 = [v5 objectEnumerator];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v7) {
    goto LABEL_43;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v51;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v51 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v10);
      id v12 = [v11 runtimeType];
      if ([v12 isKindOfTypeWithName:@"UIView"])
      {
      }
      else
      {
        uint64_t v13 = [v11 runtimeType];
        unsigned int v14 = [v13 isKindOfTypeWithName:@"NSView"];

        if (!v14) {
          goto LABEL_36;
        }
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v15 = v45;
      id v16 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v47;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            long long v21 = [v11 runtimeType];
            LOBYTE(v20) = [v21 isKindOfTypeWithName:v20];

            if (v20)
            {
              BOOL v22 = 0;
              goto LABEL_25;
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v15 = [v11 runtimeType];
      if ([v15 isKindOfTypeWithName:@"SCNView"]) {
        goto LABEL_18;
      }
      long long v23 = [v11 runtimeType];
      if ([v23 isKindOfTypeWithName:@"SKView"]) {
        goto LABEL_23;
      }
      id v24 = [v11 runtimeType];
      if ([v24 isKindOfTypeWithName:@"GLKView"])
      {

LABEL_23:
        BOOL v22 = 1;
LABEL_24:

        goto LABEL_25;
      }
      long long v33 = [v11 runtimeType];
      unsigned __int8 v34 = [v33 isKindOfTypeWithName:@"ARView"];

      if ((v34 & 1) == 0)
      {
        v35 = [v11 groupWithID:@"com.apple.QuartzCore.CALayer"];
        id v15 = v35;
        if (v35)
        {
          long long v23 = [v35 allObjects];
          BOOL v22 = [v23 count] == 0;
          goto LABEL_24;
        }
LABEL_18:
        BOOL v22 = 1;
LABEL_25:

        goto LABEL_26;
      }
      BOOL v22 = 1;
LABEL_26:
      id v25 = [v11 propertyWithName:@"dbgRenderingModeIsMultiLayer"];
      long long v26 = v25;
      if (v25)
      {
        if (v22 & ~[v25 BOOLValue]) {
          goto LABEL_33;
        }
      }
      else if (v22)
      {
        goto LABEL_33;
      }
      long long v27 = [v11 runtimeType];
      unsigned int v28 = [v27 isKindOfTypeWithName:@"UIImageView"];

      if (v28)
      {
        long long v29 = [v11 propertyWithName:@"dbg_holdsSymbolImage"];
        if (v29)
        {
          long long v30 = v29;
          unsigned int v31 = [v29 BOOLValue];

          if (v31)
          {
LABEL_33:
            if ([v11 hasPropertyWithName:@"snapshotImage"])
            {
              long long v32 = [v11 identifier];
              [v43 addObject:v32];
            }
          }
        }
      }

LABEL_36:
      uint64_t v10 = (char *)v10 + 1;
    }
    while (v10 != v8);
    id v36 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    id v8 = v36;
  }
  while (v36);
LABEL_43:

  if ([v43 count])
  {
    id v37 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
    id v38 = [v43 copy];
    [v37 setObjectIdentifiers:v38 exlusive:0];

    [v37 setPropertyNames:&off_2FCF8 exlusive:0];
    id v54 = v37;
    v39 = +[NSArray arrayWithObjects:&v54 count:1];
    v40 = +[DebugHierarchyRequest requestWithName:@"Fetch rendered view snapshots" discoveryType:2 actions:v39 completion:0];
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (id)_requestForRenderedSpriteKitTexturesWithSnapshot:(id)a3
{
  id v3 = [a3 nodesKindOfRuntimeClass:@"SKNode"];
  if ([v3 count])
  {
    id v4 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPropertyWithName:", @"visualRepresentation", (void)v17))
          {
            id v11 = [v10 identifier];
            [v4 addObject:v11];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      id v12 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
      id v13 = [v4 copy];
      [v12 setObjectIdentifiers:v13 exlusive:0];

      [v12 setPropertyNames:&off_2FD10 exlusive:0];
      id v21 = v12;
      unsigned int v14 = +[NSArray arrayWithObjects:&v21 count:1];
      id v15 = +[DebugHierarchyRequest requestWithName:@"Fetch visual representations of sprites" discoveryType:2 actions:v14 completion:0];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)_requestForEncodedSceneKitScenesWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = [v3 nodesKindOfRuntimeClass:@"SCNScene"];
  if ([v4 count])
  {
    id v5 = +[NSMutableArray array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v11 hasPropertyWithName:@"encodedPresentationScene"])
          {
            id v12 = [v11 identifier];
            [v5 addObject:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      id v13 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
      id v14 = [v5 copy];
      [v13 setObjectIdentifiers:v14 exlusive:0];

      [v13 setPropertyNames:&off_2FD28 exlusive:0];
      id v15 = [&__NSArray0__struct arrayByAddingObject:v13];
    }
    else
    {
      id v15 = &__NSArray0__struct;
    }
  }
  else
  {
    id v15 = &__NSArray0__struct;
  }
  id v16 = [v3 nodesKindOfRuntimeClass:@"SCNView"];
  if ([v16 count])
  {
    long long v30 = v4;
    long long v17 = +[NSMutableArray array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          if ([v23 hasPropertyWithName:@"pointOfViewIndexPath"])
          {
            id v24 = [v23 identifier];
            [v17 addObject:v24];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v20);
    }

    if ([v17 count])
    {
      id v25 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
      id v26 = [v17 copy];
      [v25 setObjectIdentifiers:v26 exlusive:0];

      [v25 setPropertyNames:&off_2FD40 exlusive:0];
      uint64_t v27 = [v15 arrayByAddingObject:v25];

      id v15 = (void *)v27;
    }
    id v4 = v30;
  }
  if ([v15 count])
  {
    unsigned int v28 = +[DebugHierarchyRequest requestWithName:@"Fetch encoded SCNScenes" discoveryType:2 actions:v15 completion:0];
  }
  else
  {
    unsigned int v28 = 0;
  }

  return v28;
}

+ (id)_crossPlatformPropertyActions
{
  id v2 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v2 setPropertyNames:&off_2FD58 exlusive:0];
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setTypes:&off_2FD70 exlusive:0];
  [v3 setPropertyNames:&off_2FD88 exlusive:0];
  id v4 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v4 setTypes:&off_2FDA0 exlusive:0];
  [v4 setPropertyNames:&off_2FDB8 exlusive:0];
  id v5 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v5 setTypes:&off_2FDD0 exlusive:0];
  [v5 setPropertyNames:&off_2FDE8 exlusive:0];
  id v6 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v6 setTypes:&off_2FE00 exlusive:0];
  [v6 setPropertyNames:&off_2FE18 exlusive:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  id v7 = +[NSArray arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)_propertyActionsForPlatform:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Mac"])
  {
    uint64_t v5 = [a1 _propertyActionsForMac];
LABEL_11:
    id v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"MacCatalyst"])
  {
    uint64_t v5 = [a1 _propertyActionsForMacCatalyst];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"iOS"])
  {
    uint64_t v5 = [a1 _propertyActionsForiOS];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"watchOS"])
  {
    uint64_t v5 = [a1 _propertyActionsForWatchOS];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"tvOS"])
  {
    uint64_t v5 = [a1 _propertyActionsForTvOS];
    goto LABEL_11;
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

+ (id)_propertyActionsForMac
{
  id v2 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v2 setTypes:&off_2FE30 exlusive:0];
  [v2 setPropertyNames:&off_2FE48 exlusive:0];
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setTypes:&off_2FE60 exlusive:0];
  [v3 setPropertyNames:&off_2FE78 exlusive:0];
  id v4 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v4 setTypes:&off_2FE90 exlusive:0];
  [v4 setPropertyNames:&off_2FEA8 exlusive:0];
  id v5 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v5 setTypes:&off_2FEC0 exlusive:0];
  [v5 setPropertyNames:&off_2FED8 exlusive:0];
  id v6 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v6 setTypes:&off_2FEF0 exlusive:0];
  [v6 setPropertyNames:&off_2FF08 exlusive:0];
  id v7 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v7 setTypes:&off_2FF20 exlusive:0];
  [v7 setPropertyNames:&off_2FF38 exlusive:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)_propertyActionsForMacCatalyst
{
  id v2 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v2 setTypes:&off_2FF50 exlusive:0];
  [v2 setPropertyNames:&off_2FF68 exlusive:0];
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setTypes:&off_2FF80 exlusive:0];
  [v3 setPropertyNames:&off_2FF98 exlusive:0];
  id v4 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v4 setTypes:&off_2FFB0 exlusive:0];
  [v4 setPropertyNames:&off_2FFC8 exlusive:0];
  id v5 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v5 setTypes:&off_2FFE0 exlusive:0];
  [v5 setPropertyNames:&off_2FFF8 exlusive:0];
  id v6 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v6 setTypes:&off_30010 exlusive:0];
  [v6 setPropertyNames:&off_30028 exlusive:0];
  id v7 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v7 setTypes:&off_30040 exlusive:0];
  [v7 setPropertyNames:&off_30058 exlusive:0];
  id v8 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v8 setTypes:&off_30070 exlusive:0];
  [v8 setPropertyNames:&off_30088 exlusive:0];
  id v9 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v9 setTypes:&off_300A0 exlusive:0];
  [v9 setPropertyNames:&off_300B8 exlusive:0];
  id v10 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v10 setTypes:&off_300D0 exlusive:0];
  [v10 setPropertyNames:&off_300E8 exlusive:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)_propertyActionsForiOS
{
  id v2 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v2 setTypes:&off_30100 exlusive:0];
  [v2 setPropertyNames:&off_30118 exlusive:0];
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setTypes:&off_30130 exlusive:0];
  [v3 setPropertyNames:&off_30148 exlusive:0];
  id v4 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v4 setTypes:&off_30160 exlusive:0];
  [v4 setPropertyNames:&off_30178 exlusive:0];
  id v5 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v5 setTypes:&off_30190 exlusive:0];
  [v5 setPropertyNames:&off_301A8 exlusive:0];
  id v6 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v6 setTypes:&off_301C0 exlusive:0];
  [v6 setPropertyNames:&off_301D8 exlusive:0];
  id v7 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v7 setTypes:&off_301F0 exlusive:0];
  [v7 setPropertyNames:&off_30208 exlusive:0];
  id v8 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v8 setTypes:&off_30220 exlusive:0];
  [v8 setPropertyNames:&off_30238 exlusive:0];
  id v9 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v9 setTypes:&off_30250 exlusive:0];
  [v9 setPropertyNames:&off_30268 exlusive:0];
  id v10 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v10 setTypes:&off_30280 exlusive:0];
  [v10 setPropertyNames:&off_30298 exlusive:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)_propertyActionsForWatchOS
{
  id v2 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v2 setTypes:&off_302B0 exlusive:0];
  [v2 setPropertyNames:&off_302C8 exlusive:0];
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setTypes:&off_302E0 exlusive:0];
  [v3 setPropertyNames:&off_302F8 exlusive:0];
  id v4 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v4 setTypes:&off_30310 exlusive:0];
  [v4 setPropertyNames:&off_30328 exlusive:0];
  id v5 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v5 setTypes:&off_30340 exlusive:0];
  [v5 setPropertyNames:&off_30358 exlusive:0];
  id v6 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v6 setTypes:&off_30370 exlusive:0];
  [v6 setPropertyNames:&off_30388 exlusive:0];
  id v7 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v7 setTypes:&off_303A0 exlusive:0];
  [v7 setPropertyNames:&off_303B8 exlusive:0];
  id v8 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v8 setTypes:&off_303D0 exlusive:0];
  [v8 setPropertyNames:&off_303E8 exlusive:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = +[NSArray arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)_propertyActionsForTvOS
{
  id v2 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v2 setTypes:&off_30400 exlusive:0];
  [v2 setPropertyNames:&off_30418 exlusive:0];
  id v3 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v3 setTypes:&off_30430 exlusive:0];
  [v3 setPropertyNames:&off_30448 exlusive:0];
  id v4 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v4 setTypes:&off_30460 exlusive:0];
  [v4 setPropertyNames:&off_30478 exlusive:0];
  id v5 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v5 setTypes:&off_30490 exlusive:0];
  [v5 setPropertyNames:&off_304A8 exlusive:0];
  id v6 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v6 setTypes:&off_304C0 exlusive:0];
  [v6 setPropertyNames:&off_304D8 exlusive:0];
  id v7 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v7 setTypes:&off_304F0 exlusive:0];
  [v7 setPropertyNames:&off_30508 exlusive:0];
  id v8 = objc_alloc_init((Class)DebugHierarchyPropertyAction);
  [v8 setTypes:&off_30520 exlusive:0];
  [v8 setPropertyNames:&off_30538 exlusive:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = +[NSArray arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)_effectViewClassNames
{
  return &off_30550;
}

@end