@interface CADisplay
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)TVOutDisplay;
+ (id)displays;
+ (id)mainDisplay;
+ (void)updateDisplays;
- (BOOL)allowsVirtualModes;
- (BOOL)hasNativeFrameRateRequest;
- (BOOL)isCloned;
- (BOOL)isCloning;
- (BOOL)isCloningSupported;
- (BOOL)isExternal;
- (BOOL)isForceFixedRateLinksEnabled;
- (BOOL)isOverscanned;
- (BOOL)isReference;
- (BOOL)isReferenceLimited;
- (BOOL)isSupported;
- (BOOL)setDisplayProperties:(id)a3;
- (BOOL)supportsExtendedColors;
- (BOOL)supportsVariableFrameDuration;
- (CADisplayAttributes)externalDisplayAttributes;
- (CADisplayMode)currentMode;
- (CADisplayMode)preferredMode;
- (CADisplayPreferences)preferences;
- (CADisplayPreset)currentPreset;
- (CAFrameRateRange)preferredFrameRateRangeForMaximumVelocity:(float)a3;
- (CAFrameRateRange)preferredFrameRateRangeForVelocity:(float)a3;
- (CGRect)bounds;
- (CGRect)frame;
- (CGRect)safeBounds;
- (CGSize)logicalScale;
- (CGSize)nativeSize;
- (CGSize)overscanAmounts;
- (CGSize)physicalSize;
- (NSArray)availableModes;
- (NSString)colorMode;
- (NSString)containerId;
- (NSString)currentOrientation;
- (NSString)deviceName;
- (NSString)name;
- (NSString)nativeOrientation;
- (NSString)overscanAdjustment;
- (NSString)productName;
- (NSString)transportType;
- (NSString)uniqueId;
- (__CFDictionary)_copyDebugProperties;
- (double)hardwareRefreshRate;
- (double)heartbeatRate;
- (double)latency;
- (double)maximumLogicalScale;
- (double)minimumLogicalScale;
- (double)overscanAmount;
- (double)refreshRate;
- (float)autoLuminanceBoost;
- (float)highestLocalPreferredFrameRateRequest;
- (id)_initWithDisplay:(void *)a3;
- (id)allowedHDRModes;
- (id)availablePresets;
- (id)description;
- (id)flipBookWithCapacity:(unint64_t)a3;
- (id)flipBookWithOptions:(id)a3;
- (id)immutableCopy;
- (id)preferredHDRModes;
- (id)preferredModeWithCriteria:(id)a3;
- (id)stateControl;
- (id)supportedHDRModes;
- (int)linkQuality;
- (int)processId;
- (int64_t)displayType;
- (int64_t)minimumFrameDuration;
- (int64_t)tag;
- (unint64_t)pointScale;
- (unsigned)connectionSeed;
- (unsigned)displayId;
- (unsigned)odLUTVersion;
- (unsigned)seed;
- (void)_finalize;
- (void)_invalidate;
- (void)_notifyDisallowedLayersChange:(BOOL)a3;
- (void)_postNotification:(int64_t)a3;
- (void)dealloc;
- (void)overrideDisplayTimings:(id)a3;
- (void)overrideMinimumFrameDuration:(int64_t)a3;
- (void)setAllowsVirtualModes:(BOOL)a3;
- (void)setColorMode:(id)a3;
- (void)setCurrentMode:(id)a3;
- (void)setCurrentPreset:(id)a3;
- (void)setDisallowedLayersCallback:(id)a3;
- (void)setForceFixedRateLinksEnabled:(BOOL)a3;
- (void)setLatency:(double)a3;
- (void)setOverscanAdjustment:(id)a3;
- (void)setPreferences:(id)a3;
- (void)timingsControl;
- (void)update;
@end

@implementation CADisplay

- (int64_t)minimumFrameDuration
{
  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  if (*((unsigned char *)impl + 697)) {
    unsigned int v4 = 2;
  }
  else {
    unsigned int v4 = 1;
  }
  if (v4 <= impl[130]) {
    unsigned int v4 = impl[130];
  }
  unsigned int v5 = impl[138];
  if (v4 <= v5) {
    return v5;
  }
  else {
    return v4;
  }
}

- (double)heartbeatRate
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  uint64_t v4 = 528;
  if ((*((unsigned char *)impl + 697) & 8) == 0) {
    uint64_t v4 = 512;
  }
  return 1.0 / round(1.0 / *(double *)((char *)impl + v4));
}

+ (id)mainDisplay
{
  return (id)_mainDisplay;
}

- (double)refreshRate
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  uint64_t v4 = 528;
  if ((*((unsigned char *)impl + 697) & 8) == 0) {
    uint64_t v4 = 496;
  }
  return 1.0 / round(1.0 / *(double *)((char *)impl + v4));
}

- (float)highestLocalPreferredFrameRateRequest
{
  impl = (os_unfair_lock_s *)self->_impl;
  float v3 = 0.0;
  if ((impl[174]._os_unfair_lock_opaque & 0x200) != 0)
  {
    os_unfair_lock_lock(impl + 139);
    if (*(void *)&impl[144]._os_unfair_lock_opaque != *(void *)&impl[146]._os_unfair_lock_opaque)
    {
      uint64_t v4 = 128;
      if ((impl[174]._os_unfair_lock_opaque & 0x800) != 0) {
        uint64_t v4 = 132;
      }
      unsigned int os_unfair_lock_opaque = impl[142]._os_unfair_lock_opaque;
      if (os_unfair_lock_opaque)
      {
        double v6 = *(double *)&impl[v4]._os_unfair_lock_opaque;
        if (v6 != 0.0) {
          float v3 = 1.0 / (v6 * (double)os_unfair_lock_opaque);
        }
      }
    }
    os_unfair_lock_unlock(impl + 139);
  }
  return v3;
}

- (NSString)uniqueId
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  uint64_t v4 = (void *)CA::Display::Display::retain_uuid((os_unfair_lock_s *)impl);

  return (NSString *)v4;
}

- (NSArray)availableModes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (os_unfair_lock_s *)self->_impl;
  }
  long long v10 = 0u;
  memset(v11, 0, sizeof(v11));
  *(_OWORD *)__p = 0u;
  long long v9 = 0u;
  CA::Display::Display::available_modes((CA::Display::Display *)__p, impl);
  if (__p[1] == __p[0])
  {
    uint64_t v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v4 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
    unsigned int v5 = (unint64_t *)__p[0];
    double v6 = (unint64_t *)__p[1];
    while (v5 != v6)
      [(NSArray *)v4 addObject:create_mode((uint64_t)self, *v5++, (uint64_t)__p)];
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v11);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((void *)v10);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v4;
}

- (int64_t)tag
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((unsigned int *)impl + 105);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)pointScale
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((unsigned int *)impl + 180);
}

- (BOOL)hasNativeFrameRateRequest
{
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[174]._os_unfair_lock_opaque & 0x200) == 0) {
    return 0;
  }
  uint64_t v4 = impl + 139;
  os_unfair_lock_lock(impl + 139);
  BOOL v3 = *(void *)&impl[144]._os_unfair_lock_opaque != *(void *)&impl[146]._os_unfair_lock_opaque
    && impl[140]._os_unfair_lock_opaque == 2;
  os_unfair_lock_unlock(v4);
  return v3;
}

- (CGRect)bounds
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  int32x4_t v12 = *(int32x4_t *)(impl + 264);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  int32x4_t v5 = v12;
  if (v12.i32[2] <= v12.i32[3]) {
    int v6 = v12.i32[3];
  }
  else {
    int v6 = v12.i32[2];
  }
  v5.i32[0] = 1073741822;
  v4.i32[0] = v6;
  v7.i64[0] = v12.i32[0];
  v7.i64[1] = v12.i32[1];
  int8x16_t v8 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v4, v5), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v7));
  if (v6 <= 1073741822) {
    double v9 = (double)v12.i32[2];
  }
  else {
    double v9 = 1.79769313e308;
  }
  if (v6 <= 1073741822) {
    double v10 = (double)v12.i32[3];
  }
  else {
    double v10 = 1.79769313e308;
  }
  double v11 = *(double *)&v8.i64[1];
  result.origin.x = *(double *)v8.i64;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  return result;
}

