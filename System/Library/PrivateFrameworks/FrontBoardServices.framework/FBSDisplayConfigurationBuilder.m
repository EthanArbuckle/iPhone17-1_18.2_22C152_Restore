@interface FBSDisplayConfigurationBuilder
- (FBSDisplayConfigurationBuilder)init;
- (FBSDisplayConfigurationBuilder)initWithConfiguration:(id)a3;
- (id)_lock_sanitizedModeForMode:(id)a3;
- (id)buildConfigurationWithError:(id *)a3;
- (void)setCloningNotSupported;
- (void)setCloningSupported:(BOOL)a3;
- (void)setCurrentMode:(id)a3 preferredMode:(id)a4 otherModes:(id)a5;
- (void)setExpectsSecureRendering;
- (void)setOverscanned:(BOOL)a3 compensation:(int64_t)a4 safeRatio:(CGSize)a5;
- (void)setPixelSize:(CGSize)a3 nativeBounds:(CGRect)a4 bounds:(CGRect)a5;
- (void)setUIKitMainLike;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation FBSDisplayConfigurationBuilder

- (FBSDisplayConfigurationBuilder)init
{
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@ is not allowed for %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    v13 = v9;
    __int16 v14 = 2114;
    v15 = v11;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = @"FBSDisplayConfigurationBuilder.m";
    __int16 v20 = 1024;
    int v21 = 48;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSDisplayConfigurationBuilder)initWithConfiguration:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Fbsdisplayconf_0.isa);
  if (!v4)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfigurationBuilder initWithConfiguration:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfigurationBuilder initWithConfiguration:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }

  v11.receiver = self;
  v11.super_class = (Class)FBSDisplayConfigurationBuilder;
  v5 = [(FBSDisplayConfigurationBuilder *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (FBSDisplayConfiguration *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)_lock_sanitizedModeForMode:(id)a3
{
  id v4 = (char *)a3;
  if (!v4)
  {
    __int16 v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"mode"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  v5 = v4;
  uint64_t v6 = [(FBSDisplayConfiguration *)self->_configuration availableModes];
  int v7 = [v6 containsObject:v5];

  if (v7
    || (int64_t v8 = [(FBSDisplayConfiguration *)self->_configuration _nativeRotation],
        uint64_t v9 = *((void *)v5 + 8),
        v8 == v9)
    && v5[72])
  {
    v10 = v5;
  }
  else
  {
    int v11 = ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 1) ^ ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 1);
    BOOL v12 = v11 == 0;
    if (v11) {
      v13 = &OBJC_IVAR___FBSDisplayMode__height;
    }
    else {
      v13 = &OBJC_IVAR___FBSDisplayMode__width;
    }
    uint64_t v14 = *(void *)&v5[*v13];
    if (v12) {
      v15 = &OBJC_IVAR___FBSDisplayMode__height;
    }
    else {
      v15 = &OBJC_IVAR___FBSDisplayMode__width;
    }
    LOBYTE(v19) = 1;
    v10 = [[FBSDisplayMode alloc] _initWithWidth:*(void *)&v5[*v15] height:v14 preferredScale:*((void *)v5 + 3) scaleOverride:*((void *)v5 + 6) refreshRate:*((void *)v5 + 7) gamut:v8 hdr:*((double *)v5 + 4) rotation:*((double *)v5 + 5) virtual:v19 validityCheck:2];
  }
  __int16 v16 = v10;

  return v16;
}

- (id)buildConfigurationWithError:(id *)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(FBSDisplayConfiguration *)self->_configuration identity];
  if (*(_WORD *)&self->_lock_secure || self->_lock_uniqueIdentifier)
  {
    uint64_t v6 = [FBSDisplayIdentity alloc];
    if (self->_lock_mainLike) {
      int v7 = 1;
    }
    else {
      int v7 = *(unsigned __int8 *)(v5 + 52);
    }
    lock_uniqueIdentifier = self->_lock_uniqueIdentifier;
    if (!lock_uniqueIdentifier) {
      lock_uniqueIdentifier = *(NSString **)(v5 + 8);
    }
    BOOL v9 = self->_lock_secure || *(unsigned char *)(v5 + 54) != 0;
    BOOL v10 = v7 != 0;
    uint64_t v11 = *(void *)(v5 + 16);
    if (!v11) {
      uint64_t v11 = v5;
    }
    LOBYTE(v83) = v9;
    LOBYTE(v82) = *(unsigned char *)(v5 + 53) != 0;
    uint64_t v12 = [(FBSDisplayIdentity *)v6 _initWithType:*(void *)(v5 + 24) UIKitMainLike:v10 displayID:*(unsigned int *)(v5 + 40) connectionType:*(void *)(v5 + 32) connectionSeed:*(unsigned int *)(v5 + 44) pid:*(unsigned int *)(v5 + 48) external:v82 uniqueIdentifier:lock_uniqueIdentifier secure:v83 root:v11];

    uint64_t v5 = v12;
  }
  v13 = self->_configuration->_currentMode;
  uint64_t v14 = self->_configuration->_preferredMode;
  v15 = self->_configuration->_otherModes;
  lock_currentMode = self->_lock_currentMode;
  BOOL v17 = lock_currentMode != 0;
  if (!lock_currentMode)
  {
    id v33 = 0;
    __int16 v18 = v13;
    goto LABEL_23;
  }
  __int16 v18 = -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:](self, "_lock_sanitizedModeForMode:");

  if (!v18)
  {
    uint64_t v35 = __displayBuilderError(1, @"sanitizing currentMode failed : %@ : base=%@", v19, v20, v21, v22, v23, v24, (uint64_t)self->_lock_currentMode);
    if (v35)
    {
      id v33 = (id)v35;
      __int16 v18 = 0;
LABEL_23:
      v34 = v15;
      if (v33) {
        goto LABEL_24;
      }
      goto LABEL_40;
    }
  }
  BOOL v91 = v17;
  if (self->_lock_preferredMode)
  {
    uint64_t v25 = -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:](self, "_lock_sanitizedModeForMode:");

    uint64_t v14 = (FBSDisplayMode *)v25;
    if (!v25)
    {
      uint64_t v32 = __displayBuilderError(2, @"sanitizing preferredMode failed : %@ : base=%@", v26, v27, v28, v29, v30, v31, (uint64_t)self->_lock_preferredMode);
      if (v32)
      {
        id v33 = (id)v32;
        v34 = v15;
        goto LABEL_39;
      }
    }
  }
  else
  {

    uint64_t v14 = 0;
  }
  v92 = v18;
  v34 = [MEMORY[0x1E4F1CA80] setWithCapacity:-[NSSet count](v15, "count")];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v37 = self->_lock_otherModes;
  id v33 = (id)[(NSSet *)v37 countByEnumeratingWithState:&v94 objects:v98 count:16];
  if (v33)
  {
    v87 = p_lock;
    v89 = v14;
    uint64_t v38 = *(void *)v95;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v95 != v38) {
          objc_enumerationMutation(v37);
        }
        uint64_t v40 = *(void *)(*((void *)&v94 + 1) + 8 * i);
        uint64_t v41 = [(FBSDisplayConfigurationBuilder *)self _lock_sanitizedModeForMode:v40];
        if (!v41)
        {
          __displayBuilderError(3, @"sanitizing otherMode failed : %@ : base=%@", v42, v43, v44, v45, v46, v47, v40);
          id v33 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
        v48 = (void *)v41;
        [v34 addObject:v41];
      }
      id v33 = (id)[(NSSet *)v37 countByEnumeratingWithState:&v94 objects:v98 count:16];
      if (v33) {
        continue;
      }
      break;
    }
