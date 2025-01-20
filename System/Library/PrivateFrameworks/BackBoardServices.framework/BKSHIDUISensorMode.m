@interface BKSHIDUISensorMode
+ (BKSHIDUISensorMode)new;
+ (id)_prevailingMode:(id)a3;
+ (id)buildModeForReason:(id)a3 builder:(id)a4;
+ (id)protobufSchema;
- (BKSHIDUISensorMode)init;
- (BKSHIDUISensorMode)initWithCoder:(id)a3;
- (BOOL)_settingKeysAllowed:(id)a3;
- (BOOL)coverGestureEnabled;
- (BOOL)digitizerEnabled;
- (BOOL)estimatedProximityMode;
- (BOOL)isEffectivelyEqualToMode:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualExceptIdentifierAndReasons:(id)a3;
- (BOOL)isRestrictedToSystemShell;
- (BOOL)pocketTouchesExpected;
- (BOOL)postEventWithCurrentDetectionMask;
- (BOOL)tapToWakeEnabled;
- (BOOL)wakeOnLongPressEnabled;
- (BOOL)wakeOnLongPressThroughEnabled;
- (BOOL)wakeOnSwipeEnabled;
- (BOOL)wakeOnSwipeThroughEnabled;
- (BOOL)wakeOnTapThroughEnabled;
- (NSSet)multitouchHostStateKeys;
- (NSSet)proximityHostStateKeys;
- (NSString)_identifierDescription;
- (NSString)description;
- (NSString)reason;
- (id)_init;
- (id)_initCopyFrom:(id)a3;
- (id)didFinishProtobufDecodingWithError:(id *)a3;
- (id)initForProtobufDecoding;
- (id)mutableCopy;
- (int)proximityDetectionMode;
- (int64_t)_comparisonScore;
- (int64_t)displayState;
- (int64_t)identifier;
- (int64_t)versionedPID;
- (unint64_t)changeSource;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDUISensorMode

- (int)proximityDetectionMode
{
  return self->_proximityDetectionMode;
}

- (BOOL)pocketTouchesExpected
{
  return self->_pocketTouchesExpected;
}

- (BOOL)digitizerEnabled
{
  return self->_digitizerEnabled;
}

- (unint64_t)changeSource
{
  return self->_changeSource;
}

- (NSSet)multitouchHostStateKeys
{
  return self->_multitouchHostStateKeys;
}

- (int64_t)displayState
{
  return self->_displayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximityHostStateKeys, 0);
  objc_storeStrong((id *)&self->_multitouchHostStateKeys, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (NSSet)proximityHostStateKeys
{
  return self->_proximityHostStateKeys;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (int64_t)_comparisonScore
{
  unsigned int v3 = self->_proximityDetectionMode - 1;
  if (v3 > 0xC) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_18AA84FD8[v3];
  }
  if (self->_estimatedProximityMode) {
    v4 += 5000;
  }
  int64_t v5 = v4 + self->_postEventWithCurrentDetectionMask;
  if (self->_digitizerEnabled)
  {
    if ([(NSSet *)self->_multitouchHostStateKeys count])
    {
      v6 = (void *)[(NSSet *)self->_multitouchHostStateKeys mutableCopy];
      v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CoverGestureEnabled", @"WakeOnTapEnabled", @"WakeOnSwipeEnabled", 0);
      [v6 minusSet:v7];

      v5 += 100 * [v6 count];
    }
  }
  else
  {
    v5 += 100 * [(NSSet *)self->_multitouchHostStateKeys count] + 4000;
  }
  return v5;
}

- (BOOL)_settingKeysAllowed:(id)a3
{
  uint64_t v3 = _settingKeysAllowed__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_settingKeysAllowed__onceToken, &__block_literal_global_137);
  }
  char v5 = [v4 intersectsSet:_settingKeysAllowed__disallowedSettingKeys];

  return v5 ^ 1;
}

uint64_t __42__BKSHIDUISensorMode__settingKeysAllowed___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ScreenOn", @"DigitizerSurfaceCovered", @"PocketTouchesExpected", @"FaceTouchesExpected", 0);
  uint64_t v1 = _settingKeysAllowed__disallowedSettingKeys;
  _settingKeysAllowed__disallowedSettingKeys = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSString)_identifierDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"[M%d-%d]", self->_versionedPID, self->_identifier);
}

