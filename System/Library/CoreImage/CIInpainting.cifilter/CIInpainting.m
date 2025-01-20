void sub_1D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

id sub_1F5C(void *a1)
{
  id v1 = a1;
  v2 = [v1 metalTexture];
  v12[0] = kCIImageFlipped;
  v12[1] = kCIImageColorSpace;
  v13[0] = &__kCFBooleanTrue;
  v3 = +[NSNull null];
  v13[1] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v5 = +[CIImage imageWithMTLTexture:v2 options:v4];

  [v1 region];
  CGFloat v7 = v6;
  [v1 region];
  CGAffineTransformMakeTranslation(&v11, v7, v8);
  v9 = [v5 imageByApplyingTransform:&v11];

  return v9;
}

void sub_20B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2104(void *a1)
{
  id v1 = a1;
  v2 = +[CIKernel cachedKernelWithString:@"kernel vec4 interleavedToPlanar(sampler s, float tileSize) __attribute__((outputFormat(kCIFormatRh))) \n { \n vec2 dc = destCoord() \n float double y = dc.y; \n double y = (y<tileSize) ? y : \n (y<tileSize*2.0) ? (y - tileSize) : \n (y - 2.0*tileSize); \n vec4 c = sample(s, samplerTransform(s, vec2(dc.x, y))); \n if (dc.y < tileSize) \n return vec4(c.x, 0.0, 0.0, 1.0); \n if (dc.y < tileSize*2.0) \n return vec4(c.y, 0.0, 0.0, 1.0); \n return vec4(c.z, 0.0, 0.0, 1.0); \n }"];;
  if (v1 && ([v1 extent], !CGRectIsInfinite(v26)))
  {
    [v1 extent];
    double v5 = v4;
    [v1 extent];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGAffineTransformMakeScale(&v23, 1.0, 3.0);
    v27.origin.double x = v7;
    v27.origin.double y = v9;
    v27.size.double width = v11;
    v27.size.double height = v13;
    CGRect v28 = CGRectApplyAffineTransform(v27, &v23);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;
    v24[0] = v1;
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5, _NSConcreteStackBlock, 3221225472, sub_A314, &unk_14500, *(void *)&v5);
    v24[1] = v18;
    v19 = +[NSArray arrayWithObjects:v24 count:2];
    v20 = objc_msgSend(v2, "applyWithExtent:roiCallback:arguments:", &v22, v19, x, y, width, height);

    id v1 = v20;
    v3 = v1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_22F8(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

CVPixelBufferRef sub_2340(size_t a1, size_t a2)
{
  CVPixelBufferRef v8 = 0;
  v10[0] = &__NSDictionary0__struct;
  v9[0] = kCVPixelBufferIOSurfacePropertiesKey;
  v9[1] = kCVPixelBufferPixelFormatTypeKey;
  double v4 = +[NSNumber numberWithUnsignedInt:1278226536];
  v10[1] = v4;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  CVPixelBufferCreate(0, a1, a2, 0x4C303068u, v5, &v8);
  CVPixelBufferRef v6 = v8;

  return v6;
}

void sub_2440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2464(void *a1, __CVBuffer *a2)
{
  id v3 = a1;
  IOSurface = CVPixelBufferGetIOSurface(a2);
  OSType PixelFormat = IOSurfaceGetPixelFormat(IOSurface);
  uint64_t v6 = 25;
  if (PixelFormat != 1278226536) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 10;
  if (PixelFormat != 1278226488) {
    uint64_t v7 = v6;
  }
  if (PixelFormat == 1111970369) {
    uint64_t v8 = 80;
  }
  else {
    uint64_t v8 = v7;
  }
  if (!v8) {
    __assert_rtn("CreateTextureFromBufferSurface", "CIInpaintFilter.mm", 130, "mtlFormat != MTLPixelFormatInvalid");
  }
  size_t Width = IOSurfaceGetWidth(IOSurface);
  double v10 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v8 width:Width height:IOSurfaceGetHeight(IOSurface) mipmapped:0];
  objc_msgSend(v10, "setUsage:", (unint64_t)objc_msgSend(v10, "usage") | 3);
  id v11 = [v3 newTextureWithDescriptor:v10 iosurface:IOSurface plane:0];

  return v11;
}

void sub_258C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25B8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v19[0] = @"inputRVector";
  id v11 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
  v20[0] = v11;
  v19[1] = @"inputGVector";
  double v12 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
  v20[1] = v12;
  v19[2] = @"inputBVector";
  CGFloat v13 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
  v20[2] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  v15 = [v8 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v14];

  id v16 = objc_alloc((Class)CIRenderDestination);
  id v17 = [v16 initWithMTLTexture:v9 commandBuffer:v10];

  [v17 setFlipped:1];
  [v17 setColorSpace:0];
  id v18 = [v7 startTaskToRender:v15 toDestination:v17 error:0];
}

void sub_27B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2824(uint64_t a1, void *a2)
{
  id v4 = a2;
  SEL v3 = NSSelectorFromString(@"setError:");
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) performSelector:v3 withObject:v4];
  }
}

void sub_2898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_291C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2D80(_Unwind_Exception *a1)
{
}

void sub_2F48(_Unwind_Exception *a1)
{
}

void sub_3130(_Unwind_Exception *a1)
{
  CFDictionaryRef v5 = v2;

  _Unwind_Resume(a1);
}

