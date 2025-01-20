@interface FBSDisplayConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)expectsSecureRendering;
- (BOOL)isCarDisplay;
- (BOOL)isCarInstrumentsDisplay;
- (BOOL)isCloningSupported;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isHiddenDisplay;
- (BOOL)isMainDisplay;
- (BOOL)isMainRootDisplay;
- (BOOL)isOverscanned;
- (BOOL)isUIKitMainLike;
- (BOOL)supportsExtendedColor;
- (BOOL)wantsConnectionDebouncing;
- (CGPoint)nativeCenter;
- (CGPoint)renderingCenter;
- (CGRect)_nativeBounds;
- (CGRect)bounds;
- (CGSize)pixelSize;
- (CGSize)safeOverscanRatio;
- (FBSDisplayConfiguration)init;
- (FBSDisplayConfiguration)initWithCADisplay:(id)a3;
- (FBSDisplayConfiguration)initWithCADisplay:(id)a3 isMainDisplay:(BOOL)a4;
- (FBSDisplayConfiguration)initWithCoder:(id)a3;
- (FBSDisplayConfiguration)initWithXPCDictionary:(id)a3;
- (FBSDisplayConfiguration)originatingConfiguration;
- (FBSDisplayIdentity)identity;
- (FBSDisplayMode)currentMode;
- (FBSDisplayMode)preferredMode;
- (NSSet)availableModes;
- (NSString)description;
- (NSString)deviceName;
- (NSString)hardwareIdentifier;
- (NSString)name;
- (double)latency;
- (double)nativeOrientation;
- (double)pointScale;
- (double)refreshRate;
- (id)CADisplay;
- (id)_initWithIdentity:(void *)a3 hardwareIdentifier:(void *)a4 name:(void *)a5 deviceName:(void *)a6 seed:(int)a7 comparable:(char)a8 tags:(double)a9 currentMode:(double)a10 preferredMode:(CGFloat)a11 otherModes:(CGFloat)a12 cloningSupported:(CGFloat)a13 overscanned:(CGFloat)a14 overscanCompensation:(CGFloat)a15 safeOverscanRatio:(CGFloat)a16 pixelSize:(void *)a17 nativeBounds:(void *)a18 bounds:(void *)a19 latency:(void *)a20 originatingConfiguration:(char)a21 validityCheck:(char)a22;
- (id)_initWithImmutableDisplay:(id)a3 originalDisplay:(id)a4 assertIfInvalid:(BOOL)a5;
- (id)_nameForDisplayType;
- (id)copyForSecureRendering;
- (id)copyWithOverrideBounds:(CGRect)a3;
- (id)copyWithOverrideMode:(id)a3;
- (id)copyWithOverrideMode:(id)a3 pixelSize:(CGSize)a4 nativeBounds:(CGRect)a5;
- (id)copyWithUniqueIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)immutableCADisplay;
- (id)laterConfiguration:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)uniqueID;
- (id)uniqueIdentifier;
- (int64_t)_nativeRotation;
- (int64_t)colorGamut;
- (int64_t)overscanCompensation;
- (int64_t)tags;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)displayID;
- (unsigned)seed;
- (void)CADisplay;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSDisplayConfiguration

- (BOOL)isCarDisplay
{
  return [(FBSDisplayIdentity *)self->_identity isCarDisplay];
}

