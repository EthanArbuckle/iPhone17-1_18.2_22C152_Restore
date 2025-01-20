uint64_t NTKFoghornFaceBezelStyleString(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](NTKFoghornFaceBezelStyleEditOption, sel__snapshotKeyForValue_forDevice_, a1, 0);
}

void sub_246B0185C(uint64_t a1, const char *a2)
{
  v5[5] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB11C10;
  v4[1] = &unk_26FB11C28;
  v5[0] = @"none";
  v5[1] = @"seconds";
  v4[2] = &unk_26FB11C40;
  v4[3] = &unk_26FB11C58;
  v5[2] = @"depth";
  v5[3] = @"elevation";
  v4[4] = &unk_26FB11C70;
  v5[4] = @"harmonia";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 5);
  v3 = (void *)qword_2691D4C60;
  qword_2691D4C60 = v2;
}

uint64_t sub_246B01C84(uint64_t a1, const char *a2)
{
  qword_2691D4C70 = objc_msgSend_fontDescriptorForSectName_fromMachO_(MEMORY[0x263F57A00], a2, @"__FoghornFont", (uint64_t)&dword_246AFF000);

  return MEMORY[0x270F9A758]();
}

void sub_246B04794(uint64_t a1, const char *a2)
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB11CA0;
  v4[1] = &unk_26FB11CB8;
  v5[0] = @"off";
  v5[1] = @"on";
  v4[2] = &unk_26FB11C88;
  v5[2] = @"auto";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 3);
  v3 = (void *)qword_2691D4C80;
  qword_2691D4C80 = v2;
}

id NTKFoghornHarmoniaLocalizedStringForOvernightChangesCount(uint64_t a1, const char *a2)
{
  v3 = NSString;
  v4 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_HARMONIA_OVERNIGHT_CHANGES", (uint64_t)&stru_26FB0CCF0);
  v7 = objc_msgSend_localizedStringWithFormat_(v3, v5, (uint64_t)v4, v6, a1);

  return v7;
}

id NTKFoghornHarmoniaLocalizedStringForTrainingLoadBand(unint64_t a1, const char *a2)
{
  if (a1 <= 4)
  {
    a1 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, (uint64_t)off_2651F6A68[a1], (uint64_t)&stru_26FB0CCF0, v2);
  }
  return (id)a1;
}

__CFString *NTKFoghornHarmoniaLocalizedStringForOvernightSummary(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  switch(a1)
  {
    case 4:
      uint64_t v4 = NTKFoghornHarmoniaLocalizedStringForOvernightChangesCount(a4, a2);
      goto LABEL_6;
    case 3:
      v8 = NSString;
      v9 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_HARMONIA_ESTABLISHING_OVERNIGHT", (uint64_t)&stru_26FB0CCF0);
      objc_msgSend_localizedStringWithFormat_(v8, v10, (uint64_t)v9, v11, a2, a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      uint64_t v4 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_HARMONIA_NO_OVERNIGHT_DATA", (uint64_t)&stru_26FB0CCF0);
LABEL_6:
      v5 = (__CFString *)v4;
      break;
    default:
      v5 = @" ";
      break;
  }

  return v5;
}

__CFString *NTKFoghornHarmoniaLocalizedStringForTrainingSummary(uint64_t a1, const char *a2, uint64_t a3, unint64_t a4)
{
  switch(a1)
  {
    case 4:
      uint64_t v4 = NTKFoghornHarmoniaLocalizedStringForTrainingLoadBand(a4, a2);
      goto LABEL_6;
    case 3:
      v8 = NSString;
      v9 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_HARMONIA_ESTABLISHING_TRAINING", (uint64_t)&stru_26FB0CCF0);
      objc_msgSend_localizedStringWithFormat_(v8, v10, (uint64_t)v9, v11, a2, a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      uint64_t v4 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_HARMONIA_NO_TRAINING_DATA", (uint64_t)&stru_26FB0CCF0);
LABEL_6:
      v5 = (__CFString *)v4;
      break;
    default:
      v5 = @" ";
      break;
  }

  return v5;
}

void *NTKFoghornHarmoniaOvernightMarkersForDataState()
{
  return &unk_26FB11FE8;
}

void *NTKFoghornHarmoniaTrainingMarkersForDataState()
{
  return &unk_26FB12000;
}

void *NTKFoghornHarmoniaSnapshotOvernightChangeAboveValues()
{
  return &unk_26FB12018;
}

uint64_t NTKFoghornHarmoniaSnapshotOvernightChangeBelowValues()
{
  return MEMORY[0x263EFFA68];
}

void *NTKFoghornHarmoniaSnapshotOvernightTypicalValues()
{
  return &unk_26FB12030;
}

void *NTKFoghornHarmoniaSnapshotTrainingValue()
{
  return &unk_26FB12238;
}

CFArrayRef sub_246B0585C(void *a1)
{
  id v1 = a1;
  CFIndex v5 = objc_msgSend_count(v1, v2, v3, v4);
  Mutable = CFArrayCreateMutable(0, v5, MEMORY[0x263EFFF70]);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v1, v6, i, v7);
      CFAttributedStringRef v10 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
      CTLineRef v11 = CTLineCreateWithAttributedString(v10);
      CFArrayAppendValue(Mutable, v11);
      CFRelease(v11);
    }
  }
  CFArrayRef Copy = CFArrayCreateCopy(0, Mutable);
  CFRelease(Mutable);

  return Copy;
}

uint64_t *sub_246B08704(unsigned char *a1, double a2)
{
  uint64_t v2 = &qword_2691D47D8;
  double v3 = -INFINITY;
  double v4 = INFINITY;
  CFIndex v5 = &qword_2691D47D8;
  uint64_t v6 = &qword_2691D47D8;
  while (v2 < (uint64_t *)&OBJC_PROTOCOL___CLKTimeFormatterObserver)
  {
    double v8 = *((double *)v2 + 4);
    double v7 = *((double *)v2 + 5);
    if (v7 < v4)
    {
      uint64_t v6 = v2;
      double v4 = *((double *)v2 + 5);
    }
    if (v8 > v3)
    {
      CFIndex v5 = v2;
      double v3 = *((double *)v2 + 4);
    }
    v2 += 9;
    if (v7 <= a2 && v8 >= a2)
    {
      *a1 = 1;
      return v2 - 9;
    }
  }
  *a1 = 0;
  if (a2 >= 0.0) {
    return v5;
  }
  else {
    return v6;
  }
}

void sub_246B09EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

double sub_246B0D460(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_screenBounds(v2, v3, v4, v5);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  objc_msgSend_screenCornerRadius(v2, v14, v15, v16);
  double v18 = v17;

  v29.origin.CGFloat x = v7;
  v29.origin.CGFloat y = v9;
  v29.size.CGFloat width = v11;
  v29.size.CGFloat height = v13;
  CGRect v30 = CGRectInset(v29, 2.0, 2.0);
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  double v22 = v18 + -2.0;
  CGFloat v23 = v30.size.height * 0.5;
  long double v24 = v30.size.width * 0.5;
  long double v25 = 1.57079633 - atan2(v30.size.height * 0.5, v30.size.width * 0.5 - v22);
  long double v26 = atan2(v23 - v22, v24);
  *(CGFloat *)&xmmword_2691D4C90 = x;
  *((CGFloat *)&xmmword_2691D4C90 + 1) = y;
  qword_2691D4CA0 = *(void *)&width;
  unk_2691D4CA8 = *(void *)&height;
  *(double *)&xmmword_2691D4CB0 = v22;
  *((long double *)&xmmword_2691D4CB0 + 1) = v25;
  *(double *)&qword_2691D4CC0 = 1.57079633 - v26;
  *(_OWORD *)algn_2691D4CC8 = xmmword_246B22500;
  *(long long *)((char *)&xmmword_2691D4CD0 + 8) = xmmword_246B22510;
  unk_2691D4CE8 = xmmword_246B22520;
  *(long long *)((char *)&xmmword_2691D4CF0 + 8) = xmmword_246B22530;
  unk_2691D4D08 = xmmword_246B22540;
  *(long long *)((char *)&xmmword_2691D4D10 + 8) = xmmword_246B22550;
  unk_2691D4D28 = xmmword_246B22560;
  *(long long *)((char *)&xmmword_2691D4D30 + 8) = xmmword_246B22570;
  unk_2691D4D48 = xmmword_246B22580;
  *(long long *)((char *)&xmmword_2691D4D50 + 8) = xmmword_246B22590;
  unk_2691D4D68 = xmmword_246B225A0;
  double result = 10.0;
  *(long long *)((char *)&xmmword_2691D4D70 + 8) = xmmword_246B225B0;
  return result;
}

id sub_246B0D5E4(uint64_t a1, uint64_t a2, double a3)
{
  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v7 = objc_alloc(MEMORY[0x263EFF960]);
  CGFloat v11 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v8, v9, v10);
  uint64_t v15 = objc_msgSend_localeIdentifier(v11, v12, v13, v14);
  double v18 = objc_msgSend_initWithLocaleIdentifier_(v7, v16, (uint64_t)v15, v17);
  objc_msgSend_setLocale_(v6, v19, (uint64_t)v18, v20);

  objc_msgSend_setMaximumFractionDigits_(v6, v21, a1, v22);
  objc_msgSend_setNumberStyle_(v6, v23, 1, v24);
  objc_msgSend_setRoundingMode_(v6, v25, a2, v26);
  if (a1) {
    objc_msgSend_setRoundingIncrement_(v6, v27, (uint64_t)&unk_26FB12258, v28);
  }
  else {
    objc_msgSend_setRoundingIncrement_(v6, v27, (uint64_t)&unk_26FB12248, v28);
  }
  v32 = objc_msgSend_numberWithDouble_(NSNumber, v29, v30, v31, a3);
  v35 = objc_msgSend_stringFromNumber_(v6, v33, (uint64_t)v32, v34);

  return v35;
}

void sub_246B0D714(CGContextRef c, CGColor *a2, int a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (!a3) {
    goto LABEL_12;
  }
  for (; a4 > 6.28318531; a4 = a4 + -6.28318531)
    ;
  while (a4 < 0.0)
    a4 = a4 + 6.28318531;
  if (a4 > 1.49225651 && a4 < 1.64933614)
  {
    CGContextSetFillColorWithColor(c, a2);
    CGFloat v17 = a9;
    CGFloat v18 = a9;
    CGFloat v15 = a5 - a9 * 0.5;
    CGFloat v16 = a6 - a9 * 0.5;
    CGContextFillEllipseInRect(c, *(CGRect *)(&v17 - 2));
  }
  else
  {
LABEL_12:
    CGContextSetStrokeColorWithColor(c, a2);
    CGContextSetLineWidth(c, a9);
    CGContextMoveToPoint(c, a5, a6);
    CGContextAddLineToPoint(c, a7, a8);
    CGContextStrokePath(c);
  }
}

