@interface CAWindowServerDisplay
- ($05FBF485E644614EAF311772389EC12B)chromaticities;
- ($94F468A8D4C62B317260615823C2B210)whitepoint;
- (BOOL)abortWhitePointRamp:(id *)a3 error:(id *)a4;
- (BOOL)accessibilityFrameRateLimitEnabled;
- (BOOL)allowsDisplayCompositing;
- (BOOL)allowsExtendedDynamicRange;
- (BOOL)allowsVirtualModes;
- (BOOL)allowsWirelessColorFiltering;
- (BOOL)blankingRemovesPower;
- (BOOL)brightnessAvailable;
- (BOOL)canUpdateWithFlags:(unsigned int)a3;
- (BOOL)commitBrightness:(id *)a3;
- (BOOL)commitBrightness:(id *)a3 withBlock:(id)a4;
- (BOOL)commitPreset;
- (BOOL)cursorEnabled;
- (BOOL)cursorHidden;
- (BOOL)disabled;
- (BOOL)disablesUpdates;
- (BOOL)enabled;
- (BOOL)finishExternalUpdate:(void *)a3 withFlags:(unsigned int)a4;
- (BOOL)finishExternalUpdate:(void *)a3 withFlags:(unsigned int)a4 debugInfo:(unint64_t)a5;
- (BOOL)forceCommitBrightness:(id *)a3 withBlock:(id)a4;
- (BOOL)invertsColors;
- (BOOL)isBlanked;
- (BOOL)isDetaching;
- (BOOL)isFlipBookActive;
- (BOOL)isFlipBookEnabled;
- (BOOL)isFlipBookSuppressed;
- (BOOL)isGrayscale;
- (BOOL)isMirroringEnabled;
- (BOOL)isReferencePreset;
- (BOOL)isSecure;
- (BOOL)needsUpdate;
- (BOOL)preserveAppleSRGBGammaResponse;
- (BOOL)scalePreservesAspect;
- (BOOL)secureIndicatorsEnabled;
- (BOOL)setDigitalModes:(id)a3;
- (BOOL)setDigitalModes:(id)a3 withTimings:(id)a4;
- (BOOL)setWhitePoint:(id *)a3 rampDuration:(double)a4 error:(id *)a5;
- (BOOL)supportsColorSpaces;
- (BOOL)supportsCursor;
- (BOOL)supportsExtendedColors;
- (BOOL)tracksCarPlayRegions;
- (BOOL)tripleBuffered;
- (BOOL)usesPreferredModeRefreshRate;
- (BOOL)whitePointAvailable;
- (BOOL)whitePointD50XYZ;
- (CAPixelConstraints)averagePixelConstraints;
- (CATransform3D)transformFromLayerId:(SEL)a3 inContextId:(unint64_t)a4;
- (CAWindowServerDisplay)cloneMaster;
- (CGColorSpace)blendColorSpace;
- (CGColorSpace)displayColorSpace;
- (CGColorTRC)blackpointAdaptation;
- (CGColorTRC)systemGamma;
- (CGPoint)convertPoint:(CGPoint)result fromContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)result toContextId:(unsigned int)a4;
- (CGPoint)cursorPosition;
- (CGRect)bounds;
- (CGRect)detachingRect;
- (CGSize)maximumCursorSize;
- (CGSize)nativeSize;
- (CGSize)overscanAmounts;
- (CGSize)panelPhysicalSize;
- (CGSize)scales;
- (CGSize)touchScales;
- (NSDictionary)brightnessCapabilities;
- (NSDictionary)cursorDictionary;
- (NSDictionary)virtualDisplayMode;
- (NSSet)clones;
- (NSSet)systemIdentifiers;
- (NSString)TVMode;
- (NSString)TVSignalType;
- (NSString)colorMode;
- (NSString)description;
- (NSString)deviceName;
- (NSString)name;
- (NSString)orientation;
- (NSString)overscanAdjustment;
- (NSString)uniqueId;
- (NSUUID)uuid;
- (__IOSurface)acquireFrozenSurface;
- (double)apertureOffset;
- (double)maximumHDRLuminance;
- (double)maximumReferenceLuminance;
- (double)maximumSDRLuminance;
- (double)maximumScale;
- (double)minimumLuminance;
- (double)minimumScale;
- (double)nextWakeupTime;
- (double)overscanAmount;
- (double)scale;
- (float)contrast;
- (float)gamma;
- (float)idealRefreshRate;
- (float)maximumBrightness;
- (float)maximumLuminance;
- (float)maximumRefreshRate;
- (float)maximumSDRNits;
- (float)minimumNits;
- (float)minimumRefreshRate;
- (float)nits;
- (id)_initWithCADisplayServer:(void *)a3;
- (id)brightnessCallback;
- (id)frameInfoCallback;
- (id)hitTestAtPosition:(CGPoint)a3 options:(id)a4;
- (id)hotPlugCallback;
- (id)notificationQueue;
- (id)syncNotificationQueue;
- (id)updateRequestCallback;
- (int)processId;
- (int64_t)displayType;
- (int64_t)frameInfoCallbackVersion;
- (int64_t)tag;
- (int64_t)transportType;
- (int64_t)trinityCabalConfig;
- (unint64_t)maxLayerBandwidth;
- (unint64_t)maximumFrameTime;
- (unint64_t)maximumSourceRectPixels;
- (unint64_t)maximumSourceRectWidth;
- (unint64_t)maximumVRRVBLDelta;
- (unint64_t)minimumFrameTime;
- (unint64_t)minimumSourceRectSize;
- (unint64_t)minimumVRRVBLDelta;
- (unint64_t)panelPointsPerInch;
- (unint64_t)previousVBL;
- (unint64_t)productId;
- (unint64_t)vblDelta;
- (unint64_t)vendorId;
- (unsigned)clientPortAtPosition:(CGPoint)a3;
- (unsigned)clientPortOfContextId:(unsigned int)a3;
- (unsigned)contextIdAtPosition:(CGPoint)a3;
- (unsigned)contextIdAtPosition:(CGPoint)a3 excludingContextIds:(id)a4;
- (unsigned)displayId;
- (unsigned)framebufferFormat;
- (unsigned)rendererFlags;
- (unsigned)serviceObject;
- (unsigned)taskNamePortOfContextId:(unsigned int)a3;
- (void)abortColorMatrixRamp:(float *)a3 scale:(float *)a4;
- (void)abortContrastEnhancerRamp:(float *)a3;
- (void)activateReplay;
- (void)addClone:(id)a3;
- (void)addClone:(id)a3 options:(id)a4;
- (void)addFramePresentationTimestamp:(unint64_t)a3;
- (void)beginExternalUpdate:(void *)a3 usingSoftwareRenderer:(BOOL)a4;
- (void)copyDisplayTimingsFromDisplay:(id)a3;
- (void)dealloc;
- (void)detachingDisplay;
- (void)emitBrightnessError:(id *)a3;
- (void)emitWhitePointError:(id *)a3;
- (void)freeze;
- (void)invalidate;
- (void)postNotification:(id)a3 payload:(id)a4;
- (void)postSyncNotification:(id)a3 payload:(id)a4;
- (void)powerStateDidChange:(id)a3;
- (void)presentSurface:(__IOSurface *)a3 withOptions:(id)a4;
- (void)registerForNotifications:(id)a3 withBlock:(id)a4;
- (void)registerForSyncNotifications:(id)a3 withBlock:(id)a4;
- (void)removeAllClones;
- (void)removeClone:(id)a3;
- (void)renderForTime:(double)a3;
- (void)resetConfiguration;
- (void)setAccessibilityColorMatrix:(float *)a3 scale:(float)a4;
- (void)setAccessibilityFrameRateLimitEnabled:(BOOL)a3;
- (void)setAllowsDisplayCompositing:(BOOL)a3;
- (void)setAllowsExtendedDynamicRange:(BOOL)a3;
- (void)setAllowsVirtualModes:(BOOL)a3;
- (void)setAllowsWirelessColorFiltering:(BOOL)a3;
- (void)setAmbient:(float)a3;
- (void)setApertureOffset:(double)a3;
- (void)setBlackpointAdaptation:(CGColorTRC *)a3;
- (void)setBlanked:(BOOL)a3;
- (void)setBlankingRemovesPower:(BOOL)a3;
- (void)setBlendColorSpace:(CGColorSpace *)a3;
- (void)setBrightnessCallback:(id)a3;
- (void)setBrightnessCapabilities:(id)a3;
- (void)setBrightnessControlDisabled:(BOOL)a3;
- (void)setBrightnessLimit:(float)a3;
- (void)setCalibrationPhase:(unsigned int)a3 forIdentifier:(unsigned int)a4;
- (void)setColorMatrix:(const float *)a3 scale:(float)a4 rampDuration:(double)a5;
- (void)setColorMode:(id)a3;
- (void)setContrast:(float)a3;
- (void)setContrastEnhancer:(float)a3;
- (void)setContrastEnhancer:(float)a3 rampDuration:(double)a4;
- (void)setCursorDictionary:(id)a3;
- (void)setCursorEnabled:(BOOL)a3;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPosition:(CGPoint)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisablesUpdates:(BOOL)a3;
- (void)setDisplayColorSpace:(CGColorSpace *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilteredAmbient:(float)a3;
- (void)setFlipBookEnabled:(BOOL)a3;
- (void)setFlipBookSuppressed:(BOOL)a3;
- (void)setFrameInfoCallback:(id)a3;
- (void)setGammaAdjustment:(CGColorTRC)a3[3];
- (void)setGrayscale:(BOOL)a3;
- (void)setHeadroom:(float)a3;
- (void)setHighAmbientAdaptation:(float)a3;
- (void)setHotPlugCallback:(id)a3;
- (void)setIRDCFlushHint:(BOOL)a3;
- (void)setIdealRefreshRate:(float)a3;
- (void)setIndicatorBrightness:(float)a3;
- (void)setIndicatorBrightnessLimit:(float)a3;
- (void)setInvertsColors:(BOOL)a3;
- (void)setIsReferencePreset:(BOOL)a3;
- (void)setLowAmbientAdaptation:(float)a3;
- (void)setMaximumBrightness:(float)a3;
- (void)setMaximumHDRLuminance:(double)a3;
- (void)setMaximumReferenceLuminance:(double)a3;
- (void)setMaximumRefreshRate:(float)a3;
- (void)setMaximumSDRLuminance:(double)a3;
- (void)setMinimumLuminance:(double)a3;
- (void)setMinimumRefreshRate:(float)a3;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)setNits:(float)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setOrientation:(id)a3;
- (void)setOverscanAdjustment:(id)a3;
- (void)setOverscanAmount:(double)a3;
- (void)setOverscanAmounts:(CGSize)a3;
- (void)setPotentialHeadroom:(float)a3;
- (void)setPreserveAppleSRGBGammaResponse:(BOOL)a3;
- (void)setProcessId:(int)a3;
- (void)setSDRBrightness:(float)a3;
- (void)setScale:(double)a3;
- (void)setScalePreservesAspect:(BOOL)a3;
- (void)setScales:(CGSize)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSecureIndicatorsEnabled:(BOOL)a3;
- (void)setSyncNotificationQueue:(id)a3;
- (void)setSystemGamma:(CGColorTRC *)a3;
- (void)setSystemIdentifiers:(id)a3;
- (void)setTVMode:(id)a3;
- (void)setTVSignalType:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTracksCarPlayRegions:(BOOL)a3;
- (void)setTrinityCabalConfig:(int64_t)a3;
- (void)setUpdateRequestCallback:(id)a3;
- (void)setUserAdjustment:(float *)a3 scale:(float)a4;
- (void)setUsesPreferredModeRefreshRate:(BOOL)a3;
- (void)setWhitePointMatrix:(id *)a3 scale:(float)a4;
- (void)unregisterNotificationBlocks;
- (void)unregisterSyncNotificationBlocks;
- (void)update;
- (void)willUnblank;
@end

@implementation CAWindowServerDisplay