- (BOOL)isExternal
{
  return [(FBSDisplayIdentity *)self->_identity isExternal];
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [off_1E58F4500 builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  identity = self->_identity;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke;
  v84[3] = &unk_1E58F5E10;
  id v7 = v4;
  id v85 = v7;
  id v8 = (id)[v5 appendObject:identity counterpart:v84];
  hardwareIdentifier = self->_hardwareIdentifier;
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_2;
  v82[3] = &unk_1E58F55D8;
  id v10 = v7;
  id v83 = v10;
  id v11 = (id)[v5 appendString:hardwareIdentifier counterpart:v82];
  name = self->_name;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_3;
  v80[3] = &unk_1E58F55D8;
  id v13 = v10;
  id v81 = v13;
  id v14 = (id)[v5 appendString:name counterpart:v80];
  deviceName = self->_deviceName;
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_4;
  v78[3] = &unk_1E58F55D8;
  id v16 = v13;
  id v79 = v16;
  id v17 = (id)[v5 appendString:deviceName counterpart:v78];
  int64_t tags = self->_tags;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_5;
  v76[3] = &unk_1E58F5600;
  id v19 = v16;
  id v77 = v19;
  id v20 = (id)[v5 appendInteger:tags counterpart:v76];
  currentMode = self->_currentMode;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_6;
  v74[3] = &unk_1E58F5E10;
  id v22 = v19;
  id v75 = v22;
  id v23 = (id)[v5 appendObject:currentMode counterpart:v74];
  preferredMode = self->_preferredMode;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_7;
  v72[3] = &unk_1E58F5E10;
  id v25 = v22;
  id v73 = v25;
  id v26 = (id)[v5 appendObject:preferredMode counterpart:v72];
  otherModes = self->_otherModes;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_8;
  v70[3] = &unk_1E58F5E10;
  id v28 = v25;
  id v71 = v28;
  id v29 = (id)[v5 appendObject:otherModes counterpart:v70];
  BOOL cloningSupported = self->_cloningSupported;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_9;
  v68[3] = &unk_1E58F55B0;
  id v31 = v28;
  id v69 = v31;
  id v32 = (id)[v5 appendBool:cloningSupported counterpart:v68];
  BOOL overscanned = self->_overscanned;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_10;
  v66[3] = &unk_1E58F55B0;
  id v34 = v31;
  id v67 = v34;
  id v35 = (id)[v5 appendBool:overscanned counterpart:v66];
  int64_t overscanCompensation = self->_overscanCompensation;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_11;
  v64[3] = &unk_1E58F5600;
  id v37 = v34;
  id v65 = v37;
  id v38 = (id)[v5 appendInteger:overscanCompensation counterpart:v64];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_12;
  v62[3] = &unk_1E58F5E38;
  id v39 = v37;
  id v63 = v39;
  id v40 = [v5 appendCGSize:v62 counterpart:self->_safeOverscanRatio.width counterpart:self->_safeOverscanRatio.height];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_13;
  v60[3] = &unk_1E58F5E38;
  id v41 = v39;
  id v61 = v41;
  id v42 = [v5 appendCGSize:v60 counterpart:self->_pixelSize.width counterpart:self->_pixelSize.height];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_14;
  v58[3] = &unk_1E58F5628;
  id v43 = v41;
  id v59 = v43;
  id v44 = [v5 appendCGRect:v58 counterpart:self->_nativeBounds.origin.x, self->_nativeBounds.origin.y, self->_nativeBounds.size.width, self->_nativeBounds.size.height];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __35__FBSDisplayConfiguration_isEqual___block_invoke_15;
  v56[3] = &unk_1E58F5628;
  id v45 = v43;
  id v57 = v45;
  id v46 = [v5 appendCGRect:v56 counterpart:self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height];
  double latency = self->_latency;
  uint64_t v51 = MEMORY[0x1E4F143A8];
  uint64_t v52 = 3221225472;
  v53 = __35__FBSDisplayConfiguration_isEqual___block_invoke_16;
  v54 = &unk_1E58F5E60;
  id v55 = v45;
  id v48 = v45;
  id v49 = (id)[v5 appendDouble:&v51 counterpart:latency];
  LOBYTE(v45) = [v5 isEqual:v51 v52 v53 v54];

  return (char)v45;
}

- (id)_initWithIdentity:(void *)a3 hardwareIdentifier:(void *)a4 name:(void *)a5 deviceName:(void *)a6 seed:(int)a7 comparable:(char)a8 tags:(double)a9 currentMode:(double)a10 preferredMode:(CGFloat)a11 otherModes:(CGFloat)a12 cloningSupported:(CGFloat)a13 overscanned:(CGFloat)a14 overscanCompensation:(CGFloat)a15 safeOverscanRatio:(CGFloat)a16 pixelSize:(void *)a17 nativeBounds:(void *)a18 bounds:(void *)a19 latency:(void *)a20 originatingConfiguration:(char)a21 validityCheck:(char)a22
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v43 = a4;
  id v80 = a5;
  id v79 = a6;
  id v44 = a18;
  id v78 = a19;
  id v45 = v43;
  id v46 = a20;
  id v47 = a29;
  v81.receiver = a1;
  v81.super_class = (Class)FBSDisplayConfiguration;
  id v48 = (id *)[super init];
  id v49 = v48;
  if (v48)
  {
    objc_storeStrong(v48 + 14, a3);
    uint64_t v50 = [v45 copy];
    id v51 = v49[15];
    v49[15] = (id)v50;

    uint64_t v52 = [v80 copy];
    id v53 = v49[16];
    v49[16] = (id)v52;

    uint64_t v54 = [v79 copy];
    id v55 = v49[17];
    v49[17] = (id)v54;

    *((_DWORD *)v49 + 52) = a7;
    *((unsigned char *)v49 + 218) = a8;
    v49[24] = a17;
    objc_storeStrong(v49 + 18, a18);
    if (v49[18]) {
      [MEMORY[0x1E4F1CA80] setWithObject:];
    }
    else {
    v56 = [MEMORY[0x1E4F1CA80] set];
    }
    if (v78)
    {
      objc_storeStrong(v49 + 19, a19);
      [v56 addObject:v49[19]];
    }
    if ([v46 count])
    {
      uint64_t v57 = [v46 copy];
      id v58 = v49[20];
      v49[20] = (id)v57;

      [v56 unionSet:v46];
    }
    uint64_t v59 = [v56 copy];
    id v60 = v49[21];
    v49[21] = (id)v59;

    *((unsigned char *)v49 + 216) = a21;
    *((unsigned char *)v49 + 217) = a22;
    v49[25] = (id)a23;
    *((double *)v49 + 9) = a9;
    *((double *)v49 + 10) = a10;
    *((CGFloat *)v49 + 11) = a11;
    *((CGFloat *)v49 + 12) = a12;
    *((CGFloat *)v49 + 1) = a13;
    *((CGFloat *)v49 + 2) = a14;
    *((CGFloat *)v49 + 3) = a15;
    *((CGFloat *)v49 + 4) = a16;
    *((CGFloat *)v49 + 5) = a24;
    *((CGFloat *)v49 + 6) = a25;
    *((CGFloat *)v49 + 7) = a26;
    *((CGFloat *)v49 + 8) = a27;
    v49[13] = a28;
    uint64_t v61 = [v47 copy];
    id v62 = v49[28];
    v49[28] = (id)v61;
  }
  if (a30 == 3)
  {
    id v63 = v77;
    goto LABEL_41;
  }
  id v63 = v77;
  if (v77)
  {
    unint64_t v64 = [v77 type];
    unint64_t v65 = [v77 connectionType];
  }
  else
  {
    unint64_t v64 = -1;
    unint64_t v65 = -1;
  }
  uint64_t v66 = objc_opt_class();
  if (v66 != objc_opt_class() || !FBSDisplayTypeIsValid(v64) || !FBSDisplayConnectionTypeIsValid(v65)) {
    goto LABEL_34;
  }
  if (!v64)
  {
    int v67 = [v77 displayID];
    if (!v44 || v67 != 1) {
      goto LABEL_34;
    }
LABEL_23:
    if (FBSDisplayOverscanCompensationIsValid(a23) && a9 >= 0.0 && a9 <= 1.0 && a10 >= 0.0 && a10 <= 1.0)
    {
      CGFloat v68 = *MEMORY[0x1E4F1DAD8];
      CGFloat v69 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v85.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
      v85.origin.y = v69;
      v85.size.double width = a11;
      v85.size.double height = a12;
      if (!CGRectIsNull(v85))
      {
        v86.origin.x = v68;
        v86.origin.y = v69;
        v86.size.double width = a11;
        v86.size.double height = a12;
        if (!CGRectIsInfinite(v86))
        {
          v87.origin.x = a13;
          v87.origin.y = a14;
          v87.size.double width = a15;
          v87.size.double height = a16;
          if (!CGRectIsNull(v87))
          {
            v88.origin.x = a13;
            v88.origin.y = a14;
            v88.size.double width = a15;
            v88.size.double height = a16;
            if (!CGRectIsInfinite(v88))
            {
              v89.origin.x = a24;
              v89.origin.y = a25;
              v89.size.double width = a26;
              v89.size.double height = a27;
              if (!CGRectIsNull(v89))
              {
                v90.origin.x = a24;
                v90.origin.y = a25;
                v90.size.double width = a26;
                v90.size.double height = a27;
                if (!CGRectIsInfinite(v90)) {
                  goto LABEL_41;
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_34;
  }
  if (v44) {
    goto LABEL_23;
  }
LABEL_34:
  if (a30 == 2)
  {
    id v71 = FBLogCommon();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v83 = v49;
      _os_log_impl(&dword_19C680000, v71, OS_LOG_TYPE_INFO, "FBSDisplayConfiguration cannot be initialized as requested : %{public}@", buf, 0xCu);
    }

    v70 = v49;
    id v49 = 0;
  }
  else
  {
    if (a30 == 1)
    {
      id v73 = [NSString stringWithFormat:@"FBSDisplayConfiguration cannot be initialized as requested : %@", v49];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:]();
      }
      [v73 UTF8String];
      _bs_set_crash_log_message();
    }
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2, v49, @"FBSDisplay.m", 634, @"FBSDisplayConfiguration cannot be initialized as requested : %@", v49 object file lineNumber description];
  }

LABEL_41:
  return v49;
}

- (double)pointScale
{
  [(FBSDisplayMode *)self->_currentMode pointScale];
  return result;
}

- (BOOL)isOverscanned
{
  return self->_overscanned;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 216);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 160);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 152);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 144);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 192);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 136);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 128);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 120);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_16(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 104);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_13(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 88);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_12(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 72);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_11(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 200);
}