void sub_246B0D84C(CGContext *a1, CGRect *a2, void *a3, const __CFArray *a4, const __CFArray *a5, void *a6, void *a7, void *a8, double a9, double a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,void *a21,uint64_t a22,unsigned __int8 a23,char a24)
{
  id v28 = a3;
  id v170 = a21;
  double v29 = *(double *)(a22 + 32) - *(double *)(a22 + 40);
  double v30 = *(double *)a22 - *(double *)(a22 + 8);
  double v31 = 0.0;
  if (a9 >= 0.0) {
    double v32 = a9;
  }
  else {
    double v32 = 0.0;
  }
  if (v32 <= v29) {
    double v33 = v32;
  }
  else {
    double v33 = *(double *)(a22 + 32) - *(double *)(a22 + 40);
  }
  if (a10 >= 0.0) {
    double v34 = a10;
  }
  else {
    double v34 = 0.0;
  }
  if (v34 > v29) {
    double v34 = *(double *)(a22 + 32) - *(double *)(a22 + 40);
  }
  double v169 = v34;
  double v154 = v33;
  if (a23) {
    double v31 = v33;
  }
  double v158 = v31;
  double x = a2[3].origin.x;
  id v165 = a19;
  id v153 = a18;
  id v152 = a17;
  id v159 = a16;
  id v161 = a15;
  id v36 = a14;
  id v37 = a13;
  id v38 = a12;
  id v39 = a11;
  id v40 = a8;
  id v41 = a7;
  id v42 = a6;
  NTKSuperEllipseRectGeometryGetPositionAtAngle((uint64_t)v28, 3.14159265);
  double v44 = v43;
  NTKSuperEllipseRectGeometryGetPositionAtAngle((uint64_t)v28, x);
  double v46 = v44 - v45;
  double v47 = v45 + v45;
  double v143 = v30 / 3.2808399 * (v45 + v45);
  uint64_t v146 = *(void *)(a22 + 64);
  double v48 = 1.0;
  if (v146 == 2)
  {
    double v48 = -1.0;
    double v46 = v44 + v44 - (v44 - v45);
  }
  double v172 = v46;
  double v174 = v48;
  if (v146 == 2) {
    double v49 = v44 + v44 - v45;
  }
  else {
    double v49 = v45;
  }
  id v50 = v42;
  uint64_t v168 = objc_msgSend_CGColor(v50, v51, v52, v53);

  id v54 = v41;
  uint64_t v149 = objc_msgSend_CGColor(v54, v55, v56, v57);

  id v58 = v40;
  uint64_t v148 = objc_msgSend_CGColor(v58, v59, v60, v61);

  id v62 = v39;
  uint64_t v164 = objc_msgSend_CGColor(v62, v63, v64, v65);

  id v66 = v38;
  uint64_t v147 = objc_msgSend_CGColor(v66, v67, v68, v69);

  id v70 = v37;
  uint64_t v163 = objc_msgSend_CGColor(v70, v71, v72, v73);

  id v74 = v36;
  uint64_t v157 = objc_msgSend_CGColor(v74, v75, v76, v77);

  id v78 = v161;
  uint64_t v162 = objc_msgSend_CGColor(v78, v79, v80, v81);

  id v82 = v159;
  uint64_t v160 = objc_msgSend_CGColor(v82, v83, v84, v85);

  id v86 = v152;
  v135 = (CGColor *)objc_msgSend_CGColor(v86, v87, v88, v89);

  id v90 = v153;
  color = (CGColor *)objc_msgSend_CGColor(v90, v91, v92, v93);

  id v100 = v165;
  v144 = (CGColor *)objc_msgSend_CGColor(v100, v94, v95, v96);

  double y = a2[3].origin.y;
  CGFloat v97 = a2[4].origin.x;
  double height = a2[3].size.height;
  double v142 = a2[3].size.width;
  CGFloat width = a2[4].origin.y;
  CGFloat MidX = CGRectGetMidX(*a2);
  CGFloat MidY = CGRectGetMidY(*a2);
  HIDWORD(v100) = HIDWORD(a1);
  CGContextSaveGState(a1);
  CGContextTranslateCTM(a1, MidX, MidY);
  CGContextSetLineCap(a1, kCGLineCapRound);
  CGContextSetLineWidth(a1, v97);
  double v101 = *(double *)(a22 + 16);
  uint64_t v138 = *(unsigned int *)(a22 + 24);
  uint64_t v137 = *(unsigned int *)(a22 + 28);
  double v102 = v47;
  double v103 = v30 / v101;
  double v104 = v169 * 3.2808399 / v101;
  double v105 = v158 * 3.2808399 / v101;
  double v139 = *(double *)(a22 + 48);
  if (a20)
  {
    double v106 = v103;
    id v107 = v170;
    id v100 = (id)objc_msgSend_CGColor(v107, v108, v109, v110);
    v111 = sub_246B0E280(v28, 0, a2[3].origin.y + a2[4].origin.y * 0.5, a2[4].origin.y * 0.5, v49, -(v102 * (v158 / v29)));
    CGContextSaveGState(a1);
    CGContextAddPath(a1, v111);
    CGContextClosePath(a1);
    CGContextScaleCTM(a1, -1.0, 1.0);
    CGContextAddPath(a1, v111);
    CGContextClosePath(a1);
    CGContextSetFillColorWithColor(a1, (CGColorRef)v100);
    CGContextFillPath(a1);
    CGContextRestoreGState(a1);
    CGPathRelease(v111);
    double v103 = v106;
  }
  unint64_t v112 = v103;
  LODWORD(v50) = vcvtpd_u64_f64(v104);
  LODWORD(v100) = vcvtpd_u64_f64(v105);
  double v113 = a2[5].origin.y;
  double v136 = -v174;
  ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(a4, 0);
  theArraya = (const __CTLine *)CFArrayGetValueAtIndex(a4, 1);
  v115 = (const __CTLine *)CFArrayGetValueAtIndex(a5, 0);
  v116 = (const __CTLine *)CFArrayGetValueAtIndex(a5, 1);
  v151 = v116;
  if (v146 == 2)
  {
    v117 = v28;
    double v118 = sub_246B0E0C4(ValueAtIndex);
    v119 = theArraya;
  }
  else
  {
    v120 = v116;
    v117 = v28;
    double v118 = sub_246B0E0C4(v115);
    v119 = v120;
  }
  double v121 = sub_246B0E0C4(v119);
  if (v118 < v121) {
    double v121 = v118;
  }
  if (v121 >= -0.25) {
    double v122 = 0.0;
  }
  else {
    double v122 = 0.0 - v121;
  }
  sub_246B0E7A4(a1, v117, v144, ValueAtIndex, 0, v146 == 2, v172 - v174 * v113, v122);
  *(void *)&long long v132 = v157;
  *((void *)&v132 + 1) = v162;
  double v123 = sub_246B0E12C((uint64_t)a1, v117, v168, v149, v148, v164, v147, v163, y, v142, height, v174 * (v143 / v29), v172, v132, v160, v112, (uint64_t)v50, (uint64_t)v100, v138,
           v137);
  sub_246B0E7A4(a1, v117, v144, v115, 0, v146 != 2, v172 + v174 * (v113 + v123), v122);
  uint64_t v124 = *(unsigned int *)(a22 + 56);
  uint64_t v125 = *(unsigned int *)(a22 + 60);
  LODWORD(v115) = vcvtpd_u64_f64(v158 / v139);
  LODWORD(ValueAtIndex) = vcvtpd_u64_f64(v169 / v139);
  sub_246B0E7A4(a1, v117, v144, theArraya, 2, v146 == 2, v49 + v174 * v113, v122);
  *(void *)&long long v133 = v157;
  *((void *)&v133 + 1) = v162;
  double v126 = sub_246B0E12C((uint64_t)a1, v117, v168, v149, v148, v164, v147, v163, y, v142, height, v102 * v136, v49, v133, v160, (v29 / v139), (uint64_t)ValueAtIndex, (uint64_t)v115, v124,
           v125);
  sub_246B0E7A4(a1, v117, v144, v151, 2, v146 != 2, v49 + v136 * (v113 + v126), v122);
  CGContextSetLineWidth(a1, width);
  double v175 = 0.0;
  v176[0] = 0.0;
  int v127 = a23 ^ 1;
  if (vabdd_f64(v169, v154) >= 0.5) {
    int v127 = 1;
  }
  if (v127 == 1 && a24)
  {
    double v128 = v172 + v174 * (v169 / v29 * v102);
    CGContextSetStrokeColorWithColor(a1, color);
    NTKSuperEllipseRectGeometryGetXYAtPosition((uint64_t)v117, v176, &v175, v128);
    double PathRotationAtPosition = NTKSuperEllipseRectGeometryGetPathRotationAtPosition((uint64_t)v117, v128);
    sub_246B0ED54(a1, PathRotationAtPosition, v176[0], v175, 0.0, y);
    sub_246B0ED54(a1, 3.14159265 - PathRotationAtPosition, -v176[0], v175, 0.0, y);
  }
  if (a23)
  {
    double v130 = v172 + v174 * (v154 / v29 * v102);
    CGContextSetStrokeColorWithColor(a1, v135);
    NTKSuperEllipseRectGeometryGetXYAtPosition((uint64_t)v117, v176, &v175, v130);
    double v131 = NTKSuperEllipseRectGeometryGetPathRotationAtPosition((uint64_t)v117, v130);
    sub_246B0ED54(a1, v131, v176[0], v175, 0.0, y);
    sub_246B0ED54(a1, 3.14159265 - v131, -v176[0], v175, 0.0, y);
  }
  CGContextRestoreGState(a1);
}

CGFloat sub_246B0E0C4(const __CTLine *a1)
{
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(a1);
  ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, 0);
  CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
  Value = (const __CTFont *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x263F039A0]);
  CFIndex GlyphCount = CTRunGetGlyphCount(ValueAtIndex);

  return sub_246B0E6DC((uint64_t)ValueAtIndex, Value, GlyphCount);
}

double sub_246B0E12C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, long long a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  id v30 = a2;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_246B0EC50;
  v36[3] = &unk_2651F6A98;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v42 = a17;
  uint64_t v43 = a6;
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  long long v46 = a14;
  uint64_t v47 = a15;
  uint64_t v48 = a19;
  uint64_t v49 = a20;
  double v50 = a9;
  double v51 = a10;
  double v52 = a11;
  uint64_t v53 = a1;
  id v37 = v30;
  uint64_t v38 = a18;
  id v31 = v30;
  double v32 = sub_246B0EB00(v31, a16, v36, a12, a13);

  return v32;
}

CGPath *sub_246B0E280(void *a1, int a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  double v48 = a6;
  if (a6 < 0.0) {
    a6 = -a6;
  }
  double v12 = (double *)malloc_type_calloc(vcvtpd_u64_f64(a6 * 0.25) + 4, 0x10uLL, 0x1000040451B5BE8uLL);
  Mutable = CGPathCreateMutable();
  CGFloat x = 0.0;
  double v51 = 0.0;
  long long v49 = 0uLL;
  double v46 = a4;
  double v47 = a5;
  double v45 = a3;
  sub_246B0E628(a5, a3, a4, (uint64_t)Mutable, v11, &x, (double *)&v49);
  double v15 = x;
  CGFloat v14 = v51;
  CGPathMoveToPoint(Mutable, 0, x, v51);
  *(_OWORD *)double v12 = v49;
  CGFloat v17 = v12 + 2;
  double v18 = a6;
  if (a6 > 4.0)
  {
    BOOL v19 = 0;
    BOOL v20 = 0;
    uint64_t v21 = *((void *)&v49 + 1);
    double v22 = *(double *)&v49;
    double v23 = 4.0;
    do
    {
      double v24 = -v23;
      if (v48 >= 0.0) {
        double v24 = v23;
      }
      sub_246B0E628(v24 + v47, v45, v46, v16, v11, &x, (double *)&v49);
      CGFloat v25 = x;
      double v26 = vabdd_f64(x, v15);
      double v27 = 0.25;
      if (v26 >= 0.25)
      {
        if (v20)
        {
          CGPathAddLineToPoint(Mutable, 0, v15, v14);
          CGFloat v25 = x;
        }
        CGFloat v14 = v51;
        CGPathAddLineToPoint(Mutable, 0, v25, v51);
        double v15 = x;
        double v27 = 0.25;
      }
      else
      {
        CGFloat v14 = v51;
        double v15 = x;
      }
      double v28 = vabdd_f64(*(double *)&v49, v22);
      BOOL v29 = v28 < v27;
      if (v28 >= v27)
      {
        if (v19)
        {
          *CGFloat v17 = v22;
          *((void *)v17 + 1) = v21;
          v17 += 2;
        }
        double v30 = 4.0;
        *(_OWORD *)CGFloat v17 = v49;
        v17 += 2;
        uint64_t v21 = *((void *)&v49 + 1);
        double v22 = *(double *)&v49;
      }
      else
      {
        uint64_t v21 = *((void *)&v49 + 1);
        double v22 = *(double *)&v49;
        double v30 = 4.0;
      }
      double v23 = v23 + v30;
      BOOL v19 = v29;
      BOOL v20 = v26 < 0.25;
    }
    while (v23 < v18);
    if (v26 < 0.25) {
      CGPathAddLineToPoint(Mutable, 0, v15, v14);
    }
    if (v28 < 0.25)
    {
      *CGFloat v17 = v22;
      *((void *)v17 + 1) = v21;
      v17 += 2;
    }
  }
  double v31 = -v18;
  if (v48 >= 0.0) {
    double v31 = v48;
  }
  double v32 = v31 + v47;
  sub_246B0E628(v31 + v47, v45, v46, v16, v11, &x, (double *)&v49);
  CGPathAddLineToPoint(Mutable, 0, x, v51);
  if (a2)
  {
    CGFloat v33 = (x + *(double *)&v49) * 0.5;
    CGFloat v34 = (v51 + *((double *)&v49 + 1)) * 0.5;
    double v35 = sqrt((*((double *)&v49 + 1) - v51) * (*((double *)&v49 + 1) - v51)+ (*(double *)&v49 - x) * (*(double *)&v49 - x));
    double PathRotationAtPosition = NTKSuperEllipseRectGeometryGetPathRotationAtPosition((uint64_t)v11, v32);
    CGPathAddArc(Mutable, 0, v33, v34, v35 * 0.5, PathRotationAtPosition + 3.14159265, PathRotationAtPosition, v48 >= 0.0);
  }
  *(_OWORD *)CGFloat v17 = v49;
  while (v17 >= v12)
  {
    CGFloat v37 = *v17;
    CGFloat v38 = v17[1];
    v17 -= 2;
    CGPathAddLineToPoint(Mutable, 0, v37, v38);
  }
  free(v12);
  if (a2)
  {
    sub_246B0E628(v47, v45, v46, v39, v11, &x, (double *)&v49);
    CGFloat v40 = (x + *(double *)&v49) * 0.5;
    CGFloat v41 = (v51 + *((double *)&v49 + 1)) * 0.5;
    double v42 = sqrt((*((double *)&v49 + 1) - v51) * (*((double *)&v49 + 1) - v51)+ (*(double *)&v49 - x) * (*(double *)&v49 - x));
    double v43 = NTKSuperEllipseRectGeometryGetPathRotationAtPosition((uint64_t)v11, v47);
    CGPathAddArc(Mutable, 0, v40, v41, v42 * 0.5, v43, v43 + 3.14159265, v48 >= 0.0);
  }

  return Mutable;
}

double sub_246B0E628(double a1, double a2, double a3, uint64_t a4, void *a5, double *a6, double *a7)
{
  double v19 = 0.0;
  double v20 = 0.0;
  id v12 = a5;
  NTKSuperEllipseRectGeometryGetXYAtPosition((uint64_t)v12, &v20, &v19, a1);
  double PathRotationAtPosition = NTKSuperEllipseRectGeometryGetPathRotationAtPosition((uint64_t)v12, a1);

  __double2 v14 = __sincos_stret(PathRotationAtPosition);
  double v16 = v19;
  double v15 = v20;
  double v17 = v19 - v14.__sinval * a2;
  *a6 = v20 - v14.__cosval * a2;
  a6[1] = v17;
  double result = v14.__sinval * a3 + v16;
  *a7 = v15 + v14.__cosval * a3;
  a7[1] = result;
  return result;
}

