void sub_2574(uint64_t a1, void *a2)
{
  id v3;
  uint64_t vars8;

  v3 = [a2 unityFacesForDevice:*(void *)(a1 + 32)];
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

uint64_t sub_25D8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 face];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_2918(id a1)
{
  v3[0] = &off_10A38;
  v3[1] = &off_10A50;
  v4[0] = @"black-black";
  v4[1] = @"red-black-green";
  v3[2] = &off_10A68;
  v4[2] = @"red-black-green-gold";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)qword_17250;
  qword_17250 = v1;
}

void sub_3198(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 format];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = (CGContext *)[v3 CGContext];
  CGContextTranslateCTM(v13, v10 * 0.5, v12 * 0.5);
  CGContextRotateCTM(v13, -0.785398163);
  CGContextTranslateCTM(v13, -(v10 * 0.5), -(v12 * 0.5));
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  CGContextAddEllipseInRect(v13, v29);
  CGContextClip(v13);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = *(id *)(a1 + 32);
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    double v18 = 0.0;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "color", (void)v24);
        [v20 height];
        double v23 = v22;
        [v21 setFill];
        v30.origin.x = 0.0;
        v30.origin.y = v18;
        v30.size.width = v10;
        v30.size.height = v23;
        CGContextFillRect(v13, v30);
        double v18 = v18 + v23;
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

void sub_508C(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17298);
  id WeakRetained = objc_loadWeakRetained(&qword_172A0);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_172A0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_172A8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_172A0, obj);
  qword_172A8 = (uint64_t)[obj version];

  sub_6730(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17298);
  long long v10 = *(_OWORD *)&qword_17270;
  *(_OWORD *)a2 = xmmword_17260;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_17280;
  *(void *)(a2 + 48) = qword_17290;
}

void sub_54C8(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 display];
  [v4 _applyComplicationStyleToView:v6 forSlot:v5];
}

void sub_5730(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 isEqualToString:NTKComplicationSlotDate])
  {
    id v6 = [*(id *)(a1 + 32) dateComplicationLabelColor];
    uint64_t v7 = [*(id *)(a1 + 40) dateComplicationLabelColor];
LABEL_5:
    id v8 = (void *)v7;
    uint64_t v9 = NTKInterpolateBetweenColors();

    goto LABEL_7;
  }
  if ([v13 isEqualToString:NTKComplicationSlotBottom])
  {
    id v6 = [*(id *)(a1 + 32) bottomComplicationLabelColor];
    uint64_t v7 = [*(id *)(a1 + 40) bottomComplicationLabelColor];
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_7:
  long long v10 = [v5 display];
  unsigned int v11 = [v10 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView];

  if (v11)
  {
    double v12 = [v5 display];
    [v12 setAccentColor:v9];
    [v12 setForegroundColor:v9];
  }
}

id sub_6034(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
}

void sub_6044(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) defaultLayoutRuleForState:a2];
  [v4 setVerticalLayout:3];
  [v4 setHorizontalLayout:1];
  [*(id *)(a1 + 32) setDefaultLayoutRule:v4 forState:a2];
  if (*(double *)(a1 + 48) > 0.0)
  {
    [v4 referenceFrame];
    CLKRectCenteredXInRectForDevice();
    objc_msgSend(v4, "setReferenceFrame:");
  }
}

void sub_6730(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:3 forSizeClass:1.13580247];
  v17[0] = &off_10B10;
  v17[1] = &off_10B28;
  v18[0] = &off_10C70;
  v18[1] = &off_10C70;
  id v3 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v2 scaledValue:v3 withOverrides:29.0];
  qword_17270 = v4;

  v15[0] = &off_10B10;
  v15[1] = &off_10B28;
  v16[0] = &off_10C80;
  v16[1] = &off_10C80;
  id v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 scaledValue:v5 withOverrides:16.0];
  *(void *)&xmmword_17260 = v6;

  v13[0] = &off_10B40;
  v13[1] = &off_10B28;
  v14[0] = &off_10C90;
  v14[1] = &off_10CA0;
  v13[2] = &off_10B58;
  v14[2] = &off_10CA0;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 constantValue:v7 withOverrides:0.0];
  qword_17278 = v8;

  [v2 scaledValue:0 withOverride:13.5 forSizeClass:12.5];
  *((void *)&xmmword_17260 + 1) = v9;
  [v2 scaledValue:111.0];
  *(void *)&xmmword_17280 = v10;
  [v2 scaledValue:87.5];
  *((void *)&xmmword_17280 + 1) = v11;
  [v2 scaledValue:181.5];
  qword_17290 = v12;
}