void sub_3324(_Unwind_Exception *a1)
{
  CFDictionaryRef v5 = v2;

  _Unwind_Resume(a1);
}

void sub_3518(_Unwind_Exception *a1)
{
  CFDictionaryRef v5 = v2;

  _Unwind_Resume(a1);
}

void sub_370C(_Unwind_Exception *a1)
{
  CFDictionaryRef v5 = v2;

  _Unwind_Resume(a1);
}

void sub_3900(_Unwind_Exception *a1)
{
  CFDictionaryRef v5 = v2;

  _Unwind_Resume(a1);
}

void sub_3AF4(_Unwind_Exception *a1)
{
  CFDictionaryRef v5 = v2;

  _Unwind_Resume(a1);
}

void sub_3C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3DFC(_Unwind_Exception *a1)
{
}

void sub_4000(_Unwind_Exception *a1)
{
}

void sub_4548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_46E4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)sub_47F0());
  SEL v3 = (void *)qword_18D90;
  qword_18D90 = (uint64_t)v2;

  [(id)qword_18D90 setComputeUnits:1];
  id v4 = [*(id *)(a1 + 32) userDefaults];
  id v6 = [v4 dictionaryRepresentation];

  CFDictionaryRef v5 = [v6 objectForKeyedSubscript:@"inpaintModelPrecomp"];
  if (([v5 isEqual:&__kCFBooleanTrue] & 1) != 0
    || ([v5 isEqual:&off_15338] & 1) != 0
    || [v5 isEqual:@"1"])
  {
    [(id)qword_18D90 setUsePrecompiledE5Bundle:1];
  }
}

void sub_47C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_47F0()
{
  uint64_t v4 = 0;
  CFDictionaryRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_18DB8;
  uint64_t v7 = qword_18DB8;
  if (!qword_18DB8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_A32C;
    v3[3] = &unk_14528;
    v3[4] = &v4;
    sub_A32C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_48BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_4C48()
{
  uint64_t v4 = 0;
  CFDictionaryRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_18DC8;
  uint64_t v7 = qword_18DC8;
  if (!qword_18DC8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_A600;
    v3[3] = &unk_14528;
    v3[4] = &v4;
    sub_A600((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_4D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4D2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userDefaults];
  SEL v3 = [v2 dictionaryRepresentation];

  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"inpaintModelPath"];
    if (v4)
    {
      CFDictionaryRef v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
      if (v5) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  CFDictionaryRef v5 = [v6 URLForResource:@"inpaint" withExtension:@"mlmodelc"];

  if (v5)
  {
LABEL_7:
    id v7 = sub_4C48();
    id v8 = [*(id *)(a1 + 32) loadModelConfig];
    id v17 = 0;
    uint64_t v9 = [v7 modelWithContentsOfURL:v5 configuration:v8 error:&v17];
    id v10 = v17;
    id v11 = (void *)qword_18D98;
    qword_18D98 = v9;

    double v12 = [(id)qword_18D98 valueForKeyPath:@"modelDescription.metadata.MLModelDescriptionKey"];
    if (qword_18D98)
    {
      CGFloat v13 = sub_AB60();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(id)objc_opt_class() description];
        v15 = [v5 path];
        *(_DWORD *)buf = 138543874;
        v19 = v14;
        __int16 v20 = 2114;
        v21 = v12;
        __int16 v22 = 2114;
        CGAffineTransform v23 = v15;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: using model \"%{public}@\" at path: %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      CGFloat v13 = sub_AB60();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        sub_C400();
      }
    }

    goto LABEL_16;
  }
  CFDictionaryRef v5 = sub_AB60();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138543362;
    v19 = v16;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: The inpaint.mlmodelc is no longer part of the filter bundle. It needs to be passed to the filter using the inputModel argument.\n", buf, 0xCu);
  }
  id v10 = 0;
LABEL_16:
}

void sub_5014(_Unwind_Exception *a1)
{
  id v8 = v5;

  _Unwind_Resume(a1);
}

void sub_51D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_51E4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userDefaults];
  id v2 = [v1 dictionaryRepresentation];

  if (v2)
  {
    SEL v3 = [v2 objectForKeyedSubscript:@"refinementModelPath"];
    if (v3)
    {
      uint64_t v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
      if (v4) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    SEL v3 = 0;
  }
  CFDictionaryRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v5 URLForResource:@"deep_transfer" withExtension:@"mlmodelc"];

  if (v4)
  {
LABEL_7:
    id v6 = objc_alloc_init((Class)sub_47F0());
    [v6 setComputeUnits:3];
    id v15 = 0;
    uint64_t v7 = [sub_4C48() modelWithContentsOfURL:v4 configuration:v6 error:&v15];
    id v8 = v15;
    uint64_t v9 = (void *)qword_18DA8;
    qword_18DA8 = v7;

    id v10 = [(id)qword_18DA8 valueForKeyPath:@"modelDescription.metadata.MLModelDescriptionKey"];
    if (qword_18DA8)
    {
      id v11 = sub_AB60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [(id)objc_opt_class() description];
        CGFloat v13 = [v4 path];
        *(_DWORD *)buf = 138543874;
        id v17 = v12;
        __int16 v18 = 2114;
        v19 = v10;
        __int16 v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: using model \"%{public}@\" at path: %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      id v11 = sub_AB60();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        sub_C444();
      }
    }

    goto LABEL_16;
  }
  uint64_t v4 = sub_AB60();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138543362;
    id v17 = v14;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: The deep_transfer.mlmodelc is no longer part of the filter bundle. It needs to be passed to the filter using the inputRefinementModel argument.\n", buf, 0xCu);
  }
  id v8 = 0;
