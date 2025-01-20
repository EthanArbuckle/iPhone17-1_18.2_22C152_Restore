@interface CIConvolutionProcessor
+ (BOOL)allowCompressedInputsAndOutputs;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyBoxToImage:(id)a3 width:(int)a4 height:(int)a5;
+ (id)applyConToImage:(id)a3 width:(int)a4 height:(int)a5 bias:(double)a6 weights:(id)a7;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIConvolutionProcessor

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v10 = (void *)[a4 objectForKeyedSubscript:@"w"];
  v11 = (void *)[a4 objectForKeyedSubscript:@"h"];
  int v12 = [v10 intValue];
  int v13 = v12 - 1;
  if (v12 < 1) {
    int v13 = v12;
  }
  int v14 = -(v13 >> 1);
  int v15 = [v11 intValue];
  int v16 = v15 - 1;
  if (v15 < 1) {
    int v16 = v15;
  }
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;

  return CGRectInset(*(CGRect *)&v17, (double)v14, (double)-(v16 >> 1));
}

+ (id)logDescription:(id)a3
{
  if ([a3 objectForKeyedSubscript:@"weights"]) {
    return (id)[NSString stringWithFormat:@"CIConvolutionProcessor-%@x%@", objc_msgSend(a3, "objectForKeyedSubscript:", @"w", objc_msgSend(a3, "objectForKeyedSubscript:", @"h"];
  }
  else {
    return @"CIConvolutionProcessor-Box";
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[a4 objectForKeyedSubscript:@"w"];
  v10 = (void *)[a4 objectForKeyedSubscript:@"h"];
  v11 = (void *)[a4 objectForKeyedSubscript:@"bias"];
  int v12 = (void *)[a4 objectForKeyedSubscript:@"weights"];
  int v13 = (void *)[a3 objectAtIndexedSubscript:0];
  unsigned int v14 = [v9 intValue];
  unsigned int v15 = [v10 intValue];
  if (v12)
  {
    MEMORY[0x1F4188790]();
    CGFloat v17 = &v83[-v16];
    convert_weights((const double *)[v12 _values], (float *)&v83[-v16], v14, v15);
    if (CI_FLIP_IMAGE_PROCESSOR() && v15 >= 2)
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = v14 * (v15 - 1);
      do
      {
        int v21 = v18;
        int v22 = v20;
        uint64_t v23 = v14;
        if (v14)
        {
          do
          {
            int v24 = *(_DWORD *)&v17[4 * v21];
            *(_DWORD *)&v17[4 * v21] = *(_DWORD *)&v17[4 * v22];
            *(_DWORD *)&v17[4 * v22++] = v24;
            ++v21;
            --v23;
          }
          while (v23);
        }
        ++v19;
        v20 -= v14;
        v18 += v14;
      }
      while (v19 != v15 >> 1);
    }
    v25 = (void *)[a5 metalCommandBuffer];
    uint64_t v26 = [v13 metalTexture];
    uint64_t v27 = [a5 metalTexture];
    [v13 region];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    [a5 region];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    if (v11)
    {
      [v11 doubleValue];
      float v45 = v44;
    }
    else
    {
      float v45 = 0.0;
    }
    float v84 = v45;
    if (v25)
    {
      v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35568]), "initWithDevice:kernelWidth:kernelHeight:weights:", objc_msgSend(v25, "device"), v14, v15, v17);
      if (v70)
      {
        v71 = v70;
        [v70 setOptions:2];
        v90.origin.int x = v29;
        v90.origin.int y = v31;
        v90.size.CGFloat width = v33;
        v90.size.unint64_t height = v35;
        if (CGRectIsNull(v90))
        {
          LODWORD(height) = 0;
          int y = 0x7FFFFFFF;
          int x = 0x7FFFFFFF;
        }
        else
        {
          v91.origin.int x = v29;
          v91.origin.int y = v31;
          v91.size.CGFloat width = v33;
          v91.size.unint64_t height = v35;
          if (CGRectIsInfinite(v91))
          {
            int y = -2147483647;
            LODWORD(height) = -1;
            int x = -2147483647;
          }
          else
          {
            v93.origin.int x = v29;
            v93.origin.int y = v31;
            v93.size.CGFloat width = v33;
            v93.size.unint64_t height = v35;
            CGRect v94 = CGRectInset(v93, 0.000001, 0.000001);
            CGRect v95 = CGRectIntegral(v94);
            int x = (int)v95.origin.x;
            int y = (int)v95.origin.y;
            unint64_t height = (unint64_t)v95.size.height;
          }
        }
        v96.origin.int x = v37;
        v96.origin.int y = v39;
        v96.size.CGFloat width = v41;
        v96.size.unint64_t height = v43;
        if (CGRectIsNull(v96))
        {
          LODWORD(v75) = 0;
          int v76 = 0x7FFFFFFF;
          int v77 = 0x7FFFFFFF;
        }
        else
        {
          v97.origin.int x = v37;
          v97.origin.int y = v39;
          v97.size.CGFloat width = v41;
          v97.size.unint64_t height = v43;
          if (CGRectIsInfinite(v97))
          {
            int v76 = -2147483647;
            LODWORD(v75) = -1;
            int v77 = -2147483647;
          }
          else
          {
            v98.origin.int x = v37;
            v98.origin.int y = v39;
            v98.size.CGFloat width = v41;
            v98.size.unint64_t height = v43;
            CGRect v99 = CGRectInset(v98, 0.000001, 0.000001);
            CGRect v100 = CGRectIntegral(v99);
            int v77 = (int)v100.origin.x;
            int v76 = (int)v100.origin.y;
            unint64_t v75 = (unint64_t)v100.size.height;
          }
        }
        uint64_t v85 = v77 - x;
        uint64_t v86 = y + (int)height - ((int)v75 + v76);
        uint64_t v87 = 0;
        [v71 setOffset:&v85];
        *(float *)&double v78 = v84;
        [v71 setBias:v78];
        [v71 encodeToCommandBuffer:v25 sourceTexture:v26 destinationTexture:v27];
      }
    }
  }
  else
  {
    v46 = (void *)[a5 metalCommandBuffer];
    uint64_t v47 = [v13 metalTexture];
    uint64_t v48 = [a5 metalTexture];
    [v13 region];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    [a5 region];
    if (v46)
    {
      CGFloat v61 = v57;
      CGFloat v62 = v58;
      CGFloat v63 = v59;
      CGFloat v64 = v60;
      v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35550]), "initWithDevice:kernelWidth:kernelHeight:", objc_msgSend(v46, "device"), v14, v15);
      if (v65)
      {
        v66 = v65;
        [v65 setOptions:2];
        v89.origin.int x = v50;
        v89.origin.int y = v52;
        v89.size.CGFloat width = v54;
        v89.size.unint64_t height = v56;
        if (CGRectIsNull(v89))
        {
          LODWORD(v67) = 0;
          int v68 = 0x7FFFFFFF;
          int v69 = 0x7FFFFFFF;
        }
        else
        {
          v92.origin.int x = v50;
          v92.origin.int y = v52;
          v92.size.CGFloat width = v54;
          v92.size.unint64_t height = v56;
          if (CGRectIsInfinite(v92))
          {
            int v68 = -2147483647;
            LODWORD(v67) = -1;
            int v69 = -2147483647;
          }
          else
          {
            v101.origin.int x = v50;
            v101.origin.int y = v52;
            v101.size.CGFloat width = v54;
            v101.size.unint64_t height = v56;
            CGRect v102 = CGRectInset(v101, 0.000001, 0.000001);
            CGRect v103 = CGRectIntegral(v102);
            int v69 = (int)v103.origin.x;
            int v68 = (int)v103.origin.y;
            unint64_t v67 = (unint64_t)v103.size.height;
          }
        }
        v104.origin.int x = v61;
        v104.origin.int y = v62;
        v104.size.CGFloat width = v63;
        v104.size.unint64_t height = v64;
        if (CGRectIsNull(v104))
        {
          LODWORD(v80) = 0;
          int v81 = 0x7FFFFFFF;
          int v82 = 0x7FFFFFFF;
        }
        else
        {
          v105.origin.int x = v61;
          v105.origin.int y = v62;
          v105.size.CGFloat width = v63;
          v105.size.unint64_t height = v64;
          if (CGRectIsInfinite(v105))
          {
            int v81 = -2147483647;
            LODWORD(v80) = -1;
            int v82 = -2147483647;
          }
          else
          {
            v106.origin.int x = v61;
            v106.origin.int y = v62;
            v106.size.CGFloat width = v63;
            v106.size.unint64_t height = v64;
            CGRect v107 = CGRectInset(v106, 0.000001, 0.000001);
            CGRect v108 = CGRectIntegral(v107);
            int v82 = (int)v108.origin.x;
            int v81 = (int)v108.origin.y;
            unint64_t v80 = (unint64_t)v108.size.height;
          }
        }
        uint64_t v85 = v82 - v69;
        uint64_t v86 = v68 + (int)v67 - ((int)v80 + v81);
        uint64_t v87 = 0;
        [v66 setOffset:&v85];
        [v66 encodeToCommandBuffer:v46 sourceTexture:v47 destinationTexture:v48];
      }
    }
  }
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (int)outputFormat
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

