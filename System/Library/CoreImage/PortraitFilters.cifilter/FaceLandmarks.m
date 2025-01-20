@interface FaceLandmarks
- (CGPath)headPerimeter;
- (CGPath)noseTipPerimeterPath;
- (CGPoint)leftToRightVec;
- (CGPoint)upVec;
- (CGRect)imageRect;
- (ComputedFaceData)faceData;
- (FaceLandmarks)initWithFaceLandmarks:(id)a3 forImageRect:(CGRect)a4;
- (Polyline)eyebrowLeftTopLine;
- (Polyline)eyebrowRightTopLine;
- (Polyline)mouthBottomLine;
- (Polyline)mouthTopLine;
- (PolylinePair)leftEyePair;
- (PolylinePair)mouthPerimeterLinePair;
- (PolylinePair)nosePair;
- (PolylinePair)rightEyePair;
- (PolylinePair)teethPair;
- (void)dealloc;
- (void)setEyebrowLeftTopLine:(id)a3;
- (void)setEyebrowRightTopLine:(id)a3;
- (void)setFaceData:(id)a3;
- (void)setHeadPerimeter:(CGPath *)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setLeftEyePair:(id)a3;
- (void)setLeftToRightVec:(CGPoint)a3;
- (void)setMouthBottomLine:(id)a3;
- (void)setMouthPerimeterLinePair:(id)a3;
- (void)setMouthTopLine:(id)a3;
- (void)setNosePair:(id)a3;
- (void)setNoseTipPerimeterPath:(CGPath *)a3;
- (void)setRightEyePair:(id)a3;
- (void)setTeethPair:(id)a3;
- (void)setUpVec:(CGPoint)a3;
@end

@implementation FaceLandmarks

