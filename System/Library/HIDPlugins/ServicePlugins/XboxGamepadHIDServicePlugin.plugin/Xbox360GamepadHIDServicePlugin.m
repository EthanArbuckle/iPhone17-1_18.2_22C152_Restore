@interface Xbox360GamepadHIDServicePlugin
- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (BOOL)shouldDisconnectWhenIdle;
- (NSString)description;
- (Xbox360GamepadHIDServicePlugin)initWithService:(unsigned int)a3;
- (float)defaultHapticDispatchFrequency;
- (id)defaultHapticMotors;
- (id)propertyForKey:(id)a3 client:(id)a4;
- (void)activate;
- (void)cancel;
- (void)dispatchHapticEvent;
- (void)handleControlSurfaceInputPayload:(int64_t)a3 withData:(id)a4 timestamp:(unint64_t)a5;
- (void)setLEDMode:(unsigned __int8)a3;
- (void)setupRawReportHandling;
@end

@implementation Xbox360GamepadHIDServicePlugin

- (Xbox360GamepadHIDServicePlugin)initWithService:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)Xbox360GamepadHIDServicePlugin;
  v3 = [(GCGamepadHIDServicePlugin *)&v7 initWithService:*(void *)&a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)activate
{
  v3 = _os_activity_create(&dword_0, "Activate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4.receiver = self;
  v4.super_class = (Class)Xbox360GamepadHIDServicePlugin;
  [(GCGamepadHIDServicePlugin *)&v4 activate];
  [(Xbox360GamepadHIDServicePlugin *)self setLEDMode:6];
  os_activity_scope_leave(&state);
}

- (void)cancel
{
  v3 = _os_activity_create(&dword_0, "Cancel", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4.receiver = self;
  v4.super_class = (Class)Xbox360GamepadHIDServicePlugin;
  [(GCGamepadHIDServicePlugin *)&v4 cancel];
  os_activity_scope_leave(&state);
}

- (BOOL)shouldDisconnectWhenIdle
{
  return 0;
}

- (NSString)description
{
  return (NSString *)@"Xbox360GamepadHIDServicePlugin";
}

- (id)propertyForKey:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"LEDMode"])
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedChar:self->_ledMode];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)Xbox360GamepadHIDServicePlugin;
    uint64_t v8 = [(GCGamepadHIDServicePlugin *)&v11 propertyForKey:v6 client:v7];
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"LEDMode"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[Xbox360GamepadHIDServicePlugin setLEDMode:](self, "setLEDMode:", [v8 unsignedIntValue]);
    }
    BOOL v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)Xbox360GamepadHIDServicePlugin;
    BOOL v11 = [(GCGamepadHIDServicePlugin *)&v13 setProperty:v8 forKey:v9 client:v10];
  }

  return v11;
}

- (void)setLEDMode:(unsigned __int8)a3
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_0, "Set LED Mode", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = self;
  objc_sync_enter(v6);
  v6->_ledMode = a3;
  objc_sync_exit(v6);

  id v7 = [(GCGamepadHIDServicePlugin *)v6 dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8FD4;
  v8[3] = &unk_10728;
  unsigned __int8 v9 = a3;
  v8[4] = v6;
  dispatch_async(v7, v8);
}