- (BOOL)isReference
{
  if (CADeviceSupportsReferenceMode::once[0] != -1) {
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_225);
  }
  if (!CADeviceSupportsReferenceMode::supports_ref) {
    return 0;
  }
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)impl);
  }
  int32x4_t v4 = impl + 18;
  os_unfair_lock_lock(impl + 18);
  int os_unfair_lock_opaque_low = LOBYTE(impl[92]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v4);
  return os_unfair_lock_opaque_low != 0;
}

- (BOOL)isReferenceLimited
{
  if (CADeviceSupportsReferenceMode::once[0] != -1) {
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_225);
  }
  if (!CADeviceSupportsReferenceMode::supports_ref) {
    return 0;
  }
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)impl);
  }
  int32x4_t v4 = impl + 18;
  os_unfair_lock_lock(impl + 18);
  int v5 = BYTE1(impl[92]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

- (BOOL)isCloned
{
  impl = (unsigned __int16 *)self->_impl;
  unsigned int v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    unsigned int v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 1) & 1;
}

- (void)timingsControl
{
  return (char *)self->_impl + 464;
}

- (unsigned)displayId
{
  return *((_DWORD *)self->_impl + 26);
}

+ (id)displays
{
  ensure_displays();
  pthread_mutex_lock(&_displays_mutex);
  id v2 = (id)_displays;
  pthread_mutex_unlock(&_displays_mutex);
  return v2;
}

- (BOOL)isExternal
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return (unint64_t)(*((void *)impl + 56) - 1) < 2;
}

- (int64_t)displayType
{
  return *((void *)self->_impl + 56);
}

- (id)availablePresets
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (CADeviceSupportsReferenceMode::once[0] != -1) {
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_225);
  }
  if (!CADeviceSupportsReferenceMode::supports_ref) {
    return 0;
  }
  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)impl);
  }
  if (*((void *)impl + 56)) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  double v5 = *((double *)impl + 47);
  double v6 = *((double *)impl + 48);
  double v7 = *((double *)impl + 49);
  double v8 = *((double *)impl + 50);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  double v9 = [[CAUserAdjustment alloc] initWithXDelta:v5 yDelta:v6 luminanceScale:v7 timestamp:v8];
  v12[0] = [[CADisplayPreset alloc] initWithIsReference:0 userAdjustment:0];
  double v10 = [CADisplayPreset alloc];
  *(float *)&double v11 = CA::Display::Display::auto_luminance_boost((CA::Display::Display *)impl[26]);
  v12[1] = [(CADisplayPreset *)v10 initWithIsReference:1 userAdjustment:v9 autoLuminanceBoost:v11];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
}

- (CADisplayMode)currentMode
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  unsigned int v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  unint64_t v5 = *((void *)impl + 31);
  os_unfair_lock_unlock(v4);

  return (CADisplayMode *)create_mode((uint64_t)self, v5, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CADisplay:%@ %@>", -[CADisplay name](self, "name"), -[CADisplay deviceName](self, "deviceName")];
}

- (NSString)deviceName
{
  return (NSString *)*((void *)self->_impl + 12);
}

- (BOOL)supportsExtendedColors
{
  impl = (unsigned __int16 *)self->_impl;
  unsigned int v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    unsigned int v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 4) & 1;
}

- (double)latency
{
  impl = (double *)self->_impl;
  if (((_WORD)impl[95] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (double *)self->_impl;
  }
  return impl[51];
}

- (BOOL)isCloningSupported
{
  impl = (unsigned __int16 *)self->_impl;
  unsigned int v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    unsigned int v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 3) & 1;
}

- (double)hardwareRefreshRate
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  uint64_t v4 = 528;
  if ((*((unsigned char *)impl + 697) & 8) == 0) {
    uint64_t v4 = 504;
  }
  return 1.0 / round(1.0 / *(double *)((char *)impl + v4));
}

- (NSString)name
{
  return (NSString *)*((void *)self->_impl + 11);
}

- (id)_initWithDisplay:(void *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CADisplay;
  uint64_t v4 = [(CADisplay *)&v7 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
    *((void *)a3 + 10) = v4;
    if ((*((_WORD *)a3 + 380) & 0x400) != 0) {
      CA::Display::Display::update((CA::Display::Display *)a3);
    }
  }
  else if (a3)
  {
    (*(void (**)(void *))(*(void *)a3 + 8))(a3);
  }
  return v5;
}

- (unsigned)seed
{
  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  return impl[30];
}

- (int)processId
{
  impl = (int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (int *)self->_impl;
  }
  return impl[106];
}

- (unsigned)connectionSeed
{
  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  return impl[31];
}

- (BOOL)isOverscanned
{
  impl = (CA::Display::Display *)self->_impl;
  __int16 v4 = *((_WORD *)impl + 380);
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    __int16 v4 = *((_WORD *)self->_impl + 380);
  }
  return v4 & 1;
}

+ (id)TVOutDisplay
{
  return (id)_tvoutDisplay;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CADisplay;
  [(CADisplay *)&v4 dealloc];
}

- (NSString)overscanAdjustment
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  unsigned int v4 = *((_DWORD *)impl + 104) - 1;
  if (v4 > 2) {
    return 0;
  }
  else {
    return (NSString *)*((void *)&off_1E5272850 + v4);
  }
}

- (NSString)nativeOrientation
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  unsigned int v4 = *((_DWORD *)impl + 107) - 1;
  if (v4 > 2) {
    return (NSString *)@"rot0";
  }
  else {
    return (NSString *)*((void *)&off_1E5272868 + v4);
  }
}

- (CGSize)overscanAmounts
{
  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  float v4 = *((float *)impl + 74);
  float v5 = *((float *)impl + 75);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CADisplayMode)preferredMode
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  float v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  unint64_t v5 = *((void *)impl + 32);
  os_unfair_lock_unlock(v4);

  return (CADisplayMode *)create_mode((uint64_t)self, v5, 0);
}

- (BOOL)supportsVariableFrameDuration
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update(impl);
  }
  if ((CADisplay *)_mainDisplay != self) {
    return 0;
  }
  if (CAPrefers60HzAPT(void)::once[0] != -1) {
    dispatch_once(CAPrefers60HzAPT(void)::once, &__block_literal_global_3);
  }
  return CAPrefers60HzAPT(void)::enabled != 0;
}

- (CGRect)frame
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  int32x4_t v12 = *(int32x4_t *)(impl + 280);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  int32x4_t v5 = v12;
  if (v12.i32[2] <= v12.i32[3]) {
    int v6 = v12.i32[3];
  }
  else {
    int v6 = v12.i32[2];
  }
  v5.i32[0] = 1073741822;
  v4.i32[0] = v6;
  v7.i64[0] = v12.i32[0];
  v7.i64[1] = v12.i32[1];
  int8x16_t v8 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v4, v5), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v7));
  if (v6 <= 1073741822) {
    double v9 = (double)v12.i32[2];
  }
  else {
    double v9 = 1.79769313e308;
  }
  if (v6 <= 1073741822) {
    double v10 = (double)v12.i32[3];
  }
  else {
    double v10 = 1.79769313e308;
  }
  double v11 = *(double *)&v8.i64[1];
  result.origin.x = *(double *)v8.i64;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  return result;
}

- (id)allowedHDRModes
{
  v10[1] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  int32x4_t v4 = [(CADisplay *)self preferences];
  if (v4 && [(CADisplayPreferences *)v4 matchContent])
  {
    return [(CADisplay *)self supportedHDRModes];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    unint64_t v6 = *((void *)impl + 31);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    if (v6) {
      BOOL v7 = (v6 & 0x10000000) == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      unsigned int v8 = CA::WindowServer::Display::Mode::hdr_type(v6) - 1;
      if (v8 > 4) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = (uint64_t)*(&off_1E5272900 + v8);
      }
      v10[0] = v9;
      return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      return 0;
    }
  }
}