+ (id)applyConToImage:(id)a3 width:(int)a4 height:(int)a5 bias:(double)a6 weights:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  v28[1] = *MEMORY[0x1E4F143B8];
  if (fabs(a6) >= 1.0e-10)
  {
    double x = *MEMORY[0x1E4F1DB10];
    double y = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  else
  {
    [a3 extent];
    if ((int)v10 >= 0) {
      int v17 = v10;
    }
    else {
      int v17 = v10 + 1;
    }
    double v18 = (double)-(v17 >> 1);
    if ((int)v9 >= 0) {
      int v19 = v9;
    }
    else {
      int v19 = v9 + 1;
    }
    CGRect v29 = CGRectInset(*(CGRect *)&v13, v18, (double)-(v19 >> 1));
    double x = v29.origin.x;
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
  }
  v28[0] = a3;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v27[0] = objc_msgSend(NSNumber, "numberWithInt:", v10, @"w");
  v26[1] = @"h";
  v27[1] = [NSNumber numberWithInt:v9];
  v26[2] = @"bias";
  v26[3] = @"weights";
  v27[2] = [NSNumber numberWithDouble:a6];
  v27[3] = a7;
  return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v24, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 4), 0, x, y, width, height);
}

+ (id)applyBoxToImage:(id)a3 width:(int)a4 height:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  if ((int)v6 >= 0) {
    int v13 = v6;
  }
  else {
    int v13 = v6 + 1;
  }
  double v14 = (double)-(v13 >> 1);
  if ((int)v5 >= 0) {
    int v15 = v5;
  }
  else {
    int v15 = v5 + 1;
  }
  CGRect v25 = CGRectInset(*(CGRect *)&v9, v14, (double)-(v15 >> 1));
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  v24[0] = a3;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v22[1] = @"h";
  v23[0] = objc_msgSend(NSNumber, "numberWithInt:", v6, @"w");
  v23[1] = [NSNumber numberWithInt:v5];
  return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v20, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 2), 0, x, y, width, height);
}

@end