id NTKRenegadeQuiltPieceBezierPath(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v19 = a4;
  id v20 = a3;
  id v21 = a2;
  id v22 = a1;
  double v23 = +[UIBezierPath bezierPath];
  long long v24 = NTKRenegadeOrderedKeysForValues(v20);
  long long v25 = [v24 firstObject];
  long long v26 = [v20 objectForKey:v25];
  [v25 floatValue];
  double v28 = v27;
  [v26 floatValue];
  double v30 = NTKRenegadeTangentialPointFromLine(a11, a12, a7, a8, v28, v29);
  double v32 = v31;
  objc_msgSend(v23, "moveToPoint:");
  NTKRenegadeBezierPathAddValues(v23, v20, a11, a12, a7, a8);

  NTKRenegadeBezierPathAddValues(v23, v21, a7, a8, a5, a6);
  NTKRenegadeBezierPathAddValues(v23, v19, a5, a6, a9, a10);

  NTKRenegadeBezierPathAddValues(v23, v22, a9, a10, a11, a12);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", v30, v32, a11, a12);
  [v23 closePath];

  return v23;
}

id NTKRenegadeOrderedKeysForValues(void *a1)
{
  uint64_t v1 = [a1 allKeys];
  v2 = [v1 sortedArrayUsingComparator:&stru_10608];

  return v2;
}

double NTKRenegadeTangentialPointFromLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  CLKInterpolateBetweenPoints();
  double v12 = v11;
  double v13 = -1.0 / ((a4 - a2) / (a3 - a1));
  *(float *)&double v11 = v13;
  float v14 = atanf(*(float *)&v11);
  if (v13 <= 0.0) {
    float v14 = -v14;
  }
  return v12 - a6 * __sincosf_stret(v14).__cosval;
}

double NTKRenegadeFloatForNumber(void *a1)
{
  [a1 floatValue];
  return v1;
}

double NTKRenegadeBezierPathAddValues(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  double v13 = NTKRenegadeOrderedKeysForValues(v12);
  uint64_t v39 = 0;
  v40 = (double *)&v39;
  uint64_t v41 = 0x3010000000;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  v42 = "";
  if (CLKPointEqualsPoint())
  {
    uint64_t v14 = 0;
    id v15 = v40;
    v40[4] = a3;
    v15[5] = a4;
  }
  else
  {
    id v16 = [v13 firstObject];
    uint64_t v17 = [v12 objectForKey:v16];
    [v16 floatValue];
    float v19 = v18;
    [v17 floatValue];
    double v21 = NTKRenegadeTangentialPointFromLine(a3, a4, a5, a6, v19, v20);
    id v22 = v40;
    v40[4] = v21;
    *((void *)v22 + 5) = v23;
    objc_msgSend(v11, "addQuadCurveToPoint:controlPoint:");

    uint64_t v14 = 1;
  }
  if ([v13 count])
  {
    long long v24 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v14, (char *)[v13 count] - v14);
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_74E0;
    v27[3] = &unk_10630;
    double v33 = a3;
    double v34 = a4;
    double v35 = a5;
    double v36 = a6;
    id v28 = v12;
    double v30 = v38;
    double v31 = v37;
    id v29 = v11;
    double v32 = &v39;
    [v13 enumerateObjectsAtIndexes:v24 options:0 usingBlock:v27];

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v38, 8);
  }
  double v25 = v40[4];
  _Block_object_dispose(&v39, 8);

  return v25;
}