void __52__CAWindowServerDisplay_commitBrightness_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) + 96);
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 1016))(v2);
  if (*(unsigned char *)(a1 + 148))
  {
    if (*(unsigned char *)(a1 + 140)) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
    if (v4 == 1)
    {
LABEL_6:
      if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        v11 = x_log_category_windowserver;
        if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_ERROR, "brightness commit failed - brightness control is disabled", buf, 2u);
        }
      }
      return;
    }
  }
  else if (v3)
  {
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336) &= ~1u;
  long long v71 = 0uLL;
  uint64_t v72 = 0;
  (*(void (**)(long long *__return_ptr))(**(void **)(*(void *)(a1 + 48) + 96) + 1216))(&v71);
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 149))
  {
    float v6 = *(float *)(a1 + 56) * 0.318309886;
    *((float *)&v71 + 3) = v6;
    float v7 = vabds_f32(v6, *(float *)(*(void *)(v5 + 96) + 25344)) / *(float *)(*(void *)(v5 + 96) + 25344);
    float v8 = 0.02;
    if (HIBYTE(qword_1EB2ACC90)) {
      float v8 = 0.0;
    }
    if (v7 >= v8)
    {
      *(unsigned char *)(*(void *)(v5 + 96) + 25336) |= 1u;
      uint64_t v5 = *(void *)(a1 + 48);
    }
  }
  v9.n128_f32[0] = CA::WindowServer::Display::edr_headroom(*(CA::WindowServer::Display **)(v5 + 96));
  if (*(unsigned char *)(a1 + 150)) {
    float v10 = *(float *)(a1 + 68);
  }
  else {
    float v10 = v9.n128_f32[0];
  }
  if (*(unsigned char *)(a1 + 151))
  {
    unsigned int v12 = *(_DWORD *)(a1 + 72);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) + 96);
    CA::WindowServer::Display::initialize_edr_state((_DWORD *)v13);
    uint64_t v14 = *(void *)(v13 + 688);
    if (v14) {
      atomic_store(v12, (unsigned int *)(v14 + 4));
    }
  }
  (*(void (**)(void, __n128))(**(void **)(*(void *)(a1 + 48) + 96) + 920))(*(void *)(*(void *)(a1 + 48) + 96), v9);
  v16 = *(CA::WindowServer::Server **)(a1 + 48);
  if (*(unsigned char *)(a1 + 152))
  {
    float v17 = *(float *)(a1 + 64);
    CA::WindowServer::Server::set_sdr_nits(v16, v17);
    v16 = *(CA::WindowServer::Server **)(a1 + 48);
    float v18 = vabds_f32(v17, *(float *)(*((void *)v16 + 12) + 25340)) / *(float *)(*((void *)v16 + 12) + 25340);
    float v19 = 0.02;
    if (HIBYTE(qword_1EB2ACC90)) {
      float v19 = 0.0;
    }
    if (v18 >= v19)
    {
      *(unsigned char *)(*((void *)v16 + 12) + 25336) |= 1u;
      v16 = *(CA::WindowServer::Server **)(a1 + 48);
    }
  }
  else
  {
    float v17 = v15;
  }
  (*(void (**)(void))(**((void **)v16 + 12) + 936))(*((void *)v16 + 12));
  if (*(unsigned char *)(a1 + 153))
  {
    float v21 = *(float *)(a1 + 76);
    uint64_t v22 = *(void *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(v22 + 24));
    if ((*(unsigned int (**)(float))(**(void **)(v22 + 96) + 944))(v21))
    {
      if (byte_1EB2ACC84)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v68 = x_log_category_CADebug;
          if (os_log_type_enabled((os_log_t)x_log_category_CADebug, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "set_brightness_limit";
            _os_log_impl(&dword_184668000, v68, OS_LOG_TYPE_INFO, "kUpdateReasonDisplayBrightness %s", buf, 0xCu);
          }
        }
      }
      *(void *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, unsigned char *, double))(*(void *)v22 + 184))(v22, buf, 0.0);
      (*(void (**)(void))(**(void **)(v22 + 96) + 968))(*(void *)(v22 + 96));
      if (v21 < 1000.0 && (*(_DWORD *)(*(void *)(v22 + 96) + 745) & 0x4000) != 0 && MEMORY[0x1E4F5B210]) {
        analytics_send_event_lazy();
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v22 + 24));
    float v24 = *(float *)(*(void *)(*(void *)(a1 + 48) + 96) + 25352);
    float v25 = vabds_f32(v21, v24) / v24;
    float v26 = 0.02;
    if (HIBYTE(qword_1EB2ACC90)) {
      float v26 = 0.0;
    }
    if (v25 >= v26)
    {
      v23 = (unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336);
      *v23 |= 1u;
    }
  }
  else
  {
    float v21 = v20;
  }
  if ((*(unsigned char *)(a1 + 144) & 7) != 0)
  {
    *((float *)&v71 + 2) = v17 * v10;
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
    (*(void (**)(uint64_t, BOOL, float))(*(void *)v27 + 152))(v27, v10 != 1.0, v10);
    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
    *(_OWORD *)buf = v71;
    *(void *)&buf[16] = v72;
    (*(void (**)(void))(**(void **)(v28 + 96) + 1224))(*(void *)(v28 + 96));
  }
  if (*(unsigned char *)(a1 + 154))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336) |= 1u;
    (*(void (**)(void, float))(**(void **)(*(void *)(a1 + 48) + 96) + 1256))(*(void *)(*(void *)(a1 + 48) + 96), *(float *)(a1 + 60));
  }
  if (*(unsigned char *)(a1 + 148))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336) |= 1u;
    (*(void (**)(void, void))(**(void **)(*(void *)(a1 + 48) + 96) + 1024))(*(void *)(*(void *)(a1 + 48) + 96), *(unsigned __int8 *)(a1 + 140));
  }
  if (*(unsigned char *)(a1 + 155))
  {
    float v29 = *(float *)(a1 + 80);
    if (v29 != (*(float (**)(void))(**(void **)(*(void *)(a1 + 48) + 96) + 1272))(*(void *)(*(void *)(a1 + 48) + 96))) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336) |= 1u;
    }
    uint64_t v30 = *(void *)(a1 + 48);
    float v31 = *(float *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(v30 + 24));
    if ((*(unsigned int (**)(float))(**(void **)(v30 + 96) + 1280))(v31))
    {
      if (byte_1EB2ACC84)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v69 = x_log_category_CADebug;
          if (os_log_type_enabled((os_log_t)x_log_category_CADebug, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "set_low_ambient_adaptation_strength";
            _os_log_impl(&dword_184668000, v69, OS_LOG_TYPE_INFO, "kUpdateReasonDisplayBrightness %s", buf, 0xCu);
          }
        }
      }
      *(void *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, unsigned char *, double))(*(void *)v30 + 184))(v30, buf, 0.0);
      (*(void (**)(void))(**(void **)(v30 + 96) + 968))(*(void *)(v30 + 96));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v30 + 24));
  }
  if (*(unsigned char *)(a1 + 156))
  {
    float v32 = *(float *)(a1 + 84);
    if (v32 != (*(float (**)(void))(**(void **)(*(void *)(a1 + 48) + 96) + 1288))(*(void *)(*(void *)(a1 + 48) + 96))) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336) |= 1u;
    }
    uint64_t v33 = *(void *)(a1 + 48);
    float v34 = *(float *)(a1 + 84);
    pthread_mutex_lock((pthread_mutex_t *)(v33 + 24));
    if ((*(unsigned int (**)(float))(**(void **)(v33 + 96) + 1296))(v34))
    {
      if (byte_1EB2ACC84)
      {
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v70 = x_log_category_CADebug;
          if (os_log_type_enabled((os_log_t)x_log_category_CADebug, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "set_high_ambient_adaptation_strength";
            _os_log_impl(&dword_184668000, v70, OS_LOG_TYPE_INFO, "kUpdateReasonDisplayBrightness %s", buf, 0xCu);
          }
        }
      }
      *(void *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, unsigned char *, double))(*(void *)v33 + 184))(v33, buf, 0.0);
      (*(void (**)(void))(**(void **)(v33 + 96) + 968))(*(void *)(v33 + 96));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v33 + 24));
  }
  if (*(unsigned char *)(a1 + 157))
  {
    uint64_t v35 = *(void *)(a1 + 48);
    float v36 = *(float *)(a1 + 88);
    pthread_mutex_lock((pthread_mutex_t *)(v35 + 24));
    if ((*(unsigned int (**)(float))(**(void **)(v35 + 96) + 1312))(v36))
    {
      *(void *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, unsigned char *, double))(*(void *)v35 + 184))(v35, buf, 0.0);
      (*(void (**)(void))(**(void **)(v35 + 96) + 968))(*(void *)(v35 + 96));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v35 + 24));
    float v38 = *(float *)(*(void *)(*(void *)(a1 + 48) + 96) + 25356);
    float v39 = vabds_f32(*(float *)(a1 + 88), v38) / v38;
    float v40 = 0.02;
    if (HIBYTE(qword_1EB2ACC90)) {
      float v40 = 0.0;
    }
    if (v39 >= v40)
    {
      v37 = (unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336);
      *v37 |= 1u;
    }
  }
  if (*(unsigned char *)(a1 + 158))
  {
    uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
    float v42 = *(float *)(a1 + 92);
    pthread_mutex_lock((pthread_mutex_t *)(v41 + 24));
    if ((*(unsigned int (**)(float))(**(void **)(v41 + 96) + 1320))(v42))
    {
      *(void *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(8uLL);
      (*(void (**)(uint64_t, unsigned char *, double))(*(void *)v41 + 184))(v41, buf, 0.0);
      (*(void (**)(void))(**(void **)(v41 + 96) + 968))(*(void *)(v41 + 96));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v41 + 24));
  }
  if (*(unsigned char *)(a1 + 159) && *(unsigned char *)(a1 + 141)) {
    CA::WindowServer::Server::set_irdc_hint(*(CA::WindowServer::Server **)(*(void *)(*(void *)(a1 + 32) + 8) + 64));
  }
  if (*(unsigned char *)(a1 + 160)) {
    CA::WindowServer::Server::set_color_matrix(*(CA::WindowServer::Server **)(*(void *)(*(void *)(a1 + 32) + 8) + 64), (const float *)(a1 + 100), *(float *)(a1 + 96), 0.0);
  }
  if (*(unsigned char *)(a1 + 161))
  {
    uint64_t v43 = *(void *)(a1 + 48);
    float v44 = *(float *)(a1 + 136);
    pthread_mutex_lock((pthread_mutex_t *)(v43 + 24));
    if ((*(unsigned int (**)(float))(**(void **)(v43 + 96) + 1336))(v44))
    {
      *(void *)buf = 0;
      *(int64x2_t *)&buf[8] = vdupq_n_s64(0x100000uLL);
      (*(void (**)(uint64_t, unsigned char *, double))(*(void *)v43 + 184))(v43, buf, 0.0);
      (*(void (**)(void))(**(void **)(v43 + 96) + 968))(*(void *)(v43 + 96));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v43 + 24));
    float v46 = *(float *)(*(void *)(*(void *)(a1 + 48) + 96) + 25360);
    float v47 = vabds_f32(*(float *)(a1 + 136), v46) / v46;
    float v48 = 0.02;
    if (HIBYTE(qword_1EB2ACC90)) {
      float v48 = 0.0;
    }
    if (v47 >= v48)
    {
      v45 = (unsigned char *)(*(void *)(*(void *)(a1 + 48) + 96) + 25336);
      *v45 |= 1u;
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v49 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) + 96);
    if ((*(unsigned int (**)(uint64_t))(*(void *)v49 + 1912))(v49))
    {
      uint64_t v50 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) + 96);
      (*(void (**)(uint64_t, void))(*(void *)v50 + 1920))(v50, *(void *)(a1 + 40));
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    }
    _Block_release(*(const void **)(a1 + 40));
  }
  uint64_t v51 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 162))
  {
    *(unsigned char *)(*(void *)(v51 + 96) + 25336) |= 1u;
    (*(void (**)(void))(**(void **)(*(void *)(a1 + 48) + 96) + 1032))(*(void *)(*(void *)(a1 + 48) + 96));
    uint64_t v51 = *(void *)(a1 + 48);
  }
  uint64_t v52 = *(void *)(v51 + 96) + 25336;
  if (*(unsigned char *)v52)
  {
    if (x_log_hook_p())
    {
      [*(id *)(a1 + 32) displayId];
      x_log_();
    }
    else
    {
      v53 = x_log_category_brightness;
      if (os_log_type_enabled((os_log_t)x_log_category_brightness, OS_LOG_TYPE_DEFAULT))
      {
        int v54 = [*(id *)(a1 + 32) displayId];
        double v55 = -1.0;
        if (*(unsigned char *)(a1 + 152)) {
          double v56 = v17;
        }
        else {
          double v56 = -1.0;
        }
        if (*(unsigned char *)(a1 + 150)) {
          double v57 = v10;
        }
        else {
          double v57 = -1.0;
        }
        double v58 = -1.0;
        double v59 = -1.0;
        if (*(unsigned char *)(a1 + 151)) {
          double v59 = *(float *)(a1 + 72);
        }
        if (*(unsigned char *)(a1 + 149)) {
          double v55 = *((float *)&v71 + 3) * 3.14159265;
        }
        if (*(unsigned char *)(a1 + 154)) {
          double v58 = *(float *)(a1 + 60);
        }
        double v60 = -1.0;
        if (*(unsigned char *)(a1 + 153)) {
          double v60 = v21;
        }
        double v61 = -1.0;
        double v62 = -1.0;
        if (*(unsigned char *)(a1 + 157)) {
          double v62 = *(float *)(a1 + 88);
        }
        if (*(unsigned char *)(a1 + 155)) {
          double v61 = *(float *)(a1 + 80);
        }
        double v63 = -1.0;
        double v64 = -1.0;
        if (*(unsigned char *)(a1 + 156)) {
          double v64 = *(float *)(a1 + 84);
        }
        if (*(unsigned char *)(a1 + 161)) {
          double v63 = *(float *)(a1 + 136);
        }
        if (*(unsigned char *)(a1 + 148)) {
          int v65 = *(unsigned __int8 *)(a1 + 140);
        }
        else {
          int v65 = -1;
        }
        int v66 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 96) + 25364);
        *(_DWORD *)buf = 67112192;
        *(_DWORD *)&buf[4] = v54;
        *(_WORD *)&buf[8] = 2048;
        *(double *)&buf[10] = v56;
        *(_WORD *)&buf[18] = 2048;
        *(double *)&buf[20] = v57;
        __int16 v74 = 2048;
        double v75 = v59;
        __int16 v76 = 2048;
        double v77 = v55;
        __int16 v78 = 2048;
        double v79 = v58;
        __int16 v80 = 2048;
        double v81 = v60;
        __int16 v82 = 2048;
        double v83 = v62;
        __int16 v84 = 2048;
        double v85 = v61;
        __int16 v86 = 2048;
        double v87 = v64;
        __int16 v88 = 2048;
        double v89 = v63;
        __int16 v90 = 1024;
        int v91 = v65;
        __int16 v92 = 1024;
        int v93 = v66;
        _os_log_impl(&dword_184668000, v53, OS_LOG_TYPE_DEFAULT, "Display %d commitBrightness sdr: %g, headroom: %g, potential headroom: %g, ambient lux: %g, filtered ambient: %g, brightness limit: %g, indicator brightness: %g low ambient strength: %g, high ambient strength: %g, contrast enhancer: %g brightness ctl disabled %d, unlogged brightness transactions:%u\n", buf, 0x78u);
      }
    }
    uint64_t v67 = *(void *)(*(void *)(a1 + 48) + 96) + 25340;
    *(float *)uint64_t v67 = v17;
    *(_DWORD *)(v67 + 4) = HIDWORD(v71);
    *(float *)(v67 + 12) = v21;
    *(_DWORD *)(v67 + 16) = *(_DWORD *)(a1 + 88);
    *(_DWORD *)(v67 + 20) = *(_DWORD *)(a1 + 136);
    *(_DWORD *)(v67 + 24) = 0;
  }
  else
  {
    ++*(_DWORD *)(v52 + 28);
  }
}

- (BOOL)commitBrightness:(id *)a3 withBlock:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl)
  {
    -[CAWindowServerDisplay emitBrightnessError:](self, "emitBrightnessError:", a3, a4);
    if (x_log_hook_p()) {
      goto LABEL_16;
    }
    uint64_t v22 = x_log_category_windowserver;
    BOOL v19 = os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR);
    if (!v19) {
      return v19;
    }
    *(_WORD *)buf = 0;
    v23 = "brightness commit failed - server invalidated";
    goto LABEL_19;
  }
  var1 = impl->var1;
  if (![(CAWindowServerDisplay *)self brightnessAvailable])
  {
    [(CAWindowServerDisplay *)self emitBrightnessError:a3];
    float v20 = (const void *)(*(uint64_t (**)(Server *))(*(void *)var1 + 304))(var1);
    CFStringRef v21 = CFCopyDescription(v20);
    if (x_log_hook_p())
    {
      [(CAWindowServerDisplay *)self displayId];
      if (v21) {
        CFStringGetCStringPtr(v21, 0x8000100u);
      }
      x_log_();
    }
    else
    {
      float v24 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        unsigned int v25 = [(CAWindowServerDisplay *)self displayId];
        if (v21) {
          CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
        }
        else {
          CStringPtr = "(null)";
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v25;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = CStringPtr;
        _os_log_impl(&dword_184668000, v24, OS_LOG_TYPE_ERROR, "Display %d brightness commit failed - unavailable. Capabilities: %s", buf, 0x12u);
        if (!v21) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
    if (!v21) {
      goto LABEL_23;
    }
LABEL_22:
    CFRelease(v21);
    goto LABEL_23;
  }
  uint64_t v9 = (*(uint64_t (**)(Server *))(*(void *)var1 + 384))(var1);
  if (!v9)
  {
    [(CAWindowServerDisplay *)self emitBrightnessError:a3];
    if (x_log_hook_p())
    {
LABEL_16:
      x_log_();
LABEL_23:
      LOBYTE(v19) = 0;
      return v19;
    }
    uint64_t v22 = x_log_category_windowserver;
    BOOL v19 = os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR);
    if (!v19) {
      return v19;
    }
    *(_WORD *)buf = 0;
    v23 = "brightness commit failed - no server runloop";
LABEL_19:
    _os_log_impl(&dword_184668000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_23;
  }
  float v10 = (__CFRunLoop *)v9;
  v11 = self->_impl;
  float var2 = v11->var2.var2;
  float var3 = v11->var2.var3;
  long long v14 = *(_OWORD *)&v11->var2.var8;
  long long v15 = *(_OWORD *)&v11->var2.var11.var0[5];
  long long v51 = *(_OWORD *)&v11->var2.var11.var0[1];
  long long v52 = v15;
  uint64_t v53 = *(void *)&v11->var2.var12;
  unsigned int var15 = v11->var2.var15;
  *(_OWORD *)buf = *(_OWORD *)&v11->var2.var4;
  *(_OWORD *)&buf[16] = v14;
  v11->var2.var14 = 0;
  v11->var2.unsigned int var15 = 0;
  uint64_t v28 = *(void *)&v11->var2.var0;
  [(CAWindowServerDisplay *)self displayId];
  kdebug_trace();
  float v17 = _Block_copy(a4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CAWindowServerDisplay_commitBrightness_withBlock___block_invoke;
  block[3] = &unk_1E527E390;
  BOOL v38 = (var15 & 0x40) != 0;
  block[7] = v28;
  float v30 = var2;
  float v31 = var3;
  long long v33 = *(_OWORD *)&buf[16];
  long long v34 = v51;
  long long v35 = v52;
  uint64_t v36 = v53;
  long long v32 = *(_OWORD *)buf;
  unsigned int v37 = var15;
  block[6] = var1;
  char v39 = var15 & 1;
  char v40 = (var15 & 4) >> 2;
  BOOL v41 = (var15 & 8) != 0;
  char v42 = (var15 & 2) >> 1;
  BOOL v43 = (var15 & 0x10) != 0;
  BOOL v44 = (var15 & 0x20) != 0;
  BOOL v45 = (var15 & 0x80) != 0;
  int16x8_t v18 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(var15), (uint32x4_t)xmmword_184998400);
  *(int8x8_t *)v18.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v18), (int8x8_t)0x1000100010001);
  unsigned __int32 v46 = vmovn_s16(v18).u32[0];
  char v47 = BYTE1(var15) & 1;
  BOOL v48 = (var15 & 0x200) != 0;
  block[4] = self;
  block[5] = v17;
  BOOL v49 = (var15 & 0x400) != 0;
  CFRunLoopPerformBlock(v10, (CFTypeRef)*MEMORY[0x1E4F1D410], block);
  CFRunLoopWakeUp(v10);
  LOBYTE(v19) = 1;
  return v19;
}

- (unsigned)displayId
{
  impl = self->_impl;
  if (impl) {
    return *(_DWORD *)(*((void *)impl->var1 + 12) + 24);
  }
  else {
    return 0;
  }
}

- (BOOL)brightnessAvailable
{
  if (!self->_impl) {
    return 0;
  }
  if (CADeviceSupportsBrightnessTransactions::once[0] != -1) {
    dispatch_once(CADeviceSupportsBrightnessTransactions::once, &__block_literal_global_110);
  }
  return CADeviceSupportsBrightnessTransactions::supports_brightness_transaction
      && ![(CAWindowServerDisplay *)self displayType]
      || [(CAWindowServerDisplay *)self displayType] == 3
      || (*(uint64_t (**)(Server *))(*(void *)self->_impl->var1 + 304))(self->_impl->var1) != 0;
}

- (int64_t)displayType
{
  impl = self->_impl;
  if (impl
    && (uint64_t v3 = ((*(unsigned __int16 *)(*((void *)impl->var1 + 12) + 656) >> 10) & 7u) - 1, v3 <= 3))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (void)setAmbient:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var0 = a3;
    impl->var2.var15 |= 1u;
  }
}

- (void)setSDRBrightness:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.float var2 = a3;
    impl->var2.var15 |= 2u;
  }
}

- (void)setPotentialHeadroom:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var4 = a3;
    impl->var2.var15 |= 8u;
  }
}

- (void)setIndicatorBrightnessLimit:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var9 = a3;
    impl->var2.var15 |= 0x2000u;
  }
}

- (void)setIndicatorBrightness:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var8 = a3;
    impl->var2.var15 |= 0x1000u;
  }
}

- (void)setHeadroom:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.float var3 = a3;
    impl->var2.var15 |= 4u;
  }
}

- (void)setContrastEnhancer:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var12 = a3;
    impl->var2.var15 |= 0x200u;
  }
}

- (void)setBrightnessLimit:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var5 = a3;
    impl->var2.var15 |= 0x10u;
  }
}

- (BOOL)commitBrightness:(id *)a3
{
  return [(CAWindowServerDisplay *)self commitBrightness:a3 withBlock:0];
}

- (void)setLowAmbientAdaptation:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    if (a3 < 0.0) {
      a3 = 0.0;
    }
    impl->var2.var6 = a3;
    impl->var2.var15 |= 0x80u;
  }
}

- (void)setHighAmbientAdaptation:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    if (a3 < 0.0) {
      a3 = 0.0;
    }
    impl->var2.var7 = a3;
    impl->var2.var15 |= 0x800u;
  }
}