LABEL_37:
    p_lock = v87;
    uint64_t v14 = v89;
  }

  __int16 v18 = v92;
LABEL_39:
  BOOL v17 = v91;
  if (v33)
  {
LABEL_24:
    os_unfair_lock_unlock(p_lock);
    if (*a3)
    {
      id v33 = v33;
      v36 = 0;
      *a3 = v33;
    }
    else
    {
      v36 = 0;
    }
    goto LABEL_60;
  }
LABEL_40:
  configuration = self->_configuration;
  if (self->_lock_geometrySet)
  {
    p_lock_pixelSize = &self->_lock_pixelSize;
    p_height = &self->_lock_pixelSize.height;
    p_lock_nativeBounds = &self->_lock_nativeBounds;
    p_y = &self->_lock_nativeBounds.origin.y;
    p_size = &self->_lock_nativeBounds.size;
    v55 = &self->_lock_nativeBounds.size.height;
    p_lock_bounds = &self->_lock_bounds;
    v57 = &self->_lock_bounds.origin.y;
    v58 = &self->_lock_bounds.size;
    v59 = &self->_lock_bounds.size.height;
    BOOL v17 = 1;
  }
  else
  {
    p_lock_bounds = &configuration->_bounds;
    v59 = &configuration->_bounds.size.height;
    v58 = &configuration->_bounds.size;
    v57 = &configuration->_bounds.origin.y;
    p_lock_nativeBounds = &configuration->_nativeBounds;
    v55 = &configuration->_nativeBounds.size.height;
    p_size = &configuration->_nativeBounds.size;
    p_y = &configuration->_nativeBounds.origin.y;
    p_lock_pixelSize = &configuration->_pixelSize;
    p_height = &configuration->_pixelSize.height;
  }
  p_cloningSupported = &configuration->_cloningSupported;
  char v61 = self->_lock_cloningSet || v17;
  if (self->_lock_cloningSet) {
    p_cloningSupported = &self->_lock_cloningSupported;
  }
  if (self->_lock_overscanSet)
  {
    p_lock_overscanned = &self->_lock_overscanned;
    p_lock_overscanCompensation = &self->_lock_overscanCompensation;
    p_lock_safeOverscanRatio = &self->_lock_safeOverscanRatio;
    v65 = &self->_lock_safeOverscanRatio.height;
    char v61 = 1;
  }
  else
  {
    p_lock_safeOverscanRatio = &configuration->_safeOverscanRatio;
    v65 = &configuration->_safeOverscanRatio.height;
    p_lock_overscanCompensation = &configuration->_overscanCompensation;
    p_lock_overscanned = &configuration->_overscanned;
  }
  uint64_t v66 = *(void *)v59;
  CGFloat width = v58->width;
  uint64_t v68 = *(void *)v57;
  CGFloat x = p_lock_bounds->origin.x;
  double v88 = p_size->width;
  double v90 = *v55;
  double v85 = p_lock_nativeBounds->origin.x;
  double v86 = *p_y;
  double v70 = *p_height;
  double v71 = p_lock_pixelSize->width;
  BOOL v72 = *p_cloningSupported;
  double v73 = *v65;
  double v74 = p_lock_safeOverscanRatio->width;
  uint64_t v75 = *p_lock_overscanCompensation;
  BOOL v76 = *p_lock_overscanned;
  os_unfair_lock_unlock(p_lock);
  v77 = [FBSDisplayConfiguration alloc];
  v78 = self->_configuration;
  BOOL v79 = (v61 & 1) == 0 && v78->_noEqual_comparable;
  BYTE1(v84) = v76;
  LOBYTE(v84) = v72;
  uint64_t v80 = -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:](v77, "_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:", v5, v78->_hardwareIdentifier, v78->_name, v78->_deviceName, v78->_noEqual_seed, v79, v74, v73, v71, v70, v85, v86, v88, v90, v78->_tags,
          v18,
          v14,
          v34,
          v84,
          v75,
          *(void *)&x,
          v68,
          *(void *)&width,
          v66,
          *(void *)&v78->_latency,
          v78,
          2);
  if (!v80)
  {
    FBSDisplayOverscanCompensationDescription(v75);
    objc_claimAutoreleasedReturnValue();
    BSNSStringFromCGSize();
  }
  v36 = (id *)v80;
  if ((v61 & 1) == 0) {
    objc_storeStrong((id *)(v80 + 176), self->_configuration->_immutableCADisplay);
  }
  objc_storeStrong(v36 + 23, self->_configuration->_caDisplay);
  id v33 = 0;
