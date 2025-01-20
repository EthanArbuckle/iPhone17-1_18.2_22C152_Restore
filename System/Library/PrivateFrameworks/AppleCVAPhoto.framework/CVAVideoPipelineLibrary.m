@interface CVAVideoPipelineLibrary
+ (id)colorCubePortraitGenericRequestForPortraitVideoPipeline:(id)a3 sourceColorPixelBuffer:(__CVBuffer *)a4 cubeData:(id)a5 error:(id *)a6;
+ (id)colorCubePortraitRequestForPortraitVideoPipeline:(id)a3 withWithSourceColorPixelBuffer:(__CVBuffer *)a4 destinationColorPixelBuffer:(__CVBuffer *)a5 cubeData:(id)a6;
+ (id)colorCubeRequest:(id)a3 isMono:(BOOL)a4 error:(id *)a5;
+ (id)colorCubeRequestWithBackgroundCube:(id)a3 foregroundCube:(id)a4 error:(id *)a5;
+ (id)contourLightRequestWithFace:(id)a3 error:(id *)a4;
+ (id)contourLightRequestWithFace:(id)a3 relightStyleStrength:(float)a4 error:(id *)a5;
+ (id)disparityPostprocessingVideoPipelineWithProperties:(id)a3 error:(id *)a4;
+ (id)mattingVideoPipelineWithProperties:(id)a3 error:(id *)a4;
+ (id)opaqueBackgroundRequestWithMattingRequest:(id)a3 error:(id *)a4;
+ (id)portraitRequestWithBackground:(id)a3 light:(id)a4 post:(id)a5 error:(id *)a6;
+ (id)portraitVideoPipelineWithProperties:(id)a3 commandQueue:(id)a4 error:(id *)a5;
+ (id)portraitVideoPipelineWithProperties:(id)a3 commandQueue:(id)a4 notificationQueue:(id)a5 error:(id *)a6;
+ (id)portraitVideoPipelineWithProperties:(id)a3 error:(id *)a4;
+ (id)sourceImageRequest:(__CVBuffer *)a3 error:(id *)a4;
+ (id)stageLightPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6;
+ (id)stageLightPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6 vignetteIntensity:(float)a7 stageLightIntensity:(float)a8;
+ (id)studioLightRequestWithFace:(id)a3 error:(id *)a4;
+ (id)studioLightRequestWithFace:(id)a3 relightStyleStrength:(float)a4 error:(id *)a5;
+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 error:(id *)a8;
+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 primaryCaptureRect:(CGRect)a8 error:(id *)a9;
+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 renderingRect:(CGRect)a8 error:(id *)a9;
+ (id)syntheticDepthOfFieldPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 backgroundColorCube:(id)a5 foregroundColorCube:(id)a6 colorCubeIntensity:(float)a7 simulatedFocalRatio:(float)a8 sourceColorGain:(float)a9 sourceColorLux:(float)a10;
+ (id)videoPipelinePropertiesForDevice:(unint64_t)a3;
+ (int)prewarm;
@end

@implementation CVAVideoPipelineLibrary

