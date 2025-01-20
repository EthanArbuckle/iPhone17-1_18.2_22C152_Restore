@interface AVCaptureDeviceInput
+ (AVCaptureDeviceInput)deviceInputWithDevice:(AVCaptureDevice *)device error:(NSError *)outError;
+ (void)initialize;
- (AVCaptureDevice)device;
- (AVCaptureDeviceInput)init;
- (AVCaptureDeviceInput)initWithDevice:(AVCaptureDevice *)device error:(NSError *)outError;
- (BOOL)_authorizedToUseDeviceAndRequestIfNecessary:(id)a3;
- (BOOL)isAudioCaptureModeSupported:(int64_t)a3;
- (BOOL)isBackgroundBlurAllowed;
- (BOOL)isBackgroundReplacementAllowed;
- (BOOL)isBuiltInMicrophoneStereoAudioCaptureEnabled;
- (BOOL)isBuiltInMicrophoneStereoAudioCaptureSupported;
- (BOOL)isCameraCalibrationDataDeliveryEnabled;
- (BOOL)isCenterStageAllowed;
- (BOOL)isMaxGainOverrideSupported;
- (BOOL)isMultichannelAudioModeSupported:(int64_t)a3;
- (BOOL)isStudioLightingAllowed;
- (BOOL)isVisionDataDeliveryEnabled;
- (BOOL)isWindNoiseRemovalEnabled;
- (BOOL)isWindNoiseRemovalSupported;
- (BOOL)reactionEffectsAllowed;
- (BOOL)unifiedAutoExposureDefaultsEnabled;
- (CMTime)videoMinFrameDurationOverride;
- (NSArray)portsWithMediaType:(AVMediaType)mediaType sourceDeviceType:(AVCaptureDeviceType)sourceDeviceType sourceDevicePosition:(AVCaptureDevicePosition)sourceDevicePosition;
- (OpaqueCMClock)clock;
- (float)maxGainOverride;
- (float)portraitLightingEffectStrength;
- (float)simulatedAperture;
- (id)description;
- (id)multiCamPorts;
- (id)notReadyError;
- (id)ports;
- (id)videoDevice;
- (int64_t)_audioCaptureModeForMultichannelAudioMode:(int64_t)a3;
- (int64_t)audioCaptureMode;
- (int64_t)multichannelAudioMode;
- (void)_applyVideoMinFrameDurationOverride;
- (void)_bumpChangeSeedForFirstPortWithMediaType:(id)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_resetPortraitLightingEffectStrength;
- (void)_resetSimulatedAperture;
- (void)_resetVideoMinFrameDurationOverride;
- (void)_sourceFormatDidChange:(opaqueCMFormatDescription *)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAudioCaptureMode:(int64_t)a3;
- (void)setBackgroundBlurAllowed:(BOOL)a3;
- (void)setBackgroundReplacementAllowed:(BOOL)a3;
- (void)setBuiltInMicrophoneStereoAudioCaptureEnabled:(BOOL)a3;
- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)a3;
- (void)setCenterStageAllowed:(BOOL)a3;
- (void)setMaxGainOverride:(float)a3;
- (void)setMultichannelAudioMode:(int64_t)a3;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setReactionEffectsAllowed:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSimulatedAperture:(float)a3;
- (void)setStudioLightingAllowed:(BOOL)a3;
- (void)setUnifiedAutoExposureDefaultsEnabled:(BOOL)unifiedAutoExposureDefaultsEnabled;
- (void)setVideoMinFrameDurationOverride:(CMTime *)videoMinFrameDurationOverride;
- (void)setVisionDataDeliveryEnabled:(BOOL)a3;
- (void)setWindNoiseRemovalEnabled:(BOOL)a3;
@end

@implementation AVCaptureDeviceInput

- (OpaqueCMClock)clock
{
  v2 = [(AVCaptureDeviceInput *)self device];

  return [(AVCaptureDevice *)v2 deviceClock];
}

- (AVCaptureDevice)device
{
  return self->_internal->device;
}

- (BOOL)reactionEffectsAllowed
{
  return self->_internal->reactionEffectsAllowed;
}

- (BOOL)isStudioLightingAllowed
{
  return self->_internal->studioLightingAllowed;
}

- (CMTime)videoMinFrameDurationOverride
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->epoch + 64);
  return self;
}

- (BOOL)unifiedAutoExposureDefaultsEnabled
{
  return self->_internal->unifiedAutoExposureDefaultsEnabled;
}

- (float)maxGainOverride
{
  return self->_internal->maxGainOverride;
}