- (id)hitTestAtPosition:(CGPoint)a3 options:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  float v8 = (void *)[a4 objectForKey:@"hitTestOptionExcludedIds"];
  char v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestIgnoreBlankingContext"), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestCumulativeOpacity"), "BOOLValue")) {
    v9 |= 2u;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestCumulativeTransform"), "BOOLValue"))v9 |= 4u; {
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestWantsLayerBackgroundStatistics"), "BOOLValue"))v9 |= 8u;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestInsecureFiltered"), "BOOLValue")) {
    v9 |= 0x10u;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestWantsContextSecurityAnalysis"), "BOOLValue"))char v10 = v9 | 0x20; {
  else
  }
    char v10 = v9;
  uint64_t v11 = [v8 count];
  uint64_t v12 = v11;
  size_t v13 = 4 * v11 + 4;
  if (v11)
  {
    if (v13 > 0x1000)
    {
      long long v14 = (char *)malloc_type_malloc(4 * v11 + 4, 0x8824C089uLL);
      if (!v14)
      {
        char v15 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      MEMORY[0x1F4188790](v11);
      long long v14 = (char *)v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v14, v13);
    }
    uint64_t v16 = 0;
    do
    {
      *(_DWORD *)&v14[4 * v16] = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v16), "unsignedIntValue");
      ++v16;
    }
    while (v12 != v16);
    char v15 = 1;
  }
  else
  {
    char v15 = 0;
    long long v14 = 0;
  }
LABEL_20:
  v96[0] = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundTopEdgeInset"), "unsignedIntegerValue");
  v96[1] = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundLeftEdgeInset"), "unsignedIntegerValue");
  v96[2] = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundBottomEdgeInset"), "unsignedIntegerValue");
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundRightEdgeInset"), "unsignedIntegerValue");
  uint64_t v18 = 0;
  v96[3] = v17;
  int64x2_t v94 = 0u;
  long long v95 = 0u;
  var1 = self->_impl->var1;
  __int16 v20 = *(_WORD *)(*((void *)var1 + 12) + 656);
  do
  {
    v94.i64[v18] = v96[((_BYTE)v20 + (_BYTE)v18) & 3];
    ++v18;
  }
  while (v18 != 4);
  uint64_t v93 = 0;
  memset(v92, 0, sizeof(v92));
  long long v90 = 0u;
  long long v91 = 0u;
  v98 = *(__CFString **)&x;
  CGFloat v99 = y;
  CA::WindowServer::Server::hit_test((uint64_t)&v90, (uint64_t)var1, (double *)&v98, (int *)v14, v12, v10, &v94);
  if (v13 > 0x1000) {
    char v21 = v15;
  }
  else {
    char v21 = 0;
  }
  if (v21) {
    free(v14);
  }
  if (!v90) {
    return 0;
  }
  uint64_t v22 = CA::Render::Context::context_by_id((CA::Render::Context *)v90);
  if (!v22) {
    return 0;
  }
  uint64_t v23 = *(unsigned int *)(v22 + 260);
  if (!v23) {
    uint64_t v23 = *(unsigned int *)(v22 + 256);
  }
  if (atomic_fetch_add((atomic_uint *volatile)(v22 + 8), 0xFFFFFFFF) == 1) {
    (*(void (**)(uint64_t))(*(void *)v22 + 16))(v22);
  }
  float v24 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v25 = [NSNumber numberWithUnsignedInt:v90];
  uint64_t v26 = [NSNumber numberWithUnsignedInt:DWORD1(v90)];
  uint64_t v27 = [NSNumber numberWithUnsignedInt:v23];
  uint64_t v28 = [NSNumber numberWithBool:DWORD2(v91) != 0];
  if ((DWORD2(v91) - 1) > 3) {
    float v29 = @"occlusionNone";
  }
  else {
    float v29 = off_1E527E500[DWORD2(v91) - 1];
  }
  float v30 = objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, @"hitTestContextId", v26, @"hitTestSlotId", v27, @"hitTestClientPort", v28, @"hitTestDetectedOcclusion", v29, @"hitTestOcclusionType", 0);
  if ((v10 & 2) != 0)
  {
    LODWORD(v31) = v92[0];
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v31), @"hitTestCumulativeOpacity");
  }
  if ((v10 & 4) != 0 && DWORD1(v90))
  {
    v88[4] = *(_OWORD *)&v92[9];
    v88[5] = *(_OWORD *)&v92[11];
    v88[6] = *(_OWORD *)&v92[13];
    v88[7] = *(_OWORD *)&v92[15];
    v88[0] = *(_OWORD *)&v92[1];
    v88[1] = *(_OWORD *)&v92[3];
    v88[2] = *(_OWORD *)&v92[5];
    v88[3] = *(_OWORD *)&v92[7];
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCATransform3D:", v88), @"hitTestCumulativeLayerTransform");
    v87[4] = *(_OWORD *)&v92[25];
    v87[5] = *(_OWORD *)&v92[27];
    v87[6] = *(_OWORD *)&v92[29];
    v87[7] = *(_OWORD *)&v92[31];
    v87[0] = *(_OWORD *)&v92[17];
    v87[1] = *(_OWORD *)&v92[19];
    v87[2] = *(_OWORD *)&v92[21];
    v87[3] = *(_OWORD *)&v92[23];
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCATransform3D:", v87), @"hitTestCumulativeContentsTransform");
  }
  if ((v10 & 0x10) != 0) {
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", BYTE12(v91)), @"hitTestInsecureFiltered");
  }
  if ((v10 & 0x20) != 0 && (_BYTE)v93)
  {
    LODWORD(v31) = HIDWORD(v92[34]);
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v31), @"hitTestSecurityAnalysisCumulativeOpacity");
    v86[4] = *(_OWORD *)&v92[43];
    v86[5] = *(_OWORD *)&v92[45];
    v86[6] = *(_OWORD *)&v92[47];
    v86[7] = *(_OWORD *)&v92[49];
    v86[0] = *(_OWORD *)&v92[35];
    v86[1] = *(_OWORD *)&v92[37];
    v86[2] = *(_OWORD *)&v92[39];
    v86[3] = *(_OWORD *)&v92[41];
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCATransform3D:", v86), @"hitTestSecurityAnalysisCumulativeLayerTransform");
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", LOBYTE(v92[51])), @"hitTestSecurityAnalysisIsInsecureFiltered");
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", BYTE1(v92[51])), @"hitTestSecurityAnalysisParentsHaveInsecureLayerProperties");
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", BYTE2(v92[51])), @"hitTestSecurityAnalysisOcclusionType");
    LODWORD(v32) = HIDWORD(v92[51]);
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v32), @"hitTestSecurityAnalysisOcclusionPercent");
  }
  if ((v10 & 8) != 0 && DWORD1(v90))
  {
    long long v33 = self->_impl->var1;
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundForeground"), "floatValue");
    float v35 = v34;
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundPassingContrast"), "floatValue");
    float v37 = v36;
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"hitTestBackgroundFailingContrast"), "floatValue");
    float v39 = v38;
    __int32 v40 = DWORD2(v90);
    __int32 v41 = HIDWORD(v90);
    int8x8_t v42 = (int8x8_t)v91;
    if ((int)v91 <= SDWORD1(v91)) {
      int v43 = DWORD1(v91);
    }
    else {
      int v43 = v91;
    }
    if ((int)v91 >= SDWORD1(v91)) {
      int v44 = DWORD1(v91);
    }
    else {
      int v44 = v91;
    }
    if (v43 <= 1073741822 && v44 >= 1)
    {
      __int32 v40 = DWORD2(v90) + v94.i32[2];
      __int32 v41 = HIDWORD(v90) + v94.i32[0];
      if (DWORD1(v91) - ((int)v95 + v94.i32[0]) < 1 || (int)v91 - (DWORD2(v95) + v94.i32[2]) < 1) {
        unsigned int v47 = -1;
      }
      else {
        unsigned int v47 = 0;
      }
      v46.i32[1] = DWORD1(v91) - (v95 + v94.i32[0]);
      v46.i32[0] = v91 - (DWORD2(v95) + v94.i32[2]);
      int8x8_t v42 = vbic_s8(v46, (int8x8_t)vdup_n_s32(v47));
    }
    int v48 = v42.i32[0];
    if (v42.i32[0] >= 1000) {
      int v48 = 1000;
    }
    if (v48 <= 1) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = v48;
    }
    if (v42.i32[1] >= 1000) {
      int v50 = 1000;
    }
    else {
      int v50 = v42.i32[1];
    }
    if (v50 <= 1) {
      uint64_t v51 = 1;
    }
    else {
      uint64_t v51 = v50;
    }
    unint64_t v52 = (*MEMORY[0x1E4F14AF0] + ((4 * (_WORD)v49 + 63) & 0x1FC0) * (unint64_t)v51) & ~*MEMORY[0x1E4F14AF0];
    v89[0] = 64;
    v89[1] = (4 * (_WORD)v49 + 63) & 0x1FC0;
    v89[2] = 1;
    v89[3] = v52;
    v89[4] = 0;
    uint64_t v53 = CA::SurfaceUtil::CAIOSurfaceCreate(v49, v51, 1111970369, 1024, 0, 0, 0, v89, @"Hit Test Snapshot");
    if (v53)
    {
      double v55 = v53;
      uint64_t v56 = v40;
      double v57 = (void *)MEMORY[0x185324A30]();
      v97[0] = @"mode";
      v97[1] = @"destination";
      uint64_t v58 = *((void *)v33 + 13);
      v98 = @"stopBeforeSlot";
      CGFloat v99 = *(double *)&v55;
      uint64_t v100 = v58;
      v97[2] = @"displayName";
      v97[3] = @"slotId";
      uint64_t v101 = [NSNumber numberWithUnsignedInt:DWORD1(v90)];
      v97[4] = @"originX";
      uint64_t v102 = [NSNumber numberWithUnsignedLong:v56];
      v97[5] = @"originY";
      uint64_t v103 = [NSNumber numberWithUnsignedLong:v41];
      uint64_t v104 = MEMORY[0x1E4F1CC38];
      v97[6] = @"enforceSecureMode";
      v97[7] = @"ignoreDisableUpdateMasks";
      v97[8] = @"selfGenerated";
      uint64_t v105 = MEMORY[0x1E4F1CC28];
      uint64_t v106 = MEMORY[0x1E4F1CC38];
      CARenderServerSnapshot_(0, (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:v97 count:9]);
      if (initialized != -1) {
        dispatch_once_f(&initialized, 0, (dispatch_function_t)init_debug);
      }
      if (*(float *)&dword_1EB2ACAC4)
      {
        double v59 = CAIOSurfaceWriteToFileWithSuffix(v55, "hit-test-slot");
        if (v59)
        {
          if (*(float *)&dword_1EB2ACAC4 > 0.0) {
            *(float *)&dword_1EB2ACAC4 = *(float *)&dword_1EB2ACAC4 + -1.0;
          }
          free(v59);
        }
      }
      uint64_t v60 = 1;
      IOSurfaceLock(v55, 1u, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(v55);
      size_t BytesPerRow = IOSurfaceGetBytesPerRow(v55);
      uint64_t v65 = 0;
      float v66 = v35 + 0.05;
      float v67 = (float)(v66 / v37) + -0.05;
      float v68 = (float)(v39 * v66) + -0.05;
      float v69 = 1.0 / (float)((float)(v66 / v39) - (float)(v66 / v37));
      float v70 = 1.0 / (float)-(float)((float)(v39 * v66) - (float)(v37 * v66));
      float v71 = 0.0;
      float v72 = 0.0;
      float v73 = 0.0;
      do
      {
        __int16 v74 = &BaseAddress[v65 * BytesPerRow];
        unint64_t v75 = v60;
        uint64_t v76 = v49;
        do
        {
          LOBYTE(v63) = *v74;
          LOBYTE(v64) = v74[1];
          *(float *)&unsigned int v77 = (float)LODWORD(v64);
          float v78 = (float)((float)LODWORD(v63) * 0.0722) + (float)(*(float *)&v77 * 0.7152);
          LOBYTE(v77) = v74[2];
          *(float *)&unsigned int v79 = (float)v77;
          float v80 = v78 + (float)(*(float *)&v79 * 0.2126);
          LOBYTE(v79) = v74[3];
          float v81 = (float)(v80 * (float)v79) * 0.0000152590219;
          float v71 = (float)((float)(fminf(fmaxf(fmaxf((float)((float)(v67 - v81) * v69) + 1.0, (float)(v81 - v68) * v70), 0.0), 1.0)- v71)/ (float)v75)+ v71;
          float v82 = v81 - v73;
          float v64 = (float)(v81 - v73) / (float)v75;
          float v73 = v64 + v73;
          float v63 = v81 - v73;
          float v72 = v72 + (float)(v63 * v82);
          v74 += 4;
          ++v75;
          --v76;
        }
        while (v76);
        ++v65;
        v60 += v49;
      }
      while (v65 != v51);
      *(float *)&v92[34] = v71;
      v92[33] = __PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v72 / (float)(v51 * (unint64_t)v49))), LODWORD(v73));
      IOSurfaceUnlock(v55, 1u, 0);
      CFRelease(v55);
    }
    LODWORD(v54) = v92[33];
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v54), @"hitTestBackgroundAverage");
    LODWORD(v83) = HIDWORD(v92[33]);
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v83), @"hitTestBackgroundStandardDeviation");
    LODWORD(v84) = v92[34];
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v84), @"hitTestBackgroundAverageContrastThreshold");
  }
  return v30;
}

- (CGPoint)convertPoint:(CGPoint)result toContextId:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  var1 = self->_impl->var1;
  if (var1)
  {
    float64x2_t v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    float64x2_t v12 = 0u;
    long long v13 = 0u;
    float64x2_t v10 = 0u;
    long long v11 = 0u;
    double x = result.x;
    double y = result.y;
    CA::WindowServer::Server::context_transform((CA::WindowServer::Server *)&v10, (uint64_t)var1, *(uint64_t *)&a4);
    CA::Mat4Impl::mat4_invert((CA::Mat4Impl *)&v10, (CA::Mat4Impl *)&v10, v5);
    double v6 = *((double *)&v17 + 1) + *((double *)&v11 + 1) * x + *((double *)&v13 + 1) * y;
    if (fabs(v6 + -1.0) >= 0.000001)
    {
      if (v6 <= 0.0) {
        double v6 = INFINITY;
      }
      else {
        double v6 = 1.0 / v6;
      }
    }
    result = (CGPoint)vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v16, v10, x), v12, y), v6);
    result.double y = v7;
  }
  return result;
}

- (BOOL)setWhitePoint:(id *)a3 rampDuration:(double)a4 error:(id *)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v6 = a4;
    LODWORD(a4) = 1.0;
    -[CAWindowServerDisplay setColorMatrix:scale:rampDuration:](self, "setColorMatrix:scale:rampDuration:", a3, a5, a4, v6);
  }
  else if (a5 && !*a5)
  {
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"invalid nonnull argument";
    *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1, a4));
  }
  return a3 != 0;
}

- (void)setColorMatrix:(const float *)a3 scale:(float)a4 rampDuration:(double)a5
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_color_matrix((CA::WindowServer::Server *)self->_impl->var1, a3, a4, a5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (unint64_t)maximumVRRVBLDelta
{
  return self->_maximumVRRVBLDelta;
}

- (unint64_t)minimumVRRVBLDelta
{
  return self->_minimumVRRVBLDelta;
}

- (unint64_t)maximumFrameTime
{
  return self->_maximumFrameTime;
}

- (unint64_t)minimumFrameTime
{
  return self->_minimumFrameTime;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

- (BOOL)isMirroringEnabled
{
  return self->_mirroringEnabled;
}

- (float)maximumSDRNits
{
  return self->_maximumSDRNits;
}

- (float)minimumNits
{
  return self->_minimumNits;
}

- (unint64_t)panelPointsPerInch
{
  return self->_panelPointsPerInch;
}

- (void)setSecureIndicatorsEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_impl)
  {
    if (CADeviceSupportsMedina::once[0] != -1) {
      dispatch_once(CADeviceSupportsMedina::once, &__block_literal_global_314);
    }
    if (CADeviceSupportsMedina::medina)
    {
      impl = self->_impl;
      pthread_mutex_lock(&impl->var0._m);
      var1 = self->_impl->var1;
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      *((unsigned char *)var1 + 525) = a3;
      if (!a3) {
        (*(void (**)(void))(**((void **)var1 + 12) + 2096))(*((void *)var1 + 12));
      }
      uint64_t v7 = 0;
      int64x2_t v8 = vdupq_n_s64(0x40000000000uLL);
      (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v7, 0.0);
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
      pthread_mutex_unlock(&impl->var0._m);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"CAWindowServerDisplay", @"%s not supported on this platform", "-[CAWindowServerDisplay setSecureIndicatorsEnabled:]");
  }
}

- (BOOL)secureIndicatorsEnabled
{
  if (!self->_impl) {
    return 0;
  }
  if (CADeviceSupportsMedina::once[0] != -1) {
    dispatch_once(CADeviceSupportsMedina::once, &__block_literal_global_314);
  }
  if (!CADeviceSupportsMedina::medina)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"CAWindowServerDisplay", @"%s not supported on this platform", "-[CAWindowServerDisplay secureIndicatorsEnabled]");
    return 0;
  }
  impl = self->_impl;
  pthread_mutex_lock(&impl->var0._m);
  if (*((unsigned char *)self->_impl->var1 + 525)) {
    BOOL v4 = byte_1EB2ACC87 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = v4;
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (NSDictionary)virtualDisplayMode
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  uint64_t v3 = (void *)(*(uint64_t (**)(void, SEL))(**((void **)impl->var1 + 12) + 720))(*((void *)impl->var1 + 12), a2);
  if (!v3) {
    return 0;
  }
  id v4 = v3;

  return (NSDictionary *)v4;
}

- (CAPixelConstraints)averagePixelConstraints
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  uint64_t v3 = (*(uint64_t (**)(void, SEL))(**((void **)impl->var1 + 12) + 1240))(*((void *)impl->var1 + 12), a2);
  if (!v3) {
    return 0;
  }
  id v4 = [[CADisplayPixelConstraints alloc] initWithConstraints:v3];

  return (CAPixelConstraints *)v4;
}

- (void)renderForTime:(double)a3
{
  impl = self->_impl;
  if (impl) {
    CA::WindowServer::Server::render_for_time((uint64_t)impl->var1);
  }
}