uint64_t __35__FBSDisplayConfiguration_isEqual___block_invoke_10(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 217);
}

id __35__FBSDisplayConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

- (int64_t)overscanCompensation
{
  return self->_overscanCompensation;
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_15(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 40);
}

double __35__FBSDisplayConfiguration_isEqual___block_invoke_14(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 8);
}

- (BOOL)isMainRootDisplay
{
  v2 = [(FBSDisplayConfiguration *)self identity];
  char v3 = [v2 isMainRootDisplay];

  return v3;
}

- (FBSDisplayIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noEqual_originatingConfiguration, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_immutableCADisplay, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_storeStrong((id *)&self->_otherModes, 0);
  objc_storeStrong((id *)&self->_preferredMode, 0);
  objc_storeStrong((id *)&self->_currentMode, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (int64_t)colorGamut
{
  return [(FBSDisplayMode *)self->_currentMode colorGamut];
}

- (NSString)name
{
  return self->_name;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(FBSDisplayConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(FBSDisplayConfiguration *)self succinctDescriptionBuilder];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__FBSDisplayConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E58F5E88;
  id v6 = v5;
  id v12 = v6;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  [v6 appendBodySectionWithName:0 multilinePrefix:v7 block:v11];
  id v8 = v14;
  id v9 = v6;

  return v9;
}

- (id)succinctDescriptionBuilder
{
  char v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identity withName:0];
  v5 = NSString;
  id v6 = [(FBSDisplayMode *)self->_currentMode _referenceSizeDescription];
  [(FBSDisplayMode *)self->_currentMode refreshRate];
  uint64_t v8 = v7;
  id v9 = FBSDisplayGamutDescription([(FBSDisplayMode *)self->_currentMode colorGamut]);
  id v10 = FBSDisplayHDRModeDescription([(FBSDisplayMode *)self->_currentMode hdrMode]);
  id v11 = [v5 stringWithFormat:@"%@ %gHz %@ %@", v6, v8, v9, v10];
  [v3 appendString:v11 withName:@"mode"];

  if (self->_overscanned)
  {
    int64_t overscanCompensation = self->_overscanCompensation;
    if (overscanCompensation == 1)
    {
      id v13 = @"scaled";
    }
    else
    {
      if (overscanCompensation != 2) {
        goto LABEL_7;
      }
      id v13 = @"inset";
    }
    [v3 appendString:v13 withName:@"overscan"];
  }
LABEL_7:

  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    [@"identity" UTF8String];
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
}

- (id)_initWithImmutableDisplay:(id)a3 originalDisplay:(id)a4 assertIfInvalid:(BOOL)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  a4;
  uint64_t v7 = [v6 tag];
  uint64_t v8 = [v6 displayId];
  if (v8 == 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = 8;
    uint64_t v11 = 3;
    uint64_t v12 = 6;
    uint64_t v13 = 4;
    uint64_t v14 = 5;
    uint64_t v15 = 7;
    if ((v7 & 0x10000) == 0) {
      uint64_t v15 = -1;
    }
    if ((v7 & 0x10) == 0) {
      uint64_t v14 = v15;
    }
    if ((v7 & 8) == 0) {
      uint64_t v13 = v14;
    }
    if ((v7 & 0x40) == 0) {
      uint64_t v12 = v13;
    }
    if ((v7 & 0x20) == 0) {
      uint64_t v11 = v12;
    }
    if ((v7 & 0x80) == 0) {
      uint64_t v10 = v11;
    }
    if ((v7 & 4) != 0) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v10;
    }
  }
  unint64_t v16 = [v6 displayType];
  if (v16 >= 3) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = v16;
  }
  v18 = [FBSDisplayIdentity alloc];
  uint64_t v19 = [v6 connectionSeed];
  uint64_t v20 = [v6 processId];
  LOBYTE(v50) = 0;
  LOBYTE(v49) = [v6 isExternal];
  id v21 = [(FBSDisplayIdentity *)v18 _initWithType:v9 UIKitMainLike:v8 == 1 displayID:v8 connectionType:v17 connectionSeed:v19 pid:v20 external:v49 uniqueIdentifier:0 secure:v50 root:0];
  id v22 = [v6 nativeOrientation];
  uint64_t v23 = FBSDisplayRotationFromCADisplayRotation(v22);

  if (v8 != 1)
  {
    v24 = [v6 currentOrientation];
    uint64_t v25 = v23 - FBSDisplayRotationFromCADisplayRotation(v24) + 4;
    uint64_t v26 = v25 & 3;
    uint64_t v28 = -v25;
    BOOL v27 = v28 < 0;
    uint64_t v29 = v28 & 3;
    if (v27) {
      uint64_t v23 = v26;
    }
    else {
      uint64_t v23 = -v29;
    }
  }
  double v30 = 0.0;
  if (([v21 isMainDisplay] & 1) == 0)
  {
    BKSDisplayServicesGetExternalDisplayScale();
    double v30 = v31;
  }
  uint64_t v58 = [v6 currentMode];
  uint64_t v57 = [v6 preferredMode];
  [v6 availableModes];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [v32 countByEnumeratingWithState:&v59 objects:v63 count:16];
  uint64_t v52 = v21;
  id obj = v32;
  if (v33)
  {
    uint64_t v34 = v33;
    id v51 = v6;
    id v55 = 0;
    id v53 = 0;
    id v35 = 0;
    uint64_t v36 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v60 != v36) {
          objc_enumerationMutation(obj);
        }
        id v38 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v39 = [[FBSDisplayMode alloc] _initWithCADisplayMode:v38 scale:v23 rotation:v30];
        int v40 = [v38 isEqual:v58];
        int v41 = [v38 isEqual:v57];
        int v42 = v41;
        if ((v40 & 1) != 0 || v41)
        {
          if (v40)
          {
            if (v35)
            {
              id v45 = [NSString stringWithFormat:@"somehow I have multiple availableModes that match currentMode : current=%@ new=%@ available=%@", v58, v38, obj];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:]();
              }
              [v45 UTF8String];
              _bs_set_crash_log_message();
            }
            id v35 = v39;
          }
          if (v42)
          {
            if (v53)
            {
              id v46 = [NSString stringWithFormat:@"somehow I have multiple availableModes that match preferredMode : preferred=%@ new=%@ available=%@", v57, v38, obj];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:]();
              }
              [v46 UTF8String];
              _bs_set_crash_log_message();
            }
            id v53 = v39;
          }
        }
        else if (v55)
        {
          [v55 addObject:v39];
        }
        else
        {
          id v55 = [MEMORY[0x1E4F1CA80] setWithObject:v39];
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v34);
    id v32 = obj;

    if (v35)
    {
      id v6 = v51;
      goto LABEL_54;
    }
    id v21 = v52;
    id v6 = v51;
    id v43 = v55;
    id v44 = v53;
    if (v53)
    {
LABEL_62:
      id v47 = [NSString stringWithFormat:@"if there is no currentMode then there can't be any modes at all : preferred=%@ other=%@ : currentCA=%@ preferredCA=%@ availableCA=%@", v44, v43, v58, v57, v32];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayConfiguration _initWithImmutableDisplay:originalDisplay:assertIfInvalid:]();
      }
      [v47 UTF8String];
      _bs_set_crash_log_message();
    }
  }
  else
  {

    id v43 = 0;
  }
  v56 = v43;
  if (![v43 count])
  {
    if ([v21 isMainDisplay])
    {
      id v35 = +[FBSDisplayMode _emptyMode];
    }
    else
    {
      id v35 = 0;
    }
LABEL_54:
    [v6 frame];
    [v35 pointScale];
    [v6 bounds];
    BSFloatIsZero();
  }
  id v44 = 0;
  id v43 = v56;
  goto LABEL_62;
}