CGFloat sub_246B0E6DC(uint64_t a1, const __CTFont *a2, CFIndex a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0.0;
  }
  uint64_t v5 = (const __CTRun *)MEMORY[0x270FA5388]();
  id v7 = (CGGlyph *)((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10.location = 0;
  CTRunGetGlyphs(v5, v10, v7);
  CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(a2, kCTFontOrientationDefault, v7, 0, a3);
  return BoundingRectsForGlyphs.origin.y;
}

void sub_246B0E7A4(CGContext *a1, void *a2, CGColor *a3, const __CTLine *a4, uint64_t a5, int a6, double a7, double a8)
{
  id v15 = a2;
  theArradouble y = CTLineGetGlyphRuns(a4);
  CFIndex Count = CFArrayGetCount(theArray);
  CGFloat descent = 0.0;
  ascent[0] = 0.0;
  CGFloat leading = 0.0;
  double TypographicBounds = CTLineGetTypographicBounds(a4, ascent, &descent, &leading);
  double v44 = a8;
  double v17 = a8 + ascent[0] * 0.5 * 0.5;
  CGFloat v51 = 0.0;
  CGFloat v52 = 0.0;
  NTKSuperEllipseRectGeometryGetXYAtPosition((uint64_t)v15, &v52, &v51, a7);
  double v18 = NTKSuperEllipseRectGeometryTravelRatioForInsetAtPosition((uint64_t)v15, a7, v17);
  if (a5)
  {
    double v19 = TypographicBounds * v18;
    if (a5 != 2) {
      double v19 = v19 * 0.5;
    }
  }
  else
  {
    double v19 = 0.0;
  }
  CGFloat v49 = v51;
  CGFloat v50 = v52;
  if (Count >= 1)
  {
    CFIndex v20 = 0;
    if (a6) {
      double v19 = -v19;
    }
    double v21 = v19 + a7;
    double v22 = (const void *)*MEMORY[0x263F039A0];
    double v23 = -v18;
    double v24 = 0.0;
    double v25 = 0.0;
    do
    {
      ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(theArray, v20);
      CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
      Value = (const __CTFont *)CFDictionaryGetValue(Attributes, v22);
      CFIndex GlyphCount = CTRunGetGlyphCount(ValueAtIndex);
      buffer.double x = 0.0;
      buffer.double y = 0.0;
      v56.location = 0;
      v56.length = 1;
      CTRunGetPositions(ValueAtIndex, v56, &buffer);
      double x = buffer.x;
      if (GlyphCount < 1)
      {
        double v33 = v24;
      }
      else
      {
        CFIndex v31 = 0;
        double v32 = buffer.x - v25;
        do
        {
          CGGlyph glyphs = 0;
          v46.double x = 0.0;
          v46.double y = 0.0;
          v57.location = v31;
          v57.length = 1;
          CTRunGetGlyphs(ValueAtIndex, v57, &glyphs);
          v58.location = v31;
          v58.length = 1;
          double v33 = CTRunGetTypographicBounds(ValueAtIndex, v58, 0, 0, 0);
          v59.location = v31;
          v59.length = 1;
          CTRunGetPositions(ValueAtIndex, v59, &v46);
          double v34 = (v24 + v33) * v23 * 0.5;
          if (!v31) {
            double v34 = v34 + v23 * v32;
          }
          if (a6) {
            double v35 = -v34;
          }
          else {
            double v35 = v34;
          }
          NTKSuperEllipseRectGeometryGetXYAfterTravelFromPosition((uint64_t)v15, (uint64_t *)&v50, (uint64_t *)&v49, v21, v35);
          if (v35 < 0.0) {
            double v36 = -v36;
          }
          double v21 = v21 + v36;
          double v37 = NTKSuperEllipseRectGeometryGetPathRotationAtPosition((uint64_t)v15, v21) + -1.57079633;
          if (a6)
          {
            double v37 = v37 + -3.14159265;
            double v38 = v44;
            double v39 = -0.5;
          }
          else
          {
            double v39 = -0.5;
            double v38 = (ascent[0] + descent) * -0.5 - v44;
          }
          double x = x + v33;
          if (v37 >= 0.02 || v37 <= -0.02) {
            double v41 = v37;
          }
          else {
            double v41 = 0.0;
          }
          positions.double x = v33 * v39;
          positions.double y = v38;
          CGContextSaveGState(a1);
          CGContextTranslateCTM(a1, v50, v49);
          CGContextRotateCTM(a1, v41);
          CGContextSetFillColorWithColor(a1, a3);
          CTFontDrawGlyphs(Value, &glyphs, &positions, 1uLL, a1);
          CGContextRestoreGState(a1);
          ++v31;
          double v24 = v33;
        }
        while (GlyphCount != v31);
      }
      ++v20;
      double v24 = v33;
      double v25 = x;
    }
    while (v20 != Count);
  }
}

double sub_246B0EB00(void *a1, unint64_t a2, void *a3, double a4, double a5)
{
  id v9 = a1;
  CFRange v10 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  NTKSuperEllipseRectGeometryGetXYAtPosition((uint64_t)v9, &v23, (double *)&v22, a5);
  if (a4 >= 0.0) {
    double v11 = a4;
  }
  else {
    double v11 = -a4;
  }
  double v12 = -0.0;
  double v13 = 0.0;
  if (a4 >= 0.0) {
    double v12 = 0.0;
  }
  double v14 = v12 + a5;
  v10[2](v10, 0, v12 + a5, *(double *)&v23, *(double *)&v22);
  if (a2)
  {
    unint64_t v15 = 0;
    do
    {
      double v16 = -(v11 * (double)++v15 / (double)a2 - v13);
      if (a4 >= 0.0) {
        double v16 = v11 * (double)v15 / (double)a2 - v13;
      }
      uint64_t v20 = v22;
      uint64_t v21 = v23;
      NTKSuperEllipseRectGeometryGetXYAfterTravelFromPosition((uint64_t)v9, &v21, &v20, v14, v16);
      double v13 = v13 + v17;
      uint64_t v22 = v20;
      uint64_t v23 = v21;
      double v18 = -v13;
      if (a4 >= 0.0) {
        double v18 = v13;
      }
      double v14 = v18 + a5;
      ((void (*)(void (**)(id, void, double, double, double), unint64_t, double))v10[2])(v10, v15, v18 + a5);
    }
    while (a2 != v15);
  }

  return v13;
}

void sub_246B0EC50(uint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  if (*(void *)(a1 + 40) <= a2)
  {
    id v9 = (CGColor **)(a1 + 104);
    CFRange v10 = (CGColor **)(a1 + 112);
    double v11 = (CGColor **)(a1 + 120);
    if (*(void *)(a1 + 72) > a2)
    {
      CFRange v10 = (CGColor **)(a1 + 88);
      double v11 = (CGColor **)(a1 + 96);
      id v9 = (CGColor **)(a1 + 80);
    }
  }
  else
  {
    id v9 = (CGColor **)(a1 + 48);
    CFRange v10 = (CGColor **)(a1 + 56);
    double v11 = (CGColor **)(a1 + 64);
  }
  if (a2 % *(void *)(a1 + 128))
  {
    if (a2 % *(void *)(a1 + 136))
    {
      double v12 = *v11;
      double v13 = (double *)(a1 + 160);
    }
    else
    {
      double v12 = *v10;
      double v13 = (double *)(a1 + 152);
    }
  }
  else
  {
    double v13 = (double *)(a1 + 144);
    double v12 = *v9;
  }
  double v14 = *v13;
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 168), v12);
  unint64_t v15 = *(CGContext **)(a1 + 168);
  double PathRotationAtPosition = NTKSuperEllipseRectGeometryGetPathRotationAtPosition(*(void *)(a1 + 32), a3);

  sub_246B0ED54(v15, PathRotationAtPosition, a4, a5, 0.0, v14);
}

void sub_246B0ED54(CGContext *a1, double a2, double a3, double a4, double a5, double a6)
{
  __double2 v11 = __sincos_stret(a2 + 3.14159265);
  CGFloat v12 = a3 + a5 * v11.__cosval;
  CGFloat v13 = a4 + a5 * v11.__sinval;
  double v14 = a5 + a6;
  CGFloat v15 = a3 + (a5 + a6) * v11.__cosval;
  CGFloat v16 = a4 + v14 * v11.__sinval;
  CGContextMoveToPoint(a1, v12, v13);
  CGContextAddLineToPoint(a1, v15, v16);

  CGContextStrokePath(a1);
}

double sub_246B0EDEC(CGContext *a1, double *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  id v15 = a3;
  id v16 = a6;
  double v17 = a2[23];
  double v18 = a2[24];
  CGFloat v19 = a2[25];
  CGContextSetLineCap(a1, kCGLineCapRound);
  CGContextSetLineWidth(a1, v19);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_246B0F670;
  v24[3] = &unk_2651F6AE8;
  id v26 = v15;
  uint64_t v27 = a4;
  double v28 = v17;
  uint64_t v29 = a5;
  double v30 = v18;
  double v31 = (v17 - v18) * 0.5;
  double v32 = a1;
  id v25 = v16;
  id v20 = v15;
  id v21 = v16;
  double v22 = sub_246B0EB00(v20, 0x30uLL, v24, a7, a8);

  return v22;
}

uint64_t sub_246B0EF34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_246B0EF44(uint64_t a1)
{
}

void sub_246B0EF4C(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  double v8 = (id *)(v7 + 40);
  id v28 = v4;
  if (v9)
  {
    objc_msgSend_floatValue(v4, (const char *)v4, v5, v6);
    float v11 = v10;
    objc_msgSend_floatValue(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v12, v13, v14);
    if (v11 >= v18) {
      goto LABEL_5;
    }
    double v8 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v8, a2);
LABEL_5:
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v21 = *(void *)(v19 + 40);
  id v20 = (id *)(v19 + 40);
  if (v21)
  {
    objc_msgSend_floatValue(v28, v15, v16, v17);
    float v23 = v22;
    objc_msgSend_floatValue(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v24, v25, v26);
    if (v23 <= v27) {
      goto LABEL_9;
    }
    id v20 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  objc_storeStrong(v20, a2);
LABEL_9:
}

id sub_246B0F030(double a1, uint64_t a2, void *a3)
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(a3, (const char *)a3, (uint64_t)&v12, (uint64_t)&v11, &v10, &v9);
  uint64_t v7 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v4, v5, v6, v12, v11, v10, v9 * a1);

  return v7;
}

void sub_246B0F0A8(CGContext *a1, double *a2, void *a3, void *a4, double a5, double a6)
{
  double v10 = a2[26] * 0.5;
  double v11 = a2[27] * 0.5;
  double v12 = a2[23] - v10 + v11;
  double v13 = v11 - v10;
  CFArrayRef v14 = a4;
  id v15 = sub_246B0E280(a3, 0, v12, v13, a5, a6);
  CGContextSaveGState(a1);
  CGContextAddPath(a1, v15);
  CGContextClip(a1);
  CGContextClosePath(a1);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v17 = CGGradientCreateWithColors(DeviceRGB, v14, 0);

  CGColorSpaceRelease(DeviceRGB);
  BoundingBoCGFloat x = CGPathGetBoundingBox(v15);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  CGFloat MaxY = CGRectGetMaxY(BoundingBox);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  v25.CGFloat y = CGRectGetMinY(v27);
  v24.CGFloat x = 0.0;
  v25.CGFloat x = 0.0;
  v24.CGFloat y = MaxY;
  CGContextDrawLinearGradient(a1, v17, v24, v25, 0);
  CGContextRestoreGState(a1);

  CGPathRelease(v15);
}

void sub_246B0F1FC(CGContext *a1, double *a2, void *a3, void *a4, void *a5, void *a6, double a7, double a8, double a9)
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v109 = a3;
  id v16 = a4;
  id v107 = a5;
  id v17 = a6;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  double v105 = v16;
  objc_msgSend_sortedArrayUsingSelector_(v16, v19, (uint64_t)sel_compare_, v20);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v114, (uint64_t)v121, 16);
  if (v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v115 != v27) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v114 + 1) + 8 * i), v23, v24, v25);
        uint64_t v30 = (uint64_t)(float)((float)(v29 * -24.0) + 24.0);
        double v34 = objc_msgSend_lastObject(v18, v31, v32, v33);

        if (!v34)
        {
          id v54 = objc_alloc(MEMORY[0x263EFF980]);
          double v48 = objc_msgSend_numberWithInteger_(NSNumber, v55, v30, v56);
          v120 = v48;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v57, (uint64_t)&v120, 1);
          CGFloat v51 = LABEL_14:;
          v63 = objc_msgSend_initWithArray_(v54, v61, (uint64_t)v51, v62);
          objc_msgSend_addObject_(v18, v64, (uint64_t)v63, v65);

          goto LABEL_15;
        }
        double v38 = objc_msgSend_lastObject(v18, v35, v36, v37);
        double v42 = objc_msgSend_lastObject(v38, v39, v40, v41);
        uint64_t v46 = objc_msgSend_integerValue(v42, v43, v44, v45);

        if (v46 == v30) {
          continue;
        }
        unsigned int v47 = v46 - v30;
        if ((int)v46 - (int)v30 < 0) {
          unsigned int v47 = v30 - v46;
        }
        if (v47 > 2)
        {
          id v54 = objc_alloc(MEMORY[0x263EFF980]);
          double v48 = objc_msgSend_numberWithInteger_(NSNumber, v58, v30, v59);
          v119 = v48;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v60, (uint64_t)&v119, 1);
          goto LABEL_14;
        }
        double v48 = objc_msgSend_lastObject(v18, v23, v24, v25);
        CGFloat v51 = objc_msgSend_numberWithInteger_(NSNumber, v49, v30, v50);
        objc_msgSend_addObject_(v48, v52, (uint64_t)v51, v53);
LABEL_15:
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v114, (uint64_t)v121, 16);
    }
    while (v26);
  }

  double v66 = a2[23];
  double v67 = a2[26];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v68 = v18;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v110, (uint64_t)v118, 16);
  if (v70)
  {
    uint64_t v74 = v70;
    double v75 = v67 * -0.5;
    double v76 = v66 + v75;
    uint64_t v77 = *(void *)v111;
    double v78 = a8 * a9;
    do
    {
      for (uint64_t j = 0; j != v74; ++j)
      {
        if (*(void *)v111 != v77) {
          objc_enumerationMutation(v68);
        }
        uint64_t v80 = *(void **)(*((void *)&v110 + 1) + 8 * j);
        uint64_t v81 = objc_msgSend_firstObject(v80, v71, v72, v73);
        uint64_t v85 = objc_msgSend_integerValue(v81, v82, v83, v84);

        uint64_t v89 = objc_msgSend_lastObject(v80, v86, v87, v88);
        uint64_t v93 = objc_msgSend_integerValue(v89, v90, v91, v92);

        v94 = sub_246B0E280(v109, 1, v76, v75, a7 + v78 * ((double)v85 / 48.0), a7 + v78 * ((double)v93 / 48.0) - (a7 + v78 * ((double)v85 / 48.0)));
        CGContextSaveGState(a1);
        CGContextAddPath(a1, v94);
        CGContextClosePath(a1);
        CGContextSetLineWidth(a1, a2[27]);
        id v95 = v107;
        v99 = (CGColor *)objc_msgSend_CGColor(v95, v96, v97, v98);
        CGContextSetFillColorWithColor(a1, v99);
        id v100 = v17;
        double v104 = (CGColor *)objc_msgSend_CGColor(v100, v101, v102, v103);
        CGContextSetStrokeColorWithColor(a1, v104);
        CGContextDrawPath(a1, kCGPathFillStroke);
        CGContextRestoreGState(a1);
        CGPathRelease(v94);
      }
      uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v71, (uint64_t)&v110, (uint64_t)v118, 16);
    }
    while (v74);
  }
}

void sub_246B0F670(uint64_t a1, const char *a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7)
{
  if (objc_msgSend_containsIndex_(*(void **)(a1 + 32), a2, (uint64_t)a2, a7))
  {
    double v11 = (CGColorRef *)(a1 + 48);
    double v12 = (double *)(a1 + 56);
    double v13 = 0.0;
  }
  else
  {
    double v11 = (CGColorRef *)(a1 + 64);
    double v12 = (double *)(a1 + 72);
    double v13 = *(double *)(a1 + 80);
  }
  double v14 = *v12;
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 88), *v11);
  id v15 = *(CGContext **)(a1 + 88);
  double PathRotationAtPosition = NTKSuperEllipseRectGeometryGetPathRotationAtPosition(*(void *)(a1 + 40), a3);

  sub_246B0ED54(v15, PathRotationAtPosition, a4, a5, v13, v14);
}

id sub_246B0F724()
{
  if (qword_2691D4DA8 != -1) {
    dispatch_once(&qword_2691D4DA8, &unk_26FB0CA48);
  }
  v0 = (void *)qword_2691D4DA0;

  return v0;
}

