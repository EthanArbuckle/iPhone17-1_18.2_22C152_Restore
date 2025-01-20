@interface GCMotion
+ (BOOL)supportsSecureCoding;
- (BOOL)_isUpdatingDeviceMotion;
- (BOOL)hasAttitude;
- (BOOL)hasAttitudeAndRotationRate;
- (BOOL)hasGravityAndUserAcceleration;
- (BOOL)hasRotationRate;
- (BOOL)isEmulatedMicroGamepad;
- (BOOL)sensorsActive;
- (BOOL)sensorsRequireManualActivation;
- (GCAcceleration)acceleration;
- (GCAcceleration)gravity;
- (GCAcceleration)userAcceleration;
- (GCController)controller;
- (GCMotion)initWithCoder:(id)a3;
- (GCMotion)initWithController:(id)a3;
- (GCMotion)initWithIdentifier:(id)a3;
- (GCMotionValueChangedHandler)valueChangedHandler;
- (GCQuaternion)attitude;
- (GCRotationRate)rotationRate;
- (float)_tilt;
- (float)_tip;
- (id)identifier;
- (void)_setAcceleration:(id)a3;
- (void)_setAttitude:(GCQuaternion)a3;
- (void)_setCompassEnabled:(BOOL)a3;
- (void)_setGravity:(id)a3;
- (void)_setHasAttitude:(BOOL)a3;
- (void)_setHasRotationRate:(BOOL)a3;
- (void)_setMotionLite:(BOOL)a3;
- (void)_setRotationRate:(id)a3;
- (void)_setUserAcceleration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceleration:(GCAcceleration)acceleration;
- (void)setAttitude:(GCQuaternion)attitude;
- (void)setController:(id)a3;
- (void)setGravity:(GCAcceleration)gravity;
- (void)setMotionEventSource:(id)a3;
- (void)setRotationRate:(GCRotationRate)rotationRate;
- (void)setSensorsActive:(BOOL)sensorsActive;
- (void)setStateFromMotion:(GCMotion *)motion;
- (void)setUserAcceleration:(GCAcceleration)userAcceleration;
- (void)setValueChangedHandler:(GCMotionValueChangedHandler)valueChangedHandler;
@end

@implementation GCMotion

- (GCMotion)initWithController:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GCMotion;
  v5 = [(GCMotion *)&v7 init];
  if (v5)
  {
    v5[232] = [v4 isATVRemote];
    v5[233] = [v4 physicalDeviceUsesCompass];
    objc_storeWeak((id *)v5 + 32, v4);
    *((void *)v5 + 2) = 0;
    *((void *)v5 + 3) = 0;
    *((void *)v5 + 4) = 0xBFF0000000000000;
    *((void *)v5 + 5) = 0;
    *((void *)v5 + 6) = 0;
    *((void *)v5 + 7) = 0;
    *((void *)v5 + 11) = 0;
    *((void *)v5 + 12) = 0;
    *((void *)v5 + 13) = 0;
    *((void *)v5 + 14) = 0x3FF0000000000000;
    *((void *)v5 + 20) = 0;
    *((void *)v5 + 21) = 0;
    *((void *)v5 + 19) = 0;
    *(_OWORD *)(v5 + 200) = 0u;
    *(_OWORD *)(v5 + 216) = 0u;
  }

  return (GCMotion *)v5;
}

- (GCMotion)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCMotion;
  v6 = [(GCMotion *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_gravity.x = 0.0;
    v7->_gravity.y = 0.0;
    v7->_gravity.z = -1.0;
    v7->_userAcceleration.x = 0.0;
    v7->_userAcceleration.y = 0.0;
    v7->_userAcceleration.z = 0.0;
    v7->_attitude.x = 0.0;
    v7->_attitude.y = 0.0;
    v7->_attitude.z = 0.0;
    v7->_attitude.w = 1.0;
    v7->_eulerAngles.yaw = 0.0;
    v7->_eulerAngles.roll = 0.0;
    v7->_eulerAngles.pitch = 0.0;
    *(_OWORD *)&v7->_rotationRate.x = 0u;
    *(_OWORD *)&v7->_rotationRate.z = 0u;
  }

  return v7;
}