- (BOOL)isRestrictedToSystemShell
{
  unsigned int proximityDetectionMode = self->_proximityDetectionMode;
  BOOL result = 1;
  BOOL v5 = proximityDetectionMode > 0x14;
  int v6 = (1 << proximityDetectionMode) & 0x100030;
  BOOL v7 = v5 || v6 == 0;
  if (v7 && !self->_pocketTouchesExpected) {
    return [(BKSHIDUISensorMode *)self _comparisonScore] > 10;
  }
  return result;
}

- (BOOL)estimatedProximityMode
{
  return self->_estimatedProximityMode;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (BOOL)postEventWithCurrentDetectionMask
{
  return self->_postEventWithCurrentDetectionMask;
}

- (BOOL)wakeOnLongPressThroughEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"WakeOnLongPressThroughEnabled"];
}

- (BOOL)wakeOnSwipeThroughEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"WakeOnSwipeThroughEnabled"];
}

- (BOOL)wakeOnTapThroughEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"WakeOnTapThroughEnabled"];
}

- (BOOL)wakeOnLongPressEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"WakeOnLongPressEnabled"];
}

- (BOOL)wakeOnSwipeEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"WakeOnSwipeEnabled"];
}

- (BOOL)coverGestureEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"CoverGestureEnabled"];
}

- (BOOL)tapToWakeEnabled
{
  return [(NSSet *)self->_multitouchHostStateKeys containsObject:@"WakeOnTapEnabled"];
}

- (NSString)reason
{
  return self->_reason;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(BKSHIDUISensorMode *)self _settingKeysAllowed:self->_multitouchHostStateKeys])
  {
    BOOL v5 = self;
  }
  else
  {
    if (a3)
    {
      int v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28798];
      v8 = [NSString stringWithFormat:@"disallowed settings:%@", self->_multitouchHostStateKeys, *MEMORY[0x1E4F28588]];
      v12[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a3 = [v6 errorWithDomain:v7 code:22 userInfo:v9];
    }
    BOOL v5 = 0;
  }
  return v5;
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDUISensorMode;
  return [(BKSHIDUISensorMode *)&v3 init];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__BKSHIDUISensorMode_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __48__BKSHIDUISensorMode_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) _identifierDescription];
  [v2 appendString:v3 withName:0];

  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "_comparisonScore"), @"score");
  id v5 = *(void **)(a1 + 32);
  int v6 = BSProcessDescriptionForPID();
  [v5 appendString:v6 withName:0];

  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"reason"];
  uint64_t v7 = *(void *)(a1 + 40);
  unint64_t v8 = *(void *)(v7 + 32);
  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    v10 = NSStringFromBKSHIDUISensorChangeSource(v8);
    [v9 appendString:v10 withName:@"changeSource"];

    uint64_t v7 = *(void *)(a1 + 40);
  }
  uint64_t v11 = *(unsigned int *)(v7 + 40);
  if (v11)
  {
    v12 = *(void **)(a1 + 32);
    v13 = NSStringFromBKSHIDServicesProximityDetectionMode(v11);
    [v12 appendString:v13 withName:@"proximityDetectionMode"];

    uint64_t v7 = *(void *)(a1 + 40);
  }
  id v14 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(v7 + 72) withName:@"digitizerEnabled"];
  uint64_t v15 = *(void *)(a1 + 40);
  unint64_t v16 = *(void *)(v15 + 64);
  if (v16)
  {
    v17 = *(void **)(a1 + 32);
    v18 = NSStringFromBKSHIDUISensorDisplayState(v16);
    [v17 appendString:v18 withName:@"displayState"];

    uint64_t v15 = *(void *)(a1 + 40);
  }
  id v19 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(v15 + 73) withName:@"pocketTouchesExpected" ifEqualTo:1];
  id v20 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"multitouchHostStateKeys" skipIfNil:1];
  id v21 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"proximityHostStateKeys" skipIfNil:1];
  id v22 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 74) withName:@"estimatedProximityMode" ifEqualTo:1];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 75) withName:@"postEventWithCurrentDetectionMask" ifEqualTo:1];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopy
{
  objc_super v3 = [BKSMutableHIDUISensorMode alloc];
  return [(BKSHIDUISensorMode *)v3 _initCopyFrom:self];
}