- (void)setupRawReportHandling
{
  objc_initWeak(&location, self);
  v3 = [(GCGamepadHIDServicePlugin *)self device];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9194;
  v4[3] = &unk_105D8;
  objc_copyWeak(&v5, &location);
  [v3 setInputReportHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleControlSurfaceInputPayload:(int64_t)a3 withData:(id)a4 timestamp:(unint64_t)a5
{
  id v8 = a4;
  unsigned __int8 v9 = [v8 bytes];
  id v10 = [v8 length];

  if ((unint64_t)v10 <= 0x13)
  {
    v28 = sub_2178();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_9BCC(a3, (uint64_t)v10, v28);
    }
  }
  else
  {
    unsigned int v14 = *((unsigned __int16 *)v9 + 1);
    LOBYTE(v11) = v9[4];
    *(float *)&unsigned int v15 = (float)v11;
    float v16 = *(float *)&v15 / 255.0;
    LOBYTE(v15) = v9[5];
    float v17 = (float)v15;
    float v32 = v16;
    *(float *)&uint64_t v12 = (float)*((__int16 *)v9 + 3) / 32767.0;
    float v18 = (float)*((__int16 *)v9 + 4) / 32767.0;
    float v19 = (float)*((__int16 *)v9 + 6) / 32767.0;
    float v20 = fmaxf(v18, 0.0);
    if (v18 >= 0.0) {
      float v21 = 0.0;
    }
    else {
      float v21 = -v18;
    }
    float v30 = -*(float *)&v12;
    float v22 = fmaxf(v19, 0.0);
    if (v19 >= 0.0) {
      float v23 = 0.0;
    }
    else {
      float v23 = -v19;
    }
    *(float *)&unsigned int v31 = (float)*((__int16 *)v9 + 5) / 32767.0;
    float v24 = v17 / 255.0;
    -[GCGamepadHIDServicePlugin dispatchHomeButtonEventWithValue:timestamp:](self, "dispatchHomeButtonEventWithValue:timestamp:", (v14 >> 10) & 1, a5, v12, v13);
    [(GCGamepadHIDServicePlugin *)self dispatchMenuButtonEventWithValue:(*((unsigned __int16 *)v9 + 1) >> 4) & 1 timestamp:a5];
    [(GCGamepadHIDServicePlugin *)self dispatchOptionsButtonEventWithValue:(*((unsigned __int16 *)v9 + 1) >> 5) & 1 timestamp:a5];
    float v34 = (float)(v14 & 1);
    uint32x2_t v25 = (uint32x2_t)vdup_n_s32(v14);
    uint64_t v33 = 0;
    float32x2_t v35 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32((uint32x2_t)(*(void *)&v25 & 0xFFFF00FFFFFF00FFLL), (uint32x2_t)0xFFFFFFFEFFFFFFFFLL) & 0xFFFFFF01FFFFFF01));
    float v36 = (float)((v14 >> 3) & 1);
    float32x2_t v37 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32(v25, (uint32x2_t)0xFFFFFFF3FFFFFFF4) & 0xFFFFFFF1FFFFFFF1));
    float v38 = (float)((v14 >> 14) & 1);
    float v39 = (float)(v14 >> 15);
    float32x2_t v40 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32(v25, (uint32x2_t)0xFFFFFFF7FFFFFFF8) & 0xFFFFFF01FFFFFF01));
    float v41 = v20;
    float v42 = v21;
    v26.i32[0] = 0;
    v26.i32[1] = v29;
    v27.i32[0] = 0;
    int8x8_t v43 = vand_s8((int8x8_t)__PAIR64__(v29, LODWORD(v30)), (int8x8_t)vcgt_f32(v26, (float32x2_t)v29));
    v27.i32[1] = v31;
    float v44 = v22;
    float v45 = v23;
    int8x8_t v46 = vand_s8((int8x8_t)__PAIR64__(v31, -*(float *)&v31), (int8x8_t)vcgt_f32(v27, (float32x2_t)v31));
    float v47 = v32;
    float v48 = v24;
    float v49 = (float)((v14 >> 6) & 1);
    float v50 = (float)((v14 >> 7) & 1);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v57 = 0;
    [(GCGamepadHIDServicePlugin *)self dispatchGameControllerExtendedEventWithState:&v33 timestamp:a5];
  }
}

- (void)dispatchHapticEvent
{
  uint64_t v11 = 2048;
  v3 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
  objc_super v4 = [v3 objectAtIndex:0];
  [v4 frequency];
  *(_DWORD *)((char *)&v11 + 3) = (int)(float)(v5 * 255.0);

  id v6 = [(GCGamepadHIDServicePlugin *)self hapticMotors];
  id v7 = [v6 objectAtIndex:1];
  [v7 frequency];
  WORD2(v11) = (int)(float)(v8 * 255.0);

  unsigned __int8 v9 = [(GCGamepadHIDServicePlugin *)self device];
  uint64_t v10 = 0;
  [v9 setReport:&v11 reportLength:8 withIdentifier:0 forType:1 error:&v10];
}

- (float)defaultHapticDispatchFrequency
{
  return 0.008;
}

- (id)defaultHapticMotors
{
  v2 = [[GCHapticMotor alloc] initWithIndex:0 name:@"Left"];
  v6[0] = v2;
  v3 = [[GCHapticMotor alloc] initWithIndex:1 name:@"Right"];
  v6[1] = v3;
  objc_super v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

@end