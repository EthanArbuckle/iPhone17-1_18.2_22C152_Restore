@interface CIPortraitEffectContour
- (CIImage)inputDepthMap;
- (NSNumber)inputContour;
- (NSNumber)inputDepthThreshold;
- (NSNumber)inputFaceLight;
- (NSNumber)inputKickLight;
- (id)_applyVignette;
- (id)_blendSingleChannelMask;
- (id)_faceVignette;
- (id)_mixKernel;
- (id)_prepareDepth;
- (id)backgroundPreviewCubeName;
- (id)outputImage;
- (id)previewCubeName;
- (void)setDefaults;
- (void)setInputContour:(id)a3;
- (void)setInputDepthMap:(id)a3;
- (void)setInputDepthThreshold:(id)a3;
- (void)setInputFaceLight:(id)a3;
- (void)setInputKickLight:(id)a3;
@end

@implementation CIPortraitEffectContour

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
  [(CIPortraitEffect *)self setInputSmooth:&off_7A640];
  [(CIPortraitEffect *)self setInputEnrich:&off_7A650];
  [(CIPortraitEffect *)self setInputLocalContrast:&off_7A660];
  [(CIPortraitEffectContour *)self setInputKickLight:&off_7A670];
  [(CIPortraitEffectContour *)self setInputFaceLight:&off_7A680];
  [(CIPortraitEffect *)self setInputStrength:&off_7A690];
  [(CIPortraitEffect *)self setInputEyes:&off_7A5E0];
  [(CIPortraitEffectContour *)self setInputContour:&off_7A540];
  [(CIPortraitEffectContour *)self setInputDepthThreshold:&off_7A6A0];

  [(CIPortraitEffect *)self setInputScale:&off_7A580];
}

- (id)_prepareDepth
{
  if (qword_8D050 != -1) {
    dispatch_once(&qword_8D050, &stru_759D8);
  }
  return (id)qword_8D048;
}

- (id)_mixKernel
{
  if (qword_8D060 != -1) {
    dispatch_once(&qword_8D060, &stru_759F8);
  }
  return (id)qword_8D058;
}

- (id)_blendSingleChannelMask
{
  if (qword_8D070 != -1) {
    dispatch_once(&qword_8D070, &stru_75A18);
  }
  return (id)qword_8D068;
}

- (id)_faceVignette
{
  if (qword_8D080 != -1) {
    dispatch_once(&qword_8D080, &stru_75A38);
  }
  return (id)qword_8D078;
}

- (id)_applyVignette
{
  if (qword_8D090 != -1) {
    dispatch_once(&qword_8D090, &stru_75A58);
  }
  return (id)qword_8D088;
}