- (id)_initCopyFrom:(id)a3
{
  id v4 = (id *)a3;
  id v5 = [(BKSHIDUISensorMode *)self _init];
  int v6 = v5;
  if (v5)
  {
    v5[1] = atomic_fetch_add(&_BKSNextUIModeIdentifier_staticIdentifier, 1uLL);
    uint64_t v7 = [v4[2] copy];
    unint64_t v8 = (void *)v6[2];
    v6[2] = v7;

    v6[3] = v4[3];
    void v6[4] = v4[4];
    *((_DWORD *)v6 + 10) = *((_DWORD *)v4 + 10);
    v6[8] = v4[8];
    *((unsigned char *)v6 + 72) = *((unsigned char *)v4 + 72);
    *((unsigned char *)v6 + 73) = *((unsigned char *)v4 + 73);
    uint64_t v9 = [v4[6] copy];
    v10 = (void *)v6[6];
    v6[6] = v9;

    uint64_t v11 = [v4[7] copy];
    v12 = (void *)v6[7];
    v6[7] = v11;

    *((unsigned char *)v6 + 74) = *((unsigned char *)v4 + 74);
    *((unsigned char *)v6 + 75) = *((unsigned char *)v4 + 75);
  }

  return v6;
}

- (BOOL)isEffectivelyEqualToMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = BSEqualObjects()
    && BSEqualObjects()
    && v4[10] == self->_proximityDetectionMode
    && *((unsigned __int8 *)v4 + 72) == self->_digitizerEnabled
    && *((void *)v4 + 8) == self->_displayState
    && *((unsigned __int8 *)v4 + 73) == self->_pocketTouchesExpected
    && *((unsigned __int8 *)v4 + 74) == self->_estimatedProximityMode
    && *((unsigned __int8 *)v4 + 75) == self->_postEventWithCurrentDetectionMask;

  return v5;
}

- (BOOL)isEqualExceptIdentifierAndReasons:(id)a3
{
  id v4 = (char *)a3;
  BOOL v5 = v4;
  BOOL v6 = *(_OWORD *)(v4 + 24) == *(_OWORD *)&self->_versionedPID
    && [(BKSHIDUISensorMode *)self isEffectivelyEqualToMode:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7;

  BOOL v9 = v8
    && v8[1] == self->_identifier
    && BSEqualObjects()
    && [(BKSHIDUISensorMode *)self isEqualExceptIdentifierAndReasons:v8];

  return v9;
}

- (unint64_t)hash
{
  [(NSString *)self->_reason hash];
  objc_super v3 = [NSNumber numberWithLongLong:self->_versionedPID];
  [v3 hash];

  id v4 = [NSNumber numberWithUnsignedInteger:self->_changeSource];
  [v4 hash];

  uint64_t v5 = [NSNumber numberWithInteger:self->_displayState];
  [v5 hash];

  id v6 = [NSNumber numberWithUnsignedInt:self->_proximityDetectionMode];
  [v6 hash];

  multitouchHostStateKeys = self->_multitouchHostStateKeys;
  if (multitouchHostStateKeys) {
    [(NSSet *)multitouchHostStateKeys hash];
  }
  proximityHostStateKeys = self->_proximityHostStateKeys;
  if (proximityHostStateKeys) {
    [(NSSet *)proximityHostStateKeys hash];
  }
  return BSHashPurifyNS();
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_identifier forKey:@"identifier"];
  reason = self->_reason;
  if (reason) {
    [v5 encodeObject:reason forKey:@"reason"];
  }
  [v5 encodeInt64:self->_versionedPID forKey:@"versionedPID"];
  [v5 encodeInteger:self->_changeSource forKey:@"changeSource"];
  [v5 encodeInteger:self->_proximityDetectionMode forKey:@"proximityDetectionMode"];
  [v5 encodeInteger:self->_displayState forKey:@"displayState"];
  [v5 encodeBool:self->_digitizerEnabled forKey:@"digitizerEnabled"];
  [v5 encodeBool:self->_pocketTouchesExpected forKey:@"pocketTouchesExpected"];
  [v5 encodeObject:self->_multitouchHostStateKeys forKey:@"multitouchHostStateKeys"];
  [v5 encodeObject:self->_proximityHostStateKeys forKey:@"proximityHostStateKeys"];
  [v5 encodeBool:self->_estimatedProximityMode forKey:@"estimatedProximityMode"];
  [v5 encodeBool:self->_postEventWithCurrentDetectionMask forKey:@"postEventWithCurrentDetectionMask"];
}

