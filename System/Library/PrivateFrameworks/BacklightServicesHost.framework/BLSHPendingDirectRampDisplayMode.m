@interface BLSHPendingDirectRampDisplayMode
- (BLSHPendingDirectRampDisplayMode)initWithRampBeginDisplayMode:(int64_t)a3 targetDisplayMode:(int64_t)a4;
- (BOOL)isDirectRamp;
- (BOOL)isReadyToStart;
- (double)duration;
- (id)description;
- (id)updateOperation;
- (int64_t)rampBeginDisplayMode;
- (void)setDuration:(double)a3;
- (void)setReadyToStart:(BOOL)a3;
@end

@implementation BLSHPendingDirectRampDisplayMode

- (BLSHPendingDirectRampDisplayMode)initWithRampBeginDisplayMode:(int64_t)a3 targetDisplayMode:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BLSHPendingDirectRampDisplayMode;
  result = [(BLSHPendingUpdateDisplayMode *)&v6 initWithCurrentDisplayMode:a3 targetDisplayMode:a4];
  if (result)
  {
    result->_rampBeginDisplayMode = a3;
    result->_readyToStart = 1;
  }
  return result;
}

- (BOOL)isDirectRamp
{
  return 1;
}

- (id)updateOperation
{
  v3 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self previous];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self next];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self previous];
  BOOL v5 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self isStarted];
  if (v4) {
    objc_super v6 = @"started";
  }
  else {
    objc_super v6 = @"bothStarted";
  }
  id v7 = (id)[v3 appendBool:v5 withName:v6];
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingDirectRampDisplayMode isReadyToStart](self, "isReadyToStart"), @"isReadyToStart");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"), @"completed");
  v10 = NSStringFromBLSBacklightDisplayMode(self->_rampBeginDisplayMode);
  [v3 appendString:v10 withName:@"begin"];

  v11 = NSStringFromBLSBacklightDisplayMode([(BLSHPendingUpdateDisplayMode *)self targetDisplayMode]);
  [v3 appendString:v11 withName:@"target"];

  id v12 = (id)[v3 appendTimeInterval:@"duration" withName:1 decomposeUnits:self->_duration];
  id v13 = (id)[v3 appendPointer:v4 withName:@"previous"];
  v14 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self next];
  id v15 = (id)[v3 appendObject:v14 withName:@"next"];

  v16 = [v3 build];

  return v16;
}

- (int64_t)rampBeginDisplayMode
{
  return self->_rampBeginDisplayMode;
}

- (BOOL)isReadyToStart
{
  return self->_readyToStart;
}

- (void)setReadyToStart:(BOOL)a3
{
  self->_readyToStart = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end