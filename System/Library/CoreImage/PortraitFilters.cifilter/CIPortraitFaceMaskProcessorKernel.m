@interface CIPortraitFaceMaskProcessorKernel
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIPortraitFaceMaskProcessorKernel

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputImageExtent"), "CGRectValue");
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  *(double *)v85 = v9;
  *(double *)&v85[1] = v11;
  *(double *)&v85[2] = v13;
  *(double *)&v85[3] = v15;
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"faceROI"), "CGRectValue");
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v84.origin.CGFloat x = v17;
  v84.origin.CGFloat y = v19;
  v84.size.width = v21;
  v84.size.height = v23;
  if ((CGRectIsIntegral() & 1) == 0) {
    sub_4BD5C();
  }
  v86.origin.CGFloat x = v18;
  v86.origin.CGFloat y = v20;
  v86.size.width = v22;
  v86.size.height = v24;
  unint64_t Width = (unint64_t)CGRectGetWidth(v86);
  v87.origin.CGFloat x = v18;
  v87.origin.CGFloat y = v20;
  v87.size.width = v22;
  v87.size.height = v24;
  double Height = CGRectGetHeight(v87);
  id v26 = [a4 objectForKeyedSubscript:@"faceLandmarks"];
  uint64_t v27 = self;
  v28 = -[FaceLandmarks initWithFaceLandmarks:forImageRect:]([FaceLandmarks alloc], "initWithFaceLandmarks:forImageRect:", sub_3E090(v27, (uint64_t)v26), v10, v12, v14, v16);
  id v29 = [a3 objectAtIndexedSubscript:0];
  [v29 region];
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  v38 = (char *)[v29 baseAddress];
  id v39 = [v29 bytesPerRow];
  v88.origin.CGFloat x = v31;
  v88.origin.CGFloat y = v33;
  v88.size.width = v35;
  v88.size.height = v37;
  unint64_t MaxY = (unint64_t)CGRectGetMaxY(v88);
  v89.origin.CGFloat x = v18;
  v89.origin.CGFloat y = v20;
  v89.size.width = v22;
  v89.size.height = v24;
  v41 = &v38[(MaxY - (unint64_t)CGRectGetMaxY(v89)) * (void)v39];
  v90.origin.CGFloat x = v18;
  v90.origin.CGFloat y = v20;
  v90.size.width = v22;
  v90.size.height = v24;
  unint64_t MinX = (unint64_t)CGRectGetMinX(v90);
  v91.origin.CGFloat x = v31;
  v91.origin.CGFloat y = v33;
  v91.size.width = v35;
  v91.size.height = v37;
  uint64_t v43 = (uint64_t)&v41[4 * (MinX - (unint64_t)CGRectGetMinX(v91))];
  uint64_t v44 = 4 * Width;
  [a5 region];
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  v92.origin.CGFloat x = v18;
  v92.origin.CGFloat y = v20;
  v92.size.width = v22;
  v92.size.height = v24;
  v104.origin.CGFloat x = v46;
  v104.origin.CGFloat y = v48;
  v104.size.width = v50;
  v104.size.height = v52;
  CGRect v93 = CGRectIntersection(v92, v104);
  v105.origin.CGFloat x = v18;
  CGFloat x = v93.origin.x;
  v105.origin.CGFloat y = v20;
  CGFloat y = v93.origin.y;
  v105.size.width = v22;
  CGFloat v55 = v93.size.width;
  v105.size.height = v24;
  CGFloat v56 = v93.size.height;
  CGFloat v82 = v105.origin.y;
  CGFloat v83 = v105.origin.x;
  CGFloat v80 = v105.size.height;
  CGFloat v81 = v105.size.width;
  BOOL v57 = CGRectEqualToRect(v93, v105);
  v58 = 0;
  if (!v57) {
    v58 = +[NSMutableData dataWithLength:v44 * (unint64_t)Height];
  }
  v59 = (char *)[a5 baseAddress];
  id v60 = [a5 bytesPerRow];
  v94.origin.CGFloat x = v46;
  v94.origin.CGFloat y = v48;
  v94.size.width = v50;
  v94.size.height = v52;
  unint64_t v61 = (unint64_t)CGRectGetMaxY(v94);
  v95.origin.CGFloat x = x;
  v95.origin.CGFloat y = y;
  v95.size.width = v55;
  v95.size.height = v56;
  v62 = &v59[(v61 - (unint64_t)CGRectGetMaxY(v95)) * (void)v60];
  v96.origin.CGFloat x = x;
  v96.origin.CGFloat y = y;
  v96.size.width = v55;
  v96.size.height = v56;
  unint64_t v63 = (unint64_t)CGRectGetMinX(v96);
  v97.origin.CGFloat x = v46;
  v97.origin.CGFloat y = v48;
  v97.size.width = v50;
  v97.size.height = v52;
  v64 = &v62[4 * (v63 - (unint64_t)CGRectGetMinX(v97))];
  id v65 = [v29 bytesPerRow];
  if (v57)
  {
    sub_10770(v28, (uint64_t)v85, &v84, v43, (uint64_t)v65, (uint64_t)v64, (uint64_t)[a5 bytesPerRow]);
  }
  else
  {
    sub_10770(v28, (uint64_t)v85, &v84, v43, (uint64_t)v65, (uint64_t)[(NSMutableData *)v58 mutableBytes], v44);
    v66 = (char *)[(NSMutableData *)v58 bytes];
    v98.origin.CGFloat x = v83;
    v98.origin.CGFloat y = v82;
    v98.size.width = v81;
    v98.size.height = v80;
    double v79 = CGRectGetMaxY(v98);
    v99.origin.CGFloat x = x;
    v99.origin.CGFloat y = y;
    v99.size.width = v55;
    v99.size.height = v56;
    double v77 = CGRectGetMaxY(v99);
    v100.origin.CGFloat x = x;
    v100.origin.CGFloat y = y;
    v100.size.width = v55;
    v100.size.height = v56;
    double v76 = CGRectGetMinX(v100);
    v101.origin.CGFloat x = v83;
    v101.origin.CGFloat y = v82;
    v101.size.width = v81;
    v101.size.height = v80;
    double v67 = CGRectGetMinX(v101);
    v102.origin.CGFloat x = x;
    v102.origin.CGFloat y = y;
    v102.size.width = v55;
    v102.size.height = v56;
    unint64_t v68 = (unint64_t)CGRectGetWidth(v102);
    v103.origin.CGFloat x = x;
    v103.origin.CGFloat y = y;
    v103.size.width = v55;
    v103.size.height = v56;
    double v69 = CGRectGetHeight(v103);
    v70 = (char *)[a5 bytesPerRow];
    if (v68)
    {
      unint64_t v71 = (unint64_t)v69;
      if ((unint64_t)v69)
      {
        v72 = v70;
        v73 = &v66[4 * ((unint64_t)v76 - (unint64_t)v67)
                 + ((unint64_t)v79 - (unint64_t)v77) * v44];
        size_t v74 = 4 * v68;
        do
        {
          memcpy(v64, v73, v74);
          v73 += v44;
          v64 = &v72[(void)v64];
          --v71;
        }
        while (v71);
      }
    }
  }
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (a3) {
    sub_4BD88();
  }
  id v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"faceROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return kCIFormatBGRA8;
}

+ (int)outputFormat
{
  return kCIFormatBGRA8;
}

@end