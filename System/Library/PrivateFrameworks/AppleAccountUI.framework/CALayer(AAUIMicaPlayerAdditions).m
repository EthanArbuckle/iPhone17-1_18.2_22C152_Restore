@interface CALayer(AAUIMicaPlayerAdditions)
- (id)mp_allAnimationsInTree;
- (id)mp_allLayersInTree;
- (id)mp_allLayersWhoseNamesContainString:()AAUIMicaPlayerAdditions;
- (id)mp_propertiesToCopy;
- (uint64_t)mp_basicPropertiesToCopy;
- (void)mp_addLayerAndSublayersToArray:()AAUIMicaPlayerAdditions allowHiddenLayers:;
- (void)mp_deepCopyLayer;
- (void)mp_moveAndResizeWithinParentLayer:()AAUIMicaPlayerAdditions usingGravity:geometryFlipped:retinaScale:animate:;
@end

@implementation CALayer(AAUIMicaPlayerAdditions)

- (void)mp_deepCopyLayer
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLayer:a1];
  if (v2)
  {
    v3 = [a1 sublayers];
    v4 = v3;
    if (v3)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        id v7 = 0;
        uint64_t v8 = *(void *)v42;
        do
        {
          uint64_t v9 = 0;
          v10 = v7;
          do
          {
            if (*(void *)v42 != v8) {
              objc_enumerationMutation(v4);
            }
            id v7 = *(id *)(*((void *)&v41 + 1) + 8 * v9);

            v11 = objc_msgSend(v7, "mp_deepCopyLayer");
            if (v11) {
              [v2 addSublayer:v11];
            }

            ++v9;
            v10 = v7;
          }
          while (v6 != v9);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v6);
      }
    }
    v12 = [a1 mask];
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "mp_deepCopyLayer");
      if (v14) {
        [v2 setMask:v14];
      }
    }
    v32 = v4;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v15 = objc_msgSend(a1, "mp_propertiesToCopy", v13);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (([v20 isEqualToString:@"sublayers"] & 1) == 0
            && ([v20 isEqualToString:@"mask"] & 1) == 0
            && [a1 shouldArchiveValueForKey:v20])
          {
            v21 = [a1 valueForKey:v20];
            [v2 setValue:v21 forKey:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v17);
    }

    if ([a1 needsDisplay]) {
      [v2 setNeedsDisplay];
    }
    if ([a1 needsLayout]) {
      [v2 setNeedsLayout];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = [a1 animationKeys];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          v28 = [a1 animationForKey:v27];
          if (([v28 isRemovedOnCompletion] & 1) == 0) {
            [v2 addAnimation:v28 forKey:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v24);
    }

    id v29 = v2;
  }

  return v2;
}

- (uint64_t)mp_basicPropertiesToCopy
{
  return objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", @"bounds", @"position", @"zPosition", @"anchorPoint", @"anchorPointZ", @"transform", @"hidden", @"doubleSided", @"geometryFlipped", @"sublayerTransform", @"masksToBounds", @"contents", @"contentsRect", @"contentsGravity", @"contentsScale", @"contentsCenter", @"minificationFilter",
           @"magnificationFilter",
           @"minificationFilterBias",
           @"opaque",
           @"needsDisplayOnBoundsChange",
           @"edgeAntialiasingMask",
           @"backgroundColor",
           @"cornerRadius",
           @"borderWidth",
           @"borderColor",
           @"opacity",
           @"compositingFilter",
           @"filters",
           @"backgroundFilters",
           @"shouldRasterize",
           @"rasterizationScale",
           @"shadowColor",
           @"shadowOpacity",
           @"shadowOffset",
           @"shadowRadius",
           @"shadowPath",
           @"shadowPathIsBounds",
           @"invertsShadow",
           @"actions",
           @"name",
           @"style",
           @"beginTime",
           @"duration",
           @"speed",
           @"timeOffset",
           @"repeatCount",
           @"repeatDuration",
           @"autoreverses",
           @"fillMode",
           0);
}

- (id)mp_propertiesToCopy
{
  if (!mp_propertiesToCopy_sCAShapeLayerClass) {
    mp_propertiesToCopy_sCAShapeLayerClass = (uint64_t)NSClassFromString(&cfstr_Cashapelayer.isa);
  }
  v2 = objc_msgSend(a1, "mp_basicPropertiesToCopy");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = &unk_26BD70C28;
LABEL_11:
    [v2 addObjectsFromArray:v3];
    goto LABEL_12;
  }
  if (objc_opt_isKindOfClass())
  {
    v3 = &unk_26BD70C40;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 addObject:@"scrollMode"];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = &unk_26BD70C58;
    goto LABEL_11;
  }
LABEL_12:
  return v2;
}