- (BKSHIDUISensorMode)initWithCoder:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BKSHIDUISensorMode;
  id v5 = [(BKSHIDUISensorMode *)&v44 init];
  v5->_identifier = [v4 decodeIntegerForKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
  reason = v5->_reason;
  v5->_reason = (NSString *)v6;

  v5->_versionedPID = [v4 decodeInt64ForKey:@"versionedPID"];
  v5->_changeSource = [v4 decodeIntegerForKey:@"changeSource"];
  v5->_unsigned int proximityDetectionMode = [v4 decodeIntegerForKey:@"proximityDetectionMode"];
  v5->_displayState = [v4 decodeIntegerForKey:@"displayState"];
  v5->_digitizerEnabled = [v4 decodeBoolForKey:@"digitizerEnabled"];
  v5->_pocketTouchesExpected = [v4 decodeBoolForKey:@"pocketTouchesExpected"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multitouchHostStateKeys"];
  multitouchHostStateKeys = v5->_multitouchHostStateKeys;
  v5->_multitouchHostStateKeys = (NSSet *)v8;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v10 = v5->_multitouchHostStateKeys;
  uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = *MEMORY[0x1E4F28798];
          uint64_t v50 = *MEMORY[0x1E4F28588];
          v24 = [NSString stringWithFormat:@"unsupported type in _multitouchHostStateKeys:%@", objc_opt_class()];
          v51 = v24;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v51;
          v27 = &v50;
LABEL_21:
          v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
          v29 = [v22 errorWithDomain:v23 code:22 userInfo:v28];
          [v4 failWithError:v29];

          goto LABEL_22;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSSet *)v10 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v10 = v5->_proximityHostStateKeys;
  uint64_t v15 = [(NSSet *)v10 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = *MEMORY[0x1E4F28798];
          uint64_t v47 = *MEMORY[0x1E4F28588];
          v24 = [NSString stringWithFormat:@"unsupported type in _proximityHostStateKeys:%@", objc_opt_class()];
          v48 = v24;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v48;
          v27 = &v47;
          goto LABEL_21;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSSet *)v10 countByEnumeratingWithState:&v36 objects:v49 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  if ([(BKSHIDUISensorMode *)v5 _settingKeysAllowed:v5->_multitouchHostStateKeys])
  {
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proximityHostStateKeys"];
    proximityHostStateKeys = v5->_proximityHostStateKeys;
    v5->_proximityHostStateKeys = (NSSet *)v19;

    v5->_estimatedProximityMode = [v4 decodeBoolForKey:@"estimatedProximityMode"];
    v5->_postEventWithCurrentDetectionMask = [v4 decodeBoolForKey:@"postEventWithCurrentDetectionMask"];
    id v21 = v5;
  }
  else
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28798];
    uint64_t v45 = *MEMORY[0x1E4F28588];
    v33 = [NSString stringWithFormat:@"disallowed settings:%@", v5->_multitouchHostStateKeys];
    v46 = v33;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v35 = [v31 errorWithDomain:v32 code:22 userInfo:v34];
    [v4 failWithError:v35];

LABEL_22:
    id v21 = 0;
  }

  return v21;
}

- (id)_init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)BKSHIDUISensorMode;
  objc_super v3 = [(BKSHIDUISensorMode *)&v11 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      uint64_t v5 = objc_opt_class();
      if (v5 != objc_opt_class())
      {
        uint64_t v7 = [NSString stringWithFormat:@"BKSUISensorMode cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = NSStringFromSelector(a2);
          BOOL v9 = (objc_class *)objc_opt_class();
          v10 = NSStringFromClass(v9);
          *(_DWORD *)buf = 138544642;
          uint64_t v13 = v8;
          __int16 v14 = 2114;
          uint64_t v15 = v10;
          __int16 v16 = 2048;
          uint64_t v17 = v3;
          __int16 v18 = 2114;
          uint64_t v19 = @"BKSHIDUISensorMode.m";
          __int16 v20 = 1024;
          int v21 = 120;
          __int16 v22 = 2114;
          uint64_t v23 = v7;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v7 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA67C8CLL);
      }
    }
    v3->_identifier = atomic_fetch_add(&_BKSNextUIModeIdentifier_staticIdentifier, 1uLL);
    v3->_versionedPID = BSGetVersionedPID();
  }
  return v3;
}