LABEL_16:
}

void sub_54C8(_Unwind_Exception *a1)
{
  uint64_t v9 = v6;

  _Unwind_Resume(a1);
}

void sub_5704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_5720(void *a1)
{
  id v1 = a1;
  id v2 = [v1 valueForKeyPath:@"modelDescription.outputDescriptionsByName"];
  SEL v3 = [v2 allValues];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];

  if ([v4 type] == &dword_4)
  {
    CFDictionaryRef v5 = [v4 imageConstraint];
    id v6 = [v5 pixelsHigh];
    if (v6 != [v5 pixelsHigh])
    {
      uint64_t v7 = "pw == ph";
      int v8 = 86;
LABEL_11:
      __assert_rtn("modelDimension", "CIInpaintFilter.mm", v8, v7);
    }
    if ((uint64_t)v6 <= 511)
    {
      uint64_t v7 = "pw >= 512";
      int v8 = 87;
      goto LABEL_11;
    }
  }
  else
  {
    if ([v4 type] != (char *)&dword_4 + 1)
    {
      id v6 = 0;
      goto LABEL_9;
    }
    CFDictionaryRef v5 = [v4 multiArrayConstraint];
    uint64_t v9 = [v5 shape];
    id v10 = [v9 lastObject];
    id v6 = [v10 intValue];

    if ((int)v6 <= 255) {
      __assert_rtn("modelDimension", "CIInpaintFilter.mm", 94, "pw >= 256");
    }
  }

LABEL_9:
  return v6;
}

void sub_5894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

id sub_6080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sub_A6E4();
  uint64_t v7 = +[NSString stringWithFormat:@"%@/%d_%04d_%s", v6, getpid(), a1, a3];

  if (a2)
  {
    int v8 = sub_A6E4();
    uint64_t v9 = +[NSString stringWithFormat:@"%@/%d_%04d.%d_%s", v8, getpid(), a1, a2, a3];

    uint64_t v7 = (void *)v9;
  }
  return v7;
}

void sub_6158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_6180(void *a1)
{
  id v1 = a1;
  id v2 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_invertMaskR (__sample s) __attribute__((outputFormat(kCIFormatRh))) { return vec4(1.0-s.x,0,0,1);; }"];
  double y = CGRectInfinite.origin.y;
  double width = CGRectInfinite.size.width;
  double height = CGRectInfinite.size.height;
  id v9 = v1;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  uint64_t v7 = objc_msgSend(v2, "applyWithExtent:arguments:", v6, CGRectInfinite.origin.x, y, width, height);

  return v7;
}

void sub_6280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_62B0(void *a1, CGColorSpaceRef a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a3;
  if (v7)
  {
    [v7 extent];
    if (!CGRectIsEmpty(v25))
    {
      id v9 = +[NSURL fileURLWithPath:v8];
      if (([v9 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        CGColorSpaceRef v10 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
        id v11 = v10;
        if (!a2) {
          a2 = v10;
        }
        [v7 extent];
        double v13 = v12;
        double v15 = v14;
        id v16 = sub_AB60();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v20[0] = 67109634;
          v20[1] = (int)v13;
          __int16 v21 = 1024;
          int v22 = (int)v15;
          __int16 v23 = 2082;
          id v24 = [v8 UTF8String];
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "CIInpaintFilter: saving: %dx%d %{public}s\n", (uint8_t *)v20, 0x18u);
        }

        id v17 = sub_A80C();
        __int16 v18 = [v7 imageBySettingProperties:&__NSDictionary0__struct];
        v19 = [v18 imageByApplyingOrientation:a4];
        [v17 writePNGRepresentationOfImage:v19 toURL:v9 format:kCIFormatRGBA8 colorSpace:a2 options:&__NSDictionary0__struct error:0];

        CGColorSpaceRelease(v11);
      }
    }
  }
}

void sub_649C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_650C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    [v5 extent];
    if (CGRectIsEmpty(v23))
    {
      id v7 = v5;
    }
    else
    {
      id v8 = +[NSURL fileURLWithPath:v6];
      if ([v8 checkResourceIsReachableAndReturnError:0])
      {
        id v7 = v5;
      }
      else
      {
        id v7 = sub_9998(v5);

        [v7 extent];
        double v10 = v9;
        double v12 = v11;
        double v13 = sub_AB60();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v18[0] = 67109634;
          v18[1] = (int)v10;
          __int16 v19 = 1024;
          int v20 = (int)v12;
          __int16 v21 = 2082;
          id v22 = [v6 UTF8String];
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "CIInpaintFilter: saving: %dx%d %{public}s\n", (uint8_t *)v18, 0x18u);
        }

        double v14 = sub_A80C();
        double v15 = CGColorSpaceCreateWithName(kCGColorSpaceLinearGray);
        id v16 = [v7 imageBySettingProperties:&__NSDictionary0__struct];
        id v17 = [v16 imageByApplyingOrientation:a3];
        [v14 writePNGRepresentationOfImage:v17 toURL:v8 format:kCIFormatL8 colorSpace:v15 options:&__NSDictionary0__struct error:0];

        CGColorSpaceRelease(v15);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
}

void sub_6718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,_Unwind_Exception *exception_object,uint64_t a44)
{
  _Unwind_Resume(a1);
}