+ (id)colorCubePortraitGenericRequestForPortraitVideoPipeline:(id)a3 sourceColorPixelBuffer:(__CVBuffer *)a4 cubeData:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a6) {
    *a6 = 0;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F768F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F768F8))
  {
    v17 = +[CVAPreferenceManager defaults];
    char v18 = [v17 BOOLForKey:@"CVAPhotoEnforceNewAPI"] ^ 1;

    byte_1E9F768F0 = v18;
    __cxa_guard_release(&qword_1E9F768F8);
  }
  int v11 = byte_1E9F768F0;
  v12 = NSString;
  v13 = [NSString stringWithFormat:@"API: colorCubePortraitGenericRequestForPortraitVideoPipeline is deprecated."];
  v14 = [v12 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary colorCubePortraitGenericRequestForPortraitVideoPipeline:sourceColorPixelBuffer:cubeData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 624, v13];
  sub_1BA8161F4(v11 == 0, a6, 0, 4294944393, v14);

  if (v11)
  {
    v15 = objc_opt_new();
    [v15 setPortraitVideoPipeline:v9];
    [v15 setSourceColorPixelBuffer:a4];
    CVPixelBufferRetain(a4);
    [v15 setCubeData:v10];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)portraitRequestWithBackground:(id)a3 light:(id)a4 post:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6) {
    *a6 = 0;
  }
  v12 = NSString;
  v13 = [NSString stringWithFormat:@"Background request shouldn't be nil."];
  v14 = [v12 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 385, v13];
  sub_1BA8161F4(v9 == 0, a6, 0, 4294944393, v14);

  if (!v9) {
    goto LABEL_17;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76628, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76628))
  {
    v34 = +[CVAPreferenceManager defaults];
    char v35 = [v34 BOOLForKey:@"CVAPhotoEnforceNewAPI"] ^ 1;

    byte_1E9F76708 = v35;
    __cxa_guard_release(&qword_1E9F76628);
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = NSString;
      v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Only colorCube post-processing is supported."];
      v17 = [v20 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 459, v16];
      sub_1BA8161F4(1, a6, 0, 4294944393, v17);
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v10)
    {
      v15 = NSString;
      v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Light should be nil."];
      v17 = [v15 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 469, v16];
      sub_1BA8161F4(1, a6, 0, 4294944393, v17);
LABEL_16:

LABEL_17:
      v21 = 0;
      goto LABEL_18;
    }
    if (v11)
    {
      v23 = [v11 singleColorCube];

      if (!v23)
      {
        v24 = NSString;
        v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Use post as colorCubeRequest: (Single cube)."];
        v17 = [v24 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 479, v16];
        sub_1BA8161F4(1, a6, 0, 4294944393, v17);
        goto LABEL_16;
      }
    }
    goto LABEL_40;
  }
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if (!v11 && ((isKindOfClass ^ 1) & 1) == 0)
      {
        v19 = NSString;
        v16 = [NSString stringWithFormat:@"API: STAGE LIGHT CUSTOM MONO requires colorCubeRequestWithBackgroundCube (mono color cube)."];
        v17 = [v19 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 514, v16];
        sub_1BA8161F4(1, a6, 0, 4294944393, v17);
        goto LABEL_16;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = NSString;
      v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For legacy Stage Light use legacy interface."];
      v17 = [v25 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 492, v16];
      sub_1BA8161F4(1, a6, 0, 4294944393, v17);
      goto LABEL_16;
    }
  }
  int v26 = byte_1E9F76708;
  if (v11 && byte_1E9F76708)
  {
    v27 = [v11 singleColorCube];

    if (v27)
    {
      if (!v10
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v29 = NSString;
        v16 = [NSString stringWithFormat:@"API: When background is not nil, Single color cube is good only for Studio or Contour."];
        v17 = [v29 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 529, v16];
        sub_1BA8161F4(1, a6, 0, 4294944393, v17);
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v10)
      {
        v28 = NSString;
        v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For the given background/light, post-processing should be nil."];
        v17 = [v28 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 541, v16];
        sub_1BA8161F4(1, a6, 0, 4294944393, v17);
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v10
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v33 = NSString;
          v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For the given background/light, post-processing should be nil."];
          v17 = [v33 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 553, v16];
          sub_1BA8161F4(1, a6, 0, 4294944393, v17);
          goto LABEL_16;
        }
      }
    }
LABEL_40:
    int v26 = byte_1E9F76708;
  }
  if (!v26)
  {
    objc_opt_class();
    if (!((v10 == 0) | objc_opt_isKindOfClass() & 1))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          if (!v11
            || ([v11 singleColorCube],
                v30 = objc_claimAutoreleasedReturnValue(),
                v30,
                !v30))
          {
            v31 = NSString;
            v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Need post as colorCubeRequest: (Single cube)."];
            v17 = [v31 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 582, v16];
            sub_1BA8161F4(1, a6, 0, 4294944393, v17);
            goto LABEL_16;
          }
        }
        else if (!v11)
        {
          v32 = NSString;
          v16 = [NSString stringWithFormat:@"API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For the given background/light, post-processing should be nil."];
          v17 = [v32 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 591, v16];
          sub_1BA8161F4(1, a6, 0, 4294944393, v17);
          goto LABEL_16;
        }
      }
    }
  }
  v21 = objc_opt_new();
  [v21 setBackground:v9];
  [v21 setPost:v11];
  [v21 setLight:v10];