- (void)setAccessibilityFrameRateLimitEnabled:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    var1 = self->_impl->var1;
    *((unsigned char *)var1 + 523) = v4;
    atomic_store(1u, (unsigned __int8 *)var1 + 466);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      uint64_t v7 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v9 = v4;
        _os_log_impl(&dword_184668000, v7, OS_LOG_TYPE_DEFAULT, "AXFrameRateLimit=%i", buf, 8u);
      }
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)accessibilityFrameRateLimitEnabled
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *((unsigned char *)self->_impl->var1 + 523) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setGammaAdjustment:(CGColorTRC)a3[3]
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void, CGColorTRC *__attribute__((__org_arrdim(0,3)))))(**((void **)impl->var1 + 12)
  }
                                                                                   + 1896))(*((void *)impl->var1 + 12), a3);
}

- (void)setBlackpointAdaptation:(CGColorTRC *)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void, CGColorTRC *))(**((void **)impl->var1 + 12) + 1880))(*((void *)impl->var1 + 12), a3);
  }
}

- (CGColorTRC)blackpointAdaptation
{
  retstr->var1.var0.var6 = 0.0;
  *(_OWORD *)&retstr->unint64_t var0 = 0u;
  *(_OWORD *)&retstr->var1.var1.var1 = 0u;
  unint64_t var0 = self->var1.var1.var0;
  if (var0)
  {
    self = (CGColorTRC *)(*(uint64_t (**)(void, SEL))(**(void **)(*(void *)(var0 + 64) + 96) + 1872))(*(void *)(*(void *)(var0 + 64) + 96), a3);
    if (self)
    {
      long long v5 = *(_OWORD *)&self->var1.var1.var1;
      *(_OWORD *)&retstr->unint64_t var0 = *(_OWORD *)&self->var0;
      *(_OWORD *)&retstr->var1.var1.var1 = v5;
      retstr->var1.var0.var6 = self->var1.var0.var6;
    }
  }
  return self;
}

- (void)setSystemGamma:(CGColorTRC *)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void, CGColorTRC *))(**((void **)impl->var1 + 12) + 1864))(*((void *)impl->var1 + 12), a3);
  }
}

- (CGColorTRC)systemGamma
{
  retstr->var1.var0.var6 = 0.0;
  *(_OWORD *)&retstr->unint64_t var0 = 0u;
  *(_OWORD *)&retstr->var1.var1.var1 = 0u;
  unint64_t var0 = self->var1.var1.var0;
  if (var0)
  {
    self = (CGColorTRC *)(*(uint64_t (**)(void, SEL))(**(void **)(*(void *)(var0 + 64) + 96) + 1856))(*(void *)(*(void *)(var0 + 64) + 96), a3);
    if (self)
    {
      long long v5 = *(_OWORD *)&self->var1.var1.var1;
      *(_OWORD *)&retstr->unint64_t var0 = *(_OWORD *)&self->var0;
      *(_OWORD *)&retstr->var1.var1.var1 = v5;
      retstr->var1.var0.var6 = self->var1.var0.var6;
    }
  }
  return self;
}

- (void)setDisplayColorSpace:(CGColorSpace *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    var1 = impl->var1;
    (*(void (**)(void *, CGColorSpace *))(**((void **)var1 + 12) + 1832))(*((void **)var1 + 12), a3);
    uint64_t v9 = 0;
    int64x2_t v10 = vdupq_n_s64(0x10uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v9, 0.0);
  }
  if (BYTE8(xmmword_1EB2ACC30))
  {
    CFDataRef v6 = CGColorSpaceCopyICCData(a3);
    if (v6)
    {
      CFDataRef v7 = v6;
      int64x2_t v8 = CA_CFDataWriteTempFile(v6, "display-colorspace-XXXXXX.icc", 4);
      CFRelease(v7);
      free(v8);
    }
  }
}

- (CGColorSpace)displayColorSpace
{
  impl = self->_impl;
  if (impl) {
    return (CGColorSpace *)(*(uint64_t (**)(void))(**((void **)impl->var1 + 12) + 1824))();
  }
  else {
    return 0;
  }
}

- (void)setBlendColorSpace:(CGColorSpace *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    var1 = impl->var1;
    (*(void (**)(void *, CGColorSpace *))(**((void **)var1 + 12) + 1816))(*((void **)var1 + 12), a3);
    uint64_t v9 = 0;
    int64x2_t v10 = vdupq_n_s64(0x10uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v9, 0.0);
  }
  if (BYTE8(xmmword_1EB2ACC30))
  {
    CFDataRef v6 = CGColorSpaceCopyICCData(a3);
    if (v6)
    {
      CFDataRef v7 = v6;
      int64x2_t v8 = CA_CFDataWriteTempFile(v6, "blend-colorspace-XXXXXX.icc", 4);
      CFRelease(v7);
      free(v8);
    }
  }
}

- (CGColorSpace)blendColorSpace
{
  impl = self->_impl;
  if (impl) {
    return (CGColorSpace *)(*(uint64_t (**)(void))(**((void **)impl->var1 + 12) + 1808))();
  }
  else {
    return 0;
  }
}

- (BOOL)supportsColorSpaces
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 376))();
  }
  else {
    return 0;
  }
}

- (void)addFramePresentationTimestamp:(unint64_t)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(Server *, unint64_t))(*(void *)impl->var1 + 368))(impl->var1, a3);
  }
}

- (void)copyDisplayTimingsFromDisplay:(id)a3
{
  if (a3)
  {
    impl = self->_impl;
    if (impl)
    {
      uint64_t v4 = *((void *)a3 + 1);
      if (v4) {
        (*(void (**)(Server *, void))(*(void *)impl->var1 + 352))(impl->var1, *(void *)(v4 + 64));
      }
    }
  }
}

- (BOOL)setDigitalModes:(id)a3
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(Server *, id))(*(void *)impl->var1 + 344))(impl->var1, a3);
  }
  else {
    return 0;
  }
}

- (BOOL)setDigitalModes:(id)a3 withTimings:(id)a4
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(Server *, id, id))(*(void *)impl->var1 + 336))(impl->var1, a3, a4);
  }
  else {
    return 0;
  }
}

- (void)postSyncNotification:(id)a3 payload:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_impl)
  {
    CFDataRef v7 = [(CAWindowServerDisplay *)self syncNotificationQueue];
    if (v7)
    {
      int64x2_t v8 = v7;
      uint64_t v9 = [self->_impl->var7 objectForKeyedSubscript:a3];
      if (v9)
      {
        uint64_t v10 = v9;
        if (x_log_hook_p())
        {
          [a3 UTF8String];
          x_log_();
        }
        else
        {
          uint64_t v11 = x_log_category_windowserver;
          if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v15 = [a3 UTF8String];
            _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_INFO, "SyncNotification callback '%s' called...", buf, 0xCu);
          }
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__CAWindowServerDisplay_postSyncNotification_payload___block_invoke;
        block[3] = &unk_1E5280838;
        block[5] = a4;
        block[6] = v10;
        block[4] = a3;
        dispatch_sync(v8, block);
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          float64x2_t v12 = x_log_category_windowserver;
          if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_184668000, v12, OS_LOG_TYPE_INFO, "SyncNotification completed", buf, 2u);
          }
        }
      }
    }
  }
}

uint64_t __54__CAWindowServerDisplay_postSyncNotification_payload___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setSyncNotificationQueue:(id)a3
{
  impl = self->_impl;
  if (impl)
  {

    self->_impl->var5 = a3;
  }
}

- (id)syncNotificationQueue
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  id result = impl->var5;
  if (!result)
  {
    long long v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id result = dispatch_queue_create("CABrightnessControl Sync Queue", v5);
    self->_impl->var5 = result;
  }
  return result;
}

- (void)unregisterSyncNotificationBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    uint64_t v3 = (void *)MEMORY[0x185324A30]();
    uint64_t v4 = (void *)[impl->var7 allValues];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          _Block_release(*(const void **)(*((void *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v6);
    }

    impl->var7 = 0;
  }
}

- (void)registerForSyncNotifications:(id)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    if (!impl->var9)
    {
      uint64_t var1 = (uint64_t)impl->var1;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke;
      v16[3] = &unk_1E527E478;
      v16[4] = self;
      CA::WindowServer::Server::set_pre_post_power_callback(var1, v16);
      uint64_t v9 = self->_impl->var1;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke_2;
      v15[3] = &unk_1E527E4A0;
      v15[4] = self;
      CA::WindowServer::Server::set_pre_post_flipbook_callback((uint64_t)v9, v15);
      impl = self->_impl;
      impl->var9 = 1;
    }
    if (!impl->var7) {
      self->_impl->var7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          _Block_release((const void *)[self->_impl->var7 objectForKeyedSubscript:v14]);
          [self->_impl->var7 setObject:_Block_copy(a4) forKeyedSubscript:v14];
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v6 = @"syncNotificationWillChangePowerState";
  }
  else {
    uint64_t v6 = @"syncNotificationDidChangePowerState";
  }
  v8[0] = @"syncNotificationEventState";
  v8[1] = @"syncNotificationFromHotplug";
  v9[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
  v9[1] = [NSNumber numberWithBool:a4];
  return objc_msgSend(*(id *)(a1 + 32), "postSyncNotification:payload:", v6, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
}

uint64_t __64__CAWindowServerDisplay_registerForSyncNotifications_withBlock___block_invoke_2(uint64_t a1, int a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v3 = @"syncNotificationWillChangeFlipBookState";
  }
  else {
    uint64_t v3 = @"syncNotificationDidChangeFlipBookState";
  }
  uint64_t v5 = @"syncNotificationEventState";
  v6[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
  return objc_msgSend(*(id *)(a1 + 32), "postSyncNotification:payload:", v3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (void)postNotification:(id)a3 payload:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    uint64_t v8 = objc_msgSend(impl->var6, "objectForKeyedSubscript:");
    uint64_t v9 = [(CAWindowServerDisplay *)self notificationQueue];
    uint64_t v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      if (!x_log_hook_p() && !os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_29;
      }
      if (a4) {
        CFStringRef v12 = CFCopyDescription(a4);
      }
      else {
        CFStringRef v12 = 0;
      }
      if (x_log_hook_p())
      {
        [a3 UTF8String];
        if (v12) {
          CFStringGetCStringPtr(v12, 0x8000100u);
        }
        x_log_();
      }
      else
      {
        long long v13 = x_log_category_windowserver;
        if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [a3 UTF8String];
          if (v12) {
            CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
          }
          else {
            CStringPtr = "(null)";
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v20 = v14;
          __int16 v21 = 2080;
          uint64_t v22 = CStringPtr;
          _os_log_impl(&dword_184668000, v13, OS_LOG_TYPE_DEFAULT, "Posting %s, payload: %s", buf, 0x16u);
          if (!v12) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
      }
      if (!v12)
      {
LABEL_29:
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__CAWindowServerDisplay_postNotification_payload___block_invoke;
        block[3] = &unk_1E5280838;
        block[5] = a4;
        block[6] = v8;
        block[4] = a3;
        dispatch_async(v10, block);
        return;
      }
LABEL_28:
      CFRelease(v12);
      goto LABEL_29;
    }
    if (!v9)
    {
      if (x_log_hook_p()) {
        goto LABEL_16;
      }
      uint64_t v16 = x_log_category_windowserver;
      if (!os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = [a3 UTF8String];
      long long v17 = "no queue available for '%s' notification";
LABEL_33:
      _os_log_impl(&dword_184668000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      return;
    }
    if (v8) {
      return;
    }
    if (x_log_hook_p())
    {
LABEL_16:
      [a3 UTF8String];
      x_log_();
      return;
    }
    uint64_t v16 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = [a3 UTF8String];
      long long v17 = "no block registered for '%s' notification";
      goto LABEL_33;
    }
  }
}

uint64_t __50__CAWindowServerDisplay_postNotification_payload___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setNotificationQueue:(id)a3
{
  if (self->_impl)
  {
    id v5 = a3;

    self->_impl->var4 = a3;
  }
}

- (id)notificationQueue
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  id result = impl->var4;
  if (!result)
  {
    id result = dispatch_queue_create("CABrightnessControl", 0);
    self->_impl->var4 = result;
  }
  return result;
}

- (void)unregisterNotificationBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    uint64_t v3 = (void *)MEMORY[0x185324A30]();
    uint64_t v4 = (void *)[impl->var6 allValues];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          _Block_release(*(const void **)(*((void *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v6);
    }

    impl->var6 = 0;
  }
}

- (void)registerForNotifications:(id)a3 withBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    if (!impl->var8)
    {
      uint64_t var1 = (uint64_t)impl->var1;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke;
      v25[3] = &unk_1E527E400;
      v25[4] = self;
      CA::WindowServer::Server::set_brightness_callback(var1, v25);
      uint64_t v9 = self->_impl->var1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_2;
      aBlock[3] = &unk_1E527E400;
      aBlock[4] = self;
      long long v10 = (const void *)*((void *)v9 + 30);
      if (v10)
      {
        _Block_release(v10);
        *((void *)v9 + 30) = 0;
      }
      *((void *)v9 + 30) = _Block_copy(aBlock);
      long long v11 = self->_impl->var1;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_3;
      v23[3] = &unk_1E527E400;
      v23[4] = self;
      _Block_release(*((const void **)v11 + 32));
      *((void *)v11 + 32) = _Block_copy(v23);
      long long v12 = self->_impl->var1;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_4;
      v22[3] = &unk_1E527E428;
      v22[4] = self;
      if (CADeviceSupportsMedina::once[0] != -1) {
        dispatch_once(CADeviceSupportsMedina::once, &__block_literal_global_314);
      }
      if (CADeviceSupportsMedina::medina) {
        (*(void (**)(void, void *))(**((void **)v12 + 12) + 2072))(*((void *)v12 + 12), v22);
      }
      long long v13 = self->_impl->var1;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_5;
      v21[3] = &unk_1E527E450;
      v21[4] = self;
      uint64_t v14 = (const void *)*((void *)v13 + 31);
      if (v14)
      {
        _Block_release(v14);
        *((void *)v13 + 31) = 0;
      }
      *((void *)v13 + 31) = _Block_copy(v21);
      impl = self->_impl;
      impl->var8 = 1;
    }
    if (!impl->var6) {
      self->_impl->var6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v15 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v20 = (const void *)[self->_impl->var6 objectForKeyedSubscript:v19];
          if (v20) {
            _Block_release(v20);
          }
          [self->_impl->var6 setObject:_Block_copy(a4) forKeyedSubscript:v19];
        }
        uint64_t v16 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v16);
    }
  }
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = @"notificationAttached";
  }
  else {
    uint64_t v2 = @"notificationDetached";
  }
  return [*(id *)(a1 + 32) postNotification:v2 payload:0];
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = @"notificationPowerOn";
  }
  else {
    uint64_t v2 = @"notificationPowerOff";
  }
  return [*(id *)(a1 + 32) postNotification:v2 payload:0];
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = @"notificationFlipBookOn";
  }
  else {
    uint64_t v2 = @"notificationFlipBookOff";
  }
  return [*(id *)(a1 + 32) postNotification:v2 payload:0];
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v6 = @"notificationSecureIndicatorOn";
  }
  else {
    uint64_t v6 = @"notificationSecureIndicatorOff";
  }
  v8[0] = @"indicatorType";
  v8[1] = @"activeIndicatorCount";
  v9[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v9[1] = [NSNumber numberWithUnsignedInt:a4];
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", v6, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
}

uint64_t __60__CAWindowServerDisplay_registerForNotifications_withBlock___block_invoke_5(uint64_t a1, int a2, int a3, double a4)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a2) {
    float v5 = *(float *)&a4;
  }
  else {
    float v5 = 1.0;
  }
  if (a3)
  {
    v22[0] = @"requestEDR";
    *(float *)&a4 = v5;
    v22[1] = @"rampDuration";
    v23[0] = [NSNumber numberWithFloat:a4];
    v23[1] = &unk_1ED057700;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = v23;
    uint64_t v8 = (__CFString **)v22;
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v20 = @"requestEDR";
    *(float *)&a4 = v5;
    uint64_t v21 = [NSNumber numberWithFloat:a4];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = &v21;
    uint64_t v8 = &v20;
    uint64_t v9 = 1;
  }
  uint64_t v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:v9];
  if (x_log_hook_p())
  {
    double v15 = v5;
    uint64_t v14 = [*(id *)(a1 + 32) displayId];
    x_log_();
  }
  else
  {
    long long v11 = x_log_category_brightness;
    if (os_log_type_enabled((os_log_t)x_log_category_brightness, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [*(id *)(a1 + 32) displayId];
      *(_DWORD *)buf = 67109376;
      int v17 = v12;
      __int16 v18 = 2048;
      double v19 = v5;
      _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_DEFAULT, "Display %d requesting EDR headroom: %g", buf, 0x12u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:payload:", @"notificationEDR", v10, v14, *(void *)&v15);
}

- (unsigned)serviceObject
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 328))();
  }
  else {
    return 0;
  }
}

- (void)setBrightnessCapabilities:(id)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(Server *, id))(*(void *)impl->var1 + 320))(impl->var1, a3);
  }
}

- (NSDictionary)brightnessCapabilities
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  uint64_t v3 = (void *)(*(uint64_t (**)(Server *, SEL))(*(void *)impl->var1 + 312))(impl->var1, a2);

  return (NSDictionary *)v3;
}

- (BOOL)tripleBuffered
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 296))();
  }
  else {
    return 0;
  }
}

- (void)setCursorEnabled:(BOOL)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(Server *, BOOL))(*(void *)impl->var1 + 264))(impl->var1, a3);
  }
}

- (BOOL)cursorEnabled
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 256))();
  }
  else {
    return 0;
  }
}

- (void)setCursorHidden:(BOOL)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(Server *, BOOL))(*(void *)impl->var1 + 248))(impl->var1, a3);
  }
}

