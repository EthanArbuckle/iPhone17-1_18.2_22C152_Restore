@interface CIPortraitEffect
+ (id)customAttributes;
+ (void)checkFeaturesDictionary:(id)a3;
- (CIImage)inputFaceMask;
- (CIImage)inputImage;
- (NSArray)inputFaceLandmarkArray;
- (NSNumber)inputEnrich;
- (NSNumber)inputEyes;
- (NSNumber)inputLocalContrast;
- (NSNumber)inputScale;
- (NSNumber)inputSmooth;
- (NSNumber)inputStrength;
- (NSNumber)inputTeeth;
- (id)backgroundPreviewCubeName;
- (id)backgroundPreviewCubePath;
- (id)cubeColorSpaceName;
- (id)outputImage;
- (id)previewCubeName;
- (id)previewCubePath;
- (id)standbyCubeName;
- (id)standbyCubePath;
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setInputEnrich:(id)a3;
- (void)setInputEyes:(id)a3;
- (void)setInputFaceLandmarkArray:(id)a3;
- (void)setInputFaceMask:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLocalContrast:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputSmooth:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputTeeth:(id)a3;
@end

@implementation CIPortraitEffect

+ (void)checkFeaturesDictionary:(id)a3
{
  if ([a3 sanityCheckStatus]) {
    return;
  }
  if ([a3 objectForKeyedSubscript:@"faceBoundingBox"])
  {
    id v4 = [a3 objectForKeyedSubscript:@"faceBoundingBox"];
    objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", @"x"), "doubleValue");
    float v6 = v5;
    objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", @"y"), "doubleValue");
    float v8 = v7;
    objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", @"w"), "doubleValue");
    float v10 = v9;
    objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", @"h"), "doubleValue");
    *(float *)&double v11 = v11;
    double v12 = v6;
    double v13 = v10;
    double v14 = v8;
    double v15 = *(float *)&v11;
  }
  else
  {
    double v15 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
  }
  memset(&v109, 0, sizeof(v109));
  [a3 imageWidthScale];
  CGFloat v17 = v16;
  [a3 imageHeightScale];
  CGAffineTransformMakeScale(&v109, v17, v18);
  id v95 = a3;
  id v19 = [a3 objectForKeyedSubscript:@"allPoints"];
  id v20 = [v19 count];
  uint64_t v94 = (uint64_t)&v94;
  v23 = __chkstk_darwin((void *)(16 * (void)v20), v20, v21, v22);
  *(void *)&double v107 = &v94 - 2 * (void)v23;
  double v106 = COERCE_DOUBLE(__chkstk_darwin(v26, v23, v24, v25));
  v101 = (float64x2_t *)(&v94 - 2 * *(void *)&v106);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v27 = [v19 countByEnumeratingWithState:&v110 objects:v114 count:16];
  if (v27)
  {
    id v29 = v27;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v111;
    uint64_t v108 = *(void *)&v107 + 8;
    do
    {
      v32 = 0;
      v33 = (void *)(v108 + 16 * v30);
      do
      {
        if (*(void *)v111 != v31) {
          objc_enumerationMutation(v19);
        }
        v34 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v32);
        objc_msgSend(objc_msgSend(v34, "objectForKeyedSubscript:", @"x"), "doubleValue");
        uint64_t v36 = v35;
        objc_msgSend(objc_msgSend(v34, "objectForKeyedSubscript:", @"y"), "doubleValue");
        *(v33 - 1) = v36;
        void *v33 = v37;
        v32 = (char *)v32 + 1;
        v33 += 2;
      }
      while (v29 != v32);
      id v29 = [v19 countByEnumeratingWithState:&v110 objects:v114 count:16];
      v30 += (uint64_t)v32;
    }
    while (v29);
  }
  v38 = v95;
  v39 = v101;
  double v40 = v106;
  if (v106 == 0.0)
  {
LABEL_29:
    [v38 setSanityCheckStatus:1];
    uint64_t v52 = 0;
    float64x2_t v53 = v39[49];
    v114[8] = v39[48];
    v114[9] = v53;
    float64x2_t v115 = v39[50];
    float64x2_t v54 = v39[45];
    v114[4] = v39[44];
    v114[5] = v54;
    float64x2_t v55 = v39[47];
    v114[6] = v39[46];
    v114[7] = v55;
    float64x2_t v56 = v39[41];
    v114[0] = v39[40];
    v114[1] = v56;
    float64x2_t v57 = v39[43];
    v114[2] = v39[42];
    v114[3] = v57;
    double v106 = *((double *)v114 + 1);
    double v107 = *(double *)v114;
    float v58 = *(double *)v114;
    float v59 = *((double *)v114 + 1);
    float v60 = v58;
    float v61 = v59;
    do
    {
      double v62 = *(double *)&v114[v52 + 1];
      double v63 = *((double *)&v114[v52 + 1] + 1);
      if (v62 <= v58) {
        float v58 = v62;
      }
      if (v62 >= v60) {
        float v60 = v62;
      }
      if (v63 <= v59) {
        float v59 = v63;
      }
      if (v63 >= v61) {
        float v61 = v63;
      }
      ++v52;
    }
    while (v52 != 10);
    float v103 = v60;
    float v104 = v58;
    float v105 = v59;
    float64_t v64 = v39[61].f64[0];
    v101 = *(float64x2_t **)&v39[61].f64[1];
    double v102 = v64;
    double v99 = v115.f64[1];
    double v100 = v115.f64[0];
    double v65 = sub_35CA8(v115.f64[0], v115.f64[1], v107);
    double v67 = sub_35D1C(v65, v66);
    double v97 = v68;
    double v98 = v67;
    double v96 = -v68;
    v69 = &v115.f64[1];
    unint64_t v70 = 10;
    double v71 = v102;
    double v72 = v68;
    double v73 = v67;
    double v74 = -v68;
    while (1)
    {
      *(float *)&uint64_t v108 = v61;
      double v75 = sub_35CA8(*(v69 - 1), *v69, v71);
      double v77 = v76;
      float v78 = sub_35D0C(v75, v76, v73, v72);
      LODWORD(v75) = sub_35D0C(v75, v77, v74, v73);
      double v79 = sub_35CDC(v73, v72, v78);
      double v81 = v80;
      double v82 = sub_35CDC(v74, v73, -*(float *)&v75);
      double v83 = sub_35C9C(v79, v81, v82);
      double v85 = sub_35C9C(v83, v84, v71);
      if (v85 >= 0.0) {
        double v87 = v85;
      }
      else {
        double v87 = 0.0;
      }
      if (v86 >= 0.0) {
        double v88 = v86;
      }
      else {
        double v88 = 0.0;
      }
      if (v70 < 6)
      {
        float v93 = sub_35D88(v100, v99, v107, v106, v87, v88);
        float v61 = *(float *)&v108;
        if (v93 == 0.0)
        {
LABEL_48:
          if (v87 <= v104) {
            float v90 = v87;
          }
          else {
            float v90 = v104;
          }
          float v91 = v103;
          if (v87 >= v103) {
            float v91 = v87;
          }
          float v103 = v91;
          float v104 = v90;
          float v92 = v105;
          if (v88 <= v105) {
            float v92 = v88;
          }
          float v105 = v92;
          if (v88 >= v61) {
            float v61 = v88;
          }
        }
      }
      else
      {
        float v89 = sub_35D88(v107, v106, v100, v99, v87, v88);
        float v61 = *(float *)&v108;
        if (v89 != 0.0) {
          goto LABEL_48;
        }
      }
      --v70;
      v69 -= 2;
      if (v70 == -1)
      {
        objc_msgSend(v38, "setCoreImageROIrect:", v104, v105, (float)(v103 - v104), (float)(v61 - v105));
        return;
      }
    }
  }
  float64x2_t v41 = *(float64x2_t *)&v109.a;
  float64x2_t v42 = *(float64x2_t *)&v109.c;
  v43 = (double *)(*(void *)&v107 + 8);
  LODWORD(v28) = 1.0;
  v44 = v101;
  float64x2_t v45 = *(float64x2_t *)&v109.tx;
  while (1)
  {
    double v46 = *(v43 - 1);
    double v47 = *v43;
    BOOL v48 = v46 < 1.0 && v47 < 1.0;
    double v49 = v12 + v13 * v46;
    *(float *)&double v49 = v49;
    BOOL v50 = v48 && *(float *)&v49 <= 1.0;
    if (!v50 || *(float *)&v49 < 0.0) {
      break;
    }
    double v47 = v14 + v15 * v47;
    *(float *)&double v47 = v47;
    if (*(float *)&v47 < 0.0 || *(float *)&v47 > 1.0) {
      break;
    }
    *v44++ = vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v42, *(float *)&v47), v41, *(float *)&v49));
    v43 += 2;
    --*(void *)&v40;
    if (v40 == 0.0) {
      goto LABEL_29;
    }
  }
  objc_msgSend(v38, "setSanityCheckStatus:", 0xFFFFFFFFLL, v41.f64[0], v42.f64[0], 1.0, v28, v45.f64[0], v49, v47);
}