- (FaceLandmarks)initWithFaceLandmarks:(id)a3 forImageRect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v319.receiver = self;
  v319.super_class = (Class)FaceLandmarks;
  v9 = [(FaceLandmarks *)&v319 init];
  [v9 setFaceData:objc_alloc_init(ComputedFaceData)];
  memset(&v318, 0, sizeof(v318));
  v328.origin.CGFloat x = x;
  v328.origin.CGFloat y = y;
  v328.size.CGFloat width = width;
  v328.size.double height = height;
  CGFloat v10 = CGRectGetWidth(v328);
  v329.origin.CGFloat x = x;
  v329.origin.CGFloat y = y;
  v329.size.CGFloat width = width;
  v329.size.double height = height;
  CGFloat v11 = CGRectGetHeight(v329);
  CGAffineTransformMakeScale(&v318, v10, v11);
  id v12 = [a3 objectForKeyedSubscript:@"allPoints"];
  id v13 = [v12 count];
  if ((unint64_t)v13 >= 0x41) {
    uint64_t v14 = 65;
  }
  else {
    uint64_t v14 = (uint64_t)v13;
  }
  uint64_t v311 = v14;
  id v15 = [v12 count];
  if ((unint64_t)v15 <= 0x41) {
    uint64_t v16 = 65;
  }
  else {
    uint64_t v16 = (uint64_t)v15;
  }
  v307 = [+[NSMutableData dataWithLength:16 * v16] mutableBytes];
  id v309 = a3;
  id v17 = [a3 objectForKeyedSubscript:@"faceBoundingBox"];
  objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"x"), "doubleValue");
  double v19 = v18;
  objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"y"), "doubleValue");
  double v21 = v20;
  objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"w"), "doubleValue");
  double v23 = v22;
  objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"h"), "doubleValue");
  double v25 = v24;
  long long v320 = 0u;
  long long v321 = 0u;
  long long v322 = 0u;
  long long v323 = 0u;
  id v26 = [v12 countByEnumeratingWithState:&v320 objects:v327 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v321;
    do
    {
      v30 = 0;
      v31 = &v307[16 * v28 + 8];
      do
      {
        if (*(void *)v321 != v29) {
          objc_enumerationMutation(v12);
        }
        v32 = *(void **)(*((void *)&v320 + 1) + 8 * (void)v30);
        objc_msgSend(objc_msgSend(v32, "objectForKeyedSubscript:", @"x"), "doubleValue");
        uint64_t v34 = v33;
        objc_msgSend(objc_msgSend(v32, "objectForKeyedSubscript:", @"y"), "doubleValue");
        *((void *)v31 - 1) = v34;
        *(void *)v31 = v35;
        v30 = (char *)v30 + 1;
        v31 += 16;
      }
      while (v27 != v30);
      id v27 = [v12 countByEnumeratingWithState:&v320 objects:v327 count:16];
      v28 += (uint64_t)v30;
    }
    while (v27);
  }
  if ([v309 sanityCheckStatus] == -1)
  {

    return 0;
  }
  float v36 = v25;
  float v37 = v23;
  float v38 = v21;
  float v39 = v19;
  v330.origin.CGFloat x = v39;
  v330.origin.CGFloat y = v38;
  v330.size.CGFloat width = v37;
  v330.size.double height = v36;
  CGAffineTransform v317 = v318;
  CGRect v331 = CGRectApplyAffineTransform(v330, &v317);
  CGFloat v40 = v331.origin.x;
  CGFloat v41 = v331.origin.y;
  CGFloat v42 = v331.size.width;
  CGFloat v43 = v331.size.height;
  memset(&v316, 0, sizeof(v316));
  CGFloat v44 = CGRectGetWidth(v331);
  v332.origin.CGFloat x = v40;
  v332.origin.CGFloat y = v41;
  v332.size.CGFloat width = v42;
  v332.size.double height = v43;
  CGFloat v45 = CGRectGetHeight(v332);
  CGAffineTransformMakeScale(&v316, v44, v45);
  CGAffineTransform t1 = v316;
  memset(&v315, 0, sizeof(v315));
  v333.origin.CGFloat x = v40;
  v333.origin.CGFloat y = v41;
  v333.size.CGFloat width = v42;
  v333.size.double height = v43;
  CGFloat MinX = CGRectGetMinX(v333);
  v334.origin.CGFloat x = v40;
  v334.origin.CGFloat y = v41;
  v334.size.CGFloat width = v42;
  v334.size.double height = v43;
  CGFloat MinY = CGRectGetMinY(v334);
  CGAffineTransformMakeTranslation(&t2, MinX, MinY);
  CGAffineTransformConcat(&v315, &t1, &t2);
  if (v311)
  {
    float64x2_t v48 = *(float64x2_t *)&v315.a;
    float64x2_t v49 = *(float64x2_t *)&v315.c;
    v50 = (double *)v307;
    float64x2_t v51 = *(float64x2_t *)&v315.tx;
    do
    {
      *(float64x2_t *)v50 = vaddq_f64(v51, vmlaq_n_f64(vmulq_n_f64(v49, v50[1]), v48, *v50));
      v50 += 2;
    }
    while (v50 != (double *)&v307[16 * v311]);
  }
  for (uint64_t i = 0; i != 64; i += 16)
    *(_OWORD *)&v9[i + 8] = *(_OWORD *)&v307[i];
  for (uint64_t j = 0; j != 64; j += 16)
    *(_OWORD *)&v9[j + 72] = *(_OWORD *)&v307[j + 64];
  uint64_t v54 = 0;
  *(_OWORD *)(v9 + 136) = *((_OWORD *)v307 + 33);
  do
  {
    *(_OWORD *)&v9[v54 + 152] = *(_OWORD *)&v307[v54 + 384];
    v54 += 16;
  }
  while (v54 != 96);
  uint64_t v55 = 0;
  v56 = v307 + 464;
  *(_OWORD *)(v9 + 248) = *((_OWORD *)v307 + 29);
  do
  {
    *(_OWORD *)&v9[v55 + 264] = *(_OWORD *)&v307[v55 + 480];
    v55 += 16;
  }
  while (v55 != 64);
  uint64_t v57 = 0;
  float32x2_t v58 = 0;
  do
  {
    float64x2_t v59 = *(float64x2_t *)&v307[v57 + 128];
    *(float64x2_t *)&v9[v57 + 488] = v59;
    float32x2_t v58 = vcvt_f32_f64(vaddq_f64(v59, vcvtq_f64_f32(v58)));
    v57 += 16;
  }
  while (v57 != 80);
  for (uint64_t k = 0; k != 64; k += 16)
  {
    float64x2_t v61 = *(float64x2_t *)&v307[k + 192];
    *(float64x2_t *)&v9[k + 648] = v61;
    float32x2_t v58 = vcvt_f32_f64(vaddq_f64(v61, vcvtq_f64_f32(v58)));
  }
  uint64_t v62 = 0;
  float64x2_t v63 = *((float64x2_t *)v307 + 8);
  *(float64x2_t *)(v9 + 712) = v63;
  *(float32x2_t *)&v63.f64[0] = vcvt_f32_f64(vaddq_f64(v63, vcvtq_f64_f32(v58)));
  __asm { FMOV            V0.2S, #10.0 }
  *(float64x2_t *)(v9 + 2040) = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)&v63.f64[0], _D0));
  float32x2_t v68 = 0;
  do
  {
    float64x2_t v69 = *(float64x2_t *)&v307[v62 + 256];
    *(float64x2_t *)&v9[v62 + 568] = v69;
    float32x2_t v68 = vcvt_f32_f64(vaddq_f64(v69, vcvtq_f64_f32(v68)));
    v62 += 16;
  }
  while (v62 != 80);
  for (uint64_t m = 0; m != 64; m += 16)
  {
    float64x2_t v71 = *(float64x2_t *)&v307[m + 320];
    *(float64x2_t *)&v9[m + 728] = v71;
    float32x2_t v68 = vcvt_f32_f64(vaddq_f64(v71, vcvtq_f64_f32(v68)));
  }
  *(_OWORD *)(v9 + 792) = *((_OWORD *)v307 + 16);
  float64x2_t v72 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_f64(vaddq_f64(*((float64x2_t *)v307 + 16), vcvtq_f64_f32(v68))), _D0));
  *(float64x2_t *)(v9 + 2056) = v72;
  *((float *)v9 + 518) = sub_35C80(*((double *)v9 + 255), *((double *)v9 + 256), v72.f64[0], v72.f64[1]);
  double v73 = sub_35CA8(*((double *)v9 + 257), *((double *)v9 + 258), *((double *)v9 + 255));
  objc_msgSend(v9, "setLeftToRightVec:", sub_35D1C(v73, v74));
  [v9 leftToRightVec];
  objc_msgSend(v9, "setUpVec:", sub_35CB4(v75, v76));
  uint64_t v77 = 0;
  *((float *)v9 + 519) = fmaxf(*((float *)v9 + 518) / 60.0, 2.0);
  do
  {
    *(_OWORD *)&v9[v77 + 808] = *(_OWORD *)&v307[v77 + 640];
    v77 += 16;
  }
  while (v77 != 96);
  for (uint64_t n = 0; n != 96; n += 16)
    *(_OWORD *)&v9[n + 904] = *(_OWORD *)&v307[n + 720];
  for (iuint64_t i = 0; ii != 144; ii += 16)
    *(_OWORD *)&v9[ii + 1544] = *(_OWORD *)&v307[ii + 816];
  for (juint64_t j = 0; jj != 96; jj += 16)
    *(_OWORD *)&v9[jj + 1688] = *(_OWORD *)&v307[jj + 880];
  for (kuint64_t k = 0; kk != 80; kk += 16)
    *(_OWORD *)&v9[kk + 1800] = *(_OWORD *)&v307[kk + 816];
  uint64_t v82 = 0;
  *(_OWORD *)(v9 + 1784) = *((_OWORD *)v307 + 60);
  do
  {
    *(_OWORD *)&v9[v82 + 1880] = *(_OWORD *)&v307[v82 + 960];
    v82 += 16;
  }
  while (v82 != 48);
  for (muint64_t m = 0; mm != 176; mm += 16)
    *(_OWORD *)&v9[mm + 1368] = *(_OWORD *)&v307[mm + 640];
  for (nuint64_t n = 0; nn != 64; nn += 16)
    *(_OWORD *)&v9[nn + 328] = *(_OWORD *)&v307[nn + 528];
  *(_OWORD *)(v9 + 392) = *v56;
  *(_OWORD *)(v9 + 408) = *((_OWORD *)v307 + 33);
  v85 = (long long *)(v307 + 624);
  for (uint64_t i1 = 424; i1 != 472; i1 += 16)
  {
    long long v87 = *v85--;
    *(_OWORD *)&v9[i1] = v87;
  }
  double v308 = width;
  *(_OWORD *)(v9 + 472) = *v56;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, *((CGFloat *)v9 + 171), *((CGFloat *)v9 + 172));
  for (uint64_t i2 = 0; i2 != 160; i2 += 16)
    CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v9[i2 + 1384], *(CGFloat *)&v9[i2 + 1392]);
  v306 = Mutable;
  double v90 = sub_35CEC(*((double *)v9 + 53), *((double *)v9 + 54), *((double *)v9 + 45), *((double *)v9 + 46), 0.6);
  uint64_t v92 = v91;
  v93 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  double *v93 = v90;
  *((void *)v93 + 1) = v92;
  double v94 = sub_35CEC(*((double *)v9 + 55), *((double *)v9 + 56), *((double *)v9 + 45), *((double *)v9 + 46), 0.6);
  uint64_t v96 = v95;
  v97 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  v97[2] = v94;
  *((void *)v97 + 3) = v96;
  double v98 = sub_35CEC(*((double *)v9 + 57), *((double *)v9 + 58), *((double *)v9 + 45), *((double *)v9 + 46), 0.6);
  uint64_t v100 = v99;
  v101 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  v101[4] = v98;
  *((void *)v101 + 5) = v100;
  double v102 = sub_35CEC(*((double *)v9 + 53), *((double *)v9 + 54), *((double *)v9 + 43), *((double *)v9 + 44), 0.6);
  uint64_t v104 = v103;
  v105 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  v105[6] = v102;
  *((void *)v105 + 7) = v104;
  double v106 = sub_35CEC(*((double *)v9 + 55), *((double *)v9 + 56), *((double *)v9 + 43), *((double *)v9 + 44), 0.6);
  uint64_t v108 = v107;
  v109 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  v109[8] = v106;
  *((void *)v109 + 9) = v108;
  double v110 = sub_35CEC(*((double *)v9 + 55), *((double *)v9 + 56), *((double *)v9 + 47), *((double *)v9 + 48), 0.6);
  uint64_t v112 = v111;
  v113 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  v113[10] = v110;
  *((void *)v113 + 11) = v112;
  double v114 = sub_35CEC(*((double *)v9 + 57), *((double *)v9 + 58), *((double *)v9 + 47), *((double *)v9 + 48), 0.6);
  uint64_t v116 = v115;
  v117 = (double *)objc_msgSend(objc_msgSend(v9, "faceData"), "teethSeedPoints");
  uint64_t v118 = 0;
  v117[12] = v114;
  *((void *)v117 + 13) = v116;
  for (uint64_t i3 = 1; i3 != 4; ++i3)
  {
    uint64_t v120 = 0;
    uint64_t v121 = v118;
    do
    {
      float v122 = (double)(int)v120 * 0.05 + 0.3;
      double v123 = sub_35CEC(*(double *)&v9[16 * i3 + 488], *(double *)&v9[16 * i3 + 496], *(double *)&v9[16 * (4 - i3) + 648], *(double *)&v9[16 * (4 - i3) + 656], v122);
      uint64_t v125 = v124;
      v126 = (double *)((char *)objc_msgSend(objc_msgSend(v9, "faceData"), "leftIrisSeedPoints") + v121);
      double *v126 = v123;
      *((void *)v126 + 1) = v125;
      double v127 = sub_35CEC(*(double *)&v9[16 * i3 + 568], *(double *)&v9[16 * i3 + 576], *(double *)&v9[16 * (4 - i3) + 728], *(double *)&v9[16 * (4 - i3) + 736], v122);
      uint64_t v129 = v128;
      v130 = (double *)((char *)objc_msgSend(objc_msgSend(v9, "faceData"), "rightIrisSeedPoints") + v121);
      double *v130 = v127;
      *((void *)v130 + 1) = v129;
      ++v120;
      v121 += 16;
    }
    while (v120 != 5);
    v118 += 80;
  }
  double v131 = *((double *)v9 + 237);
  double v132 = sub_35CA8(*((double *)v9 + 191), *((double *)v9 + 192), *((double *)v9 + 171));
  double v134 = sub_35D1C(v132, v133);
  double v136 = v135;
  double v137 = -v135;
  v138 = CGPathCreateMutable();
  CGPathMoveToPoint(v138, 0, *((CGFloat *)v9 + 211), *((CGFloat *)v9 + 212));
  CGPathAddLineToPoint(v138, 0, *((CGFloat *)v9 + 213), *((CGFloat *)v9 + 214));
  CGPathAddLineToPoint(v138, 0, *((CGFloat *)v9 + 215), *((CGFloat *)v9 + 216));
  CGPathAddLineToPoint(v138, 0, *((CGFloat *)v9 + 239), *((CGFloat *)v9 + 240));
  CGPathAddLineToPoint(v138, 0, *((CGFloat *)v9 + 229), *((CGFloat *)v9 + 230));
  CGPathAddLineToPoint(v138, 0, *((CGFloat *)v9 + 231), *((CGFloat *)v9 + 232));
  CGPathCloseSubpath(v138);
  [v9 setNoseTipPerimeterPath:CGPathCreateCopy(v138)];
  CGPathRelease(v138);
  for (uint64_t i4 = 1376; i4 != 1552; i4 += 16)
  {
    v140 = (double *)&v9[i4];
    double v141 = sub_35CA8(*(double *)&v9[i4 - 8], *(double *)&v9[i4], v131);
    double v143 = v142;
    float v144 = sub_35D0C(v141, v142, v134, v136);
    LODWORD(v141) = sub_35D0C(v141, v143, v137, v134);
    double v145 = sub_35CDC(v134, v136, v144);
    double v147 = v146;
    double v148 = sub_35CDC(v137, v134, -*(float *)&v141);
    double v149 = sub_35C9C(v145, v147, v148);
    double v151 = sub_35C9C(v149, v150, v131);
    if (v151 < 0.0) {
      double v151 = 0.0;
    }
    *(v140 - 23) = v151;
    *((void *)v140 - 22) = v152;
  }
  double v153 = *((double *)v9 + 237);
  v154 = (double *)(v9 + 1536);
  for (unint64_t i5 = 10; i5 != -1; --i5)
  {
    double v156 = sub_35CA8(*(v154 - 1), *v154, v153);
    double v158 = v157;
    float v159 = sub_35D0C(v156, v157, v134, v136);
    LODWORD(v156) = sub_35D0C(v156, v158, v137, v134);
    double v160 = sub_35CDC(v134, v136, v159);
    double v162 = v161;
    double v163 = sub_35CDC(v137, v134, -*(float *)&v156);
    double v164 = sub_35C9C(v160, v162, v163);
    double v166 = sub_35C9C(v164, v165, v153);
    if (v166 >= 0.0) {
      double v168 = v166;
    }
    else {
      double v168 = 0.0;
    }
    if (v167 >= 0.0) {
      double v169 = v167;
    }
    else {
      double v169 = 0.0;
    }
    if (i5 >= 6)
    {
      if (sub_35D88(*((double *)v9 + 171), *((double *)v9 + 172), *((double *)v9 + 191), *((double *)v9 + 192), v168, v169) == 0.0)goto LABEL_72; {
LABEL_71:
      }
      CGPathAddLineToPoint(v306, 0, v168, v169);
      goto LABEL_72;
    }
    if (sub_35D88(*((double *)v9 + 191), *((double *)v9 + 192), *((double *)v9 + 171), *((double *)v9 + 172), v168, v169) == 0.0)goto LABEL_71; {
LABEL_72:
    }
    v154 -= 2;
  }
  CGPathCloseSubpath(v306);
  [v9 setHeadPerimeter:CGPathCreateCopy(v306)];
  CGPathRelease(v306);
  if (v308 <= height) {
    double v170 = height;
  }
  else {
    double v170 = v308;
  }
  float v171 = v170 / *((float *)v9 + 519);
  v172 = [PolylinePair alloc];
  LODWORD(v173) = *((_DWORD *)v9 + 519);
  *(float *)&double v174 = v171;
  objc_msgSend(v9, "setMouthPerimeterLinePair:", -[PolylinePair initWithMaxsize:segmentDelta:andAxis:](v172, "initWithMaxsize:segmentDelta:andAxis:", v174, v173, 1.0, 0.0));
  uint64_t v175 = 0;
  double v176 = *((double *)v9 + 17);
  do
  {
    if (*(double *)&v9[v175 + 136] >= v176) {
      double v177 = *(double *)&v9[v175 + 136];
    }
    else {
      double v177 = v176;
    }
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "top"), "accomodatePoint:", v177, *(double *)&v9[v175 + 144]);
    v175 += 16;
  }
  while (v175 != 112);
  for (uint64_t i6 = 0; i6 != 80; i6 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "bottom"), "accomodatePoint:", *(double *)&v9[i6 + 248], *(double *)&v9[i6 + 256]);
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "bottom"), "bridgeGapsLinear");
  id v179 = [v9 mouthPerimeterLinePair];
  double v180 = *((float *)v9 + 518);
  double v181 = v180 * 0.06;
  *(float *)&double v181 = v180 * 0.06;
  double v182 = v180 * 0.02;
  *(float *)&double v182 = v182;
  [v179 expandWithToleranceTop:v181 bottom:v182];
  objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "extrapolateAndJoinTopAndBottom");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "mouthPerimeterLinePair"), "bottom"), "bridgeGapsLinear");
  id v183 = [v9 mouthPerimeterLinePair];
  *(float *)&double v184 = *((float *)v9 + 518) * 0.0;
  [v183 constructBezierWithToleranceTop:v184 bottom:COERCE_DOUBLE((unint64_t)LODWORD(v184))];
  v185 = [PolylinePair alloc];
  LODWORD(v186) = *((_DWORD *)v9 + 519);
  *(float *)&double v187 = v171;
  objc_msgSend(v9, "setLeftEyePair:", -[PolylinePair initWithMaxsize:segmentDelta:andAxis:](v185, "initWithMaxsize:segmentDelta:andAxis:", v187, v186, 1.0, 0.0));
  for (uint64_t i7 = 0; i7 != 80; i7 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "leftEyePair"), "top"), "accomodatePoint:", *(double *)&v9[i7 + 488], *(double *)&v9[i7 + 496]);
  for (uint64_t i8 = 0; i8 != 80; i8 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "leftEyePair"), "bottom"), "accomodatePoint:", *(double *)&v9[i8 + 648], *(double *)&v9[i8 + 656]);
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "leftEyePair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "leftEyePair"), "bottom"), "bridgeGapsLinear");
  id v190 = [v9 leftEyePair];
  double v191 = *((float *)v9 + 518);
  double v192 = v191 * 0.02;
  *(float *)&double v192 = v191 * 0.02;
  double v193 = v191 * 0.0312;
  *(float *)&double v193 = v193;
  [v190 expandWithToleranceTop:v192 bottom:v193];
  objc_msgSend(objc_msgSend(v9, "leftEyePair"), "extrapolateAndJoinTopAndBottom");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "leftEyePair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "leftEyePair"), "bottom"), "bridgeGapsLinear");
  id v194 = [v9 leftEyePair];
  double v195 = *((float *)v9 + 518);
  double v196 = v195 * 0.08;
  *(float *)&double v196 = v195 * 0.08;
  double v197 = v195 * 0.028;
  *(float *)&double v197 = v197;
  [v194 constructBezierWithToleranceTop:v196 bottom:v197];
  v198 = [PolylinePair alloc];
  LODWORD(v199) = *((_DWORD *)v9 + 519);
  *(float *)&double v200 = v171;
  objc_msgSend(v9, "setRightEyePair:", -[PolylinePair initWithMaxsize:segmentDelta:andAxis:](v198, "initWithMaxsize:segmentDelta:andAxis:", v200, v199, 1.0, 0.0));
  for (uint64_t i9 = 0; i9 != 80; i9 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "rightEyePair"), "top"), "accomodatePoint:", *(double *)&v9[i9 + 568], *(double *)&v9[i9 + 576]);
  for (uint64_t i10 = 0; i10 != 80; i10 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "rightEyePair"), "bottom"), "accomodatePoint:", *(double *)&v9[i10 + 728], *(double *)&v9[i10 + 736]);
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "rightEyePair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "rightEyePair"), "bottom"), "bridgeGapsLinear");
  id v203 = [v9 rightEyePair];
  double v204 = *((float *)v9 + 518);
  double v205 = v204 * 0.02;
  *(float *)&double v205 = v204 * 0.02;
  double v206 = v204 * 0.0312;
  *(float *)&double v206 = v206;
  [v203 expandWithToleranceTop:v205 bottom:v206];
  objc_msgSend(objc_msgSend(v9, "rightEyePair"), "extrapolateAndJoinTopAndBottom");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "rightEyePair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "rightEyePair"), "bottom"), "bridgeGapsLinear");
  id v207 = [v9 rightEyePair];
  double v208 = *((float *)v9 + 518);
  double v209 = v208 * 0.0806;
  *(float *)&double v209 = v208 * 0.0806;
  double v210 = v208 * 0.028002;
  *(float *)&double v210 = v210;
  [v207 constructBezierWithToleranceTop:v209 bottom:v210];
  v211 = [PolylinePair alloc];
  LODWORD(v212) = *((_DWORD *)v9 + 519);
  *(float *)&double v213 = v171;
  objc_msgSend(v9, "setTeethPair:", -[PolylinePair initWithMaxsize:segmentDelta:andAxis:](v211, "initWithMaxsize:segmentDelta:andAxis:", v213, v212, 1.0, 0.0));
  for (uint64_t i11 = 0; i11 != 80; i11 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "top"), "accomodatePoint:", *(double *)&v9[i11 + 328], *(double *)&v9[i11 + 336]);
  for (uint64_t i12 = 0; i12 != 80; i12 += 16)
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "bottom"), "accomodatePoint:", *(double *)&v9[i12 + 408], *(double *)&v9[i12 + 416]);
  id v216 = [v9 teethPair];
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "top"), "s0");
  double v218 = v217;
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "bottom"), "s0");
  double v220 = v219;
  id v221 = [v9 teethPair];
  if (v218 >= v220) {
    id v222 = [v221 bottom];
  }
  else {
    id v222 = [v221 top];
  }
  [v222 s0];
  objc_msgSend(v216, "setS0:");
  id v223 = [v9 teethPair];
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "top"), "s1");
  double v225 = v224;
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "bottom"), "s1");
  double v227 = v226;
  id v228 = [v9 teethPair];
  if (v225 <= v227) {
    id v229 = [v228 bottom];
  }
  else {
    id v229 = [v228 top];
  }
  [v229 s1];
  objc_msgSend(v223, "setS1:");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "top"), "bridgeGapsLinear");
  objc_msgSend(objc_msgSend(objc_msgSend(v9, "teethPair"), "bottom"), "bridgeGapsLinear");
  id v230 = [v9 teethPair];
  double v231 = *((float *)v9 + 518);
  double v232 = v231 * 0.01;
  *(float *)&double v232 = v231 * 0.01;
  double v233 = v231 * 0.02;
  *(float *)&double v233 = v233;
  [v230 constructBezierWithToleranceTop:v232 bottom:v233];
  v234 = [Polyline alloc];
  float v235 = v308;
  LODWORD(v236) = *((_DWORD *)v9 + 519);
  *(float *)&double v237 = v235;
  uint64_t v238 = 0;
  *((void *)v9 + 261) = -[Polyline initWithMaxsize:segmentDelta:andAxis:](v234, "initWithMaxsize:segmentDelta:andAxis:", v237, v236, 1.0, 0.0);
  do
  {
    objc_msgSend(*((id *)v9 + 261), "accomodatePoint:", *(double *)&v9[v238 + 72], *(double *)&v9[v238 + 80]);
    v238 += 16;
  }
  while (v238 != 64);
  v239 = [Polyline alloc];
  LODWORD(v240) = *((_DWORD *)v9 + 519);
  *(float *)&double v241 = v308;
  uint64_t v242 = 0;
  *((void *)v9 + 262) = -[Polyline initWithMaxsize:segmentDelta:andAxis:](v239, "initWithMaxsize:segmentDelta:andAxis:", v241, v240, 1.0, 0.0);
  do
  {
    objc_msgSend(*((id *)v9 + 262), "accomodatePoint:", *(double *)&v9[v242 + 8], *(double *)&v9[v242 + 16]);
    v242 += 16;
  }
  while (v242 != 64);
  [*((id *)v9 + 261) bridgeGapsLinear];
  [*((id *)v9 + 262) bridgeGapsLinear];
  double v243 = *((float *)v9 + 518);
  float v244 = v243 * 0.03615 + v243 * 0.03615;
  *(float *)&double v243 = v243 * 0.0365;
  float v245 = v244 * 0.8;
  double v246 = *(float *)&v243 * 1.9;
  *(float *)&unsigned int v247 = v246;
  *(float *)&double v246 = v245;
  [*((id *)v9 + 261) constructBezierWithToleranceOutside:v246 andInside:COERCE_DOUBLE(v247 | 0x3FFE666600000000)];
  *(float *)&double v248 = v245;
  LODWORD(v249) = v247;
  [*((id *)v9 + 262) constructBezierWithToleranceOutside:v248 andInside:v249];
  id v250 = [v9 faceData];
  memset(&v326, 0, sizeof(v326));
  CGAffineTransformMakeScale(&v326, v308, height);
  id v251 = [v309 objectForKeyedSubscript:@"faceBoundingBox"];
  objc_msgSend(objc_msgSend(v251, "objectForKeyedSubscript:", @"x"), "doubleValue");
  CGFloat v253 = v252;
  objc_msgSend(objc_msgSend(v251, "objectForKeyedSubscript:", @"y"), "doubleValue");
  CGFloat v255 = v254;
  objc_msgSend(objc_msgSend(v251, "objectForKeyedSubscript:", @"w"), "doubleValue");
  CGFloat v257 = v256;
  objc_msgSend(objc_msgSend(v251, "objectForKeyedSubscript:", @"h"), "doubleValue");
  v335.size.double height = v258;
  CGAffineTransform v325 = v326;
  v335.origin.CGFloat x = v253;
  v335.origin.CGFloat y = v255;
  v335.size.CGFloat width = v257;
  CGRect v336 = CGRectApplyAffineTransform(v335, &v325);
  double v259 = v336.origin.x;
  double v260 = v336.origin.y;
  memset(&v324, 0, sizeof(v324));
  double v312 = v336.size.width;
  double v310 = v336.size.height;
  CGAffineTransformMakeScale(&v324, v336.size.width, v336.size.height);
  id v261 = objc_msgSend(objc_msgSend(v309, "objectForKeyedSubscript:", @"leftPupil"), "objectAtIndex:", 0);
  objc_msgSend(objc_msgSend(v261, "objectForKeyedSubscript:", @"x"), "doubleValue");
  double v263 = v262;
  objc_msgSend(objc_msgSend(v261, "objectForKeyedSubscript:", @"y"), "doubleValue");
  CGFloat v265 = v324.tx + v264 * v324.c + v324.a * v263;
  CGFloat v266 = v324.ty + v264 * v324.d + v324.b * v263;
  double v267 = v259 + v265;
  double v268 = v260 + v266;
  id v269 = objc_msgSend(objc_msgSend(v309, "objectForKeyedSubscript:", @"rightPupil"), "objectAtIndex:", 0);
  objc_msgSend(objc_msgSend(v269, "objectForKeyedSubscript:", @"x"), "doubleValue");
  double v271 = v270;
  objc_msgSend(objc_msgSend(v269, "objectForKeyedSubscript:", @"y"), "doubleValue");
  CGFloat v273 = v324.tx + v272 * v324.c + v324.a * v271;
  CGFloat v274 = v324.ty + v272 * v324.d + v324.b * v271;
  double v275 = v259 + v273;
  double v276 = v260 + v274;
  [v250 setFaceIndex:0];
  objc_msgSend(v250, "setLeftEye:", v267, v268);
  objc_msgSend(v250, "setRightEye:", v275, v276);
  [v250 rightEye];
  double v278 = v277;
  double v280 = v279;
  [v250 leftEye];
  objc_msgSend(v250, "setBetweenTheEyes:", (v278 + v281) * 0.5, (v280 + v282) * 0.5);
  objc_msgSend(v250, "setLeftRightVec:", v275 - v267, v276 - v268);
  [v250 setIOD:sqrt((v276 - v268) * (v276 - v268) + (v275 - v267) * (v275 - v267))];
  [v250 leftRightVec];
  float v285 = sqrt(v283 * v283 + v284 * v284);
  double v286 = v285;
  double v287 = 0.0;
  _NF = v286 < 0.01;
  double v289 = v284 / v286;
  double v290 = v283 / v286;
  if (_NF) {
    double v291 = 0.0;
  }
  else {
    double v291 = v289;
  }
  if (_NF) {
    double v290 = 0.0;
  }
  float v292 = 1.0;
  if (v291 > 0.0) {
    float v292 = v290 / v291;
  }
  *(float *)&double v293 = atanf(v292);
  [v250 setEyeTiltAngle:v293];
  objc_msgSend(v250, "setFaceBounds:", v259, v260, v312, v310);
  id v294 = [v309 objectForKeyedSubscript:@"innerLips"];
  long long v320 = 0u;
  long long v321 = 0u;
  long long v322 = 0u;
  long long v323 = 0u;
  id v295 = [v294 countByEnumeratingWithState:&v320 objects:v327 count:16];
  double v296 = 0.0;
  if (v295)
  {
    id v297 = v295;
    uint64_t v298 = *(void *)v321;
    do
    {
      for (i13 = 0; i13 != v297; i13 = (char *)i13 + 1)
      {
        if (*(void *)v321 != v298) {
          objc_enumerationMutation(v294);
        }
        v300 = *(void **)(*((void *)&v320 + 1) + 8 * (void)i13);
        objc_msgSend(objc_msgSend(v300, "objectForKeyedSubscript:", @"x"), "doubleValue");
        double v302 = v301;
        objc_msgSend(objc_msgSend(v300, "objectForKeyedSubscript:", @"y"), "doubleValue");
        double v287 = v287 + v259 + v324.tx + v303 * v324.c + v324.a * v302;
        double v296 = v296 + v260 + v324.ty + v303 * v324.d + v324.b * v302;
      }
      id v297 = [v294 countByEnumeratingWithState:&v320 objects:v327 count:16];
    }
    while (v297);
  }
  id v304 = [v294 count];
  objc_msgSend(v250, "setMouthCenter:", v287 / (double)(unint64_t)v304, v296 / (double)(unint64_t)v304);
  objc_msgSend(objc_msgSend(v309, "objectForKeyedSubscript:", @"faceOrientationIndex"), "floatValue");
  objc_msgSend(v250, "setFaceOrientationIndex:");
  return (FaceLandmarks *)v9;
}