- (FBSDisplayConfiguration)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    [@"identity" UTF8String];
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }

  return 0;
}

- (id)CADisplay
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_caDisplay)
  {
    int v3 = [(FBSDisplayIdentity *)v2->_identity displayID];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [getCADisplayClass() displays];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v8 displayId] == v3)
          {
            objc_storeStrong((id *)&v2->_caDisplay, v8);
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (!v2->_caDisplay)
    {
      uint64_t v9 = FBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(FBSDisplayConfiguration *)v3 CADisplay];
      }
    }
  }
  objc_sync_exit(v2);

  caDisplay = v2->_caDisplay;

  return caDisplay;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (double)refreshRate
{
  [(FBSDisplayMode *)self->_currentMode refreshRate];
  return result;
}

- (int64_t)type
{
  return [(FBSDisplayIdentity *)self->_identity type];
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

void __65__FBSDisplayConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 120) withName:@"CADisplay.uniqueID" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 128) withName:@"CADisplay.name"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 136) withName:@"CADisplay.deviceName"];
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInt:*(unsigned int *)(*(void *)(a1 + 40) + 208) withName:@"CADisplay.seed"];
  id v3 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 192) withName:@"tags"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 144) withName:@"currentMode"];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 152) withName:@"preferredMode" skipIfNil:1];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 216) withName:@"cloningSupported" ifEqualTo:1];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v7 + 217))
  {
    uint64_t v9 = FBSDisplayOverscanCompensationDescription(*(void *)(v7 + 200));
    [v8 appendString:v9 withName:@"overscanCompensation"];
  }
  else
  {
    [*(id *)(a1 + 32) appendString:@"n/a" withName:@"overscanCompensation"];
  }
  BSFloatIsOne();
}