+ (id)customAttributes
{
  v18[0] = kCIAttributeFilterCategories;
  v17[0] = kCICategoryColorEffect;
  v17[1] = kCICategoryVideo;
  v17[2] = kCICategoryInterlaced;
  v17[3] = kCICategoryNonSquarePixels;
  v17[4] = kCICategoryStillImage;
  v17[5] = kCICategoryBuiltIn;
  v17[6] = kCICategoryApplePrivate;
  v19[0] = +[NSArray arrayWithObjects:v17 count:7];
  v19[1] = @"10";
  v18[1] = kCIAttributeFilterAvailable_iOS;
  v18[2] = kCIAttributeFilterAvailable_Mac;
  v19[2] = @"10.11";
  v18[3] = @"inputSmooth";
  v15[0] = kCIAttributeMin;
  v15[1] = kCIAttributeSliderMin;
  v16[0] = &off_7A510;
  v16[1] = &off_7A510;
  v15[2] = kCIAttributeSliderMax;
  v15[3] = kCIAttributeDefault;
  v16[2] = &off_7A520;
  v16[3] = &off_7A530;
  v15[4] = kCIAttributeIdentity;
  v15[5] = kCIAttributeType;
  v16[4] = &off_7A540;
  v16[5] = kCIAttributeTypeScalar;
  v19[3] = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
  v18[4] = @"inputEnrich";
  v13[0] = kCIAttributeMin;
  v13[1] = kCIAttributeSliderMin;
  v14[0] = &off_7A540;
  v14[1] = &off_7A540;
  v13[2] = kCIAttributeSliderMax;
  v13[3] = kCIAttributeDefault;
  v14[2] = &off_7A520;
  v14[3] = &off_7A550;
  v13[4] = kCIAttributeIdentity;
  v13[5] = kCIAttributeType;
  v14[4] = &off_7A540;
  v14[5] = kCIAttributeTypeScalar;
  v19[4] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
  v18[5] = @"inputTeeth";
  v11[0] = kCIAttributeMin;
  v11[1] = kCIAttributeSliderMin;
  v12[0] = &off_7A540;
  v12[1] = &off_7A540;
  v11[2] = kCIAttributeSliderMax;
  v11[3] = kCIAttributeDefault;
  v12[2] = &off_7A520;
  v12[3] = &off_7A560;
  v11[4] = kCIAttributeIdentity;
  v11[5] = kCIAttributeType;
  v12[4] = &off_7A540;
  v12[5] = kCIAttributeTypeScalar;
  v19[5] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
  v18[6] = @"inputEyes";
  v9[0] = kCIAttributeMin;
  v9[1] = kCIAttributeSliderMin;
  v10[0] = &off_7A540;
  v10[1] = &off_7A540;
  v9[2] = kCIAttributeSliderMax;
  v9[3] = kCIAttributeDefault;
  v10[2] = &off_7A520;
  v10[3] = &off_7A570;
  v9[4] = kCIAttributeIdentity;
  v9[5] = kCIAttributeType;
  v10[4] = &off_7A540;
  v10[5] = kCIAttributeTypeScalar;
  v19[6] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  v18[7] = @"inputLocalContrast";
  v7[0] = kCIAttributeMin;
  v7[1] = kCIAttributeSliderMin;
  v8[0] = &off_7A510;
  v8[1] = &off_7A510;
  v7[2] = kCIAttributeSliderMax;
  v7[3] = kCIAttributeDefault;
  v8[2] = &off_7A520;
  v8[3] = &off_7A540;
  v7[4] = kCIAttributeIdentity;
  v7[5] = kCIAttributeType;
  v8[4] = &off_7A540;
  v8[5] = kCIAttributeTypeScalar;
  v19[7] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];
  v18[8] = @"inputStrength";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_7A540;
  v6[1] = &off_7A540;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_7A580;
  v6[3] = &off_7A580;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_7A580;
  v6[5] = kCIAttributeTypeScalar;
  v19[8] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v18[9] = @"inputScale";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_7A590;
  v4[1] = &off_7A590;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v4[2] = &off_7A580;
  v4[3] = &off_7A580;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[4] = &off_7A580;
  v4[5] = kCIAttributeTypeScalar;
  v19[9] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:10];
}

