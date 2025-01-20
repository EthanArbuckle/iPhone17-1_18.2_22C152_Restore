@interface CIPortraitToothMaskProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
- (CIImage)inputImage;
- (NSDictionary)inputFaceLandmarks;
- (void)setInputFaceLandmarks:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIPortraitToothMaskProcessor

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageExtent"), "CGRectValue");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  unsigned __int8 v17 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"useMetal"), "BOOLValue");
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"teethROI"), "CGRectValue");
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  if ((CGRectIsIntegral() & 1) == 0) {
    sub_4C258();
  }
  double v69 = v21;
  CGFloat v70 = v19;
  CGFloat v71 = v23;
  id v26 = [a4 objectForKeyedSubscript:@"faceLandmarks"];
  uint64_t v27 = self;
  id v28 = sub_3E090(v27, (uint64_t)v26);
  float64x2_t v82 = 0u;
  memset(&v83, 0, sizeof(v83));
  float64x2_t v80 = 0u;
  float64x2_t v81 = 0u;
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageTransformN1"), "getBytes:length:", &v83, 48);
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageTransform1N"), "getBytes:length:", &v80, 48);
  CGAffineTransform v84 = v83;
  v100.origin.double x = v10;
  v100.origin.double y = v12;
  v100.size.double width = v14;
  v100.size.double height = v16;
  CGRect v101 = CGRectApplyAffineTransform(v100, &v84);
  double x = v101.origin.x;
  double y = v101.origin.y;
  double height = v101.size.height;
  double width = v101.size.width;
  id v31 = [a3 objectAtIndexedSubscript:0];
  [v31 region];
  double v76 = v33;
  double v77 = v32;
  double v35 = v34;
  double v37 = v36;
  [a5 region];
  double v67 = v38;
  double v68 = v39;
  double v41 = v40;
  double v43 = v42;
  long long v78 = 0u;
  float64x2_t v79 = 0u;
  if ((sub_294F0([v28 objectForKeyedSubscript:@"faceBoundingBox"], &v78) & 1) == 0) {
    sub_4C22C();
  }
  uint64_t v44 = 0;
  double v45 = v16 + -1.0;
  v46.f64[0] = width;
  double v47 = x + *(double *)&v78 * width;
  double v48 = v45 - v35 - v37;
  double v49 = v45 - v41 - v43;
  *(double *)&long long v78 = v47;
  *((double *)&v78 + 1) = y + *((double *)&v78 + 1) * height;
  v46.f64[1] = height;
  float64x2_t v79 = vmulq_f64(v46, v79);
  uint64_t v50 = 4;
  do
  {
    v84.a = 0.0;
    v84.b = 0.0;
    id v51 = objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", @"innerLips"), "objectAtIndex:", v44);
    if ((sub_295D4(v51, &v84.a, *(double *)&v78, *((double *)&v78 + 1), v79.f64[0], v79.f64[1]) & 1) == 0) {
      sub_4C200();
    }
    *((float64x2_t *)&v94 + v44) = vaddq_f64(v82, vmlaq_n_f64(vmulq_n_f64(v81, v84.b), v80, v84.a));
    uint64_t v52 = v44 + 3;
    id v53 = objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", @"innerLips"), "objectAtIndex:", v52);
    if ((sub_295D4(v53, &v84.a, *(double *)&v78, *((double *)&v78 + 1), v79.f64[0], v79.f64[1]) & 1) == 0) {
      sub_4C1D4();
    }
    *(float64x2_t *)&v93[v50] = vaddq_f64(v82, vmlaq_n_f64(vmulq_n_f64(v81, v84.b), v80, v84.a));
    v50 -= 2;
    uint64_t v44 = v52 - 2;
  }
  while (v44 != 3);
  double v75 = v43;
  double v54 = *(double *)v93;
  double v55 = *(double *)&v93[1];
  v84.a = v54 + (v96 - v54) * 0.600000024;
  v84.b = v45 - (v55 + (v97 - v55) * 0.600000024);
  double v56 = *(double *)&v93[2];
  double v57 = *(double *)&v93[3];
  v84.c = v56 + (v96 - v56) * 0.600000024;
  v84.d = v45 - (v57 + (v97 - v57) * 0.600000024);
  double v58 = *(double *)&v93[4];
  double v59 = *(double *)&v93[5];
  v84.tdouble x = v58 + (v96 - v58) * 0.600000024;
  v84.tdouble y = v45 - (v59 + (v97 - v59) * 0.600000024);
  double v85 = v54 + (v94 - v54) * 0.600000024;
  double v86 = v45 - (v55 + (v95 - v55) * 0.600000024);
  double v87 = v56 + (v94 - v56) * 0.600000024;
  double v88 = v45 - (v57 + (v95 - v57) * 0.600000024);
  double v89 = v56 + (v98 - v56) * 0.600000024;
  double v90 = v45 - (v57 + (v99 - v57) * 0.600000024);
  double v91 = v58 + (v98 - v58) * 0.600000024;
  double v92 = v45 - (v59 + (v99 - v59) * 0.600000024);
  v102.origin.double y = v45 - v69 - v25;
  v102.origin.double x = v70;
  v102.size.double width = v71;
  v102.size.double height = v25;
  v106.origin.double x = v77;
  double v73 = v48;
  v106.origin.double y = v48;
  v106.size.double width = v76;
  v106.size.double height = v37;
  CGRect v103 = CGRectIntersection(v102, v106);
  CGFloat v60 = v103.origin.x;
  CGFloat v61 = v103.origin.y;
  CGFloat v62 = v103.size.width;
  CGFloat v63 = v103.size.height;
  if (v17)
  {
    v64 = -[MetalFaceMask initForDevice:]([MetalFaceMask alloc], "initForDevice:", objc_msgSend(objc_msgSend(a5, "metalTexture"), "device"));
    -[CPUFaceMask clearOutputTexture:CommandBuffer:](v64, "clearOutputTexture:CommandBuffer:", [a5 metalTexture], objc_msgSend(a5, "metalCommandBuffer"));
    v104.origin.double x = v60;
    v104.origin.double y = v61;
    v104.size.double width = v62;
    v104.size.double height = v63;
    if (!CGRectIsNull(v104)) {
      -[CPUFaceMask findToothMaskUsingInputTexture:InputRegion:OutputMaskTexture:OutputRegion:TeethBounds:SeedPoints:NumberOfSeedPoints:FillValue:CommandBuffer:](v64, "findToothMaskUsingInputTexture:InputRegion:OutputMaskTexture:OutputRegion:TeethBounds:SeedPoints:NumberOfSeedPoints:FillValue:CommandBuffer:", [v31 metalTexture], objc_msgSend(a5, "metalTexture"), &v84, 7, 255, objc_msgSend(a5, "metalCommandBuffer"), v77, v73, v76, v37, v67, v49, v68, v75, *(void *)&v60, *(void *)&v61,
    }
        *(void *)&v62,
        *(void *)&v63);
  }
  else
  {
    v64 = objc_alloc_init(CPUFaceMask);
    -[CPUFaceMask clearOutputMask:WithBytesPerRow:OutputRegion:](v64, "clearOutputMask:WithBytesPerRow:OutputRegion:", [a5 baseAddress], objc_msgSend(a5, "bytesPerRow"), v67, v49, v68, v75);
    v105.origin.double x = v60;
    v105.origin.double y = v61;
    v105.size.double width = v62;
    v105.size.double height = v63;
    if (!CGRectIsNull(v105))
    {
      LOBYTE(v66) = -1;
      -[CPUFaceMask findToothMaskUsingInputImage:InputBytesPerRow:InputRegion:OutputMask:OutputBytesPerRow:OutputRegion:TeethBounds:SeedPoints:NumberOfSeedPoints:FillValue:](v64, "findToothMaskUsingInputImage:InputBytesPerRow:InputRegion:OutputMask:OutputBytesPerRow:OutputRegion:TeethBounds:SeedPoints:NumberOfSeedPoints:FillValue:", [v31 baseAddress], objc_msgSend(v31, "bytesPerRow"), objc_msgSend(a5, "baseAddress"), objc_msgSend(a5, "bytesPerRow"), &v84, 7, v77, v73, v76, v37, v67, v49, v68, v75, *(void *)&v60, *(void *)&v61,
        *(void *)&v62,
        *(void *)&v63,
        v66);
    }
  }

  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (a3) {
    sub_4C284();
  }
  id v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"teethROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return kCIFormatBGRA8;
}

+ (int)outputFormat
{
  return kCIFormatR8;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSDictionary)inputFaceLandmarks
{
  return self->_inputFaceLandmarks;
}

- (void)setInputFaceLandmarks:(id)a3
{
}

@end