- (CGPoint)renderingCenter
{
}

- (BOOL)isCarInstrumentsDisplay
{
  return [(FBSDisplayIdentity *)self->_identity isCarInstrumentsDisplay];
}

- (BOOL)isMainDisplay
{
  return [(FBSDisplayIdentity *)self->_identity isMainDisplay];
}

- (FBSDisplayConfiguration)initWithCADisplay:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 immutableCopy];
  id v6 = [(FBSDisplayConfiguration *)self _initWithImmutableDisplay:v5 originalDisplay:v4 assertIfInvalid:0];

  return v6;
}

- (id)succinctDescription
{
  id v2 = [(FBSDisplayConfiguration *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (BOOL)isCloningSupported
{
  return self->_cloningSupported;
}

- (FBSDisplayMode)currentMode
{
  return self->_currentMode;
}

- (FBSDisplayConfiguration)init
{
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 stringWithFormat:@"init is unavailable on %@", v6];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138544642;
    long long v12 = v8;
    __int16 v13 = 2114;
    long long v14 = v10;
    __int16 v15 = 2048;
    unint64_t v16 = self;
    __int16 v17 = 2114;
    v18 = @"FBSDisplay.m";
    __int16 v19 = 1024;
    int v20 = 391;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSDisplayConfiguration)initWithCADisplay:(id)a3 isMainDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(FBSDisplayConfiguration *)self initWithCADisplay:v6];
  uint64_t v8 = v7;
  if (v4)
  {
    if (![(FBSDisplayConfiguration *)v7 isMainDisplay])
    {
      uint64_t v9 = [NSString stringWithFormat:@"failed to create a main FBSDisplayConfiguration from CADisplay=%@ -> created=%@", v6, v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayConfiguration initWithCADisplay:isMainDisplay:]();
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
    }
  }
  else if (v7 && [(FBSDisplayConfiguration *)v7 isMainDisplay])
  {
    uint64_t v11 = [NSString stringWithFormat:@"failed to create a non-main FBSDisplayConfiguration from CADisplay=%@ -> created=%@", v6, v8];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfiguration initWithCADisplay:isMainDisplay:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }

  return v8;
}