- (CADisplayPreferences)preferences
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update(impl);
  }
  int32x4_t v4 = [[CADisplayPreferences alloc] initWithMatchContent:(*((unsigned __int16 *)self->_impl + 380) >> 6) & 1 preferredHdrType:*((unsigned int *)self->_impl + 110)];

  return v4;
}

- (id)immutableCopy
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) != 0)
  {
    return self;
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)(impl + 8));
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    int32x4_t v4 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x300uLL, 0x743898A5uLL);
    int32x4_t v5 = v4;
    if (v4)
    {
      *(void *)int32x4_t v4 = &unk_1ED0303F0;
      v4[18] = 0;
      *((void *)v4 + 11) = CFRetain(*((CFTypeRef *)impl + 11));
      *((void *)v5 + 12) = CFRetain(*((CFTypeRef *)impl + 12));
      v5[26] = *((_DWORD *)impl + 26);
      *((void *)v5 + 14) = 0;
      *((void *)v5 + 15) = *((void *)impl + 15);
      CFTypeRef v6 = (CFTypeRef)*((void *)impl + 16);
      if (v6) {
        CFTypeRef v6 = CFRetain(v6);
      }
      *((void *)v5 + 16) = v6;
      CFTypeRef v7 = (CFTypeRef)*((void *)impl + 17);
      if (v7) {
        CFTypeRef v7 = CFRetain(v7);
      }
      *((void *)v5 + 17) = v7;
      CFTypeRef v8 = (CFTypeRef)*((void *)impl + 18);
      if (v8) {
        CFTypeRef v8 = CFRetain(v8);
      }
      *((void *)v5 + 18) = v8;
      CA::WindowServer::Display::ModeSet::ModeSet((CA::WindowServer::Display::ModeSet *)(v5 + 38), (const CA::WindowServer::Display::ModeSet *)(impl + 152));
      *((void *)v5 + 31) = *((void *)impl + 31);
      *((void *)v5 + 32) = *((void *)impl + 32);
      *(_OWORD *)(v5 + 66) = *(_OWORD *)(impl + 264);
      *(_OWORD *)(v5 + 70) = *(_OWORD *)(impl + 280);
      *((void *)v5 + 37) = *((void *)impl + 37);
      *((void *)v5 + 38) = *((void *)impl + 38);
      *((void *)v5 + 39) = *((void *)impl + 39);
      *((_OWORD *)v5 + 20) = 0u;
      *(void *)((char *)v5 + 333) = 0;
      *(_OWORD *)(v5 + 86) = 0u;
      v5[90] = 0;
      *((_OWORD *)v5 + 20) = *((_OWORD *)impl + 20);
      v5[84] = *((_DWORD *)impl + 84);
      *((unsigned char *)v5 + 340) = impl[340];
      *(_OWORD *)(v5 + 86) = *(_OWORD *)(impl + 344);
      v5[90] = *((_DWORD *)impl + 90);
      *((_WORD *)v5 + 184) = 0;
      *(_OWORD *)(v5 + 94) = 0u;
      *((void *)v5 + 49) = 0x3FF0000000000000;
      *((void *)v5 + 50) = 0;
      *((void *)v5 + 51) = *((void *)impl + 51);
      *((_OWORD *)v5 + 26) = *((_OWORD *)impl + 26);
      *((_OWORD *)v5 + 27) = *((_OWORD *)impl + 27);
      *((void *)v5 + 56) = *((void *)impl + 56);
      v5[114] = *((_DWORD *)impl + 114);
      *((void *)v5 + 58) = &unk_1ED0303D0;
      v5[118] = *((_DWORD *)impl + 118);
      v5[123] = 0;
      *(_OWORD *)(v5 + 119) = 0u;
      *((_OWORD *)v5 + 31) = *((_OWORD *)impl + 31);
      *((void *)v5 + 64) = *((void *)impl + 64);
      *((void *)v5 + 65) = *((void *)impl + 65);
      *((void *)v5 + 66) = *((void *)impl + 66);
      *(_OWORD *)(v5 + 134) = *(_OWORD *)(impl + 536);
      v5[138] = *((_DWORD *)impl + 138);
      *(_OWORD *)(v5 + 139) = 0u;
      *((_OWORD *)v5 + 36) = 0u;
      *((_OWORD *)v5 + 37) = 0u;
      *(_OWORD *)(v5 + 151) = 0u;
      *((_OWORD *)v5 + 39) = 0u;
      *((_OWORD *)v5 + 40) = 0u;
      *((_OWORD *)v5 + 41) = 0u;
      long long v9 = *((_OWORD *)impl + 42);
      *((void *)v5 + 86) = *((void *)impl + 86);
      *((_OWORD *)v5 + 42) = v9;
      *((unsigned char *)v5 + 696) = 10;
      char v10 = *((unsigned char *)v5 + 697) & 0xFA | impl[697] & 1;
      *((unsigned char *)v5 + 697) = v10;
      char v11 = v10 & 0xF3 | impl[697] & 8;
      *((unsigned char *)v5 + 697) = v11;
      *((unsigned char *)v5 + 697) = v11 & 0xEF | impl[697] & 0x10;
      *((void *)v5 + 88) = *((void *)impl + 88);
      *((void *)v5 + 89) = *((void *)impl + 89);
      v5[180] = *((_DWORD *)impl + 180);
      *(_OWORD *)(v5 + 186) = 0u;
      *(_OWORD *)(v5 + 181) = 0u;
      int v12 = v5[190] & 0xFFFE | *((_WORD *)impl + 380) & 1;
      *((_WORD *)v5 + 380) = v5[190] & 0xFFFE | *((_WORD *)impl + 380) & 1;
      unsigned int v13 = v12 & 0xFFFFFFFD | (2 * ((*((unsigned __int16 *)impl + 380) >> 1) & 1));
      *((_WORD *)v5 + 380) = v13;
      unsigned int v14 = v13 & 0xFFFFFFFB | (4 * ((*((unsigned __int16 *)impl + 380) >> 2) & 1));
      *((_WORD *)v5 + 380) = v14;
      unsigned int v15 = v14 & 0xFFFFFFF7 | (8 * ((*((unsigned __int16 *)impl + 380) >> 3) & 1));
      *((_WORD *)v5 + 380) = v15;
      unsigned int v16 = v15 & 0xFFFFFFEF | (16 * ((*((unsigned __int16 *)impl + 380) >> 4) & 1));
      *((_WORD *)v5 + 380) = v16;
      unsigned int v17 = v16 & 0xFFFFFFDF | (32 * ((*((unsigned __int16 *)impl + 380) >> 5) & 1));
      *((_WORD *)v5 + 380) = v17;
      *((_WORD *)v5 + 380) = *((_WORD *)impl + 380) & 0x40 | 0xA00 | v17 & 0xF1BF;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(impl + 8));
    v18 = [CADisplay alloc];
    return [(CADisplay *)v18 _initWithDisplay:v5];
  }
}