- (BKSHIDUISensorMode)init
{
  uint64_t v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDUISensorMode"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDUISensorMode.m";
    __int16 v17 = 1024;
    int v18 = 93;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  BOOL result = (BKSHIDUISensorMode *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)_prevailingMode:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_105];
  uint64_t v5 = [v4 lastObject];
  int v6 = [v5 proximityDetectionMode];
  if ([v5 digitizerEnabled] && !objc_msgSend(v5, "pocketTouchesExpected")
    || v6 == 20)
  {
    v27 = v4;
    id v28 = v3;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      unint64_t v7 = 0;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v8);
          }
          __int16 v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (v14 != v5)
          {
            if ([*(id *)(*((void *)&v29 + 1) + 8 * i) digitizerEnabled]
              && [v14 pocketTouchesExpected])
            {
              id v15 = v14;

              unint64_t v11 = (unint64_t)v15;
            }
            if (v6 == 20)
            {
              int v16 = [v14 proximityDetectionMode];
              if (v16 && v16 != 20)
              {
                id v18 = v14;

                unint64_t v7 = (unint64_t)v18;
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }
    else
    {
      unint64_t v11 = 0;
      unint64_t v7 = 0;
    }

    id v3 = v28;
    if (v11 | v7)
    {
      __int16 v19 = (void *)[v5 mutableCopy];
      uint64_t v20 = [v19 changeSource];
      if (!v20)
      {
        uint64_t v20 = [(id)v11 changeSource];
        if (!v20) {
          uint64_t v20 = [(id)v7 changeSource];
        }
      }
      [v19 setChangeSource:v20];
      int v21 = [v5 reason];
      __int16 v22 = (void *)[v21 mutableCopy];

      if (v11)
      {
        uint64_t v23 = [(id)v11 _identifierDescription];
        [v22 appendFormat:@" + pocketTouches(%@)", v23];

        [v19 setPocketTouchesExpected:1];
      }
      uint64_t v4 = v27;
      if (v7)
      {
        uint64_t v24 = [(id)v7 _identifierDescription];
        [v22 appendFormat:@" + prox(%@)", v24];

        objc_msgSend(v19, "setProximityDetectionMode:", objc_msgSend((id)v7, "proximityDetectionMode"));
      }
      [v19 setReason:v22];
      uint64_t v25 = [v19 copy];

      uint64_t v5 = (void *)v25;
    }
    else
    {
      uint64_t v4 = v27;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v5;
}

uint64_t __38__BKSHIDUISensorMode__prevailingMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 _comparisonScore];
  uint64_t v6 = [v4 _comparisonScore];

  return MEMORY[0x1F410C1A8](v5, v6);
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_10519];
}

void __36__BKSHIDUISensorMode_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_reason"];
  [v2 addField:"_versionedPID"];
  [v2 addField:"_changeSource"];
  [v2 addField:"_proximityDetectionMode"];
  [v2 addField:"_displayState"];
  [v2 addField:"_digitizerEnabled"];
  [v2 addField:"_pocketTouchesExpected"];
  [v2 addRepeatingField:"_multitouchHostStateKeys" containsClass:objc_opt_class()];
  [v2 addRepeatingField:"_proximityHostStateKeys" containsClass:objc_opt_class()];
  [v2 addField:"_estimatedProximityMode"];
  [v2 addField:"_postEventWithCurrentDetectionMask"];
}

+ (id)buildModeForReason:(id)a3 builder:(id)a4
{
  uint64_t v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v7 = [(BKSHIDUISensorMode *)[BKSMutableHIDUISensorMode alloc] _init];
  [v7 setReason:v6];

  v5[2](v5, v7);
  id v8 = (void *)[v7 copy];

  return v8;
}

+ (BKSHIDUISensorMode)new
{
  id v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDUISensorMode"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    int v16 = @"BKSHIDUISensorMode.m";
    __int16 v17 = 1024;
    int v18 = 98;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  BOOL result = (BKSHIDUISensorMode *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end