- (BOOL)isBackgroundBlurAllowed
{
  return self->_internal->backgroundBlurAllowed;
}

- (BOOL)isBackgroundReplacementAllowed
{
  return self->_internal->backgroundReplacementAllowed;
}

- (BOOL)isCenterStageAllowed
{
  return self->_internal->centerStageAllowed;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(-[AVCaptureDeviceInput ports](self, "ports"), "firstObject"), "sourceID");
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", v7)&& objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E4F518C0]))
  {
    uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516E0]];
    [(AVCaptureDeviceInput *)self _sourceFormatDidChange:v8];
  }
}

- (void)_sourceFormatDidChange:(opaqueCMFormatDescription *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3) {
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(a3);
  }
  else {
    CMMediaType MediaType = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(AVCaptureDeviceInput *)self multiCamPorts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x1E4F47C68];
    uint64_t v11 = *MEMORY[0x1E4F47C40];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v14 = objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqual:", v10);
        if (a3)
        {
          if (MediaType == 1986618469) {
            char v15 = v14;
          }
          else {
            char v15 = 0;
          }
          if ((v15 & 1) != 0
            || (objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqual:", v11)
              ? (BOOL v16 = MediaType == 1936684398)
              : (BOOL v16 = 0),
                v16))
          {
            v17 = v13;
            v18 = a3;
LABEL_23:
            [v17 _setFormatDescription:v18];
            continue;
          }
        }
        else if ((v14 & 1) != 0 || objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqual:", v11))
        {
          v17 = v13;
          v18 = 0;
          goto LABEL_23;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (id)ports
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 16;
  if (!self->_internal->ports)
  {
    v4 = [(AVCaptureDeviceInput *)self device];
    if (!v4)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1C978]);
LABEL_25:
      (*(void **)((char *)&self->super.super.isa + v3))[2] = v13;
      return (id)(*(void **)((char *)&self->super.super.isa + v3))[2];
    }
    v5 = v4;
    id v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v7 = [(AVCaptureDevice *)v5 deviceType];
    uint64_t v8 = [(AVCaptureDevice *)v5 position];
    if ([(__CFString *)v7 isEqual:@"AVCaptureDeviceTypeMicrophone"])
    {
      uint64_t v9 = (__CFString *)*MEMORY[0x1E4F47C40];
      uint64_t v10 = self;
      uint64_t v11 = @"AVCaptureDeviceTypeMicrophone";
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F47C68];
      if ([(AVCaptureDevice *)v5 hasMediaType:*MEMORY[0x1E4F47C68]]) {
        objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v14, 0, 1, v7, v8));
      }
      uint64_t v23 = 16;
      v25 = v5;
      if ([(AVCaptureDevice *)v5 hasMediaType:AVMediaTypeForMetadataObjects()]) {
        objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, AVMediaTypeForMetadataObjects(), 0, 1, v7, v8));
      }
      if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
      {
        uint64_t v15 = *MEMORY[0x1E4F47C50];
        if ([(AVCaptureDevice *)v5 hasMediaType:*MEMORY[0x1E4F47C50]])
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v16 = [(AVCaptureDevice *)v5 availableBoxedMetadataFormatDescriptions];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v16);
                }
                objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v15, *(void *)(*((void *)&v26 + 1) + 8 * i), 1, v7, v8, v23));
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
            }
            while (v18);
          }
        }
      }
      uint64_t v21 = *MEMORY[0x1E4F47C48];
      if (-[AVCaptureDevice hasMediaType:](v25, "hasMediaType:", *MEMORY[0x1E4F47C48], v23)) {
        objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v21, 0, 1, v7, v8));
      }
      uint64_t v3 = v24;
      if (![(AVCaptureDevice *)v25 hasMediaType:@"pcld"]) {
        goto LABEL_24;
      }
      uint64_t v10 = self;
      uint64_t v9 = @"pcld";
      uint64_t v11 = v7;
      uint64_t v12 = v8;
    }
    objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", v10, v9, 0, 1, v11, v12));
LABEL_24:
    id v13 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
    goto LABEL_25;
  }
  return (id)(*(void **)((char *)&self->super.super.isa + v3))[2];
}