- (BOOL)isForceFixedRateLinksEnabled
{
  impl = (unsigned __int16 *)self->_impl;
  unsigned int v3 = impl[380];
  if ((v3 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    unsigned int v3 = impl[380];
  }
  return (v3 >> 8) & 1;
}

- (CAFrameRateRange)preferredFrameRateRangeForMaximumVelocity:(float)a3
{
  impl = self->_impl;
  if ((impl[380] & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  float v5 = 0.0;
  float v6 = 0.0;
  float v7 = 0.0;
  if ((*((unsigned char *)impl + 697) & 2) != 0) {
    float v5 = CAFrameRateRangeForVelocity(a3, 0);
  }
  result.preferred = v7;
  result.maximum = v6;
  result.minimum = v5;
  return result;
}

- (CAFrameRateRange)preferredFrameRateRangeForVelocity:(float)a3
{
  impl = self->_impl;
  if ((impl[380] & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  float v5 = 0.0;
  float v6 = 0.0;
  float v7 = 0.0;
  if ((*((unsigned char *)impl + 697) & 2) != 0) {
    float v5 = CAFrameRateRangeForVelocity(a3, 1);
  }
  result.preferred = v7;
  result.maximum = v6;
  result.minimum = v5;
  return result;
}

- (void)overrideDisplayTimings:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if ((impl[380] & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  if (*((void *)impl + 56) == 2)
  {
    if (!a3)
    {
      *((unsigned char *)impl + 697) &= 0xE7u;
      return;
    }
    float v5 = (void *)[a3 objectForKey:@"offset"];
    if (!v5) {
      goto LABEL_14;
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
    char v7 = *((unsigned char *)impl + 697);
    *((unsigned char *)impl + 697) = v7 | 0x10;
    uint64_t v8 = *((void *)impl + 68);
    if (v8 - 1 < v6)
    {
      BOOL v9 = (v7 & 8) == 0;
      uint64_t v10 = 264;
      if (v9) {
        uint64_t v10 = 248;
      }
      unint64_t v11 = CAHostTimeWithTime(*(double *)&impl[v10]);
      if (!v11) {
        goto LABEL_14;
      }
      *((void *)impl + 67) += vcvtad_u64_f64((double)(v6 - v8) / (double)v11);
    }
    else
    {
      *((void *)impl + 67) = 0;
    }
    *((void *)impl + 68) = v6;
LABEL_14:
    int v12 = (void *)[a3 objectForKey:@"refreshRate"];
    if (v12)
    {
      [v12 doubleValue];
      char v14 = *((unsigned char *)impl + 697);
      if ((v14 & 8) == 0 || fabs(*((double *)impl + 66) / v13 + -1.0) >= 0.0001)
      {
        *((double *)impl + 66) = v13;
        *((unsigned char *)impl + 697) = v14 | 8;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = ___ZN2CA7Display11DisplayLink28display_refresh_rate_changedEPNS0_7DisplayE_block_invoke;
        v15[3] = &__block_descriptor_40_e9_v16__0_v8l;
        v15[4] = impl;
        CA::Display::DisplayLink::foreach_display_link((uint64_t)v15);
      }
    }
  }
}

- (id)flipBookWithOptions:(id)a3
{
  impl = self->_impl;
  __int16 v6 = impl[380];
  if ((v6 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    __int16 v6 = impl[380];
  }
  if ((v6 & 0x20) == 0) {
    return 0;
  }
  id v8 = [[CAFlipBook alloc] _initWithDisplayId:[(CADisplay *)self displayId] options:a3];

  return v8;
}

- (id)flipBookWithCapacity:(unint64_t)a3
{
  return 0;
}

- (void)setForceFixedRateLinksEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  impl = self->_impl;
  if ((impl[380] & 0x800) != 0) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot change fixed rate link settings on an immutable CADisplay"];
  }
  if (v3 && *((void *)impl + 56)) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot enable fixed rate links on non-internal panel"];
  }
  id v6 = (id)objc_opt_new();
  [v6 setForceFixedRateLinks:v3];
  [(CADisplay *)self setDisplayProperties:v6];
}

- (float)autoLuminanceBoost
{
  impl = self->_impl;
  if ((impl[380] & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  BOOL v3 = (CA::Display::Display *)*((unsigned int *)impl + 26);

  return CA::Display::Display::auto_luminance_boost(v3);
}

- (void)setCurrentPreset:(id)a3
{
  mach_msg_return_t v19;
  mach_port_name_t name;
  mach_msg_header_t msg[2];
  long long v22;
  long long v23;
  long long v24;
  uint64_t v25;
  uint64_t vars8;

  v25 = *MEMORY[0x1E4F143B8];
  if (CADeviceSupportsReferenceMode::once[0] != -1) {
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_225);
  }
  if (CADeviceSupportsReferenceMode::supports_ref)
  {
    [a3 isReference];
    kdebug_trace();
    impl = (os_unfair_lock_s *)self->_impl;
    if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0) {
      CA::Display::Display::update((CA::Display::Display *)impl);
    }
    os_unfair_lock_lock(impl + 18);
    uint64_t v6 = *(void *)&impl[94]._os_unfair_lock_opaque;
    uint64_t v7 = *(void *)&impl[96]._os_unfair_lock_opaque;
    uint64_t v8 = *(void *)&impl[98]._os_unfair_lock_opaque;
    uint64_t v9 = *(void *)&impl[100]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(impl + 18);
    if ([a3 userAdjustment])
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "xDelta");
      uint64_t v6 = v10;
    }
    if ([a3 userAdjustment])
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "yDelta");
      uint64_t v7 = v11;
    }
    if ([a3 userAdjustment])
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "luminanceScale");
      uint64_t v8 = v12;
    }
    if ([a3 userAdjustment])
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "timestamp");
      uint64_t v9 = v13;
    }
    char v14 = [a3 isReference];
    uint32_t os_unfair_lock_opaque = impl[26]._os_unfair_lock_opaque;
    mach_port_t ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      mach_port_t v17 = ServerPort;
      v18 = (ipc_space_t *)MEMORY[0x1E4F14960];
      if (os_unfair_lock_opaque)
      {
        name = 0;
        if (!mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name))
        {
          *(_OWORD *)&msg[0].msgh_id = 0u;
          *(_OWORD *)&msg[0].msgh_size = 0u;
          msg[1].msgh_size = name;
          msg[1].msgh_local_port = 1310720;
          *(void *)&msg[1].msgh_voucher_port = *MEMORY[0x1E4F14068];
          LODWORD(v22) = os_unfair_lock_opaque;
          BYTE4(v22) = v14;
          *(_WORD *)((char *)&v22 + 5) = 0;
          BYTE7(v22) = 0;
          *((void *)&v22 + 1) = v6;
          *(void *)&v23 = v7;
          *((void *)&v23 + 1) = v8;
          *(void *)&v24 = v9;
          msg[0].msgh_bits = -2147483629;
          msg[0].msgh_remote_port = v17;
          *(void *)&msg[0].msgh_id = 0x100009D2ELL;
          if (MEMORY[0x1E4F14B18]) {
            voucher_mach_msg_set(msg);
          }
          v19 = mach_msg(msg, 1, 0x58u, 0, 0, 0, 0);
          if (v19)
          {
            if (v19 == -81182719)
            {
              x_log_crash("Unentitled call to server!");
              abort();
            }
          }
          else
          {
            v23 = 0u;
            v24 = 0u;
            v22 = 0u;
            memset(msg, 0, sizeof(msg));
            mach_msg(msg, 258, 0, 0x60u, name, 0x3E8u, 0);
            mach_port_mod_refs(*v18, name, 1u, -1);
            if ((impl[190]._os_unfair_lock_opaque & 0x800) == 0)
            {
              LOWORD(impl[190]._os_unfair_lock_opaque) |= 0x400u;
              CA::Display::Display::update((CA::Display::Display *)impl);
            }
          }
        }
      }
      mach_port_deallocate(*v18, v17);
    }
    [a3 isReference];
    kdebug_trace();
  }
}

- (CADisplayPreset)currentPreset
{
  if (CADeviceSupportsReferenceMode::once[0] != -1) {
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_225);
  }
  if (!CADeviceSupportsReferenceMode::supports_ref) {
    return 0;
  }
  impl = (unsigned __int8 *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)impl);
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  int v4 = impl[368];
  double v5 = *((double *)impl + 47);
  double v6 = *((double *)impl + 48);
  double v7 = *((double *)impl + 49);
  double v8 = *((double *)impl + 50);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (v4) {
    uint64_t v9 = [[CAUserAdjustment alloc] initWithXDelta:v5 yDelta:v6 luminanceScale:v7 timestamp:v8];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v11 = [CADisplayPreset alloc];
  *(float *)&double v12 = CA::Display::Display::auto_luminance_boost((CA::Display::Display *)*((unsigned int *)impl + 26));
  uint64_t v13 = [(CADisplayPreset *)v11 initWithIsReference:v4 != 0 userAdjustment:v9 autoLuminanceBoost:v12];

  return v13;
}

