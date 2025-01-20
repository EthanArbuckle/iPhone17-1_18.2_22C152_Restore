@interface NTKExtragalacticColors
+ (id)identityColorForCorner:(unint64_t)a3;
+ (id)identityColorForGlyphColor:(unint64_t)a3;
+ (id)lutFilterFromPalette:(id)a3;
@end

@implementation NTKExtragalacticColors

+ (id)identityColorForGlyphColor:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      a1 = [MEMORY[0x263F1C550] blueColor];
      break;
    case 1uLL:
      a1 = [MEMORY[0x263F1C550] greenColor];
      break;
    case 0uLL:
      a1 = [MEMORY[0x263F1C550] redColor];
      break;
  }

  return a1;
}

+ (id)identityColorForCorner:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x263F1C550], "yellowColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      objc_msgSend(MEMORY[0x263F1C550], "magentaColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      objc_msgSend(MEMORY[0x263F1C550], "cyanColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(MEMORY[0x263F1C550], "blackColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

+ (id)lutFilterFromPalette:(id)a3
{
  v35[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  uint64_t v5 = [v3 glyphColor0];
  uint64_t v6 = [v3 glyphColor1];
  uint64_t v7 = [v3 glyphColor2];
  uint64_t v8 = [v3 blackOverlapAndBackground];
  v9 = [v3 backgroundTopLeft];
  v10 = [v3 backgroundTopRight];
  v11 = [v3 backgroundBottomLeft];
  v24 = (void *)v8;
  v25 = (void *)v7;
  v35[0] = v8;
  v35[1] = v5;
  v26 = (void *)v6;
  v27 = (void *)v5;
  v35[2] = v6;
  v35[3] = v9;
  v35[4] = v7;
  v35[5] = v10;
  v35[6] = v11;
  v35[7] = v4;
  v28 = (void *)v4;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:8];
  v13 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = NTKRGBAArrayWithColor();
        [v13 addObjectsFromArray:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v16);
  }

  v20 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D00]];
  v21 = (void *)[v13 copy];
  [v20 setValue:v21 forKey:*MEMORY[0x263F15CB0]];

  v33 = v20;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];

  return v22;
}

@end