@interface LAUIPhysicalButtonViewBounceAnimation
- (double)_currentLength;
- (double)duration;
- (void)_animateWithLength:(double)a3 delay:(double)a4;
- (void)beginWithDelay:(double)a3;
- (void)update;
@end

@implementation LAUIPhysicalButtonViewBounceAnimation

- (double)duration
{
  return 1.35;
}

- (void)beginWithDelay:(double)a3
{
  if (![(LAUIPhysicalButtonViewAnimation *)self isRunning])
  {
    [(LAUIPhysicalButtonViewBounceAnimation *)self _currentLength];
    -[LAUIPhysicalButtonViewBounceAnimation _animateWithLength:delay:](self, "_animateWithLength:delay:");
  }
}

- (void)update
{
  if ([(LAUIPhysicalButtonViewAnimation *)self isRunning])
  {
    [(LAUIPhysicalButtonViewBounceAnimation *)self _currentLength];
    if (self->_lastLength != v3)
    {
      -[LAUIPhysicalButtonViewBounceAnimation _animateWithLength:delay:](self, "_animateWithLength:delay:");
    }
  }
}

- (double)_currentLength
{
  p_physicalButtonView = &self->super._physicalButtonView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._physicalButtonView);
  if (![WeakRetained edge])
  {

    goto LABEL_5;
  }
  id v4 = objc_loadWeakRetained((id *)p_physicalButtonView);
  int v5 = [v4 edge];

  if (v5 == 2)
  {
LABEL_5:
    id v6 = objc_loadWeakRetained((id *)p_physicalButtonView);
    [v6 bounds];
    double v8 = v9;
    goto LABEL_6;
  }
  id v6 = objc_loadWeakRetained((id *)p_physicalButtonView);
  [v6 bounds];
  double v8 = v7;
LABEL_6:

  return v8;
}

- (void)_animateWithLength:(double)a3 delay:(double)a4
{
  v25[7] = *MEMORY[0x263EF8340];
  [(LAUIPhysicalButtonViewAnimation *)self end];
  self->_lastLength = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._physicalButtonView);
  int v8 = [WeakRetained edge];

  int v9 = 0;
  switch(v8)
  {
    case 0:
      goto LABEL_3;
    case 1:
      goto LABEL_6;
    case 2:
      int v9 = 1;
LABEL_3:
      v10 = @"position.x";
      break;
    case 3:
      int v9 = 1;
LABEL_6:
      v10 = @"position.y";
      break;
    default:
      v10 = 0;
      break;
  }
  v11 = [MEMORY[0x263F157D8] animationWithKeyPath:v10];
  [v11 setAdditive:1];
  [v11 setBeginTimeMode:*MEMORY[0x263F15980]];
  [v11 setBeginTime:a4];
  [(LAUIPhysicalButtonViewBounceAnimation *)self duration];
  objc_msgSend(v11, "setDuration:");
  [v11 setCalculationMode:*MEMORY[0x263F15970]];
  v25[0] = &unk_26C5341F0;
  if (v9) {
    double v12 = -1.7;
  }
  else {
    double v12 = 1.7;
  }
  v13 = [NSNumber numberWithDouble:v12 * self->_lastLength];
  v25[1] = v13;
  v25[2] = &unk_26C5341F0;
  v25[3] = &unk_26C5341F0;
  v14 = [NSNumber numberWithDouble:v12 * self->_lastLength];
  v25[4] = v14;
  v25[5] = &unk_26C5341F0;
  v25[6] = &unk_26C5341F0;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:7];
  [v11 setValues:v15];

  [v11 setKeyTimes:&unk_26C534650];
  LODWORD(v16) = 1051372203;
  LODWORD(v17) = 1059760811;
  LODWORD(v18) = 1.0;
  v19 = [MEMORY[0x263F15808] functionWithControlPoints:v16 :0.0 :v17 :v18];
  v20 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  v24[0] = v19;
  v24[1] = v20;
  v24[2] = v19;
  v24[3] = v19;
  v24[4] = v20;
  v24[5] = v19;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:6];
  [v11 setTimingFunctions:v21];

  LODWORD(v22) = 2139095040;
  [v11 setRepeatCount:v22];
  id v23 = objc_loadWeakRetained((id *)&self->super._layer);
  [(LAUIPhysicalButtonViewAnimation *)self addAdditiveAnimation:v11 to:v23 keyPath:0];
}

@end