- (id)preferredHDRModes
{
  v9[6] = *MEMORY[0x1E4F143B8];
  id result = (id)objc_msgSend(-[CADisplay supportedHDRModes](self, "supportedHDRModes"), "mutableCopy");
  if (result)
  {
    id v4 = result;
    impl = (os_unfair_lock_s *)self->_impl;
    os_unfair_lock_lock(impl + 18);
    long long v7 = *(_OWORD *)&impl[80]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(impl + 18);
    CA::Display::Display::available_modes((CA::Display::Display *)__p, impl);
    char v6 = CA::WindowServer::Display::ModeSet::supports_4k60_dovi((unint64_t **)__p, (const EDIDAttributes *)v7);
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v9);
    std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((void *)__p[4]);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if ((v6 & 1) == 0) {
      [v4 removeObject:@"Dolby"];
    }
    return v4;
  }
  return result;
}

- (id)supportedHDRModes
{
  v24[3] = *MEMORY[0x1E4F143B8];
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  uint64_t v3 = *((void *)impl + 31);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (!v3) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  uint64_t v4 = *((void *)impl + 31);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if ((v4 & 0x10000000) != 0) {
    return 0;
  }
  long long v22 = 0u;
  memset(v23, 0, sizeof(v23));
  memset(v21, 0, sizeof(v21));
  CA::Display::Display::available_modes((CA::Display::Display *)v21, (os_unfair_lock_s *)impl);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  int v5 = *((_DWORD *)impl + 84);
  char v6 = impl[340];
  long long v12 = *(_OWORD *)(impl + 344);
  long long v13 = *((_OWORD *)impl + 20);
  int v7 = *((_DWORD *)impl + 90);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v24[0] = @"Dolby";
  v24[1] = @"HDR10";
  v24[2] = @"SDR";
  double v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __30__CADisplay_supportedHDRModes__block_invoke;
  v14[3] = &__block_descriptor_172_e8_32c39_ZTSN2CA12WindowServer7Display7ModeSetE128c47_ZTSN2CA12WindowServer7Display14EDIDAttributesE_e21_B24__0__NSString_8_16l;
  CA::WindowServer::Display::ModeSet::ModeSet((CA::WindowServer::Display::ModeSet *)__p, (const CA::WindowServer::Display::ModeSet *)v21);
  v16[3] = v13;
  int v17 = v5;
  char v18 = v6;
  long long v19 = v12;
  int v20 = v7;
  uint64_t v10 = objc_msgSend(v8, "filteredArrayUsingPredicate:", objc_msgSend(v9, "predicateWithBlock:", v14));
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v16);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((void *)__p[4]);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v23);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((void *)v22);
  if (*(void *)&v21[0])
  {
    *((void *)&v21[0] + 1) = *(void *)&v21[0];
    operator delete(*(void **)&v21[0]);
  }
  return v10;
}

uint64_t __30__CADisplay_supportedHDRModes__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:@"Dolby"])
  {
    int v4 = 5;
  }
  else if ([a2 isEqualToString:@"HDR10"])
  {
    int v4 = 3;
  }
  else
  {
    if ([a2 isEqualToString:@"SDR"]) {
      return 1;
    }
    int v4 = 0;
  }
  unint64_t v6 = CA::WindowServer::Display::ModeSet::preferred_mode_with_criteria((unint64_t **)(a1 + 32), v4, 0, 1, (unsigned int *)(a1 + 128), 0.0, 0.0, 0.0);
  unsigned int v7 = CA::WindowServer::Display::Mode::hdr_type(v6) - 1;
  if (v7 > 4) {
    double v8 = 0;
  }
  else {
    double v8 = *(&off_1E5272900 + v7);
  }

  return [v8 isEqual:a2];
}

- (id)preferredModeWithCriteria:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update(impl);
  }
  unint64_t v6 = [(CADisplay *)self preferences];
  unsigned int v7 = (void *)[a3 hdrMode];
  if ([v7 isEqualToString:@"Dolby"])
  {
    int v8 = 5;
  }
  else if ([v7 isEqualToString:@"HDR10"])
  {
    int v8 = 3;
  }
  else
  {
    int v8 = [v7 isEqualToString:@"SDR"];
  }
  uint64_t v9 = [(CADisplayPreferences *)v6 preferredHdrMode];
  if ([(NSString *)v9 isEqualToString:@"Dolby"])
  {
    uint64_t v10 = 5;
  }
  else if ([(NSString *)v9 isEqualToString:@"HDR10"])
  {
    uint64_t v10 = 3;
  }
  else
  {
    uint64_t v10 = [(NSString *)v9 isEqualToString:@"SDR"];
  }
  [a3 refreshRate];
  double v12 = v11;
  HIDWORD(v24) = 0;
  long long v13 = (char *)self->_impl;
  os_unfair_lock_lock((os_unfair_lock_t)v13 + 18);
  long long v23 = *((_OWORD *)v13 + 20);
  LODWORD(v24) = *((_DWORD *)v13 + 84);
  BYTE4(v24) = v13[340];
  long long v25 = *(_OWORD *)(v13 + 344);
  LODWORD(v26) = *((_DWORD *)v13 + 90);
  os_unfair_lock_unlock((os_unfair_lock_t)v13 + 18);
  long long v29 = 0u;
  memset(v30, 0, sizeof(v30));
  *(_OWORD *)__p = 0u;
  long long v28 = 0u;
  CA::Display::Display::available_modes((CA::Display::Display *)__p, (os_unfair_lock_s *)self->_impl);
  objc_msgSend(a3, "resolution", v23, v24, v25, v26);
  double v15 = v14;
  double v17 = v16;
  int v18 = [(CADisplayPreferences *)v6 matchContent];
  float v19 = v12;
  unint64_t v20 = CA::WindowServer::Display::ModeSet::preferred_mode_with_criteria((unint64_t **)__p, v8, v10, v18, (unsigned int *)&v23, v15, v17, v19);
  if (v20) {
    id mode = create_mode((uint64_t)self, v20, (uint64_t)__p);
  }
  else {
    id mode = 0;
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v30);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((void *)v29);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return mode;
}

- (void)setPreferences:(id)a3
{
  mach_msg_return_t v14;
  int v15;
  ipc_space_t v16;
  mach_msg_header_t msg;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t vars8;

  long long v22 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if ((impl[380] & 0x800) != 0)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot change preferences on an immutable CADisplay"];
    impl = self->_impl;
  }
  int v6 = [a3 matchContent];
  int v7 = [a3 _preferredHdrType];
  int v8 = v7;
  __int16 v9 = impl[380];
  if ((v9 & 0x400) != 0 || v6 != (v9 & 0x40) >> 6 || *((_DWORD *)impl + 110) != v7)
  {
    int v10 = *((_DWORD *)impl + 26);
    mach_port_name_t ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      mach_port_name_t v12 = ServerPort;
      if (!v10)
      {
LABEL_30:
        double v16 = *MEMORY[0x1E4F14960];
        mach_port_deallocate(v16, v12);
        return;
      }
      int v18 = *MEMORY[0x1E4F14068];
      float v19 = v10;
      unint64_t v20 = v6;
      v21 = v8;
      mach_port_t reply_port = mig_get_reply_port();
      *(void *)&msg.msgh_bits = 5395;
      msg.msgh_remote_port = v12;
      msg.msgh_local_port = reply_port;
      *(void *)&msg.msgh_voucher_port = 0x9D2F00000000;
      if (MEMORY[0x1E4F14B18])
      {
        voucher_mach_msg_set(&msg);
        mach_port_t reply_port = msg.msgh_local_port;
      }
      double v14 = mach_msg(&msg, 3, 0x2Cu, 0x2Cu, reply_port, 0, 0);
      double v15 = v14;
      if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(msg.msgh_local_port);
        goto LABEL_27;
      }
      if (v14)
      {
        mig_dealloc_reply_port(msg.msgh_local_port);
      }
      else
      {
        if (msg.msgh_id == 71)
        {
          double v15 = -308;
        }
        else if (msg.msgh_id == 40339)
        {
          double v15 = -300;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            double v15 = v19;
            if (!v19)
            {
LABEL_27:
              if (!v15 && (impl[380] & 0x800) == 0)
              {
                impl[380] |= 0x400u;
                CA::Display::Display::update((CA::Display::Display *)impl);
              }
              goto LABEL_30;
            }
          }
        }
        else
        {
          double v15 = -301;
        }
        mach_msg_destroy(&msg);
      }
      if (v15 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      goto LABEL_27;
    }
  }
}