- (id)multiCamPorts
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id result = self->_internal->multiCamPorts;
  if (!result)
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[AVCaptureDeviceInput ports](self, "ports"));
    int BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCaptureSessionSupportsMultiCamCapture");
    v5 = [(AVCaptureDeviceInput *)self device];
    if (BoolAnswer) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      uint64_t v7 = v5;
      uint64_t v8 = [(AVCaptureDevice *)v5 deviceType];
      if ([(NSString *)v8 isEqual:@"AVCaptureDeviceTypeMicrophone"])
      {
        uint64_t v9 = *MEMORY[0x1E4F47C40];
        objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, *MEMORY[0x1E4F47C40], 0, 1, v8, 1));
        objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v9, 0, 1, v8, 2));
      }
      else
      {
        obj = [(AVCaptureDevice *)v7 constituentDevices];
        if ([(NSArray *)obj count] >= 2)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v20)
          {
            uint64_t v19 = *(void *)v30;
            uint64_t v21 = *MEMORY[0x1E4F47C68];
            uint64_t v10 = *MEMORY[0x1E4F47C50];
            long long v22 = v7;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v30 != v19) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
                if ([v12 hasMediaType:v21]) {
                  objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v21, 0, 1, objc_msgSend(v12, "deviceType"), objc_msgSend(v12, "position")));
                }
                uint64_t v23 = v11;
                if ([(AVCaptureDevice *)v7 hasMediaType:AVMediaTypeForMetadataObjects()]) {
                  objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, AVMediaTypeForMetadataObjects(), 0, 1, objc_msgSend(v12, "deviceType"), objc_msgSend(v12, "position")));
                }
                if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
                {
                  if ([(AVCaptureDevice *)v22 hasMediaType:v10])
                  {
                    long long v27 = 0u;
                    long long v28 = 0u;
                    long long v25 = 0u;
                    long long v26 = 0u;
                    id v13 = [(AVCaptureDevice *)v22 availableBoxedMetadataFormatDescriptions];
                    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
                    if (v14)
                    {
                      uint64_t v15 = v14;
                      uint64_t v16 = *(void *)v26;
                      do
                      {
                        for (uint64_t i = 0; i != v15; ++i)
                        {
                          if (*(void *)v26 != v16) {
                            objc_enumerationMutation(v13);
                          }
                          objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v10, *(void *)(*((void *)&v25 + 1) + 8 * i), 1, objc_msgSend(v12, "deviceType"), objc_msgSend(v12, "position")));
                        }
                        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
                      }
                      while (v15);
                    }
                  }
                }
                uint64_t v7 = v22;
                ++v11;
              }
              while (v23 + 1 != v20);
              uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
            }
            while (v20);
          }
        }
      }
    }
    self->_internal->multiCamPorts = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v24];
    return self->_internal->multiCamPorts;
  }
  return result;
}

- (float)simulatedAperture
{
  return self->_internal->simulatedAperture;
}

- (float)portraitLightingEffectStrength
{
  return self->_internal->portraitLightingEffectStrength;
}

- (BOOL)isWindNoiseRemovalEnabled
{
  return self->_internal->windNoiseRemovalEnabled;
}

- (int64_t)audioCaptureMode
{
  return SLODWORD(self->_internal->audioCaptureMode);
}

- (void)_applyVideoMinFrameDurationOverride
{
  [[(AVCaptureDeviceInput *)self device] lockForConfiguration:0];
  uint64_t v3 = [(AVCaptureDeviceInput *)self device];
  $95D729B680665BEAEFA1D6FCA8238556 videoMinFrameDurationOverride = self->_internal->videoMinFrameDurationOverride;
  [(AVCaptureDevice *)v3 setVideoMinFrameDurationOverride:&videoMinFrameDurationOverride forOwner:self];
  [[(AVCaptureDeviceInput *)self device] unlockForConfiguration];
}

- (void)setVideoMinFrameDurationOverride:(CMTime *)videoMinFrameDurationOverride
{
  CMTime time1 = (CMTime)self->_internal->videoMinFrameDurationOverride;
  CMTime v7 = *videoMinFrameDurationOverride;
  if (CMTimeCompare(&time1, &v7))
  {
    internal = self->_internal;
    long long v6 = *(_OWORD *)&videoMinFrameDurationOverride->value;
    internal->videoMinFrameDurationOverride.epoch = videoMinFrameDurationOverride->epoch;
    *(_OWORD *)&internal->videoMinFrameDurationOverride.value = v6;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
    if (objc_msgSend(-[AVCaptureInput session](self, "session"), "isRunning")) {
      [(AVCaptureDeviceInput *)self _applyVideoMinFrameDurationOverride];
    }
  }
}