- (FBSDisplayMode)preferredMode
{
  preferredMode = self->_preferredMode;
  if (!preferredMode) {
    preferredMode = self->_currentMode;
  }
  return preferredMode;
}

- (double)nativeOrientation
{
  uint64_t v2 = [(FBSDisplayMode *)self->_currentMode _rotation];

  return FBSDisplayRotationRadians(v2);
}

- (id)uniqueIdentifier
{
  return [(FBSDisplayIdentity *)self->_identity uniqueIdentifier];
}

- (BOOL)expectsSecureRendering
{
  return [(FBSDisplayIdentity *)self->_identity expectsSecureRendering];
}

- (id)copyWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (v4)
  {
    if (objc_opt_isKindOfClass())
    {

      [(FBSDisplayIdentity *)self->_identity uniqueIdentifier];
      objc_claimAutoreleasedReturnValue();
      BSEqualObjects();
    }
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfiguration copyWithUniqueIdentifier:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSDisplayConfiguration copyWithUniqueIdentifier:]();
  }
  [v5 UTF8String];
  _bs_set_crash_log_message();
}

- (id)copyWithOverrideMode:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Fbsdisplaymode.isa);
  if (!v4)
  {
    __int16 v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfiguration copyWithOverrideMode:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfiguration copyWithOverrideMode:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }

  [v4 pixelSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v4 nativePixelSize];
  id v13 = -[FBSDisplayConfiguration copyWithOverrideMode:pixelSize:nativeBounds:](self, "copyWithOverrideMode:pixelSize:nativeBounds:", v4, v6, v8, v9, v10, v11, v12);

  return v13;
}