- (id)outputImage
{
  v2 = self;
  id result = self->super.inputImage;
  if (result)
  {
    [result extent];
    double v305 = v5;
    double v306 = v4;
    double v7 = v6;
    double v304 = v8;
    inputImage = v2->super.inputImage;
    v369[0] = @"inputImage";
    v369[1] = @"inputSmooth";
    inputSmooth = v2->super.inputSmooth;
    v370[0] = inputImage;
    v370[1] = inputSmooth;
    inputEnrich = v2->super.inputEnrich;
    v369[2] = @"inputEnrich";
    v369[3] = @"inputLocalContrast";
    inputLocalContrast = v2->super.inputLocalContrast;
    v370[2] = inputEnrich;
    v370[3] = inputLocalContrast;
    inputEyes = v2->super.inputEyes;
    v369[4] = @"inputEyes";
    v369[5] = @"inputFaceLandmarkArray";
    inputFaceLandmarkArradouble y = v2->super.inputFaceLandmarkArray;
    if (!inputFaceLandmarkArray) {
      inputFaceLandmarkArradouble y = (NSArray *)&__NSArray0__struct;
    }
    v370[4] = inputEyes;
    v370[5] = inputFaceLandmarkArray;
    v369[6] = @"inputScale";
    v370[6] = v2->super.inputScale;
    v15 = [(CIImage *)inputImage imageByApplyingFilter:@"CIPortraitEffectLight" withInputParameters:+[NSDictionary dictionaryWithObjects:v370 forKeys:v369 count:7]];
    v16 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]);
    [(CIImage *)v2->super.inputImage extent];
    v17 = -[CIImage imageByCroppingToRect:](v16, "imageByCroppingToRect:");
    [(NSNumber *)v2->inputContour floatValue];
    if (v2->super.inputFaceLandmarkArray)
    {
      v307 = v17;
      int v291 = v18;
      v296 = v15;
      id obj = objc_alloc_init((Class)NSMutableArray);
      long long v335 = 0u;
      long long v336 = 0u;
      long long v337 = 0u;
      long long v338 = 0u;
      v19 = v2->super.inputFaceLandmarkArray;
      id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v335 objects:v368 count:16];
      p_isa = (id *)&v2->super.super.super.isa;
      double v298 = v7;
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v336;
        v23 = v15;
        v309 = v19;
        uint64_t v313 = *(void *)v336;
        do
        {
          uint64_t v24 = 0;
          id v311 = v21;
          do
          {
            if (*(void *)v336 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v314 = v24;
            v25 = *(void **)(*((void *)&v335 + 1) + 8 * v24);
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
              id v32 = objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"orientation"), "intValue");
              [(CIImage *)v23 extent];
              CGFloat width = v405.size.width;
              CGFloat height = v405.size.height;
              if (CGRectIsInfinite(v405))
              {
                long long v35 = *(_OWORD *)&CGAffineTransformIdentity.c;
                *(_OWORD *)&v334.a = *(_OWORD *)&CGAffineTransformIdentity.a;
                *(_OWORD *)&v334.c = v35;
                *(_OWORD *)&v334.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
                long long v36 = 0uLL;
              }
              else
              {
                v371.b = 0.0;
                v371.c = 0.0;
                v371.a = 1.0;
                v371.d = 1.0;
                v371.tdouble x = 0.0;
                v371.tdouble y = 0.0;
                uint64_t v373 = 0;
                uint64_t v374 = 0;
                unint64_t v372 = 0xBFF0000000000000;
                uint64_t v375 = 0x3FF0000000000000;
                CGFloat v376 = width;
                long long v377 = xmmword_55F30;
                uint64_t v378 = 0;
                uint64_t v379 = 0;
                unint64_t v380 = 0xBFF0000000000000;
                CGFloat v381 = width;
                CGFloat v382 = height;
                uint64_t v383 = 0x3FF0000000000000;
                uint64_t v384 = 0;
                uint64_t v385 = 0;
                long long v386 = xmmword_55F40;
                CGFloat v387 = height;
                long long v388 = xmmword_55F30;
                long long v389 = xmmword_55F40;
                CGFloat v390 = height;
                CGFloat v391 = width;
                long long v392 = xmmword_55F30;
                uint64_t v393 = 0x3FF0000000000000;
                uint64_t v394 = 0;
                uint64_t v395 = 0;
                CGFloat v396 = width;
                long long v397 = xmmword_55F50;
                long long v36 = 0uLL;
                long long v399 = 0u;
                long long v400 = 0u;
                uint64_t v398 = 0x3FF0000000000000;
                uint64_t v401 = 0x3FF0000000000000;
                long long v402 = xmmword_55F40;
                CGFloat v403 = height;
                uint64_t v404 = 0;
                if ((v32 - 9) >= 0xFFFFFFF8) {
                  int v37 = v32 - 1;
                }
                else {
                  int v37 = 0;
                }
                v38 = &v371 + v37;
                long long v39 = *(_OWORD *)&v38->a;
                long long v40 = *(_OWORD *)&v38->tx;
                *(_OWORD *)&v334.c = *(_OWORD *)&v38->c;
                *(_OWORD *)&v334.tdouble x = v40;
                *(_OWORD *)&v334.a = v39;
              }
              *(_OWORD *)&v371.tdouble x = v36;
              *(_OWORD *)&v371.c = v36;
              *(_OWORD *)&v371.a = v36;
              CGAffineTransform v333 = v334;
              CGAffineTransformInvert(&v371, &v333);
              v41 = v23;
              if (v32 != 1) {
                v41 = [(CIImage *)v23 imageByApplyingOrientation:v32];
              }
              [(CIImage *)v41 extent];
              double v43 = v42;
              if ([v25 sanityCheckStatus] == 1)
              {
                [v25 coreImageROIrect];
                CGFloat v45 = v44;
                CGFloat v47 = v46;
                CGFloat v49 = v48;
                CGFloat v51 = v50;
                [v25 imageWidthScale];
                float v53 = v43 / v52;
                CGAffineTransformMakeScale(&v332, v53, v53);
                v406.origin.double x = v45;
                v406.origin.double y = v47;
                v406.size.CGFloat width = v49;
                v406.size.CGFloat height = v51;
                CGRect v407 = CGRectApplyAffineTransform(v406, &v332);
                NSRect v408 = NSIntegralRectWithOptions(v407, 0xF00uLL);
                CGRect v409 = CGRectInset(v408, v408.size.width * -0.300000012 + v408.size.width * -0.300000012, v408.size.height * -0.300000012);
                CGAffineTransform v331 = v371;
                CGRect v410 = CGRectApplyAffineTransform(v409, &v331);
                double x = v410.origin.x;
                double y = v410.origin.y;
                double v56 = v410.size.width;
                double v57 = v410.size.height;
                id v58 = objc_alloc_init((Class)NSMutableDictionary);
                id v59 = objc_alloc_init((Class)NSMutableArray);
                [v59 addObject:v25];
                objc_msgSend(v58, "setValue:forKey:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", x, y, v56, v57), @"unionRect");
                [v58 setValue:v59 forKey:@"faceLandmarksArray"];
                id v60 = objc_alloc_init((Class)NSMutableArray);
                long long v327 = 0u;
                long long v328 = 0u;
                long long v329 = 0u;
                long long v330 = 0u;
                id v61 = [obj countByEnumeratingWithState:&v327 objects:v367 count:16];
                if (v61)
                {
                  id v62 = v61;
                  uint64_t v63 = *(void *)v328;
                  do
                  {
                    for (i = 0; i != v62; i = (char *)i + 1)
                    {
                      if (*(void *)v328 != v63) {
                        objc_enumerationMutation(obj);
                      }
                      v65 = *(void **)(*((void *)&v327 + 1) + 8 * i);
                      objc_msgSend(objc_msgSend(v65, "objectForKeyedSubscript:", @"unionRect"), "rectValue");
                      CGFloat v67 = v66;
                      CGFloat v69 = v68;
                      CGFloat v71 = v70;
                      CGFloat v73 = v72;
                      v411.origin.double x = x;
                      v411.origin.double y = y;
                      v411.size.CGFloat width = v56;
                      v411.size.CGFloat height = v57;
                      v414.origin.double x = v67;
                      v414.origin.double y = v69;
                      v414.size.CGFloat width = v71;
                      v414.size.CGFloat height = v73;
                      if (CGRectIntersectsRect(v411, v414))
                      {
                        v412.origin.double x = v67;
                        v412.origin.double y = v69;
                        v412.size.CGFloat width = v71;
                        v412.size.CGFloat height = v73;
                        v415.origin.double x = x;
                        v415.origin.double y = y;
                        v415.size.CGFloat width = v56;
                        v415.size.CGFloat height = v57;
                        CGRect v413 = CGRectUnion(v412, v415);
                        double x = v413.origin.x;
                        double y = v413.origin.y;
                        double v56 = v413.size.width;
                        double v57 = v413.size.height;
                        objc_msgSend(v59, "addObjectsFromArray:", objc_msgSend(v65, "objectForKeyedSubscript:", @"faceLandmarksArray"));
                        objc_msgSend(v58, "setValue:forKey:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", x, y, v56, v57), @"unionRect");
                        [v58 setValue:v59 forKey:@"faceLandmarksArray"];
                      }
                      else
                      {
                        [v60 addObject:v65];
                      }
                    }
                    id v62 = [obj countByEnumeratingWithState:&v327 objects:v367 count:16];
                  }
                  while (v62);
                }
                [v60 addObject:v58];

                id obj = v60;
                v2 = (CIPortraitEffectContour *)p_isa;
                v23 = v296;
                double v7 = v298;
                v19 = v309;
                id v21 = v311;
              }
              uint64_t v22 = v313;
            }
            uint64_t v24 = v314 + 1;
          }
          while ((id)(v314 + 1) != v21);
          id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v335 objects:v368 count:16];
        }
        while (v21);
      }
      else
      {
        v23 = v15;
      }
      long long v325 = 0u;
      long long v326 = 0u;
      long long v323 = 0u;
      long long v324 = 0u;
      id v293 = [obj countByEnumeratingWithState:&v323 objects:v366 count:16];
      if (!v293) {
        goto LABEL_90;
      }
      v90 = 0;
      uint64_t v292 = *(void *)v324;
      v91 = &OBJC_IVAR___CIPortraitSkinMaskProcessor__inputFaceLandmarks;
      double v92 = 1.0;
      while (2)
      {
        uint64_t v93 = 0;
        do
        {
          v295 = v90;
          if (*(void *)v324 != v292) {
            objc_enumerationMutation(obj);
          }
          uint64_t v294 = v93;
          v94 = *(void **)(*((void *)&v323 + 1) + 8 * v93);
          objc_msgSend(objc_msgSend(v94, "objectForKeyedSubscript:", @"unionRect"), "rectValue");
          v90 = -[CIImage imageByCroppingToRect:](v23, "imageByCroppingToRect:");
          id v95 = [v94 objectForKeyedSubscript:@"faceLandmarksArray"];
          long long v319 = 0u;
          long long v320 = 0u;
          long long v321 = 0u;
          long long v322 = 0u;
          id v299 = v95;
          id v308 = [v95 countByEnumeratingWithState:&v319 objects:v365 count:16];
          if (v308)
          {
            uint64_t v96 = *(void *)v320;
            uint64_t v297 = *(void *)v320;
            do
            {
              uint64_t v97 = 0;
              do
              {
                if (*(void *)v320 != v96) {
                  objc_enumerationMutation(v299);
                }
                v98 = *(void **)(*((void *)&v319 + 1) + 8 * v97);
                id v99 = objc_msgSend(objc_alloc((Class)(v91 + 932)), "initWithFaceLandmarkDictionary:forImageRect:", v98, v306, v305, v7, v304);
                float v100 = 0.0;
                float v101 = 0.0;
                if ([v98 objectForKeyedSubscript:@"faceJunkinessIndex"])
                {
                  objc_msgSend(objc_msgSend(v98, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
                  float v101 = v102;
                }
                uint64_t v315 = v97;
                if ([v98 objectForKeyedSubscript:@"faceOrientationIndex"])
                {
                  objc_msgSend(objc_msgSend(v98, "objectForKeyedSubscript:", @"faceOrientationIndex"), "floatValue");
                  float v100 = v103;
                }
                float v104 = 0.0;
                float v105 = 0.0;
                if ([v98 objectForKeyedSubscript:@"faceBoundingBox"])
                {
                  objc_msgSend(objc_msgSend(objc_msgSend(v98, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
                  float v105 = v106;
                }
                if ([v98 objectForKeyedSubscript:@"roll"])
                {
                  objc_msgSend(objc_msgSend(v98, "objectForKeyedSubscript:", @"roll"), "floatValue");
                  float v104 = fabsf(v107);
                }
                if (v101 < -0.2 && v105 > 0.15 && v104 < 1.05)
                {
                  float v303 = v100;
                  id v108 = [v98 objectForKeyedSubscript:@"orientation"];
                  [v99 faceWidth];
                  float v110 = v109 / v7;
                  [(NSNumber *)v2->super.inputScale floatValue];
                  double v112 = fmin(v110 * 1.8, v92);
                  float v113 = v112 * v111;
                  float v312 = v113;
                  float v114 = fmin(v112 * 1.05, v92);
                  float v310 = v114;
                  float v115 = fmin(v110 * 1.05, v92);
                  [v99 centerNose];
                  double v117 = v116;
                  [v99 centerNose];
                  double v119 = v118;
                  [v99 centerChin];
                  double v121 = v120;
                  [v99 centerChin];
                  v123 = +[CIVector vectorWithX:v117 Y:v119 Z:v121 W:v122];
                  [v99 leftEye];
                  double v125 = v124;
                  [v99 leftEye];
                  double v127 = v126;
                  [v99 rightEye];
                  double v129 = v128;
                  [v99 rightEye];
                  v300 = +[CIVector vectorWithX:v125 Y:v127 Z:v129 W:v130];
                  if ([v108 intValue] == 6
                    || (float v131 = 0.0, [v108 intValue] == 8))
                  {
                    float v131 = 1.5708;
                  }
                  [v99 centerNose];
                  *(float *)&double v132 = v132;
                  float v301 = *(float *)&v132;
                  [v99 centerNose];
                  float v134 = v133;
                  [v99 faceWidth];
                  float v136 = v135 * 0.525;
                  [v99 faceHeight];
                  float v138 = v137 * 3.0 * v115;
                  __float2 v139 = __sincosf_stret(v131);
                  long double v140 = sin(v131 + v131);
                  v141 = +[CIVector vectorWithX:(float)(v139.__cosval * v139.__cosval) / ((v136 + v136) * v136)+ (float)(v139.__sinval * v139.__sinval) / ((v138 + v138) * v138) Y:(double)(v140 / (v138 * 4.0 * v138) - v140 / (v136 * 4.0 * v136)) Z:(float)(v139.__sinval * v139.__sinval) / ((v136 + v136) * v136)+ (float)(v139.__cosval * v139.__cosval) / ((v138 + v138) * v138) W:0.7];
                  v142 = +[CIVector vectorWithX:v301 Y:v134];
                  id v143 = [(CIPortraitEffectContour *)v2 _faceVignette];
                  [p_isa[9] extent];
                  v364[0] = v90;
                  v364[1] = v307;
                  v364[2] = v142;
                  v364[3] = v141;
                  v307 = (CIImage *)objc_msgSend(v143, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v364, 4), v144, v145, v146, v147);
                  double v302 = v303;
                  double v148 = 0.5 - fabs(v303 * 0.5 / 3.14159265);
                  if (v148 < 0.0) {
                    double v148 = 0.0;
                  }
                  float v149 = v148;
                  v362[0] = @"inputImage";
                  v362[1] = @"inputCenter";
                  v363[0] = v90;
                  v363[1] = v123;
                  v362[2] = @"inputStrength";
                  v363[2] = +[NSNumber numberWithDouble:v149 + 1.4];
                  v362[3] = @"inputRotate";
                  *(float *)&double v150 = v131;
                  v363[3] = +[NSNumber numberWithFloat:v150];
                  v363[4] = &off_7A580;
                  v362[4] = @"inputDarken";
                  v362[5] = @"inputWidth";
                  [v99 faceWidth];
                  v363[5] = +[NSNumber numberWithDouble:v151 * 0.175];
                  v362[6] = @"inputHeight";
                  [v99 faceHeight];
                  v363[6] = +[NSNumber numberWithDouble:v152 * 0.35];
                  v153 = [(CIImage *)v90 imageByApplyingFilter:@"CIPortraitLightingSpot" withInputParameters:+[NSDictionary dictionaryWithObjects:v363 forKeys:v362 count:7]];
                  v360[0] = @"inputImage";
                  v360[1] = @"inputCenter";
                  v361[0] = v153;
                  v361[1] = v123;
                  v361[2] = v300;
                  v360[2] = @"inputEyes";
                  v360[3] = @"inputStrength";
                  double v154 = v310;
                  v361[3] = +[NSNumber numberWithDouble:v310 * 0.85];
                  v360[4] = @"inputRotate";
                  *(float *)&double v155 = v131;
                  v361[4] = +[NSNumber numberWithFloat:v155];
                  v360[5] = @"inputScale";
                  *(float *)&double v156 = v312;
                  v361[5] = +[NSNumber numberWithFloat:v156];
                  v360[6] = @"inputWidth";
                  [v99 faceWidth];
                  v361[6] = +[NSNumber numberWithDouble:v157 * 0.4];
                  v360[7] = @"inputHeight";
                  [v99 faceHeight];
                  v361[7] = +[NSNumber numberWithDouble:v158 * 0.35];
                  v159 = [(CIImage *)v153 imageByApplyingFilter:@"CIPortraitLightingContour" withInputParameters:+[NSDictionary dictionaryWithObjects:v361 forKeys:v360 count:8]];
                  [v99 centerChin];
                  double v161 = v160;
                  [v99 centerChin];
                  double v163 = v162;
                  [v99 centerChin];
                  double v165 = v164;
                  [v99 centerChin];
                  v167 = +[CIVector vectorWithX:v161 Y:v163 Z:v165 W:v166];
                  v358[0] = @"inputImage";
                  v358[1] = @"inputCenter";
                  v359[0] = v159;
                  v359[1] = v167;
                  v359[2] = &off_7A6B0;
                  v358[2] = @"inputStrength";
                  v358[3] = @"inputRotate";
                  *(float *)&double v168 = v131;
                  v359[3] = +[NSNumber numberWithFloat:v168];
                  v359[4] = &off_7A580;
                  v358[4] = @"inputDarken";
                  v358[5] = @"inputWidth";
                  [v99 faceWidth];
                  v359[5] = +[NSNumber numberWithDouble:v169 * 0.035];
                  v358[6] = @"inputHeight";
                  [v99 faceWidth];
                  v359[6] = +[NSNumber numberWithDouble:v170 * 0.035];
                  v171 = [(CIImage *)v159 imageByApplyingFilter:@"CIPortraitLightingSpot" withInputParameters:+[NSDictionary dictionaryWithObjects:v359 forKeys:v358 count:7]];
                  double v172 = *((double *)[v99 rightKickLights] + 4);
                  *(float *)&double v172 = (v172 + *(double *)[v99 leftKickLights]) * 0.5;
                  double v173 = *((double *)[v99 rightKickLights] + 5);
                  float v174 = (v173 + *((double *)[v99 leftKickLights] + 1)) * 0.5;
                  v175 = +[CIVector vectorWithX:*(float *)&v172 Y:v174];
                  double v92 = 1.0;
                  double v176 = 1.0 - fabs(v302 * 0.35 / 3.14159265);
                  if (v176 < 0.0) {
                    double v176 = 0.0;
                  }
                  float v177 = v176;
                  v356[0] = @"inputCenter";
                  v356[1] = @"inputChin";
                  v357[0] = v175;
                  v357[1] = v167;
                  v356[2] = @"inputStrength";
                  v357[2] = +[NSNumber numberWithDouble:v177 * v154];
                  v356[3] = @"inputFaceOrientation";
                  *(float *)&double v178 = v303;
                  v357[3] = +[NSNumber numberWithFloat:v178];
                  v357[4] = v108;
                  v356[4] = @"inputOrientation";
                  v356[5] = @"inputWidth";
                  [v99 faceWidth];
                  v357[5] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                  v356[6] = @"inputHeight";
                  [v99 faceHeight];
                  v357[6] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                  v179 = [(CIImage *)v171 imageByApplyingFilter:@"CIPortraitLightingNeckContour" withInputParameters:+[NSDictionary dictionaryWithObjects:v357 forKeys:v356 count:7]];
                  [v99 centerNose];
                  v180 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
                  [v99 bottomShadow];
                  v181 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:");
                  [p_isa[23] floatValue];
                  float v183 = v182 * v310;
                  v354[0] = @"inputImage";
                  v354[1] = @"inputCenter1";
                  v355[0] = v179;
                  v355[1] = v180;
                  v354[2] = @"inputBottom1";
                  v354[3] = @"inputCenter2";
                  v355[2] = v181;
                  v355[3] = v180;
                  v354[4] = @"inputHeight1";
                  [v99 faceHeight];
                  v355[4] = +[NSNumber numberWithDouble:v184 * 0.45];
                  v354[5] = @"inputWidth1";
                  [v99 faceWidth];
                  v355[5] = +[NSNumber numberWithDouble:v185 * 0.35];
                  v354[6] = @"inputHeight2";
                  [v99 faceHeight];
                  v355[6] = +[NSNumber numberWithDouble:v186 * 0.85];
                  v354[7] = @"inputWidth2";
                  [v99 faceWidth];
                  v355[7] = +[NSNumber numberWithDouble:v187 * 0.55];
                  v355[8] = &off_7A540;
                  v354[8] = @"inputContrast";
                  v354[9] = @"inputBrighten";
                  v355[9] = +[NSNumber numberWithDouble:v154 * 1.5];
                  v354[10] = @"inputStrength";
                  *(float *)&double v188 = v183;
                  v355[10] = +[NSNumber numberWithFloat:v188];
                  v189 = [(CIImage *)v179 imageByApplyingFilter:@"CIPortraitLightingFront" withInputParameters:+[NSDictionary dictionaryWithObjects:v355 forKeys:v354 count:11]];
                  v190 = (double *)[v99 leftContour];
                  v191 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v190[2], v190[3]);
                  v192 = (double *)[v99 leftContour];
                  v193 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v192[4], v192[5]);
                  v194 = (double *)[v99 leftContour];
                  v195 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v194[6], v194[7]);
                  v196 = (double *)[v99 rightContour];
                  v197 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v196[2], v196[3]);
                  v198 = (double *)[v99 rightContour];
                  v199 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v198[4], v198[5]);
                  v200 = (double *)[v99 rightContour];
                  v201 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v200[6], v200[7]);
                  double v202 = 1.0 - fabs(v302 * 0.85 / 3.14159265);
                  if (v202 < 0.0) {
                    double v202 = 0.0;
                  }
                  float v203 = v202;
                  [p_isa[22] floatValue];
                  float v205 = (float)(v204 * v310) * v203;
                  v352[0] = @"inputImage";
                  v352[1] = @"inputPt1";
                  v353[0] = v189;
                  v353[1] = v191;
                  v352[2] = @"inputPt2";
                  v352[3] = @"inputPt3";
                  v353[2] = v193;
                  v353[3] = v195;
                  v352[4] = @"inputPt4";
                  v352[5] = @"inputPt5";
                  v353[4] = v197;
                  v353[5] = v199;
                  v353[6] = v201;
                  v352[6] = @"inputPt6";
                  v352[7] = @"inputWidth";
                  *(float *)&double v206 = v312 * 40.0;
                  v353[7] = +[NSNumber numberWithFloat:v206];
                  v353[8] = &off_7A610;
                  v352[8] = @"inputRotate";
                  v352[9] = @"inputOrientation";
                  v353[9] = v108;
                  v352[10] = @"inputStrength";
                  v353[10] = +[NSNumber numberWithDouble:v205 * 0.8];
                  id v207 = objc_msgSend(v189, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSide", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v353, v352, 11));
                  v208 = (double *)[v99 leftContour];
                  v209 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v208, v208[1]);
                  v210 = (double *)[v99 leftContour];
                  v211 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v210[2], v210[3]);
                  v212 = (double *)[v99 leftContour];
                  v213 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v212[4], v212[5]);
                  v214 = (double *)[v99 rightContour];
                  v215 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v214[4], v214[5]);
                  v216 = (double *)[v99 rightContour];
                  v217 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v216[6], v216[7]);
                  v218 = (double *)[v99 rightContour];
                  v219 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v218[8], v218[9]);
                  v350[0] = @"inputImage";
                  v350[1] = @"inputPt1";
                  v351[0] = v207;
                  v351[1] = v209;
                  v350[2] = @"inputPt2";
                  v350[3] = @"inputPt3";
                  v351[2] = v211;
                  v351[3] = v213;
                  v350[4] = @"inputPt4";
                  v350[5] = @"inputPt5";
                  v351[4] = v215;
                  v351[5] = v217;
                  v351[6] = v219;
                  v350[6] = @"inputPt6";
                  v350[7] = @"inputWidth";
                  *(float *)&double v220 = v312 * 40.0;
                  v351[7] = +[NSNumber numberWithFloat:v220];
                  v351[8] = &off_7A610;
                  v350[8] = @"inputRotate";
                  v350[9] = @"inputOrientation";
                  v351[9] = v108;
                  v350[10] = @"inputStrength";
                  *(float *)&double v221 = v205;
                  v351[10] = +[NSNumber numberWithFloat:v221];
                  id v222 = objc_msgSend(v207, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSide", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v351, v350, 11));
                  v223 = (double *)[v99 leftNose];
                  v224 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v223, v223[1]);
                  v225 = (double *)[v99 leftNose];
                  v226 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v225[2], v225[3]);
                  v227 = (double *)[v99 leftNose];
                  v228 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v227[4], v227[5]);
                  v229 = (double *)[v99 rightNose];
                  v230 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v229, v229[1]);
                  v231 = (double *)[v99 rightNose];
                  v232 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v231[2], v231[3]);
                  v233 = (double *)[v99 rightNose];
                  v234 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v233[4], v233[5]);
                  v348[0] = @"inputImage";
                  v348[1] = @"inputPt1";
                  v349[0] = v222;
                  v349[1] = v224;
                  v348[2] = @"inputPt2";
                  v348[3] = @"inputPt3";
                  v349[2] = v226;
                  v349[3] = v228;
                  v348[4] = @"inputPt4";
                  v348[5] = @"inputPt5";
                  v349[4] = v230;
                  v349[5] = v232;
                  v348[6] = @"inputPt6";
                  v348[7] = @"inputCenterBottom";
                  v349[6] = v234;
                  v349[7] = &off_7A580;
                  v348[8] = @"inputWidth";
                  *(float *)&double v235 = v312 * 30.0;
                  v349[8] = +[NSNumber numberWithFloat:v235];
                  v349[9] = &off_7A610;
                  v348[9] = @"inputRotate";
                  v348[10] = @"inputOrientation";
                  v349[10] = v108;
                  v348[11] = @"inputStrength";
                  v349[11] = +[NSNumber numberWithDouble:v154 * -0.3];
                  id v236 = objc_msgSend(v222, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingSide", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v349, v348, 12));
                  v237 = (double *)[v99 noseStrobe];
                  v238 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *v237, v237[1]);
                  v239 = (double *)[v99 noseStrobe];
                  v2 = (CIPortraitEffectContour *)p_isa;
                  v240 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v239[2], v239[3]);
                  v346[0] = @"inputImage";
                  v346[1] = @"inputCenter1";
                  v347[0] = v236;
                  v347[1] = v238;
                  v347[2] = v240;
                  v346[2] = @"inputCenter2";
                  v346[3] = @"inputWidth";
                  *(float *)&double v241 = v312 * 45.0;
                  v347[3] = +[NSNumber numberWithFloat:v241];
                  v347[4] = &off_7A610;
                  v346[4] = @"inputRotate";
                  v346[5] = @"inputOrientation";
                  v347[5] = v108;
                  v346[6] = @"inputStrength";
                  v347[6] = +[NSNumber numberWithDouble:v154];
                  v90 = (CIImage *)objc_msgSend(v236, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLightingStrobe", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v347, v346, 7));
                  double v7 = v298;
                  v91 = &OBJC_IVAR___CIPortraitSkinMaskProcessor__inputFaceLandmarks;
                  uint64_t v96 = v297;
                }

                uint64_t v97 = v315 + 1;
              }
              while (v308 != (id)(v315 + 1));
              id v242 = [v299 countByEnumeratingWithState:&v319 objects:v365 count:16];
              id v308 = v242;
            }
            while (v242);
          }
          if (!v90)
          {
            v90 = v295;
            v23 = v296;
            goto LABEL_88;
          }
          if (v295) {
            v90 = -[CIImage imageByCompositingOverImage:](v90, "imageByCompositingOverImage:");
          }
          uint64_t v93 = v294 + 1;
          v23 = v296;
        }
        while ((id)(v294 + 1) != v293);
        id v293 = [obj countByEnumeratingWithState:&v323 objects:v366 count:16];
        if (v293) {
          continue;
        }
        break;
      }