- (void)setLatency:(double)a3
{
  mach_msg_return_t v15;
  int v16;
  _OWORD v17[4];
  uint8_t buf[16];
  long long v19;
  _OWORD v20[6];
  uint64_t v21;
  uint64_t vars8;

  v21 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) != 0) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot change properties on an immutable CADisplay"];
  }
  if (*((double *)impl + 51) != a3)
  {
    CFStringRef v5 = (const __CFString *)CA::Display::Display::retain_uuid((os_unfair_lock_s *)impl);
    if (v5)
    {
      CFStringRef v6 = v5;
      os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
      uint64_t v7 = *((void *)impl + 31);
      os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
      int v8 = *((_DWORD *)impl + 26);
      mach_port_name_t ServerPort = CARenderServerGetServerPort(0);
      memset(v17, 0, sizeof(v17));
      CFStringGetCString(v6, (char *)v17, 64, 0x8000100u);
      if (!ServerPort)
      {
LABEL_37:
        CFRelease(v6);
        return;
      }
      if (!v8)
      {
LABEL_36:
        mach_port_deallocate(*MEMORY[0x1E4F14960], ServerPort);
        goto LABEL_37;
      }
      float v19 = 0u;
      memset(v20, 0, 92);
      *(_OWORD *)buf = 0u;
      *((void *)&v19 + 1) = *MEMORY[0x1E4F14068];
      LODWORD(v20[0]) = v8;
      if (MEMORY[0x1E4F149B0]) {
        int v10 = mig_strncpy_zerofill((char *)v20 + 12, (const char *)v17, 64);
      }
      else {
        int v10 = mig_strncpy((char *)v20 + 12, (const char *)v17, 64);
      }
      DWORD1(v20[0]) = 0;
      DWORD2(v20[0]) = v10;
      mach_msg_size_t v12 = ((v10 + 3) & 0xFFFFFFFC) + 60;
      long long v13 = &buf[(v10 + 3) & 0xFFFFFFFC];
      *(void *)(v13 + 44) = v7;
      *(double *)(v13 + 52) = a3;
      mach_port_t reply_port = mig_get_reply_port();
      *(_DWORD *)&buf[8] = ServerPort;
      *(_DWORD *)&buf[12] = reply_port;
      *(_DWORD *)buf = 5395;
      *(void *)&float v19 = 0x9D3000000000;
      if (MEMORY[0x1E4F14B18])
      {
        voucher_mach_msg_set((mach_msg_header_t *)buf);
        mach_port_t reply_port = *(_DWORD *)&buf[12];
      }
      double v15 = mach_msg((mach_msg_header_t *)buf, 3, v12, 0x2Cu, reply_port, 0, 0);
      double v16 = v15;
      if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(*(mach_port_t *)&buf[12]);
LABEL_34:
        if ((*((_WORD *)impl + 380) & 0x800) == 0) {
          *((_WORD *)impl + 380) |= 0x400u;
        }
        goto LABEL_36;
      }
      if (v15)
      {
        mig_dealloc_reply_port(*(mach_port_t *)&buf[12]);
      }
      else
      {
        if (DWORD1(v19) == 71)
        {
          double v16 = -308;
        }
        else if (DWORD1(v19) == 40340)
        {
          double v16 = -300;
          if ((*(_DWORD *)buf & 0x80000000) == 0 && *(_DWORD *)&buf[4] == 36 && !*(_DWORD *)&buf[8])
          {
            double v16 = v20[0];
            if (!LODWORD(v20[0])) {
              goto LABEL_34;
            }
          }
        }
        else
        {
          double v16 = -301;
        }
        mach_msg_destroy((mach_msg_header_t *)buf);
      }
      if (v16 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      goto LABEL_34;
    }
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      double v11 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_ERROR, "Failed to set display latency - missing UUID", buf, 2u);
      }
    }
  }
}

- (int)linkQuality
{
  return -1;
}

- (CADisplayAttributes)externalDisplayAttributes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  if ((unint64_t)(*((void *)impl + 56) - 1) > 1) {
    return 0;
  }
  int v4 = [CADisplayAttributes alloc];
  CFStringRef v5 = (char *)self->_impl;
  os_unfair_lock_lock((os_unfair_lock_t)v5 + 18);
  long long v7 = *((_OWORD *)v5 + 20);
  int v8 = *((_DWORD *)v5 + 84);
  char v9 = v5[340];
  long long v10 = *(_OWORD *)(v5 + 344);
  int v11 = *((_DWORD *)v5 + 90);
  os_unfair_lock_unlock((os_unfair_lock_t)v5 + 18);
  return (CADisplayAttributes *)[(CADisplayAttributes *)v4 _initWithAttributes:&v7];
}

- (unsigned)odLUTVersion
{
  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  return impl[109];
}

- (NSString)currentOrientation
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  unsigned int v4 = *((_DWORD *)impl + 108) - 1;
  if (v4 > 2) {
    return (NSString *)@"rot0";
  }
  else {
    return (NSString *)*((void *)&off_1E5272868 + v4);
  }
}

- (BOOL)isCloning
{
  impl = (unsigned __int16 *)self->_impl;
  unsigned int v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    unsigned int v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 2) & 1;
}

- (double)maximumLogicalScale
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((float *)impl + 179);
}

- (double)minimumLogicalScale
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((float *)impl + 178);
}

- (CGSize)logicalScale
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  double v4 = *((float *)impl + 176);
  double v5 = *((float *)impl + 177);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setOverscanAdjustment:(id)a3
{
  double v5 = objc_alloc_init(CADisplayProperties);
  [(CADisplayProperties *)v5 setOverscanAdjustment:a3];
  [(CADisplay *)self setDisplayProperties:v5];
}

- (double)overscanAmount
{
  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  float v4 = *((float *)impl + 74);
  float v5 = *((float *)impl + 75);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (v4 >= v5) {
    return v5;
  }
  else {
    return v4;
  }
}

- (void)overrideMinimumFrameDuration:(int64_t)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if ((impl[380] & 0x800) != 0) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot change properties on an immutable CADisplay"];
  }
  int v5 = a3 & ~(a3 >> 63);
  if (*((_DWORD *)impl + 138) != v5)
  {
    *((_DWORD *)impl + 138) = v5;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___ZN2CA7Display11DisplayLink28display_refresh_rate_changedEPNS0_7DisplayE_block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = impl;
    CA::Display::DisplayLink::foreach_display_link((uint64_t)v6);
  }
}

- (BOOL)isSupported
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0) {
    CA::Display::Display::update(impl);
  }
  return 1;
}

- (CGRect)safeBounds
{
  impl = (char *)self->_impl;
  __int16 v3 = *((_WORD *)impl + 380);
  if ((v3 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
    __int16 v3 = *((_WORD *)impl + 380);
  }
  if ((v3 & 1) != 0 && *((_DWORD *)impl + 104) == 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    *(void *)&long long v5 = *((void *)impl + 33);
    long long v32 = v5;
    int32x2_t v31 = *(int32x2_t *)(impl + 272);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    unsigned int v30 = *((_DWORD *)impl + 74);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    unsigned int v29 = *((_DWORD *)impl + 75);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    int v8 = v31.i32[0];
    if (v31.i32[0] <= v31.i32[1]) {
      int v9 = v31.i32[1];
    }
    else {
      int v9 = v31.i32[0];
    }
    if (v31.i32[0] >= v31.i32[1]) {
      int v8 = v31.i32[1];
    }
    if (v9 > 1073741822 || v8 < 1)
    {
      v11.i64[0] = v32;
      v11.u64[1] = (unint64_t)v31;
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
      v23.i64[0] = v31.i32[0];
      v23.i64[1] = v31.i32[1];
      __asm { FMOV            V2.2D, #0.5 }
      int32x2_t v25 = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q2, vcvtq_f64_s64(v23), vmulq_f64(vcvtq_f64_f32(vsub_f32(_D0, (float32x2_t)__PAIR64__(v29, v30))), _Q2))));
      v7.i64[1] = *((void *)&v32 + 1);
      *(int32x2_t *)v7.i8 = vadd_s32(*(int32x2_t *)&v32, v25);
      v26.i64[0] = v7.i64[0];
      v26.u64[1] = (unint64_t)vsub_s32(v31, vadd_s32(v25, v25));
      if (v26.i32[3] < 1 || v26.i32[2] < 1) {
        unsigned int v28 = -1;
      }
      else {
        unsigned int v28 = 0;
      }
      int32x4_t v6 = vdupq_n_s32(v28);
      int8x16_t v11 = vbslq_s8((int8x16_t)v6, (int8x16_t)v7, v26);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    int8x16_t v33 = *(int8x16_t *)(impl + 264);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    int8x16_t v11 = v33;
  }
  if (v11.i32[2] <= v11.i32[3]) {
    int v12 = v11.i32[3];
  }
  else {
    int v12 = v11.i32[2];
  }
  v6.i32[0] = 1073741822;
  v7.i32[0] = v12;
  v13.i64[0] = v11.i32[0];
  v13.i64[1] = v11.i32[1];
  int8x16_t v14 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v7, v6), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v13));
  if (v12 <= 1073741822) {
    double v15 = (double)v11.i32[2];
  }
  else {
    double v15 = 1.79769313e308;
  }
  if (v12 <= 1073741822) {
    double v16 = (double)v11.i32[3];
  }
  else {
    double v16 = 1.79769313e308;
  }
  double v17 = *(double *)&v14.i64[1];
  result.origin.x = *(double *)v14.i64;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v17;
  return result;
}

