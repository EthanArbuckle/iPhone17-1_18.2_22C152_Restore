@interface DeskCamSession
- (BOOL)autoZoomSupported;
- (BOOL)isFrontFacingCamera;
- (BOOL)transformIsValid;
- (DeskCamSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceModelName:(id)a5;
- (DeskCamSessionOptions)options;
- (__n128)transformMatrix;
- (double)focusPoint;
- (double)trapezoid;
- (float)autoZoomValue;
- (int)_deviceType;
- (int)outputType;
- (int)processPixelBuffer:(__CVBuffer *)a3 withMetadata:(id)a4 outputPixelBuffer:(__CVBuffer *)a5;
- (unsigned)exifOrientation;
- (void)setOptions:(id)a3;
- (void)setOutputType:(int)a3;
@end

@implementation DeskCamSession

- (DeskCamSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceModelName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)DeskCamSession;
  v11 = [(DeskCamSession *)&v25 init];
  if (!v11)
  {
    v13 = 0;
    v12 = 0;
    goto LABEL_12;
  }
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CinematicFraming"];
  if (!v12) {
    goto LABEL_10;
  }
  v13 = 0;
  if (a3.var0 && a3.var1)
  {
    if (!isDeskCamAllowedCamera(v9))
    {
LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
    *($2825F4736939C4A6D3AD43837233062D *)(v11 + 28) = a3;
    objc_storeStrong((id *)v11 + 5, a4);
    objc_storeStrong((id *)v11 + 6, a5);
    v11[164] = [*((id *)v11 + 5) isEqualToString:*MEMORY[0x1E4F52E10]];
    *((_DWORD *)v11 + 14) = [v11 _deviceType];
    v14 = [[DeskCamSessionOptions alloc] initWithDeviceType:*((unsigned int *)v11 + 14)];
    v15 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v14;

    if (*((void *)v11 + 2))
    {
      v16 = [[DeskCamRenderingSession alloc] initWithOutputDimensions:*(void *)(v11 + 28) portType:*((void *)v11 + 5) deviceType:*((unsigned int *)v11 + 14) isFrontFacingCamera:v11[164]];
      v17 = (void *)*((void *)v11 + 1);
      *((void *)v11 + 1) = v16;

      v18 = (void *)*((void *)v11 + 1);
      if (v18)
      {
        [v18 setOptions:*((void *)v11 + 2)];
        *((_DWORD *)v11 + 6) = 0;
        __asm { FMOV            V0.2S, #-1.0 }
        *((void *)v11 + 19) = _D0;
        v11[144] = 1;
        v13 = v11;
        goto LABEL_12;
      }
    }
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_11;
  }
LABEL_12:

  return v13;
}

- (int)_deviceType
{
  return 1;
}

- (DeskCamSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int)processPixelBuffer:(__CVBuffer *)a3 withMetadata:(id)a4 outputPixelBuffer:(__CVBuffer *)a5
{
  id v8 = a4;
  renderingSession = self->_renderingSession;
  id v10 = [v8 cameraCalibrationDictionary];
  [(DeskCamRenderingSession *)renderingSession registerCameraCalibrationDictionary:v10];

  -[DeskCamRenderingSession registerCameraOrientation:](self->_renderingSession, "registerCameraOrientation:", [v8 cameraOrientation]);
  v11 = self->_renderingSession;
  v12 = [v8 bodyDetections];
  [(DeskCamRenderingSession *)v11 registerBodyDetections:v12];

  [v8 gravity];
  uint32x4_t v14 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v13), (int8x16_t)vcgezq_f32(v13)));
  v14.i32[3] = v14.i32[2];
  if ((vmaxvq_u32(v14) & 0x80000000) != 0) {
    *(void *)&double v15 = vdupq_n_s32(0x7FC00000u).u64[0];
  }
  else {
    [v8 gravity];
  }
  [(DeskCamRenderingSession *)self->_renderingSession registerGravity:v15];
  if (self->_outputType)
  {
    -[DeskCamRenderingSession registerOutputType:](self->_renderingSession, "registerOutputType:");
    int v16 = [(DeskCamRenderingSession *)self->_renderingSession processBuffer:a3 outputPixelBuffer:a5];
    if (v16)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      [(DeskCamRenderingSession *)self->_renderingSession trapezoid];
      *(void *)&self->_anon_40[4] = v17;
      *(void *)&self->_anon_40[12] = v18;
      *(void *)&self->_anon_40[20] = v19;
      *(void *)&self->_anon_40[28] = v20;
      [(DeskCamRenderingSession *)self->_renderingSession transformMatrix];
      *(_DWORD *)&self->_anon_60[12] = v21;
      *(void *)&self->_anon_60[4] = v22;
      *(_DWORD *)&self->_anon_60[28] = v23;
      *(void *)&self->_anon_60[20] = v24;
      *(_DWORD *)&self->_anon_60[44] = v25;
      *(void *)&self->_anon_60[36] = v26;
      self->_focusPoint[3] = [(DeskCamRenderingSession *)self->_renderingSession transformIsValid];
      [(DeskCamRenderingSession *)self->_renderingSession focusPoint];
      *(void *)&self->_exifOrientation = v27;
      LODWORD(self->_autoZoomValue) = [(DeskCamRenderingSession *)self->_renderingSession exifOrientation];
      [(DeskCamRenderingSession *)self->_renderingSession autoZoomValue];
      LODWORD(self[1].super.isa) = v28;
      *((unsigned char *)&self->_autoZoomValue + 5) = [(DeskCamRenderingSession *)self->_renderingSession autoZoomSupported];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = -1;
  }

  return v16;
}

- (int)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(int)a3
{
  self->_outputType = a3;
}

- (double)trapezoid
{
  return *(double *)(a1 + 64);
}

- (__n128)transformMatrix
{
  return a1[6];
}

- (BOOL)transformIsValid
{
  return self->_focusPoint[3];
}

- (double)focusPoint
{
  return *(double *)(a1 + 152);
}

- (unsigned)exifOrientation
{
  return LODWORD(self->_autoZoomValue);
}

- (BOOL)isFrontFacingCamera
{
  return *((unsigned char *)&self->_autoZoomValue + 4);
}

- (BOOL)autoZoomSupported
{
  return *((unsigned char *)&self->_autoZoomValue + 5);
}

- (float)autoZoomValue
{
  return *(float *)&self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModelName, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_renderingSession, 0);
}

@end