LABEL_88:
      if (v90) {
        v15 = [(CIImage *)v90 imageByCompositingOverImage:v23];
      }
      else {
LABEL_90:
      }
        v15 = v23;
      v89 = v307;
    }
    else
    {
      [(CIImage *)v2->super.inputImage extent];
      float v75 = v74 * 0.5;
      [(CIImage *)v2->super.inputImage extent];
      float v77 = v76 * 0.5;
      double v78 = v75;
      float v79 = v75 * 0.3;
      double v80 = v77;
      float v81 = v77 * 0.3;
      v82 = +[CIVector vectorWithX:1.0 / ((v79 + v79) * v79) + 0.0 / ((v81 + v81) * v81) Y:0.0 / (v81 * 4.0 * v81) - 0.0 / (v79 * 4.0 * v79) Z:0.0 / ((v79 + v79) * v79) + 1.0 / ((v81 + v81) * v81) W:0.7];
      v83 = +[CIVector vectorWithX:v78 Y:v80];
      id v84 = [(CIPortraitEffectContour *)v2 _faceVignette];
      [(CIImage *)v2->super.inputImage extent];
      v345[0] = v15;
      v345[1] = v17;
      v345[2] = v83;
      v345[3] = v82;
      v89 = (CIImage *)objc_msgSend(v84, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v345, 4), v85, v86, v87, v88);
      int v291 = 1041865114;
    }
    id v243 = [(CIPortraitEffectContour *)v2 _applyVignette];
    [(CIImage *)v2->super.inputImage extent];
    v344[0] = v15;
    v344[1] = v89;
    v344[2] = &off_7A580;
    id v248 = objc_msgSend(v243, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v344, 3), v244, v245, v246, v247);
    [(NSNumber *)v2->inputContour floatValue];
    if (v249 > 0.01)
    {
      [(NSNumber *)v2->super.inputScale floatValue];
      double v251 = 220.0 / v250;
      [v248 extent];
      double v253 = v251 / v252;
      [(NSNumber *)v2->super.inputScale floatValue];
      double v255 = 220.0 / v254;
      [v248 extent];
      v343[0] = +[CIVector vectorWithX:v253 Y:v255 / v256];
      v342[0] = @"inputScale";
      v342[1] = @"inputStrength";
      LODWORD(v257) = v291;
      v343[1] = +[NSNumber numberWithFloat:v257];
      id v248 = objc_msgSend(v248, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLocalContrast", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v343, v342, 2));
    }
    inputDepthMap = v2->inputDepthMap;
    if (inputDepthMap)
    {
      id v259 = [(CIPortraitEffectContour *)v2 _prepareDepth];
      [(CIImage *)inputDepthMap extent];
      inputDepthThreshold = v2->inputDepthThreshold;
      v341[0] = inputDepthMap;
      v341[1] = inputDepthThreshold;
      id v265 = objc_msgSend(v259, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v341, 2), v261, v262, v263, v264);
      [(CIImage *)v2->inputDepthMap extent];
      double v267 = v266;
      [(CIImage *)v2->super.inputImage extent];
      if (v267 != v268)
      {
        [(CIImage *)v2->super.inputImage extent];
        float v270 = v269;
        [(CIImage *)v2->inputDepthMap extent];
        float v272 = v271;
        float v273 = v270 / v272;
        [(CIImage *)v2->super.inputImage extent];
        float v275 = v274;
        [(CIImage *)v2->inputDepthMap extent];
        float v277 = v276;
        CGAffineTransformMakeScale(&v318, v273, (float)(v275 / v277));
        id v265 = [v265 imageByApplyingTransform:&v318];
      }
      id v278 = [v248 imageByApplyingFilter:@"CIVibrance" withInputParameters:&off_7DE50];
      id v279 = [(CIPortraitEffectContour *)v2 _blendSingleChannelMask];
      [(CIImage *)v2->super.inputImage extent];
      v280 = v2->super.inputImage;
      v340[0] = v278;
      v340[1] = v280;
      v340[2] = v265;
      id v248 = objc_msgSend(v279, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v340, 3), v281, v282, v283, v284);
    }
    [(NSNumber *)v2->super.inputStrength floatValue];
    if (v285 < 1.0)
    {
      id v286 = [(CIPortraitEffectContour *)v2 _mixKernel];
      [(CIImage *)v2->super.inputImage extent];
      v339[0] = v2->super.inputImage;
      v339[1] = v248;
      v339[2] = v2->super.inputStrength;
      id v248 = objc_msgSend(v286, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v339, 3), v287, v288, v289, v290);
    }
    return [v248 _imageByRenderingToIntermediate];
  }
  return result;
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

- (CIImage)inputDepthMap
{
  return self->inputDepthMap;
}

- (void)setInputDepthMap:(id)a3
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