- (void)setAllowsVirtualModes:(BOOL)a3
{
}

- (BOOL)allowsVirtualModes
{
  return 0;
}

- (void)setColorMode:(id)a3
{
}

- (NSString)colorMode
{
  return (NSString *)@"auto";
}

- (void)setCurrentMode:(id)a3
{
  if ((CADisplay *)[a3 _display] == self && objc_msgSend(a3, "_mode"))
  {
    long long v5 = objc_alloc_init(CADisplayProperties);
    [(CADisplayProperties *)v5 setCurrentMode:a3];
    [(CADisplay *)self setDisplayProperties:v5];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAInvalidDisplayMode", @"mode %@ is not valid for display %@", a3, self format];
  }
}

- (NSString)transportType
{
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  unsigned int v4 = *((_DWORD *)impl + 114) - 1;
  if (v4 > 4) {
    return (NSString *)@"other";
  }
  else {
    return (NSString *)*((void *)&off_1E5272828 + v4);
  }
}

- (CGSize)nativeSize
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  unsigned int v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  int v5 = *((_DWORD *)impl + 79);
  int v6 = *((_DWORD *)impl + 78);
  os_unfair_lock_unlock(v4);
  double v7 = (double)v6;
  double v8 = (double)v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)physicalSize
{
  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  float v4 = *((float *)impl + 76);
  float v5 = *((float *)impl + 77);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSString)productName
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  float v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  float v5 = (const void *)*((void *)impl + 18);
  if (v5) {
    double v6 = (void *)CFRetain(v5);
  }
  else {
    double v6 = 0;
  }
  os_unfair_lock_unlock(v4);

  return (NSString *)v6;
}

- (NSString)containerId
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  float v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  float v5 = (const void *)*((void *)impl + 17);
  if (v5) {
    double v6 = (void *)CFRetain(v5);
  }
  else {
    double v6 = 0;
  }
  os_unfair_lock_unlock(v4);

  return (NSString *)v6;
}

- (void)setDisallowedLayersCallback:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) != 0) {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot change properties on an immutable CADisplay"];
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 181);
  unint64_t v5 = *((void *)impl + 91);
  BOOL v7 = v5 == (void)a3;
  unint64_t v6 = (unint64_t)a3 | v5;
  BOOL v7 = v7 || v6 == 0;
  if (!v7)
  {
    int v8 = *((_DWORD *)impl + 26);
    mach_port_t ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      mach_port_t v10 = ServerPort;
      if (v8)
      {
        int8x16_t v11 = (const void *)*((void *)impl + 91);
        if (v11)
        {
          _Block_release(v11);
          *((void *)impl + 91) = 0;
        }
        if (a3)
        {
          *((void *)impl + 91) = _Block_copy(a3);
          if (!*((_DWORD *)impl + 184))
          {
            long long v21 = 0u;
            memset(__str, 0, sizeof(__str));
            snprintf((char *)__str, 0x40uLL, "CADisplay.%i.disallowedLayersNotification", *((_DWORD *)impl + 26));
            uint64_t v12 = CA::MachPortUtil::ClientIPC::create((mach_port_context_t)(impl + 736), (const char *)__str);
            CA_CLIENT_MACH_PORT_ALLOCATE_FAILED(v12, *((_DWORD *)impl + 184));
            int64x2_t v13 = *((void *)impl + 94);
            if (v13) {
              dispatch_activate(v13);
            }
            int v14 = *((_DWORD *)impl + 184);
            *(_OWORD *)&msg[20] = 0u;
            *(_DWORD *)&msg[28] = v14;
            int v17 = 1245184;
            *(_OWORD *)&msg[4] = 0u;
            uint64_t v18 = *MEMORY[0x1E4F14068];
            int v19 = v8;
            *(_DWORD *)msg = -2147483629;
            *(_DWORD *)&msg[8] = v10;
            *(void *)&msg[20] = 0x100009D31;
            if (MEMORY[0x1E4F14B18]) {
              voucher_mach_msg_set((mach_msg_header_t *)msg);
            }
            mach_msg((mach_msg_header_t *)msg, 1, 0x34u, 0, 0, 0, 0);
          }
        }
        else
        {
          mach_msg_size_t v15 = *((_DWORD *)impl + 184);
          *(_OWORD *)&__str[0].msgh_id = 0u;
          __str[1].msgh_size = v15;
          __str[1].msgh_local_port = 1245184;
          *(_OWORD *)&__str[0].msgh_size = 0u;
          *(void *)&__str[1].msgh_voucher_port = *MEMORY[0x1E4F14068];
          LODWORD(v21) = v8;
          __str[0].msgh_bits = -2147483629;
          __str[0].msgh_remote_port = v10;
          *(void *)&__str[0].msgh_id = 0x100009D32;
          if (MEMORY[0x1E4F14B18]) {
            voucher_mach_msg_set(__str);
          }
          mach_msg(__str, 1, 0x34u, 0, 0, 0, 0);
          CA::MachPortUtil::ClientIPC::destroy((CA::MachPortUtil::ClientIPC *)(impl + 736));
        }
      }
      mach_port_deallocate(*MEMORY[0x1E4F14960], v10);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 181);
}