void sub_246B0F778(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263EFD198], a2, a3, a4, 10.0, *MEMORY[0x263F81840]);
  double v8 = objc_msgSend_fontDescriptor(v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x263F03AF8];
  v16[0] = *MEMORY[0x263F81748];
  v16[1] = v9;
  v17[0] = MEMORY[0x263EFFA68];
  v17[1] = &unk_26FB12268;
  v16[2] = *MEMORY[0x263F03BB8];
  v17[2] = &unk_26FB11D00;
  double v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v17, (uint64_t)v16, 3);
  uint64_t v14 = objc_msgSend_fontDescriptorByAddingAttributes_(v8, v12, (uint64_t)v11, v13);
  id v15 = (void *)qword_2691D4DA0;
  qword_2691D4DA0 = v14;
}

id sub_246B0F898(double a1)
{
  id v2 = (void *)MEMORY[0x263EFD198];
  double v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend__foghornFontDescriptor(v3, v4, v5, v6);
  double v10 = objc_msgSend_fontWithDescriptor_size_(v2, v8, (uint64_t)v7, v9, a1);

  return v10;
}

id sub_246B0F908()
{
  if (qword_2691D4DB8 != -1) {
    dispatch_once(&qword_2691D4DB8, &unk_26FB0CA68);
  }
  v0 = (void *)qword_2691D4DB0;

  return v0;
}

void sub_246B0F95C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263EFD198], a2, a3, a4, 10.0, *MEMORY[0x263F81840]);
  double v8 = objc_msgSend_fontDescriptor(v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x263F03AF8];
  v16[0] = *MEMORY[0x263F81748];
  v16[1] = v9;
  v17[0] = MEMORY[0x263EFFA68];
  v17[1] = &unk_26FB12268;
  v16[2] = *MEMORY[0x263F03BB8];
  v17[2] = &unk_26FB11D00;
  double v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v17, (uint64_t)v16, 3);
  uint64_t v14 = objc_msgSend_fontDescriptorByAddingAttributes_(v8, v12, (uint64_t)v11, v13);
  id v15 = (void *)qword_2691D4DB0;
  qword_2691D4DB0 = v14;
}

id sub_246B0FA7C(double a1)
{
  id v2 = (void *)MEMORY[0x263EFD198];
  double v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend__foghornSimpleComplicationFontDescriptor(v3, v4, v5, v6);
  double v10 = objc_msgSend_fontWithDescriptor_size_(v2, v8, (uint64_t)v7, v9, a1);

  return v10;
}

double _preferencesGetAppDoubleValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  if (!v4)
  {
    BOOL v8 = 0;
    double DoubleValue = NAN;
    if (!a3) {
      return DoubleValue;
    }
    goto LABEL_12;
  }
  CFStringRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFStringGetTypeID())
  {
    double DoubleValue = CFStringGetDoubleValue(v5);
    BOOL v8 = 1;
  }
  else if (v6 == CFNumberGetTypeID())
  {
    double valuePtr = 0.0;
    int Value = CFNumberGetValue((CFNumberRef)v5, kCFNumberDoubleType, &valuePtr);
    BOOL v8 = Value != 0;
    if (Value) {
      double DoubleValue = valuePtr;
    }
    else {
      double DoubleValue = NAN;
    }
  }
  else
  {
    BOOL v8 = 0;
    double DoubleValue = NAN;
  }
  CFRelease(v5);
  if (a3) {
LABEL_12:
  }
    *a3 = v8;
  return DoubleValue;
}

void _preferencesGetAppDoubleValueWithDefault(const __CFString *a1, const __CFString *a2)
{
  BOOL v2 = 0;
  _preferencesGetAppDoubleValue(a1, a2, &v2);
}

CFIndex _preferencesGetAppIntegerValueWithDefault(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(a1, a2, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return a3;
  }
  return result;
}

double sub_246B0FC88(uint64_t a1)
{
  if (MEMORY[0x24C541D80]())
  {
    if (qword_2691D4E28 != -1) {
      dispatch_once(&qword_2691D4E28, &unk_26FB0CA88);
    }
    unint64_t v2 = 0x2691D4000;
    unint64_t v3 = 0x2691D4000;
    unint64_t v4 = 0x2691D4000;
    unint64_t v5 = 0x2691D4000;
    unint64_t v6 = 0x2691D4000;
    unint64_t v7 = 0x2691D4000;
    if (byte_2691D4DC0 == 1)
    {
      uint64_t v8 = qword_2691D4E20;
    }
    else
    {
      CFStringRef v10 = (const __CFString *)*MEMORY[0x263F57900];
      byte_2691D4DC1 = CFPreferencesGetAppBooleanValue(@"NTKFoghornDepthDemo", (CFStringRef)*MEMORY[0x263F57900], 0) != 0;
      byte_2691D4DD8 = CFPreferencesGetAppBooleanValue(@"NTKFoghornElevationDemo", v10, 0) != 0;
      byte_2691D4E00 = CFPreferencesGetAppBooleanValue(@"NTKFoghornStatusIndicatorPolicyMove", v10, 0) != 0;
      qword_2691D4DC8 = _preferencesGetAppDoubleValue(@"NTKFoghornDepthDemoValue", v10, 0);
      qword_2691D4DD0 = _preferencesGetAppDoubleValue(@"NTKFoghornDepthDemoRate", v10, 0);
      qword_2691D4DE0 = _preferencesGetAppDoubleValue(@"NTKFoghornElevationDemoValue", v10, 0);
      qword_2691D4DE8 = _preferencesGetAppDoubleValue(@"NTKFoghornElevationDemoRate", v10, 0);
      qword_2691D4DF0 = _preferencesGetAppDoubleValue(@"NTKFoghornElevationDemoAccuracy", v10, 0);
      qword_2691D4DF8 = _preferencesGetAppDoubleValue(@"NTKFoghornElevationDemoPrecision", v10, 0);
      byte_2691D4E01 = CFPreferencesGetAppBooleanValue(@"NTKFoghornTimeViewUseStretchAnimation", v10, 0) != 0;
      Boolean keyExistsAndHasValidFormat = 0;
      AppIntegerint Value = CFPreferencesGetAppIntegerValue(@"NTKFoghornTimeViewAnimationSnapStyle", v10, &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat) {
        uint64_t v12 = AppIntegerValue;
      }
      else {
        uint64_t v12 = 1;
      }
      qword_2691D4E08 = v12;
      byte_2691D4E10 = CFPreferencesGetAppBooleanValue(@"NTKFoghornHarmoniaDemo", v10, 0) != 0;
      Boolean v20 = 0;
      CFIndex v13 = CFPreferencesGetAppIntegerValue(@"NTKFoghornHarmoniaDemoOvernightScenario", v10, &v20);
      if (v20) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      qword_2691D4E18 = v14;
      Boolean v21 = 0;
      CFIndex v15 = CFPreferencesGetAppIntegerValue(@"NTKFoghornHarmoniaDemoTrainingScenario", v10, &v21);
      unint64_t v2 = 0x2691D4000uLL;
      unint64_t v3 = 0x2691D4000uLL;
      unint64_t v4 = 0x2691D4000uLL;
      unint64_t v5 = 0x2691D4000uLL;
      unint64_t v6 = 0x2691D4000uLL;
      unint64_t v7 = 0x2691D4000uLL;
      if (v21) {
        uint64_t v8 = v15;
      }
      else {
        uint64_t v8 = 0;
      }
      qword_2691D4E20 = v8;
      byte_2691D4DC0 = 1;
    }
    *(unsigned char *)a1 = byte_2691D4DC1;
    uint64_t v16 = qword_2691D4DD0;
    *(void *)(a1 + 8) = qword_2691D4DC8;
    *(void *)(a1 + 16) = v16;
    *(unsigned char *)(a1 + 24) = byte_2691D4DD8;
    uint64_t v17 = qword_2691D4DE8;
    *(void *)(a1 + 32) = qword_2691D4DE0;
    *(void *)(a1 + 40) = v17;
    double result = *(double *)&qword_2691D4DF0;
    uint64_t v18 = *(void *)(v2 + 3576);
    *(void *)(a1 + 48) = qword_2691D4DF0;
    *(void *)(a1 + 56) = v18;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(v3 + 3584);
    *(unsigned char *)(a1 + 65) = *(unsigned char *)(v4 + 3585);
    *(void *)(a1 + 72) = *(void *)(v5 + 3592);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(v6 + 3600);
    *(void *)(a1 + 88) = *(void *)(v7 + 3608);
    *(void *)(a1 + 96) = v8;
  }
  else
  {
    *(unsigned char *)a1 = 0;
    double result = NAN;
    *(_OWORD *)(a1 + 8) = xmmword_246B225D0;
    *(unsigned char *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0x7FF8000000000000;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(_WORD *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 1;
    *(unsigned char *)(a1 + 80) = 0;
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
  }
  return result;
}

uint64_t sub_246B102E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = (const char *)objc_msgSend_UTF8String(@"NTKFoghornPreferencesChangedNotification", a2, a3, a4);
  unint64_t v5 = MEMORY[0x263EF83A0];

  return notify_register_dispatch(v4, (int *)&unk_2691D4E30, v5, &unk_26FB0CAA8);
}

void sub_246B10328(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  byte_2691D4DC0 = 0;
  unint64_t v4 = objc_msgSend_logObject(NTKFoghornFaceBundle, a2, a3, a4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unint64_t v6 = "void _foghornPreferences(_FoghornPreferences *)_block_invoke_2";
    _os_log_impl(&dword_246AFF000, v4, OS_LOG_TYPE_DEFAULT, "%s: preferences updated", (uint8_t *)&v5, 0xCu);
  }
}

__CFString *NTKFoghornTimeViewElementString(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_2651F6BD8[a1];
  }
}

id NTKFoghornTimeViewElementMaskString(int a1)
{
  int v5 = objc_opt_new();
  uint64_t v6 = 0;
  for (unint64_t i = 0; i != 4; ++i)
  {
    if (((1 << i) & a1) != 0)
    {
      uint64_t v8 = @"unknown";
      if (i <= 3) {
        uint64_t v8 = off_2651F6BD8[i];
      }
      if (v6) {
        objc_msgSend_appendString_(v5, v2, @"|", v4);
      }
      objc_msgSend_appendString_(v5, v2, (uint64_t)v8, v4);
      ++v6;
    }
  }
  uint64_t v9 = objc_msgSend_copy(v5, v2, v3, v4);

  return v9;
}

__CFString *NTKFoghornTimeViewAnimationStyleString(uint64_t a1)
{
  id v1 = @"unknown";
  if (a1 == 1) {
    id v1 = @"stretch";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"fixedSeconds";
  }
}

__CFString *NTKFoghornTimeViewAnimationSnapStyleString(unint64_t a1)
{
  if (a1 > 2) {
    return @"unknown";
  }
  else {
    return off_2651F6BF8[a1];
  }
}

double sub_246B11218(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  switch(a1)
  {
    case 3:
      CLKCeilForDevice();
      goto LABEL_7;
    case 2:
      CLKRoundForDevice();
      goto LABEL_7;
    case 1:
      CLKFloorForDevice();
LABEL_7:
      a3 = v6;
      break;
  }

  return a3;
}

void sub_246B12A70(_Unwind_Exception *a1)
{
  for (uint64_t i = 168; i != -56; i -= 56)
    sub_246B12A9C(v1 + i);
  _Unwind_Resume(a1);
}

void sub_246B12A9C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 48);
}

void sub_246B12E9C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5 = (CGContext *)objc_msgSend_CGContext(a2, (const char *)a2, a3, a4);
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 64));
  CGContextTranslateCTM(v5, 0.0, MaxY);
  CGContextScaleCTM(v5, 1.0, -1.0);
  uint64_t v8 = (const __CTFrame *)objc_msgSend__CTFrameForFrame_text_textColor_font_forDevice_(*(void **)(a1 + 96), v7, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  CTFrameDraw(v8, v5);

  CFRelease(v8);
}

void sub_246B13C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_246B13C90(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend__updateBlinkerAlphaForSecondFraction_(WeakRetained, v6, v7, v8, *(double *)(a3 + 32));
  }
}

void sub_246B13D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_246B13D14()
{
  return @"Foghorn Blinker Activities";
}

void sub_246B14C14(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v37 = a2;
  objc_msgSend_screenBounds(v37, v2, v3, v4);
  long long v39 = xmmword_246B22630;
  double v40 = v5 + -26.0;
  long long v41 = xmmword_246B22640;
  uint64_t v42 = 0x404EC00000000000;
  double v43 = v5 + -26.0;
  long long v44 = xmmword_246B22640;
  uint64_t v45 = 0x4051C00000000000;
  double v46 = v5 + -26.0;
  long long v47 = xmmword_246B22650;
  uint64_t v48 = 0x4051C00000000000;
  double v49 = v5 + -26.0;
  long long v50 = xmmword_246B22650;
  uint64_t v51 = 0x404AC00000000000;
  double v52 = v5 + -26.0;
  long long v53 = xmmword_246B22660;
  uint64_t v54 = 0x404AC00000000000;
  double v55 = v5 + -26.0;
  uint64_t v56 = 0x4062200000000000;
  uint64_t v7 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], v6, (uint64_t)v37, 6);
  bzero(&__src[1], 0x390uLL);
  unint64_t v11 = 0;
  uint64_t v12 = 0x49u;
  uint64_t v13 = 85;
  do
  {
    double v14 = *(double *)&__src[v13 + 32];
    double v15 = *(double *)&__src[v13 + 33];
    objc_msgSend_scaledPoint_(v7, v8, v9, v10, *(double *)&__src[v13 + 30], *(double *)&__src[v13 + 31]);
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    objc_msgSend_scaledSize_(v7, v20, v21, v22, v14, v15);
    float v23 = &__src[v13];
    *float v23 = v17;
    v23[1] = v19;
    v23[2] = v24;
    v23[3] = v25;
    uint64_t v26 = &__src[v11 / 8];
    *(_OWORD *)(v26 + 5) = *(_OWORD *)((char *)&unk_246B22670 + v11 + 32);
    long long v27 = *(_OWORD *)((char *)&unk_246B22670 + v11);
    *(_OWORD *)(v26 + 3) = *(_OWORD *)((char *)&unk_246B22670 + v11 + 16);
    *(_OWORD *)(v26 + 1) = v27;
    id v28 = &__src[v12];
    *id v28 = *(void *)((char *)&unk_246B228B0 + v12 * 8 - 584);
    float v29 = &__src[v11 / 8 + 37];
    long long v30 = *(_OWORD *)((char *)&unk_246B22670 + v11 + 320);
    long long v31 = *(_OWORD *)((char *)&unk_246B22670 + v11 + 288);
    v29[1] = *(_OWORD *)((char *)&unk_246B22670 + v11 + 304);
    v29[2] = v30;
    *float v29 = v31;
    v28[6] = *(void *)((char *)&unk_246B228B0 + v12 * 8 - 536);
    objc_msgSend_scaledValue_(v7, v32, v33, v34, 1.60000002);
    v28[36] = v35;
    v11 += 48;
    ++v12;
    v13 += 4;
  }
  while (v11 != 288);
  objc_msgSend_scaledValue_(v7, v8, v9, v10, 39.0);
  __src[0] = v36;

  memcpy(&unk_2691D4E38, __src, 0x398uLL);
}