- (void)dealloc
{
  CGPathRelease(self->_noseTipPerimeterPath);
  CGPathRelease(self->_headPerimeter);
  [(FaceLandmarks *)self setFaceData:0];
  [(FaceLandmarks *)self setEyebrowRightTopLine:0];
  [(FaceLandmarks *)self setEyebrowLeftTopLine:0];
  [(FaceLandmarks *)self setMouthTopLine:0];
  [(FaceLandmarks *)self setMouthBottomLine:0];
  [(FaceLandmarks *)self setLeftEyePair:0];
  [(FaceLandmarks *)self setRightEyePair:0];
  [(FaceLandmarks *)self setMouthPerimeterLinePair:0];
  [(FaceLandmarks *)self setTeethPair:0];
  [(FaceLandmarks *)self setNosePair:0];
  v3.receiver = self;
  v3.super_class = (Class)FaceLandmarks;
  [(FaceLandmarks *)&v3 dealloc];
}

- (CGRect)imageRect
{
  objc_copyStruct(v6, &self->_imageRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_imageRect, &v3, 32, 1, 0);
}

- (ComputedFaceData)faceData
{
  return (ComputedFaceData *)objc_getProperty(self, a2, 2080, 1);
}

- (void)setFaceData:(id)a3
{
}

- (Polyline)eyebrowRightTopLine
{
  return (Polyline *)objc_getProperty(self, a2, 2088, 1);
}