- (void)setSession:(id)a3
{
  if ([(AVCaptureInput *)self session])
  {
    id v5 = [(AVCaptureInput *)self session];
    [v5 removeObserver:self forKeyPath:@"running" context:AVCaptureSessionRunningChangedContext];
  }
  if (a3) {
    [a3 addObserver:self forKeyPath:@"running" options:3 context:AVCaptureSessionRunningChangedContext];
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDeviceInput;
  [(AVCaptureInput *)&v6 setSession:a3];
}

- (id)videoDevice
{
  uint64_t v3 = [(AVCaptureDeviceInput *)self device];
  if (![(AVCaptureDevice *)v3 hasMediaType:*MEMORY[0x1E4F47C68]])
  {
    v4 = [(AVCaptureDeviceInput *)self device];
    if (![(AVCaptureDevice *)v4 hasMediaType:*MEMORY[0x1E4F47C58]]) {
      return 0;
    }
  }

  return [(AVCaptureDeviceInput *)self device];
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  [(AVCaptureDeviceInput *)self _resetSimulatedAperture];
  [(AVCaptureDeviceInput *)self _resetPortraitLightingEffectStrength];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureDeviceInput;
  [(AVCaptureInput *)&v7 handleChangedActiveFormat:a3 forDevice:a4];
}

- (void)_resetSimulatedAperture
{
  internal = self->_internal;
  device = internal->device;
  float simulatedAperture = internal->simulatedAperture;
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] minSimulatedAperture];
  float v7 = v6;
  uint64_t v8 = [(AVCaptureDevice *)device activeFormat];
  if (v7 <= 0.0)
  {
    [(AVCaptureDeviceFormat *)v8 defaultSimulatedAperture];
    float v10 = 0.0;
    if (v12 <= 0.0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(AVCaptureDeviceFormat *)v8 minSimulatedAperture];
  if (simulatedAperture < v9
    || ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] maxSimulatedAperture], float v10 = simulatedAperture, simulatedAperture > v11))
  {
LABEL_6:
    [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] defaultSimulatedAperture];
    float v10 = v13;
  }
LABEL_7:
  if (simulatedAperture != v10)
  {
    [(AVCaptureDeviceInput *)self willChangeValueForKey:@"simulatedAperture"];
    self->_internal->float simulatedAperture = v10;
    [(AVCaptureDeviceInput *)self didChangeValueForKey:@"simulatedAperture"];
  }
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] minPortraitLightingEffectStrength];
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] minPortraitLightingEffectStrength];
  if (v5 <= a3
    && ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] maxPortraitLightingEffectStrength], v6 >= a3))
  {
    if (self->_internal->portraitLightingEffectStrength != a3)
    {
      [(AVCaptureDeviceInput *)self willChangeValueForKey:@"portraitLightingEffectStrength"];
      self->_internal->portraitLightingEffectStrength = a3;
      [(AVCaptureDeviceInput *)self didChangeValueForKey:@"portraitLightingEffectStrength"];
    }
  }
  else
  {
    float v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (void)_resetPortraitLightingEffectStrength
{
  internal = self->_internal;
  device = internal->device;
  float portraitLightingEffectStrength = internal->portraitLightingEffectStrength;
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] minPortraitLightingEffectStrength];
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] minPortraitLightingEffectStrength];
  if (portraitLightingEffectStrength < v6
    || ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] maxPortraitLightingEffectStrength], float v7 = portraitLightingEffectStrength, portraitLightingEffectStrength > v8))
  {
    [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] defaultPortraitLightingEffectStrength];
    float v7 = v9;
  }
  if (portraitLightingEffectStrength != v7)
  {
    [(AVCaptureDeviceInput *)self willChangeValueForKey:@"portraitLightingEffectStrength"];
    self->_internal->float portraitLightingEffectStrength = v7;
    [(AVCaptureDeviceInput *)self didChangeValueForKey:@"portraitLightingEffectStrength"];
  }
}

- (BOOL)isWindNoiseRemovalSupported
{
  return [(AVCaptureDevice *)self->_internal->device isWindNoiseRemovalSupported];
}

+ (void)initialize
{
}

- (void)_bumpChangeSeedForFirstPortWithMediaType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AVCaptureDeviceInput *)self ports];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        float v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "mediaType"), "isEqual:", a3))
        {
          [v9 bumpChangeSeed];
          return;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureSessionRunningChangedContext == a6)
  {
    int v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4), "BOOLValue");
    int v9 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if (v8 != v9)
    {
      if (v9)
      {
        [(AVCaptureDeviceInput *)self _applyVideoMinFrameDurationOverride];
      }
      else
      {
        [(AVCaptureDeviceInput *)self _resetVideoMinFrameDurationOverride];
      }
    }
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p [%@]>", NSStringFromClass(v4), self, -[AVCaptureDevice localizedName](-[AVCaptureDeviceInput device](self, "device"), "localizedName")];
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, di_notificationHandler, *MEMORY[0x1E4F518C0], a3, 0);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDeviceInput;
  [(AVCaptureInput *)&v5 attachSafelyToFigCaptureSession:a3];
}

