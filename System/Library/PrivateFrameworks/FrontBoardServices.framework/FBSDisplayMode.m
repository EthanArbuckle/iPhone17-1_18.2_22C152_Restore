@interface FBSDisplayMode
+ (BOOL)supportsSecureCoding;
+ (id)_emptyMode;
- (BOOL)_isVirtualMode;
- (BOOL)isEqual:(id)a3;
- (CGSize)nativePixelSize;
- (CGSize)pixelSize;
- (CGSize)size;
- (FBSDisplayMode)init;
- (FBSDisplayMode)initWithCoder:(id)a3;
- (FBSDisplayMode)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (double)_caRefreshRate;
- (double)pointScale;
- (double)refreshRate;
- (id)_caColorGamut;
- (id)_caHDRMode;
- (id)_copyWithOverrideSize:(CGSize)a3;
- (id)_copyWithOverrideSize:(CGSize)a3 scale:(double)a4;
- (id)_initWithCADisplayMode:(id)a3 scale:(double)a4 rotation:(int64_t)a5;
- (id)_initWithWidth:(unint64_t)a3 height:(unint64_t)a4 preferredScale:(unint64_t)a5 scaleOverride:(double)a6 refreshRate:(double)a7 gamut:(int64_t)a8 hdr:(int64_t)a9 rotation:(int64_t)a10 virtual:(BOOL)a11 validityCheck:(int64_t)a12;
- (id)_initWithWidth:(unint64_t)a3 height:(unint64_t)a4 scale:(unint64_t)a5 refreshRate:(double)a6 gamut:(int64_t)a7 hdr:(int64_t)a8;
- (id)_referenceSizeDescription;
- (int64_t)_rotation;
- (int64_t)colorGamut;
- (int64_t)hdrMode;
- (unint64_t)_caHeight;
- (unint64_t)_caPreferredScale;
- (unint64_t)_caWidth;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSDisplayMode

- (unint64_t)hash
{
  v3 = [off_1E58F4508 builder];
  id v4 = (id)[v3 appendSizeT:self->_width];
  id v5 = (id)[v3 appendSizeT:self->_height];
  id v6 = (id)[v3 appendSizeT:self->_preferredScale];
  id v7 = (id)[v3 appendCGFloat:self->_scaleOverride];
  id v8 = (id)[v3 appendDouble:self->_refreshRate];
  id v9 = (id)[v3 appendInteger:self->_gamut];
  id v10 = (id)[v3 appendInteger:self->_hdr];
  id v11 = (id)[v3 appendInteger:self->_rotation];
  id v12 = (id)[v3 appendBool:self->_virtual];
  unint64_t v13 = [v3 hash];

  return v13;
}

- (NSString)description
{
}

- (int64_t)colorGamut
{
  return self->_gamut;
}

- (double)refreshRate
{
  return self->_refreshRate;
}

- (id)_referenceSizeDescription
{
}

- (int64_t)hdrMode
{
  return self->_hdr;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    xpc_dictionary_set_uint64(v4, (const char *)[@"width" UTF8String], self->_width);
    xpc_dictionary_set_uint64(xdict, (const char *)[@"height" UTF8String], self->_height);
    if (self->_preferredScale) {
      xpc_dictionary_set_uint64(xdict, (const char *)[@"preferredScale" UTF8String], self->_preferredScale);
    }
    BSFloatIsZero();
  }
}

+ (id)_emptyMode
{
  if (_emptyMode_onceToken != -1) {
    dispatch_once(&_emptyMode_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)_emptyMode___emptyMode;

  return v2;
}

- (id)_initWithCADisplayMode:(id)a3 scale:(double)a4 rotation:(int64_t)a5
{
  id v9 = a3;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"FBSDisplayMode.m", 42, @"Invalid parameter not satisfying: %@", @"caMode" object file lineNumber description];
  }
  uint64_t v10 = [v9 width];
  uint64_t v11 = [v9 height];
  uint64_t v12 = [v9 preferredScale];
  [v9 refreshRate];
  double v14 = v13;
  v15 = [v9 colorGamut];
  v16 = FBSDisplayGamutFromCADisplayGamut(v15);
  v17 = [v9 hdrMode];
  LOBYTE(v21) = 0;
  id v18 = [(FBSDisplayMode *)self _initWithWidth:v10 height:v11 preferredScale:v12 scaleOverride:v16 refreshRate:FBSDisplayHDRModeFromCADisplayHDRMode(v17) gamut:a5 hdr:a4 rotation:v14 virtual:v21 validityCheck:1];

  return v18;
}