- (BOOL)cursorHidden
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 240))();
  }
  else {
    return 0;
  }
}

- (void)setCursorDictionary:(id)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(Server *, id))(*(void *)impl->var1 + 232))(impl->var1, a3);
  }
}

- (NSDictionary)cursorDictionary
{
  impl = self->_impl;
  if (impl) {
    return (NSDictionary *)(*(uint64_t (**)(void))(*(void *)impl->var1 + 224))();
  }
  else {
    return 0;
  }
}

- (void)setCursorPosition:(CGPoint)a3
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(__n128, __n128))(*(void *)impl->var1 + 216))((__n128)a3, *(__n128 *)&a3.y);
  }
}

- (CGPoint)cursorPosition
{
  impl = self->_impl;
  if (impl)
  {
    (*(void (**)(Server *, SEL))(*(void *)impl->var1 + 208))(impl->var1, a2);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGSize)maximumCursorSize
{
  impl = self->_impl;
  if (impl)
  {
    (*(void (**)(void, SEL))(**((void **)impl->var1 + 12) + 1664))(*((void *)impl->var1 + 12), a2);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)supportsCursor
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 200))();
  }
  else {
    return 0;
  }
}

- (BOOL)needsUpdate
{
  impl = self->_impl;
  return impl
      && (*(uint64_t (**)(void, SEL))(**((void **)impl->var1 + 12) + 336))(*((void *)impl->var1 + 12), a2) != 0;
}

- (CGRect)detachingRect
{
  v8[4] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    double v3 = (double *)v8;
    (*(void (**)(void *__return_ptr))(**((void **)impl->var1 + 12) + 656))(v8);
    double v4 = *(double *)&v8[1];
    double v5 = *(double *)&v8[2];
  }
  else
  {
    double v3 = (double *)MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  double v6 = v3[3];
  double v7 = *v3;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v7;
  return result;
}

- (BOOL)isDetaching
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(**((void **)impl->var1 + 12) + 648))();
  }
  else {
    return 0;
  }
}

- (void)detachingDisplay
{
  impl = self->_impl;
  if (impl) {
    return CA::WindowServer::Display::ogl_display(*((CA::WindowServer::Display **)impl->var1 + 12));
  }
  else {
    return 0;
  }
}

- (int64_t)frameInfoCallbackVersion
{
  return 4;
}

- (id)frameInfoCallback
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  id var3 = self->_impl->var3;
  pthread_mutex_unlock(&impl->var0._m);
  return var3;
}

- (void)setFrameInfoCallback:(id)a3
{
  v12[5] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    double v6 = self->_impl;
    id var3 = v6->var3;
    if (var3)
    {
      _Block_release(var3);
      double v6 = self->_impl;
      v6->id var3 = 0;
    }
    if (a3)
    {
      uint64_t v8 = _Block_copy(a3);
      uint64_t v9 = self->_impl;
      v9->id var3 = v8;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__CAWindowServerDisplay_setFrameInfoCallback___block_invoke;
      v12[3] = &unk_1E527E3D8;
      v12[4] = self;
      uint64_t var1 = (uint64_t)v9->var1;
      long long v11 = v12;
    }
    else
    {
      uint64_t var1 = (uint64_t)v6->var1;
      long long v11 = 0;
    }
    CA::WindowServer::Server::set_frame_info_callback(var1, v11);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

uint64_t __46__CAWindowServerDisplay_setFrameInfoCallback___block_invoke(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, float a9, float a10, float a11, __int16 a12, unsigned __int8 a13, uint64_t a14, unsigned int a15)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v19[0] = a2;
  v19[1] = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v23 = a7;
  int v24 = a8;
  __int16 v25 = a12;
  __int16 v26 = a13;
  float v27 = a9;
  float v28 = a10;
  uint64_t v29 = LODWORD(a11);
  uint64_t v30 = a14;
  uint64_t v31 = a15;
  uint64_t v16 = *(pthread_mutex_t **)(*(void *)(a1 + 32) + 8);
  pthread_mutex_lock(v16);
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 168);
  if (v17) {
    (*(void (**)(uint64_t, _DWORD *))(v17 + 16))(v17, v19);
  }
  return pthread_mutex_unlock(v16);
}

- (void)presentSurface:(__IOSurface *)a3 withOptions:(id)a4
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, __IOSurface *))(*(void *)self->_impl->var1 + 80))(self->_impl->var1, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)activateReplay
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *))(*(void *)self->_impl->var1 + 32))(self->_impl->var1);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)finishExternalUpdate:(void *)a3 withFlags:(unsigned int)a4 debugInfo:(unint64_t)a5
{
  if (!a3) {
    return 0;
  }
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  char v7 = (*(uint64_t (**)(Server *, void *, void, unint64_t))(*(void *)impl->var1 + 24))(impl->var1, a3, *(void *)&a4, a5);
  pthread_mutex_unlock(&self->_impl->var0._m);
  return v7;
}

- (BOOL)finishExternalUpdate:(void *)a3 withFlags:(unsigned int)a4
{
  return [(CAWindowServerDisplay *)self finishExternalUpdate:a3 withFlags:*(void *)&a4 debugInfo:0];
}

- (void)beginExternalUpdate:(void *)a3 usingSoftwareRenderer:(BOOL)a4
{
  if (a3)
  {
    impl = self->_impl;
    if (impl)
    {
      BOOL v6 = a4;
      pthread_mutex_lock(&impl->var0._m);
      (*(void (**)(Server *, BOOL))(*(void *)self->_impl->var1 + 96))(self->_impl->var1, v6);
      char v7 = *(void (**)(void))(*(void *)self->_impl->var1 + 16);
      v7();
    }
  }
}

- (unint64_t)previousVBL
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  unint64_t v4 = (*(uint64_t (**)(Server *))(*(void *)self->_impl->var1 + 56))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (unint64_t)vblDelta
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  unint64_t v4 = (*(uint64_t (**)(Server *))(*(void *)self->_impl->var1 + 48))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (double)nextWakeupTime
{
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  double v4 = (*(double (**)(Server *))(*(void *)self->_impl->var1 + 40))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (BOOL)canUpdateWithFlags:(unsigned int)a3
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  uint64_t v4 = *(void *)&a3;
  pthread_mutex_lock(&self->_impl->var0._m);
  char v6 = (*(uint64_t (**)(Server *, uint64_t))(*(void *)self->_impl->var1 + 8))(self->_impl->var1, v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v6;
}

- (BOOL)abortWhitePointRamp:(id *)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)whitePointD50XYZ
{
  BOOL v2 = [(CAWindowServerDisplay *)self supportsColorSpaces];
  if (v2)
  {
    if (CADeviceUseHarmonyXYZD50::once != -1) {
      dispatch_once(&CADeviceUseHarmonyXYZD50::once, &__block_literal_global_258);
    }
    LOBYTE(v2) = CADeviceUseHarmonyXYZD50::use_d50_xyz != 0;
  }
  return v2;
}

- (BOOL)whitePointAvailable
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(*(void *)impl->var1 + 160))();
  }
  else {
    return 0;
  }
}

- (BOOL)commitPreset
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t var1 = self->_impl->var1;
  double v3 = (__CFRunLoop *)(*(uint64_t (**)(Server *, SEL))(*(void *)var1 + 384))(var1, a2);
  uint64_t v4 = v3;
  if (v3)
  {
    double v5 = (const void *)*MEMORY[0x1E4F1D410];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__CAWindowServerDisplay_commitPreset__block_invoke;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = var1;
    CFRunLoopPerformBlock(v3, v5, v7);
    CFRunLoopWakeUp(v4);
  }
  return v4 != 0;
}

uint64_t __37__CAWindowServerDisplay_commitPreset__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  *(_DWORD *)(v1[12] + 745) |= 0x400u;
  uint64_t v3 = 0;
  int64x2_t v4 = vdupq_n_s64(0x8000000000uLL);
  (*(void (**)(void *, uint64_t *, double))(*v1 + 184))(v1, &v3, 0.0);
  return (*(uint64_t (**)(void))(*(void *)v1[12] + 1208))();
}

- (BOOL)isReferencePreset
{
  return (*(unsigned __int8 *)(*((void *)self->_impl->var1 + 12) + 746) >> 6) & 1;
}

- (void)setIsReferencePreset:(BOOL)a3
{
  if (a3) {
    int v4 = 0x4000;
  }
  else {
    int v4 = 0;
  }
  uint64_t v3 = (unsigned int *)(*((void *)self->_impl->var1 + 12) + 745);
  *uint64_t v3 = *v3 & 0xFFFFBFFF | v4;
}

- (BOOL)preserveAppleSRGBGammaResponse
{
  return (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 1200))();
}

- (void)setPreserveAppleSRGBGammaResponse:(BOOL)a3
{
  uint64_t v3 = *((void *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, BOOL))(*(void *)v3 + 1192))(v3, a3);
}

- (int64_t)trinityCabalConfig
{
  uint64_t v2 = *((void *)self->_impl->var1 + 12);
  return (*(unsigned int (**)(uint64_t, SEL))(*(void *)v2 + 1184))(v2, a2);
}

- (void)setTrinityCabalConfig:(int64_t)a3
{
  uint64_t v3 = *((void *)self->_impl->var1 + 12);
  (*(void (**)(uint64_t, void))(*(void *)v3 + 1176))(v3, a3);
}

- (double)maximumReferenceLuminance
{
  (*(void (**)(void))(**((void **)self->_impl->var1 + 12) + 1168))();
  return result;
}

- (void)setMaximumReferenceLuminance:(double)a3
{
}

- (double)minimumLuminance
{
  (*(void (**)(void))(**((void **)self->_impl->var1 + 12) + 1152))();
  return result;
}

- (void)setMinimumLuminance:(double)a3
{
}

- (double)maximumSDRLuminance
{
  (*(void (**)(void))(**((void **)self->_impl->var1 + 12) + 1136))();
  return result;
}

- (void)setMaximumSDRLuminance:(double)a3
{
}

- (double)maximumHDRLuminance
{
  (*(void (**)(void))(**((void **)self->_impl->var1 + 12) + 1120))();
  return result;
}

- (void)setMaximumHDRLuminance:(double)a3
{
}

- (BOOL)forceCommitBrightness:(id *)a3 withBlock:(id)a4
{
  impl = self->_impl;
  if (impl) {
    impl->var2.var15 |= 0x400u;
  }
  return [(CAWindowServerDisplay *)self commitBrightness:a3 withBlock:a4];
}

- (void)setWhitePointMatrix:(id *)a3 scale:(float)a4
{
  impl = self->_impl;
  if (impl)
  {
    long long v5 = *(_OWORD *)a3->var0;
    long long v6 = *(_OWORD *)&a3->var0[4];
    impl->var2.var11.var0[8] = a3->var0[8];
    *(_OWORD *)&impl->var2.var11.var0[4] = v6;
    *(_OWORD *)impl->var2.var11.unint64_t var0 = v5;
    impl->var2.var10 = a4;
    impl->var2.var15 |= 0x100u;
  }
}

- (void)setIRDCFlushHint:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var14 = a3;
    impl->var2.var15 |= 0x4000u;
  }
}

- (void)setBrightnessControlDisabled:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.var13 = a3;
    impl->var2.var15 |= 0x40u;
  }
}

- (void)setFilteredAmbient:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    impl->var2.uint64_t var1 = a3;
    impl->var2.var15 |= 0x20u;
  }
}

- (void)emitWhitePointError:(id *)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!*a3)
    {
      uint64_t v3 = *MEMORY[0x1E4F28568];
      v4[0] = @"white point control not supported on this display";
      *a3 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 5, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
    }
  }
}

- (void)emitBrightnessError:(id *)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!*a3)
    {
      uint64_t v3 = *MEMORY[0x1E4F28568];
      v4[0] = @"brightness control not supported on this display";
      *a3 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
    }
  }
}

- (int64_t)transportType
{
  impl = self->_impl;
  if (impl
    && (uint64_t v3 = (*(unsigned int (**)(void, SEL))(**((void **)impl->var1 + 12) + 1392))(*((void *)impl->var1 + 12), a2)- 1, v3 <= 4))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (float)gamma
{
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  (*(void (**)(void))(**((void **)impl->var1 + 12) + 1360))();
  return result;
}

- ($05FBF485E644614EAF311772389EC12B)chromaticities
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var0.unint64_t var0 = 0u;
  *(_OWORD *)&retstr->var2.unint64_t var0 = 0u;
  $94F468A8D4C62B317260615823C2B210 var1 = self->var1;
  if (var1)
  {
    int v8 = 0;
    long long v6 = 0uLL;
    long long v7 = 0uLL;
    self = ($05FBF485E644614EAF311772389EC12B *)(*(void *(**)(long long *__return_ptr))(**(void **)(*(void *)(*(void *)&var1 + 64) + 96)
                                                                                                  + 1352))(&v6);
    if ((_BYTE)v8)
    {
      long long v5 = v7;
      *(_OWORD *)&retstr->var0.unint64_t var0 = v6;
      *(_OWORD *)&retstr->var2.unint64_t var0 = v5;
    }
  }
  return self;
}

- ($94F468A8D4C62B317260615823C2B210)whitepoint
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    int v7 = 0;
    long long v5 = 0u;
    long long v6 = 0u;
    (*(void (**)(long long *__return_ptr))(**((void **)impl->var1 + 12) + 1352))(&v5);
    float v4 = *((float *)&v6 + 3);
    float v3 = *((float *)&v6 + 2);
    if (!(_BYTE)v7)
    {
      float v4 = 0.0;
      float v3 = 0.0;
    }
  }
  else
  {
    float v4 = 0.0;
    float v3 = 0.0;
  }
  result.$94F468A8D4C62B317260615823C2B210 var1 = v4;
  result.unint64_t var0 = v3;
  return result;
}

- (NSString)description
{
  [(CAWindowServerDisplay *)self bounds];
  return (NSString *)[NSString stringWithFormat:@"<CAWindowServerDisplay:%p %@ %gx%g>", self, -[CAWindowServerDisplay name](self, "name"), v3, v4];
}

- (unsigned)framebufferFormat
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  uint64_t v4 = *((void *)self->_impl->var1 + 12);
  unsigned int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 200))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (BOOL)enabled
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  uint64_t v4 = *((void *)self->_impl->var1 + 12);
  char v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 216))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, BOOL))(*(void *)self->_impl->var1 + 192))(self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)disabled
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *((unsigned char *)self->_impl->var1 + 512) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setDisabled:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    int v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    os_unfair_lock_lock((os_unfair_lock_t)var1 + 4);
    int v7 = *((unsigned __int8 *)var1 + 512);
    if (v7 != v4)
    {
      *((unsigned char *)var1 + 512) = v4;
      (*(void (**)(Server *, void))(*(void *)var1 + 192))(var1, v4 ^ 1u);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)var1 + 4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    if (v7 != v4 && (v4 & 1) == 0) {
      CA::WindowServer::Server::set_blanked((CA::WindowServer::Server *)var1, 0);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)disablesUpdates
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    BOOL v4 = (*(_DWORD *)(*((void *)self->_impl->var1 + 12) + 745) >> 8) & 1;
    pthread_mutex_unlock(&impl->var0._m);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setDisablesUpdates:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    if (v4) {
      int v7 = 256;
    }
    else {
      int v7 = 0;
    }
    *(_DWORD *)(*((void *)var1 + 12) + 745) = *(_DWORD *)(*((void *)var1 + 12) + 745) & 0xFFFFFEFF | v7;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (__IOSurface)acquireFrozenSurface
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
  char v5 = (pthread_mutex_t *)((char *)var1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
  long long v6 = (__IOSurface *)(*(uint64_t (**)(void))(**((void **)var1 + 12) + 1592))();
  pthread_mutex_unlock(v5);
  pthread_mutex_unlock(&impl->var0._m);
  return v6;
}

