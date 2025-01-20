@interface CAMTorchPattern
- (CAAnimationGroup)_animationGroup;
- (CAMTorchPattern)init;
- (CAMTorchPattern)initWithType:(int64_t)a3;
- (double)_lastUpdateTime;
- (double)startTime;
- (float)torchLevel;
- (id)_blinkAnimationGroup;
- (id)_blinkAnimationWithBeginTime:(double)a3 duration:(double)a4 repeatCount:(int64_t)a5;
- (id)_doubleBlinkAnimationGroup;
- (id)_longPatternAnimationGroup;
- (id)_patternAnimationWithBeginTime:(double)a3 duration:(double)a4 repeatCount:(int64_t)a5;
- (id)_shortPatternAnimationGroup;
- (int64_t)_type;
- (void)_updateAnimationGroup;
- (void)setStartTime:(double)a3;
- (void)updateAtTime:(double)a3;
@end

@implementation CAMTorchPattern

- (CAMTorchPattern)init
{
  return 0;
}

- (CAMTorchPattern)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMTorchPattern;
  v4 = [(CAMTorchPattern *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__type = a3;
    [(CAMTorchPattern *)v4 _updateAnimationGroup];
    v6 = v5;
  }

  return v5;
}

- (void)setStartTime:(double)a3
{
  if (self->_startTime != a3)
  {
    self->__lastUpdateTime = a3;
    self->_startTime = a3;
  }
}

- (id)_patternAnimationWithBeginTime:(double)a3 duration:(double)a4 repeatCount:(int64_t)a5
{
  objc_super v8 = [MEMORY[0x263F157D8] animationWithKeyPath:@"torchLevel"];
  [v8 setValues:&unk_26BDDF8F0];
  [v8 setKeyTimes:&unk_26BDDF908];
  [v8 setBeginTime:a3];
  [v8 setDuration:a4];
  *(float *)&double v9 = (float)a5;
  [v8 setRepeatCount:v9];
  v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v8 setTimingFunction:v10];

  [v8 setCalculationMode:*MEMORY[0x263F15968]];
  return v8;
}

- (id)_shortPatternAnimationGroup
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F15750] animation];
  v4 = [(CAMTorchPattern *)self _patternAnimationWithBeginTime:8 duration:0.0 repeatCount:0.25];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v3 setAnimations:v5];

  [v3 setDuration:3.0];
  return v3;
}

- (id)_longPatternAnimationGroup
{
  v9[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F15750] animation];
  v4 = [(CAMTorchPattern *)self _patternAnimationWithBeginTime:2 duration:0.0 repeatCount:2.0];
  v5 = [(CAMTorchPattern *)self _patternAnimationWithBeginTime:4 duration:4.0 repeatCount:0.75];
  v6 = [(CAMTorchPattern *)self _patternAnimationWithBeginTime:8 duration:7.0 repeatCount:0.25];
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  [v3 setAnimations:v7];

  [v3 setDuration:10.0];
  return v3;
}

- (id)_blinkAnimationWithBeginTime:(double)a3 duration:(double)a4 repeatCount:(int64_t)a5
{
  objc_super v8 = [MEMORY[0x263F157D8] animationWithKeyPath:@"torchLevel"];
  [v8 setValues:&unk_26BDDF920];
  [v8 setKeyTimes:&unk_26BDDF938];
  [v8 setBeginTime:a3];
  [v8 setDuration:a4];
  *(float *)&double v9 = (float)a5;
  [v8 setRepeatCount:v9];
  v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v8 setTimingFunction:v10];

  [v8 setCalculationMode:*MEMORY[0x263F15968]];
  return v8;
}

- (id)_blinkAnimationGroup
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F15750] animation];
  v4 = [(CAMTorchPattern *)self _blinkAnimationWithBeginTime:1 duration:0.0 repeatCount:1.0];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v3 setAnimations:v5];

  [v3 setDuration:1.0];
  return v3;
}

- (id)_doubleBlinkAnimationGroup
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F15750] animation];
  v4 = [(CAMTorchPattern *)self _blinkAnimationWithBeginTime:2 duration:0.0 repeatCount:0.5];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v3 setAnimations:v5];

  [v3 setDuration:1.0];
  return v3;
}

- (void)_updateAnimationGroup
{
  switch(self->__type)
  {
    case 0:
      v3 = [(CAMTorchPattern *)self _shortPatternAnimationGroup];
      goto LABEL_6;
    case 1:
      v3 = [(CAMTorchPattern *)self _longPatternAnimationGroup];
      goto LABEL_6;
    case 2:
      v3 = [(CAMTorchPattern *)self _blinkAnimationGroup];
      goto LABEL_6;
    case 3:
      v3 = [(CAMTorchPattern *)self _doubleBlinkAnimationGroup];
LABEL_6:
      animationGroup = self->__animationGroup;
      self->__animationGroup = v3;
      MEMORY[0x270F9A758](v3, animationGroup);
      break;
    default:
      return;
  }
}

- (void)updateAtTime:(double)a3
{
}

- (float)torchLevel
{
  return self->_torchLevel;
}

- (int64_t)_type
{
  return self->__type;
}

- (CAAnimationGroup)_animationGroup
{
  return self->__animationGroup;
}

- (double)_lastUpdateTime
{
  return self->__lastUpdateTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
}

@end