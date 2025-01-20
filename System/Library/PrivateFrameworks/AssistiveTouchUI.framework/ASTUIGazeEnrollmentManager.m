@interface ASTUIGazeEnrollmentManager
+ (id)sharedManager;
- (ASTUICalibrationStrategy)calibrationStrategy;
- (ASTUIGazeEnrollmentManager)init;
- (BOOL)enrollmentComplete;
- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3;
- (void)_learnCalibration;
- (void)_setupCalibrationStrategy;
- (void)captureCurrentEnrollmentPoint:(CGPoint)a3 gazePoint:(CGPoint)a4 positionName:(id)a5;
- (void)resetGazeEnrollment;
- (void)setCalibrationStrategy:(id)a3;
- (void)setEnrollmentComplete:(BOOL)a3;
@end

@implementation ASTUIGazeEnrollmentManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_SharedManager;
  return v2;
}

uint64_t __43__ASTUIGazeEnrollmentManager_sharedManager__block_invoke()
{
  sharedManager_SharedManager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (ASTUIGazeEnrollmentManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASTUIGazeEnrollmentManager;
  v2 = [(ASTUIGazeEnrollmentManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(ASTUIGazeEnrollmentManager *)v2 _setupCalibrationStrategy];
    objc_initWeak(&location, v3);
    v4 = [MEMORY[0x263F22938] sharedInstance];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__ASTUIGazeEnrollmentManager_init__block_invoke;
    v6[3] = &unk_26523EE48;
    objc_copyWeak(&v7, &location);
    [v4 registerUpdateBlock:v6 forRetrieveSelector:sel_assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy withListener:v3];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __34__ASTUIGazeEnrollmentManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupCalibrationStrategy];
}

- (void)setEnrollmentComplete:(BOOL)a3
{
  self->_enrollmentComplete = a3;
  if (a3) {
    [(ASTUIGazeEnrollmentManager *)self _learnCalibration];
  }
}

- (void)resetGazeEnrollment
{
  self->_enrollmentComplete = 0;
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(ASTUIGazeEnrollmentManager *)self enrollmentComplete])
  {
    -[ASTUICalibrationStrategy calibratedGazePointForGazePoint:](self->_calibrationStrategy, "calibratedGazePointForGazePoint:", x, y);
    double x = v6;
    double y = v7;
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)captureCurrentEnrollmentPoint:(CGPoint)a3 gazePoint:(CGPoint)a4 positionName:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v10 = a5;
  id v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setPredictedPoint:", x, y);
  objc_msgSend(v11, "setGroundTruthPoint:", v8, v7);
  [v11 setPositionName:v10];

  [(ASTUICalibrationStrategy *)self->_calibrationStrategy captureGazeEnrollmentPoint:v11];
}

- (void)_learnCalibration
{
}

- (void)_setupCalibrationStrategy
{
  [(ASTUICalibrationStrategy *)self->_calibrationStrategy reset];
  v3 = [MEMORY[0x263F22938] sharedInstance];
  unint64_t v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy];

  if (v4 <= 1)
  {
    v5 = (ASTUICalibrationStrategy *)objc_opt_new();
    calibrationStrategdouble y = self->_calibrationStrategy;
    self->_calibrationStrategdouble y = v5;
  }
  double v7 = AXSCalibrationStrategyName();
}

- (BOOL)enrollmentComplete
{
  return self->_enrollmentComplete;
}

- (ASTUICalibrationStrategy)calibrationStrategy
{
  return self->_calibrationStrategy;
}

- (void)setCalibrationStrategy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end