- (id)copyWithOverrideBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [[FBSDisplayConfigurationBuilder alloc] initWithConfiguration:self];
  -[FBSDisplayConfigurationBuilder setPixelSize:nativeBounds:bounds:](v8, "setPixelSize:nativeBounds:bounds:", self->_pixelSize.width, self->_pixelSize.height, self->_nativeBounds.origin.x, self->_nativeBounds.origin.y, self->_nativeBounds.size.width, self->_nativeBounds.size.height, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  double v9 = [(FBSDisplayConfigurationBuilder *)v8 buildConfigurationWithError:0];

  return v9;
}

- (id)copyWithOverrideMode:(id)a3 pixelSize:(CGSize)a4 nativeBounds:(CGRect)a5
{
  id v5 = a3;
  NSClassFromString(&cfstr_Fbsdisplaymode.isa);
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {

      [v5 _rotation];
      [v5 pointScale];
      BSFloatIsZero();
    }
    double v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayConfiguration copyWithOverrideMode:pixelSize:nativeBounds:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  double v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSDisplayConfiguration copyWithOverrideMode:pixelSize:nativeBounds:]();
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_nameForDisplayType
{
  unint64_t v2 = [(FBSDisplayIdentity *)self->_identity type];

  return FBSDisplayTypeName(v2);
}

- (int64_t)_nativeRotation
{
  return [(FBSDisplayMode *)self->_currentMode _rotation];
}

- (CGRect)_nativeBounds
{
  double x = self->_nativeBounds.origin.x;
  double y = self->_nativeBounds.origin.y;
  double width = self->_nativeBounds.size.width;
  double height = self->_nativeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)immutableCADisplay
{
  return self->_immutableCADisplay;
}

- (id)laterConfiguration:(id)a3
{
}

- (id)copyForSecureRendering
{
  if ([(FBSDisplayIdentity *)self->_identity expectsSecureRendering])
  {
    return self;
  }
  else
  {
    id v3 = [[FBSDisplayConfigurationBuilder alloc] initWithConfiguration:self];
    [(FBSDisplayConfigurationBuilder *)v3 setExpectsSecureRendering];
    id v4 = [(FBSDisplayConfigurationBuilder *)v3 buildConfigurationWithError:0];

    return v4;
  }
}

- (BOOL)isUIKitMainLike
{
  return [(FBSDisplayIdentity *)self->_identity isUIKitMainLike];
}

- (BOOL)isHiddenDisplay
{
  return self->_tags & 1;
}

- (BOOL)wantsConnectionDebouncing
{
  return (LOBYTE(self->_tags) >> 1) & 1;
}

- (unint64_t)hash
{
  return [(FBSDisplayIdentity *)self->_identity hash];
}