- (FBSDisplayMode)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_value(v4, (const char *)[@"scaleOverride" UTF8String]);
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, (const char *)[@"width" UTF8String]);
  uint64_t v7 = xpc_dictionary_get_uint64(v4, (const char *)[@"height" UTF8String]);
  uint64_t v8 = xpc_dictionary_get_uint64(v4, (const char *)[@"preferredScale" UTF8String]);
  double value = 0.0;
  if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14598]) {
    double value = xpc_double_get_value(v5);
  }
  double v10 = xpc_dictionary_get_double(v4, (const char *)[@"refreshRate" UTF8String]);
  int64_t int64 = xpc_dictionary_get_int64(v4, (const char *)[@"gamut" UTF8String]);
  int64_t v12 = xpc_dictionary_get_int64(v4, (const char *)[@"hdr" UTF8String]);
  int64_t v13 = xpc_dictionary_get_int64(v4, (const char *)[@"rotation" UTF8String]);
  LOBYTE(v16) = xpc_dictionary_get_BOOL(v4, (const char *)[@"virtual" UTF8String]);
  double v14 = [(FBSDisplayMode *)self _initWithWidth:uint64 height:v7 preferredScale:v8 scaleOverride:int64 refreshRate:v12 gamut:v13 hdr:value rotation:v10 virtual:v16 validityCheck:2];

  return v14;
}

- (id)_initWithWidth:(unint64_t)a3 height:(unint64_t)a4 preferredScale:(unint64_t)a5 scaleOverride:(double)a6 refreshRate:(double)a7 gamut:(int64_t)a8 hdr:(int64_t)a9 rotation:(int64_t)a10 virtual:(BOOL)a11 validityCheck:(int64_t)a12
{
  v28.receiver = self;
  v28.super_class = (Class)FBSDisplayMode;
  uint64_t v21 = [(FBSDisplayMode *)&v28 init];
  if (v21)
  {
    v21->_width = a3;
    v21->_height = a4;
    v21->_preferredScale = a5;
    BSFloatEqualToFloat();
  }
  if (a12 != 3)
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    if (a5 == -1 || a4 + 1 < 2 || a3 + 1 < 2 || v22 != v23) {
      goto LABEL_16;
    }
    if (!a5) {
      BSFloatIsZero();
    }
    if (a6 < 0.0
      || a7 <= 0.0
      || !FBSDisplayGamutIsValid(a8)
      || !FBSDisplayHDRModeIsValid(a9)
      || !FBSDisplayRotationIsValid(a10))
    {
LABEL_16:
      if (a12 == 2)
      {
        v25 = FBLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:](0, v25);
        }

        v24 = 0;
      }
      else
      {
        if (a12 == 1)
        {
          v27 = [NSString stringWithFormat:@"FBSDisplayMode cannot be configured as requested : %@", 0];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:](a2, 0, (uint64_t)v27);
          }
          [v27 UTF8String];
          _bs_set_crash_log_message();
        }
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, 0, @"FBSDisplayMode.m", 112, @"FBSDisplayMode cannot be configured as requested : %@", 0 object file lineNumber description];
      }
    }
  }
  return 0;
}

- (CGSize)size
{
  [(FBSDisplayMode *)self pointScale];
  double v4 = v3;
  [(FBSDisplayMode *)self pixelSize];
  double v6 = v5 / v4;
  double v8 = v7 / v4;
  result.height = v8;
  result.width = v6;
  return result;
}