- (BOOL)sensorsRequireManualActivation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v3 = [WeakRetained components];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setSensorsActive:(BOOL)sensorsActive
{
  BOOL v3 = sensorsActive;
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v6 = [WeakRetained components];

  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)p_controller);
    objc_super v7 = [v8 motionConfigurableSensors];
    [v7 setSensorsActive:v3];
  }
}

- (BOOL)sensorsActive
{
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  BOOL v4 = [WeakRetained components];

  if (!v4) {
    return 1;
  }
  id v5 = objc_loadWeakRetained((id *)p_controller);
  v6 = [v5 motionConfigurableSensors];
  char v7 = [v6 sensorsActive];

  return v7;
}

- (void)setController:(id)a3
{
}

- (void)_setMotionLite:(BOOL)a3
{
  self->_motionLite = a3;
}

- (BOOL)hasGravityAndUserAcceleration
{
  return 0;
}

- (GCAcceleration)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (GCAcceleration)userAcceleration
{
  double x = self->_userAcceleration.x;
  double y = self->_userAcceleration.y;
  double z = self->_userAcceleration.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (GCAcceleration)acceleration
{
  if ([(GCMotion *)self hasGravityAndUserAcceleration])
  {
    [(GCMotion *)self gravity];
    double v4 = v3;
    [(GCMotion *)self userAcceleration];
    double x = v4 + v5;
    [(GCMotion *)self gravity];
    double v8 = v7;
    [(GCMotion *)self userAcceleration];
    double y = v8 + v9;
    [(GCMotion *)self gravity];
    double v12 = v11;
    [(GCMotion *)self userAcceleration];
    double z = v12 + v13;
  }
  else
  {
    double x = self->_acceleration.x;
    double y = self->_acceleration.y;
    double z = self->_acceleration.z;
  }
  double v15 = x;
  double v16 = y;
  result.double z = z;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)_setCompassEnabled:(BOOL)a3
{
  self->_compassEnabled = a3;
}

- (BOOL)hasAttitude
{
  return self->_hasAttitude || self->_compassEnabled;
}

- (void)_setHasAttitude:(BOOL)a3
{
  self->_hasAttitude = a3;
  if (!a3) {
    -[GCMotion _setAttitude:](self, "_setAttitude:", 0.0, 0.0, 0.0, 0.0);
  }
}

- (BOOL)hasRotationRate
{
  return self->_hasRotationRate || self->_compassEnabled;
}

- (void)_setHasRotationRate:(BOOL)a3
{
  self->_hasRotationRate = a3;
  if (!a3) {
    -[GCMotion _setRotationRate:](self, "_setRotationRate:", 0.0, 0.0, 0.0);
  }
}

- (BOOL)hasAttitudeAndRotationRate
{
  if (self->_compassEnabled) {
    return 1;
  }
  if (self->_hasAttitude) {
    return self->_hasRotationRate;
  }
  return 0;
}

- (GCQuaternion)attitude
{
  double x = self->_attitude.x;
  double y = self->_attitude.y;
  double z = self->_attitude.z;
  double w = self->_attitude.w;
  result.double w = w;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (GCRotationRate)rotationRate
{
  double x = self->_rotationRate.x;
  double y = self->_rotationRate.y;
  double z = self->_rotationRate.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (float)_tip
{
  return self->_tip;
}

- (float)_tilt
{
  return self->_tilt;
}

- (GCMotionValueChangedHandler)valueChangedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_valueChangedHandler, a2);

  return v2;
}

- (void)setValueChangedHandler:(GCMotionValueChangedHandler)valueChangedHandler
{
  GCMotionValueChangedHandler v4 = valueChangedHandler;
  objc_initWeak(&location, self);
  double v5 = [(GCMotion *)self controller];
  v6 = [v5 handlerQueue];
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __35__GCMotion_setValueChangedHandler___block_invoke;
    block[3] = &unk_26D22BE18;
    double v7 = &v12;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_async(v6, block);

    double v5 = v11;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __35__GCMotion_setValueChangedHandler___block_invoke_2;
    v8[3] = &unk_26D22A9D0;
    double v7 = &v9;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);
  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __35__GCMotion_setValueChangedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    double v3 = (void *)WeakRetained[30];
    WeakRetained[30] = v2;
  }
}

