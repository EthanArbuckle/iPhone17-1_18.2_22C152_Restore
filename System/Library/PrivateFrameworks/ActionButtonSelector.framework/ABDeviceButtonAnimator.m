@interface ABDeviceButtonAnimator
- (BOOL)isRingHighlightVisible;
- (double)opacity;
- (double)pressProgress;
- (id)color;
- (id)initWithBaseColor:(id *)a1;
- (uint64_t)islandMode;
- (uint64_t)setBaseColor:(int)a3 animated:;
- (uint64_t)update;
- (void)setActive:(uint64_t)a1;
@end

@implementation ABDeviceButtonAnimator

- (id)initWithBaseColor:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)ABDeviceButtonAnimator;
    a1 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      uint64_t v4 = objc_opt_new();
      id v5 = a1[1];
      a1[1] = (id)v4;

      uint64_t v6 = objc_opt_new();
      id v7 = a1[2];
      a1[2] = (id)v6;

      [a1[2] setBounce:0.0 duration:0.35];
      [a1[2] setOutput:0.0];
      uint64_t v8 = objc_opt_new();
      id v9 = a1[3];
      a1[3] = (id)v8;

      [a1[3] setOutput:0.0];
      [a1[3] setBounce:0.0 duration:0.45];
      uint64_t v10 = objc_opt_new();
      id v11 = a1[4];
      a1[4] = (id)v10;

      [a1[4] setOutput:0.0];
      -[ABDeviceButtonAnimator setBaseColor:animated:]((uint64_t)a1, v3, 0);
    }
  }

  return a1;
}

- (uint64_t)setBaseColor:(int)a3 animated:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v10 = v5;
    -[ABColorInterpolator setColor:animated:](*(void *)(a1 + 8), v5, a3);
    double v7 = 0.0;
    if (v10) {
      double v7 = 1.0;
    }
    uint64_t v8 = *(void **)(a1 + 16);
    if (a3) {
      id v5 = (id)[v8 setInput:v7];
    }
    else {
      id v5 = (id)[v8 setOutput:v7];
    }
    id v6 = v10;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

- (void)setActive:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if (*(unsigned __int8 *)(a1 + 48) != a2)
    {
      *(unsigned char *)(a1 + 48) = a2;
      [*(id *)(a1 + 32) setInput:0.0];
      [*(id *)(a1 + 24) setInput:0.0];
      *(unsigned char *)(a1 + 49) = 0;
      *(void *)(a1 + 56) = 0;
      if (v2)
      {
        uint64_t v4 = NSNumber;
        id v9 = [MEMORY[0x263EFF910] now];
        [v9 timeIntervalSinceReferenceDate];
        uint64_t v6 = [v4 numberWithDouble:v5 + -5.0 + 0.75];
        double v7 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v6;

        uint64_t v8 = v9;
      }
      else
      {
        uint64_t v8 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0;
      }
    }
  }
}

- (id)color
{
  v1 = a1;
  if (a1)
  {
    char v2 = -[ABColorInterpolator color](a1[1]);
    [v1[4] output];
    if (v2)
    {
      double v8 = 0.0;
      double v9 = 0.0;
      double v4 = v3 * 0.2 + 0.0;
      double v6 = 0.0;
      double v7 = 0.0;
      [v2 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
      objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", fmin(v4 + v9, 1.0), fmin(v4 + v8, 1.0), fmin(v4 + v7, 1.0), v6);
      v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }
  }

  return v1;
}

- (double)opacity
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 16) output];
  return result;
}

- (double)pressProgress
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 24) output];
  return result;
}

- (uint64_t)update
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (!*(unsigned char *)(result + 48)) {
    return result;
  }
  char v2 = [MEMORY[0x263EFF910] now];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  [*(id *)(v1 + 40) doubleValue];
  if (v4 - v5 > 5.0)
  {
    uint64_t v6 = [NSNumber numberWithDouble:v4];
    double v7 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = v6;

    double result = [*(id *)(v1 + 24) setInput:1.0];
    *(unsigned char *)(v1 + 49) = 0;
    uint64_t v8 = 1;
LABEL_5:
    *(void *)(v1 + 56) = v8;
    return result;
  }
  double result = [*(id *)(v1 + 40) doubleValue];
  if (v4 - v9 > 2.0)
  {
    *(void *)(v1 + 56) = 0;
    return result;
  }
  [*(id *)(v1 + 40) doubleValue];
  if (v4 - v10 > 1.0)
  {
    [*(id *)(v1 + 24) setInput:0.0];
    [*(id *)(v1 + 32) setBounce:0.0 duration:2.0];
    id v11 = *(void **)(v1 + 32);
    double v12 = 0.0;
LABEL_15:
    return [v11 setInput:v12];
  }
  double result = [*(id *)(v1 + 40) doubleValue];
  if (v4 - v13 > 0.8)
  {
    *(unsigned char *)(v1 + 49) = 1;
    uint64_t v8 = 3;
    goto LABEL_5;
  }
  double result = [*(id *)(v1 + 40) doubleValue];
  if (v4 - v14 > 0.1)
  {
    *(void *)(v1 + 56) = 2;
    [*(id *)(v1 + 32) setBounce:0.0 duration:3.0];
    id v11 = *(void **)(v1 + 32);
    double v12 = 1.0;
    goto LABEL_15;
  }
  return result;
}

- (uint64_t)islandMode
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (BOOL)isRingHighlightVisible
{
  if (result) {
    return *(unsigned char *)(result + 49) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonReleaseTimestamp, 0);
  objc_storeStrong((id *)&self->_buttonGlowInterpolator, 0);
  objc_storeStrong((id *)&self->_buttonPressInterpolator, 0);
  objc_storeStrong((id *)&self->_highlightOpacityInterpolator, 0);

  objc_storeStrong((id *)&self->_highlightColorInterpolator, 0);
}

@end