- (BOOL)setDisplayProperties:(id)a3
{
  mach_msg_return_t v25;
  mach_msg_return_t v26;
  mach_port_name_t name;
  mach_msg_header_t msg[2];
  long long v30;
  long long v31;
  long long v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if ((impl[190] & 0x800) != 0)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CADisplay" format:@"cannot change properties on an immutable CADisplay"];
  }
  else
  {
    if ([a3 needsUpdateForField:1] && objc_msgSend(a3, "currentMode")) {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "currentMode"), "_mode");
    }
    else {
      uint64_t v5 = 0;
    }
    if ([a3 needsUpdateForField:2]
      && (unint64_t v6 = (void *)[a3 overscanAdjustment]) != 0)
    {
      BOOL v7 = v6;
      if ([v6 isEqualToString:@"none"])
      {
        int v8 = 1;
      }
      else if ([v7 isEqualToString:@"scaleContent"])
      {
        int v8 = 2;
      }
      else if ([v7 isEqualToString:@"insetBounds"])
      {
        int v8 = 3;
      }
      else
      {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    if ([a3 needsUpdateForField:4]) {
      char v9 = [a3 dmrrEnabled];
    }
    else {
      char v9 = 0;
    }
    if ([a3 needsUpdateForField:128]) {
      char v10 = [a3 forceFixedRateLinks];
    }
    else {
      char v10 = 0;
    }
    if ([a3 needsUpdateForField:8]) {
      unsigned int v11 = [a3 connectionSeed];
    }
    else {
      unsigned int v11 = 0;
    }
    double v12 = 1.0;
    double v13 = 1.0;
    if ([a3 needsUpdateForField:16])
    {
      [a3 logicalScale];
      double v12 = v14;
      double v13 = v15;
    }
    if ([a3 needsUpdateForField:32]) {
      int v16 = [a3 pointScale];
    }
    else {
      int v16 = 1;
    }
    int v17 = [a3 updateMask];
    unsigned int v18 = impl[26];
    mach_port_name_t ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      mach_port_name_t v20 = ServerPort;
      long long v21 = (ipc_space_t *)MEMORY[0x1E4F14960];
      if (!v18)
      {
        BOOL v22 = 0;
LABEL_48:
        mach_port_deallocate(*v21, v20);
        return v22;
      }
      name = 0;
      if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name)) {
        goto LABEL_29;
      }
      *(float *)&unsigned int v23 = v12;
      *(float *)&unsigned int v24 = v13;
      *(_OWORD *)&msg[0].msgh_id = 0u;
      *(_OWORD *)&msg[0].msgh_size = 0u;
      msg[1].msgh_size = name;
      msg[1].msgh_local_port = 1310720;
      *(void *)&msg[1].msgh_voucher_port = *MEMORY[0x1E4F14068];
      *(void *)&unsigned int v30 = v18;
      *((void *)&v30 + 1) = v5;
      LODWORD(v31) = v8;
      BYTE4(v31) = v9;
      *(_WORD *)((char *)&v31 + 5) = 0;
      BYTE7(v31) = 0;
      *((void *)&v31 + 1) = __PAIR64__(v23, v11);
      *(void *)&long long v32 = __PAIR64__(v16, v24);
      DWORD2(v32) = 1;
      BYTE12(v32) = v10;
      HIBYTE(v32) = 0;
      *(_WORD *)((char *)&v32 + 13) = 0;
      int8x16_t v33 = v17;
      msg[0].msgh_bits = -2147483629;
      msg[0].msgh_remote_port = v20;
      *(void *)&msg[0].msgh_id = 0x100009D2DLL;
      if (MEMORY[0x1E4F14B18]) {
        voucher_mach_msg_set(msg);
      }
      int32x2_t v25 = mach_msg(msg, 1, 0x64u, 0, 0, 0, 0);
      if (v25)
      {
        BOOL v22 = 0;
        if (v25 == -81182719)
        {
          x_log_crash("Unentitled call to server!");
          abort();
        }
        goto LABEL_47;
      }
      int32x2_t v31 = 0u;
      long long v32 = 0u;
      unsigned int v30 = 0u;
      memset(msg, 0, sizeof(msg));
      int8x16_t v26 = mach_msg(msg, 258, 0, 0x60u, name, 0x3E8u, 0);
      mach_port_mod_refs(*MEMORY[0x1E4F14960], name, 1u, -1);
      if ((impl[190] & 0x800) == 0)
      {
        *((_WORD *)impl + 380) |= 0x400u;
        CA::Display::Display::update((CA::Display::Display *)impl);
      }
      if (v26 || !msg[0].msgh_id) {
LABEL_29:
      }
        BOOL v22 = 0;
      else {
        BOOL v22 = 1;
      }
LABEL_47:
      long long v21 = (ipc_space_t *)MEMORY[0x1E4F14960];
      goto LABEL_48;
    }
  }
  return 0;
}

- (id)stateControl
{
  id v2 = [[CADisplayStateControl alloc] _initWithDisplayId:[(CADisplay *)self displayId]];

  return v2;
}

- (void)update
{
}

- (void)_notifyDisallowedLayersChange:(BOOL)a3
{
  BOOL v3 = a3;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 181);
  uint64_t v5 = *(void *)&impl[182]._os_unfair_lock_opaque;
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3);
  }

  os_unfair_lock_unlock(impl + 181);
}

- (void)_finalize
{
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) == 0)
  {
    *((_WORD *)impl + 380) |= 0x400u;
    pthread_mutex_lock((pthread_mutex_t *)(impl + 8));
    uint64_t v3 = 528;
    uint64_t v4 = 496;
    if ((impl[697] & 8) != 0) {
      uint64_t v4 = 528;
    }
    double v5 = *(double *)&impl[v4];
    if ((impl[697] & 8) == 0) {
      uint64_t v3 = 512;
    }
    double v6 = *(double *)&impl[v3];
    if ((*((_WORD *)impl + 380) & 0x200) != 0)
    {
      if (v5 != 0.0) {
        [*((id *)impl + 10) willChangeValueForKey:@"refreshRate"];
      }
      if (v6 != 0.0) {
        [*((id *)impl + 10) willChangeValueForKey:@"heartbeatRate"];
      }
      [*((id *)impl + 10) willChangeValueForKey:@"minimumFrameDuration"];
    }
    *((_OWORD *)impl + 31) = 0u;
    *((_OWORD *)impl + 32) = 0u;
    CA::Display::DisplayTimingsControl::set_timings_shmem((os_unfair_lock_s *)impl + 116, 0);
    if ((*((_WORD *)impl + 380) & 0x200) != 0)
    {
      if (v5 != 0.0) {
        [*((id *)impl + 10) didChangeValueForKey:@"refreshRate"];
      }
      if (v6 != 0.0) {
        [*((id *)impl + 10) didChangeValueForKey:@"heartbeatRate"];
      }
      [*((id *)impl + 10) didChangeValueForKey:@"minimumFrameDuration"];
    }
    pthread_mutex_unlock((pthread_mutex_t *)(impl + 8));
  }
}

- (void)_invalidate
{
  impl = self->_impl;
  if ((impl[380] & 0x800) == 0) {
    impl[380] |= 0x400u;
  }
}

- (void)_postNotification:(int64_t)a3
{
  if (*((void *)self->_impl + 14))
  {
    if (a3 == 1)
    {
      CA::Display::DisplayLink::foreach_display_link((uint64_t)&__block_literal_global_385);
    }
    else if (!a3)
    {
      [(CADisplay *)self update];
    }
  }
}

+ (void)updateDisplays
{
  displays_up_to_date = 0;
}

- (__CFDictionary)_copyDebugProperties
{
  mach_msg_return_t v7;
  int v8;
  unsigned int v9;
  const UInt8 *v10;
  CFAllocatorRef v11;
  mach_vm_size_t v12;
  CFDataRef v13;
  __CFDictionary *v14;
  int msg;
  unsigned char msg_4[60];
  uint64_t v18;

  unsigned int v18 = *MEMORY[0x1E4F143B8];
  int ServerPort = CARenderServerGetServerPort(0);
  if (!ServerPort) {
    return 0;
  }
  int v4 = ServerPort;
  unsigned int v5 = [(CADisplay *)self displayId];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg_4[28] = v5;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = v4;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(void *)&msg_4[12] = 0x9D6100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_t reply_port = *(_DWORD *)&msg_4[8];
  }
  BOOL v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  int v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  }
  else
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
    }
    else
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        int v8 = -308;
      }
      else if (*(_DWORD *)&msg_4[16] == 40389)
      {
        if (msg < 0)
        {
          int v8 = -300;
          if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
          {
            char v9 = *(_DWORD *)&msg_4[36];
            if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
            {
              char v10 = *(const UInt8 **)&msg_4[24];
              goto LABEL_29;
            }
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          int v8 = -300;
          if (*(_DWORD *)&msg_4[28])
          {
            if (*(_DWORD *)&msg_4[4]) {
              int v8 = -300;
            }
            else {
              int v8 = *(_DWORD *)&msg_4[28];
            }
          }
        }
        else
        {
          int v8 = -300;
        }
      }
      else
      {
        int v8 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }
    if (v8 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
  }
  char v10 = 0;
  char v9 = 0;
LABEL_29:
  unsigned int v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF98];
  double v12 = v9;
  double v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF98], v10, v9);
  mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)v10, v12);
  if (!v13) {
    return 0;
  }
  double v14 = (__CFDictionary *)CFPropertyListCreateWithData(v11, v13, 0, 0, 0);
  CFRelease(v13);
  return v14;
}

@end