id sub_78E8(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v5 = [v3 imageByColorMatchingWorkingSpaceToColorSpace:a2];

    uint64_t v4 = (void *)v5;
  }
  return v4;
}

void sub_7944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_7954(void *a1)
{
  id v1 = a1;
  id v2 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_ycc_01_to_neg1pos1 (__sample s) __attribute__(preserves_opacity) { s.rgb = clamp(s.rgb, 0.0, 1.0) s.rgb = s.rgb * 2.0 -1.0; return s; }"];;
  [v1 extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v14 = v1;
  double v11 = +[NSArray arrayWithObjects:&v14 count:1];
  double v12 = objc_msgSend(v2, "applyWithExtent:arguments:", v11, v4, v6, v8, v10);

  return v12;
}

void sub_7A5C(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

id sub_7A90(void *a1)
{
  id v1 = a1;
  id v2 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_redOnly (__sample s) __attribute__((outputFormat(kCIFormatRh))) { return vec4(s.r,0,0,1); }"];
  [v1 extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v14 = v1;
  double v11 = +[NSArray arrayWithObjects:&v14 count:1];
  double v12 = objc_msgSend(v2, "applyWithExtent:arguments:", v11, v4, v6, v8, v10);

  return v12;
}

void sub_7B98(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

id sub_7BCC(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -a2, -a3);
  double v10 = objc_msgSend(v9, "imageByCroppingToRect:", a2, a3, a4, a5);

  CGAffineTransform v13 = v14;
  double v11 = [v10 imageByApplyingTransform:&v13];

  return v11;
}

void sub_7CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_7CB0(void *a1, CGFloat a2)
{
  id v3 = a1;
  if (fabs(a2 + -1.0) > 0.000001)
  {
    CGAffineTransformMakeScale(&v6, a2, a2);
    uint64_t v4 = [v3 imageByApplyingTransform:&v6];

    id v3 = (id)v4;
  }
  return v3;
}

void sub_7D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_7D54(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v5 = [v3 imageByColorMatchingColorSpaceToWorkingSpace:a2];

    uint64_t v4 = (void *)v5;
  }
  return v4;
}

void sub_7DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_848C@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, double a9@<D6>, double a10@<D7>, double a11, double a12)
{
  double v18 = fmax(a5, a6);
  double v19 = fmax(a9, a10);
  double v20 = fmin(a9, a10);
  double v21 = sqrt(a5 * a6 * a12 / a11);
  +[CIInpaintFilter getMaskMarginFactor];
  double v23 = fmin(fmax(ceil(fmax(v21, v18 * v22)), (double)a1), v19);
  if (v18 > v20 || v23 <= v20) {
    double v25 = v23;
  }
  else {
    double v25 = v20;
  }
  double MinX = sub_A948(a3, a4, a5, a6, v25);
  double MinY = v27;
  double v30 = v29;
  double v32 = v31;
  v60.origin.CGFloat x = a7;
  v60.origin.CGFloat y = a8;
  v60.size.CGFloat width = a9;
  v60.size.CGFloat height = a10;
  v71.origin.CGFloat x = MinX;
  v71.origin.CGFloat y = MinY;
  v71.size.CGFloat width = v30;
  v71.size.CGFloat height = v32;
  if (CGRectContainsRect(v60, v71))
  {
    double v33 = (double)a1;
  }
  else
  {
    double v57 = v25;
    v61.origin.CGFloat x = MinX;
    v61.origin.CGFloat y = MinY;
    v61.size.CGFloat width = v30;
    v61.size.CGFloat height = v32;
    CGRect v62 = CGRectStandardize(v61);
    CGFloat x = v62.origin.x;
    CGFloat rect = v62.origin.x;
    CGFloat y = v62.origin.y;
    CGFloat width = v62.size.width;
    CGFloat height = v62.size.height;
    v62.origin.CGFloat x = a7;
    v62.origin.CGFloat y = a8;
    v62.size.CGFloat width = a9;
    v62.size.CGFloat height = a10;
    CGRect v63 = CGRectStandardize(v62);
    CGFloat v38 = v63.origin.x;
    CGFloat v39 = v63.origin.y;
    CGFloat v40 = v63.size.width;
    CGFloat v41 = v63.size.height;
    double rect_24a = CGRectGetMinX(v63);
    v64.origin.CGFloat x = v38;
    v64.origin.CGFloat y = v39;
    v64.size.CGFloat width = v40;
    v64.size.CGFloat height = v41;
    double rect_16a = CGRectGetMaxX(v64);
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v65);
    v66.origin.CGFloat x = rect;
    CGFloat rect1a = y;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v66);
    if (MinX < rect_24a || MaxX > rect_16a)
    {
      double v44 = MaxX - MinX;
      if (v44 >= rect_16a - rect_24a)
      {
        double MinX = rect_24a - floor((v44 - (rect_16a - rect_24a)) * 0.5);
        double MaxX = v44 + MinX;
      }
      else if (MinX <= rect_24a)
      {
        double MaxX = rect_24a + v44;
        double MinX = rect_24a;
      }
      else
      {
        double MinX = rect_16a - v44;
        double MaxX = rect_16a;
      }
    }
    double v30 = MaxX - MinX;
    v67.origin.CGFloat x = v38;
    v67.origin.CGFloat y = v39;
    v67.size.CGFloat width = v40;
    v67.size.CGFloat height = v41;
    double rect_24b = CGRectGetMinY(v67);
    v68.origin.CGFloat x = v38;
    v68.origin.CGFloat y = v39;
    v68.size.CGFloat width = v40;
    v68.size.CGFloat height = v41;
    double MaxY = CGRectGetMaxY(v68);
    v69.origin.CGFloat x = MinX;
    v69.origin.CGFloat y = rect1a;
    v69.size.CGFloat width = v30;
    v69.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v69);
    v70.origin.CGFloat x = MinX;
    v70.origin.CGFloat y = rect1a;
    v70.size.CGFloat width = v30;
    v70.size.CGFloat height = height;
    double v46 = CGRectGetMaxY(v70);
    if (MinY < rect_24b || v46 > MaxY)
    {
      double v48 = v46 - MinY;
      if (v48 >= MaxY - rect_24b)
      {
        double MinY = rect_24b - floor((v48 - (MaxY - rect_24b)) * 0.5);
        double v46 = v48 + MinY;
      }
      else if (MinY <= rect_24b)
      {
        double v46 = rect_24b + v48;
        double MinY = rect_24b;
      }
      else
      {
        double MinY = MaxY - v48;
        double v46 = MaxY;
      }
    }
    double v32 = v46 - MinY;
    double v33 = (double)a1;
    double v25 = v57;
  }
  double result = v33 / v25;
  *(double *)a2 = result;
  *(double *)(a2 + 8) = MinX;
  *(double *)(a2 + 16) = MinY;
  *(double *)(a2 + 24) = v30;
  *(double *)(a2 + 32) = v32;
  *(void *)(a2 + 40) = a1;
  return result;
}

