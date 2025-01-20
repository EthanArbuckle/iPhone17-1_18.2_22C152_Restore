@interface LightingFacePoints
- (CGPoint)bottomShadow;
- (CGPoint)centerChin;
- (CGPoint)centerNose;
- (CGPoint)chinSpot;
- (CGPoint)leftCheekContour;
- (CGPoint)leftCheekStrobe;
- (CGPoint)leftChinContour;
- (CGPoint)leftContour;
- (CGPoint)leftEye;
- (CGPoint)leftEyeOutline;
- (CGPoint)leftKickLights;
- (CGPoint)leftLipContour;
- (CGPoint)leftNose;
- (CGPoint)leftNoseContour;
- (CGPoint)neckContour1;
- (CGPoint)neckContourLeft;
- (CGPoint)neckContourRight;
- (CGPoint)noseProtect;
- (CGPoint)noseStrobe;
- (CGPoint)noseTip;
- (CGPoint)rightCheekContour;
- (CGPoint)rightCheekStrobe;
- (CGPoint)rightChinContour;
- (CGPoint)rightContour;
- (CGPoint)rightEye;
- (CGPoint)rightEyeOutline;
- (CGPoint)rightKickLights;
- (CGPoint)rightLipContour;
- (CGPoint)rightNose;
- (CGPoint)rightNoseContour;
- (CGRect)faceRect;
- (LightingFacePoints)initWithFaceLandmarkDictionary:(id)a3 forImageRect:(CGRect)a4;
- (float)faceHeight;
- (float)faceWidth;
- (float)leftEyeHeight;
- (float)leftEyeWidth;
- (float)noseHeight;
- (float)noseWidth;
- (float)rightEyeHeight;
- (float)rightEyeWidth;
- (void)setFaceRect:(CGRect)a3;
@end

@implementation LightingFacePoints

- (CGPoint)rightKickLights
{
  return self->rightKickLights;
}

- (CGPoint)leftKickLights
{
  return self->leftKickLights;
}

- (CGPoint)rightContour
{
  return self->rightContour;
}

- (CGPoint)leftContour
{
  return self->leftContour;
}