- (void)freeze
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    *((void *)var1 + 11) = dispatch_semaphore_create(0);
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(void))(**((void **)var1 + 12) + 1600))();
    CA::WindowServer::Server::invalidate((os_unfair_lock_s *)var1, *(const CA::Shape **)(*((void *)var1 + 12) + 216));
    uint64_t v7 = 0;
    int64x2_t v8 = vdupq_n_s64(0x8000000uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v7, 0.0);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)var1 + 11), v5))
    {
      if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        long long v6 = x_log_category_windowserver;
        if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v7) = 0;
          _os_log_impl(&dword_184668000, v6, OS_LOG_TYPE_DEFAULT, "CoreAnimation: timed out freeze semaphore\n", (uint8_t *)&v7, 2u);
        }
      }
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)tracksCarPlayRegions
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *((unsigned char *)self->_impl->var1 + 524) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setTracksCarPlayRegions:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    int v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    if (*((unsigned __int8 *)var1 + 524) != v4)
    {
      if (v4)
      {
        if (CACarPlayMarshalCreate(void)::once != -1) {
          dispatch_once(&CACarPlayMarshalCreate(void)::once, &__block_literal_global_18653);
        }
        *((void *)var1 + 59) = objc_opt_new();
      }
      else
      {
        uint64_t v7 = (void *)*((void *)var1 + 59);
        [v7 invalidate];

        *((void *)var1 + 59) = 0;
      }
      *((unsigned char *)var1 + 524) = v4;
      uint64_t v13 = 0;
      __asm { FMOV            V0.2D, #2.0 }
      long long v14 = _Q0;
      (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v13, 0.0);
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)allowsDisplayCompositing
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *((unsigned char *)self->_impl->var1 + 515) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setAllowsDisplayCompositing:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_allows_display_compositing((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isSecure
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *((unsigned char *)self->_impl->var1 + 514) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setSecure:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_secure((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (id)updateRequestCallback
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = (void *)(*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 1792))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (id)brightnessCallback
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = (void *)*((void *)self->_impl->var1 + 29);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (id)hotPlugCallback
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = (void *)*((void *)self->_impl->var1 + 28);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setUpdateRequestCallback:(id)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(void))(**((void **)self->_impl->var1 + 12) + 1784))();
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setBrightnessCallback:(id)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_brightness_callback((uint64_t)self->_impl->var1, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setHotPlugCallback:(id)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    uint64_t v7 = (const void *)*((void *)var1 + 28);
    if (v7)
    {
      _Block_release(v7);
      *((void *)var1 + 28) = 0;
    }
    if (a3) {
      *((void *)var1 + 28) = _Block_copy(a3);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (NSString)TVSignalType
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = @"digital";
  if (*(unsigned char *)(*((void *)self->_impl->var1 + 12) + 636) != 2) {
    BOOL v4 = 0;
  }
  if (*(unsigned char *)(*((void *)self->_impl->var1 + 12) + 636)) {
    dispatch_time_t v5 = v4;
  }
  else {
    dispatch_time_t v5 = @"none";
  }
  pthread_mutex_unlock(&impl->var0._m);
  return &v5->isa;
}

- (void)setTVSignalType:(id)a3
{
}

- (NSString)TVMode
{
  return 0;
}

- (void)setTVMode:(id)a3
{
}

- (int)processId
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  int v4 = *(_DWORD *)(*((void *)self->_impl->var1 + 12) + 632);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setProcessId:(int)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t v6 = *((void *)self->_impl->var1 + 12);
    if (*(_DWORD *)(v6 + 632) != a3)
    {
      *(_DWORD *)(v6 + 632) = a3;
      CA::WindowServer::Display::post_display_changed(v6);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (int64_t)tag
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  int64_t v4 = *(unsigned int *)(*((void *)self->_impl->var1 + 12) + 628);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setTag:(int64_t)a3
{
  impl = self->_impl;
  if (impl)
  {
    int v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t v6 = *((void *)self->_impl->var1 + 12);
    if (*(_DWORD *)(v6 + 628) != v4)
    {
      *(_DWORD *)(v6 + 628) = v4;
      CA::WindowServer::Display::post_display_changed(v6);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)supportsExtendedColors
{
  impl = self->_impl;
  if (impl) {
    return (*(_DWORD *)(*((void *)impl->var1 + 12) + 624) >> 3) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setAllowsVirtualModes:(BOOL)a3
{
}

- (BOOL)allowsVirtualModes
{
  return 1;
}

- (void)setColorMode:(id)a3
{
}

- (NSString)colorMode
{
  return (NSString *)@"auto";
}

- (BOOL)usesPreferredModeRefreshRate
{
  return 1;
}

- (void)setUsesPreferredModeRefreshRate:(BOOL)a3
{
}

- (float)idealRefreshRate
{
  return 60.0;
}

- (void)setIdealRefreshRate:(float)a3
{
}

- (float)maximumRefreshRate
{
  return 3.4028e38;
}

- (void)setMaximumRefreshRate:(float)a3
{
}

- (float)minimumRefreshRate
{
  return 0.0;
}

- (void)setMinimumRefreshRate:(float)a3
{
}

- (float)maximumLuminance
{
  v6[3] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  (*(void (**)(void *__return_ptr))(**((void **)self->_impl->var1 + 12) + 1216))(v6);
  float v4 = *((float *)v6 + 1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (float)maximumBrightness
{
  impl = self->_impl;
  if (!impl) {
    return 1.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  float v4 = (*(float (**)(void))(**((void **)self->_impl->var1 + 12) + 1000))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setMaximumBrightness:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(float))(**((void **)var1 + 12) + 1008))(a3);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (float)contrast
{
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  float v4 = (*(float (**)(void))(**((void **)self->_impl->var1 + 12) + 904))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setContrast:(float)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(float))(**((void **)var1 + 12) + 912))(a3);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)allowsWirelessColorFiltering
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  char v4 = (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 1480))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setAllowsWirelessColorFiltering:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(void))(**((void **)self->_impl->var1 + 12) + 1488))();
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setAccessibilityColorMatrix:(float *)a3 scale:(float)a4
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_accessibility_color_matrix((CA::WindowServer::Server *)self->_impl->var1, a3, a4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setNits:(float)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    v6[0] = *(void *)(*((void *)self->_impl->var1 + 12) + 640);
    if (!CA::WindowServer::Display::Mode::is_hdr((CA::WindowServer::Display::Mode *)v6)) {
      a3 = a3 / CA::WindowServer::Display::edr_headroom(*((CA::WindowServer::Display **)self->_impl->var1 + 12));
    }
    CA::WindowServer::Server::set_sdr_nits((CA::WindowServer::Server *)self->_impl->var1, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (float)nits
{
  v6[1] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  float v4 = (*(float (**)(void))(**((void **)self->_impl->var1 + 12) + 920))();
  v6[0] = *(void *)(*((void *)self->_impl->var1 + 12) + 640);
  if (!CA::WindowServer::Display::Mode::is_hdr((CA::WindowServer::Display::Mode *)v6)) {
    float v4 = CA::WindowServer::Display::edr_headroom(*((CA::WindowServer::Display **)self->_impl->var1 + 12)) * v4;
  }
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)abortContrastEnhancerRamp:(float *)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    if (((*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 1016))() & 1) == 0)
    {
      $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      (*(void (**)(void))(**((void **)var1 + 12) + 1448))();
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setContrastEnhancer:(float)a3 rampDuration:(double)a4
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    if (((*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 1016))() & 1) == 0)
    {
      $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      (*(void (**)(float, double))(**((void **)var1 + 12) + 1440))(a3, a4);
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setUserAdjustment:(float *)a3 scale:(float)a4
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(float))(**((void **)var1 + 12) + 1432))(a4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)abortColorMatrixRamp:(float *)a3 scale:(float *)a4
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(void))(**((void **)var1 + 12) + 1424))();
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isGrayscale
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  char v4 = (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 888))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setGrayscale:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(void))(**((void **)var1 + 12) + 896))();
    CA::WindowServer::Server::invalidate((os_unfair_lock_s *)var1, *(const CA::Shape **)(*((void *)var1 + 12) + 216));
    uint64_t v6 = 0;
    int64x2_t v7 = vdupq_n_s64(0x10000uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v6, 0.0);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)allowsExtendedDynamicRange
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  char v4 = (*(uint64_t (**)(Server *))(*(void *)self->_impl->var1 + 136))(self->_impl->var1);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setAllowsExtendedDynamicRange:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, BOOL))(*(void *)self->_impl->var1 + 144))(self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)invertsColors
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  char v4 = (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 848))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setInvertsColors:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    (*(void (**)(void))(**((void **)var1 + 12) + 856))();
    CA::WindowServer::Server::invalidate((os_unfair_lock_s *)var1, *(const CA::Shape **)(*((void *)var1 + 12) + 216));
    uint64_t v6 = 0;
    int64x2_t v7 = vdupq_n_s64(0x10000uLL);
    (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v6, 0.0);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (double)apertureOffset
{
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  double v4 = (float)*(int *)(*((void *)self->_impl->var1 + 12) + 68);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setApertureOffset:(double)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    dispatch_time_t v5 = (pthread_mutex_t *)((char *)self->_impl->var1 + 24);
    pthread_mutex_lock(v5);
    pthread_mutex_unlock(v5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (CGSize)overscanAmounts
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t v4 = *((void *)self->_impl->var1 + 12);
    double v5 = *(float *)(v4 + 60);
    double v6 = *(float *)(v4 + 64);
    pthread_mutex_unlock(&impl->var0._m);
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setOverscanAmounts:(CGSize)a3
{
  impl = self->_impl;
  if (impl)
  {
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    uint64_t v8 = *((void *)var1 + 12);
    *(float *)&CGFloat width = width;
    *(_DWORD *)(v8 + 60) = LODWORD(width);
    *(float *)&CGFloat height = height;
    *(_DWORD *)(v8 + 64) = LODWORD(height);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (double)overscanAmount
{
  NSLog(&cfstr_Cawindowserver_5.isa, a2);
  impl = self->_impl;
  if (!impl) {
    return 0.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  uint64_t v4 = *((void *)self->_impl->var1 + 12);
  float v5 = *(float *)(v4 + 60);
  float v6 = *(float *)(v4 + 64);
  if (v5 != v6) {
    NSLog(&cfstr_Cawindowserver_6.isa);
  }
  if (v5 >= v6) {
    float v7 = v6;
  }
  else {
    float v7 = v5;
  }
  double v8 = v7;
  pthread_mutex_unlock(&impl->var0._m);
  return v8;
}

- (void)setOverscanAmount:(double)a3
{
  NSLog(&cfstr_Cawindowserver_4.isa, a2);
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    float v7 = a3;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    uint64_t v8 = *((void *)var1 + 12);
    *(float *)(v8 + 60) = v7;
    *(float *)(v8 + 64) = v7;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (NSString)overscanAdjustment
{
  impl = self->_impl;
  if (!impl) {
    return (NSString *)@"none";
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  int v4 = *(unsigned char *)(*((void *)self->_impl->var1 + 12) + 657) & 3;
  pthread_mutex_unlock(&impl->var0._m);
  if ((v4 - 1) > 2) {
    return 0;
  }
  else {
    return &off_1E527E540[v4 - 1]->isa;
  }
}

- (void)setOverscanAdjustment:(id)a3
{
  if (self->_impl)
  {
    if ([a3 isEqualToString:@"none"])
    {
      int v5 = 1;
    }
    else if ([a3 isEqualToString:@"scaleContent"])
    {
      int v5 = 2;
    }
    else
    {
      if (![a3 isEqualToString:@"insetBounds"]) {
        return;
      }
      int v5 = 3;
    }
    impl = self->_impl;
    pthread_mutex_lock(&impl->var0._m);
    CA::WindowServer::Server::set_overscan_adjustment((uint64_t)self->_impl->var1, v5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (NSString)orientation
{
  impl = self->_impl;
  if (!impl) {
    return (NSString *)@"portrait";
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  unsigned int v4 = (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 832))();
  pthread_mutex_unlock(&impl->var0._m);
  if (v4 > 3) {
    return 0;
  }
  else {
    return &off_1E527E520[v4]->isa;
  }
}

- (void)setOrientation:(id)a3
{
  if ([a3 isEqualToString:@"portrait"])
  {
    uint64_t v5 = 0;
  }
  else if ([a3 isEqualToString:@"landscapeLeft"])
  {
    uint64_t v5 = 1;
  }
  else if ([a3 isEqualToString:@"portraitUpsideDown"])
  {
    uint64_t v5 = 2;
  }
  else if ([a3 isEqualToString:@"landscapeRight"])
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    float v7 = (_WORD *)*((void *)self->_impl->var1 + 12);
    int v8 = (*(uint64_t (**)(_WORD *, uint64_t))(*(void *)v7 + 824))(v7, v5);
    __int16 v9 = v7[328];
    if (v8 != v9)
    {
      v7[328] = v9 & 0xFF00 | v8;
      CA::WindowServer::Display::post_display_changed((uint64_t)v7);
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isFlipBookActive
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = (**(unsigned char **)(*((void *)self->_impl->var1 + 12) + 728) & 0xFE) == 2;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (BOOL)isFlipBookSuppressed
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  char v4 = (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 320))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setFlipBookSuppressed:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_flipbook_suppressed((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isFlipBookEnabled
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  char v4 = (*(uint64_t (**)(void))(**((void **)self->_impl->var1 + 12) + 304))();
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setFlipBookEnabled:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_flipbook_enabled((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)setCalibrationPhase:(unsigned int)a3 forIdentifier:(unsigned int)a4
{
  impl = self->_impl;
  if (impl)
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v6 = *(void *)&a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    (*(void (**)(Server *, uint64_t, uint64_t))(*(void *)self->_impl->var1 + 128))(self->_impl->var1, v6, v5);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)resetConfiguration
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    uint64_t v5 = *((void *)var1 + 12);
    if (*(_WORD *)(v5 + 656))
    {
      *(_WORD *)(v5 + 656) &= 0xFF00u;
      CA::WindowServer::Display::post_display_changed(v5);
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)blankingRemovesPower
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  uint64_t v4 = *((void *)self->_impl->var1 + 12);
  char v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 248))(v4);
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)setBlankingRemovesPower:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      float v7 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v9 = v4;
        _os_log_impl(&dword_184668000, v7, OS_LOG_TYPE_DEFAULT, "set_blanking_removes_power=%u", buf, 8u);
      }
    }
    (*(void (**)(void, BOOL))(**((void **)var1 + 12) + 256))(*((void *)var1 + 12), v4);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)willUnblank
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    if (*(unsigned char *)(*(void *)(*((void *)var1 + 12) + 728) + 1) != 1 && !*((unsigned char *)var1 + 512))
    {
      pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
      if (BYTE9(xmmword_1EB2ACC10)) {
        kdebug_trace();
      }
      (*(void (**)(void))(**((void **)var1 + 12) + 232))(*((void *)var1 + 12));
      pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)isBlanked
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *(unsigned char *)(*(void *)(*((void *)self->_impl->var1 + 12) + 728) + 1) != 1;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setBlanked:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    BOOL v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_blanked((CA::WindowServer::Server *)self->_impl->var1, v4);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)powerStateDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_impl)
  {
    int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", a3), "isLowPowerModeEnabled");
    impl = self->_impl;
    pthread_mutex_lock(&impl->var0._m);
    $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
    *((unsigned char *)var1 + 518) = v4;
    atomic_store(1u, (unsigned __int8 *)var1 + 465);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      float v7 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v9 = v4;
        _os_log_impl(&dword_184668000, v7, OS_LOG_TYPE_DEFAULT, "LowPowerMode=%i", buf, 8u);
      }
    }
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (CAWindowServerDisplay)cloneMaster
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  uint64_t v4 = *((void *)self->_impl->var1 + 12);
  if (*(void *)(v4 + 48)) {
    char v5 = (CAWindowServerDisplay *)display_for_server(*(CA::WindowServer::Server **)(v4 + 48));
  }
  else {
    char v5 = 0;
  }
  pthread_mutex_unlock(&impl->var0._m);
  return v5;
}

- (void)removeAllClones
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl || (_force_cloning & 1) != 0) {
    return;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  CA::WindowServer::Server::clones((CA::WindowServer::Server *)&v9, (uint64_t)self->_impl->var1);
  uint64_t v4 = v9;
  uint64_t v5 = (char *)v10 - (char *)v9;
  if (v10 != v9)
  {
    [(CAWindowServerDisplay *)self willChangeValueForKey:@"clones"];
    uint64_t v6 = 0;
    if ((unint64_t)(v5 >> 3) <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5 >> 3;
    }
    do
    {
      int v8 = (void *)display_for_server(v4[v6]);
      [v8 willChangeValueForKey:@"cloneMaster"];
      CA::WindowServer::Server::remove_clone((CA::WindowServer::Server *)self->_impl->var1, v4[v6]);
      [v8 didChangeValueForKey:@"cloneMaster"];
      ++v6;
    }
    while (v7 != v6);
    [(CAWindowServerDisplay *)self didChangeValueForKey:@"clones"];
    goto LABEL_11;
  }
  uint64_t v4 = v10;
  if (v10) {
LABEL_11:
  }
    operator delete(v4);

  pthread_mutex_unlock(&impl->var0._m);
}

- (void)removeClone:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:@"CAWindowServerDisplay", @"%@: can't remove a nil clone display", self format];
  }
  impl = self->_impl;
  if (impl && *((void *)a3 + 1) && (_force_cloning & 1) == 0)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    if (*(Server **)(*(void *)(*(void *)(*((void *)a3 + 1) + 64) + 96) + 48) != self->_impl->var1) {
      [MEMORY[0x1E4F1CA00] raise:@"CAWindowServerDisplay", @"%@: %@ is not our clone", self, a3 format];
    }
    [(CAWindowServerDisplay *)self willChangeValueForKey:@"clones"];
    [a3 willChangeValueForKey:@"cloneMaster"];
    CA::WindowServer::Server::remove_clone((CA::WindowServer::Server *)self->_impl->var1, *(CA::WindowServer::Server **)(*((void *)a3 + 1) + 64));
    [a3 didChangeValueForKey:@"cloneMaster"];
    [(CAWindowServerDisplay *)self didChangeValueForKey:@"clones"];
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)addClone:(id)a3
{
}