- (void)setAudioCaptureMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    if (-[AVCaptureDeviceInput isAudioCaptureModeSupported:](self, "isAudioCaptureModeSupported:"))
    {
      internal = self->_internal;
      if (internal->audioCaptureMode != a3)
      {
        internal->audioCaptureMode = a3;
        uint64_t v6 = *MEMORY[0x1E4F47C40];
        [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:v6];
      }
      return;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  }
  int v9 = (void *)[v7 exceptionWithName:v8 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v9);
  }
  NSLog(&cfstr_SuppressingExc.isa, v9);
}

- (BOOL)isAudioCaptureModeSupported:(int64_t)a3
{
  return [(AVCaptureDevice *)self->_internal->device isAudioCaptureModeSupported:a3];
}

- (void)setCenterStageAllowed:(BOOL)a3
{
  internal = self->_internal;
  if (internal->centerStageAllowed != a3)
  {
    internal->centerStageAllowed = a3;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
  }
}

- (void)setBackgroundBlurAllowed:(BOOL)a3
{
  internal = self->_internal;
  if (internal->backgroundBlurAllowed != a3)
  {
    internal->backgroundBlurAllowed = a3;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
  }
}

+ (AVCaptureDeviceInput)deviceInputWithDevice:(AVCaptureDevice *)device error:(NSError *)outError
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDevice:device error:outError];

  return (AVCaptureDeviceInput *)v4;
}

- (AVCaptureDeviceInput)initWithDevice:(AVCaptureDevice *)device error:(NSError *)outError
{
  v20[20] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AVCaptureDeviceInput;
  uint64_t v6 = [(AVCaptureInput *)&v18 initSubclass];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVCaptureDeviceInputInternal);
    v6->_internal = v7;
    if (v7)
    {
      if (device)
      {
        if ([(AVCaptureDeviceInput *)v6 _authorizedToUseDeviceAndRequestIfNecessary:device])
        {
          uint64_t v8 = device;
          v6->_internal->device = device;
          v6->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v6];
          int v9 = (void *)[MEMORY[0x1E4F47DC0] sharedKVODispatcher];
          v6->_internal->deviceOpenCallbackInvoker = (AVCallbackCancellation *)(id)objc_msgSend(v9, "startObservingValueAtKeyPath:ofObject:options:usingBlock:", @"open", device, 0, objc_msgSend(MEMORY[0x1E4F47DD8], "observationBlockForWeakObserver:passedToBlock:", v6, &__block_literal_global_7));
          [(AVCaptureDeviceInput *)v6 willChangeValueForKey:@"notReadyError"];
          v6->_internal->ready = 1;
          [(AVCaptureDeviceInput *)v6 didChangeValueForKey:@"notReadyError"];
          [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] defaultSimulatedAperture];
          v6->_internal->float simulatedAperture = v10;
          internal = v6->_internal;
          long long v12 = (_OWORD *)MEMORY[0x1E4F1F9F8];
          internal->videoMinFrameDurationOverride.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          *(_OWORD *)&internal->videoMinFrameDurationOverride.value = *v12;
          [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)device activeFormat] defaultPortraitLightingEffectStrength];
          v6->_internal->float portraitLightingEffectStrength = v13;
          v6->_internal->centerStageAllowed = 1;
          v6->_internal->backgroundBlurAllowed = 1;
          v6->_internal->studioLightingAllowed = 1;
          v6->_internal->reactionEffectsAllowed = 1;
          v6->_internal->backgroundReplacementAllowed = 1;
          goto LABEL_6;
        }

        uint64_t v19 = *MEMORY[0x1E4F47B70];
        v20[0] = device;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        uint64_t v14 = (NSError *)AVLocalizedError();
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      }
      else
      {

        uint64_t v14 = (NSError *)AVLocalizedError();
        uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (outError)
      {
        uint64_t v6 = 0;
        *outError = v14;
        return v6;
      }
    }
    else
    {
    }
    return 0;
  }
LABEL_6:
  if (outError) {
    *outError = 0;
  }
  return v6;
}