uint64_t sub_246B153DC(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_setComplication_forSlot_(*(void **)(a1 + 32), a2, a3, (uint64_t)a2);
}

void sub_246B16838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  for (uint64_t i = 376; i != -8; i -= 32)

  _Unwind_Resume(a1);
}

id _complicationOrDie(void *a1)
{
  id v1 = a1;
  double v5 = v1;
  if (v1)
  {
    id v6 = v1;
  }
  else
  {
    objc_msgSend_nullComplication(MEMORY[0x263F57988], v2, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

uint64_t NTKFoghornFaceLayoutStyleString(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](NTKFoghornFaceLayoutStyleEditOption, sel__snapshotKeyForValue_forDevice_, a1, 0);
}

void sub_246B16B08(uint64_t a1, const char *a2)
{
  void v5[6] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB11D60;
  v4[1] = &unk_26FB11D78;
  v5[0] = @"default";
  v5[1] = @"defaultWithSeconds";
  v4[2] = &unk_26FB11D90;
  void v4[3] = &unk_26FB11DA8;
  v5[2] = @"large";
  v5[3] = @"largeWithSeconds";
  v4[4] = &unk_26FB11DC0;
  void v4[5] = &unk_26FB11DD8;
  void v5[4] = @"extraLarge";
  v5[5] = @"extraLargeWithSeconds";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 6);
  uint64_t v3 = (void *)qword_2691D51E8;
  qword_2691D51E8 = v2;
}

id sub_246B17840(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v11 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v8, v9, v10);
  double v25 = 0.0;
  double v26 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(v6, v12, 0, 0, 0, &v26);
  objc_msgSend_getRed_green_blue_alpha_(v7, v13, 0, 0, 0, &v25);
  if (v26 != 1.0 || v25 != 1.0)
  {
    uint64_t v18 = objc_msgSend_colorWithAlphaComponent_(v11, v14, v15, v16, (v26 + v25) * 0.5);

    unint64_t v11 = (void *)v18;
  }
  double v19 = 1.0 - a1 / 0.6;
  if (a1 / 0.6 >= 1.0) {
    double v19 = 0.0;
  }
  double v20 = (a1 + -0.4) / 0.6;
  if (a1 + -0.4 < 0.0) {
    double v20 = 0.0;
  }
  double v21 = 1.0 - v19 - v20;
  uint64_t v22 = MEMORY[0x24C541D90](v6, v7, v20 / (v19 + v20));
  float v23 = MEMORY[0x24C541D90](v22, v11, v21);

  return v23;
}

void sub_246B17D6C(void *a1@<X0>, _OWORD *a2@<X8>)
{
  obuint64_t j = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D5268);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D5270);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_2691D5270);
    if (v5 == obj)
    {
      uint64_t v8 = objc_msgSend_version(obj, (const char *)obj, v6, v7);
      uint64_t v9 = qword_2691D5278;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_2691D5270, obj);
  qword_2691D5278 = objc_msgSend_version(obj, v11, v12, v13);

  sub_246B1B558(v14, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D5268);
  long long v15 = xmmword_2691D5248;
  a2[4] = xmmword_2691D5238;
  a2[5] = v15;
  a2[6] = xmmword_2691D5258;
  long long v16 = *(_OWORD *)&qword_2691D5208;
  *a2 = xmmword_2691D51F8;
  a2[1] = v16;
  long long v17 = *(_OWORD *)&qword_2691D5228;
  a2[2] = xmmword_2691D5218;
  a2[3] = v17;
}

uint64_t sub_246B18540(void *a1, const char *a2, _OWORD *a3)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  long long v6 = a3[1];
  v8[0] = *a3;
  v8[1] = v6;
  v8[2] = a3[2];
  return objc_msgSend__applyComplicationLayoutRuleForDevice_frame_transform_slot_states_(v3, a2, v4, (uint64_t)v8, a2, v5);
}

uint64_t sub_246B18830(void *a1, const char *a2, _OWORD *a3)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  long long v6 = a3[1];
  v8[0] = *a3;
  v8[1] = v6;
  v8[2] = a3[2];
  return objc_msgSend__applyComplicationLayoutRuleForDevice_frame_transform_slot_states_(v3, a2, v4, (uint64_t)v8, a2, v5);
}

uint64_t sub_246B19320(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__applyComplicationColor_withPalette_slot_(*(void **)(a1 + 32), a2, a3, *(void *)(a1 + 40), a2);
}

void sub_246B19998(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  long long v6 = objc_opt_class();
  if (objc_msgSend__isSixpackComplicationSlot_(v6, v7, (uint64_t)v16, v8))
  {
    uint64_t v12 = (double *)(a1 + 40);
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    if (!objc_msgSend__isMiddleComplicationSlot_(v13, v14, (uint64_t)v16, v15)) {
      goto LABEL_6;
    }
    uint64_t v12 = (double *)(a1 + 48);
  }
  objc_msgSend_setAlpha_(v5, v9, v10, v11, *v12);
LABEL_6:
}

void sub_246B1A44C(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  long long v6 = objc_opt_class();
  if (objc_msgSend__isSixpackComplicationSlot_(v6, v7, (uint64_t)v16, v8))
  {
    int v11 = *(unsigned __int8 *)(a1 + 40);
LABEL_5:
    BOOL v15 = v11 != 0;
    goto LABEL_7;
  }
  uint64_t v12 = objc_opt_class();
  if (objc_msgSend__isMiddleComplicationSlot_(v12, v13, (uint64_t)v16, v14))
  {
    int v11 = *(unsigned __int8 *)(a1 + 41);
    goto LABEL_5;
  }
  BOOL v15 = 0;
LABEL_7:
  objc_msgSend_setHidden_(v5, v9, !v15, v10);
}

void sub_246B1A75C(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v19 = a2;
  int v11 = objc_opt_class();
  if (objc_msgSend__isSixpackComplicationSlot_(v11, v12, (uint64_t)v19, v13))
  {
    if (*(unsigned char *)(a1 + 56))
    {
      v27.origin.CGFloat x = a3;
      v27.origin.CGFloat y = a4;
      v27.size.CGFloat width = a5;
      v27.size.CGFloat height = a6;
      CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 48), v27);
    }
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    if (objc_msgSend__isMiddleComplicationSlot_(v14, v15, (uint64_t)v19, v16) && *(unsigned char *)(a1 + 57))
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      *(_OWORD *)dCGFloat x = 0u;
      long long v21 = 0u;
      memset(v20, 0, sizeof(v20));
      sub_246B17D6C(*(void **)(a1 + 32), v20);
      CGFloat v17 = *(double *)&v21;
      v28.origin.CGFloat x = a3;
      v28.origin.CGFloat y = a4;
      v28.size.CGFloat width = a5;
      v28.size.CGFloat height = a6;
      CGRect v29 = CGRectInset(v28, dx[1], dx[1]);
      uint64_t v18 = CGPathCreateWithRoundedRect(v29, v17, v17, 0);
      CGContextAddPath(*(CGContextRef *)(a1 + 48), v18);
      CGContextFillPath(*(CGContextRef *)(a1 + 48));
      CGPathRelease(v18);
    }
  }
}

uint64_t sub_246B1AA44(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5 = (CGContext *)objc_msgSend_CGContext(a2, (const char *)a2, a3, a4);
  CGFloat v6 = *(double *)(a1 + 64);
  CGFloat v7 = *(double *)(a1 + 72);
  CGContextSetRGBFillColor(v5, 0.0666666667, 0.0666666667, 0.0666666667, 1.0);
  v41.origin.CGFloat x = 0.0;
  v41.origin.CGFloat y = 0.0;
  v41.size.CGFloat width = v6;
  v41.size.CGFloat height = v7;
  CGContextFillRect(v5, v41);
  uint64_t v8 = *(void **)(a1 + 80);
  uint64_t v12 = objc_msgSend_bezelStyle(*(void **)(a1 + 32), v9, v10, v11);
  uint64_t v16 = objc_msgSend_layoutStyle(*(void **)(a1 + 40), v13, v14, v15);
  objc_msgSend__drawComplicationsSnapshotInContext_bezelStyle_layoutStyle_forDevice_(v8, v17, (uint64_t)v5, v12, v16, *(void *)(a1 + 48));
  uint64_t v21 = objc_msgSend_layoutStyle(*(void **)(a1 + 40), v18, v19, v20);
  BOOL v25 = objc_msgSend_bezelStyle(*(void **)(a1 + 32), v22, v23, v24) != 0;
  CGRect v29 = objc_msgSend_timeMinutesColor(*(void **)(a1 + 56), v26, v27, v28);
  uint64_t v33 = objc_msgSend_timeSecondsColor(*(void **)(a1 + 56), v30, v31, v32);
  objc_msgSend_drawSnapshotInContext_layoutStyle_inset_minutesColor_secondsColor_forDevice_(NTKFoghornTimeView, v34, (uint64_t)v5, v21, v25, v29, v33, *(void *)(a1 + 48));

  uint64_t v38 = objc_msgSend_bezelStyle(*(void **)(a1 + 32), v35, v36, v37);

  return MEMORY[0x270F9A6D0](NTKFoghornFaceBezelView, sel_drawSnapshotInContext_bezelStyle_colorPalette_forDevice_, v5, v38);
}

double sub_246B1B558(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v4 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], v3, (uint64_t)v2, 6);

  objc_msgSend_setRoundingBehavior_(v4, v5, 0, v6);
  objc_msgSend_scaledValue_(v4, v7, v8, v9, 0.9);
  uint64_t v57 = v10;
  objc_msgSend_scaledValue_(v4, v11, v12, v13, 0.99);
  uint64_t v56 = v14;
  objc_msgSend_scaledValue_(v4, v15, v16, v17, 0.9);
  uint64_t v19 = v18;
  objc_msgSend_scaledValue_(v4, v20, v21, v22, 106.0);
  uint64_t v24 = v23;
  objc_msgSend_scaledValue_(v4, v25, v26, v27, 8.0);
  uint64_t v29 = v28;
  objc_msgSend_scaledValue_(v4, v30, v31, v32, 17.0);
  uint64_t v34 = v33;
  objc_msgSend_scaledValue_(v4, v35, v36, v37, 10.0);
  uint64_t v39 = v38;
  objc_msgSend_scaledValue_(v4, v40, v41, v42, 4.0);
  uint64_t v44 = v43;
  objc_msgSend_scaledValue_(v4, v45, v46, v47, 4.875);
  uint64_t v49 = v48;
  objc_msgSend_scaledValue_(v4, v50, v51, v52, 3.0);
  uint64_t v54 = v53;

  *(void *)&xmmword_2691D51F8 = v57;
  *((void *)&xmmword_2691D51F8 + 1) = v56;
  qword_2691D5208 = v19;
  unk_2691D5210 = v24;
  *(void *)&xmmword_2691D5218 = v29;
  *((void *)&xmmword_2691D5218 + 1) = v34;
  qword_2691D5228 = v39;
  unk_2691D5230 = v44;
  *(void *)&xmmword_2691D5238 = v49;
  *((void *)&xmmword_2691D5238 + 1) = v54;
  double result = 1.25;
  xmmword_2691D5248 = xmmword_246B22A00;
  xmmword_2691D5258 = 0uLL;
  return result;
}

double NTKSuperEllipseRectGeometryGetRadialPoints(uint64_t a1, void *a2, double *a3, double a4, double a5)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v10 = 0;
  double v11 = 0.0;
  NTKSuperEllipseRectGetRadialXYs(*(double **)(a1 + 8), (double *)&v13, (double *)&v12, &v11, (double *)&v10, a4, a5);
  uint64_t v7 = v12;
  *a2 = v13;
  a2[1] = v7;
  uint64_t v9 = v10;
  double result = v11;
  *a3 = v11;
  *((void *)a3 + 1) = v9;
  return result;
}

double NTKSuperEllipseRectGeometryGetMetrics(uint64_t a1, void *a2, void *a3, void *a4, double *a5, void *a6, double a7, double a8, double a9, double a10)
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v16 = 0.0;
  NTKSuperEllipseRectGetMetrics(*(double **)(a1 + 8), (double *)&v20, (double *)&v19, (double *)&v17, &v16, (double *)&v18, a7, a8, a9, a10);
  *a2 = v20;
  *a3 = v19;
  *a6 = v18;
  *a4 = v17;
  double result = v16;
  *a5 = v16;
  return result;
}

void NTKSuperEllipseRectGeometryGetPathTangentAtAngle(uint64_t a1, double a2)
{
}

double NTKSuperEllipseRectGeometryGetTravelRatioForInsetAtAngle(uint64_t a1, double a2, double a3)
{
  return NTKSuperEllipseRectGetTravelRatioForInsetAtAngle(*(double **)(a1 + 8), a2, a3);
}

void NTKSuperEllipseRectGeometryGetXYAfterTravelFromPosition(uint64_t a1, uint64_t *a2, uint64_t *a3, double a4, double a5)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *a3;
  uint64_t v9 = v7;
  NTKSuperEllipseRectGetXYAfterTravelFromPosition(*(double **)(a1 + 8), (double *)&v9, (double *)&v8, a4, a5);
  *a2 = v9;
  *a3 = v8;
}

double NTKSuperEllipseRectGeometryGetXYAtPosition(uint64_t a1, void *a2, double *a3, double a4)
{
  double v7 = 0.0;
  uint64_t v8 = 0;
  NTKSuperEllipseRectGetXYAtPosition(*(void *)(a1 + 8), (double *)&v8, &v7, a4);
  *a2 = v8;
  double result = v7;
  *a3 = v7;
  return result;
}

double NTKSuperEllipseRectGeometryGetPathRotationAtPosition(uint64_t a1, double a2)
{
  return NTKSuperEllipseRectGetPathRotationAtPosition(*(void *)(a1 + 8), a2);
}

double NTKSuperEllipseRectGeometryTravelRatioForInsetAtPosition(uint64_t a1, double a2, double a3)
{
  return NTKSuperEllipseRectGetTravelRatioForInsetAtPosition(*(void *)(a1 + 8), a2, a3);
}

void NTKSuperEllipseRectGeometryGetPositionAtAngle(uint64_t a1, double a2)
{
}

