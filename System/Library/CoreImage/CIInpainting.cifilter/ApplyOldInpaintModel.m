@interface ApplyOldInpaintModel
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)apply:(id)a3 mask:(id)a4 tileSize:(int)a5 model:(id)a6;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation ApplyOldInpaintModel

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v60 = a3;
  id v61 = a4;
  id v8 = a5;
  v9 = [v8 metalTexture];
  if (!v9) {
    __assert_rtn("+[ApplyOldInpaintModel processWithInputs:arguments:output:error:]", "CIInpaintFilter.mm", 700, "outputSPI.metalTexture");
  }

  v62 = [v61 objectForKeyedSubscript:@"model"];
  v10 = [v61 objectForKeyedSubscript:@"size"];
  signed int v11 = [v10 intValue];

  v12 = [v8 metalContext];
  v59 = [v60 objectAtIndexedSubscript:0];
  v58 = [v60 objectAtIndexedSubscript:1];
  v13 = sub_1F5C(v59);
  v57 = sub_1F5C(v58);
  v55 = sub_2104(v13);
  v56 = sub_2104(v57);
  size_t v14 = v11;
  size_t v15 = 3 * v11;
  v16 = sub_2340(v11, v15);
  v17 = sub_2340(v14, v15);
  CVPixelBufferRef cf = sub_2340(v14, v15);
  v18 = [v8 metalTexture];
  v19 = [v18 device];
  v54 = sub_2464(v19, v16);

  v20 = [v8 metalTexture];
  v21 = [v20 device];
  v22 = sub_2464(v21, v17);

  v23 = [v12 internalCommandQueue];
  v24 = [v23 commandBuffer];

  sub_25B8(v12, v55, v54, v24);
  sub_25B8(v12, v56, v22, v24);
  [v24 commit];
  if ([v62 bind:"image" buffer:v16]) {
    goto LABEL_6;
  }
  if ([v62 bind:"mask" buffer:v17]) {
    goto LABEL_6;
  }
  if ([v62 bind:"output" buffer:cf]) {
    goto LABEL_6;
  }
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_2824;
  v63[3] = &unk_144C0;
  id v64 = v8;
  unsigned int v25 = [v62 executeAsync:v63];

  if (v25) {
    goto LABEL_6;
  }
  CIImageOption v67 = kCIImageColorSpace;
  v51 = +[NSNull null];
  v68 = v51;
  v50 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  id v31 = +[CIImage imageWithCVImageBuffer:cf options:v50];
  v52 = +[CIKernel cachedKernelWithString:@"kernel vec4 planarToInterleaved(sampler s, float tileSize) { vec2 dc = destCoord() dc.double y = clamp(dc.y, 0.0, tileSize); vec4 rgba = vec4(1.0); vec2 delta = vec2(0.0, tileSize); rgba.r = sample(s, samplerTransform(s, dc + delta*0.0)).x; rgba.g = sample(s, samplerTransform(s, dc + delta*1.0)).x; rgba.b = sample(s, samplerTransform(s, dc + delta*2.0)).x; return rgba; }"];;
  if (v31)
  {
    v32 = v31;
    [v31 extent];
    if (CGRectIsInfinite(v70))
    {
      id v26 = 0;
    }
    else
    {
      [v31 extent];
      uint64_t v34 = v33;
      [v31 extent];
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGAffineTransformMakeScale(&v66, 1.0, 0.333333333);
      v71.origin.double x = v36;
      v71.origin.double y = v38;
      v71.size.double width = v40;
      v71.size.double height = v42;
      CGRect v72 = CGRectApplyAffineTransform(v71, &v66);
      double x = v72.origin.x;
      double y = v72.origin.y;
      double width = v72.size.width;
      double height = v72.size.height;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_A320;
      v65[3] = &unk_14500;
      v65[4] = v34;
      v69[0] = v31;
      v49 = +[NSNumber numberWithDouble:v72.size.height];
      v69[1] = v49;
      v47 = +[NSArray arrayWithObjects:v69 count:2];
      v48 = objc_msgSend(v52, "applyWithExtent:roiCallback:arguments:", v65, v47, x, y, width, height);

      id v31 = v48;
      id v26 = v31;
    }
  }
  else
  {
    v32 = 0;
    id v26 = 0;
  }

  if (!v26) {
LABEL_6:
  }
    id v26 = v13;
  id v27 = objc_alloc((Class)CIRenderDestination);
  id v28 = objc_msgSend(v27, "initWithIOSurface:", objc_msgSend(v8, "surface"));

  [v28 setFlipped:1];
  [v28 setColorSpace:0];
  if (v26)
  {
    [v26 extent];
    id v29 = objc_msgSend(v12, "startTaskToRender:fromRect:toDestination:atPoint:error:", v26, v28, 0);
  }
  CFRelease(v16);
  CFRelease(v17);
  CFRelease(cf);

  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return kCIFormatRGBAh;
}

+ (int)outputFormat
{
  return kCIFormatRGBAh;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"size", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  int v6 = [v5 intValue];

  double v7 = (double)v6;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = (double)v6;
  result.size.double height = v10;
  result.size.double width = v7;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (id)apply:(id)a3 mask:(id)a4 tileSize:(int)a5 model:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v37 = a3;
  id v9 = a4;
  id v35 = a6;
  v40[0] = @"model";
  v40[1] = @"size";
  v41[0] = v35;
  double v10 = +[NSNumber numberWithInt:v7];
  v41[1] = v10;
  signed int v11 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  v12 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
  id v13 = v37;
  size_t v14 = [v13 imageByColorMatchingWorkingSpaceToColorSpace:v12];

  size_t v15 = [v9 imageByApplyingFilter:@"CIColorThreshold" withInputParameters:&off_15470];

  id v16 = v15;
  v42[0] = @"inputRVector";
  v17 = +[CIVector vectorWithX:-1.0 Y:0.0 Z:0.0 W:1.0];
  v43[0] = v17;
  v42[1] = @"inputGVector";
  v18 = +[CIVector vectorWithX:0.0 Y:-1.0 Z:0.0 W:1.0];
  v43[1] = v18;
  v42[2] = @"inputBVector";
  v19 = +[CIVector vectorWithX:0.0 Y:0.0 Z:-1.0 W:1.0];
  v43[2] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  v21 = [v16 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v20];

  [v14 extent];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v39[0] = v14;
  v39[1] = v21;
  v30 = +[NSArray arrayWithObjects:v39 count:2];
  id v38 = 0;
  id v31 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v30, v11, &v38, v23, v25, v27, v29);
  id v32 = v38;

  uint64_t v33 = [v31 imageByColorMatchingColorSpaceToWorkingSpace:v12];

  CGColorSpaceRelease(v12);
  return v33;
}

@end