LABEL_18:

  return v21;
}

+ (id)colorCubeRequest:(id)a3 isMono:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = NSString;
  id v9 = [NSString stringWithFormat:@"API: colorCube should not be nil!"];
  id v10 = [v8 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary colorCubeRequest:isMono:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 364, v9];
  sub_1BA8161F4(v7 == 0, a5, 0, 4294944393, v10);

  if (v7)
  {
    id v11 = objc_opt_new();
    [v11 setSingleColorCube:v7];
    [v11 setIsMono:v6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)colorCubeRequestWithBackgroundCube:(id)a3 foregroundCube:(id)a4 error:(id *)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = NSString;
  id v10 = [NSString stringWithFormat:@"API: both backgroundColorCube and foregroundColorCube are nil!"];
  id v11 = [v9 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAVideoPipelineLibrary colorCubeRequestWithBackgroundCube:foregroundCube:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 349, v10];
  sub_1BA8161F4((v7 | v8) == 0, a5, 0, 4294944393, v11);

  if (v7 | v8)
  {
    v12 = objc_opt_new();
    [v12 setBackgroundColorCube:v7];
    [v12 setForegroundColorCube:v8];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)contourLightRequestWithFace:(id)a3 error:(id *)a4
{
  LODWORD(v4) = 2143289344;
  v5 = +[CVAVideoPipelineLibrary contourLightRequestWithFace:a3 relightStyleStrength:a4 error:v4];

  return v5;
}

+ (id)studioLightRequestWithFace:(id)a3 error:(id *)a4
{
  LODWORD(v4) = 2143289344;
  v5 = +[CVAVideoPipelineLibrary studioLightRequestWithFace:a3 relightStyleStrength:a4 error:v4];

  return v5;
}

+ (id)contourLightRequestWithFace:(id)a3 relightStyleStrength:(float)a4 error:(id *)a5
{
  id v6 = a3;
  unint64_t v7 = objc_opt_new();
  [v7 setFaceKitProcessOutput:v6];
  *(float *)&double v8 = a4;
  [v7 setPortraitStyleStrength:v8];

  return v7;
}

+ (id)studioLightRequestWithFace:(id)a3 relightStyleStrength:(float)a4 error:(id *)a5
{
  id v6 = a3;
  unint64_t v7 = objc_opt_new();
  [v7 setFaceKitProcessOutput:v6];
  *(float *)&double v8 = a4;
  [v7 setPortraitStyleStrength:v8];

  return v7;
}

+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 primaryCaptureRect:(CGRect)a8 error:(id *)a9
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v17 = a3;
  id v18 = a7;
  v19 = objc_opt_new();
  [v19 setMattingRequest:v17];
  *(float *)&double v20 = a4;
  [v19 setSimulatedFocalRatio:v20];
  *(float *)&double v21 = a5;
  [v19 setSourceColorGain:v21];
  *(float *)&double v22 = a6;
  [v19 setSourceColorLux:v22];
  [v19 setSbufMetadata:v18];
  objc_msgSend(v19, "setPrimaryCaptureRect:", x, y, width, height);

  return v19;
}

+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 renderingRect:(CGRect)a8 error:(id *)a9
{
  id v9 = objc_msgSend(a1, "syntheticDepthOfFieldBackgroundRequestWithMattingRequest:simulatedFocalRatio:sourceColorGain:sourceColorLux:metadata:primaryCaptureRect:error:", a3, a7, a9);

  return v9;
}

