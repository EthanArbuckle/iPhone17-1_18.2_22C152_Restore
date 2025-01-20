@interface BWSphereModeSelector
+ (void)initialize;
- (BOOL)avoidsSphereRecentering;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)enablesSphereWhenAvailable;
- (BOOL)lowPowerSphereModeEnabled;
- (BOOL)overCaptureEnabled;
- (BOOL)sphereVideoEnabled;
- (BOOL)sphereVideoRecenteringEnabled;
- (BOOL)sphereVideoSupported;
- (BOOL)tripodModeEnabled;
- (BOOL)variableFrameRateVideoEnabled;
- (BOOL)visualIntelligenceCameraEnabled;
- (BOOL)zeroShutterLagEnabled;
- (BWSphereModeSelector)initWithPortType:(id)a3 stillActivePreviewSupported:(BOOL)a4 sphereVideoSupported:(BOOL)a5 sphereVideoMaxFrameRate:(float)a6;
- (NSString)portType;
- (__CFString)currentNonLowPowerSphereMode;
- (__CFString)currentSphereMode;
- (float)maximumFrameRate;
- (int)systemThermalLevel;
- (uint64_t)_updateSphereMode;
- (void)dealloc;
- (void)setAvoidsSphereRecentering:(BOOL)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setEnablesSphereWhenAvailable:(BOOL)a3;
- (void)setLowPowerSphereModeEnabled:(BOOL)a3;
- (void)setMaximumFrameRate:(float)a3;
- (void)setOverCaptureEnabled:(BOOL)a3;
- (void)setSphereVideoEnabled:(BOOL)a3;
- (void)setSphereVideoRecenteringEnabled:(BOOL)a3;
- (void)setSystemThermalLevel:(int)a3;
- (void)setTripodModeEnabled:(BOOL)a3;
- (void)setVariableFrameRateVideoEnabled:(BOOL)a3;
- (void)setVisualIntelligenceCameraEnabled:(BOOL)a3;
- (void)setZeroShutterLagEnabled:(BOOL)a3;
@end

@implementation BWSphereModeSelector

- (BOOL)lowPowerSphereModeEnabled
{
  return self->_lowPowerSphereModeEnabled;
}

