@interface VNHomographicImageRegistrationDetector
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)_calculateHomographicWarpTransform:(id *)a3 ofFloatingImagePixelBuffer:(__CVBuffer *)a4 ontoReferenceImagePixelBuffer:(__CVBuffer *)a5 usingImageRegistrationContext:(ImageRegistrationCtx_s *)a6 seededWithPreviousWarpTransform:(id *)a7 error:(id *)a8;
- (BOOL)_createN:(unint64_t)a3 CVPixelBuffers:(__CVBuffer *)a4 withPixelFormat:(unsigned int)a5 width:(unint64_t)a6 height:(unint64_t)a7 error:(id *)a8;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (__CVBuffer)_createHomographicPixelBufferFromImageBuffer:(id)a3 cropRect:(CGRect)a4 options:(id)a5 error:(id *)a6;
- (id)_validatedImageBufferForKey:(id)a3 inOptions:(id)a4 error:(id *)a5;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNHomographicImageRegistrationDetector

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a7;
  id v16 = a9;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  Context = ImageRegistrationCreateContext();
  if (!Context)
  {
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to create image registration context"];
      v25 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  v18 = [v14 objectForKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImagePixelBufferRef"];
  v19 = (__CVBuffer *)[v18 unsignedIntegerValue];

  BOOL v20 = [(VNHomographicImageRegistrationDetector *)self _calculateHomographicWarpTransform:&v27 ofFloatingImagePixelBuffer:a4 ontoReferenceImagePixelBuffer:v19 usingImageRegistrationContext:Context seededWithPreviousWarpTransform:0 error:a8];
  ImageRegistrationDestroyContext(Context);
  CVPixelBufferRelease(v19);
  if (!v20)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_16;
  }
  v21 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v14 error:a8];
  if (v21)
  {
    v22 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature" inOptions:v14 error:a8];
    if (v22)
    {
      v23 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNHomographicImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature" inOptions:v14 error:a8];
      if (v23)
      {
        v24 = [(VNObservation *)[VNImageHomographicAlignmentObservation alloc] initWithOriginatingRequestSpecifier:v21];
        [(VNImageAlignmentObservation *)v24 setReferenceImageSignature:v22];
        [(VNImageAlignmentObservation *)v24 setFloatingImageSignature:v23];
        -[VNImageHomographicAlignmentObservation setWarpTransform:](v24, "setWarpTransform:", *(double *)&v27, *(double *)&v28, *(double *)&v29);
        v30[0] = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      }
      else
      {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }

LABEL_16:

  return v25;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  v17 = [(VNHomographicImageRegistrationDetector *)self _validatedImageBufferForKey:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageBuffer" inOptions:v16 error:a8];
  if (v17)
  {
    v18 = [(VNHomographicImageRegistrationDetector *)self _validatedImageBufferForKey:@"VNHomographicImageRegistrationDetectorProcessOption_FloatingImageBuffer" inOptions:v16 error:a8];
    v19 = v18;
    if (v18)
    {
      unint64_t v20 = [v18 width];
      unint64_t v21 = [v19 height];
      v39.origin.double x = x * (double)v20;
      v39.size.double width = width * (double)v20;
      v39.origin.double y = y * (double)v21;
      v39.size.double height = height * (double)v21;
      CGRect v40 = CGRectIntegral(v39);
      double v22 = v40.origin.x;
      double v23 = v40.origin.y;
      double v24 = v40.size.width;
      double v25 = v40.size.height;
      double v37 = y;
      double v38 = x;
      double v26 = (double)(unint64_t)[v17 width];
      double v27 = (double)(unint64_t)[v17 height];
      BOOL v28 = v25 == v27 && v24 == v26;
      if (v28)
      {
        long long v29 = -[VNHomographicImageRegistrationDetector _createHomographicPixelBufferFromImageBuffer:cropRect:options:error:](self, "_createHomographicPixelBufferFromImageBuffer:cropRect:options:error:", v19, v16, a8, v22, v23, v24, v25);
        *a7 = v29;
        if (v29)
        {
          v30 = -[VNHomographicImageRegistrationDetector _createHomographicPixelBufferFromImageBuffer:cropRect:options:error:](self, "_createHomographicPixelBufferFromImageBuffer:cropRect:options:error:", v17, v16, a8, 0.0, 0.0, v26, v27);
          if (v30)
          {
            v31 = [NSNumber numberWithUnsignedInteger:v30];
            [v16 setObject:v31 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImagePixelBufferRef"];
LABEL_13:

LABEL_15:
            goto LABEL_16;
          }
        }
      }
      else if (a8)
      {
        v32 = NSString;
        v33 = VNHumanReadableCGRect(v22, v23, v24, v25);
        v34 = [NSString stringWithFormat:@"[%g, %g, %g, %g]", *(void *)&v38, *(void *)&v37, *(void *)&width, *(void *)&height];
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%g x %g", *(void *)&v26, *(void *)&v27);
        v31 = [v32 stringWithFormat:@"registration of region of interest %@ (%@) cannot be performed on reference image of size %@", v33, v34, v35];

        *a8 = +[VNError errorForInvalidOperationWithLocalizedDescription:v31];
        goto LABEL_13;
      }
    }
    BOOL v28 = 0;
    goto LABEL_15;
  }
  BOOL v28 = 0;
LABEL_16:

  return v28;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VNHomographicImageRegistrationDetector;
  return [(VNDetector *)&v5 completeInitializationForSession:a3 error:a4];
}

- (BOOL)_calculateHomographicWarpTransform:(id *)a3 ofFloatingImagePixelBuffer:(__CVBuffer *)a4 ontoReferenceImagePixelBuffer:(__CVBuffer *)a5 usingImageRegistrationContext:(ImageRegistrationCtx_s *)a6 seededWithPreviousWarpTransform:(id *)a7 error:(id *)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a5, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a5, 0);
  CVPixelBufferRef texture = 0;
  CVPixelBufferRef v37 = 0;
  if (![(VNHomographicImageRegistrationDetector *)self _createN:2 CVPixelBuffers:&texture withPixelFormat:875704422 width:WidthOfPlane height:HeightOfPlane error:a8])return 0; {
  int v35 = 0;
  }
  memset(v34, 0, sizeof(v34));
  *(void *)double v38 = a4;
  __int16 v33 = 0;
  uint64_t v17 = ImageRegister((unsigned __int16 ***)a6, a5, (__CVBuffer **)v38, 1u, 1, a7 != 0, v34, 0, &v33, 0, 0, 0, 0, 0, 0, (const void **)&texture, 2);
  if (v17)
  {
    if (a8)
    {
      *a8 = +[VNError errorForOSStatus:v17 localizedDescription:@"failed to warp image"];
    }
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
  }
  CVPixelBufferRelease(texture);
  CVPixelBufferRelease(v37);
  BOOL v19 = v18 == 0;
  if (!v18)
  {
    GeomTransform_fromUnityToImageSize(v38, (uint64_t)v34, WidthOfPlane - 1, HeightOfPlane - 1, 1);
    v43.columns[0] = *(simd_float3 *)v38;
    v43.columns[1] = *(simd_float3 *)&v38[4];
    v43.columns[2] = *(simd_float3 *)&v38[8];
    v43.columns[0].i32[1] = *(_DWORD *)&v38[12];
    v43.columns[1].i32[1] = *(_DWORD *)&v38[16];
    v43.columns[2].i32[1] = *(_DWORD *)&v38[20];
    v43.columns[0].i32[2] = v39;
    v43.columns[1].i32[2] = v40;
    v43.columns[2].i32[2] = v41;
    simd_float3x3 v44 = __invert_f3(v43);
    *((_DWORD *)a3 + 2) = v44.columns[0].i32[2];
    *(float *)&uint64_t v20 = -v44.columns[1].f32[0];
    _S16 = (float)HeightOfPlane;
    __asm { FMLA            S3, S16, V0.S[2] }
    v44.columns[0].i32[1] = _S3;
    __asm { FMLS            S4, S16, V1.S[2] }
    HIDWORD(v20) = _S4;
    v44.columns[2].f32[0] = vmlas_n_f32(v44.columns[2].f32[0], (float)HeightOfPlane, v44.columns[1].f32[0]);
    _S3 = (float)(HeightOfPlane * HeightOfPlane);
    __asm
    {
      FMLA            S17, S3, V1.S[2]
      FMLS            S17, S16, V1.S[1]
    }
    *(void *)a3 = v44.columns[0].i64[0];
    *((_DWORD *)a3 + 6) = vnegq_f32(*(float32x4_t *)(&v44 + 16)).i32[2];
    *((void *)a3 + 2) = v20;
    v44.columns[2].f32[1] = _S17 - v44.columns[2].f32[1];
    __asm { FMLA            S6, S16, V1.S[2] }
    *((_DWORD *)a3 + 10) = _S6;
    *((void *)a3 + 4) = v44.columns[2].i64[0];
  }
  return v19;
}

- (__CVBuffer)_createHomographicPixelBufferFromImageBuffer:(id)a3 cropRect:(CGRect)a4 options:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  id v14 = (__CVBuffer *)objc_msgSend(v12, "croppedBufferWithWidth:height:format:cropRect:options:error:", objc_msgSend(v12, "width"), objc_msgSend(v12, "height"), 875704422, v13, a6, x, y, width, height);

  return v14;
}

