@interface UIView(ClockKitUI)
- (uint64_t)setTritiumBrightness:()ClockKitUI;
- (uint64_t)setTritiumSaturation:()ClockKitUI;
- (uint64_t)setTritiumTapThroughFilter:()ClockKitUI;
- (void)_updateFilter:()ClockKitUI amount:;
- (void)setMaxAPL:()ClockKitUI;
@end

@implementation UIView(ClockKitUI)

- (void)_updateFilter:()ClockKitUI amount:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v6 = filterNamesToIndicesMap();
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v7 = [a1 layer];
  v8 = [v7 filters];

  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count") + 3);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v16 = [v15 name];
        v17 = [v6 objectForKeyedSubscript:v16];

        if (v17) {
          objc_storeStrong(&v50 + [v17 unsignedIntegerValue], v15);
        }
        else {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v12);
  }

  if (!a4)
  {
    if (fabs(a2 + -1.0) >= 0.00000011920929)
    {
      float v20 = a2;
      v21 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
      [v21 setName:@"CLKUITritiumViewFilterTypeBrightnessName"];
      float v32 = v20;
      uint64_t v34 = 0;
      uint64_t v33 = 0;
      int v35 = 0;
      float v36 = v20;
      uint64_t v38 = 0;
      uint64_t v37 = 0;
      int v39 = 0;
      float v40 = v20;
      uint64_t v42 = 0;
      uint64_t v41 = 0;
      int v43 = 0;
      uint64_t v44 = 1065353216;
      v22 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v32];
      [v21 setValue:v22 forKey:@"inputColorMatrix"];

      v19 = v50;
      v50 = v21;
    }
    else
    {
      v19 = v50;
      v50 = 0;
    }
    goto LABEL_22;
  }
  if (a4 == 1)
  {
    if (fabs(a2 + -1.0) >= 0.00000011920929)
    {
      v23 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
      [v23 setName:@"CLKUITritiumViewFilterTypeSaturationName"];
      v24 = [NSNumber numberWithDouble:a2];
      [v23 setValue:v24 forKey:@"inputAmount"];

      v19 = v51;
      v51 = v23;
    }
    else
    {
      v19 = v51;
      v51 = 0;
    }
LABEL_22:
    v18 = a1;
LABEL_23:

    goto LABEL_24;
  }
  v18 = a1;
  if (a4 == 2)
  {
    if (fabs(a2 + -1.0) >= 0.00000011920929)
    {
      float v28 = a2;
      v29 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
      [v29 setName:@"CLKUIViewFilterTypeNameTritiumTapThrough"];
      float v32 = v28;
      uint64_t v34 = 0;
      uint64_t v33 = 0;
      int v35 = 0;
      float v36 = v28;
      uint64_t v38 = 0;
      uint64_t v37 = 0;
      int v39 = 0;
      float v40 = v28;
      uint64_t v42 = 0;
      uint64_t v41 = 0;
      int v43 = 0;
      uint64_t v44 = 1065353216;
      v30 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v32];
      [v29 setValue:v30 forKey:@"inputColorMatrix"];

      v19 = v52;
      v52 = v29;
    }
    else
    {
      v19 = v52;
      v52 = 0;
    }
    goto LABEL_23;
  }
LABEL_24:
  for (uint64_t j = 0; j != 24; j += 8)
  {
    if (*(void **)((char *)&v50 + j)) {
      objc_msgSend(v9, "addObject:");
    }
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v26 = [v18 layer];
  [v26 setFilters:v9];

  [MEMORY[0x1E4F39CF8] commit];
  for (uint64_t k = 16; k != -8; k -= 8)
}

- (uint64_t)setTritiumBrightness:()ClockKitUI
{
  return objc_msgSend(a1, "_updateFilter:amount:", 0);
}

- (uint64_t)setTritiumSaturation:()ClockKitUI
{
  return objc_msgSend(a1, "_updateFilter:amount:", 1);
}

- (uint64_t)setTritiumTapThroughFilter:()ClockKitUI
{
  return objc_msgSend(a1, "_updateFilter:amount:", 2);
}

- (void)setMaxAPL:()ClockKitUI
{
  id v6 = [a1 layer];
  v2 = [v6 superlayer];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39BF0]);
  [v6 frame];
  objc_msgSend(v3, "setFrame:");
  v4 = [a1 layer];
  [v4 removeFromSuperlayer];

  [v2 addSublayer:v3];
  v5 = [MEMORY[0x1E4F39B58] remoteContext];
  [v5 setLayer:v6];
  objc_msgSend(v3, "setContextId:", objc_msgSend(v5, "contextId"));
  [v3 setRendersAsynchronously:1];
}

@end