void sub_9680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

id sub_9998(void *a1)
{
  id v1 = a1;
  v8[0] = @"inputRVector";
  id v2 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0];
  v9[0] = v2;
  v8[1] = @"inputGVector";
  id v3 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0];
  v9[1] = v3;
  v8[2] = @"inputBVector";
  uint64_t v4 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0];
  void v9[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  CGAffineTransform v6 = [v1 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v5];

  return v6;
}

void sub_9AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_9B34(void *a1, unint64_t a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  id v15 = a1;
  [v15 extent];
  v25.origin.CGFloat x = a4;
  v25.origin.CGFloat y = a5;
  v25.size.CGFloat width = a6;
  v25.size.CGFloat height = a7;
  id v16 = v15;
  if (!CGRectContainsRect(v24, v25))
  {
    id v16 = [v15 imageByApplyingFilter:@"CIWrapMirror"];
  }
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, -a4, -a5);
  CGAffineTransform v21 = v22;
  id v17 = [v16 imageByApplyingTransform:&v21];

  if (a3) {
    sub_A9D4(v17, a8);
  }
  else {
  double v18 = sub_7CB0(v17, a8);
  }

  double v19 = objc_msgSend(v18, "imageByCroppingToRect:", 0.0, 0.0, (double)a2, (double)a2);

  return v19;
}

void sub_9C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_9CB4(void *a1, CGFloat a2, CGFloat a3, double a4, double a5, double a6)
{
  id v11 = a1;
  double v12 = [v11 imageByClampingToExtent];

  CGAffineTransform v13 = sub_A9D4(v12, a6);

  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, a2, a3);
  CGAffineTransform v17 = v18;
  CGAffineTransform v14 = [v13 imageByApplyingTransform:&v17];

  id v15 = objc_msgSend(v14, "imageByCroppingToRect:", a2, a3, a4, a5);

  return v15;
}

void sub_9DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_9DDC(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  [v9 extent];
  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v11;
  v21.size.CGFloat width = v12;
  v21.size.CGFloat height = v13;
  v20.origin.CGFloat x = a2;
  v20.origin.CGFloat y = a3;
  v20.size.CGFloat width = a4;
  v20.size.CGFloat height = a5;
  if (CGRectContainsRect(v20, v21))
  {
    CGAffineTransform v14 = +[CIImage blackImage];
    id v15 = [v9 imageByCompositingOverImage:v14];

    uint64_t v16 = objc_msgSend(v15, "imageByCroppingToRect:", a2, a3, a4, a5);

    id v9 = (id)v16;
  }
  CGAffineTransform v17 = [v9 imageByApplyingFilter:@"CIWrapMirror"];

  return v17;
}

void sub_9EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A32C(uint64_t a1)
{
  sub_A410();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MLModelConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_18DB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMLModelConfigurationClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CIInpaintFilter.mm", 15, @"Unable to find class %s", "MLModelConfiguration");

    __break(1u);
  }
}

void sub_A3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A410()
{
  v3[0] = 0;
  if (!qword_18DC0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_A58C;
    v3[4] = &unk_144E0;
    void v3[5] = v3;
    long long v4 = off_14548;
    uint64_t v5 = 0;
    qword_18DC0 = _sl_dlopen();
  }
  if (!qword_18DC0)
  {
    id v1 = +[NSAssertionHandler currentHandler];
    id v2 = +[NSString stringWithUTF8String:"void *CoreMLLibrary()"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"CIInpaintFilter.mm", 12, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_A568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t sub_A58C()
{
  uint64_t result = _sl_dlopen();
  qword_18DC0 = result;
  return result;
}

void sub_A600(uint64_t a1)
{
  sub_A410();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MLModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_18DC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMLModelClass()_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CIInpaintFilter.mm", 13, @"Unable to find class %s", "MLModel");

    __break(1u);
  }
}

void sub_A6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_A6E4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_18DD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_18DD8))
  {
    qword_18DD0 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.coreimage"];
    __cxa_guard_release(&qword_18DD8);
  }
  v0 = [(id)qword_18DD0 dictionaryRepresentation];
  id v1 = [v0 objectForKeyedSubscript:@"dumpInpaintImages"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 hasPrefix:@"/"])
  {
    id v2 = v1;
  }
  else
  {
    NSTemporaryDirectory();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v3 = v2;

  return v3;
}