- (void)setLowPowerSphereModeEnabled:(BOOL)a3
{
  self->_lowPowerSphereModeEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setOverCaptureEnabled:(BOOL)a3
{
  self->_overCaptureEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (__CFString)currentSphereMode
{
  return self->_currentSphereMode;
}

- (void)setMaximumFrameRate:(float)a3
{
  self->_maximumFrameRate = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (__CFString)currentNonLowPowerSphereMode
{
  return self->_currentNonLowPowerSphereMode;
}

- (BWSphereModeSelector)initWithPortType:(id)a3 stillActivePreviewSupported:(BOOL)a4 sphereVideoSupported:(BOOL)a5 sphereVideoMaxFrameRate:(float)a6
{
  v14.receiver = self;
  v14.super_class = (Class)BWSphereModeSelector;
  v10 = [(BWSphereModeSelector *)&v14 init];
  if (v10)
  {
    v11 = (NSString *)a3;
    v12 = (__CFString *)*MEMORY[0x1E4F54E88];
    v10->_portType = v11;
    v10->_currentSphereMode = v12;
    v10->_currentNonLowPowerSphereMode = v12;
    v10->_stillPreviewActiveSupported = a4;
    v10->_sphereVideoSupported = a5;
    v10->_maximumFrameRateSupported = fmaxf(a6, 120.0);
  }
  return v10;
}

- (BOOL)sphereVideoSupported
{
  return self->_sphereVideoSupported;
}

- (void)setVisualIntelligenceCameraEnabled:(BOOL)a3
{
  self->_visualIntelligenceCameraEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setAvoidsSphereRecentering:(BOOL)a3
{
  self->_avoidsSphereRecentering = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (BOOL)enablesSphereWhenAvailable
{
  return self->_enablesSphereWhenAvailable;
}

- (void)setSystemThermalLevel:(int)a3
{
  self->_sphereThermalLevel = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setEnablesSphereWhenAvailable:(BOOL)a3
{
  self->_enablesSphereWhenAvailable = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (uint64_t)_updateSphereMode
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  v2 = (void *)*MEMORY[0x1E4F54E88];
  if (*(unsigned char *)(result + 40))
  {
    float v3 = *(float *)(result + 32);
    uint64_t v4 = *MEMORY[0x1E4F54E88];
    if (v3 <= *(float *)(result + 56))
    {
      if (*(unsigned char *)(result + 36) && *(unsigned char *)(result + 37))
      {
        if (*(unsigned char *)(result + 55))
        {
          uint64_t v5 = *(int *)(result + 48);
          v6 = sVideo60SphereModes;
        }
        else
        {
          if (!*(unsigned char *)(result + 54))
          {
            uint64_t v10 = *(int *)(result + 48);
            v9 = &sVideo30SphereModes[3 * *(unsigned __int8 *)(result + 42) + v10];
            if (v3 < 60.0)
            {
              v6 = sVideo30SphereModes;
            }
            else
            {
              v9 = &sVideo60SphereModes[3 * *(unsigned __int8 *)(result + 42) + v10];
              v6 = sVideo60SphereModes;
            }
LABEL_20:
            uint64_t v4 = *v6;
            v2 = (void *)*v9;
            if (v3 <= 60.0 && *(unsigned char *)(result + 38))
            {
              result = [v2 isEqualToString:*MEMORY[0x1E4F54E98]];
              if (result)
              {
                v2 = (void *)*MEMORY[0x1E4F54EB0];
              }
              else
              {
                result = [v2 isEqualToString:*MEMORY[0x1E4F54EA0]];
                if (result) {
                  v2 = (void *)*MEMORY[0x1E4F54EA8];
                }
              }
            }
            goto LABEL_37;
          }
          uint64_t v5 = *(int *)(result + 48);
          v6 = &sOverCaptureVideoSphereModes;
        }
        v9 = &v6[3 * *(unsigned __int8 *)(result + 42) + v5];
        goto LABEL_20;
      }
      if (*(unsigned char *)(result + 43) && (*(unsigned char *)(result + 44) || *(unsigned char *)(result + 54) || *(unsigned char *)(result + 60)))
      {
        if (*(unsigned char *)(result + 52))
        {
          uint64_t v7 = *(int *)(result + 48);
          v8 = &sZSLStillStationarySphereModes;
        }
        else
        {
          uint64_t v7 = *(int *)(result + 48);
          if (*(unsigned char *)(result + 54)) {
            v8 = &sOverCaptureStillSphereModes;
          }
          else {
            v8 = &sZSLStillSphereModes;
          }
        }
      }
      else if (*(unsigned char *)(result + 39))
      {
        uint64_t v7 = *(int *)(result + 48);
        v8 = &sStillSphereModes;
      }
      else
      {
        uint64_t v7 = *(int *)(result + 48);
        if (*(unsigned char *)(result + 53)) {
          v8 = &sDepthSphereModes;
        }
        else {
          v8 = &sDefaultSphereModes;
        }
      }
      v2 = (void *)v8[3 * *(unsigned __int8 *)(result + 42) + v7];
      uint64_t v4 = *v8;
    }
  }
  else
  {
    uint64_t v4 = *MEMORY[0x1E4F54E88];
  }
LABEL_37:
  if (*(void **)(v1 + 16) != v2) {
    *(void *)(v1 + 16) = v2;
  }
  if (*(void *)(v1 + 24) != v4) {
    *(void *)(v1 + 24) = v4;
  }
  return result;
}

- (void)setSphereVideoRecenteringEnabled:(BOOL)a3
{
  self->_sphereVideoRecenteringEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  self->_zeroShutterLagEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setVariableFrameRateVideoEnabled:(BOOL)a3
{
  self->_variableFrameRateVideoEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sDefaultSphereModes = *MEMORY[0x1E4F54E80];
    unk_1E96B74B0 = sDefaultSphereModes;
    qword_1E96B74B8 = sDefaultSphereModes;
    unk_1E96B74C0 = sDefaultSphereModes;
    qword_1E96B74C8 = sDefaultSphereModes;
    unk_1E96B74D0 = sDefaultSphereModes;
    sDepthSphereModes = *MEMORY[0x1E4F54E70];
    unk_1E96B74E0 = sDepthSphereModes;
    qword_1E96B74E8 = sDefaultSphereModes;
    unk_1E96B74F0 = sDefaultSphereModes;
    qword_1E96B74F8 = sDefaultSphereModes;
    unk_1E96B7500 = sDefaultSphereModes;
    sVideo30SphereModes[0] = *MEMORY[0x1E4F54EA0];
    *(void *)algn_1E96B75B8 = sVideo30SphereModes[0];
    qword_1E96B75C0 = sVideo30SphereModes[0];
    unk_1E96B75C8 = sDepthSphereModes;
    qword_1E96B75D0 = sDepthSphereModes;
    unk_1E96B75D8 = sDepthSphereModes;
    sVideo60SphereModes[0] = *MEMORY[0x1E4F54E98];
    *(void *)algn_1E96B75E8 = sVideo60SphereModes[0];
    qword_1E96B75F0 = sVideo60SphereModes[0];
    unk_1E96B75F8 = sDefaultSphereModes;
    qword_1E96B7600 = sDefaultSphereModes;
    unk_1E96B7608 = sDefaultSphereModes;
    sStillSphereModes = sDepthSphereModes;
    *(void *)algn_1E96B7588 = sDepthSphereModes;
    qword_1E96B7590 = sDefaultSphereModes;
    unk_1E96B7598 = sDepthSphereModes;
    qword_1E96B75A0 = sDepthSphereModes;
    unk_1E96B75A8 = sDefaultSphereModes;
    sZSLStillSphereModes = *MEMORY[0x1E4F54E90];
    *(void *)algn_1E96B7618 = sZSLStillSphereModes;
    qword_1E96B7620 = sDepthSphereModes;
    unk_1E96B7628 = sDepthSphereModes;
    qword_1E96B7630 = sDepthSphereModes;
    unk_1E96B7638 = sDepthSphereModes;
    sZSLStillStationarySphereModes = sDepthSphereModes;
    *(void *)algn_1E96B7648 = sDepthSphereModes;
    qword_1E96B7650 = sDefaultSphereModes;
    unk_1E96B7658 = sDefaultSphereModes;
    qword_1E96B7660 = sDefaultSphereModes;
    unk_1E96B7668 = sDefaultSphereModes;
    sOverCaptureVideoSphereModes = sVideo30SphereModes[0];
    unk_1E96B7550 = sVideo30SphereModes[0];
    qword_1E96B7558 = sVideo30SphereModes[0];
    unk_1E96B7560 = sDepthSphereModes;
    qword_1E96B7568 = sDepthSphereModes;
    unk_1E96B7570 = sDefaultSphereModes;
    sOverCaptureStillSphereModes = sZSLStillSphereModes;
    unk_1E96B7520 = sZSLStillSphereModes;
    qword_1E96B7528 = sDepthSphereModes;
    unk_1E96B7530 = sDepthSphereModes;
    qword_1E96B7538 = sDepthSphereModes;
    unk_1E96B7540 = sDefaultSphereModes;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSphereModeSelector;
  [(BWSphereModeSelector *)&v3 dealloc];
}

- (NSString)portType
{
  return self->_portType;
}

- (float)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (BOOL)sphereVideoRecenteringEnabled
{
  return self->_sphereVideoRecenteringEnabled;
}

- (BOOL)avoidsSphereRecentering
{
  return self->_avoidsSphereRecentering;
}

- (BOOL)zeroShutterLagEnabled
{
  return self->_zeroShutterLagEnabled;
}

- (BOOL)overCaptureEnabled
{
  return self->_overCaptureEnabled;
}

- (BOOL)variableFrameRateVideoEnabled
{
  return self->_variableFrameRateVideoEnabled;
}

- (int)systemThermalLevel
{
  return self->_sphereThermalLevel;
}

- (void)setTripodModeEnabled:(BOOL)a3
{
  self->_tripodModeEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (BOOL)tripodModeEnabled
{
  return self->_tripodModeEnabled;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (BOOL)visualIntelligenceCameraEnabled
{
  return self->_visualIntelligenceCameraEnabled;
}

@end