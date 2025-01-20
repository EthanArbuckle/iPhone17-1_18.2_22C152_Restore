@interface CIPortraitEffectContourV2
- (NSNumber)inputContour;
- (NSNumber)inputDepthThreshold;
- (NSNumber)inputFaceLight;
- (NSNumber)inputKickLight;
- (id)_applyFaceProtect;
- (id)_applyTransparentBorder;
- (id)_applyVignette;
- (id)_blendSingleChannelMask;
- (id)_faceVignette;
- (id)_prepareDepth;
- (id)_transparentBorder;
- (id)backgroundPreviewCubeName;
- (id)outputImage;
- (id)previewCubeName;
- (void)setDefaults;
- (void)setInputContour:(id)a3;
- (void)setInputDepthThreshold:(id)a3;
- (void)setInputFaceLight:(id)a3;
- (void)setInputKickLight:(id)a3;
@end

@implementation CIPortraitEffectContourV2

- (id)previewCubeName
{
  return @"CIContourPreview";
}

- (id)backgroundPreviewCubeName
{
  return 0;
}

- (void)setDefaults
{
  [(CIPortraitEffectLightV2 *)self setInputSmooth:&off_79E20];
  [(CIPortraitEffectLightV2 *)self setInputEnrich:&off_79FA0];
  [(CIPortraitEffectLightV2 *)self setInputLocalContrast:&off_7A230];
  [(CIPortraitEffectContourV2 *)self setInputKickLight:&off_7A240];
  [(CIPortraitEffectContourV2 *)self setInputFaceLight:&off_79F80];
  [(CIPortraitEffectV2 *)self setInputStrength:&off_79D10];
  [(CIPortraitEffectLightV2 *)self setInputEyes:&off_79DE0];
  [(CIPortraitEffectContourV2 *)self setInputContour:&off_7A120];
  [(CIPortraitEffectContourV2 *)self setInputDepthThreshold:&off_7A160];
  [(CIPortraitEffectLightV2 *)self setInputTeeth:&off_7A1B0];
  [(CIPortraitEffectV2 *)self setInputScale:&off_7A110];
  [(CIPortraitEffectV2 *)self setInputRenderProxy:&off_7A140];

  [(CIPortraitEffectV2 *)self setInputGenerateSpillMatte:&off_7A140];
}

- (id)_prepareDepth
{
  if (qword_8CD08 != -1) {
    dispatch_once(&qword_8CD08, &stru_752E8);
  }
  return (id)qword_8CD00;
}

- (id)_blendSingleChannelMask
{
  if (qword_8CD18 != -1) {
    dispatch_once(&qword_8CD18, &stru_75308);
  }
  return (id)qword_8CD10;
}

- (id)_faceVignette
{
  if (qword_8CD28 != -1) {
    dispatch_once(&qword_8CD28, &stru_75328);
  }
  return (id)qword_8CD20;
}

- (id)_applyVignette
{
  if (qword_8CD38 != -1) {
    dispatch_once(&qword_8CD38, &stru_75348);
  }
  return (id)qword_8CD30;
}

- (id)_applyFaceProtect
{
  if (qword_8CD48 != -1) {
    dispatch_once(&qword_8CD48, &stru_75368);
  }
  return (id)qword_8CD40;
}

- (id)_transparentBorder
{
  if (qword_8CD58 != -1) {
    dispatch_once(&qword_8CD58, &stru_75388);
  }
  return (id)qword_8CD50;
}

- (id)_applyTransparentBorder
{
  if (qword_8CD68 != -1) {
    dispatch_once(&qword_8CD68, &stru_753A8);
  }
  return (id)qword_8CD60;
}

