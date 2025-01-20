@interface _GCAppleTVRemoteMotionProfile
- ($1AB5FA073B851C12C2339EC22442E995)gravity;
- ($1AB5FA073B851C12C2339EC22442E995)rotationRate;
- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration;
- (BOOL)_isUpdatingDeviceMotion;
- (BOOL)hasAttitude;
- (BOOL)hasAttitudeAndRotationRate;
- (BOOL)hasGravityAndUserAcceleration;
- (BOOL)hasRotationRate;
- (BOOL)isEmulatedMicroGamepad;
- (GCQuaternion)attitude;
- (_GCAppleTVRemoteMotionProfile)initWithController:(id)a3;
- (float)_tilt;
- (float)_tip;
- (id)_motionLiteFusedHandler;
- (id)controller;
- (id)internalValueChangedHandler;
- (id)valueChangedHandler;
- (void)_setAttitude:(GCQuaternion)a3;
- (void)_setCompassEnabled:(BOOL)a3;
- (void)_setGravity:(id)a3;
- (void)_setMotionLite:(BOOL)a3;
- (void)_setRotationRate:(id)a3;
- (void)_setUserAcceleration:(id)a3;
- (void)setInternalValueChangedHandler:(id)a3;
- (void)setValueChangedHandler:(id)a3;
@end

@implementation _GCAppleTVRemoteMotionProfile

- (_GCAppleTVRemoteMotionProfile)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCAppleTVRemoteMotionProfile;
  v5 = [(_GCAppleTVRemoteMotionProfile *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_linkedOnOrAfterCompassFeature = 0;
    dyld_get_active_platform();
    v6->_linkedOnOrAfterCompassFeature = dyld_program_sdk_at_least();
    v6->_motionLite = [v4 isATVRemote];
    if (v6->_linkedOnOrAfterCompassFeature) {
      v6->_compassEnabled = [v4 physicalDeviceUsesCompass];
    }
    objc_storeWeak((id *)&v6->_controller, v4);
    v6->_gravity.x = 0.0;
    v6->_gravity.y = 0.0;
    v6->_gravity.z = -1.0;
    v6->_prevGravity.x = 0.0;
    v6->_prevGravity.y = 0.0;
    v6->_prevGravity.z = -1.0;
    v6->_userAcceleration.y = 0.0;
    v6->_userAcceleration.z = 0.0;
    v6->_userAcceleration.x = 0.0;
    v6->_attitude.x = 0.0;
    v6->_attitude.y = 0.0;
    v6->_attitude.z = 0.0;
    v6->_attitude.w = 1.0;
    v6->_eulerAngles.yaw = 0.0;
    v6->_eulerAngles.roll = 0.0;
    v6->_eulerAngles.pitch = 0.0;
    v6->_rotationRate.y = 0.0;
    v6->_rotationRate.z = 0.0;
    v6->_rotationRate.x = 0.0;
    v6->_tip = 0.0;
    v6->_tilt = 0.0;
    v6->_motionUpdatedEnabled = 0;
    v6->_paused = 0;
  }

  return v6;
}

- (void)_setMotionLite:(BOOL)a3
{
  self->_motionLite = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration
{
  double x = self->_userAcceleration.x;
  double y = self->_userAcceleration.y;
  double z = self->_userAcceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (BOOL)hasGravityAndUserAcceleration
{
  return 1;
}

- (void)_setCompassEnabled:(BOOL)a3
{
  self->_compassEnabled = a3;
}

- (BOOL)hasAttitudeAndRotationRate
{
  return self->_compassEnabled;
}

- (BOOL)hasAttitude
{
  return self->_compassEnabled;
}

- (BOOL)hasRotationRate
{
  return self->_compassEnabled;
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

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x = self->_rotationRate.x;
  double y = self->_rotationRate.y;
  double z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
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

- (id)valueChangedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_valueChangedHandler, a2);

  return v2;
}

- (void)setValueChangedHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(_GCAppleTVRemoteMotionProfile *)self controller];
  v6 = [v5 handlerQueue];
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke;
    block[3] = &unk_26D22D388;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    id v11 = v4;
    dispatch_async(v6, block);

    v5 = v11;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke_2;
    v8[3] = &unk_26D22B950;
    v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    dispatch_async(v6, v8);
  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (id)internalValueChangedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_internalValueChangedHandler, a2);

  return v2;
}

- (void)setInternalValueChangedHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(_GCAppleTVRemoteMotionProfile *)self controller];
  v6 = [v5 handlerQueue];
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke;
    block[3] = &unk_26D22D388;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    id v11 = v4;
    dispatch_async(v6, block);

    v5 = v11;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke_2;
    v8[3] = &unk_26D22B950;
    v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    dispatch_async(v6, v8);
  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (BOOL)isEmulatedMicroGamepad
{
  v3 = [(_GCAppleTVRemoteMotionProfile *)self controller];
  id v4 = [v3 profile];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_GCAppleTVRemoteMotionProfile *)self controller];
    char v6 = [v5 isForwarded];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_motionLiteFusedHandler
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke;
  v4[3] = &unk_26D22D3B0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x223C6E420](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (BOOL)_isUpdatingDeviceMotion
{
  return self->_motionMgr != 0;
}

- (void)_setGravity:(id)a3
{
  self->_gravitdouble y = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setUserAcceleration:(id)a3
{
  self->_userAcceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setAttitude:(GCQuaternion)a3
{
  self->_attitude = a3;
}

- (void)_setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (id)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong(&self->_internalValueChangedHandler, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);

  objc_storeStrong((id *)&self->_motionMgr, 0);
}

@end