void sub_7470(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

int64_t sub_74BC(id a1, NSNumber *a2, NSNumber *a3)
{
  return (char *)[(NSNumber *)a2 compare:a3] == (char *)&dword_0 + 1;
}

void sub_74E0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v21 = [v3 objectForKey:v4];
  [v4 floatValue];
  float v6 = v5;

  double v7 = v6;
  [v21 floatValue];
  double v9 = v8;
  double v10 = NTKRenegadeTangentialPointFromLine(*(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v7, v8);
  double v12 = v11;
  double v13 = (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + v7) * 0.5;
  double v14 = NTKRenegadeTangentialPointFromLine(*(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v13, *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  double v16 = v15;
  double v17 = NTKRenegadeTangentialPointFromLine(*(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v13, v9);
  double v19 = v18;
  [*(id *)(a1 + 40) currentPoint];
  if ((CLKPointEqualsPoint() & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "addCurveToPoint:controlPoint1:controlPoint2:", v10, v12, v14, v16, v17, v19);
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  *(double *)(v20 + 32) = v10;
  *(double *)(v20 + 40) = v12;
}

double NTKRenegadeTangentialInterceptingFractionOnLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return ((a6 - -1.0 / ((a4 - a2) / (a3 - a1)) * a5 - (a2 - (a4 - a2) / (a3 - a1) * a1))
        / ((a4 - a2) / (a3 - a1) - -1.0 / ((a4 - a2) / (a3 - a1)))
        - a1)
       / (a3 - a1);
}

double NTKRenegadeHorizontalFractionOnLine(double a1, double a2, double a3, double a4, double a5)
{
  return a5 / (a3 - a1);
}

double NTKRenegadeLengthBetweenPoints(double a1, double a2, double a3, double a4)
{
  float v4 = a1 - a3;
  float v5 = a2 - a4;
  return sqrtf((float)(v4 * v4) + (float)(v5 * v5));
}

id NTKRenegadeBezierPathFromSVGDataAsset(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  [a1 data];

  CGSVGDocumentCreateFromData();
  CGSVGDocumentGetCanvasSize();
  double v10 = v9;
  CGSVGDocumentGetRootNode();
  CGSVGNodeGetChildAtIndex();
  CGSVGShapeNodeGetPath();
  CGPath = (const CGPath *)CGSVGPathCreateCGPath();
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  CGFloat Width = CGRectGetWidth(v24);
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&transform.c = v13;
  *(_OWORD *)&transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGFloat v14 = Width / v10;
  *(_OWORD *)&v21.a = *(_OWORD *)&transform.a;
  *(_OWORD *)&v21.c = v13;
  *(_OWORD *)&v21.tx = *(_OWORD *)&transform.tx;
  CGAffineTransformScale(&transform, &v21, v14, v14);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  CGFloat v15 = CGRectGetMinX(v25) / v14;
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = a4;
  v26.size.height = a5;
  CGFloat MinY = CGRectGetMinY(v26);
  CGAffineTransform v20 = transform;
  CGAffineTransformTranslate(&v21, &v20, v15, MinY / v14);
  CGAffineTransform transform = v21;
  double v17 = CGPathCreateCopyByTransformingPath(CGPath, &transform);
  double v18 = +[UIBezierPath bezierPathWithCGPath:v17];
  CGSVGDocumentRelease();
  CGPathRelease(CGPath);
  CGPathRelease(v17);

  return v18;
}

CGFloat NTKRenegadeHorizontallyCenteredFrameWithEdgeInsets(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double v11 = (a5 + a7) * (CGRectGetWidth(*(CGRect *)&a1) * 0.5);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  return a1 + v11 / CGRectGetHeight(v13);
}

double sub_7E30(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_172D0);
  id WeakRetained = objc_loadWeakRetained(&qword_172D8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_172D8);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_172D8, v1);
    qword_172E0 = (uint64_t)[v1 version];

    sub_9228(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_172E0;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_172D0);
  double v9 = *(double *)&qword_172B0;

  return v9;
}

void sub_8E68(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) layer];
  [v2 setFrozen:1];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) layer];
  [v3 setFrozen:1];
}

void sub_9228(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:3 forSizeClass:1.13580247];
  [v2 scaledValue:111.0];
  qword_172B0 = v3;
  v14[0] = &off_10B70;
  v14[1] = &off_10B88;
  v15[0] = &off_10CB0;
  v15[1] = &off_10CB0;
  id v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 scaledValue:v4 withOverrides:83.0];
  qword_172B8 = v5;

  v12[0] = &off_10BA0;
  v12[1] = &off_10BB8;
  v13[0] = &off_10CC0;
  v13[1] = &off_10CD0;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v2 scaledValue:v6 withOverrides:114.0];
  qword_172C0 = v7;

  v10[0] = &off_10BA0;
  v10[1] = &off_10BB8;
  v11[0] = &off_10CE0;
  v11[1] = &off_10CF0;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v2 scaledValue:v8 withOverrides:114.0];
  qword_172C8 = v9;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return _CGPathCreateCopyByTransformingPath(path, transform);
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CGSVGDocumentCreateFromData()
{
  return _CGSVGDocumentCreateFromData();
}

uint64_t CGSVGDocumentGetCanvasSize()
{
  return _CGSVGDocumentGetCanvasSize();
}

uint64_t CGSVGDocumentGetRootNode()
{
  return _CGSVGDocumentGetRootNode();
}

uint64_t CGSVGDocumentRelease()
{
  return _CGSVGDocumentRelease();
}

uint64_t CGSVGNodeGetChildAtIndex()
{
  return _CGSVGNodeGetChildAtIndex();
}

uint64_t CGSVGPathCreateCGPath()
{
  return _CGSVGPathCreateCGPath();
}