- (void)addClone:(id)a3 options:(id)a4
{
  uint64_t v5 = (CAWindowServerDisplay *)a3;
  uint64_t v6 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:@"CAWindowServerDisplay", @"%@: can't clone a display to nil", self format];
  }
  p_m = &v6->_impl->var0._m;
  if (p_m && v5->_impl && (_force_cloning & 1) == 0)
  {
    pthread_mutex_lock(&v6->_impl->var0._m);
    if (v5 == v6)
    {
      int v8 = @"%@: can't clone a display to itself";
      int v9 = v5;
    }
    else
    {
      if (!*(void *)(*((void *)v6->_impl->var1 + 12) + 48))
      {
        if (*(void *)(*((void *)v5->_impl->var1 + 12) + 48)) {
          [MEMORY[0x1E4F1CA00] raise:@"CAWindowServerDisplay", @"%@: %@ is already a clone", v6, v5 format];
        }
LABEL_11:
        uint64_t v49 = v6;
        int v50 = v5;
        if (a4)
        {
          int v48 = p_m;
          uint64_t v10 = (void *)[a4 objectForKey:@"replayContexts"];
          uint64_t v11 = v10;
          id v47 = a4;
          if (v10
            && (long long v56 = 0u,
                long long v57 = 0u,
                long long v54 = 0u,
                long long v55 = 0u,
                (uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v53 count:16]) != 0))
          {
            uint64_t v13 = 0;
            long long v14 = 0;
            unint64_t v15 = 0;
            uint64_t v16 = *(void *)v55;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v55 != v16) {
                  objc_enumerationMutation(v11);
                }
                int v18 = [*(id *)(*((void *)&v54 + 1) + 8 * i) unsignedIntValue];
                int v19 = v18;
                if ((unint64_t)v14 >= v15)
                {
                  uint64_t v20 = (v14 - v13) >> 2;
                  unint64_t v21 = v20 + 1;
                  if ((unint64_t)(v20 + 1) >> 62) {
                    abort();
                  }
                  if ((uint64_t)(v15 - (void)v13) >> 1 > v21) {
                    unint64_t v21 = (uint64_t)(v15 - (void)v13) >> 1;
                  }
                  if (v15 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v22 = v21;
                  }
                  if (v22) {
                    unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v22);
                  }
                  else {
                    uint64_t v23 = 0;
                  }
                  int v24 = (char *)(v22 + 4 * v20);
                  *(_DWORD *)int v24 = v19;
                  __int16 v25 = v24 + 4;
                  while (v14 != v13)
                  {
                    int v26 = *((_DWORD *)v14 - 1);
                    v14 -= 4;
                    *((_DWORD *)v24 - 1) = v26;
                    v24 -= 4;
                  }
                  unint64_t v15 = v22 + 4 * v23;
                  if (v13) {
                    operator delete(v13);
                  }
                  uint64_t v13 = v24;
                  long long v14 = v25;
                }
                else
                {
                  *(_DWORD *)long long v14 = v18;
                  v14 += 4;
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v53 count:16];
            }
            while (v12);
          }
          else
          {
            uint64_t v13 = 0;
            long long v14 = 0;
          }
          p_m = v48;
          uint64_t v6 = v49;
          uint64_t v5 = v50;
          int v27 = objc_msgSend((id)objc_msgSend(v47, "objectForKey:", @"captureDisplay"), "BOOLValue");
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", @"disableScaling"), "BOOLValue")) {
            int v28 = v27 | 2;
          }
          else {
            int v28 = v27;
          }
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", @"disableRotation"), "BOOLValue")) {
            v28 |= 4u;
          }
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", @"disableOverscan"), "BOOLValue")) {
            v28 |= 8u;
          }
          if (objc_msgSend((id)objc_msgSend(v47, "objectForKey:", @"disableYUV"), "BOOLValue")) {
            v28 |= 0x10u;
          }
          int v29 = objc_msgSend((id)objc_msgSend(v47, "objectForKey:", @"noReplayScaling"), "BOOLValue");
          int v30 = v28 | 0x40;
          if (!v29) {
            int v30 = v28;
          }
          if (v14 == v13) {
            int v31 = v30;
          }
          else {
            int v31 = v30 | 0x20;
          }
        }
        else
        {
          uint64_t v13 = 0;
          long long v14 = 0;
          int v31 = 0;
        }
        [(CAWindowServerDisplay *)v6 willChangeValueForKey:@"clones"];
        [(CAWindowServerDisplay *)v5 willChangeValueForKey:@"cloneMaster"];
        $94F468A8D4C62B317260615823C2B210 var1 = v6->_impl->var1;
        long long v33 = (CA::WindowServer::Server *)v5->_impl->var1;
        pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
        uint64_t v34 = *((void *)var1 + 12);
        if (*(void *)(v34 + 48) || *(void *)(*((void *)v33 + 12) + 48))
        {
          pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
          if ((v31 & 0x20) != 0)
          {
LABEL_57:
            float v35 = v5->_impl->var1;
            pthread_mutex_lock((pthread_mutex_t *)((char *)v35 + 24));
            if (*((void *)v35 + 17)) {
              CA::WindowServer::Server::clear_replay_contexts((CA::WindowServer::Server *)v35);
            }
            unint64_t v36 = (v14 - v13) >> 2;
            if ((unint64_t)(v14 - v13) >> 62)
            {
              float v38 = 0;
            }
            else
            {
              malloc_zone = (malloc_zone_t *)get_malloc_zone();
              float v38 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 4 * (v14 - v13), 0x743898A5uLL);
            }
            if (v14 == v13)
            {
LABEL_69:
              *((void *)v35 + 17) = v38;
              *((void *)v35 + 18) = v36;
              *((unsigned char *)v35 + 516) = 1;
            }
            else
            {
              if (v36 <= 1) {
                uint64_t v39 = 1;
              }
              else {
                uint64_t v39 = (v14 - v13) >> 2;
              }
              __int32 v40 = v38 + 8;
              __int32 v41 = v13;
              while (1)
              {
                unsigned int v42 = *(_DWORD *)v41;
                v41 += 4;
                uint64_t v43 = CA::Render::Context::context_by_id((CA::Render::Context *)v42);
                if (!v43) {
                  break;
                }
                *((void *)v40 - 1) = v43;
                *__int32 v40 = *(_DWORD *)(v43 + 192);
                v40 += 4;
                if (!--v39) {
                  goto LABEL_69;
                }
              }
              *((void *)v35 + 17) = v38;
              *((void *)v35 + 18) = v36;
              CA::WindowServer::Server::clear_replay_contexts((CA::WindowServer::Server *)v35);
            }
            (*(void (**)(Server *, void))(*(void *)v35 + 192))(v35, 0);
            pthread_mutex_unlock((pthread_mutex_t *)((char *)v35 + 24));
            uint64_t v6 = v49;
            uint64_t v5 = v50;
          }
        }
        else
        {
          uint64_t v44 = *(void *)(v34 + 40);
          BOOL v45 = (malloc_zone_t *)get_malloc_zone();
          int8x8_t v46 = malloc_type_zone_malloc(v45, 0x10uLL, 0x8BB15036uLL);
          *int8x8_t v46 = v33;
          v46[1] = v44;
          uint64_t v5 = v50;
          *(void *)(v34 + 40) = v46;
          pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
          CA::WindowServer::Server::set_clone_master(v33, (CA::WindowServer::Server *)var1, v31);
          *(_DWORD *)(*((void *)var1 + 12) + 745) |= 0x400u;
          uint64_t v51 = 0;
          int64x2_t v52 = vdupq_n_s64(0x80000uLL);
          (*(void (**)(Server *, uint64_t *, double))(*(void *)var1 + 184))(var1, &v51, 0.0);
          if ((v31 & 0x20) != 0) {
            goto LABEL_57;
          }
        }
        [(CAWindowServerDisplay *)v5 didChangeValueForKey:@"cloneMaster"];
        [(CAWindowServerDisplay *)v6 didChangeValueForKey:@"clones"];
        if (v13) {
          operator delete(v13);
        }
        pthread_mutex_unlock(p_m);
        return;
      }
      int v8 = @"%@: can't clone a display that's a clone";
      int v9 = v6;
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"CAWindowServerDisplay", v8, v9);
    goto LABEL_11;
  }
}

- (NSSet)clones
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    CA::WindowServer::Server::clones((CA::WindowServer::Server *)&v12, (uint64_t)self->_impl->var1);
    uint64_t v4 = v12;
    uint64_t v5 = (char *)v13 - (char *)v12;
    if (v13 == v12)
    {
      uint64_t v6 = (NSSet *)[MEMORY[0x1E4F1CAD0] set];
      if (!v4)
      {
LABEL_16:
        pthread_mutex_unlock(&impl->var0._m);
        return v6;
      }
    }
    else
    {
      uint64_t v6 = (NSSet *)[MEMORY[0x1E4F1CA80] set];
      if ((unint64_t)(v5 >> 3) <= 1) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = v5 >> 3;
      }
      int v8 = v4;
      do
      {
        uint64_t v9 = display_for_server(*v8);
        if (v9) {
          [(NSSet *)v6 addObject:v9];
        }
        ++v8;
        --v7;
      }
      while (v7);
    }
    operator delete(v4);
    goto LABEL_16;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];

  return (NSSet *)[v10 set];
}

- (CATransform3D)transformFromLayerId:(SEL)a3 inContextId:(unint64_t)a4
{
  MEMORY[0x1F4188790](self);
  uint64_t v9 = v8;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *(void *)(*(void *)&result->m12 + 64);
  if (!v10)
  {
    *int v8 = CATransform3DIdentity;
    return result;
  }
  unint64_t v83 = v6;
  v84[0] = (CA::Render::Context *)v7;
  v84[1] = (CA::Render::Context *)CA::Render::Context::context_by_id(v7);
  memset(v85, 0, sizeof(v85));
  float v82 = &unk_1ED0224D0;
  uint64_t v86 = v10;
  if (v84[1])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 16));
    double v11 = *(double *)(v10 + 280);
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
    CA::Render::Context::will_commit(v84[1]);
    if (v83)
    {
      uint64_t v12 = CA::Render::Context::lookup_handle(v84[1], (CA::Render::Object *)v83, 0, 0, 0);
      if (!v12)
      {
        long long v33 = v84[1];
        goto LABEL_80;
      }
      uint64_t v13 = v12;
      float v81 = v9;
      do
      {
        uint64_t v14 = v13;
        if (!atomic_fetch_add((atomic_uint *volatile)v13 + 2, 1u))
        {
          uint64_t v14 = 0;
          atomic_fetch_add((atomic_uint *volatile)v13 + 2, 0xFFFFFFFF);
        }
        uint64_t v15 = v85[2];
        if (v85[2] >= v85[3])
        {
          uint64_t v17 = v85[1];
          int64_t v18 = (v85[2] - v85[1]) >> 3;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 61) {
            goto LABEL_108;
          }
          int64_t v20 = v85[3] - v85[1];
          if ((v85[3] - v85[1]) >> 2 > v19) {
            unint64_t v19 = v20 >> 2;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          uint64_t v101 = &v85[3];
          if (v21)
          {
            unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Display::DisplayLinkItem *>>(v21);
            uint64_t v17 = v85[1];
            uint64_t v15 = v85[2];
          }
          else
          {
            uint64_t v22 = 0;
          }
          uint64_t v23 = (CA::Render::LayerNode *)(v21 + 8 * v18);
          int v24 = (CA::Render::LayerNode *)(v21 + 8 * v22);
          uint64_t v100 = v24;
          *(void *)uint64_t v23 = v14;
          *((void *)&v99 + 1) = (char *)v23 + 8;
          if (v15 == v17)
          {
            uint64_t v16 = (CA::Render::LayerNode *)((char *)v23 + 8);
          }
          else
          {
            do
            {
              uint64_t v25 = *((void *)v15 - 1);
              uint64_t v15 = (CA::Render::LayerNode *)((char *)v15 - 8);
              *((void *)v23 - 1) = v25;
              uint64_t v23 = (CA::Render::LayerNode *)((char *)v23 - 8);
              *(void *)uint64_t v15 = 0;
            }
            while (v15 != v17);
            uint64_t v16 = (CA::Render::LayerNode *)*((void *)&v99 + 1);
            int v24 = v100;
          }
          long long v26 = *(_OWORD *)&v85[1];
          v85[1] = v23;
          v85[2] = v16;
          long long v99 = v26;
          int v27 = v85[3];
          v85[3] = v24;
          uint64_t v100 = v27;
          v98 = (CA::Render::LayerNode **)v26;
          std::__split_buffer<X::Ref<CA::Render::Handle>>::~__split_buffer((uint64_t)&v98);
        }
        else
        {
          *(void *)v85[2] = v14;
          uint64_t v16 = (CA::Render::LayerNode *)((char *)v15 + 8);
        }
        v85[2] = v16;
        int v28 = (CA::Render::Object *)*((void *)v13 + 4);
        if (!v28) {
          break;
        }
        uint64_t v13 = CA::Render::Context::lookup_handle(v84[1], v28, 0, 0, 0);
      }
      while (v13);
    }
    else
    {
      uint64_t v29 = CA::Render::Context::root_layer_handle(v84[1]);
      uint64_t v30 = v29;
      if (v29 && !atomic_fetch_add((atomic_uint *volatile)(v29 + 8), 1u))
      {
        uint64_t v30 = 0;
        atomic_fetch_add((atomic_uint *volatile)(v29 + 8), 0xFFFFFFFF);
      }
      int v31 = v85[2];
      float v81 = v9;
      if (v85[2] >= v85[3])
      {
        uint64_t v34 = v85[1];
        int64_t v35 = (v85[2] - v85[1]) >> 3;
        unint64_t v36 = v35 + 1;
        if ((unint64_t)(v35 + 1) >> 61) {
LABEL_108:
        }
          abort();
        int64_t v37 = v85[3] - v85[1];
        if ((v85[3] - v85[1]) >> 2 > v36) {
          unint64_t v36 = v37 >> 2;
        }
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v38 = v36;
        }
        uint64_t v101 = &v85[3];
        if (v38)
        {
          unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Display::DisplayLinkItem *>>(v38);
          uint64_t v34 = v85[1];
          int v31 = v85[2];
        }
        else
        {
          uint64_t v39 = 0;
        }
        __int32 v40 = (CA::Render::LayerNode *)(v38 + 8 * v35);
        __int32 v41 = (CA::Render::LayerNode *)(v38 + 8 * v39);
        uint64_t v100 = v41;
        *(void *)__int32 v40 = v30;
        *((void *)&v99 + 1) = (char *)v40 + 8;
        if (v31 == v34)
        {
          uint64_t v32 = (CA::Render::LayerNode *)((char *)v40 + 8);
        }
        else
        {
          do
          {
            uint64_t v42 = *((void *)v31 - 1);
            int v31 = (CA::Render::LayerNode *)((char *)v31 - 8);
            *((void *)v40 - 1) = v42;
            __int32 v40 = (CA::Render::LayerNode *)((char *)v40 - 8);
            *(void *)int v31 = 0;
          }
          while (v31 != v34);
          uint64_t v32 = (CA::Render::LayerNode *)*((void *)&v99 + 1);
          __int32 v41 = v100;
        }
        long long v43 = *(_OWORD *)&v85[1];
        v85[1] = v40;
        v85[2] = v32;
        long long v99 = v43;
        uint64_t v44 = v85[3];
        v85[3] = v41;
        uint64_t v100 = v44;
        v98 = (CA::Render::LayerNode **)v43;
        std::__split_buffer<X::Ref<CA::Render::Handle>>::~__split_buffer((uint64_t)&v98);
      }
      else
      {
        *(void *)v85[2] = v30;
        uint64_t v32 = (CA::Render::LayerNode *)((char *)v31 + 8);
      }
      v85[2] = v32;
    }
    long long v33 = v84[1];
    if (*((void *)v84[1] + 52) && v84[1])
    {
      while (1)
      {
        BOOL v45 = (CA::Render::Context *)*((void *)v33 + 54);
        if (!v45) {
          break;
        }
        uint64_t v46 = *((void *)v33 + 52);
        long long v33 = (CA::Render::Context *)*((void *)v33 + 54);
        if (v46)
        {
          id v47 = *(CA::Render::Object **)(v46 + 24);
          long long v33 = v45;
          if (v47)
          {
            do
            {
              int v48 = v47;
              if (!atomic_fetch_add((atomic_uint *volatile)v47 + 2, 1u))
              {
                int v48 = 0;
                atomic_fetch_add((atomic_uint *volatile)v47 + 2, 0xFFFFFFFF);
              }
              uint64_t v49 = v85[2];
              if (v85[2] >= v85[3])
              {
                uint64_t v51 = v85[1];
                int64_t v52 = (v85[2] - v85[1]) >> 3;
                unint64_t v53 = v52 + 1;
                if ((unint64_t)(v52 + 1) >> 61) {
                  goto LABEL_108;
                }
                int64_t v54 = v85[3] - v85[1];
                if ((v85[3] - v85[1]) >> 2 > v53) {
                  unint64_t v53 = v54 >> 2;
                }
                if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v55 = v53;
                }
                uint64_t v101 = &v85[3];
                if (v55)
                {
                  unint64_t v55 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Display::DisplayLinkItem *>>(v55);
                  uint64_t v51 = v85[1];
                  uint64_t v49 = v85[2];
                }
                else
                {
                  uint64_t v56 = 0;
                }
                long long v57 = (CA::Render::LayerNode *)(v55 + 8 * v52);
                uint64_t v58 = (CA::Render::LayerNode *)(v55 + 8 * v56);
                uint64_t v100 = v58;
                *(void *)long long v57 = v48;
                *((void *)&v99 + 1) = (char *)v57 + 8;
                if (v49 == v51)
                {
                  int v50 = (CA::Render::LayerNode *)((char *)v57 + 8);
                }
                else
                {
                  do
                  {
                    uint64_t v59 = *((void *)v49 - 1);
                    uint64_t v49 = (CA::Render::LayerNode *)((char *)v49 - 8);
                    *((void *)v57 - 1) = v59;
                    long long v57 = (CA::Render::LayerNode *)((char *)v57 - 8);
                    *(void *)uint64_t v49 = 0;
                  }
                  while (v49 != v51);
                  int v50 = (CA::Render::LayerNode *)*((void *)&v99 + 1);
                  uint64_t v58 = v100;
                }
                long long v60 = *(_OWORD *)&v85[1];
                v85[1] = v57;
                v85[2] = v50;
                long long v99 = v60;
                double v61 = v85[3];
                v85[3] = v58;
                uint64_t v100 = v61;
                v98 = (CA::Render::LayerNode **)v60;
                std::__split_buffer<X::Ref<CA::Render::Handle>>::~__split_buffer((uint64_t)&v98);
              }
              else
              {
                *(void *)v85[2] = v48;
                int v50 = (CA::Render::LayerNode *)((char *)v49 + 8);
              }
              v85[2] = v50;
              double v62 = (CA::Render::Object *)*((void *)v47 + 4);
              if (!v62) {
                break;
              }
              id v47 = CA::Render::Context::lookup_handle(v45, v62, 0, 0, 0);
            }
            while (v47);
            long long v33 = v45;
          }
        }
      }
      pthread_mutex_lock((pthread_mutex_t *)((char *)v33 + 72));
      if (atomic_fetch_add((atomic_uint *volatile)v33 + 2, 1u))
      {
        CA::Render::Context::did_commit((unint64_t)v84[1], 0, 0, 1, 0, 0);
        uint64_t v9 = v81;
LABEL_84:
        *uint64_t v9 = CATransform3DIdentity;
        if (v85[1] != v85[2])
        {
          bzero(v96, 0x448uLL);
          long long v88 = 0uLL;
          CA::Render::Update::Update((CA::Render::Update *)v96, &v98, 0x2000uLL, v11, 0, 0, 0, 0, (const CA::Bounds *)&v88, *(_DWORD *)(v86 + 184));
          if (v96[0])
          {
            int v64 = 140;
            if (!*(unsigned char *)(v86 + 514)) {
              int v64 = 12;
            }
            unsigned int v97 = v64 | v97 & 0xFFFFFF73;
            v96[43] = (uint64_t *)&v82;
            CA::Render::Update::add_context((CA::Render::Update *)v96, v33);
            CA::Render::Update::added_all_contexts(v96, v65, v66);
            float v63 = v85[0];
            if (v85[0])
            {
              long long v88 = xmmword_184997D50;
              long long v89 = 0u;
              long long v90 = xmmword_184997D60;
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = xmmword_184997D50;
              long long v94 = 0u;
              long long v95 = xmmword_184997D60;
              v87[0] = &unk_1ED0301F0;
              v87[1] = &v88;
              CA::Render::LayerNode::MapGeometry::map((uint64_t)v87, v85[0], 0);
              long long v67 = v89;
              long long v68 = v90;
              *(_OWORD *)&v9->m11 = v88;
              *(_OWORD *)&v9->m13 = v67;
              long long v69 = v91;
              long long v70 = v92;
              *(_OWORD *)&v9->m21 = v68;
              *(_OWORD *)&v9->m23 = v69;
              long long v71 = v93;
              long long v72 = v94;
              long long v73 = v95;
              *(_OWORD *)&v9->m31 = v70;
              *(_OWORD *)&v9->m33 = v71;
              *(_OWORD *)&v9->m41 = v72;
              *(_OWORD *)&v9->m43 = v73;
              __int16 v74 = (atomic_uint *)v85[0];
              v85[0] = 0;
              if (v74)
              {
                if (atomic_fetch_add(v74 + 4, 0xFFFFFFFF) == 1) {
                  CA::Render::LayerNode::delete_node((CA::Render::LayerNode *)v74, v63);
                }
              }
            }
          }
          CA::Render::Update::~Update((CA::Render::Update *)v96, v63);
        }
        pthread_mutex_unlock((pthread_mutex_t *)((char *)v33 + 72));
        unint64_t v75 = v85[1];
        for (uint64_t i = v85[2]; i != v75; uint64_t i = (CA::Render::LayerNode *)((char *)i - 8))
        {
          float v78 = (atomic_uint *)*((void *)i - 1);
          unsigned int v77 = v78;
          if (v78 && atomic_fetch_add(v77 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v77 + 16))(v77);
          }
        }
        v85[2] = v75;
        if (v33 && atomic_fetch_add((atomic_uint *volatile)v33 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(CA::Render::Context *))(*(void *)v33 + 16))(v33);
        }
        goto LABEL_101;
      }
      atomic_fetch_add((atomic_uint *volatile)v33 + 2, 0xFFFFFFFF);
      long long v33 = v84[1];
    }
    uint64_t v9 = v81;
