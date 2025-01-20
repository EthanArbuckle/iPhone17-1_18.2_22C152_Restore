@interface UIView(BRGeometry)
+ (id)br_behaviourMap;
+ (void)br_gatherBehaviour;
+ (void)br_setGatherBehaviour:()BRGeometry;
+ (void)br_setGatherBehaviour:()BRGeometry forClassesNamed:;
- (uint64_t)br_contentDescription;
- (uint64_t)br_viewIsClipped;
- (void)br_ignoreClipping;
- (void)br_setLayerNames;
@end

@implementation UIView(BRGeometry)

+ (id)br_behaviourMap
{
  if (br_behaviourMap_onceToken != -1) {
    dispatch_once(&br_behaviourMap_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)br_behaviourMap_behaviourMap;

  return v0;
}

+ (void)br_gatherBehaviour
{
  objc_msgSend(a1, "br_behaviourMap");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = NSStringFromClass((Class)a1);
  v4 = [v2 objectForKey:v3];

  if (v4) {
    v3 = (void *)[v4 unsignedIntegerValue];
  }

  objc_sync_exit(v2);
  if (!v4)
  {
    if (objc_opt_class() == a1) {
      v3 = 0;
    }
    else {
      v3 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "br_gatherBehaviour");
    }
  }

  return v3;
}

+ (void)br_setGatherBehaviour:()BRGeometry
{
  objc_msgSend(a1, "br_behaviourMap");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = NSStringFromClass((Class)a1);
  [obj setObject:v5 forKey:v6];

  objc_sync_exit(obj);
}

+ (void)br_setGatherBehaviour:()BRGeometry forClassesNamed:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_msgSend(a1, "br_behaviourMap");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, (void)v14);
        [v7 setObject:v13 forKey:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)br_setLayerNames
{
  id v2 = [a1 layer];
  v5.receiver = a1;
  v5.super_class = (Class)UIView_0;
  v3 = objc_msgSendSuper2(&v5, sel_description);
  [v2 setName:v3];

  v4 = [a1 subviews];
  [v4 makeObjectsPerformSelector:sel_br_setLayerNames];
}

- (uint64_t)br_contentDescription
{
  return 0;
}

- (void)br_ignoreClipping
{
}

- (uint64_t)br_viewIsClipped
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = objc_getAssociatedObject(a1, &BRIgnoreClippingKey);
  v3 = v2;
  if (v2 && ([v2 BOOLValue] & 1) != 0)
  {
LABEL_33:
    uint64_t v23 = 0;
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v4 = [a1 constraintsAffectingLayoutForAxis:1];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
          uint64_t v10 = [v9 firstItem];
          if (v10 == a1 && [v9 firstAttribute] == 8 && !objc_msgSend(v9, "secondAttribute"))
          {
            [v9 constant];
            double v12 = v11;

            if (v12 == 0.0)
            {
LABEL_32:

              goto LABEL_33;
            }
          }
          else
          {
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v13 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
        uint64_t v6 = v13;
      }
      while (v13);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v4 = objc_msgSend(a1, "constraintsAffectingLayoutForAxis:", 0, 0);
    uint64_t v14 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v4);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
          uint64_t v19 = [v18 firstItem];
          if (v19 == a1 && [v18 firstAttribute] == 7 && !objc_msgSend(v18, "secondAttribute"))
          {
            [v18 constant];
            double v21 = v20;

            if (v21 == 0.0) {
              goto LABEL_32;
            }
          }
          else
          {
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v22 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
        uint64_t v15 = v22;
      }
      while (v22);
    }

    uint64_t v23 = [a1 _UIViewDebuggingIsViewClipping];
  }

  return v23;
}

@end