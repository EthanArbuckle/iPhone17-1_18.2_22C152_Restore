@interface DBCameraWindow
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHidden:(BOOL)a3;
@end

@implementation DBCameraWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBCameraWindow;
  -[DBCameraWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (DBCameraWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DBCameraWindow *)self rootViewController];
  v6 = v5;
  if (v5)
  {
    if (v3)
    {
      v7 = [v5 view];
      v8 = (void *)MEMORY[0x263F82E00];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __28__DBCameraWindow_setHidden___block_invoke;
      v16[3] = &unk_2649B3E90;
      id v17 = v7;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __28__DBCameraWindow_setHidden___block_invoke_2;
      v12[3] = &unk_2649B5FC8;
      BOOL v15 = v3;
      v12[4] = self;
      id v13 = v6;
      id v14 = v17;
      id v9 = v17;
      [v8 animateWithDuration:0x20000 delay:v16 options:v12 animations:0.2 completion:0.3];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)DBCameraWindow;
      [(DBCameraWindow *)&v11 setHidden:0];
      [v6 sendSceneUpdateWithIsForeground:1];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DBCameraWindow;
    [(DBCameraWindow *)&v10 setHidden:v3];
  }
}

uint64_t __28__DBCameraWindow_setHidden___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __28__DBCameraWindow_setHidden___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)DBCameraWindow;
  objc_msgSendSuper2(&v4, sel_setHidden_, v2);
  [*(id *)(a1 + 40) sendSceneUpdateWithIsForeground:*(unsigned char *)(a1 + 56) == 0];
  return [*(id *)(a1 + 48) setAlpha:1.0];
}

@end