- (BOOL)_authorizedToUseDeviceAndRequestIfNecessary:(id)a3
{
  id v4 = (__CFString *)*MEMORY[0x1E4F47C40];
  if ([a3 hasMediaType:*MEMORY[0x1E4F47C40]])
  {
    [MEMORY[0x1E4F153E0] sharedInstance];
  }
  else
  {
    id v4 = (__CFString *)*MEMORY[0x1E4F47C68];
    if (([a3 hasMediaType:*MEMORY[0x1E4F47C68]] & 1) == 0)
    {
      id v4 = @"pcld";
      if (([a3 hasMediaType:@"pcld"] & 1) == 0)
      {
        id v4 = (__CFString *)*MEMORY[0x1E4F47C58];
        int v5 = [a3 hasMediaType:*MEMORY[0x1E4F47C58]];
        if (!v5) {
          return v5;
        }
      }
    }
  }
  AVAuthorizationStatus v6 = +[AVCaptureDevice authorizationStatusForMediaType:v4];
  if (v6 != AVAuthorizationStatusAuthorized)
  {
    if (v6)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    +[AVCaptureDevice requestAccessForMediaType:v4 completionHandler:&__block_literal_global_90];
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)setSimulatedAperture:(float)a3
{
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] minSimulatedAperture];
  if (v5 <= 0.0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_6;
  }
  [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] minSimulatedAperture];
  if (v6 > a3
    || ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] maxSimulatedAperture], v7 < a3))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C4A8];
LABEL_6:
    float v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
    return;
  }
  if (self->_internal->simulatedAperture != a3)
  {
    [(AVCaptureDeviceInput *)self willChangeValueForKey:@"simulatedAperture"];
    self->_internal->float simulatedAperture = a3;
    [(AVCaptureDeviceInput *)self didChangeValueForKey:@"simulatedAperture"];
  }
}

uint64_t __45__AVCaptureDeviceInput_initWithDevice_error___block_invoke(uint64_t a1, void *a2)
{
  [a2 willChangeValueForKey:@"notReadyError"];

  return [a2 didChangeValueForKey:@"notReadyError"];
}

- (AVCaptureDeviceInput)init
{
  return [(AVCaptureDeviceInput *)self initWithDevice:0 error:0];
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    if (internal->device)
    {
      [(NSArray *)internal->ports makeObjectsPerformSelector:sel_setOwner_ withObject:0];
      [(NSArray *)self->_internal->ports makeObjectsPerformSelector:sel__setClock_ withObject:0];
      internal = self->_internal;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeviceInput;
  [(AVCaptureInput *)&v4 dealloc];
}

- (void)setUnifiedAutoExposureDefaultsEnabled:(BOOL)unifiedAutoExposureDefaultsEnabled
{
  internal = self->_internal;
  if (internal->unifiedAutoExposureDefaultsEnabled != unifiedAutoExposureDefaultsEnabled)
  {
    internal->unifiedAutoExposureDefaultsEnabled = unifiedAutoExposureDefaultsEnabled;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
  }
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, di_notificationHandler, *MEMORY[0x1E4F518C0], a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  uint64_t v9 = __58__AVCaptureDeviceInput_detachSafelyFromFigCaptureSession___block_invoke;
  float v10 = &unk_1E5A72ED0;
  long long v11 = self;
  if (objc_msgSend(-[AVCaptureInput session](self, "session"), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], block);
    float v6 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v6);
  }
  else
  {
    v9((uint64_t)block);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureDeviceInput;
  [(AVCaptureInput *)&v7 detachSafelyFromFigCaptureSession:a3];
}

uint64_t __58__AVCaptureDeviceInput_detachSafelyFromFigCaptureSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sourceFormatDidChange:0];
}

- (id)notReadyError
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_internal->ready) {
    return 0;
  }
  objc_super v4 = [(AVCaptureDeviceInput *)self device];
  if ([(AVCaptureDevice *)v4 isConnected])
  {
    if (objc_msgSend(-[AVCaptureInput session](self, "session"), "isRunning")) {
      NSLog(&cfstr_Avcapturedevic_12.isa, [(AVCaptureDevice *)v4 description]);
    }
    return (id)AVLocalizedError();
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F47B70];
    v6[0] = v4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    return (id)AVLocalizedError();
  }
}

- (NSArray)portsWithMediaType:(AVMediaType)mediaType sourceDeviceType:(AVCaptureDeviceType)sourceDeviceType sourceDevicePosition:(AVCaptureDevicePosition)sourceDevicePosition
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [(AVCaptureDeviceInput *)self multiCamPorts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    uint64_t v13 = *MEMORY[0x1E4F47C40];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
        if ((!mediaType
           || objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v14), "mediaType"), "isEqual:", mediaType))&& (!sourceDeviceType|| objc_msgSend((id)objc_msgSend(v15, "sourceDeviceType"), "isEqual:", sourceDeviceType)))
        {
          char v16 = [(NSString *)mediaType isEqual:v13];
          AVCaptureDevicePosition v17 = sourceDevicePosition;
          if (sourceDevicePosition == AVCaptureDevicePositionUnspecified)
          {
            AVCaptureDevicePosition v17 = AVCaptureDevicePositionUnspecified;
            if ((v16 & 1) == 0) {
              AVCaptureDevicePosition v17 = [v15 sourceDevicePosition];
            }
          }
          if ([v15 sourceDevicePosition] == v17) {
            [v19 addObject:v15];
          }
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:v19];
}

