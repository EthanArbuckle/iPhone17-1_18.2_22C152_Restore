@interface _GCNintendoFusedJoyConHapticDriver
- (_GCNintendoFusedJoyConHapticDriver)initWithDevice:(id)a3;
- (id)getDriver:(unint64_t)a3;
- (void)enableHaptics;
- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4;
- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5;
@end

@implementation _GCNintendoFusedJoyConHapticDriver

- (_GCNintendoFusedJoyConHapticDriver)initWithDevice:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCNintendoFusedJoyConHapticDriver;
  v5 = [(_GCNintendoFusedJoyConHapticDriver *)&v15 init];
  if (v5)
  {
    v6 = [v4 leftDevice];
    v7 = [v6 driverConnection];
    uint64_t v8 = [v7 remoteProxy];
    leftDriver = v5->_leftDriver;
    v5->_leftDriver = (_GCDriverClientInterface *)v8;

    v10 = [v4 rightDevice];
    v11 = [v10 driverConnection];
    uint64_t v12 = [v11 remoteProxy];
    rightDriver = v5->_rightDriver;
    v5->_rightDriver = (_GCDriverClientInterface *)v12;
  }
  return v5;
}

- (id)getDriver:(unint64_t)a3
{
  uint64_t v3 = 16;
  if (a3 < 2) {
    uint64_t v3 = 8;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)enableHaptics
{
  [(_GCDriverClientInterface *)self->_leftDriver enableHaptics];
  rightDriver = self->_rightDriver;

  [(_GCDriverClientInterface *)rightDriver enableHaptics];
}

- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(_GCNintendoFusedJoyConHapticDriver *)self getDriver:a4];
  [v7 enqueueTransient:v6 hapticMotor:a4];
}

- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5
{
  -[_GCNintendoFusedJoyConHapticDriver getDriver:](self, "getDriver:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v8 = a4;
  *(float *)&double v9 = a5;
  [v10 setHapticMotor:a3 frequency:v8 amplitude:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDriver, 0);

  objc_storeStrong((id *)&self->_leftDriver, 0);
}

@end