void sub_A7DC(_Unwind_Exception *a1)
{
}

char *sub_A80C()
{
  v0 = &ApplyOldInpaintModel__metaData;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_18DE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_18DE8))
  {
    v4[0] = kCIContextCacheIntermediates;
    v4[1] = kCIContextName;
    v5[0] = &__kCFBooleanFalse;
    v5[1] = @"CIInpaintFilter";
    id v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
    qword_18DE0 = +[CIContext contextWithOptions:v3];

    __cxa_guard_release(&qword_18DE8);
    v0 = &ApplyOldInpaintModel__metaData;
  }
  name = v0[49].name;
  return name;
}

void sub_A91C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_18DE8);
  _Unwind_Resume(a1);
}

double sub_A948(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = floor(CGRectGetMidX(*(CGRect *)&a1) - a5 * 0.5);
  v11.origin.CGFloat x = a1;
  v11.origin.CGFloat y = a2;
  v11.size.CGFloat width = a3;
  v11.size.CGFloat height = a4;
  CGRectGetMidY(v11);
  return v9;
}

id sub_A9D4(void *a1, double a2)
{
  id v3 = a1;
  if (fabs(a2 + -1.0) > 0.000001)
  {
    v8[0] = @"inputScale";
    long long v4 = +[NSNumber numberWithDouble:a2];
    v8[1] = @"inputAspectRatio";
    v9[0] = v4;
    v9[1] = &off_15338;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    uint64_t v6 = [v3 imageByApplyingFilter:@"CILanczosScaleTransform" withInputParameters:v5];

    id v3 = (id)v6;
  }
  return v3;
}

void sub_AAF8(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_AB2C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_AB54(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t sub_AB60()
{
  if (qword_18E00 != -1) {
    dispatch_once(&qword_18E00, &stru_14580);
  }
  return qword_18DF8;
}

void sub_ABA4(id a1)
{
  qword_18DF8 = (uint64_t)os_log_create("com.apple.coreimage", "filter");
}

void sub_AC28(id a1)
{
  id v1 = objc_alloc_init((Class)NSCache);
  id v2 = (void *)qword_18E08;
  qword_18E08 = (uint64_t)v1;

  [(id)qword_18E08 setName:@"com.apple.CIIF_EspressoWrapper.nscache"];
  [(id)qword_18E08 setCountLimit:8];
  id v3 = (void *)qword_18E08;
  [v3 setEvictsObjectsWhenApplicationEntersBackground:1];
}

void sub_AFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_B0C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 78;
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v4 = sub_B35C(10007);
    if (v4 || (uint64_t v4 = sub_B35C(5)) != 0)
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      id v5 = [*(id *)(a1 + 32) path];
      id v6 = [v5 UTF8String];
      uint64_t v21 = 0;
      CGAffineTransform v22 = &v21;
      uint64_t v23 = 0x2020000000;
      double v7 = (uint64_t (*)(uint64_t, void, id, uint64_t *))off_18E38;
      CGRect v24 = off_18E38;
      if (!off_18E38)
      {
        uint64_t v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472;
        CGAffineTransform v18 = sub_C0CC;
        double v19 = &unk_14678;
        CGRect v20 = &v21;
        double v8 = (void *)sub_BEC0();
        v22[3] = (uint64_t)dlsym(v8, "espresso_create_plan_and_load_network");
        off_18E38 = *(_UNKNOWN **)(v20[1] + 24);
        double v7 = (uint64_t (*)(uint64_t, void, id, uint64_t *))v22[3];
      }
      _Block_object_dispose(&v21, 8);
      if (!v7) {
        sub_C5E8();
      }
      uint64_t v9 = v7(v4, 0, v6, &v14);

      if (v9)
      {
        uint64_t v21 = 0;
        CGAffineTransform v22 = &v21;
        uint64_t v23 = 0x2020000000;
        CGFloat v10 = (unsigned int (*)(uint64_t, uint64_t))off_18E40;
        CGRect v24 = off_18E40;
        if (!off_18E40)
        {
          uint64_t v16 = _NSConcreteStackBlock;
          uint64_t v17 = 3221225472;
          CGAffineTransform v18 = sub_C11C;
          double v19 = &unk_14678;
          CGRect v20 = &v21;
          CGRect v11 = (void *)sub_BEC0();
          CGFloat v12 = dlsym(v11, "espresso_plan_submit_set_multiple_buffering");
          *(void *)(v20[1] + 24) = v12;
          off_18E40 = *(_UNKNOWN **)(v20[1] + 24);
          CGFloat v10 = (unsigned int (*)(uint64_t, uint64_t))v22[3];
        }
        _Block_object_dispose(&v21, 8);
        if (!v10) {
          sub_C660();
        }
        if (!v10(v9, 8))
        {
          CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
          printf("load time: %g\n", v13 - Current);
          [*(id *)(a1 + 32) setPlanIdx:v15];
          [*(id *)(a1 + 32) setPlan:v9];
          [*(id *)(a1 + 32) setCtx:v4];
          *(unsigned char *)(*(void *)(a1 + 32) + 48) = 89;
        }
      }
    }
  }
}