void NTKSuperEllipseRectGetRadialXYs(double *a1, double *a2, double *a3, double *a4, double *a5, double a6, double a7)
{
  double v12 = a6;
  if (a6 >= 4.71238898)
  {
    int v14 = 0;
    double v12 = 6.28318531 - a6;
    goto LABEL_6;
  }
  if (a6 >= 3.14159265)
  {
    int v14 = 0;
    int v15 = 0;
    double v12 = a6 + -3.14159265;
  }
  else
  {
    if (a6 < 1.57079633)
    {
      int v14 = 1;
LABEL_6:
      int v15 = 1;
      goto LABEL_9;
    }
    int v15 = 0;
    double v12 = 3.14159265 - a6;
    int v14 = 1;
  }
LABEL_9:
  long double v16 = a1[5];
  if (v12 >= v16)
  {
    long double v22 = a1[6];
    if (v12 >= v22)
    {
      long double v34 = tan(v12);
      double v19 = a1[1] * 0.5;
      double v18 = v19 / v34;
      double v21 = v19 - a7;
      double v20 = (v19 - a7) / v34;
    }
    else
    {
      double v23 = a1[2];
      double v24 = a1[3];
      double v37 = *a1 * 0.5 - v23;
      double v38 = a1[1] * 0.5 - v24;
      __CGFloat y = 0.0;
      double v25 = fmin(modf((v12 - v16) / a1[8], &__y), 1.0);
      if (v25 < 0.0) {
        double v25 = 0.0;
      }
      double v26 = a1[5 * __y + 13] + (a1[5 * __y + 18] - a1[5 * __y + 13]) * v25;
      __double2 v27 = __sincos_stret(v12);
      double v28 = v27.__cosval * v26 - v37;
      double v29 = v27.__sinval * v26 - v38;
      if (v28 > v23) {
        double v28 = v23;
      }
      if (v29 > v24) {
        double v29 = v24;
      }
      double v30 = sqrt((v38 + v29) * (v38 + v29) + (v37 + v28) * (v37 + v28));
      double v31 = tan(v16);
      long double v32 = tan(v22);
      double v18 = v27.__cosval * v30;
      double v19 = v27.__sinval * v30;
      long double v33 = v30
          - ((v12 - v16) / (v22 - v16) * sqrt(a7 * a7 + a7 / v32 * (a7 / v32))
           + (1.0 - (v12 - v16) / (v22 - v16)) * sqrt(a7 * a7 + v31 * a7 * (v31 * a7)));
      double v20 = v27.__cosval * v33;
      double v21 = v27.__sinval * v33;
    }
  }
  else
  {
    long double v17 = tan(v12);
    double v18 = *a1 * 0.5;
    double v19 = v17 * v18;
    double v20 = v18 - a7;
    double v21 = v17 * (v18 - a7);
  }
  double v35 = -v18;
  if (v15) {
    double v35 = v18;
  }
  else {
    double v20 = -v20;
  }
  if (!v14) {
    double v19 = -v19;
  }
  *a2 = v35;
  *a3 = v19;
  if (v14) {
    double v36 = v21;
  }
  else {
    double v36 = -v21;
  }
  *a4 = v20;
  *a5 = v36;
}

void NTKSuperEllipseRectGetMetrics(double *a1, double *a2, double *a3, double *a4, double *a5, double *a6, double a7, double a8, double a9, double a10)
{
  if (a7 * 180.0 / 3.14159265 == 360.0) {
    double v16 = 0.0;
  }
  else {
    double v16 = a7;
  }
  double v17 = *a1 * 0.5;
  double v18 = a1[1] * 0.5;
  double v20 = a1[2];
  double v19 = a1[3];
  if (v16 >= 4.71238898)
  {
    double v21 = 6.28318531 - v16;
LABEL_9:
    double v22 = -1.0;
    goto LABEL_11;
  }
  if (v16 < 3.14159265)
  {
    double v22 = 1.0;
    double v21 = v16;
    if (v16 < 1.57079633) {
      goto LABEL_11;
    }
    double v21 = 3.14159265 - v16;
    goto LABEL_9;
  }
  double v21 = v16 + -3.14159265;
  double v22 = 1.0;
LABEL_11:
  double v50 = v17 - v20;
  double v23 = v18 - v19;
  double v24 = a1[5];
  if (v21 < v24)
  {
    double v25 = v17 * tan(v21);
    double v26 = a10;
    double v27 = v25 - v22 * a10;
    if (v27 <= v23)
    {
      double v41 = -v23;
      if (v27 >= -v23)
      {
        double v32 = -v25;
        double v31 = 0.0;
        double v33 = 0.0;
        double v23 = 0.0;
        double v30 = 0.0;
      }
      else
      {
        double v42 = v23 + v27;
        double v43 = sub_246B1D660(a1, v21);
        if (v43 <= v20) {
          double v17 = v43;
        }
        else {
          double v17 = v20;
        }
        double v30 = v50;
        double v33 = v42 * (-1.0 / (v17 + a9));
        double v31 = 0.0;
        double v32 = 0.0;
        double v26 = 0.0;
        double v23 = v41;
      }
    }
    else
    {
      double v28 = v27 - v23;
      double v29 = sub_246B1D660(a1, v21);
      if (v29 <= v20) {
        double v17 = v29;
      }
      else {
        double v17 = v20;
      }
      double v30 = v50;
      double v31 = v28 * (1.0 / (v17 + a9));
      double v32 = 0.0;
      double v26 = 0.0;
      double v33 = 0.0;
    }
    goto LABEL_44;
  }
  if (v21 < a1[6])
  {
    __CGFloat y = 0.0;
    double v35 = fmin(modf((v21 - v24) / a1[8], &__y), 1.0);
    double v31 = 0.0;
    if (v35 < 0.0) {
      double v35 = 0.0;
    }
    long double v34 = &a1[5 * __y];
    double v36 = atan2(v34[12] + (v34[17] - v34[12]) * v35, v34[11] + (v34[16] - v34[11]) * v35);
    double v37 = sub_246B1D660(a1, v21);
    double v38 = 1.0 / (v37 + a9);
    double v39 = v22 * a10 * v38;
    double v40 = v36 - v39;
    if (v36 - v39 >= 0.0)
    {
      double v31 = 1.57079633;
      if (v40 <= 1.57079633)
      {
        double v33 = -v39;
        double v32 = 0.0;
        double v31 = v36;
        double v17 = v37;
        double v26 = 0.0;
        double v30 = v50;
        goto LABEL_44;
      }
      double v32 = v50 - (v40 + -1.57079633) / v38;
      double v26 = 0.0;
      double v17 = v18;
    }
    else
    {
      double v32 = -(v23 + v40 / v38);
      double v26 = 0.0;
    }
    double v33 = 0.0;
    goto LABEL_43;
  }
  double v32 = v18 / tan(v21);
  double v26 = a10;
  double v44 = v32 + v22 * a10;
  double v30 = v17 - v20;
  if (v44 >= -v50)
  {
    if (v44 <= v50)
    {
      double v33 = 0.0;
      double v31 = 1.57079633;
      double v17 = v18;
LABEL_43:
      double v23 = 0.0;
      double v30 = 0.0;
      goto LABEL_44;
    }
    double v47 = v44 - v50;
    double v48 = sub_246B1D660(a1, v21);
    if (v48 <= v19) {
      double v17 = v48;
    }
    else {
      double v17 = v19;
    }
    double v31 = v47 * (-1.0 / (v17 + a9)) + 1.57079633;
    double v32 = 0.0;
    double v26 = 0.0;
    double v33 = 0.0;
  }
  else
  {
    double v45 = v50 + v44;
    double v46 = sub_246B1D660(a1, v21);
    if (v46 <= v19) {
      double v17 = v46;
    }
    else {
      double v17 = v19;
    }
    double v33 = v45 * (1.0 / (v17 + a9)) + 1.57079633;
    double v31 = 0.0;
    double v32 = 0.0;
    double v26 = 0.0;
    double v30 = -v50;
  }
LABEL_44:
  if (v16 >= 4.71238898)
  {
    double v23 = -v23;
    double v49 = 6.28318531 - (v31 + v33);
LABEL_51:
    double v32 = -v32;
    goto LABEL_52;
  }
  if (v16 >= 3.14159265)
  {
    double v30 = -v30;
    double v23 = -v23;
    double v49 = v31 + 3.14159265 + v33;
  }
  else
  {
    if (v16 >= 1.57079633)
    {
      double v30 = -v30;
      double v49 = 3.14159265 - (v31 + v33);
      goto LABEL_51;
    }
    double v49 = v31 + v33;
  }
LABEL_52:
  *a2 = v30;
  *a3 = v23;
  *a4 = v49;
  *a5 = v26 + v32;
  *a6 = v17 - a8;
}

double sub_246B1D660(double *a1, double a2)
{
  double v3 = a1[5];
  if (v3 > a2) {
    return a1[2];
  }
  if (a1[6] <= a2) {
    return a1[3];
  }
  __CGFloat y = 0.0;
  double v5 = modf((a2 - v3) / a1[8], &__y);
  uint64_t v6 = &a1[5 * __y];
  double v7 = fmin(v5, 1.0);
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  double v8 = v6[11] + (v6[16] - v6[11]) * v7;
  return sqrt((v6[12] + (v6[17] - v6[12]) * v7) * (v6[12] + (v6[17] - v6[12]) * v7) + v8 * v8);
}

float64_t NTKSuperEllipseRectFirstQuadrantPathCircumference(float64x2_t *a1)
{
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v6 = vsubq_f64(vmulq_f64(*a1, _Q0), a1[1]);
  return v6.f64[0] + v6.f64[1] + a1[3].f64[1];
}

void NTKSuperEllipseRectGetPositionAtAngle(double *a1, double a2)
{
  for (double i = a2; i < 0.0; double i = i + 6.28318531)
    ;
  if (i >= 4.71238898)
  {
    double v3 = 6.28318531;
LABEL_7:
    double v4 = v3 - i;
    goto LABEL_9;
  }
  double v3 = 3.14159265;
  if (i < 3.14159265)
  {
    double v4 = i;
    if (i < 1.57079633) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  double v4 = i + -3.14159265;
LABEL_9:
  if (fabs(v4) >= 2.22044605e-16)
  {
    double v5 = a1[5];
    if (v5 <= v4)
    {
      if (a1[6] <= v4)
      {
        tan(1.57079633 - v4);
      }
      else
      {
        __CGFloat y = 0.0;
        modf((v4 - v5) / a1[8], &__y);
      }
    }
    else
    {
      tan(v4);
    }
  }
}

void NTKSuperEllipseRectGetXYAtPosition(uint64_t a1, double *a2, double *a3, double a4)
{
  uint64_t v18 = 0;
  sub_246B1DA64((float64x2_t *)a1, (BOOL *)&v18 + 1, (int *)&v18, a4);
  double v8 = *(double *)a1 * 0.5;
  double v9 = *(double *)(a1 + 8) * 0.5;
  double v10 = v9 - *(double *)(a1 + 24);
  if (v10 <= v7)
  {
    double v11 = v8 - *(double *)(a1 + 16);
    double v12 = v10 + *(double *)(a1 + 56);
    if (v12 <= v7)
    {
      double v16 = v11 + v12;
      double v8 = 0.0;
      if (v16 > v7) {
        double v8 = v16 - v7;
      }
    }
    else
    {
      __CGFloat y = 0.0;
      double v13 = modf((v7 - v10) / *(double *)(a1 + 72), &__y);
      int v14 = (double *)(a1 + 40 * (__y + *(_DWORD *)(a1 + 80) + 1));
      double v15 = fmin(v13, 1.0);
      if (v15 < 0.0) {
        double v15 = 0.0;
      }
      double v8 = v11 + v14[11] + (v14[16] - v14[11]) * v15;
      double v9 = v10 + v14[12] + (v14[17] - v14[12]) * v15;
    }
  }
  else
  {
    double v9 = v7;
  }
  double v17 = -v8;
  if (!HIDWORD(v18)) {
    double v17 = v8;
  }
  if (v18) {
    double v9 = -v9;
  }
  *a2 = v17;
  *a3 = v9;
}

float64x2_t *sub_246B1DA64(float64x2_t *result, BOOL *a2, int *a3, double a4)
{
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v9 = vsubq_f64(vmulq_f64(*result, _Q1), result[1]);
  double v10 = v9.f64[0] + v9.f64[1] + result[3].f64[1];
  double v11 = v10 + v10;
  double v12 = v10 * 3.0;
  double v13 = v10 * 4.0;
  double v14 = v10 * 4.0;
  if (vabdd_f64(a4, v10 * 4.0) < 0.001
    || (double v14 = v10 * 3.0, vabdd_f64(a4, v12) < 0.001)
    || (double v14 = v10 + v10, vabdd_f64(a4, v11) < 0.001)
    || (double v14 = v10, vabdd_f64(a4, v10) < 0.001)
    || (double i = 0.0, v14 = a4, fabs(a4) >= 0.001))
  {
    for (double i = v14; i < 0.0; double i = v13 + i)
      ;
  }
  while (i > v13)
    double i = i - v13;
  BOOL v16 = i > v10;
  if (i <= v11)
  {
    int v17 = 0;
  }
  else
  {
    BOOL v16 = 1;
    int v17 = 1;
  }
  if (i > v12)
  {
    BOOL v16 = 0;
    int v17 = 1;
  }
  *a2 = v16;
  *a3 = v17;
  return result;
}

double NTKSuperEllipseRectGetPathRotationAtPosition(uint64_t a1, double a2)
{
  uint64_t v11 = 0;
  sub_246B1DA64((float64x2_t *)a1, (BOOL *)&v11 + 1, (int *)&v11, a2);
  double v4 = *(double *)(a1 + 8) * 0.5 - *(double *)(a1 + 24);
  double v5 = 0.0;
  if (v4 <= v3)
  {
    if (v4 + *(double *)(a1 + 56) <= v3)
    {
      double v5 = 1.57079633;
    }
    else
    {
      __CGFloat y = 0.0;
      double v7 = fmin(modf((v3 - v4) / *(double *)(a1 + 72), &__y), 1.0);
      if (v7 < 0.0) {
        double v7 = 0.0;
      }
      uint64_t v6 = a1 + 40 * (__y + *(_DWORD *)(a1 + 80) + 1);
      double v5 = *(double *)(v6 + 112) + (*(double *)(v6 + 152) - *(double *)(v6 + 112)) * v7;
    }
  }
  if (HIDWORD(v11)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v11 == 0;
  }
  if (!v8) {
    return 6.28318531 - v5;
  }
  if (HIDWORD(v11) && v11) {
    return v5 + 3.14159265;
  }
  if (v11) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = HIDWORD(v11) == 0;
  }
  double result = 3.14159265 - v5;
  if (v10) {
    return v5;
  }
  return result;
}