- (id)previewCubeName
{
  return 0;
}

- (id)backgroundPreviewCubeName
{
  return 0;
}

- (id)standbyCubeName
{
  return 0;
}

- (id)previewCubePath
{
  id result = [(CIPortraitEffect *)self previewCubeName];
  if (result)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [(CIPortraitEffect *)self previewCubeName];
    return [(NSBundle *)v4 pathForResource:v5 ofType:@"scube"];
  }
  return result;
}

- (id)standbyCubePath
{
  id result = [(CIPortraitEffect *)self standbyCubeName];
  if (result)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [(CIPortraitEffect *)self standbyCubeName];
    return [(NSBundle *)v4 pathForResource:v5 ofType:@"scube"];
  }
  return result;
}

- (id)backgroundPreviewCubePath
{
  id result = [(CIPortraitEffect *)self backgroundPreviewCubeName];
  if (result)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [(CIPortraitEffect *)self backgroundPreviewCubeName];
    return [(NSBundle *)v4 pathForResource:v5 ofType:@"scube"];
  }
  return result;
}

- (id)cubeColorSpaceName
{
  return (id)kCGColorSpaceDisplayP3;
}

- (id)outputImage
{
  return self->inputImage;
}

- (int)_defaultVersion
{
  return 0;
}

- (int)_maxVersion
{
  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputFaceMask
{
  return self->inputFaceMask;
}

- (void)setInputFaceMask:(id)a3
{
}

- (NSNumber)inputSmooth
{
  return self->inputSmooth;
}

- (void)setInputSmooth:(id)a3
{
}

- (NSNumber)inputEnrich
{
  return self->inputEnrich;
}

- (void)setInputEnrich:(id)a3
{
}

- (NSNumber)inputTeeth
{
  return self->inputTeeth;
}

- (void)setInputTeeth:(id)a3
{
}

- (NSNumber)inputEyes
{
  return self->inputEyes;
}

- (void)setInputEyes:(id)a3
{
}

- (NSNumber)inputLocalContrast
{
  return self->inputLocalContrast;
}

- (void)setInputLocalContrast:(id)a3
{
}

- (NSArray)inputFaceLandmarkArray
{
  return self->inputFaceLandmarkArray;
}

- (void)setInputFaceLandmarkArray:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end