void sub_B340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_B35C(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t, uint64_t))off_18E30;
  double v8 = off_18E30;
  if (!off_18E30)
  {
    id v3 = (void *)sub_BEC0();
    v6[3] = (uint64_t)dlsym(v3, "espresso_create_context");
    off_18E30 = (_UNKNOWN *)v6[3];
    id v2 = (uint64_t (*)(uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    sub_C6D8();
  }
  return v2(a1, 0xFFFFFFFFLL);
}

void sub_B450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_B52C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 49))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 49) = 78;
    double Current = CFAbsoluteTimeGetCurrent();
    id v4 = [*(id *)(v2 + 32) plan];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v5 = (uint64_t (*)(id))off_18E48;
    CGRect v11 = off_18E48;
    if (!off_18E48)
    {
      id v6 = (void *)sub_BEC0();
      void v9[3] = (uint64_t)dlsym(v6, "espresso_plan_build");
      off_18E48 = (_UNKNOWN *)v9[3];
      uint64_t v5 = (uint64_t (*)(id))v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v5) {
      sub_C750();
    }
    uint64_t result = v5(v4);
    if (!result)
    {
      CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent();
      uint64_t result = printf("build time: %g\n", v7 - Current);
      *(unsigned char *)(*(void *)(v2 + 32) + 49) = 89;
    }
  }
  return result;
}

void sub_B674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_B8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BD94(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(int *)(a2 + 4);
    if (v2)
    {
      id v4 = +[NSError errorWithDomain:@"com.apple.rawexpose.espressowrapper" code:v2 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void *sub_BE70(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_plan_destroy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E18 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_BEC0()
{
  v2[0] = 0;
  if (!qword_18E20)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_BFB8;
    v2[4] = &unk_144E0;
    v2[5] = v2;
    long long v3 = off_14698;
    uint64_t v4 = 0;
    qword_18E20 = _sl_dlopen();
  }
  uint64_t v0 = qword_18E20;
  if (!qword_18E20) {
    sub_CA20(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t sub_BFB8()
{
  uint64_t result = _sl_dlopen();
  qword_18E20 = result;
  return result;
}

void *sub_C02C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_context_destroy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E28 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C07C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_create_context");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E30 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C0CC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_create_plan_and_load_network");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C11C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_plan_submit_set_multiple_buffering");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E40 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C16C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_plan_build");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E48 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C1BC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_network_bind_direct_cvpixelbuffer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E50 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C20C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_get_status_string");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E58 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C25C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_network_query_blob_shape");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E60 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C2AC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_plan_execute_sync");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E68 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_C2FC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_BEC0();
  uint64_t result = dlsym(v2, "espresso_plan_submit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_18E70 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_C34C(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: could not load the inpaint model specified by the inputModel argument path: %{public}@\n", buf, 0x16u);
}

void sub_C3BC()
{
  sub_AB48();
  sub_AB54(v1, v2, 5.8381e-34);
  sub_AB2C(&dword_0, v3, v4, "%{public}@: CIInpaintFilter inputModel value should be a MLModel object.", v5);
}

void sub_C400()
{
  sub_AB48();
  sub_AB54(v1, v2, 5.8381e-34);
  sub_AB2C(&dword_0, v3, v4, "%{public}@: could not load the default inpaint model.\n", v5);
}

void sub_C444()
{
  sub_AB48();
  sub_AB54(v1, v2, 5.8381e-34);
  sub_AB2C(&dword_0, v3, v4, "%{public}@: could not load the default refinement model.\n", v5);
}

void sub_C488()
{
  sub_AB48();
  sub_AB54(v1, v2, 5.8381e-34);
  sub_AB2C(&dword_0, v3, v4, "%{public}@: could not determine the size of the inpaint model.\n", v5);
}

void sub_C4CC()
{
}

void sub_C4F8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_plan_destroy(espresso_plan_ref_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 51, @"%s", dlerror());

  __break(1u);
}

void sub_C570()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_context_destroy(espresso_context_ref_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 59, @"%s", dlerror());

  __break(1u);
}

void sub_C5E8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_plan_ref_t soft_espresso_create_plan_and_load_network(espresso_context_ref_t, int, const char *, espresso_network_t *)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 103, @"%s", dlerror());

  __break(1u);
}

void sub_C660()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_plan_submit_set_multiple_buffering(espresso_plan_ref_t, size_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 94, @"%s", dlerror());

  __break(1u);
}

void sub_C6D8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_context_ref_t soft_espresso_create_context(espresso_engine_t, int)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 27, @"%s", dlerror());

  __break(1u);
}

void sub_C750()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_plan_build(espresso_plan_ref_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 35, @"%s", dlerror());

  __break(1u);
}

void sub_C7C8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_network_bind_direct_cvpixelbuffer(espresso_network_t, const char *, void *)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 112, @"%s", dlerror());

  __break(1u);
}

void sub_C840()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"const char *soft_espresso_get_status_string(espresso_return_status_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 67, @"%s", dlerror());

  __break(1u);
}

void sub_C8B8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_network_query_blob_shape(espresso_network_t, const char *, size_t *, size_t *)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 76, @"%s", dlerror());

  __break(1u);
}