uint64_t CGSVGShapeNodeGetPath()
{
  return _CGSVGShapeNodeGetPath();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKInterpolateBetweenPoints()
{
  return _CLKInterpolateBetweenPoints();
}

uint64_t CLKPointEqualsPoint()
{
  return _CLKPointEqualsPoint();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKInterpolateBetweenBezierPaths()
{
  return _NTKInterpolateBetweenBezierPaths();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

float atanf(float a1)
{
  return _atanf(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CLKFontWithAlternativePunctuation(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithAlternativePunctuation];
}

id objc_msgSend__areComplicationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _areComplicationsEnabled];
}

id objc_msgSend__blackColor(void *a1, const char *a2, ...)
{
  return [a1 _blackColor];
}

id objc_msgSend__bottomComplicationFont(void *a1, const char *a2, ...)
{
  return [a1 _bottomComplicationFont];
}

id objc_msgSend__coloringLabel(void *a1, const char *a2, ...)
{
  return [a1 _coloringLabel];
}

id objc_msgSend__darkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 _darkGrayColor];
}

id objc_msgSend__dateComplicationFont(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationFont];
}

id objc_msgSend__dateComplicationFrame(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationFrame];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__galleryTitleKey(void *a1, const char *a2, ...)
{
  return [a1 _galleryTitleKey];
}

id objc_msgSend__generateQuiltPaths(void *a1, const char *a2, ...)
{
  return [a1 _generateQuiltPaths];
}

id objc_msgSend__goldColor(void *a1, const char *a2, ...)
{
  return [a1 _goldColor];
}

id objc_msgSend__greenColor(void *a1, const char *a2, ...)
{
  return [a1 _greenColor];
}

id objc_msgSend__layoutTimeLabels(void *a1, const char *a2, ...)
{
  return [a1 _layoutTimeLabels];
}

id objc_msgSend__lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 _lightGrayColor];
}

id objc_msgSend__loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 _loadLayoutRules];
}

id objc_msgSend__redColor(void *a1, const char *a2, ...)
{
  return [a1 _redColor];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__snapshotConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _snapshotConfiguration];
}

id objc_msgSend__swatchBlackColor(void *a1, const char *a2, ...)
{
  return [a1 _swatchBlackColor];
}

id objc_msgSend__updateComplicationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _updateComplicationsEnabled];
}

id objc_msgSend__updateLabelBackgroundCutouts(void *a1, const char *a2, ...)
{
  return [a1 _updateLabelBackgroundCutouts];
}

id objc_msgSend__updateTimeLabels(void *a1, const char *a2, ...)
{
  return [a1 _updateTimeLabels];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_bottomComplicationLabelColor(void *a1, const char *a2, ...)
{
  return [a1 bottomComplicationLabelColor];
}

id objc_msgSend_bottomOverlapColor(void *a1, const char *a2, ...)
{
  return [a1 bottomOverlapColor];
}

id objc_msgSend_bottomPatchColor(void *a1, const char *a2, ...)
{
  return [a1 bottomPatchColor];
}

id objc_msgSend_bottomQuiltPath(void *a1, const char *a2, ...)
{
  return [a1 bottomQuiltPath];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentPoint(void *a1, const char *a2, ...)
{
  return [a1 currentPoint];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_dateComplicationLabelColor(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationLabelColor];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_fractionValue(void *a1, const char *a2, ...)
{
  return [a1 fractionValue];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_highlightColor(void *a1, const char *a2, ...)
{
  return [a1 highlightColor];
}

id objc_msgSend_hourLabelColor(void *a1, const char *a2, ...)
{
  return [a1 hourLabelColor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isSnapshotConfiguration(void *a1, const char *a2, ...)
{
  return [a1 isSnapshotConfiguration];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_minuteLabelColor(void *a1, const char *a2, ...)
{
  return [a1 minuteLabelColor];
}

id objc_msgSend_new(void *a1, const char *a2, ...)
{
  return [a1 new];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_timeSubstringFromSeparatorText(void *a1, const char *a2, ...)
{
  return [a1 timeSubstringFromSeparatorText];
}

id objc_msgSend_timeSubstringToSeparatorText(void *a1, const char *a2, ...)
{
  return [a1 timeSubstringToSeparatorText];
}

id objc_msgSend_topPatchColor(void *a1, const char *a2, ...)
{
  return [a1 topPatchColor];
}

id objc_msgSend_topQuiltPath(void *a1, const char *a2, ...)
{
  return [a1 topQuiltPath];
}

id objc_msgSend_topQuiltPieceOverlapsBottom(void *a1, const char *a2, ...)
{
  return [a1 topQuiltPieceOverlapsBottom];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}