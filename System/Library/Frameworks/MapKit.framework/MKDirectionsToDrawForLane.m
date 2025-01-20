@interface MKDirectionsToDrawForLane
@end

@implementation MKDirectionsToDrawForLane

uint64_t ___MKDirectionsToDrawForLane_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  int v8 = [v6 direction];
  uint64_t v9 = [v7 direction];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___MKDirectionsToDrawForLane_block_invoke_2;
  v18[3] = &unk_1E54BABE0;
  id v10 = v6;
  id v19 = v10;
  id v20 = *(id *)(a1 + 32);
  id v11 = v7;
  id v21 = v11;
  v12 = (uint64_t (**)(void, void, void, void))MEMORY[0x18C139AE0](v18);
  if (v8 > 15)
  {
    if (v8 <= 63)
    {
      if (v8 == 16)
      {
        v13 = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
        v14 = (void *)MEMORY[0x1E4F1CAD0];
        v15 = &unk_1ED97F218;
      }
      else
      {
        if (v8 != 32) {
          goto LABEL_19;
        }
        v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F230];
        v14 = (void *)MEMORY[0x1E4F1CAD0];
        v15 = &unk_1ED97F248;
      }
    }
    else
    {
      switch(v8)
      {
        case 64:
          v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F260];
          v14 = (void *)MEMORY[0x1E4F1CAD0];
          v15 = &unk_1ED97F278;
          break;
        case 128:
          v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F290];
          v14 = (void *)MEMORY[0x1E4F1CAD0];
          v15 = &unk_1ED97F2A8;
          break;
        case 256:
          v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F380];
          v14 = (void *)MEMORY[0x1E4F1CAD0];
          v15 = (void *)MEMORY[0x1E4F1CBF0];
          break;
        default:
          goto LABEL_19;
      }
    }
LABEL_18:
    v16 = [v14 setWithArray:v15];
    uint64_t v3 = ((uint64_t (**)(void, uint64_t, void *, void *))v12)[2](v12, v9, v13, v16);

    goto LABEL_19;
  }
  switch(v8)
  {
    case 0:
    case 1:
      v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F2C0];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v15 = &unk_1ED97F2D8;
      goto LABEL_18;
    case 2:
      v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F2F0];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v15 = &unk_1ED97F308;
      goto LABEL_18;
    case 4:
      v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F320];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v15 = &unk_1ED97F338;
      goto LABEL_18;
    case 8:
      v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED97F350];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v15 = &unk_1ED97F368;
      goto LABEL_18;
    default:
      break;
  }
LABEL_19:

  return v3;
}

uint64_t ___MKDirectionsToDrawForLane_block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  int v8 = NSNumber;
  id v9 = a4;
  id v10 = [v8 numberWithInt:a2];
  char v11 = [v9 containsObject:v10];

  if (v11)
  {
    uint64_t v12 = -1;
  }
  else
  {
    v13 = [NSNumber numberWithInt:a2];
    char v14 = [v7 containsObject:v13];

    if ((v14 & 1) != 0 || (uint64_t v15 = a1[5], a1[4] == v15))
    {
      uint64_t v12 = 1;
    }
    else if (a1[6] == v15)
    {
      uint64_t v12 = -1;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

@end