- (CGSize)pixelSize
{
  uint64_t v2 = 16;
  uint64_t v3 = 16;
  if ((self->_rotation | 2) == 3) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v2 = 8;
  }
  double v4 = (double)*(unint64_t *)((char *)&self->super.isa + v3);
  double v5 = (double)*(unint64_t *)((char *)&self->super.isa + v2);
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)pointScale
{
}

- (CGSize)nativePixelSize
{
  double width = (double)self->_width;
  double height = (double)self->_height;
  result.double height = height;
  result.double width = width;
  return result;
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 72);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_8(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 64);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_7(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 56);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

double __26__FBSDisplayMode_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 40);
}

double __26__FBSDisplayMode_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double v5 = [off_1E58F4500 builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t width = self->_width;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __26__FBSDisplayMode_isEqual___block_invoke;
  v50[3] = &unk_1E58F72A8;
  id v7 = v4;
  id v51 = v7;
  id v8 = (id)[v5 appendSizeT:width counterpart:v50];
  unint64_t height = self->_height;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __26__FBSDisplayMode_isEqual___block_invoke_2;
  v48[3] = &unk_1E58F72A8;
  id v10 = v7;
  id v49 = v10;
  id v11 = (id)[v5 appendSizeT:height counterpart:v48];
  unint64_t preferredScale = self->_preferredScale;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __26__FBSDisplayMode_isEqual___block_invoke_3;
  v46[3] = &unk_1E58F72A8;
  id v13 = v10;
  id v47 = v13;
  id v14 = (id)[v5 appendSizeT:preferredScale counterpart:v46];
  double scaleOverride = self->_scaleOverride;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __26__FBSDisplayMode_isEqual___block_invoke_4;
  v44[3] = &unk_1E58F5E60;
  id v16 = v13;
  id v45 = v16;
  id v17 = (id)[v5 appendCGFloat:v44 counterpart:scaleOverride];
  double refreshRate = self->_refreshRate;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __26__FBSDisplayMode_isEqual___block_invoke_5;
  v42[3] = &unk_1E58F5E60;
  id v19 = v16;
  id v43 = v19;
  id v20 = (id)[v5 appendDouble:v42 counterpart:refreshRate];
  int64_t gamut = self->_gamut;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __26__FBSDisplayMode_isEqual___block_invoke_6;
  v40[3] = &unk_1E58F5600;
  id v22 = v19;
  id v41 = v22;
  id v23 = (id)[v5 appendInteger:gamut counterpart:v40];
  int64_t hdr = self->_hdr;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __26__FBSDisplayMode_isEqual___block_invoke_7;
  v38[3] = &unk_1E58F5600;
  id v25 = v22;
  id v39 = v25;
  id v26 = (id)[v5 appendInteger:hdr counterpart:v38];
  int64_t rotation = self->_rotation;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __26__FBSDisplayMode_isEqual___block_invoke_8;
  v36[3] = &unk_1E58F5600;
  id v28 = v25;
  id v37 = v28;
  id v29 = (id)[v5 appendInteger:rotation counterpart:v36];
  BOOL v30 = self->_virtual;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __26__FBSDisplayMode_isEqual___block_invoke_9;
  v34[3] = &unk_1E58F55B0;
  id v35 = v28;
  id v31 = v28;
  id v32 = (id)[v5 appendBool:v30 counterpart:v34];
  LOBYTE(v28) = [v5 isEqual];

  return (char)v28;
}