- (id)outputImage
{
  v2 = self;
  id result = self->super.super.inputImage;
  if (!result) {
    return result;
  }
  [result extent];
  double v350 = v5;
  double v351 = v4;
  double v7 = v6;
  double v349 = v8;
  v391.receiver = v2;
  v391.super_class = (Class)CIPortraitEffectContourV2;
  id v9 = [(CIPortraitEffectLightV2 *)&v391 getDraftMode:&off_7A8C0];
  [(NSNumber *)v2->super.super.inputRenderProxy floatValue];
  float v11 = v10;
  v335 = v9;
  float v334 = v10;
  if ((int)[v9 intValue] > 0 || v11 > 0.0)
  {
    id inputImage = v2->super.super.inputImage;
  }
  else
  {
    v390.receiver = v2;
    v390.super_class = (Class)CIPortraitEffectContourV2;
    id inputImage = [(CIPortraitEffectLightV2 *)&v390 outputImage];
  }
  CFStringRef v428 = @"inputStrength";
  LODWORD(v12) = 0.25;
  v429 = +[NSNumber numberWithFloat:v12];
  v14 = &CFBooleanGetTypeID_ptr;
  id v15 = objc_msgSend(inputImage, "imageByApplyingFilter:withInputParameters:", @"CIHighKey", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v429, &v428, 1));
  v426[0] = @"inputShadows";
  int v340 = 1041865114;
  v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v426[1] = @"inputContrast";
  v427[0] = v16;
  v427[1] = +[NSNumber numberWithFloat:0.0];
  id v333 = objc_msgSend(v15, "imageByApplyingFilter:withInputParameters:", @"CISmartToneFilter", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v427, v426, 2));
  v17 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v18 = +[CIImage imageWithColor:v17];
  [(CIImage *)v2->super.super.inputImage extent];
  v19 = -[CIImage imageByCroppingToRect:](v18, "imageByCroppingToRect:");
  v20 = +[CIImage imageWithColor:v17];
  [(CIImage *)v2->super.super.inputImage extent];
  v353 = -[CIImage imageByCroppingToRect:](v20, "imageByCroppingToRect:");
  v354 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]);
  inputFaceLandmarkArradouble y = v2->super.super.inputFaceLandmarkArray;
  if (inputFaceLandmarkArray && [(NSArray *)inputFaceLandmarkArray count])
  {
    v352 = v19;
    id v365 = objc_alloc_init((Class)NSMutableArray);
    long long v386 = 0u;
    long long v387 = 0u;
    long long v388 = 0u;
    long long v389 = 0u;
    obj = v2->super.super.inputFaceLandmarkArray;
    id v22 = [(NSArray *)obj countByEnumeratingWithState:&v386 objects:v425 count:16];
    double v337 = v7;
    v339 = v2;
    if (v22)
    {
      id v23 = v22;
      uint64_t v361 = *(void *)v387;
      do
      {
        uint64_t v24 = 0;
        id v356 = v23;
        do
        {
          if (*(void *)v387 != v361) {
            objc_enumerationMutation(obj);
          }
          uint64_t v363 = v24;
          v25 = *(void **)(*((void *)&v386 + 1) + 8 * v24);
          float v26 = 0.0;
          float v27 = 0.0;
          if ([v25 objectForKeyedSubscript:@"faceJunkinessIndex"])
          {
            objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
            float v27 = v28;
          }
          if ([v25 objectForKeyedSubscript:@"faceBoundingBox"])
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
            float v26 = v29;
          }
          if ([v25 objectForKeyedSubscript:@"roll"])
          {
            objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"roll"), "floatValue");
            float v31 = fabsf(v30);
          }
          else
          {
            float v31 = 0.0;
          }
          if (v27 <= -0.2 && v26 >= 0.15 && v31 <= 1.05)
          {
            int v32 = objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"orientation"), "intValue");
            memset(&v385, 0, sizeof(v385));
            [v333 extent];
            sub_1DC78(v32, &v385, v33, v34, v35);
            CGAffineTransform v383 = v385;
            memset(&v384, 0, sizeof(v384));
            CGAffineTransformInvert(&v384, &v383);
            [v333 extent];
            CGAffineTransform v382 = v385;
            CGRect v431 = CGRectApplyAffineTransform(v430, &v382);
            PathBoundingBodouble x = CGPathGetPathBoundingBox(-[FaceLandmarks headPerimeter](-[FaceLandmarks initWithFaceLandmarks:forImageRect:]([FaceLandmarks alloc], "initWithFaceLandmarks:forImageRect:", v25, v431.origin.x, v431.origin.y, v431.size.width, v431.size.height), "headPerimeter"));
            NSRect v433 = NSIntegralRectWithOptions(PathBoundingBox, 0xF00uLL);
            CGRect v434 = CGRectInset(v433, v433.size.width * -0.899999976 + v433.size.width * -0.899999976, v433.size.height * -0.899999976);
            CGAffineTransform v381 = v384;
            CGRect v435 = CGRectApplyAffineTransform(v434, &v381);
            double x = v435.origin.x;
            double y = v435.origin.y;
            double width = v435.size.width;
            double height = v435.size.height;
            id v40 = objc_alloc_init((Class)NSMutableDictionary);
            id v41 = objc_alloc_init((Class)NSMutableArray);
            [v41 addObject:v25];
            objc_msgSend(v40, "setValue:forKey:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", x, y, width, height), @"unionRect");
            [v40 setValue:v41 forKey:@"faceLandmarksArray"];
            id v42 = objc_alloc_init((Class)NSMutableArray);
            long long v377 = 0u;
            long long v378 = 0u;
            long long v379 = 0u;
            long long v380 = 0u;
            id v43 = [v365 countByEnumeratingWithState:&v377 objects:v424 count:16];
            if (v43)
            {
              id v44 = v43;
              uint64_t v45 = *(void *)v378;
              do
              {
                for (i = 0; i != v44; i = (char *)i + 1)
                {
                  if (*(void *)v378 != v45) {
                    objc_enumerationMutation(v365);
                  }
                  v47 = *(void **)(*((void *)&v377 + 1) + 8 * i);
                  objc_msgSend(objc_msgSend(v47, "objectForKeyedSubscript:", @"unionRect"), "rectValue");
                  CGFloat v49 = v48;
                  CGFloat v51 = v50;
                  CGFloat v53 = v52;
                  CGFloat v55 = v54;
                  v436.origin.double x = x;
                  v436.origin.double y = y;
                  v436.size.double width = width;
                  v436.size.double height = height;
                  v441.origin.double x = v49;
                  v441.origin.double y = v51;
                  v441.size.double width = v53;
                  v441.size.double height = v55;
                  if (CGRectIntersectsRect(v436, v441))
                  {
                    v437.origin.double x = v49;
                    v437.origin.double y = v51;
                    v437.size.double width = v53;
                    v437.size.double height = v55;
                    v442.origin.double x = x;
                    v442.origin.double y = y;
                    v442.size.double width = width;
                    v442.size.double height = height;
                    CGRect v438 = CGRectUnion(v437, v442);
                    double x = v438.origin.x;
                    double y = v438.origin.y;
                    double width = v438.size.width;
                    double height = v438.size.height;
                    objc_msgSend(v41, "addObjectsFromArray:", objc_msgSend(v47, "objectForKeyedSubscript:", @"faceLandmarksArray"));
                    objc_msgSend(v40, "setValue:forKey:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", x, y, width, height), @"unionRect");
                    [v40 setValue:v41 forKey:@"faceLandmarksArray"];
                  }
                  else
                  {
                    [v42 addObject:v47];
                  }
                }
                id v44 = [v365 countByEnumeratingWithState:&v377 objects:v424 count:16];
              }
              while (v44);
            }
            [v42 addObject:v40];

            id v365 = v42;
            v2 = v339;
            id v23 = v356;
            double v7 = v337;
          }
          uint64_t v24 = v363 + 1;
        }
        while ((id)(v363 + 1) != v23);
        id v23 = [(NSArray *)obj countByEnumeratingWithState:&v386 objects:v425 count:16];
      }
      while (v23);
    }
    long long v375 = 0u;
    long long v376 = 0u;
    long long v373 = 0u;
    long long v374 = 0u;
    v56 = v352;
    id v330 = [v365 countByEnumeratingWithState:&v373 objects:v423 count:16];
    if (v330)
    {
      id v57 = 0;
      uint64_t v329 = *(void *)v374;
      v14 = &CFBooleanGetTypeID_ptr;
      id v58 = v333;
      while (2)
      {
        uint64_t v59 = 0;
        do
        {
          if (*(void *)v374 != v329) {
            objc_enumerationMutation(v365);
          }
          uint64_t v331 = v59;
          id v332 = v57;
          v60 = *(void **)(*((void *)&v373 + 1) + 8 * v59);
          objc_msgSend(objc_msgSend(v60, "objectForKeyedSubscript:", @"unionRect"), "rectValue");
          double v62 = v61;
          double v64 = v63;
          double v66 = v65;
          double v68 = v67;
          v69 = -[CIImage imageByCroppingToRect:](v354, "imageByCroppingToRect:");
          id v360 = objc_msgSend(v58, "imageByCroppingToRect:", v62, v64, v66, v68);
          id v70 = [v60 objectForKeyedSubscript:@"faceLandmarksArray"];
          long long v369 = 0u;
          long long v370 = 0u;
          long long v371 = 0u;
          long long v372 = 0u;
          id v338 = v70;
          id v357 = [v70 countByEnumeratingWithState:&v369 objects:v422 count:16];
          if (v357)
          {
            uint64_t v71 = *(void *)v370;
            v72 = v69;
            uint64_t v336 = *(void *)v370;
            do
            {
              uint64_t v73 = 0;
              do
              {
                if (*(void *)v370 != v71) {
                  objc_enumerationMutation(v338);
                }
                uint64_t v362 = v73;
                v74 = *(void **)(*((void *)&v369 + 1) + 8 * v73);
                v75 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:]([LightingFacePoints alloc], "initWithFaceLandmarkDictionary:forImageRect:", v74, v351, v350, v7, v349);
                CGAffineTransformMakeScale(&v368, 0.05, 0.05);
                v439.origin.double x = v351;
                v439.origin.double y = v350;
                v439.size.double width = v7;
                v439.size.double height = v349;
                CGRect v440 = CGRectApplyAffineTransform(v439, &v368);
                v364 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:]([LightingFacePoints alloc], "initWithFaceLandmarkDictionary:forImageRect:", v74, v440.origin.x, v440.origin.y, v440.size.width, v440.size.height);
                float v76 = 0.0;
                float v77 = 0.0;
                if ([v74 objectForKeyedSubscript:@"faceJunkinessIndex"])
                {
                  objc_msgSend(objc_msgSend(v74, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
                  float v77 = v78;
                }
                if ([v74 objectForKeyedSubscript:@"faceOrientationIndex"])
                {
                  objc_msgSend(objc_msgSend(v74, "objectForKeyedSubscript:", @"faceOrientationIndex"), "floatValue");
                  float v76 = v79;
                }
                float v80 = 0.0;
                float v81 = 0.0;
                if ([v74 objectForKeyedSubscript:@"faceBoundingBox"])
                {
                  objc_msgSend(objc_msgSend(objc_msgSend(v74, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
                  float v81 = v82;
                }
                if ([v74 objectForKeyedSubscript:@"roll"])
                {
                  objc_msgSend(objc_msgSend(v74, "objectForKeyedSubscript:", @"roll"), "floatValue");
                  float v80 = fabsf(v83);
                }
                if (v77 < -0.2 && v81 > 0.15 && v80 < 1.05)
                {
                  float v344 = v76;
                  id v84 = [v74 objectForKeyedSubscript:@"orientation"];
                  [(LightingFacePoints *)v75 faceWidth];
                  float v86 = v85;
                  [(NSNumber *)v2->super.super.inputScale floatValue];
                  float v346 = v87;
                  [(LightingFacePoints *)v75 centerNose];
                  double v89 = v88;
                  [(LightingFacePoints *)v75 centerNose];
                  double v91 = v90;
                  [(LightingFacePoints *)v75 centerChin];
                  double v93 = v92;
                  [(LightingFacePoints *)v75 centerChin];
                  v95 = +[CIVector vectorWithX:v89 Y:v91 Z:v93 W:v94];
                  [(LightingFacePoints *)v75 leftEye];
                  double v97 = v96;
                  [(LightingFacePoints *)v75 leftEye];
                  double v99 = v98;
                  [(LightingFacePoints *)v75 rightEye];
                  double v101 = v100;
                  [(LightingFacePoints *)v75 rightEye];
                  v103 = +[CIVector vectorWithX:v97 Y:v99 Z:v101 W:v102];
                  [(LightingFacePoints *)v75 centerNose];
                  double v105 = v104;
                  [(LightingFacePoints *)v75 centerNose];
                  double v107 = v106;
                  [(LightingFacePoints *)v75 faceWidth];
                  float v109 = v108 * 0.45;
                  [(LightingFacePoints *)v75 faceHeight];
                  float v111 = v110 * 0.35;
                  v355 = v72;
                  v347 = v103;
                  id v348 = v84;
                  if ([v84 intValue] == 6
                    || (unsigned int v112 = [v84 intValue], v113 = 0.0, v112 == 8))
                  {
                    float v114 = v109;
                    float v113 = 1.5708;
                  }
                  else
                  {
                    float v114 = v111;
                    float v111 = v109;
                  }
                  float v115 = v86 / v7;
                  double v116 = v115;
                  double v345 = fmin(v115 * 1.8, 1.0);
                  float v117 = fmin(v345 * 1.05, 1.0);
                  float v343 = v117;
                  *(float *)&unsigned int v118 = fmin(v116 * 1.05, 1.0);
                  *(float *)&unsigned int v119 = v105;
                  unint64_t v342 = __PAIR64__(v118, v119);
                  float v120 = v107;
                  float v341 = v120;
                  float v121 = v113;
                  float obja = v113;
                  __float2 v122 = __sincosf_stret(v113);
                  double v123 = (float)(v122.__cosval * v122.__cosval);
                  double v124 = (float)(v122.__sinval * v122.__sinval);
                  double v125 = sin(v121 + v121);
                  v126 = +[CIVector vectorWithX:v123 / ((v111 + v111) * v111) + v124 / ((v114 + v114) * v114) Y:v125 / (v114 * 4.0 * v114) - v125 / (v111 * 4.0 * v111) Z:v124 / ((v111 + v111) * v111) + v123 / ((v114 + v114) * v114) W:0.7];
                  v127 = +[CIVector vectorWithX:*(float *)&v342 Y:v341];
                  id v128 = [(CIPortraitEffectContourV2 *)v2 _faceVignette];
                  [(CIImage *)v2->super.super.inputImage extent];
                  v421[0] = v360;
                  v421[1] = v353;
                  v421[2] = v127;
                  v421[3] = v126;
                  v353 = (CIImage *)objc_msgSend(v128, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v421, 4), v129, v130, v131, v132);
                  [(LightingFacePoints *)v75 centerNose];
                  float v134 = v133;
                  [(LightingFacePoints *)v75 centerNose];
                  float v136 = v135;
                  [(LightingFacePoints *)v75 faceWidth];
                  float v138 = v137 * 0.35;
                  [(LightingFacePoints *)v75 faceHeight];
                  float v140 = v139 * 3.5 * *((float *)&v342 + 1);
                  double v141 = (v138 + v138) * v138;
                  v142 = +[CIVector vectorWithX:v123 / v141 + v124 / ((v140 + v140) * v140) Y:v125 / (v140 * 4.0 * v140) - v125 / (v138 * 4.0 * v138) Z:v124 / v141 + v123 / ((v140 + v140) * v140) W:0.7];
                  v143 = +[CIVector vectorWithX:v134 Y:v136];
                  [(CIImage *)v2->super.super.inputImage extent];
                  v420[0] = v360;
                  v420[1] = v352;
                  v420[2] = v143;
                  v420[3] = v142;
                  v352 = (CIImage *)objc_msgSend(v128, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v420, 4), v144, v145, v146, v147);
                  double v148 = 0.5 - fabs(v344 * 0.5 / 3.14159265);
                  if (v148 < 0.0) {
                    double v148 = 0.0;
                  }
                  float v149 = v148;
                  v418[0] = @"inputImage";
                  v418[1] = @"inputCenter";
                  v419[0] = v360;
                  v419[1] = v95;
                  v418[2] = @"inputStrength";
                  v419[2] = +[NSNumber numberWithDouble:v149 + 0.9];
                  v418[3] = @"inputRotate";
                  *(float *)&double v150 = obja;
                  v419[3] = +[NSNumber numberWithFloat:v150];
                  v419[4] = &off_7A110;
                  v418[4] = @"inputDarken";
                  v418[5] = @"inputWidth";
                  [(LightingFacePoints *)v75 faceWidth];
                  v419[5] = +[NSNumber numberWithDouble:v151 * 0.15];
                  v418[6] = @"inputHeight";
                  [(LightingFacePoints *)v75 faceHeight];
                  v419[6] = +[NSNumber numberWithDouble:v152 * 0.325];
                  id v153 = objc_msgSend(v360, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSpot", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v419, v418, 7));
                  [(LightingFacePoints *)v75 centerChin];
                  double v155 = v154;
                  [(LightingFacePoints *)v75 centerChin];
                  double v157 = v156;
                  [(LightingFacePoints *)v75 centerChin];
                  double v159 = v158;
                  [(LightingFacePoints *)v75 centerChin];
                  v161 = +[CIVector vectorWithX:v155 Y:v157 Z:v159 W:v160];
                  v416[0] = @"inputImage";
                  v416[1] = @"inputCenter";
                  v417[0] = v153;
                  v417[1] = v161;
                  v417[2] = &off_7A250;
                  v416[2] = @"inputStrength";
                  v416[3] = @"inputRotate";
                  *(float *)&double v162 = obja;
                  v417[3] = +[NSNumber numberWithFloat:v162];
                  v417[4] = &off_7A110;
                  v416[4] = @"inputDarken";
                  v416[5] = @"inputWidth";
                  [(LightingFacePoints *)v75 faceWidth];
                  v417[5] = +[NSNumber numberWithDouble:v163 * 0.04];
                  v416[6] = @"inputHeight";
                  [(LightingFacePoints *)v75 faceWidth];
                  v417[6] = +[NSNumber numberWithDouble:v164 * 0.04];
                  id v165 = objc_msgSend(v153, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSpot", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v417, v416, 7));
                  [(LightingFacePoints *)v75 centerNose];
                  v166 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
                  [(LightingFacePoints *)v75 bottomShadow];
                  v167 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
                  [(NSNumber *)v2->inputFaceLight floatValue];
                  *(float *)&double v155 = v168 * v343;
                  v414[0] = @"inputImage";
                  v414[1] = @"inputCenter1";
                  v415[0] = v165;
                  v415[1] = v166;
                  v414[2] = @"inputBottom1";
                  v414[3] = @"inputCenter2";
                  v415[2] = v167;
                  v415[3] = v166;
                  v414[4] = @"inputHeight1";
                  [(LightingFacePoints *)v75 faceHeight];
                  v415[4] = +[NSNumber numberWithDouble:v169 * 0.4];
                  v414[5] = @"inputWidth1";
                  [(LightingFacePoints *)v75 faceWidth];
                  v415[5] = +[NSNumber numberWithDouble:v170 * 0.3];
                  v414[6] = @"inputHeight2";
                  [(LightingFacePoints *)v75 faceHeight];
                  v415[6] = +[NSNumber numberWithDouble:v171 * 0.85];
                  v414[7] = @"inputWidth2";
                  [(LightingFacePoints *)v75 faceWidth];
                  v415[7] = +[NSNumber numberWithDouble:v172 * 0.55];
                  v415[8] = &off_7A120;
                  v414[8] = @"inputContrast";
                  v414[9] = @"inputBrighten";
                  double v173 = v343;
                  v415[9] = +[NSNumber numberWithDouble:v343];
                  v414[10] = @"inputStrength";
                  LODWORD(v174) = LODWORD(v155);
                  v415[10] = +[NSNumber numberWithFloat:v174];
                  id v175 = objc_msgSend(v165, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingFront", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v415, v414, 11));
                  [(LightingFacePoints *)v75 centerNose];
                  double v177 = v176;
                  [(LightingFacePoints *)v75 centerNose];
                  double v179 = v178;
                  [(LightingFacePoints *)v75 bottomShadow];
                  double v181 = v180;
                  [(LightingFacePoints *)v75 bottomShadow];
                  v183 = +[CIVector vectorWithX:v177 Y:v179 Z:v181 W:v182];
                  double v184 = 1.0 - fabs(v344 * 2.5 / 3.14159265);
                  if (v184 < 0.0) {
                    double v184 = 0.0;
                  }
                  float v185 = v184;
                  v412[0] = @"inputImage";
                  v412[1] = @"inputCenter";
                  v413[0] = v175;
                  v413[1] = v183;
                  v412[2] = @"inputHeight";
                  [(LightingFacePoints *)v75 faceHeight];
                  v413[2] = +[NSNumber numberWithDouble:v186 * 0.31];
                  v412[3] = @"inputWidth";
                  [(LightingFacePoints *)v75 faceWidth];
                  v413[3] = +[NSNumber numberWithDouble:v187 * 0.21];
                  v412[4] = @"inputStrength";
                  v413[4] = +[NSNumber numberWithDouble:v185 * 1.2];
                  id v188 = objc_msgSend(v175, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingEdge", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v413, v412, 5));
                  if ((int)[v335 intValue] > 1)
                  {
                    double v7 = v337;
                    float v190 = v346;
                  }
                  else
                  {
                    *(float *)&double v189 = v334;
                    float v190 = v346;
                    if (v334 < 2.0)
                    {
                      v410[0] = @"inputFaceLandmarks";
                      v410[1] = @"inputOrigImage";
                      v191 = v339->super.super.inputImage;
                      v411[0] = v364;
                      v411[1] = v191;
                      v410[2] = @"inputStrength";
                      v410[3] = @"inputScale";
                      inputScale = v339->super.super.inputScale;
                      v411[2] = &off_79CA0;
                      v411[3] = inputScale;
                      id v188 = objc_msgSend(v188, "imageByApplyingFilter:withInputParameters:", @"CIPortraitContour", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v411, v410, 4, v189));
                    }
                    double v7 = v337;
                  }
                  float v193 = v345 * v190;
                  v194 = [(LightingFacePoints *)v75 leftNose];
                  v195 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v194, v194[1]);
                  v196 = [(LightingFacePoints *)v75 leftNose];
                  v197 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v196[1].x, v196[1].y);
                  v198 = [(LightingFacePoints *)v75 leftNose];
                  v199 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v198[2].x, v198[2].y);
                  v200 = [(LightingFacePoints *)v75 rightNose];
                  v201 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v200, v200[1]);
                  v202 = [(LightingFacePoints *)v75 rightNose];
                  v203 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v202[1].x, v202[1].y);
                  v204 = [(LightingFacePoints *)v75 rightNose];
                  v205 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v204[2].x, v204[2].y);
                  v408[0] = @"inputImage";
                  v408[1] = @"inputPt1";
                  v409[0] = v188;
                  v409[1] = v195;
                  v408[2] = @"inputPt2";
                  v408[3] = @"inputPt3";
                  v409[2] = v197;
                  v409[3] = v199;
                  v408[4] = @"inputPt4";
                  v408[5] = @"inputPt5";
                  v409[4] = v201;
                  v409[5] = v203;
                  v408[6] = @"inputPt6";
                  v408[7] = @"inputCenterBottom";
                  v409[6] = v205;
                  v409[7] = &off_7A110;
                  v408[8] = @"inputWidth";
                  *(float *)&double v206 = v193 * 30.0;
                  v409[8] = +[NSNumber numberWithFloat:v206];
                  v409[9] = &off_7A1F0;
                  v408[9] = @"inputRotate";
                  v408[10] = @"inputOrientation";
                  v409[10] = v348;
                  v408[11] = @"inputStrength";
                  v409[11] = +[NSNumber numberWithDouble:v173 * -0.3];
                  v14 = &CFBooleanGetTypeID_ptr;
                  id v207 = objc_msgSend(v188, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSide", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v409, v408, 12));
                  v208 = [(LightingFacePoints *)v75 noseStrobe];
                  v209 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v208, v208[1]);
                  v210 = [(LightingFacePoints *)v75 noseStrobe];
                  v211 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v210[1].x, v210[1].y);
                  v406[0] = @"inputImage";
                  v406[1] = @"inputCenter1";
                  v407[0] = v207;
                  v407[1] = v209;
                  v407[2] = v211;
                  v406[2] = @"inputCenter2";
                  v406[3] = @"inputWidth";
                  *(float *)&double v212 = v193 * 45.0;
                  v407[3] = +[NSNumber numberWithFloat:v212];
                  v407[4] = &off_7A1F0;
                  v406[4] = @"inputRotate";
                  v406[5] = @"inputOrientation";
                  v407[5] = v348;
                  v406[6] = @"inputStrength";
                  v407[6] = +[NSNumber numberWithDouble:v173];
                  id v213 = objc_msgSend(v207, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingStrobeV2", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v407, v406, 7));
                  [(LightingFacePoints *)v75 centerNose];
                  double v215 = v214;
                  [(LightingFacePoints *)v75 centerNose];
                  double v217 = v216;
                  [(LightingFacePoints *)v75 centerChin];
                  double v219 = v218;
                  [(LightingFacePoints *)v75 centerChin];
                  v221 = +[CIVector vectorWithX:v215 Y:v217 Z:v219 W:v220];
                  v404[0] = @"inputImage";
                  v404[1] = @"inputCenter";
                  v405[0] = v213;
                  v405[1] = v221;
                  v405[2] = v347;
                  v404[2] = @"inputEyes";
                  v404[3] = @"inputStrength";
                  v405[3] = +[NSNumber numberWithDouble:v173 * 1.2];
                  v404[4] = @"inputRotate";
                  *(float *)&double v222 = obja;
                  v405[4] = +[NSNumber numberWithFloat:v222];
                  v404[5] = @"inputScale";
                  *(float *)&double v223 = v193;
                  v405[5] = +[NSNumber numberWithFloat:v223];
                  v404[6] = @"inputWidth";
                  [(LightingFacePoints *)v75 faceWidth];
                  v405[6] = +[NSNumber numberWithDouble:v224 * 0.45];
                  v404[7] = @"inputHeight";
                  [(LightingFacePoints *)v75 faceHeight];
                  v405[7] = +[NSNumber numberWithDouble:v225 * 0.55];
                  id v360 = objc_msgSend(v213, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingContourV2", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v405, v404, 8));
                  v2 = v339;
                  v72 = v355;
                  uint64_t v71 = v336;
                }
                if (v72)
                {
                  [(LightingFacePoints *)v75 centerNose];
                  float v227 = v226;
                  [(LightingFacePoints *)v75 centerNose];
                  float v229 = v228;
                  [(LightingFacePoints *)v75 faceHeight];
                  double v231 = v230 * 0.25;
                  [(LightingFacePoints *)v75 faceHeight];
                  float v233 = 1.0 / (v231 * v232);
                  v234 = +[CIVector vectorWithX:v227 Y:v229 Z:v233];
                  id v235 = [(CIPortraitEffectContourV2 *)v2 _transparentBorder];
                  [v360 extent];
                  v403[0] = v72;
                  v403[1] = v234;
                  v72 = (CIImage *)objc_msgSend(v235, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v403, 2), v236, v237, v238, v239);
                }

                uint64_t v73 = v362 + 1;
              }
              while (v357 != (id)(v362 + 1));
              id v357 = [v338 countByEnumeratingWithState:&v369 objects:v422 count:16];
            }
            while (v357);
          }
          else
          {
            v72 = v69;
          }
          if (!v360)
          {
            id v57 = v332;
            id v58 = v333;
            goto LABEL_88;
          }
          if (v72)
          {
            id v240 = [(CIPortraitEffectContourV2 *)v2 _applyTransparentBorder];
            [v360 extent];
            v402[0] = v360;
            v402[1] = v72;
            id v360 = objc_msgSend(v240, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v402, 2), v241, v242, v243, v244);
          }
          v354 = v72;
          if (v332) {
            id v57 = [v360 imageByCompositingOverImage:v332];
          }
          else {
            id v57 = v360;
          }
          uint64_t v59 = v331 + 1;
          id v58 = v333;
        }
        while ((id)(v331 + 1) != v330);
        id v330 = [v365 countByEnumeratingWithState:&v373 objects:v423 count:16];
        if (v330) {
          continue;
        }
        break;
      }
