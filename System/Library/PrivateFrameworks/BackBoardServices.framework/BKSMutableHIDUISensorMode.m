@interface BKSMutableHIDUISensorMode
- (BKSMutableHIDUISensorMode)initWithReason:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setMultitouchSettingKey:(id)a3 enabled:(BOOL)a4;
- (void)setChangeSource:(unint64_t)a3;
- (void)setCoverGestureEnabled:(BOOL)a3;
- (void)setDigitizerEnabled:(BOOL)a3;
- (void)setDisplayState:(int64_t)a3;
- (void)setEstimatedProximityMode:(BOOL)a3;
- (void)setMultitouchHostStateKeys:(id)a3;
- (void)setPocketTouchesExpected:(BOOL)a3;
- (void)setPostEventWithCurrentDetectionMask:(BOOL)a3;
- (void)setProximityDetectionMode:(int)a3;
- (void)setProximityHostStateKeys:(id)a3;
- (void)setReason:(id)a3;
- (void)setTapToWakeEnabled:(BOOL)a3;
- (void)setVersionedPID:(int64_t)a3;
- (void)setWakeOnLongPressEnabled:(BOOL)a3;
- (void)setWakeOnLongTapThroughEnabled:(BOOL)a3;
- (void)setWakeOnSwipeEnabled:(BOOL)a3;
- (void)setWakeOnSwipeThroughEnabled:(BOOL)a3;
- (void)setWakeOnTapThroughEnabled:(BOOL)a3;
@end

@implementation BKSMutableHIDUISensorMode

- (void)_setMultitouchSettingKey:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  multitouchHostStateKeys = self->super._multitouchHostStateKeys;
  if (v4)
  {
    id v11 = v6;
    if (multitouchHostStateKeys) {
      [(NSSet *)multitouchHostStateKeys setByAddingObject:v6];
    }
    else {
    v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    }
    goto LABEL_10;
  }
  if (multitouchHostStateKeys)
  {
    id v11 = v6;
    multitouchHostStateKeys = (NSSet *)[(NSSet *)multitouchHostStateKeys containsObject:v6];
    id v6 = v11;
    if (multitouchHostStateKeys)
    {
      NSUInteger v8 = [(NSSet *)self->super._multitouchHostStateKeys count];
      v9 = self->super._multitouchHostStateKeys;
      if (v8 == 1)
      {
        v10 = 0;
LABEL_11:
        self->super._multitouchHostStateKeys = v10;

        id v6 = v11;
        goto LABEL_12;
      }
      v10 = (NSSet *)[(NSSet *)v9 mutableCopy];
      [(NSSet *)v10 removeObject:v11];
LABEL_10:
      v9 = self->super._multitouchHostStateKeys;
      goto LABEL_11;
    }
  }
LABEL_12:
  MEMORY[0x1F41817F8](multitouchHostStateKeys, v6);
}

- (void)setEstimatedProximityMode:(BOOL)a3
{
  self->super._estimatedProximityMode = a3;
}

- (void)setVersionedPID:(int64_t)a3
{
  self->super._versionedPID = a3;
}

- (void)setPostEventWithCurrentDetectionMask:(BOOL)a3
{
  self->super._postEventWithCurrentDetectionMask = a3;
}

- (void)setWakeOnLongTapThroughEnabled:(BOOL)a3
{
}

- (void)setWakeOnSwipeThroughEnabled:(BOOL)a3
{
}

- (void)setWakeOnTapThroughEnabled:(BOOL)a3
{
}

- (void)setWakeOnLongPressEnabled:(BOOL)a3
{
}

- (void)setWakeOnSwipeEnabled:(BOOL)a3
{
}

- (void)setCoverGestureEnabled:(BOOL)a3
{
}

- (void)setTapToWakeEnabled:(BOOL)a3
{
}

- (void)setProximityHostStateKeys:(id)a3
{
  if (self->super._proximityHostStateKeys != a3)
  {
    BOOL v4 = (NSSet *)[a3 copy];
    proximityHostStateKeys = self->super._proximityHostStateKeys;
    self->super._proximityHostStateKeys = v4;
    MEMORY[0x1F41817F8](v4, proximityHostStateKeys);
  }
}

- (void)setMultitouchHostStateKeys:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (NSSet *)a3;
  id v6 = v5;
  if (self->super._multitouchHostStateKeys != v5)
  {
    v13 = v5;
    if (![(BKSHIDUISensorMode *)self _settingKeysAllowed:v5])
    {
      v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self _settingKeysAllowed:multitouchHostStateKeys]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v10 = NSStringFromSelector(a2);
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138544642;
        v15 = v10;
        __int16 v16 = 2114;
        v17 = v12;
        __int16 v18 = 2048;
        v19 = self;
        __int16 v20 = 2114;
        v21 = @"BKSHIDUISensorMode.m";
        __int16 v22 = 1024;
        int v23 = 667;
        __int16 v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA664E4);
    }
    v7 = (NSSet *)[(NSSet *)v13 copy];
    multitouchHostStateKeys = self->super._multitouchHostStateKeys;
    self->super._multitouchHostStateKeys = v7;

    id v6 = v13;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setPocketTouchesExpected:(BOOL)a3
{
  self->super._pocketTouchesExpected = a3;
}

- (void)setDigitizerEnabled:(BOOL)a3
{
  self->super._digitizerEnabled = a3;
}

- (void)setDisplayState:(int64_t)a3
{
  self->super._displayState = a3;
}

- (void)setProximityDetectionMode:(int)a3
{
  self->super._proximityDetectionMode = a3;
}

- (void)setChangeSource:(unint64_t)a3
{
  self->super._changeSource = a3;
}

- (void)setReason:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  if (!v23)
  {
    v9 = NSStringFromClass(v6);
    v10 = [v5 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      v25 = v11;
      __int16 v26 = 2114;
      v27 = v13;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDUISensorMode.m";
      __int16 v32 = 1024;
      int v33 = 634;
      __int16 v34 = 2114;
      v35 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA666E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = NSString;
    v15 = (objc_class *)[v23 classForCoder];
    if (!v15) {
      v15 = (objc_class *)objc_opt_class();
    }
    __int16 v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v16, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = NSStringFromSelector(a2);
      v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      v25 = v20;
      __int16 v26 = 2114;
      v27 = v22;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDUISensorMode.m";
      __int16 v32 = 1024;
      int v33 = 634;
      __int16 v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA66818);
  }

  v7 = (NSString *)[v23 copy];
  reason = self->super._reason;
  self->super._reason = v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [BKSHIDUISensorMode alloc];
  return [(BKSHIDUISensorMode *)v4 _initCopyFrom:self];
}

- (id)copy
{
  v3 = [BKSHIDUISensorMode alloc];
  return [(BKSHIDUISensorMode *)v3 _initCopyFrom:self];
}

- (BKSMutableHIDUISensorMode)initWithReason:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSMutableHIDUISensorMode;
  v5 = [(BKSHIDUISensorMode *)&v8 _init];
  id v6 = v5;
  if (v5) {
    [(BKSMutableHIDUISensorMode *)v5 setReason:v4];
  }

  return v6;
}

@end