- (id)mp_allLayersInTree
{
  v2 = [MEMORY[0x263EFF980] array];
  objc_msgSend(a1, "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v2, 1);
  return v2;
}

- (void)mp_addLayerAndSublayersToArray:()AAUIMicaPlayerAdditions allowHiddenLayers:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((a4 & 1) != 0 || ([a1 isHidden] & 1) == 0)
  {
    [v6 addObject:a1];
    id v7 = [a1 mask];

    if (v7)
    {
      uint64_t v8 = [a1 mask];
      objc_msgSend(v8, "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v6, a4);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = objc_msgSend(a1, "sublayers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v6, a4);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)mp_allLayersWhoseNamesContainString:()AAUIMicaPlayerAdditions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "mp_allLayersInTree");
  id v6 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "name", (void)v18);
        if (v13)
        {
          long long v14 = (void *)v13;
          long long v15 = [v12 name];
          int v16 = [v15 containsString:v4];

          if (v16) {
            [v6 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)mp_allAnimationsInTree
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "mp_allLayersInTree");
  v2 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v8 = [v7 animationKeys];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [v7 animationForKey:*(void *)(*((void *)&v16 + 1) + 8 * j)];
              [v2 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  return v2;
}

- (void)mp_moveAndResizeWithinParentLayer:()AAUIMicaPlayerAdditions usingGravity:geometryFlipped:retinaScale:animate:
{
  id v12 = a5;
  [a4 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [a1 bounds];
  double v23 = v21 / a2;
  double v24 = v22 / a2;
  if (a2 == 1.0)
  {
    double v24 = v22;
    double v23 = v21;
  }
  if (v18 >= 0.00001) {
    double v25 = v18;
  }
  else {
    double v25 = 0.00001;
  }
  if (v20 >= 0.00001) {
    double v26 = v20;
  }
  else {
    double v26 = 0.00001;
  }
  if (v23 >= 0.00001) {
    double v27 = v23;
  }
  else {
    double v27 = 0.00001;
  }
  if (v24 >= 0.00001) {
    double v28 = v24;
  }
  else {
    double v28 = 0.00001;
  }
  id v29 = (void *)*MEMORY[0x263F15E38];
  if (a6)
  {
    if ([v12 isEqualToString:*MEMORY[0x263F15E38]])
    {
      v30 = (void **)MEMORY[0x263F15DF0];
LABEL_22:
      long long v33 = *v30;
LABEL_23:
      id v34 = v33;

      id v12 = v34;
      goto LABEL_24;
    }
    v31 = (void *)*MEMORY[0x263F15E30];
    if ([v12 isEqualToString:*MEMORY[0x263F15E30]])
    {
      v30 = (void **)MEMORY[0x263F15DE8];
      goto LABEL_22;
    }
    v32 = (void *)*MEMORY[0x263F15E40];
    if ([v12 isEqualToString:*MEMORY[0x263F15E40]])
    {
      v30 = (void **)MEMORY[0x263F15DF8];
      goto LABEL_22;
    }
    char v40 = [v12 isEqualToString:*MEMORY[0x263F15DF0]];
    long long v33 = v29;
    if (v40) {
      goto LABEL_23;
    }
    char v41 = [v12 isEqualToString:*MEMORY[0x263F15DE8]];
    long long v33 = v31;
    if (v41) {
      goto LABEL_23;
    }
    int v42 = [v12 isEqualToString:*MEMORY[0x263F15DF8]];
    long long v33 = v32;
    if (v42) {
      goto LABEL_23;
    }
  }
LABEL_24:
  if ([v12 isEqualToString:v29])
  {
LABEL_29:
    double v16 = v16 + v26 - v28;
LABEL_30:
    double v35 = 1.0;
LABEL_31:
    double v36 = 1.0;
    goto LABEL_32;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15E30]])
  {
    double v14 = v14 + v25 * 0.5 - v27 * 0.5;
    goto LABEL_29;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15E40]])
  {
    double v14 = v14 + v25 - v27;
    goto LABEL_29;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15E08]]) {
    goto LABEL_48;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15E00]])
  {
    double v39 = 0.5;
    double v14 = v14 + v25 * 0.5 - v27 * 0.5;
LABEL_49:
    double v16 = v16 + v26 * v39 - v28 * v39;
    goto LABEL_30;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15E28]])
  {
    double v14 = v14 + v25 - v27;
LABEL_48:
    double v39 = 0.5;
    goto LABEL_49;
  }
  double v35 = 1.0;
  if ([v12 isEqualToString:*MEMORY[0x263F15DF0]]) {
    goto LABEL_31;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15DE8]])
  {
    double v14 = v14 + v25 * 0.5 - v27 * 0.5;
    goto LABEL_31;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15DF8]])
  {
    double v14 = v14 + v25 - v27;
    goto LABEL_31;
  }
  if ([v12 isEqualToString:*MEMORY[0x263F15E10]])
  {
    double v36 = v25 / v27;
    double v35 = v26 / v28;
  }
  else
  {
    if ([v12 isEqualToString:*MEMORY[0x263F15E18]])
    {
      if (v25 / v27 >= v26 / v28) {
        double v35 = v26 / v28;
      }
      else {
        double v35 = v25 / v27;
      }
    }
    else
    {
      if (![v12 isEqualToString:*MEMORY[0x263F15E20]])
      {
        double v14 = *MEMORY[0x263F00148];
        double v16 = *(double *)(MEMORY[0x263F00148] + 8);
        NSLog(&cfstr_UnknownGravity.isa, v12);
        goto LABEL_31;
      }
      if (v25 / v27 >= v26 / v28) {
        double v35 = v25 / v27;
      }
      else {
        double v35 = v26 / v28;
      }
    }
    double v14 = v14 + (v25 - v27 * v35) * 0.5;
    double v16 = v16 + (v26 - v28 * v35) * 0.5;
    double v36 = v35;
  }
LABEL_32:
  if (a2 != 1.0)
  {
    double v36 = v36 / a2;
    double v35 = v35 / a2;
  }
  if ((a7 & 1) == 0)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
  }
  CATransform3DMakeScale(&v44, v36, v35, 1.0);
  CATransform3D v43 = v44;
  [a1 setTransform:&v43];
  [a1 frame];
  double v38 = v37;
  [a1 frame];
  objc_msgSend(a1, "setFrame:", v14, v16, v38);
  if ((a7 & 1) == 0) {
    [MEMORY[0x263F158F8] commit];
  }
}

@end