- (NSString)description
{
  return (NSString *)[(FBSDisplayConfiguration *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"currentMode"];
  if (!v5)
  {
    if ([v4 isMainDisplay])
    {
      id v5 = +[FBSDisplayMode _emptyMode];
    }
    else
    {
      id v5 = 0;
    }
  }
  double v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"safeOverscanRatio"];
  uint64_t v52 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pixelSize"];
  id v51 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nativeBounds"];
  double v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bounds"];
  uint64_t v49 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"hardwareIdentifier"];
  id v48 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v47 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
  unsigned int v46 = [v3 decodeInt32ForKey:@"seed"];
  int v8 = [v3 decodeBoolForKey:@"notComparable"];
  uint64_t v44 = [v3 decodeIntegerForKey:@"tags"];
  id v45 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"preferredMode"];
  double v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v43 = [v9 setWithObjects:v10, nil];
  double v11 = [v3 decodeObjectOfClasses:forKey:];
  char v42 = [v3 decodeBoolForKey:@"cloningSupported"];
  char v12 = [v3 decodeBoolForKey:@"overscanned"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"overscanCompensation"];
  if (v6)
  {
    double v14 = MEMORY[0x19F398970](v6);
    double v40 = v15;
    double v41 = v14;
  }
  else
  {
    double v40 = 1.0;
    double v41 = 1.0;
  }
  if (v52) {
    MEMORY[0x19F398970]();
  }
  else {
    [v5 pixelSize];
  }
  double v38 = v17;
  double v39 = v16;
  if (!v51)
  {
    [v5 nativePixelSize];
    BSRectWithSize();
  }
  MEMORY[0x19F3987E0]();
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  if (!v7)
  {
    [v5 size];
    BSRectWithSize();
  }
  MEMORY[0x19F3987E0](v7);
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  [v3 decodeDoubleForKey:@"latency"];
  BYTE1(v37) = v12;
  LOBYTE(v37) = v42;
  id v35 = -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:](self, "_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:", v4, v49, v48, v47, v46, v8 ^ 1u, v41, v40, v39, v38, v22, v23, v24, v25, v44,
          v5,
          v45,
          v11,
          v37,
          v13,
          v27,
          v29,
          v31,
          v33,
          v34,
          0,
          2);

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeObject:self->_identity forKey:@"identity"];
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier) {
    [v13 encodeObject:hardwareIdentifier forKey:@"hardwareIdentifier"];
  }
  name = self->_name;
  if (name) {
    [v13 encodeObject:name forKey:@"name"];
  }
  deviceName = self->_deviceName;
  double v7 = v13;
  if (deviceName)
  {
    [v13 encodeObject:deviceName forKey:@"deviceName"];
    double v7 = v13;
  }
  [v7 encodeInt32:self->_noEqual_seed forKey:@"seed"];
  if (!self->_noEqual_comparable) {
    [v13 encodeBool:1 forKey:@"notComparable"];
  }
  int64_t tags = self->_tags;
  if (tags) {
    [v13 encodeInteger:tags forKey:@"tags"];
  }
  currentMode = self->_currentMode;
  uint64_t v10 = +[FBSDisplayMode _emptyMode];

  if (currentMode != v10) {
    [v13 encodeObject:self->_currentMode forKey:@"currentMode"];
  }
  preferredMode = self->_preferredMode;
  if (preferredMode) {
    [v13 encodeObject:preferredMode forKey:@"preferredMode"];
  }
  if ([(NSSet *)self->_otherModes count]) {
    [v13 encodeObject:self->_otherModes forKey:@"otherModes"];
  }
  if (self->_cloningSupported) {
    [v13 encodeBool:1 forKey:@"cloningSupported"];
  }
  if (self->_overscanned) {
    [v13 encodeBool:1 forKey:@"overscanned"];
  }
  int64_t overscanCompensation = self->_overscanCompensation;
  if (overscanCompensation) {
    [v13 encodeInteger:overscanCompensation forKey:@"overscanCompensation"];
  }
  BSSizeEqualToSize();
}

- (id)uniqueID
{
  return self->_hardwareIdentifier;
}

- (CGPoint)nativeCenter
{
  currentMode = self->_currentMode;
  if (currentMode && ([(FBSDisplayMode *)currentMode _rotation] & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    p_pixelSize = &self->_pixelSize;
    p_double height = (CGSize *)&self->_pixelSize.height;
  }
  else
  {
    p_double height = &self->_pixelSize;
    p_pixelSize = (CGSize *)&self->_pixelSize.height;
  }
  double v6 = p_pixelSize->width * 0.5;
  double v7 = p_height->width * 0.5;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (BOOL)isConnected
{
  return 1;
}

- (BOOL)supportsExtendedColor
{
  return [(FBSDisplayMode *)self->_currentMode colorGamut] != 0;
}

- (unsigned)displayID
{
  return [(FBSDisplayIdentity *)self->_identity displayID];
}

- (NSSet)availableModes
{
  return self->_availableModes;
}

- (CGSize)safeOverscanRatio
{
  double width = self->_safeOverscanRatio.width;
  double height = self->_safeOverscanRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)latency
{
  return self->_latency;
}

- (FBSDisplayConfiguration)originatingConfiguration
{
  return self->_noEqual_originatingConfiguration;
}

- (unsigned)seed
{
  return self->_noEqual_seed;
}

- (int64_t)tags
{
  return self->_tags;
}

- (void)initWithCADisplay:isMainDisplay:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithCADisplay:isMainDisplay:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithImmutableDisplay:originalDisplay:assertIfInvalid:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithImmutableDisplay:originalDisplay:assertIfInvalid:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithImmutableDisplay:originalDisplay:assertIfInvalid:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)copyWithUniqueIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)copyWithOverrideMode:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)copyWithOverrideMode:pixelSize:nativeBounds:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)CADisplay
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "Unable to find a CADisplay for decoded displayID %u. The render server process may have crashed.", (uint8_t *)v2, 8u);
}

@end