- (void)_resetVideoMinFrameDurationOverride
{
  [[(AVCaptureDeviceInput *)self device] lockForConfiguration:0];
  [[(AVCaptureDeviceInput *)self device] resetVideoMinFrameDurationOverrideForOwner:self];
  uint64_t v3 = [(AVCaptureDeviceInput *)self device];

  [(AVCaptureDevice *)v3 unlockForConfiguration];
}

- (BOOL)isMaxGainOverrideSupported
{
  return [(AVCaptureDevice *)self->_internal->device deviceType] == (AVCaptureDeviceType)@"AVCaptureDeviceTypeBuiltInUltraWideCamera";
}

- (void)setMaxGainOverride:(float)a3
{
  if ([(AVCaptureDeviceInput *)self isMaxGainOverrideSupported])
  {
    if (a3 == 0.0 || (a3 >= 1.0 ? (BOOL v5 = a3 > 256.0) : (BOOL v5 = 1), !v5))
    {
      internal = self->_internal;
      if (internal->maxGainOverride != a3)
      {
        internal->maxGainOverride = a3;
        uint64_t v10 = *MEMORY[0x1E4F47C68];
        [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:v10];
      }
      return;
    }
    float v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    float v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  }
  uint64_t v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (BOOL)isBuiltInMicrophoneStereoAudioCaptureSupported
{
  return [(AVCaptureDeviceInput *)self isAudioCaptureModeSupported:1];
}

- (BOOL)isBuiltInMicrophoneStereoAudioCaptureEnabled
{
  return [(AVCaptureDeviceInput *)self audioCaptureMode] == 1;
}

- (void)setBuiltInMicrophoneStereoAudioCaptureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCaptureDeviceInput *)self isBuiltInMicrophoneStereoAudioCaptureSupported])
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else
  {
    [(AVCaptureDeviceInput *)self setAudioCaptureMode:v3];
  }
}

- (BOOL)isMultichannelAudioModeSupported:(int64_t)a3
{
  if ((unint64_t)a3 > 2
    || [(AVCaptureInput *)self session]
    && (objc_msgSend(-[AVCaptureInput session](self, "session"), "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    return 0;
  }
  int64_t v5 = [(AVCaptureDeviceInput *)self _audioCaptureModeForMultichannelAudioMode:a3];
  device = self->_internal->device;

  return [(AVCaptureDevice *)device isAudioCaptureModeSupported:v5];
}

- (int64_t)multichannelAudioMode
{
  return self->_internal->multichannelAudioMode;
}

- (void)setMultichannelAudioMode:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 3)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
LABEL_16:
    uint64_t v14 = (void *)[v12 exceptionWithName:v13 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return;
  }
  if (!-[AVCaptureDeviceInput isMultichannelAudioModeSupported:](self, "isMultichannelAudioModeSupported:"))
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_16;
  }
  internal = self->_internal;
  if (internal->multichannelAudioMode != a3)
  {
    internal->multichannelAudioMode = a3;
    [(AVCaptureDeviceInput *)self setAudioCaptureMode:[(AVCaptureDeviceInput *)self _audioCaptureModeForMultichannelAudioMode:self->_internal->multichannelAudioMode]];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  float v6 = objc_msgSend(-[AVCaptureInput session](self, "session"), "outputs");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v15 = (void *)[v11 connections];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v21 != v18) {
                  objc_enumerationMutation(v15);
                }
                [*(id *)(*((void *)&v20 + 1) + 8 * j) _setActive:0];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v17);
          }
          return;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
}