void sub_C930()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_plan_execute_sync(espresso_plan_ref_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 43, @"%s", dlerror());

  __break(1u);
}

void sub_C9A8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"espresso_return_status_t soft_espresso_plan_submit(espresso_plan_ref_t, __strong dispatch_queue_t, void (^__strong)(espresso_error_info_t *))"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EspressoWrapper.m", 85, @"%s", dlerror());

  __break(1u);
}

void sub_CA20(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *EspressoLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EspressoWrapper.m", 17, @"%s", *a1);

  __break(1u);
  CFAbsoluteTimeGetCurrent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return _CGColorSpaceGetTypeID();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  return _CGRectStandardize(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return _IOSurfaceGetHeight(buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPixelFormat(buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return _IOSurfaceGetWidth(buffer);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_blackImage(void *a1, const char *a2, ...)
{
  return [a1 blackImage];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildAsync(void *a1, const char *a2, ...)
{
  return [a1 buildAsync];
}

id objc_msgSend_buildWait(void *a1, const char *a2, ...)
{
  return [a1 buildWait];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultExcludeMaskSurroundMultiplier(void *a1, const char *a2, ...)
{
  return [a1 defaultExcludeMaskSurroundMultiplier];
}

id objc_msgSend_defaultFeatherAmount(void *a1, const char *a2, ...)
{
  return [a1 defaultFeatherAmount];
}

id objc_msgSend_defaultMaskDilateSize(void *a1, const char *a2, ...)
{
  return [a1 defaultMaskDilateSize];
}

id objc_msgSend_defaultMaskToSurroundRatio(void *a1, const char *a2, ...)
{
  return [a1 defaultMaskToSurroundRatio];
}

id objc_msgSend_defaultRefinementModel(void *a1, const char *a2, ...)
{
  return [a1 defaultRefinementModel];
}

id objc_msgSend_defaultRefinementMultipass(void *a1, const char *a2, ...)
{
  return [a1 defaultRefinementMultipass];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dilateSize(void *a1, const char *a2, ...)
{
  return [a1 dilateSize];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dumpInpaintImages(void *a1, const char *a2, ...)
{
  return [a1 dumpInpaintImages];
}

id objc_msgSend_emptyImage(void *a1, const char *a2, ...)
{
  return [a1 emptyImage];
}

id objc_msgSend_estimateFinalQuality(void *a1, const char *a2, ...)
{
  return [a1 estimateFinalQuality];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_featherAmount(void *a1, const char *a2, ...)
{
  return [a1 featherAmount];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getMaskMarginFactor(void *a1, const char *a2, ...)
{
  return [a1 getMaskMarginFactor];
}

id objc_msgSend_getRefineQualityBar(void *a1, const char *a2, ...)
{
  return [a1 getRefineQualityBar];
}

id objc_msgSend_imageByClampingToExtent(void *a1, const char *a2, ...)
{
  return [a1 imageByClampingToExtent];
}

id objc_msgSend_imageByInsertingIntermediate(void *a1, const char *a2, ...)
{
  return [a1 imageByInsertingIntermediate];
}

id objc_msgSend_imageConstraint(void *a1, const char *a2, ...)
{
  return [a1 imageConstraint];
}

id objc_msgSend_inputExcludeMask(void *a1, const char *a2, ...)
{
  return [a1 inputExcludeMask];
}

id objc_msgSend_inputExcludeMaskSurroundMultiplier(void *a1, const char *a2, ...)
{
  return [a1 inputExcludeMaskSurroundMultiplier];
}

id objc_msgSend_inputImage(void *a1, const char *a2, ...)
{
  return [a1 inputImage];
}

id objc_msgSend_inputRefinementModel(void *a1, const char *a2, ...)
{
  return [a1 inputRefinementModel];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_internalCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 internalCommandQueue];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_loadAsync(void *a1, const char *a2, ...)
{
  return [a1 loadAsync];
}

id objc_msgSend_loadModelConfig(void *a1, const char *a2, ...)
{
  return [a1 loadModelConfig];
}

id objc_msgSend_loadWait(void *a1, const char *a2, ...)
{
  return [a1 loadWait];
}

id objc_msgSend_maskCoverage(void *a1, const char *a2, ...)
{
  return [a1 maskCoverage];
}

id objc_msgSend_maskToSurroundRatio(void *a1, const char *a2, ...)
{
  return [a1 maskToSurroundRatio];
}

id objc_msgSend_metalContext(void *a1, const char *a2, ...)
{
  return [a1 metalContext];
}

id objc_msgSend_metalTexture(void *a1, const char *a2, ...)
{
  return [a1 metalTexture];
}

id objc_msgSend_multiArrayConstraint(void *a1, const char *a2, ...)
{
  return [a1 multiArrayConstraint];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pixelsHigh(void *a1, const char *a2, ...)
{
  return [a1 pixelsHigh];
}

id objc_msgSend_plan(void *a1, const char *a2, ...)
{
  return [a1 plan];
}

id objc_msgSend_planIdx(void *a1, const char *a2, ...)
{
  return [a1 planIdx];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return [a1 shape];
}

id objc_msgSend_smallBlurSize(void *a1, const char *a2, ...)
{
  return [a1 smallBlurSize];
}

id objc_msgSend_surface(void *a1, const char *a2, ...)
{
  return [a1 surface];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return [a1 userDefaults];
}

id objc_msgSend_writePNGRepresentationOfImage_toURL_format_colorSpace_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:");
}