uint64_t __28__FBSDisplayMode__emptyMode__block_invoke()
{
  LOBYTE(v3) = 1;
  id v0 = [[FBSDisplayMode alloc] _initWithWidth:0 height:0 preferredScale:1 scaleOverride:0 refreshRate:0 gamut:0 hdr:0.0 rotation:0.0 virtual:v3 validityCheck:3];
  uint64_t v1 = _emptyMode___emptyMode;
  _emptyMode___emptyMode = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (FBSDisplayMode)init
{
  id v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithFormat:@"init is unavailable on %@", v6];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = NSStringFromSelector(a2);
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138544642;
    int64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v10;
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = @"FBSDisplayMode.m";
    __int16 v19 = 1024;
    int v20 = 37;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithWidth:(unint64_t)a3 height:(unint64_t)a4 scale:(unint64_t)a5 refreshRate:(double)a6 gamut:(int64_t)a7 hdr:(int64_t)a8
{
  LOBYTE(v9) = 1;
  return [(FBSDisplayMode *)self _initWithWidth:a3 height:a4 preferredScale:a5 scaleOverride:a7 refreshRate:a8 gamut:0 hdr:0.0 rotation:a6 virtual:v9 validityCheck:1];
}

- (id)_copyWithOverrideSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(FBSDisplayMode *)self pointScale];
  if ((self->_rotation | 2) == 3)
  {
    double v7 = height;
    double height = width;
  }
  else
  {
    double v7 = width;
  }
  LOBYTE(v9) = 1;
  return (id)[objc_alloc((Class)objc_opt_class()) _initWithWidth:(unint64_t)(v6 * v7) height:(unint64_t)(v6 * height) preferredScale:self->_preferredScale scaleOverride:self->_gamut refreshRate:self->_hdr gamut:self->_rotation hdr:self->_scaleOverride rotation:self->_refreshRate virtual:v9 validityCheck:1];
}

- (id)_copyWithOverrideSize:(CGSize)a3 scale:(double)a4
{
  if ((self->_rotation | 2) == 3)
  {
    double height = a3.height;
    a3.double height = a3.width;
  }
  else
  {
    double height = a3.width;
  }
  LOBYTE(v7) = 1;
  return (id)[objc_alloc((Class)objc_opt_class()) _initWithWidth:(unint64_t)(height * a4) height:(unint64_t)(a3.height * a4) preferredScale:(unint64_t)a4 scaleOverride:self->_gamut refreshRate:self->_hdr gamut:self->_rotation hdr:a4 rotation:self->_refreshRate virtual:v7 validityCheck:1];
}

- (BOOL)_isVirtualMode
{
  return self->_virtual;
}

- (unint64_t)_caWidth
{
  return self->_width;
}

- (unint64_t)_caHeight
{
  return self->_height;
}

- (unint64_t)_caPreferredScale
{
  return self->_preferredScale;
}

- (double)_caRefreshRate
{
  return self->_refreshRate;
}

- (id)_caColorGamut
{
  return FBSDisplayGamutToCADisplayGamut(self->_gamut);
}

- (id)_caHDRMode
{
  return FBSDisplayHDRModeToCADisplayHDRMode(self->_hdr);
}

- (int64_t)_rotation
{
  return self->_rotation;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayMode)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"width"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"height"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"preferredScale"];
  [v4 decodeDoubleForKey:@"scaleOverride"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"refreshRate"];
  double v11 = v10;
  uint64_t v12 = [v4 decodeIntegerForKey:@"gamut"];
  uint64_t v13 = [v4 decodeIntegerForKey:@"hdr"];
  uint64_t v14 = [v4 decodeIntegerForKey:@"rotation"];
  char v15 = [v4 decodeBoolForKey:@"virtual"];

  LOBYTE(v17) = v15;
  return (FBSDisplayMode *)[(FBSDisplayMode *)self _initWithWidth:v5 height:v6 preferredScale:v7 scaleOverride:v12 refreshRate:v13 gamut:v14 hdr:v9 rotation:v11 virtual:v17 validityCheck:2];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:self->_width forKey:@"width"];
  [v5 encodeInt64:self->_height forKey:@"height"];
  unint64_t preferredScale = self->_preferredScale;
  if (preferredScale) {
    [v5 encodeInt64:preferredScale forKey:@"preferredScale"];
  }
  BSFloatIsZero();
}

- (void)_initWithWidth:(uint64_t)a1 height:(NSObject *)a2 preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "FBSDisplayMode cannot be configured as requested : %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_initWithWidth:(uint64_t)a3 height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  char v15 = @"FBSDisplayMode.m";
  __int16 v16 = 1024;
  int v17 = 110;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end