LABEL_88:
      if (v57) {
        id v58 = [v57 imageByCompositingOverImage:v58];
      }
      int v340 = 0;
      v56 = v352;
    }
    else
    {
      int v340 = 0;
      v14 = &CFBooleanGetTypeID_ptr;
      id v58 = v333;
    }
  }
  else
  {
    [(CIImage *)v2->super.super.inputImage extent];
    float v246 = v245 * 0.5;
    [(CIImage *)v2->super.super.inputImage extent];
    float v248 = v247 * 0.5;
    double v249 = v246;
    float v250 = v246 * 0.3;
    double v251 = v248;
    float v252 = v248 * 0.3;
    v253 = +[CIVector vectorWithX:1.0 / ((v250 + v250) * v250) + 0.0 / ((v252 + v252) * v252) Y:0.0 / (v252 * 4.0 * v252) - 0.0 / (v250 * 4.0 * v250) Z:0.0 / ((v250 + v250) * v250) + 1.0 / ((v252 + v252) * v252) W:0.7];
    v254 = +[CIVector vectorWithX:v249 Y:v251];
    id v255 = [(CIPortraitEffectContourV2 *)v2 _faceVignette];
    [(CIImage *)v2->super.super.inputImage extent];
    id v58 = v333;
    v401[0] = v333;
    v401[1] = v19;
    v401[2] = v254;
    v401[3] = v253;
    v56 = (CIImage *)objc_msgSend(v255, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v401, 4), v256, v257, v258, v259);
  }
  id v260 = [(CIPortraitEffectContourV2 *)v2 _applyFaceProtect];
  id v261 = objc_msgSend(objc_msgSend(objc_msgSend(v58, "imageByApplyingFilter:withInputParameters:", @"CIHighKey", &off_7DC70), "imageByApplyingFilter:withInputParameters:", @"CIExposureAdjust", &off_7DC98), "imageByApplyingFilter:withInputParameters:", @"CISmartToneFilter", &off_7DCC0);
  [(CIImage *)v2->super.super.inputImage extent];
  v400[0] = v58;
  v400[1] = v261;
  v400[2] = v353;
  v400[3] = v56;
  id v266 = objc_msgSend(v260, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v400, 4), v262, v263, v264, v265);
  [(NSNumber *)v2->inputContour floatValue];
  if (v267 > 0.01)
  {
    [(NSNumber *)v2->super.super.inputScale floatValue];
    double v269 = 220.0 / v268;
    [v266 extent];
    double v271 = v269 / v270;
    [(NSNumber *)v2->super.super.inputScale floatValue];
    double v273 = 220.0 / v272;
    [v266 extent];
    v399[0] = +[CIVector vectorWithX:v271 Y:v273 / v274];
    v398[0] = @"inputScale";
    v398[1] = @"inputStrength";
    LODWORD(v275) = v340;
    v399[1] = +[NSNumber numberWithFloat:v275];
    id v266 = objc_msgSend(v266, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLocalContrast", objc_msgSend(v14[191], "dictionaryWithObjects:forKeys:count:", v399, v398, 2));
  }
  inputMatte = v2->super.super.inputMatte;
  if (inputMatte)
  {
    [(CIImage *)v2->super.super.inputMatte extent];
    double v278 = v277;
    [(CIImage *)v2->super.super.inputImage extent];
    if (v278 != v279)
    {
      [(CIImage *)v2->super.super.inputImage extent];
      float v281 = v280;
      [(CIImage *)v2->super.super.inputMatte extent];
      float v283 = v282;
      float v284 = v281 / v283;
      [(CIImage *)v2->super.super.inputImage extent];
      float v286 = v285;
      [(CIImage *)v2->super.super.inputMatte extent];
      float v288 = v287;
      float v289 = v286 / v288;
      v290 = [(CIImage *)inputMatte imageByClampingToExtent];
      CGAffineTransformMakeScale(&v367, v284, v289);
      v291 = [(CIImage *)v290 imageByApplyingTransform:&v367];
      [(CIImage *)v2->super.super.inputImage extent];
      inputMatte = -[CIImage imageByCroppingToRect:](v291, "imageByCroppingToRect:");
    }
    id v292 = [v266 imageByApplyingFilter:@"CIVibrance" withInputParameters:&off_7DCE8];
    v293 = v2->super.super.inputImage;
    v396[0] = @"inputBackgroundImage";
    v396[1] = @"inputMaskImage";
    v397[0] = v293;
    v397[1] = inputMatte;
    id v294 = objc_msgSend(v292, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithMask", objc_msgSend(v14[191], "dictionaryWithObjects:forKeys:count:", v397, v396, 2));
  }
  else
  {
    inputBlurMap = v2->super.super.inputBlurMap;
    if (!inputBlurMap) {
      goto LABEL_103;
    }
    id v296 = [(CIPortraitEffectContourV2 *)v2 _prepareDepth];
    [(CIImage *)inputBlurMap extent];
    inputDepthThreshold = v2->inputDepthThreshold;
    v395[0] = inputBlurMap;
    v395[1] = inputDepthThreshold;
    id v302 = objc_msgSend(v296, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v395, 2), v298, v299, v300, v301);
    [(CIImage *)v2->super.super.inputBlurMap extent];
    double v304 = v303;
    [(CIImage *)v2->super.super.inputImage extent];
    if (v304 != v305)
    {
      [(CIImage *)v2->super.super.inputImage extent];
      float v307 = v306;
      [(CIImage *)v2->super.super.inputBlurMap extent];
      float v309 = v308;
      float v310 = v307 / v309;
      [(CIImage *)v2->super.super.inputImage extent];
      float v312 = v311;
      [(CIImage *)v2->super.super.inputBlurMap extent];
      float v314 = v313;
      CGAffineTransformMakeScale(&v366, v310, (float)(v312 / v314));
      id v302 = [v302 imageByApplyingTransform:&v366];
    }
    id v315 = [v266 imageByApplyingFilter:@"CIVibrance" withInputParameters:&off_7DD10];
    id v316 = [(CIPortraitEffectContourV2 *)v2 _blendSingleChannelMask];
    [(CIImage *)v2->super.super.inputImage extent];
    v317 = v2->super.super.inputImage;
    v394[0] = v315;
    v394[1] = v317;
    v394[2] = v302;
    id v294 = objc_msgSend(v316, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v394, 3), v318, v319, v320, v321);
  }
  id v266 = v294;