- (BOOL)_createN:(unint64_t)a3 CVPixelBuffers:(__CVBuffer *)a4 withPixelFormat:(unsigned int)a5 width:(unint64_t)a6 height:(unint64_t)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  bzero(a4, 8 * a3);
  if (a3)
  {
    double v24 = a8;
    BOOL v14 = 0;
    uint64_t v15 = 0;
    while (1)
    {
      id v25 = 0;
      id v16 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a6, a7, v11, &v25);
      id v17 = v25;
      int v18 = v17;
      a4[v15] = v16;
      if (!v16) {
        break;
      }

      BOOL v14 = ++v15 >= a3;
      if (a3 == v15) {
        return 1;
      }
    }
    if (v15)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        CVPixelBufferRelease(a4[i]);
        a4[i] = 0;
      }
    }
    if (v24)
    {
      id v20 = [NSString alloc];
      unint64_t v21 = [v18 localizedDescription];
      double v22 = (void *)[v20 initWithFormat:@"failed to create a %lu x %lu pixel buffer of type '%c%c%c%c' with error: %@", a6, a7, ((int)v11 >> 24), ((int)(v11 << 8) >> 24), ((__int16)v11 >> 8), (char)v11, v21];

      id *v24 = +[VNError errorForInternalErrorWithLocalizedDescription:v22 underlyingError:v18];
    }
  }
  else
  {
    return 1;
  }
  return v14;
}

- (id)_validatedImageBufferForKey:(id)a3 inOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:v8 inOptions:v9 error:a5];
  if (v10 && [(VNDetector *)self validateImageBuffer:v10 error:a5]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

@end