+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 error:(id *)a8
{
  double v8 = objc_msgSend(a1, "syntheticDepthOfFieldBackgroundRequestWithMattingRequest:simulatedFocalRatio:sourceColorGain:sourceColorLux:metadata:primaryCaptureRect:error:", a3, a7, a8);

  return v8;
}

+ (id)opaqueBackgroundRequestWithMattingRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setMattingRequest:v4];

  return v5;
}

+ (id)sourceImageRequest:(__CVBuffer *)a3 error:(id *)a4
{
  v5 = objc_opt_new();
  [v5 setSourceColorPixelBuffer:a3];

  return v5;
}

+ (id)syntheticDepthOfFieldPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 backgroundColorCube:(id)a5 foregroundColorCube:(id)a6 colorCubeIntensity:(float)a7 simulatedFocalRatio:(float)a8 sourceColorGain:(float)a9 sourceColorLux:(float)a10
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  double v20 = [CVAPortraitRequest alloc];
  *(float *)&double v21 = a7;
  *(float *)&double v22 = a8;
  *(float *)&double v23 = a9;
  *(float *)&double v24 = a10;
  v25 = [(CVAPortraitRequest *)v20 initWithMattingRequest:v17 destinationColorPixelBuffer:a4 backgroundColorCube:v18 foregroundColorCube:v19 colorCubeIntensity:v21 simulatedFocalRatio:v22 sourceColorGain:v23 sourceColorLux:v24];

  return v25;
}

+ (id)stageLightPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6 vignetteIntensity:(float)a7 stageLightIntensity:(float)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (a7 < 0.0 || a7 > 1.0)
  {
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CVAVideoPipelineLibrary.mm", 197, @"vignetteIntensity not in [0,1]: %f", a7);

    if (a8 >= 0.0)
    {
LABEL_6:
      if (a8 <= 1.0) {
        goto LABEL_7;
      }
    }
  }
  else if (a8 >= 0.0)
  {
    goto LABEL_6;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CVAVideoPipelineLibrary.mm", 200, @"stageLightIntensity not in [0,1]: %f", a8);

LABEL_7:
  id v19 = [CVAPortraitRequest_StageLight alloc];
  *(float *)&double v20 = a7;
  *(float *)&double v21 = a8;
  double v22 = [(CVAPortraitRequest_StageLight *)v19 initWithMattingRequest:v15 destinationColorPixelBuffer:a4 proxyCubeData:v16 cubeData:v17 vignetteIntensity:v20 stageLightIntensity:v21];

  return v22;
}

+ (id)stageLightPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [CVAPortraitRequest_StageLight alloc];
  LODWORD(v13) = 2143289344;
  LODWORD(v14) = 2143289344;
  id v15 = [(CVAPortraitRequest_StageLight *)v12 initWithMattingRequest:v9 destinationColorPixelBuffer:a4 proxyCubeData:v10 cubeData:v11 vignetteIntensity:v13 stageLightIntensity:v14];

  return v15;
}