LABEL_103:
  [(NSNumber *)v2->super.super.inputStrength floatValue];
  if (v322 < 1.0)
  {
    [(NSNumber *)v2->super.super.inputStrength floatValue];
    double v324 = v323 * -0.8;
    [(NSNumber *)v2->super.super.inputStrength floatValue];
    double v326 = v325;
    [(NSNumber *)v2->super.super.inputStrength floatValue];
    double v328 = v327 * 1.8 + v324 * v326;
    *(float *)&double v328 = v328;
    v393[0] = v2->super.super.inputImage;
    v392[0] = @"inputBackgroundImage";
    v392[1] = @"inputAmount";
    v393[1] = +[NSNumber numberWithFloat:v328];
    id v266 = objc_msgSend(v266, "imageByApplyingFilter:withInputParameters:", @"CIMix", objc_msgSend(v14[191], "dictionaryWithObjects:forKeys:count:", v393, v392, 2));
  }
  return [v266 _imageByRenderingToIntermediate];
}

- (NSNumber)inputContour
{
  return self->inputContour;
}

- (void)setInputContour:(id)a3
{
}

- (NSNumber)inputDepthThreshold
{
  return self->inputDepthThreshold;
}

- (void)setInputDepthThreshold:(id)a3
{
}

- (NSNumber)inputFaceLight
{
  return self->inputFaceLight;
}

- (void)setInputFaceLight:(id)a3
{
}

- (NSNumber)inputKickLight
{
  return self->inputKickLight;
}

- (void)setInputKickLight:(id)a3
{
}

@end