double NTKSuperEllipseRectGetTravelRatioForInsetAtPosition(uint64_t a1, double a2, double a3)
{
  sub_246B1DA64((float64x2_t *)a1, &v15, &v14, a2);
  double v6 = *(double *)(a1 + 8) * 0.5 - *(double *)(a1 + 24);
  double v7 = 1.0;
  if (v6 <= v5 && v6 + *(double *)(a1 + 56) > v5)
  {
    __CGFloat y = 0.0;
    double v8 = modf((v5 - v6) / *(double *)(a1 + 72), &__y);
    float64x2_t v9 = (double *)(a1 + 40 * (__y + *(_DWORD *)(a1 + 80) + 1));
    double v10 = fmin(v8, 1.0);
    if (v10 < 0.0) {
      double v10 = 0.0;
    }
    double v11 = v9[11] + (v9[16] - v9[11]) * v10;
    double v12 = sqrt((v9[12] + (v9[17] - v9[12]) * v10) * (v9[12] + (v9[17] - v9[12]) * v10) + v11 * v11);
    return v12 / (v12 - a3);
  }
  return v7;
}

double NTKSuperEllipseRectGetXYAfterTravelFromPosition(double *a1, double *a2, double *a3, double a4, double a5)
{
  for (double i = *a1 * 0.5 - a1[2] + a1[1] * 0.5 - a1[3] + a1[7]; a4 < 0.0; a4 = a4 + i * 4.0)
    ;
  for (; a4 > i * 4.0; a4 = a4 + -i * 4.0)
    ;
  double v10 = *a2;
  double v11 = *a3;
  if (a5 < 0.0)
  {
    double v12 = -a5;
    double v13 = i + i;
    double v14 = 0.0;
    while (1)
    {
      if (fabs(a4) < 2.22044605e-16) {
        a4 = i * 4.0;
      }
      double v15 = a4 >= 0.0 ? a4 : a4 + i * 4.0;
      if (v15 > i * 3.0) {
        break;
      }
      if (v15 > v13)
      {
        double v17 = v15 + i * -2.0;
        double v18 = -(v12 - v14);
        double v31 = -v10;
        double v11 = -v11;
      }
      else
      {
        if (v15 <= i)
        {
          double v30 = v11;
          double v31 = v10;
          sub_246B1E9F4(a1, &v31, &v30, -(v12 - v14), v15);
          double v14 = v14 + v20;
          a4 = v15 - v20;
          goto LABEL_20;
        }
        double v17 = -(v15 - i * 2.0);
        double v18 = v12 - v14;
        double v31 = -v10;
      }
      double v30 = v11;
      sub_246B1E9F4(a1, &v31, &v30, v18, v17);
      double v14 = v14 + v19;
      a4 = v15 - v19;
      double v31 = -v31;
      if (v15 > v13) {
        goto LABEL_19;
      }
LABEL_20:
      double v11 = v30;
      double v10 = v31;
      if (v12 - v14 <= 0.00000011920929) {
        goto LABEL_40;
      }
    }
    double v30 = -v11;
    double v31 = v10;
    sub_246B1E9F4(a1, &v31, &v30, v12 - v14, -(v15 - i * 4.0));
    double v14 = v14 + v16;
    a4 = v15 - v16;
LABEL_19:
    double v30 = -v30;
    goto LABEL_20;
  }
  double v21 = i + i;
  double v14 = 0.0;
  do
  {
    double v22 = a4 + i * -4.0;
    if (fabs(v22) < 2.22044605e-16) {
      a4 = 0.0;
    }
    if (v22 <= 0.0) {
      double v23 = a4;
    }
    else {
      double v23 = a4 + i * -4.0;
    }
    if (v23 > i * 3.0)
    {
      double v30 = -v11;
      double v31 = v10;
      sub_246B1E9F4(a1, &v31, &v30, -(a5 - v14), -(v23 - i * 4.0));
      double v14 = v14 + v24;
      a4 = v23 + v24;
LABEL_36:
      double v30 = -v30;
      goto LABEL_37;
    }
    if (v23 >= v21)
    {
      double v25 = v23 + i * -2.0;
      double v26 = a5 - v14;
      double v31 = -v10;
      double v11 = -v11;
LABEL_35:
      double v30 = v11;
      sub_246B1E9F4(a1, &v31, &v30, v26, v25);
      double v14 = v14 + v27;
      a4 = v23 + v27;
      double v31 = -v31;
      if (v23 < v21) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    if (v23 > i)
    {
      double v25 = -(v23 - i * 2.0);
      double v26 = -(a5 - v14);
      double v31 = -v10;
      goto LABEL_35;
    }
    double v30 = v11;
    double v31 = v10;
    sub_246B1E9F4(a1, &v31, &v30, a5 - v14, v23);
    double v14 = v14 + v28;
    a4 = v23 + v28;
LABEL_37:
    double v11 = v30;
    double v10 = v31;
  }
  while (a5 - v14 > 0.00000011920929);
LABEL_40:
  *a2 = v10;
  *a3 = v11;
  return v14;
}

void NTKSuperEllipseRectGetPathTangentAtAngle(uint64_t a1, double a2)
{
  if (a2 >= 4.71238898)
  {
    double v3 = 6.28318531;
LABEL_5:
    double v4 = v3 - a2;
    goto LABEL_7;
  }
  double v3 = 3.14159265;
  if (a2 < 3.14159265)
  {
    double v4 = a2;
    if (a2 < 1.57079633) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  double v4 = a2 + -3.14159265;
LABEL_7:
  if (v4 >= *(double *)(a1 + 40) && v4 < *(double *)(a1 + 48)) {
    sub_246B1E1C4(v4, *(double *)(a1 + 16), *(double *)(a1 + 24), *(long double *)(a1 + 32), *(double *)a1 * 0.5 - *(double *)(a1 + 16), *(double *)(a1 + 8) * 0.5 - *(double *)(a1 + 24));
  }
}

double sub_246B1E1C4(double a1, double a2, double a3, long double a4, double a5, double a6)
{
  double v13 = 0.0;
  double v14 = 0.0;
  sub_246B1E948(&v14, &v13, a1, a2, a3, a4, a5, a6);
  double v9 = v13;
  long double v10 = a4 / a2 * pow(v14 / a2, a4 + -1.0);
  long double v11 = a4 / a3 * pow(v9 / a3, a4 + -1.0);

  return atan2(v11, v10);
}

double NTKSuperEllipseRectGetTravelRatioForInsetAtAngle(double *a1, double a2, double a3)
{
  if (a2 >= 4.71238898)
  {
    double v4 = 6.28318531;
  }
  else
  {
    double v4 = 3.14159265;
    if (a2 >= 3.14159265)
    {
      a2 = a2 + -3.14159265;
      goto LABEL_8;
    }
    if (a2 < 1.57079633) {
      goto LABEL_8;
    }
  }
  a2 = v4 - a2;
LABEL_8:
  double v5 = 1.0;
  if (a2 >= a1[5] && a2 < a1[6])
  {
    double v6 = sub_246B1D660(a1, a2);
    return v6 / (v6 - a3);
  }
  return v5;
}

double *NTKSuperEllipseRectNew(unsigned int a1, double a2, double a3, double a4, double a5, long double a6)
{
  unsigned int v11 = a1 + 1;
  BOOL v12 = a1 == -1;
  double v13 = (double *)malloc_type_malloc(80 * (a1 + 1) + 88, 0x9232251CuLL);
  double v14 = a3 * 0.5;
  double v15 = a2 * 0.5 - a4;
  double v16 = atan2(a3 * 0.5, v15);
  long double v17 = v14 - a5;
  double v18 = atan2(v17, a2 * 0.5);
  *double v13 = a2;
  v13[1] = a3;
  v13[2] = a4;
  v13[3] = a5;
  v13[4] = a6;
  v13[5] = v18;
  v13[6] = v16;
  double v19 = (v16 - v18) / (double)a1;
  v13[8] = v19;
  *((_DWORD *)v13 + 20) = a1;
  double v20 = 0.0;
  double v84 = a5;
  double v21 = sub_246B1E7AC(a4, 0.0, a4, a5, a6);
  double v22 = v17;
  double v23 = v21;
  v13[7] = v21;
  double v72 = v21 / (double)a1;
  v13[9] = v72;
  if (!v12)
  {
    double v24 = v15;
    unsigned int v25 = 0;
    double v26 = v13 + 11;
    double v27 = 1.0;
    double v28 = a5;
    double v80 = v22;
    double v81 = v15;
    double v77 = v18;
    do
    {
      double v85 = 0.0;
      double v86 = 0.0;
      if (v25)
      {
        double v29 = 0.0;
        double v30 = v28;
        double v31 = 1.57079633;
        double v32 = v23;
        if (v25 < a1)
        {
          double v33 = v19;
          double v34 = v77 + v19 * v20;
          sub_246B1E948(&v86, &v85, v34, a4, v28, a6, v24, v22);
          double v30 = v85;
          double v32 = sub_246B1E7AC(0.0, v85, v84, a4, a6);
          double v35 = v34;
          double v19 = v33;
          double v31 = sub_246B1E1C4(v35, a4, v84, a6, v81, v80);
          double v27 = 1.0;
          double v22 = v80;
          double v24 = v81;
          double v28 = v84;
          double v29 = v86;
        }
      }
      else
      {
        double v30 = 0.0;
        double v29 = a4;
        double v31 = 0.0;
        double v32 = 0.0;
      }
      *double v26 = v29;
      v26[1] = v30;
      v26[3] = v31;
      v26[4] = v32;
      v26[2] = sqrt((v22 + v30) * (v22 + v30) + (v24 + v29) * (v24 + v29));
      double v20 = v20 + v27;
      ++v25;
      v26 += 5;
    }
    while (a1 + 1 != v25);
    double v36 = &v13[5 * v11 + 11];
    double v37 = 0.0;
    double v38 = 0.0 / v28;
    double v39 = v28;
    long double v40 = pow(0.0 / v28, a6);
    long double v78 = pow(1.0 - v40, 1.0 / a6);
    long double v41 = pow(a4 / a4, a6);
    double v73 = 1.0 / a6;
    long double v42 = pow(1.0 - v41, 1.0 / a6);
    double v44 = v80;
    double v43 = v81;
    unsigned int v45 = 0;
    double v46 = v42 * v39;
    double v71 = a6 + -1.0;
    if (a4 / a4 >= v38) {
      double v47 = 0.0;
    }
    else {
      double v47 = v46;
    }
    double v48 = v78;
    if (a4 / a4 < v38) {
      double v48 = 1.0;
    }
    double v74 = v48 * a4;
    double v75 = v47;
    double v70 = a6 / v39;
    do
    {
      double v49 = a4;
      double v50 = 0.0;
      double v51 = 0.0;
      if (v45)
      {
        double v49 = 0.0;
        double v50 = v84;
        double v51 = 1.57079633;
        if (v45 < a1)
        {
          double v52 = v72 * v37;
          if (v72 * v37 < 0.0) {
            double v53 = -(v72 * v37);
          }
          else {
            double v53 = v72 * v37;
          }
          double v49 = v74;
          double v50 = v75;
          double v54 = v84;
          if (v53 > 0.0)
          {
            double v49 = v74;
            double v50 = v75;
            if (v74 >= 0.0)
            {
              if (v52 < 0.0) {
                double v55 = -0.125;
              }
              else {
                double v55 = 0.125;
              }
              if (v52 < 0.0) {
                double v56 = 0.125;
              }
              else {
                double v56 = -0.125;
              }
              double v57 = 0.0;
              double v59 = v74;
              double v58 = v75;
              double v76 = v56;
              double v79 = v55;
              while (v59 <= a4)
              {
                if (v58 < 0.0 || v58 > v54) {
                  break;
                }
                if (v59 / a4 >= v58 / v54)
                {
                  double v50 = v55 + v58;
                  if (v55 + v58 <= 0.0)
                  {
                    double v49 = a4;
                  }
                  else
                  {
                    double v49 = 0.0;
                    if (v50 < a4)
                    {
                      long double v63 = pow(v50 / v54, a6);
                      long double v64 = pow(1.0 - v63, v73);
                      double v56 = v76;
                      double v55 = v79;
                      double v54 = v84;
                      double v49 = v64 * a4;
                    }
                  }
                }
                else
                {
                  double v49 = v56 + v59;
                  if (v56 + v59 <= 0.0)
                  {
                    double v50 = v54;
                  }
                  else
                  {
                    double v50 = 0.0;
                    if (v49 < a4)
                    {
                      long double v61 = pow(v49 / a4, a6);
                      long double v62 = pow(1.0 - v61, v73);
                      double v56 = v76;
                      double v55 = v79;
                      double v54 = v84;
                      double v50 = v62 * v84;
                    }
                  }
                }
                if (v49 >= 0.0)
                {
                  double v57 = v57 + sqrt((v50 - v58) * (v50 - v58) + (v49 - v59) * (v49 - v59));
                  double v59 = v49;
                  double v58 = v50;
                  if (v57 < v53) {
                    continue;
                  }
                }
                goto LABEL_46;
              }
              double v50 = v58;
              double v49 = v59;
            }
          }
LABEL_46:
          double v65 = v54;
          long double v66 = a6 / a4 * pow(v49 / a4, v71);
          long double v67 = pow(v50 / v65, v71);
          double v51 = atan2(v70 * v67, v66);
          double v44 = v80;
          double v43 = v81;
        }
      }
      *double v36 = v49;
      v36[1] = v50;
      v36[2] = sqrt((v44 + v50) * (v44 + v50) + (v43 + v49) * (v43 + v49));
      v36[3] = v51;
      v36 += 5;
      double v37 = v37 + 1.0;
    }
    while (v45++ != a1);
  }
  return v13;
}

double sub_246B1E7AC(double a1, double a2, double a3, double a4, long double a5)
{
  if (a2 <= a1) {
    double v5 = a2;
  }
  else {
    double v5 = a1;
  }
  if (a2 <= a1) {
    double v6 = a1;
  }
  else {
    double v6 = a2;
  }
  double v7 = 0.0;
  if (v6 > v5 && v6 >= 0.0)
  {
    long double v11 = 1.0 / a5;
    long double v12 = pow(v6 / a3, a5);
    __CGFloat y = v11;
    double v13 = pow(1.0 - v12, v11) * a4;
    double v7 = 0.0;
    double v14 = -0.125;
    double v15 = 0.125;
    do
    {
      if (v6 > a3) {
        break;
      }
      if (v13 < 0.0 || v13 > a4) {
        break;
      }
      if (v6 / a3 >= v13 / a4)
      {
        double v22 = v13 + v15;
        double v19 = 0.0;
        double v18 = a3;
        if (v13 + v15 > 0.0)
        {
          double v18 = 0.0;
          double v19 = a3;
          if (v22 < a3)
          {
            long double v23 = pow(v22 / a4, a5);
            long double v24 = pow(1.0 - v23, __y);
            double v15 = 0.125;
            double v14 = -0.125;
            double v18 = v24 * a3;
            double v19 = v22;
          }
        }
      }
      else
      {
        double v17 = v6 + v14;
        double v18 = 0.0;
        double v19 = a4;
        if (v6 + v14 > 0.0)
        {
          double v19 = 0.0;
          double v18 = a3;
          if (v17 < a3)
          {
            long double v20 = pow(v17 / a3, a5);
            long double v21 = pow(1.0 - v20, __y);
            double v15 = 0.125;
            double v14 = -0.125;
            double v19 = v21 * a4;
            double v18 = v17;
          }
        }
      }
      double v7 = v7 + sqrt((v19 - v13) * (v19 - v13) + (v18 - v6) * (v18 - v6));
      if (v18 <= v5) {
        break;
      }
      double v6 = v18;
      double v13 = v19;
    }
    while (v18 >= 0.0);
  }
  return v7;
}

void sub_246B1E948(double *a1, double *a2, double a3, double a4, double a5, long double a6, double a7, double a8)
{
  if (a5 >= a4)
  {
    sub_246B1EC84(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    sub_246B1EC84((double *)&v11, (double *)&v10, 1.57079633 - a3, a5, a4, a6, a8, a7);
    *(void *)a1 = v10;
    *(void *)a2 = v11;
  }
}

void sub_246B1E9F4(double *a1, double *a2, double *a3, double a4, double a5)
{
  double v8 = *a1 * 0.5;
  double v9 = v8 - a1[2];
  double v10 = a1[1] * 0.5;
  double v11 = v10 - a1[3];
  double v12 = v11 + a1[7];
  double v13 = *a2;
  double v14 = *a3;
  double v15 = a4 + a5;
  if (a4 >= 0.0)
  {
    double v21 = a5;
    if (v11 > a5)
    {
      if (v11 - a5 > v15 - a5)
      {
        *a2 = v8;
LABEL_24:
        *a3 = v15;
        return;
      }
      double v21 = v11 - a5 + a5;
      double v13 = *a1 * 0.5;
      double v14 = v10 - a1[3];
    }
    if (v21 >= v12)
    {
      double v22 = v21;
    }
    else
    {
      double v22 = v11 + a1[7];
      if (v15 - v21 < v12 - v21)
      {
        double v24 = v14 - v11;
        double v25 = v13 - v9;
        sub_246B1EBD0((uint64_t)a1, &v25, &v24, v15 - v21, v21 - v11);
        *a2 = v9 + v25;
        *a3 = v11 + v24;
        return;
      }
    }
    if (v22 >= v9 + v12)
    {
      *a2 = 0.0;
      *a3 = v10;
      return;
    }
    double v23 = v9 + v12 - v15;
LABEL_22:
    *a2 = v23;
    *a3 = v10;
    return;
  }
  double v16 = a5;
  if (v12 >= a5) {
    goto LABEL_5;
  }
  double v17 = a5 - v12;
  if (a5 - v15 <= a5 - v12)
  {
    double v23 = v9 - (v17 - (a5 - v15));
    goto LABEL_22;
  }
  double v16 = a5 - v17;
  double v13 = v8 - a1[2];
  double v14 = a1[1] * 0.5;
LABEL_5:
  double v18 = v16 - v11;
  double v19 = v16 - v15;
  if (v16 <= v11 || v19 >= v18)
  {
    *a2 = v8;
    if (v15 <= 0.0)
    {
      *a3 = 0.0;
      return;
    }
    goto LABEL_24;
  }
  double v24 = v14 - v11;
  double v25 = v13 - v9;
  sub_246B1EBD0((uint64_t)a1, &v25, &v24, -v19, v18);
  *a2 = v9 + v25;
  *a3 = v11 + v24;
}

double sub_246B1EBD0(uint64_t a1, double *a2, double *a3, double a4, double a5)
{
  __CGFloat y = 0.0;
  double v9 = modf((a4 + a5) / *(double *)(a1 + 72), &__y);
  double v10 = (double *)(a1 + 40 * (__y + *(_DWORD *)(a1 + 80) + 1));
  double v11 = fabs(a4);
  double v12 = v10[12];
  double v13 = v10[17];
  double v14 = fmin(v9, 1.0);
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  *a2 = v10[11] + (v10[16] - v10[11]) * v14;
  *a3 = v12 + (v13 - v12) * v14;
  return v11;
}

void sub_246B1EC84(double *a1, double *a2, double a3, double a4, double a5, long double a6, double a7, double a8)
{
  double v10 = a4;
  double v12 = 0.0;
  double v15 = 1.0 / a6;
  while (1)
  {
    double v16 = (v12 + v10) * 0.5;
    long double v17 = pow(v16 / a4, a6);
    double v18 = pow(1.0 - v17, v15) * a5;
    double v19 = atan2(v18 + a8, v16 + a7);
    if (vabdd_f64(v19, a3) < 0.00174532925) {
      break;
    }
    if (v19 - a3 <= 0.0) {
      double v10 = (v12 + v10) * 0.5;
    }
    else {
      double v12 = (v12 + v10) * 0.5;
    }
  }
  *a1 = v16;
  *a2 = v18;
}

uint64_t NTKFoghornFaceNSBundle()
{
  uint64_t v0 = MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();

  return MEMORY[0x270F9A6D0](v0, sel_bundleForClass_, v1, v2);
}

uint64_t sub_246B1EE3C()
{
  uint64_t v1 = sub_246B1F9F8(&qword_2691D4C30);
  uint64_t v22 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  MEMORY[0x270FA5388]();
  double v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246B1F9F8(&qword_2691D4C38);
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x270FA5388]();
  double v24 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246B1FDC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  double v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246B1FD88();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  double v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246B1FDE8();
  MEMORY[0x270FA5388]();
  uint64_t v14 = OBJC_IVAR___NTKFoghornHealthKitDataSource_healthKitProvider;
  uint64_t v27 = v0;
  if (*(void *)(v0 + OBJC_IVAR___NTKFoghornHealthKitDataSource_healthKitProvider)) {
    goto LABEL_3;
  }
  sub_246B1FE28();
  sub_246B1FDD8();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F39738], v10);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F39768], v6);
  uint64_t v15 = sub_246B1FE08();
  sub_246B1FDF8();
  sub_246B1FB1C(&qword_2691D4C40, &qword_2691D4C30);
  sub_246B1FA84();
  uint64_t v16 = v23;
  long double v17 = v24;
  sub_246B1FD58();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v16);
  swift_allocObject();
  uint64_t v18 = v27;
  swift_unknownObjectWeakInit();
  sub_246B1FB1C(&qword_2691D4C50, &qword_2691D4C38);
  uint64_t v19 = v26;
  sub_246B1FD68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v19);
  swift_beginAccess();
  sub_246B1FD48();
  swift_endAccess();
  swift_release();
  *(void *)(v18 + v14) = v15;
  uint64_t result = swift_release();
  if (*(void *)(v18 + v14))
  {
LABEL_3:
    swift_retain();
    sub_246B1FE18();
    return swift_release();
  }
  return result;
}

