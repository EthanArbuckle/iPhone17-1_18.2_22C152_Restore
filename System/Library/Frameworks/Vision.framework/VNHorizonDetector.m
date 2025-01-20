@interface VNHorizonDetector
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNHorizonDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  if (v13)
  {
    v14 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
    v15 = v14;
    if (v14)
    {
      v22 = [v14 imageProperties];
      if (v22)
      {
        VNValidatedLog(1, @"horizonDetector: props exist\n", v16, v17, v18, v19, v20, v21, v94);
        v23 = (void *)*MEMORY[0x1E4F2FCA0];
        v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];

        if (v24) {
          uint64_t v31 = [v24 intValue];
        }
        else {
          uint64_t v31 = 0;
        }
        VNValidatedLog(1, @"horizonDetector: Orientation = %d\n", v25, v26, v27, v28, v29, v30, v31);
        v37 = (void *)*MEMORY[0x1E4F2FC20];
        v38 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

        if (v38)
        {
          v45 = [v38 objectForKeyedSubscript:@"8"];
          VNValidatedLog(1, @"  Found makerNotes\n", v46, v47, v48, v49, v50, v51, v95);
          if (v45)
          {
            v52 = [v45 objectAtIndexedSubscript:0];
            [v52 floatValue];
            float v54 = v53;

            v55 = [v45 objectAtIndexedSubscript:1];
            [v55 floatValue];
            float v57 = v56;

            v58 = [v45 objectAtIndexedSubscript:2];
            [v58 floatValue];
            float v60 = v59;

            VNValidatedLog(1, @"    Found vector: %.3f,%.3f,%.3f\n", v61, v62, v63, v64, v65, v66, COERCE__INT64(v54));
          }
          else
          {
            float v54 = 0.0;
            float v57 = 0.0;
            float v60 = 0.0;
          }
        }
        else
        {
          float v54 = 0.0;
          float v57 = 0.0;
          float v60 = 0.0;
        }
        VNValidatedLog(1, @"acc = (%.5f, %.5f, %.5f)\n", v39, v40, v41, v42, v43, v44, COERCE__INT64(v54));
        float v67 = (float)(v57 * v57) + (float)(v54 * v54);
        float v36 = atan2f(v60, sqrtf(v67));
        float v34 = sqrtf(v67 + (float)(v60 * v60)) + -1.0;
        float v74 = atan2f(v57, v54);
        float v75 = 0.0;
        switch((int)v31)
        {
          case 1:
            float v75 = flt_1A410BBA8[v74 < 0.0];
            goto LABEL_21;
          case 3:
            goto LABEL_21;
          case 6:
            float v75 = 1.5708;
            goto LABEL_21;
          case 8:
            float v75 = -1.5708;
LABEL_21:
            float v35 = (float)((float)(v74 + v75) * -180.0) / 3.14159265;
            int v33 = 1;
            VNValidatedLog(1, @"accelTilt = %.3f deg, accelPitch = %.3f deg, accMagnitudeDev %.3f\n", v68, v69, v70, v71, v72, v73, COERCE__INT64(v35));
            break;
          default:
            VNValidatedLog(1, @"accelPitch = %.3f deg, accelMagnitudeDev = %.3f\n", v68, v69, v70, v71, v72, v73, COERCE__INT64((float)(v36 * 180.0) / 3.14159265));
            int v33 = 0;
            float v35 = (float)((float)(v74 + 0.0) * -180.0) / 3.14159265;
            break;
        }
      }
      else
      {
        int v33 = 0;
        float v34 = 0.0;
        float v35 = 0.0;
        float v36 = 0.0;
      }
      VNValidatedLog(1, @"MaxPitch = %.3f, MaxPixelTilt = %.3f, MinPixelTilt = %.3f, MaxAccelMagDev = %.3f, MaxAccelFFTDifff = %.3f\n", v16, v17, v18, v19, v20, v21, 0x4039000000000000);
      if (fabsf(v34) <= 0.03) {
        int v76 = v33;
      }
      else {
        int v76 = 0;
      }
      if (fabsf(v36) > 0.43633) {
        goto LABEL_27;
      }
      float v101 = 0.0;
      BaseAddress = CVPixelBufferGetBaseAddress(a4);
      int BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      int Width = CVPixelBufferGetWidth(a4);
      int Height = CVPixelBufferGetHeight(a4);
      horizonDetectionFFT((uint64_t)BaseAddress, BytesPerRow, Width, Height, &v101, 1);
      float v82 = v101;
      VNValidatedLog(1, @"FFT detected angle = %.3f deg\n", v83, v84, v85, v86, v87, v88, COERCE__INT64((float)(v101 * 180.0) / 3.14159265));
      float v89 = fabsf(v82);
      if (v89 < 0.017453 || v89 > 0.17453 || v76 && vabds_f32((float)(v82 * 180.0) / 3.1416, v35) > 5.0)
      {
LABEL_27:
        v32 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        int v90 = [v15 width];
        memset(&v100, 0, sizeof(v100));
        float v91 = (float)(int)[v15 height];
        CGAffineTransformMakeTranslation(&v100, (float)((float)v90 * 0.5), (float)(v91 * 0.5));
        CGAffineTransform v98 = v100;
        CGFloat v92 = v82;
        CGAffineTransformRotate(&v99, &v98, v92);
        CGAffineTransform v100 = v99;
        CGAffineTransform v97 = v99;
        CGAffineTransformTranslate(&v99, &v97, (float)((float)v90 * -0.5), (float)(v91 * -0.5));
        CGAffineTransform v100 = v99;
        v93 = [(VNObservation *)[VNHorizonObservation alloc] initWithOriginatingRequestSpecifier:v13];
        CGAffineTransform v96 = v100;
        [(VNHorizonObservation *)v93 setTransform:&v96];
        [(VNHorizonObservation *)v93 setAngle:v92];
        v102[0] = v93;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
      }
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  uint64_t v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  uint64_t v18 = v17;
  if (v17)
  {
    unint64_t v19 = [v17 width];
    unint64_t v20 = [v18 height];
    v26.origin.double x = x * (double)v19;
    v26.size.double width = width * (double)v19;
    v26.origin.double y = y * (double)v20;
    v26.size.double height = height * (double)v20;
    CGRect v27 = CGRectIntegral(v26);
    if (v19 > v20) {
      unint64_t v21 = 256;
    }
    else {
      unint64_t v21 = (unint64_t)(float)((float)((float)((float)v20 / (float)v19) * 256.0) + 0.5);
    }
    if (v19 > v20) {
      unint64_t v22 = (unint64_t)(float)((float)((float)((float)v19 / (float)v20) * 256.0) + 0.5);
    }
    else {
      unint64_t v22 = 256;
    }
    v23 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", v22, v21, 1111970369, v16, a8, v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    *a7 = v23;
    BOOL v24 = v23 != 0;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

@end