void __35__GCMotion_setValueChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[30];
    WeakRetained[30] = 0;
    double v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (BOOL)isEmulatedMicroGamepad
{
  double v3 = [(GCMotion *)self controller];
  GCMotionValueChangedHandler v4 = [v3 profile];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(GCMotion *)self controller];
    char v6 = [v5 isForwarded];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_setGravity:(id)a3
{
  self->_gravitdouble y = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setUserAcceleration:(id)a3
{
  self->_userAcceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setAcceleration:(id)a3
{
  self->_acceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setAttitude:(GCQuaternion)a3
{
  self->_attitude = a3;
}

- (void)_setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (BOOL)_isUpdatingDeviceMotion
{
  return 0;
}

- (void)setGravity:(GCAcceleration)gravity
{
  double z = gravity.z;
  double y = gravity.y;
  double x = gravity.x;
  uint64_t v7 = [(GCMotion *)self controller];
  if (!v7
    || (double v8 = (void *)v7,
        [(GCMotion *)self controller],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isSnapshot],
        v9,
        v8,
        v10))
  {
    self->_gravity.double x = x;
    self->_gravity.double y = y;
    self->_gravity.double z = z;
  }
}

- (void)setUserAcceleration:(GCAcceleration)userAcceleration
{
  double z = userAcceleration.z;
  double y = userAcceleration.y;
  double x = userAcceleration.x;
  uint64_t v7 = [(GCMotion *)self controller];
  if (!v7
    || (double v8 = (void *)v7,
        [(GCMotion *)self controller],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isSnapshot],
        v9,
        v8,
        v10))
  {
    self->_userAcceleration.double x = x;
    self->_userAcceleration.double y = y;
    self->_userAcceleration.double z = z;
  }
}

- (void)setAcceleration:(GCAcceleration)acceleration
{
  double z = acceleration.z;
  double y = acceleration.y;
  double x = acceleration.x;
  uint64_t v7 = [(GCMotion *)self controller];
  if (!v7
    || (double v8 = (void *)v7,
        [(GCMotion *)self controller],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isSnapshot],
        v9,
        v8,
        v10))
  {
    self->_acceleration.double x = x;
    self->_acceleration.double y = y;
    self->_acceleration.double z = z;
  }
}

- (void)setAttitude:(GCQuaternion)attitude
{
  double w = attitude.w;
  double z = attitude.z;
  double y = attitude.y;
  double x = attitude.x;
  uint64_t v8 = [(GCMotion *)self controller];
  if (!v8
    || (id v9 = (void *)v8,
        [(GCMotion *)self controller],
        int v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isSnapshot],
        v10,
        v9,
        v11))
  {
    self->_attitude.double x = x;
    self->_attitude.double y = y;
    self->_attitude.double z = z;
    self->_attitude.double w = w;
  }
}

- (void)setRotationRate:(GCRotationRate)rotationRate
{
  double z = rotationRate.z;
  double y = rotationRate.y;
  double x = rotationRate.x;
  uint64_t v7 = [(GCMotion *)self controller];
  if (!v7
    || (uint64_t v8 = (void *)v7,
        [(GCMotion *)self controller],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isSnapshot],
        v9,
        v8,
        v10))
  {
    self->_rotationRate.double x = x;
    self->_rotationRate.double y = y;
    self->_rotationRate.double z = z;
  }
}

- (void)setStateFromMotion:(GCMotion *)motion
{
  GCMotionValueChangedHandler v4 = motion;
  uint64_t v5 = [(GCMotion *)self controller];
  if (!v5
    || (char v6 = (void *)v5,
        [(GCMotion *)self controller],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isSnapshot],
        v7,
        v6,
        v8))
  {
    if (gc_isInternalBuild())
    {
      int v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        double v13 = [WeakRetained debugName];
        v14 = [(GCMotion *)v4 controller];
        double v15 = [v14 debugName];
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "set %@ StateFromMotion %@", buf, 0x16u);
      }
    }
    [(GCMotion *)v4 gravity];
    -[GCMotion setGravity:](self, "setGravity:");
    [(GCMotion *)v4 userAcceleration];
    -[GCMotion setUserAcceleration:](self, "setUserAcceleration:");
    [(GCMotion *)v4 acceleration];
    -[GCMotion setAcceleration:](self, "setAcceleration:");
    [(GCMotion *)v4 attitude];
    -[GCMotion setAttitude:](self, "setAttitude:");
    [(GCMotion *)v4 rotationRate];
    -[GCMotion setRotationRate:](self, "setRotationRate:");
    id v9 = [(GCMotion *)self controller];
    int v10 = [v9 handlerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __31__GCMotion_setStateFromMotion___block_invoke;
    block[3] = &unk_26D22A8C0;
    void block[4] = self;
    dispatch_async(v10, block);
  }
}