+ (id)colorCubePortraitRequestForPortraitVideoPipeline:(id)a3 withWithSourceColorPixelBuffer:(__CVBuffer *)a4 destinationColorPixelBuffer:(__CVBuffer *)a5 cubeData:(id)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v36 = a6;
  double v8 = [v7 videoPipelineProperties];
  size_t v9 = [v8 inputDisparityPixelBufferWidth];

  id v10 = [v7 videoPipelineProperties];
  size_t v11 = [v10 inputDisparityPixelBufferHeight];

  v12 = [v7 videoPipelineProperties];
  OSType v13 = [v12 inputDisparityPixelBufferPixelFormat];

  double v14 = [v7 videoPipelineProperties];
  size_t v15 = [v14 outputDisparityPixelBufferWidth];

  id v16 = [v7 videoPipelineProperties];
  size_t v17 = [v16 outputDisparityPixelBufferHeight];

  id v18 = [v7 videoPipelineProperties];
  OSType v19 = [v18 outputDisparityPixelBufferPixelFormat];

  double v20 = [v7 videoPipelineProperties];
  size_t v33 = [v20 alphaMattePixelBufferWidth];

  double v21 = [v7 videoPipelineProperties];
  size_t v32 = [v21 alphaMattePixelBufferHeight];

  double v22 = [v7 videoPipelineProperties];
  OSType pixelFormatType = [v22 alphaMattePixelBufferPixelFormat];

  CVPixelBufferRef v38 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef texture = 0;
  uint64_t v44 = *MEMORY[0x1E4F24D20];
  uint64_t v23 = v44;
  uint64_t v24 = MEMORY[0x1E4F1CC08];
  v45[0] = MEMORY[0x1E4F1CC08];
  CVPixelBufferCreate(0, v9, v11, v13, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1], &pixelBufferOut);
  uint64_t v42 = v23;
  uint64_t v43 = v24;
  CVPixelBufferCreate(0, v15, v17, v19, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1], &v38);
  uint64_t v40 = v23;
  uint64_t v41 = v24;
  CVPixelBufferCreate(0, v33, v32, pixelFormatType, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1], &texture);
  v25 = [CVADisparityPostprocessingRequest alloc];
  int v26 = -[CVADisparityPostprocessingRequest initWithSourceColorPixelBuffer:fixedPointDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:](v25, "initWithSourceColorPixelBuffer:fixedPointDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:", a4, pixelBufferOut, v38, 0, 0, 0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0,
          0,
          0,
          0,
          0);
  v27 = [CVAMattingRequest alloc];
  v28 = -[CVAMattingRequest initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:](v27, "initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:", v26, 0, 0, texture, 0, 0.0, 0.0, 0.0, 0.0);
  v29 = [[CVAPortraitRequest_StageLight alloc] initWithMattingRequest:v28 destinationColorPixelBuffer:a5 proxyCubeData:v36 cubeData:v36 vignetteIntensity:0.0 stageLightIntensity:0.0];
  CVPixelBufferRelease(texture);
  CVPixelBufferRelease(v38);
  CVPixelBufferRelease(pixelBufferOut);

  return v29;
}

+ (int)prewarm
{
  uint64_t v2 = 0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    v3 = (void *)MEMORY[0x1BA9F15D0](a1, a2);
    id v4 = +[CVAVideoPipelineLibrary videoPipelinePropertiesForDevice:v2];
    id v9 = 0;
    v5 = +[CVAVideoPipelineLibrary portraitVideoPipelineWithProperties:v4 commandQueue:0 error:&v9];
    id v6 = v9;
    if (!v5) {
      break;
    }

    if (++v2 == 50) {
      return 0;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_error_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  int v7 = [v6 code];

  return v7;
}

+ (id)disparityPostprocessingVideoPipelineWithProperties:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v6 = [[CVAPortraitVideoPipeline_Impl alloc] initWithProperties:v5 error:a4];

  return v6;
}

+ (id)mattingVideoPipelineWithProperties:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v6 = [[CVAPortraitVideoPipeline_Impl alloc] initWithProperties:v5 error:a4];

  return v6;
}

+ (id)portraitVideoPipelineWithProperties:(id)a3 commandQueue:(id)a4 error:(id *)a5
{
  id v5 = [a1 portraitVideoPipelineWithProperties:a3 commandQueue:a4 notificationQueue:0 error:a5];

  return v5;
}

+ (id)portraitVideoPipelineWithProperties:(id)a3 commandQueue:(id)a4 notificationQueue:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6) {
    *a6 = 0;
  }
  uint64_t v12 = [[CVAPortraitVideoPipeline_Impl alloc] initWithProperties:v9 commandQueue:v10 notificationQueue:v11 error:a6];

  return v12;
}

+ (id)portraitVideoPipelineWithProperties:(id)a3 error:(id *)a4
{
  id v4 = [a1 portraitVideoPipelineWithProperties:a3 commandQueue:0 error:a4];

  return v4;
}

+ (id)videoPipelinePropertiesForDevice:(unint64_t)a3
{
  id v3 = [[CVAVideoPipelineProperties_Impl alloc] initForVideoPipelineDevice:a3];

  return v3;
}

@end