id sub_246B1F310()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR___NTKFoghornHealthKitDataSource_subscriptions];
  swift_beginAccess();
  *(void *)uint64_t v2 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  *(void *)&v0[OBJC_IVAR___NTKFoghornHealthKitDataSource_healthKitProvider] = 0;
  swift_release();
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_246B1F4B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_246B1FD98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246B1F9F8(&qword_2691D4C58);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246B1FDB8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a2 + 16;
  sub_246B1FD78();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_246B1FB60((uint64_t)v8);
    swift_beginAccess();
    uint64_t v14 = MEMORY[0x24C542400](v13);
    if (v14)
    {
      uint64_t v15 = (char *)v14;
      uint64_t v16 = OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth;
      long double v17 = *(void **)(v14 + OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth);
      *(void *)(v14 + OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth) = 0;

      uint64_t v18 = (void *)MEMORY[0x24C542400](&v15[OBJC_IVAR___NTKFoghornHealthKitDataSource_delegate]);
      if (v18)
      {
        objc_msgSend(v18, sel_maxDepthDidUpdateWithValue_, *(void *)&v15[v16]);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    swift_beginAccess();
    uint64_t v19 = MEMORY[0x24C542400](v13);
    if (v19)
    {
      long double v20 = (char *)v19;
      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F39748], v3);
      sub_246B1FDA8();
      double v22 = v21;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      id v23 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v22);
      uint64_t v24 = OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth;
      uint64_t v25 = *(void **)&v20[OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth];
      *(void *)&v20[OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth] = v23;
      id v26 = v23;

      uint64_t v27 = (void *)MEMORY[0x24C542400](&v20[OBJC_IVAR___NTKFoghornHealthKitDataSource_delegate]);
      if (v27)
      {
        objc_msgSend(v27, sel_maxDepthDidUpdateWithValue_, *(void *)&v20[v24]);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t type metadata accessor for FoghornHealthKitDataSource()
{
  return self;
}

uint64_t sub_246B1F8C0()
{
  uint64_t v1 = swift_unknownObjectWeakAssign();
  uint64_t v2 = MEMORY[0x24C542400](v1);
  swift_unknownObjectRelease();
  if (v2)
  {
    return sub_246B1EE3C();
  }
  else
  {
    uint64_t v4 = (void *)(v0 + OBJC_IVAR___NTKFoghornHealthKitDataSource_subscriptions);
    swift_beginAccess();
    void *v4 = MEMORY[0x263F8EE88];
    swift_bridgeObjectRelease();
    *(void *)(v0 + OBJC_IVAR___NTKFoghornHealthKitDataSource_healthKitProvider) = 0;
    return swift_release();
  }
}

void *sub_246B1F970(void *a1)
{
  uint64_t v2 = OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth);
  *(void *)(v1 + OBJC_IVAR___NTKFoghornHealthKitDataSource_maxDepth) = a1;
  id v4 = a1;

  uint64_t result = (void *)MEMORY[0x24C542400](v1 + OBJC_IVAR___NTKFoghornHealthKitDataSource_delegate);
  if (result)
  {
    objc_msgSend(result, sel_maxDepthDidUpdateWithValue_, *(void *)(v1 + v2));
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_246B1F9F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_246B1FA3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_246B1FA84()
{
  unint64_t result = qword_2691D4C48;
  if (!qword_2691D4C48)
  {
    sub_246B1FD88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D4C48);
  }
  return result;
}

uint64_t sub_246B1FADC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_246B1FB14(uint64_t a1)
{
  sub_246B1F4B0(a1, v1);
}

uint64_t sub_246B1FB1C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246B1FA3C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246B1FB60(uint64_t a1)
{
  uint64_t v2 = sub_246B1F9F8(&qword_2691D4C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246B1FBC0(uint64_t a1)
{
  return a1;
}

uint64_t sub_246B1FBE8()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_246B1FC1C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 136315394;
  uint64_t v6 = "-[NTKSuperEllipseRectGeometry initForDevice:tangentialInset:]";
  __int16 v7 = 1024;
  int v8 = objc_msgSend_sizeClass(a1, a2, a3, a4);
  _os_log_error_impl(&dword_246AFF000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%s: unexpected device size class = 0x%X", (uint8_t *)&v5, 0x12u);
}

void sub_246B1FCBC(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "+[NTKFoghornWaterSubmersionUtilities lastDiveMaxDepth]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246AFF000, a2, OS_LOG_TYPE_ERROR, "%s: error decoding com.apple.Depth.lastDive data:, error = %@", (uint8_t *)&v2, 0x16u);
}

uint64_t sub_246B1FD48()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_246B1FD58()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_246B1FD68()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_246B1FD78()
{
  return MEMORY[0x270F259E8]();
}

uint64_t sub_246B1FD88()
{
  return MEMORY[0x270F259F8]();
}

uint64_t sub_246B1FD98()
{
  return MEMORY[0x270F25A18]();
}

uint64_t sub_246B1FDA8()
{
  return MEMORY[0x270F25A28]();
}

uint64_t sub_246B1FDB8()
{
  return MEMORY[0x270F25A30]();
}

uint64_t sub_246B1FDC8()
{
  return MEMORY[0x270F25A80]();
}

uint64_t sub_246B1FDD8()
{
  return MEMORY[0x270F25AB0]();
}

uint64_t sub_246B1FDE8()
{
  return MEMORY[0x270F25AB8]();
}

uint64_t sub_246B1FDF8()
{
  return MEMORY[0x270F25AC0]();
}

uint64_t sub_246B1FE08()
{
  return MEMORY[0x270F25AC8]();
}

uint64_t sub_246B1FE18()
{
  return MEMORY[0x270F25AD0]();
}

uint64_t sub_246B1FE28()
{
  return MEMORY[0x270F25AD8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x270EE51A8](str);
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x270EE5968](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CLKCeilForDevice()
{
  return MEMORY[0x270EE3158]();
}

uint64_t CLKClockTimerDateForNow()
{
  return MEMORY[0x270EE3160]();
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x270EE3170]();
}

uint64_t CLKFloorForDevice()
{
  return MEMORY[0x270EE3198]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x270EE3240]();
}

uint64_t CLKRoundForDevice()
{
  return MEMORY[0x270EE3250]();
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x270EE9BF8](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x270EE9DC0](line);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x270EE9E00](line, ascent, descent, leading);
  return result;
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x270EE9E50](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

double CTRunGetTypographicBounds(CTRunRef run, CFRange range, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x270EE9ED0](run, range.location, range.length, ascent, descent, leading);
  return result;
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

uint64_t NTKAllSignatureCircularTypes()
{
  return MEMORY[0x270F4D8D0]();
}

uint64_t NTKAllSignatureRectangularTypes()
{
  return MEMORY[0x270F4D8E0]();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return MEMORY[0x270F4D8F8]();
}

uint64_t NTKColorByPremultiplyingAlpha()
{
  return MEMORY[0x270F4D938]();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return MEMORY[0x270F4D940]();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return MEMORY[0x270F4D948]();
}

uint64_t NTKIdealizedDate()
{
  return MEMORY[0x270F4D9C0]();
}

uint64_t NTKInternalBuild()
{
  return MEMORY[0x270F4D9E0]();
}

uint64_t NTKInterpolateBetweenColors()
{
  return MEMORY[0x270F4D9E8]();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return MEMORY[0x270F4DA30]();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return MEMORY[0x270F4DA90]();
}

uint64_t NTKWhistlerLargeRectangularComplicationSize()
{
  return MEMORY[0x270F4DAC8]();
}

uint64_t NTKWhistlerSubdialComplicationDiameter()
{
  return MEMORY[0x270F4DAD0]();
}

uint64_t TextToFourCharCode()
{
  return MEMORY[0x270F247A8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}