- (CGPoint)leftEye
{
  double x = self->leftEye.x;
  double y = self->leftEye.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)rightEye
{
  double x = self->rightEye.x;
  double y = self->rightEye.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)centerNose
{
  double x = self->centerNose.x;
  double y = self->centerNose.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomShadow
{
  double x = self->bottomShadow.x;
  double y = self->bottomShadow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)centerChin
{
  double x = self->centerChin.x;
  double y = self->centerChin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)rightNose
{
  return self->rightNose;
}

- (CGPoint)leftNose
{
  return self->leftNose;
}

- (CGPoint)noseStrobe
{
  return self->noseStrobe;
}

- (CGPoint)leftCheekContour
{
  return self->leftCheekContour;
}

- (CGPoint)leftCheekStrobe
{
  return self->leftCheekStrobe;
}

- (CGPoint)rightCheekContour
{
  return self->rightCheekContour;
}

- (CGPoint)rightCheekStrobe
{
  return self->rightCheekStrobe;
}

- (float)faceHeight
{
  return self->faceHeight;
}

- (float)faceWidth
{
  return self->faceWidth;
}

- (CGPoint)leftChinContour
{
  return self->leftChinContour;
}

- (CGPoint)leftNoseContour
{
  return self->leftNoseContour;
}

- (CGPoint)rightChinContour
{
  return self->rightChinContour;
}

- (CGPoint)rightNoseContour
{
  return self->rightNoseContour;
}

- (CGPoint)leftLipContour
{
  return self->leftLipContour;
}

- (CGPoint)rightLipContour
{
  return self->rightLipContour;
}

- (CGPoint)neckContour1
{
  return self->neckContour1;
}

- (CGPoint)neckContourLeft
{
  return self->neckContourLeft;
}

- (CGPoint)neckContourRight
{
  return self->neckContourRight;
}

- (CGPoint)chinSpot
{
  return self->chinSpot;
}

- (CGPoint)noseProtect
{
  return self->noseProtect;
}

- (float)leftEyeHeight
{
  return self->leftEyeHeight;
}

- (float)leftEyeWidth
{
  return self->leftEyeWidth;
}

- (float)rightEyeHeight
{
  return self->rightEyeHeight;
}

- (float)rightEyeWidth
{
  return self->rightEyeWidth;
}

- (CGPoint)noseTip
{
  double x = self->noseTip.x;
  double y = self->noseTip.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (float)noseWidth
{
  return self->noseWidth;
}

- (float)noseHeight
{
  return self->noseHeight;
}

- (CGPoint)rightEyeOutline
{
  return self->rightEyeOutline;
}

- (CGPoint)leftEyeOutline
{
  return self->leftEyeOutline;
}

- (LightingFacePoints)initWithFaceLandmarkDictionary:(id)a3 forImageRect:(CGRect)a4
{
  CGRect v119 = a4;
  int v6 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"orientation"), "intValue");
  id v7 = [a3 objectForKeyedSubscript:@"allPoints"];
  id v8 = [v7 count];
  uint64_t v9 = 65;
  unint64_t v102 = (unint64_t)v8;
  if ((unint64_t)v8 > 0x41) {
    uint64_t v9 = (uint64_t)v8;
  }
  v104 = [+[NSMutableData dataWithLength:16 * v9] mutableBytes];
  id v10 = [a3 objectForKeyedSubscript:@"faceBoundingBox"];
  objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"x"), "doubleValue");
  CGFloat v12 = v11;
  objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"y"), "doubleValue");
  CGFloat v14 = v13;
  objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"w"), "doubleValue");
  double v16 = v15;
  objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"h"), "doubleValue");
  double v18 = v17;
  v117.double x = v12;
  v117.double y = v14;
  v118.width = v16;
  v118.height = v17;
  CGSize v19 = v118;
  self->faceRect.origin = v117;
  self->faceRect.size = v19;
  v103 = self;
  if ([a3 objectForKeyedSubscript:@"faceOrientationIndex"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"faceOrientationIndex"), "floatValue");
    float v21 = v20;
  }
  else
  {
    float v21 = 0.0;
  }
  float64x2_t v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v22 = [v7 countByEnumeratingWithState:&v120 objects:&v124 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v121;
    do
    {
      v26 = 0;
      v27 = (void *)&v104[v24] + 1;
      do
      {
        if (*(void *)v121 != v25) {
          objc_enumerationMutation(v7);
        }
        v28 = *(void **)(*(void *)&v120.f64[1] + 8 * (void)v26);
        objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", @"x"), "doubleValue");
        uint64_t v30 = v29;
        objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", @"y"), "doubleValue");
        *(v27 - 1) = v30;
        void *v27 = v31;
        v26 = (char *)v26 + 1;
        v27 += 2;
      }
      while (v23 != v26);
      id v23 = [v7 countByEnumeratingWithState:&v120 objects:&v124 count:16];
      v24 += (uint64_t)v26;
    }
    while (v23);
  }
  v32 = (CGPoint *)(v104 + 48);
  v103->rightKickLights[0] = (CGPoint)v104[48];
  v33 = (CGPoint *)(v104 + 49);
  v103->rightKickLights[1] = (CGPoint)v104[49];
  v34 = (CGPoint *)(v104 + 50);
  v103->rightKickLights[2] = (CGPoint)v104[50];
  double v35 = v21;
  double v36 = 0.0;
  double v37 = 0.0;
  if (v21 < 0.0)
  {
    float v38 = fmax(v35 * 0.5 / 3.14159, -0.075);
    double v37 = v38;
  }
  v103->rightKickLights[0].double x = v103->rightKickLights[0].x - v37;
  v103->rightKickLights[1].double x = v103->rightKickLights[1].x - v37;
  v103->rightKickLights[2].double x = v103->rightKickLights[2].x - v37;
  v103->rightContour[0] = (CGPoint)v104[46];
  v103->rightContour[1] = (CGPoint)v104[47];
  v103->rightContour[2] = *v32;
  v103->rightContour[3] = *v33;
  v103->rightContour[4] = *v34;
  if (v21 < 0.0)
  {
    float v39 = fmax(v35 * 0.5 / 3.14159, -0.075);
    double v36 = v39;
  }
  v103->rightContour[0].double x = v103->rightContour[0].x - v36;
  v103->rightContour[1].double x = v103->rightContour[1].x - v36;
  v103->rightContour[2].double x = v103->rightContour[2].x - v36;
  v103->rightContour[3].double x = v103->rightContour[3].x - v36;
  v103->rightContour[4].double x = v103->rightContour[4].x - v36;
  v40 = (CGPoint *)(v104 + 40);
  v103->leftKickLights[0] = (CGPoint)v104[40];
  v41 = (CGPoint *)(v104 + 41);
  v103->leftKickLights[1] = (CGPoint)v104[41];
  v42 = (CGPoint *)(v104 + 42);
  v103->leftKickLights[2] = (CGPoint)v104[42];
  double v43 = 0.0;
  double v44 = 0.0;
  if (v21 > 0.0)
  {
    float v45 = fmin(v35 * 0.1 / 3.14159, 0.0075);
    double v44 = v45;
  }
  v46 = (CGPoint *)(v104 + 46);
  v47 = (CGPoint *)(v104 + 47);
  v103->leftKickLights[0].double x = v44 + v103->leftKickLights[0].x;
  v103->leftKickLights[1].double x = v44 + v103->leftKickLights[1].x;
  v103->leftKickLights[2].double x = v44 + v103->leftKickLights[2].x;
  v103->leftContour[0] = *v40;
  v103->leftContour[1] = *v41;
  v103->leftContour[2] = *v42;
  v48 = (CGPoint *)(v104 + 43);
  v103->leftContour[3] = (CGPoint)v104[43];
  v49 = (CGPoint *)(v104 + 44);
  v103->leftContour[4] = (CGPoint)v104[44];
  if (v21 > 0.0)
  {
    float v50 = fmin(v35 * 0.5 / 3.14159, 0.075);
    double v43 = v50;
  }
  p_leftEye = (float64x2_t *)&v103->leftEye;
  v103->leftContour[0].double x = v43 + v103->leftContour[0].x;
  v103->leftContour[1].double x = v43 + v103->leftContour[1].x;
  v103->leftContour[2].double x = v43 + v103->leftContour[2].x;
  v103->leftContour[3].double x = v43 + v103->leftContour[3].x;
  v103->leftContour[4].double x = v43 + v103->leftContour[4].x;
  p_double x = &v103->centerNose.x;
  v103->centerNose = (CGPoint)v104[61];
  float v52 = v18;
  v103->faceHeight = v52;
  float v53 = v16;
  v103->faceWidth = v53;
  v105 = &v103->bottomShadow.x;
  v103->bottomShadow = (CGPoint)v104[45];
  v103->bottomShadow.double y = v103->bottomShadow.y + v52 * -0.1;
  v101 = &v103->centerChin.x;
  __asm { FMOV            V0.2D, #0.5 }
  v103->centerChin = (CGPoint)vmulq_f64(vaddq_f64(*((float64x2_t *)v104 + 31), *((float64x2_t *)v104 + 45)), _Q0);
  v103->leftNose[0] = (CGPoint)v104[51];
  v103->leftNose[1] = (CGPoint)v104[52];
  v103->leftNose[2] = (CGPoint)v104[53];
  v103->leftNose[2].double x = v103->leftNose[2].x * 0.95;
  v103->rightNose[0] = (CGPoint)v104[57];
  v103->rightNose[0].double x = v103->rightNose[0].x * 1.05;
  v103->rightNose[1] = (CGPoint)v104[58];
  v103->rightNose[2] = (CGPoint)v104[59];
  v103->noseStrobe[0] = (CGPoint)v104[61];
  v99 = &v103->noseStrobe[1].x;
  v103->noseStrobe[1] = (CGPoint)v104[55];
  v103->noseProtect[0] = (CGPoint)v104[62];
  v103->noseProtect[1] = (CGPoint)v104[53];
  v103->noseProtect[2] = (CGPoint)v104[57];
  v103->leftCheekContour[0] = *v40;
  v103->leftCheekContour[1] = *v41;
  v103->leftCheekContour[2] = (CGPoint)v104[53];
  v103->leftCheekContour[2].double y = (*((double *)v104 + 107) + *((double *)v104 + 49)) * 0.5;
  v103->leftCheekStrobe[0] = (CGPoint)v104[52];
  v103->leftCheekStrobe[1] = (CGPoint)v104[53];
  v103->leftCheekStrobe[2] = *v40;
  v103->rightCheekContour[0] = (CGPoint)v104[57];
  v103->rightCheekContour[0].double y = (*((double *)v104 + 115) + *((double *)v104 + 57)) * 0.5;
  v103->rightCheekContour[1] = *v34;
  v103->rightCheekContour[2] = *v33;
  v103->rightCheekStrobe[0] = (CGPoint)v104[57];
  v103->rightCheekStrobe[1] = (CGPoint)v104[58];
  v103->rightCheekStrobe[2] = *v34;
  v103->leftChinContour[0] = *v42;
  v103->leftChinContour[1] = *v48;
  v103->leftChinContour[2] = *v49;
  v103->leftNoseContour[0] = (CGPoint)v104[51];
  v103->leftNoseContour[1] = (CGPoint)v104[52];
  v103->leftNoseContour[2] = (CGPoint)v104[53];
  v103->rightChinContour[0] = *v46;
  v103->rightChinContour[1] = *v47;
  v103->rightChinContour[2] = *v32;
  v103->rightNoseContour[0] = (CGPoint)v104[57];
  v103->rightNoseContour[1] = (CGPoint)v104[58];
  v103->rightNoseContour[2] = (CGPoint)v104[59];
  v103->leftLipContour[0] = (CGPoint)v104[33];
  v103->leftLipContour[1] = *v48;
  v103->leftLipContour[2] = *v49;
  v103->rightLipContour[0] = (CGPoint)v104[29];
  v103->rightLipContour[1] = *v46;
  v103->rightLipContour[2] = *v47;
  v103->neckContour1[0] = *v49;
  v103->neckContour1[1] = *v46;
  v103->neckContour1[2] = (CGPoint)v104[45];
  v103->neckContour1[0].double y = v103->neckContour1[0].y + -0.03;
  v103->neckContour1[1].double y = v103->neckContour1[1].y + -0.03;
  CGFloat v59 = v103->neckContour1[2].y + -0.18;
  v103->neckContour1[2].double y = v59;
  v103->neckContourLeft[0] = *v48;
  v103->neckContourLeft[1] = *v49;
  v103->neckContourLeft[2].double x = (*((double *)v104 + 86) + *((double *)v104 + 88)) * 0.5;
  CGFloat v60 = v59 + 0.02;
  v103->neckContourLeft[2].double y = v60;
  v103->neckContourRight[0] = *v46;
  v103->neckContourRight[1] = *v47;
  v103->neckContourRight[2].double x = (*((double *)v104 + 92) + *((double *)v104 + 94)) * 0.5;
  v103->neckContourRight[2].double y = v60;
  v103->chinSpot[0].double x = *((CGFloat *)v104 + 64);
  v103->chinSpot[0].double y = *((double *)v104 + 91) * 0.25 + *((double *)v104 + 65) * 0.75;
  v103->chinSpot[1].double x = *((CGFloat *)v104 + 60);
  v103->chinSpot[1].double y = *((double *)v104 + 91) * 0.25 + *((double *)v104 + 61) * 0.75;
  v103->chinSpot[2].double x = *((CGFloat *)v104 + 90);
  v103->chinSpot[2].double y = *((double *)v104 + 63) * 0.25 + *((double *)v104 + 91) * 0.75;
  v103->noseTip = (CGPoint)vmlaq_f64(vmulq_f64(*((float64x2_t *)v104 + 55), _Q0), _Q0, *((float64x2_t *)v104 + 62));
  v61 = (float64x2_t *)(v104 + 16);
  v103->rightEyeOutline[0] = (CGPoint)v104[16];
  v103->rightEyeOutline[1] = (CGPoint)v104[18];
  v103->rightEyeOutline[2] = (CGPoint)v104[20];
  v103->rightEyeOutline[3] = (CGPoint)v104[22];
  v62 = (float64x2_t *)(v104 + 8);
  v103->leftEyeOutline[0] = (CGPoint)v104[8];
  v103->leftEyeOutline[1] = (CGPoint)v104[10];
  v103->leftEyeOutline[2] = (CGPoint)v104[12];
  v103->leftEyeOutline[3] = (CGPoint)v104[14];
  float32x2_t v63 = 0;
  uint64_t v64 = 8;
  do
    float32x2_t v63 = vcvt_f32_f64(vaddq_f64((float64x2_t)v104[v64++], vcvtq_f64_f32(v63)));
  while ((v64 * 16) != 208);
  for (uint64_t i = 12; i != 16; ++i)
    float32x2_t v63 = vcvt_f32_f64(vaddq_f64((float64x2_t)v104[i], vcvtq_f64_f32(v63)));
  float32x2_t v66 = vcvt_f32_f64(vaddq_f64(*v62, vcvtq_f64_f32(v63)));
  __asm { FMOV            V0.2S, #10.0 }
  float64x2_t *p_leftEye = vcvtq_f64_f32(vdiv_f32(v66, _D0));
  float32x2_t v68 = 0;
  do
    float32x2_t v68 = vcvt_f32_f64(vaddq_f64((float64x2_t)v104[i++], vcvtq_f64_f32(v68)));
  while ((i * 16) != 336);
  for (uint64_t j = 20; j != 24; ++j)
    float32x2_t v68 = vcvt_f32_f64(vaddq_f64((float64x2_t)v104[j], vcvtq_f64_f32(v68)));
  uint64_t v70 = 0;
  v103->float64x2_t rightEye = (CGPoint)vcvtq_f64_f32(vdiv_f32(vcvt_f32_f64(vaddq_f64(*v61, vcvtq_f64_f32(v68))), _D0));
  float64x2_t v124 = *((float64x2_t *)v104 + 10);
  float64x2_t v120 = *((float64x2_t *)v104 + 14);
  float64x2_t v71 = *v62;
  float64x2_t v115 = *((float64x2_t *)v104 + 12);
  float64x2_t v116 = v71;
  float64x2_t v72 = *((float64x2_t *)v104 + 18);
  float64x2_t v113 = *((float64x2_t *)v104 + 22);
  float64x2_t v114 = v72;
  float64x2_t v73 = *v61;
  float64x2_t v111 = *((float64x2_t *)v104 + 20);
  float64x2_t v112 = v73;
  float64x2_t v74 = *((float64x2_t *)v104 + 62);
  float64x2_t v109 = *((float64x2_t *)v104 + 55);
  float64x2_t v110 = v74;
  do
  {
    float64x2_t rightEye = (float64x2_t)v103->rightKickLights[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightKickLights[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftKickLights[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftKickLights[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->rightNose[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightNose[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftNose[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftNose[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftCheekContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftCheekContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->rightCheekContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightCheekContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftCheekStrobe[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftCheekStrobe[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->rightCheekStrobe[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightCheekStrobe[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftChinContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftChinContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftNoseContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftNoseContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->rightChinContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightChinContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->rightNoseContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightNoseContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->leftLipContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftLipContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->rightLipContour[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightLipContour[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->neckContour1[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->neckContour1[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->neckContourLeft[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->neckContourLeft[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->neckContourRight[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->neckContourRight[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->chinSpot[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->chinSpot[v70].x);
    float64x2_t rightEye = (float64x2_t)v103->noseProtect[v70];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->noseProtect[v70++].x);
  }
  while (v70 != 3);
  for (uint64_t k = 0; k != 5; ++k)
  {
    float64x2_t rightEye = (float64x2_t)v103->rightContour[k];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightContour[k].x);
    float64x2_t rightEye = (float64x2_t)v103->leftContour[k];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftContour[k].x);
  }
  for (uint64_t m = 0; m != 4; ++m)
  {
    float64x2_t rightEye = (float64x2_t)v103->rightEyeOutline[m];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightEyeOutline[m].x);
    float64x2_t rightEye = (float64x2_t)v103->leftEyeOutline[m];
    sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftEyeOutline[m].x);
  }
  float64x2_t rightEye = *p_leftEye;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->leftEye.x);
  float64x2_t rightEye = (float64x2_t)v103->rightEye;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->rightEye.x);
  float64x2_t rightEye = *(float64x2_t *)p_x;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, p_x);
  float64x2_t rightEye = *(float64x2_t *)v105;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v105);
  float64x2_t rightEye = *(float64x2_t *)v101;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v101);
  float64x2_t rightEye = (float64x2_t)v103->noseStrobe[0];
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->noseStrobe[0].x);
  float64x2_t rightEye = *(float64x2_t *)v99;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v99);
  float64x2_t rightEye = (float64x2_t)v103->noseTip;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, &v103->noseTip.x);
  float64x2_t rightEye = v110;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v110.f64);
  float64x2_t rightEye = v109;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v109.f64);
  float64x2_t rightEye = v124;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v124.f64);
  float64x2_t rightEye = v120;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v120.f64);
  float64x2_t rightEye = v116;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v116.f64);
  float64x2_t rightEye = v115;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v115.f64);
  float64x2_t rightEye = v114;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v114.f64);
  float64x2_t rightEye = v113;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v113.f64);
  float64x2_t rightEye = v112;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v112.f64);
  float64x2_t rightEye = v111;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v111.f64);
  float v77 = v124.f64[1] - v120.f64[1];
  v103->leftEyeHeight = fabsf(v77);
  float v78 = v116.f64[0] - v115.f64[0];
  v103->leftEyeWidth = fabsf(v78);
  float v79 = v114.f64[1] - v113.f64[1];
  v103->rightEyeHeight = fabsf(v79);
  float v80 = v112.f64[0] - v111.f64[0];
  v103->rightEyeWidth = fabsf(v80);
  float v81 = v103->leftNose[2].x - v103->rightNose[0].x;
  v103->noseWidth = fabsf(v81);
  float v82 = v110.f64[1] - v109.f64[1];
  v103->noseHeight = fabsf(v82);
  int32x2_t v83 = vdup_n_s32((v6 - 5) < 4);
  v84.i64[0] = v83.u32[0];
  v84.i64[1] = v83.u32[1];
  *(float32x2_t *)&v103->faceHeight = vcvt_f32_f64(vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v84, 0x3FuLL)), (int8x16_t)v119.size, vextq_s8((int8x16_t)v119.size, (int8x16_t)v119.size, 8uLL)), vcvtq_f64_f32(*(float32x2_t *)&v103->faceHeight)));
  float64x2_t v106 = *(float64x2_t *)v104;
  float64x2_t v107 = v106;
  float64x2_t v85 = v106;
  float64x2_t v86 = v106;
  if (v102 > 1)
  {
    double v87 = v107.f64[1];
    unsigned int v88 = 2;
    double v89 = v106.f64[1];
    uint64_t v90 = 1;
    do
    {
      v91 = (double *)&v104[v90];
      double v92 = v91[1];
      if (*v91 < v85.f64[0]) {
        v85.f64[0] = *v91;
      }
      if (v92 < v87) {
        double v87 = v91[1];
      }
      if (*v91 >= v86.f64[0]) {
        v86.f64[0] = *v91;
      }
      if (v92 >= v89) {
        double v89 = v91[1];
      }
      uint64_t v90 = v88;
    }
    while (v102 > v88++);
    v107.f64[1] = v87;
    v106.f64[1] = v89;
  }
  v107.f64[0] = v85.f64[0];
  v106.f64[0] = v86.f64[0];
  float64x2_t rightEye = v107;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v107.f64);
  float64x2_t rightEye = v106;
  sub_28F18(v6, rightEye.f64, &v117.x, (uint64_t)&v119, v106.f64);
  if (v107.f64[0] >= v106.f64[0]) {
    double v94 = v106.f64[0];
  }
  else {
    double v94 = v107.f64[0];
  }
  if (v107.f64[1] >= v106.f64[1]) {
    double v95 = v106.f64[1];
  }
  else {
    double v95 = v107.f64[1];
  }
  CGFloat v96 = vabdd_f64(v106.f64[0], v107.f64[0]);
  CGFloat v97 = vabdd_f64(v106.f64[1], v107.f64[1]);
  v103->faceRect.origin.double x = v94;
  v103->faceRect.origin.double y = v95;
  v103->faceRect.size.width = v96;
  v103->faceRect.size.height = v97;
  return v103;
}

- (CGRect)faceRect
{
  objc_copyStruct(v6, &self->faceRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->faceRect, &v3, 32, 1, 0);
}

@end