- (int64_t)_audioCaptureModeForMultichannelAudioMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (void)setWindNoiseRemovalEnabled:(BOOL)a3
{
  if ([(AVCaptureDeviceInput *)self isWindNoiseRemovalSupported])
  {
    self->_internal->windNoiseRemovalEnabled = a3;
  }
  else
  {
    int64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (BOOL)isVisionDataDeliveryEnabled
{
  return self->_internal->visionDataDeliveryEnabled;
}

- (void)setVisionDataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] isVisionDataDeliverySupported])
  {
    internal = self->_internal;
    if (internal->visionDataDeliveryEnabled == v3) {
      return;
    }
    internal->visionDataDeliveryEnabled = v3;
    if (!self->_internal->ports) {
      [(AVCaptureDeviceInput *)self ports];
    }
    float v6 = self->_internal;
    ports = v6->ports;
    if (v3)
    {
      if ([(NSArray *)[(AVCaptureDevice *)v6->device constituentDevices] count] < 2) {
        uint64_t v7 = [(AVCaptureDevice *)self->_internal->device deviceType];
      }
      else {
        uint64_t v7 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
      }
      uint64_t v9 = [(NSArray *)ports arrayByAddingObject:+[AVCaptureInputPort portWithInput:self mediaType:@"visn" formatDescription:0 enabled:1 sourceDeviceType:v7 sourceDevicePosition:[(AVCaptureDevice *)self->_internal->device position]]];
    }
    else
    {
      if ((__CFString *)objc_msgSend(-[NSArray lastObject](v6->ports, "lastObject"), "mediaType") != @"visn") {
        return;
      }
      uint64_t v9 = -[NSArray subarrayWithRange:](ports, "subarrayWithRange:", 0, [(NSArray *)ports count] - 1);
    }
    self->_internal->ports = v9;
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (BOOL)isCameraCalibrationDataDeliveryEnabled
{
  return self->_internal->cameraCalibrationDataDeliveryEnabled;
}

- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->device activeFormat] isCameraCalibrationDataDeliverySupported])
  {
    internal = self->_internal;
    if (internal->cameraCalibrationDataDeliveryEnabled != v3)
    {
      internal->cameraCalibrationDataDeliveryEnabled = v3;
      multiCamPorts = self->_internal->multiCamPorts;
      if (!multiCamPorts)
      {
        [(AVCaptureDeviceInput *)self multiCamPorts];
        multiCamPorts = self->_internal->multiCamPorts;
      }
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:multiCamPorts];
      uint64_t v8 = v7;
      uint64_t v15 = multiCamPorts;
      if (v3)
      {
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", -[AVCaptureDeviceInput device](self, "device"));
        if (-[NSArray count](-[AVCaptureDevice constituentDevices](-[AVCaptureDeviceInput device](self, "device"), "constituentDevices"), "count") >= 2)objc_msgSend(v9, "addObjectsFromArray:", -[AVCaptureDevice constituentDevices](-[AVCaptureDeviceInput device](self, "device"), "constituentDevices")); {
        long long v20 = 0u;
        }
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v16 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v19 != v16) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __64__AVCaptureDeviceInput_setCameraCalibrationDataDeliveryEnabled___block_invoke;
              v17[3] = &unk_1E5A733E8;
              v17[4] = v13;
              objc_msgSend(v8, "insertObject:atIndex:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, @"cacd", 0, 1, objc_msgSend(v13, "deviceType"), objc_msgSend(v13, "position")), objc_msgSend((id)objc_msgSend(v8, "indexesOfObjectsPassingTest:", v17), "lastIndex") + 1);
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v11);
        }
      }
      else
      {
        objc_msgSend(v7, "removeObjectsAtIndexes:", objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_119));
      }
      self->_internal->multiCamPorts = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v8];
    }
  }
  else
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
  }
}

uint64_t __64__AVCaptureDeviceInput_setCameraCalibrationDataDeliveryEnabled___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)[a2 sourceDeviceType];
  uint64_t v4 = [*(id *)(a1 + 32) deviceType];

  return [v3 isEqualToString:v4];
}

uint64_t __64__AVCaptureDeviceInput_setCameraCalibrationDataDeliveryEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mediaType];

  return [v2 isEqualToString:@"cacd"];
}

- (void)setStudioLightingAllowed:(BOOL)a3
{
  internal = self->_internal;
  if (internal->studioLightingAllowed != a3)
  {
    internal->studioLightingAllowed = a3;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
  }
}

- (void)setReactionEffectsAllowed:(BOOL)a3
{
  internal = self->_internal;
  if (internal->reactionEffectsAllowed != a3)
  {
    internal->reactionEffectsAllowed = a3;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
  }
}

- (void)setBackgroundReplacementAllowed:(BOOL)a3
{
  internal = self->_internal;
  if (internal->backgroundReplacementAllowed != a3)
  {
    internal->backgroundReplacementAllowed = a3;
    [(AVCaptureDeviceInput *)self _bumpChangeSeedForFirstPortWithMediaType:*MEMORY[0x1E4F47C68]];
  }
}

@end