LABEL_60:

  return v36;
}

- (void)setUniqueIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSString *)[v5 copy];

  lock_uniqueIdentifier = self->_lock_uniqueIdentifier;
  self->_lock_uniqueIdentifier = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setCurrentMode:(id)a3 preferredMode:(id)a4 otherModes:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Fbsdisplaymode.isa);
  if (v11)
  {
    if (objc_opt_isKindOfClass())
    {

      id v12 = v9;
      NSClassFromString(&cfstr_Fbsdisplaymode.isa);
      if (v12)
      {
        if (objc_opt_isKindOfClass())
        {

          id v13 = v10;
          if (!v13 || (NSClassFromString(&cfstr_Nsset.isa), (objc_opt_isKindOfClass() & 1) != 0))
          {

            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v14 = v13;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v31 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  id v19 = *(id *)(*((void *)&v30 + 1) + 8 * i);
                  NSClassFromString(&cfstr_Fbsdisplaymode.isa);
                  if (!v19)
                  {
                    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.4();
                    }
                    [v23 UTF8String];
                    _bs_set_crash_log_message();
                  }
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"];
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.4();
                    }
                    [v24 UTF8String];
                    _bs_set_crash_log_message();
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
              }
              while (v16);
            }

            os_unfair_lock_lock(&self->_lock);
            uint64_t v20 = (void *)[v14 mutableCopy];
            [v20 removeObject:v11];
            [v20 removeObject:v12];
            uint64_t v21 = (FBSDisplayMode *)[v11 copy];
            lock_currentMode = self->_lock_currentMode;
            self->_lock_currentMode = v21;

            BSEqualObjects();
          }
          uint64_t v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSSetClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.6();
          }
          [v29 UTF8String];
          _bs_set_crash_log_message();
        }
        uint64_t v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:]();
        }
        [v28 UTF8String];
        _bs_set_crash_log_message();
      }
      uint64_t v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:]();
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:]();
  }
  [v25 UTF8String];
  _bs_set_crash_log_message();
}

