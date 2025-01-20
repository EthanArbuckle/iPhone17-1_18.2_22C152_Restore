@interface UIView(AmbientUI)
- (uint64_t)amui_applyRedModeFilterAnimated:()AmbientUI withCompletion:;
- (uint64_t)amui_clearRedModeFilterAnimated:()AmbientUI withCompletion:;
- (void)amui_applyRedModeFilterAnimated:()AmbientUI withCoordinatedAnimationBlock:completion:;
- (void)amui_clearRedModeFilterAnimated:()AmbientUI withCoordinatedAnimationBlock:completion:;
@end

@implementation UIView(AmbientUI)

- (uint64_t)amui_applyRedModeFilterAnimated:()AmbientUI withCompletion:
{
  return objc_msgSend(a1, "amui_applyRedModeFilterAnimated:withCoordinatedAnimationBlock:completion:", a3, 0, a4);
}

- (void)amui_applyRedModeFilterAnimated:()AmbientUI withCoordinatedAnimationBlock:completion:
{
  id v28 = a4;
  id v7 = a5;
  v26 = a1;
  v8 = [a1 layer];
  v9 = [v8 valueForKeyPath:@"filters.colorMatrix"];
  v10 = (void *)MEMORY[0x263F15C30];
  if (v9
    && ([MEMORY[0x263EFF9D0] null],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:v9],
        v11,
        !v12))
  {
    v15 = v10;
    v13 = 0;
  }
  else
  {
    v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
    [v13 setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F15C70]];
    memset(v33, 0, 60);
    *(_OWORD *)&v33[60] = xmmword_247892A70;
    int v34 = 0;
    v14 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:v33];
    v15 = v10;
    [v13 setValue:v14 forKey:*v10];
  }
  v16 = [v8 valueForKeyPath:@"filters.vibrantColorMatrix"];
  if (v16
    && ([MEMORY[0x263EFF9D0] null],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 isEqual:v16],
        v17,
        !v18))
  {
    v19 = 0;
  }
  else
  {
    v19 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DB8]];
    *(_OWORD *)v33 = 0uLL;
    *(_DWORD *)&v33[16] = 1065353216;
    memset(&v33[20], 0, 56);
    int v34 = 1065353216;
    v20 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:v33];
    [v19 setValue:v20 forKey:*v15];
  }
  v21 = (void (**)(void, void))v7;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  v23 = v22;
  if (v13) {
    [v22 addObject:v13];
  }
  if (v19) {
    [v23 addObject:v19];
  }
  if ([v23 count])
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __94__UIView_AmbientUI__amui_applyRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke;
    v29[3] = &unk_265228678;
    id v30 = v8;
    id v31 = v23;
    id v32 = v28;
    uint64_t v24 = MEMORY[0x24C561740](v29);
    v25 = (void *)v24;
    if (a3)
    {
      [MEMORY[0x263F1CB60] transitionWithView:v26 duration:5242882 options:v24 animations:v21 completion:1.2];
    }
    else
    {
      (*(void (**)(uint64_t))(v24 + 16))(v24);
      if (v21) {
        v21[2](v21, 1);
      }
    }
  }
}

- (uint64_t)amui_clearRedModeFilterAnimated:()AmbientUI withCompletion:
{
  return objc_msgSend(a1, "amui_clearRedModeFilterAnimated:withCoordinatedAnimationBlock:completion:", a3, 0, a4);
}

- (void)amui_clearRedModeFilterAnimated:()AmbientUI withCoordinatedAnimationBlock:completion:
{
  id v8 = a4;
  v9 = a5;
  v10 = [a1 layer];
  v11 = [v10 valueForKeyPath:@"filters.colorMatrix"];
  if (v11)
  {
    int v12 = [MEMORY[0x263EFF9D0] null];
    char v13 = [v12 isEqual:v11] ^ 1;
  }
  else
  {
    char v13 = 0;
  }
  v14 = [v10 valueForKeyPath:@"filters.vibrantColorMatrix"];
  if (v14)
  {
    v15 = [MEMORY[0x263EFF9D0] null];
    char v16 = [v15 isEqual:v14] ^ 1;
  }
  else
  {
    char v16 = 0;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __94__UIView_AmbientUI__amui_clearRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke;
  v23[3] = &unk_2652286A0;
  char v28 = v13;
  id v17 = v10;
  id v24 = v17;
  id v18 = v11;
  id v25 = v18;
  char v29 = v16;
  id v19 = v14;
  id v26 = v19;
  id v20 = v8;
  id v27 = v20;
  uint64_t v21 = MEMORY[0x24C561740](v23);
  id v22 = (void *)v21;
  if (a3)
  {
    [MEMORY[0x263F1CB60] transitionWithView:a1 duration:5242882 options:v21 animations:v9 completion:1.2];
  }
  else
  {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
    if (v9) {
      v9[2](v9, 1);
    }
  }
}

@end