- (void)setEyebrowRightTopLine:(id)a3
{
}

- (Polyline)eyebrowLeftTopLine
{
  return (Polyline *)objc_getProperty(self, a2, 2096, 1);
}

- (void)setEyebrowLeftTopLine:(id)a3
{
}

- (Polyline)mouthTopLine
{
  return (Polyline *)objc_getProperty(self, a2, 2104, 1);
}

- (void)setMouthTopLine:(id)a3
{
}

- (Polyline)mouthBottomLine
{
  return (Polyline *)objc_getProperty(self, a2, 2112, 1);
}

- (void)setMouthBottomLine:(id)a3
{
}

- (PolylinePair)leftEyePair
{
  return (PolylinePair *)objc_getProperty(self, a2, 2120, 1);
}

- (void)setLeftEyePair:(id)a3
{
}

- (PolylinePair)rightEyePair
{
  return (PolylinePair *)objc_getProperty(self, a2, 2128, 1);
}

- (void)setRightEyePair:(id)a3
{
}

- (PolylinePair)mouthPerimeterLinePair
{
  return (PolylinePair *)objc_getProperty(self, a2, 2136, 1);
}

- (void)setMouthPerimeterLinePair:(id)a3
{
}

- (PolylinePair)teethPair
{
  return (PolylinePair *)objc_getProperty(self, a2, 2144, 1);
}

- (void)setTeethPair:(id)a3
{
}

- (PolylinePair)nosePair
{
  return (PolylinePair *)objc_getProperty(self, a2, 2152, 1);
}

- (void)setNosePair:(id)a3
{
}

- (CGPath)noseTipPerimeterPath
{
  return self->_noseTipPerimeterPath;
}

- (void)setNoseTipPerimeterPath:(CGPath *)a3
{
  self->_noseTipPerimeterPath = a3;
}

- (CGPath)headPerimeter
{
  return self->_headPerimeter;
}

- (void)setHeadPerimeter:(CGPath *)a3
{
  self->_headPerimeter = a3;
}

- (CGPoint)leftToRightVec
{
  objc_copyStruct(v4, &self->_leftToRightVec, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setLeftToRightVec:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_leftToRightVec, &v3, 16, 1, 0);
}

- (CGPoint)upVec
{
  objc_copyStruct(v4, &self->_upVec, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setUpVec:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_upVec, &v3, 16, 1, 0);
}

@end