- (void)setPixelSize:(CGSize)a3 nativeBounds:(CGRect)a4 bounds:(CGRect)a5
{
  if (a3.width <= 0.0 || a3.width > 100000.0 || a3.height <= 0.0 || a3.height > 100000.0) {
    BSNSStringFromCGSize();
  }
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  if (CGRectIsEmpty(a4)
    || (v12.origin.x = x, v12.origin.y = y, v12.size.CGFloat width = width, v12.size.height = height, CGRectIsInfinite(v12)))
  {
    BSNSStringFromCGRect();
  }
  if (CGRectIsEmpty(a5) || CGRectIsInfinite(a5)) {
    BSNSStringFromCGRect();
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_geometrySet = 1;
  self->_lock_pixelSize = a3;
  self->_lock_nativeBounds.origin.CGFloat x = x;
  self->_lock_nativeBounds.origin.CGFloat y = y;
  self->_lock_nativeBounds.size.CGFloat width = width;
  self->_lock_nativeBounds.size.CGFloat height = height;
  self->_lock_bounds = a5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setExpectsSecureRendering
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_secure = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)setUIKitMainLike
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_mainLike = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)setCloningNotSupported
{
}

- (void)setCloningSupported:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_cloningSet = 1;
  self->_lock_cloningSupported = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setOverscanned:(BOOL)a3 compensation:(int64_t)a4 safeRatio:(CGSize)a5
{
  if (FBSDisplayOverscanCompensationIsValid(a4)) {
    BSFloatGreaterThanOrEqualToFloat();
  }
  uint64_t v6 = NSString;
  int v7 = FBSDisplayOverscanCompensationDescription(a4);
  id v8 = [v6 stringWithFormat:@"invalid compensation : %@", v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSDisplayConfigurationBuilder setOverscanned:compensation:safeRatio:]();
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_otherModes, 0);
  objc_storeStrong((id *)&self->_lock_preferredMode, 0);
  objc_storeStrong((id *)&self->_lock_currentMode, 0);
  objc_storeStrong((id *)&self->_lock_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_sanitizedModeForMode:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.6()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setPixelSize:nativeBounds:bounds:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setPixelSize:nativeBounds:bounds:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setPixelSize:nativeBounds:bounds:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setOverscanned:compensation:safeRatio:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setOverscanned:compensation:safeRatio:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end