void __31__GCMotion_setStateFromMotion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueChangedHandler];

  if (v2)
  {
    double v3 = [*(id *)(a1 + 32) valueChangedHandler];
    v3[2](v3, *(void *)(a1 + 32));
  }
}

- (GCController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (GCController *)WeakRetained;
}

- (id)identifier
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong(&self->_valueChangedHandler, 0);

  objc_storeStrong(&self->_motionEventObservation, 0);
}

- (void)setMotionEventSource:(id)a3
{
  id motionEventObservation = self->_motionEventObservation;
  self->_id motionEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __41__GCMotion_PubSub__setMotionEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e26_v16__0____GCMotionEvent__8lu32l8;
  void v8[4] = self;
  char v6 = [v5 observeMotionEvents:v8];

  id v7 = self->_motionEventObservation;
  self->_id motionEventObservation = v6;
}

void __41__GCMotion_PubSub__setMotionEventSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  GCMotionValueChangedHandler v4 = [*(id *)(a1 + 32) controller];
  if (v4)
  {
    if ([v3 hasGyro])
    {
      [v3 gyroPitch];
      double v6 = v5;
      [v3 gyroYaw];
      double v8 = v7;
      [v3 gyroRoll];
      objc_msgSend(*(id *)(a1 + 32), "_setRotationRate:", v6, v8, v9);
    }
    if ([v3 hasAccelerometer] && (objc_msgSend(v3, "hasAttitude") & 1) == 0)
    {
      [v3 accelerometerX];
      double v11 = v10;
      [v3 accelerometerY];
      double v13 = v12;
      [v3 accelerometerZ];
      objc_msgSend(*(id *)(a1 + 32), "_setAcceleration:", v11, v13, v14);
    }
    if ([v3 hasAttitude])
    {
      objc_msgSend(*(id *)(a1 + 32), "_setUserAcceleration:", 0.0, 0.0, 0.0);
      objc_msgSend(*(id *)(a1 + 32), "_setAcceleration:", 0.0, 0.0, 0.0);
      objc_msgSend(*(id *)(a1 + 32), "_setGravity:", 0.0, 0.0, 0.0);
      objc_msgSend(*(id *)(a1 + 32), "_setAttitude:", 0.0, 0.0, 0.0, 0.0);
      +[NSException raise:NSInternalInconsistencyException format:@"Support for game controllers with attitude is not implemented."];
    }
    id v15 = *(id *)(a1 + 32);
    double v16 = [v15 valueChangedHandler];
    v17 = [v4 handlerQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __41__GCMotion_PubSub__setMotionEventSource___block_invoke_2;
    v19[3] = &unk_26D22AA20;
    v19[4] = v15;
    id v20 = v16;
    id v18 = v16;
    dispatch_async(v17, v19);
  }
}

uint64_t __41__GCMotion_PubSub__setMotionEventSource___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCMotion)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = GCIPCObjectIdentifier_Classes();
  double v6 = [v4 decodeObjectOfClasses:v5 forKey:@"identifier"];

  double v7 = [(GCMotion *)self initWithIdentifier:v6];
  if (v7)
  {
    v7->_hasAttitude = [v4 decodeBoolForKey:@"hasAttitude"];
    v7->_hasRotationRate = [v4 decodeBoolForKey:@"hasRotationRate"];
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(GCMotion *)self identifier];
  [v5 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[GCMotion hasAttitude](self, "hasAttitude"), @"hasAttitude");
  objc_msgSend(v5, "encodeBool:forKey:", -[GCMotion hasRotationRate](self, "hasRotationRate"), @"hasRotationRate");
}

@end