LABEL_80:
    CA::Render::Context::did_commit((unint64_t)v33, 0, 0, 1, 0, 0);
    long long v33 = v84[1];
    if (v84[1] && !atomic_fetch_add((atomic_uint *volatile)v84[1] + 2, 1u))
    {
      long long v33 = 0;
      atomic_fetch_add((atomic_uint *volatile)v84[1] + 2, 0xFFFFFFFF);
    }
    pthread_mutex_lock((pthread_mutex_t *)((char *)v33 + 72));
    goto LABEL_84;
  }
  *uint64_t v9 = CATransform3DIdentity;
LABEL_101:
  float v82 = &unk_1ED02F0A0;
  v98 = &v85[1];
  std::vector<X::Ref<CA::Render::Handle>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v98);
  float v80 = v85[0];
  if (v85[0] && atomic_fetch_add((atomic_uint *volatile)v85[0] + 4, 0xFFFFFFFF) == 1) {
    CA::Render::LayerNode::delete_node(v80, v79);
  }
  CGSize result = (CATransform3D *)v84[1];
  if (v84[1] && atomic_fetch_add((atomic_uint *volatile)v84[1] + 2, 0xFFFFFFFF) == 1) {
    return (CATransform3D *)(*(uint64_t (**)(CATransform3D *))(*(void *)&result->m11 + 16))(result);
  }
  return result;
}

- (CGPoint)convertPoint:(CGPoint)result fromContextId:(unsigned int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  $94F468A8D4C62B317260615823C2B210 var1 = self->_impl->var1;
  if (var1)
  {
    float64x2_t v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    float64x2_t v11 = 0u;
    long long v12 = 0u;
    float64x2_t v9 = 0u;
    long long v10 = 0u;
    double x = result.x;
    double y = result.y;
    CA::WindowServer::Server::context_transform((CA::WindowServer::Server *)&v9, (uint64_t)var1, *(uint64_t *)&a4);
    double v5 = *((double *)&v16 + 1) + *((double *)&v10 + 1) * x + *((double *)&v12 + 1) * y;
    if (fabs(v5 + -1.0) >= 0.000001)
    {
      if (v5 <= 0.0) {
        double v5 = INFINITY;
      }
      else {
        double v5 = 1.0 / v5;
      }
    }
    CGSize result = (CGPoint)vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v15, v9, x), v11, y), v5);
    result.double y = v6;
  }
  return result;
}

- (unsigned)taskNamePortOfContextId:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    uint64_t v4 = CA::WindowServer::Server::retain_context((os_unfair_lock_s *)impl->var1, a3);
    if (v4)
    {
      double v5 = (atomic_uint *)v4;
      mach_port_name_t tn = *(_DWORD *)(v4 + 252);
      if (!tn)
      {
        mach_port_name_t v6 = *MEMORY[0x1E4F14960];
        pid_t v7 = getpid();
        task_name_for_pid(v6, v7, &tn);
      }
      if (atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
      }
      LODWORD(v4) = tn;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  return v4;
}

- (unsigned)clientPortOfContextId:(unsigned int)a3
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  uint64_t v4 = (atomic_uint *)CA::WindowServer::Server::retain_context((os_unfair_lock_s *)impl->var1, a3);
  if (!v4) {
    return 0;
  }
  unsigned int v5 = v4[65];
  if (!v5) {
    unsigned int v5 = v4[64];
  }
  if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
  }
  return v5;
}

- (unsigned)clientPortAtPosition:(CGPoint)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)float64x2_t v9 = 0u;
  long long v10 = 0u;
  uint64_t var1 = (uint64_t)impl->var1;
  CGPoint v8 = a3;
  CA::WindowServer::Server::hit_test((uint64_t)v9, var1, &v8.x, 0, 0, 0, 0);
  if (!LODWORD(v9[0])) {
    return 0;
  }
  unsigned int v5 = (atomic_uint *)CA::Render::Context::context_by_id((CA::Render::Context *)LODWORD(v9[0]));
  if (!v5) {
    return 0;
  }
  unsigned int v6 = v5[65];
  if (!v6) {
    unsigned int v6 = v5[64];
  }
  if (atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
  }
  return v6;
}

- (unsigned)contextIdAtPosition:(CGPoint)a3 excludingContextIds:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_impl) {
    return 0;
  }
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v8 = [a4 count];
  uint64_t v9 = v8;
  size_t v10 = 4 * v8 + 4;
  if (v8)
  {
    if (v10 > 0x1000)
    {
      long long v11 = (char *)malloc_type_malloc(4 * v8 + 4, 0xF837DF07uLL);
      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
      MEMORY[0x1F4188790](v8);
      long long v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
    }
    uint64_t v13 = 0;
    do
    {
      *(_DWORD *)&v11[4 * v13] = objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v13), "unsignedIntValue");
      ++v13;
    }
    while (v9 != v13);
  }
  else
  {
    long long v11 = 0;
  }
LABEL_10:
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  uint64_t var1 = self->_impl->var1;
  v15[0] = x;
  v15[1] = y;
  CA::WindowServer::Server::hit_test((uint64_t)v16, (uint64_t)var1, v15, (int *)v11, v9, 0, 0);
  if (v10 > 0x1000) {
    free(v11);
  }
  return v16[0];
}

- (unsigned)contextIdAtPosition:(CGPoint)a3
{
  return -[CAWindowServerDisplay contextIdAtPosition:excludingContextIds:](self, "contextIdAtPosition:excludingContextIds:", 0, a3.x, a3.y);
}

- (unsigned)rendererFlags
{
  impl = self->_impl;
  if (impl) {
    return *((_DWORD *)impl->var1 + 46);
  }
  else {
    return 0;
  }
}

- (NSUUID)uuid
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", -[CAWindowServerDisplay uniqueId](self, "uniqueId"));

  return (NSUUID *)v2;
}

- (unint64_t)vendorId
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  (*(void (**)(void *__return_ptr))(**((void **)impl->var1 + 12) + 1368))(v4);
  return v5;
}

- (unint64_t)productId
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  (*(void (**)(void *__return_ptr))(**((void **)impl->var1 + 12) + 1368))(v4);
  return v5;
}

- (void)setSystemIdentifiers:(id)a3
{
  impl = self->_impl;
  if (impl)
  {
    uint64_t v5 = *((void *)impl->var1 + 12);
    id v6 = *(id *)(v5 + 16);
    if (v6 != a3)
    {
      if (v6) {
        CFRelease(v6);
      }
      CopCGFloat y = 0;
      if (a3) {
        CopCGFloat y = CFSetCreateCopy(0, (CFSetRef)a3);
      }
      *(void *)(v5 + 16) = Copy;
    }
  }
}

- (NSSet)systemIdentifiers
{
  impl = self->_impl;
  if (impl) {
    return *(NSSet **)(*((void *)impl->var1 + 12) + 16);
  }
  else {
    return 0;
  }
}

- (NSString)uniqueId
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  memset(v10, 0, sizeof(v10));
  uint64_t v4 = *((void *)self->_impl->var1 + 12);
  if ((*(uint64_t (**)(uint64_t, void, _OWORD *, uint64_t, void, uint64_t, uint64_t, uint64_t))(*(void *)v4 + 800))(v4, 0, v10, 64, 0, v5, v6, v7))uint64_t v8 = (NSString *)[NSString stringWithUTF8String:v10]; {
  else
  }
    uint64_t v8 = 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v8;
}

- (NSString)deviceName
{
  impl = self->_impl;
  if (impl) {
    return *(NSString **)(*((void *)impl->var1 + 12) + 8);
  }
  else {
    return 0;
  }
}

- (NSString)name
{
  impl = self->_impl;
  if (impl) {
    return (NSString *)*((void *)impl->var1 + 13);
  }
  else {
    return 0;
  }
}

- (CGSize)panelPhysicalSize
{
  impl = self->_impl;
  if (impl)
  {
    (*(void (**)(void, SEL))(**((void **)impl->var1 + 12) + 16))(*((void *)impl->var1 + 12), a2);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (unint64_t)maximumSourceRectPixels
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(**((void **)impl->var1 + 12) + 72))();
  }
  else {
    return 2304000;
  }
}

- (unint64_t)maximumSourceRectWidth
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(**((void **)impl->var1 + 12) + 64))();
  }
  else {
    return 1920;
  }
}

- (unint64_t)minimumSourceRectSize
{
  impl = self->_impl;
  if (impl) {
    return (*(uint64_t (**)(void))(**((void **)impl->var1 + 12) + 56))();
  }
  else {
    return 32;
  }
}

- (unint64_t)maxLayerBandwidth
{
  impl = self->_impl;
  if (impl) {
    return (*(unsigned int (**)(void, SEL))(**((void **)impl->var1 + 12) + 40))(*((void *)impl->var1 + 12), a2);
  }
  else {
    return 0;
  }
}

- (double)maximumScale
{
  impl = self->_impl;
  if (!impl) {
    return 1.0;
  }
  (*(void (**)(void))(**((void **)impl->var1 + 12) + 32))();
  return result;
}

- (double)minimumScale
{
  impl = self->_impl;
  if (!impl) {
    return 1.0;
  }
  (*(void (**)(void))(**((void **)impl->var1 + 12) + 24))();
  return result;
}

- (void)setScalePreservesAspect:(BOOL)a3
{
  impl = self->_impl;
  if (impl)
  {
    int v4 = a3;
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    uint64_t v15 = *((void *)var1 + 12);
    if (*(unsigned __int8 *)(v15 + 144) != v4)
    {
      *(unsigned char *)(v15 + 144) = v4;
      CA::WindowServer::Display::update_geometry(v15, v7, v8, v9, v10, v11, v12, v13, v14);
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (BOOL)scalePreservesAspect
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  BOOL v4 = *(unsigned char *)(*((void *)self->_impl->var1 + 12) + 144) != 0;
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (void)setScales:(CGSize)a3
{
  impl = self->_impl;
  if (impl)
  {
    double height = a3.height;
    double width = a3.width;
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_scale((CA::WindowServer::Server *)self->_impl->var1, width, height);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (CGSize)scales
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t v4 = *((void *)self->_impl->var1 + 12);
    double v5 = *(double *)(v4 + 128);
    double v6 = *(double *)(v4 + 136);
    pthread_mutex_unlock(&impl->var0._m);
  }
  else
  {
    double v5 = 1.0;
    double v6 = 1.0;
  }
  double v7 = v5;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setScale:(double)a3
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    CA::WindowServer::Server::set_scale((CA::WindowServer::Server *)self->_impl->var1, a3, a3);
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (double)scale
{
  impl = self->_impl;
  if (!impl) {
    return 1.0;
  }
  pthread_mutex_lock(&self->_impl->var0._m);
  double v4 = *(double *)(*((void *)self->_impl->var1 + 12) + 128);
  pthread_mutex_unlock(&impl->var0._m);
  return v4;
}

- (CGSize)touchScales
{
  impl = self->_impl;
  if (impl)
  {
    uint64_t v3 = *((void *)impl->var1 + 12);
    double v4 = *(double *)(v3 + 112);
    double v5 = *(double *)(v3 + 120);
  }
  else
  {
    double v4 = 1.0;
    double v5 = 1.0;
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)nativeSize
{
  impl = self->_impl;
  if (impl)
  {
    uint64_t v3 = *((void *)impl->var1 + 12);
    if (((*(unsigned __int16 *)(v3 + 656) >> 10) & 3 | 4) == 4)
    {
      double v4 = (int *)(v3 + 88);
    }
    else
    {
      double v4 = (int *)(v3 + 80);
      if (!*(_DWORD *)(v3 + 80) || !*(_DWORD *)(v3 + 84)) {
        double v4 = (int *)(v3 + 72);
      }
    }
    double v5 = (double)*v4;
    double v6 = (double)v4[1];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGRect)bounds
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t v6 = *((void *)self->_impl->var1 + 12);
    int v7 = *(_DWORD *)(v6 + 176);
    int v8 = *(_DWORD *)(v6 + 180);
    if (v7 <= v8) {
      int v9 = *(_DWORD *)(v6 + 180);
    }
    else {
      int v9 = *(_DWORD *)(v6 + 176);
    }
    v4.i32[0] = 1073741822;
    v5.i32[0] = v9;
    int8x16_t v10 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v5, v4), 0);
    uint64_t v11 = *(void *)(v6 + 168);
    v12.i64[0] = (int)v11;
    v12.i64[1] = SHIDWORD(v11);
    int8x16_t v19 = vbslq_s8(v10, (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v12));
    if (v9 <= 1073741822) {
      double v13 = (double)v7;
    }
    else {
      double v13 = 1.79769313e308;
    }
    if (v9 <= 1073741822) {
      double v14 = (double)v8;
    }
    else {
      double v14 = 1.79769313e308;
    }
    pthread_mutex_unlock(&impl->var0._m);
    int8x16_t v15 = v19;
  }
  else
  {
    int8x16_t v15 = *(int8x16_t *)MEMORY[0x1E4F1DB20];
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v16 = *(double *)&v15.i64[1];
  double v17 = v13;
  double v18 = v14;
  result.origin.CGFloat x = *(double *)v15.i64;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.CGFloat y = v16;
  return result;
}

- (void)update
{
  impl = self->_impl;
  if (impl)
  {
    pthread_mutex_lock(&self->_impl->var0._m);
    uint64_t var1 = self->_impl->var1;
    pthread_mutex_lock((pthread_mutex_t *)((char *)var1 + 24));
    CA::WindowServer::Server::update_display_modes_locked((CA::WindowServer::Server *)var1);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)var1 + 24));
    pthread_mutex_unlock(&impl->var0._m);
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  impl = self->_impl;
  if (impl)
  {
    destroy_impl(impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAWindowServerDisplay;
  [(CAWindowServerDisplay *)&v4 dealloc];
}

- (void)invalidate
{
  impl = self->_impl;
  if (impl)
  {
    destroy_impl(impl);
    self->_impl = 0;
  }
}

- (id)_initWithCADisplayServer:(void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CAWindowServerDisplay;
  objc_super v4 = [(CAWindowServerDisplay *)&v9 init];
  if (v4)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    uint64_t v6 = (pthread_mutex_t *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD8uLL, 0x743898A5uLL);
    v4->_impl = (CAWindowServerDisplayImpl *)v6;
    x_thread_init_mutex(v6, 1);
    v4->_impl->uint64_t var1 = (Server *)a3;
    if (CADeviceSupportsAPT::once[0] != -1) {
      dispatch_once(CADeviceSupportsAPT::once, &__block_literal_global_52);
    }
    if (CADeviceSupportsAPT::supports_apt && (*(_DWORD *)(*((void *)a3 + 12) + 624) & 0x10) != 0)
    {
      [(CAWindowServerDisplay *)v4 powerStateDidChange:0];
      int v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:v4 selector:sel_powerStateDidChange_ name:*MEMORY[0x1E4F287E8] object:0];
    }
  }
  return v4;
}

@end