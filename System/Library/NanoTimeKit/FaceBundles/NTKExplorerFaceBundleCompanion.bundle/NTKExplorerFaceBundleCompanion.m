double _subdialYPositionForDensity(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  _OWORD v10[5];
  uint64_t v11;
  _OWORD v12[5];
  uint64_t v13;

  v3 = a2;
  v4 = v3;
  if (a1 == 3)
  {
    sub_4620(v3, v12);
    v5 = (double *)&v13;
  }
  else
  {
    sub_4620(v3, v10);
    v5 = (double *)&v11;
  }
  v6 = *v5;
  [v4 screenBounds];
  v8 = v7;

  return v6 + v8 * 0.5;
}

void sub_4620(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16428);
  id WeakRetained = objc_loadWeakRetained(&qword_16430);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16430);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16438;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16430, obj);
  qword_16438 = (uint64_t)[obj version];

  sub_5C34(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16428);
  long long v10 = *(_OWORD *)&qword_16408;
  a2[4] = xmmword_163F8;
  a2[5] = v10;
  a2[6] = xmmword_16418;
  long long v11 = unk_163C8;
  *a2 = xmmword_163B8;
  a2[1] = v11;
  long long v12 = *(_OWORD *)&qword_163E8;
  a2[2] = xmmword_163D8;
  a2[3] = v12;
}

double _statusViewYPositionForDensity(unint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (a1 > 1)
  {
    sub_4620(v3, v10);
    id v5 = (double *)&v11;
  }
  else
  {
    sub_4620(v3, v12);
    id v5 = (double *)&v13;
  }
  double v6 = *v5;
  [v4 screenBounds];
  double v8 = v7;

  return v6 + v8 * 0.5;
}

id sub_5994(uint64_t a1, void *a2)
{
  id v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 48), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 56), "drawAtPoint:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  long long v12 = *(void **)(a1 + 64);
  double v13 = *(double *)(a1 + 72);
  double v14 = *(double *)(a1 + 80);

  return objc_msgSend(v12, "drawAtPoint:", v13, v14);
}

void sub_5C34(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  double v5 = v4;

  *(double *)&xmmword_163B8 = v5 + -1.0;
  *((void *)&xmmword_163B8 + 1) = 0;
  unk_163C8 = 0;
  *(double *)&qword_163D0 = v5 + -1.0;
  *(double *)&xmmword_163D8 = v5 + -1.0;
  v25[0] = &off_10C78;
  v25[1] = &off_10C90;
  v26[0] = &off_11158;
  v26[1] = &off_11168;
  double v6 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v3 constantValue:v6 withOverrides:0.0];
  uint64_t v8 = v7;

  *((void *)&xmmword_163D8 + 1) = 0;
  qword_163E8 = v8;
  unk_163F0 = CGPointZero;
  *((void *)&xmmword_163F8 + 1) = 0x3FF0000000000000;
  v23[0] = &off_10C78;
  v23[1] = &off_10C90;
  v24[0] = &off_11178;
  v24[1] = &off_11188;
  v23[2] = &off_10CA8;
  v24[2] = &off_10CC0;
  double v9 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v3 scaledValue:v9 withOverrides:34.0];
  qword_16408 = v10;

  v21[0] = &off_10C78;
  v21[1] = &off_10C90;
  v22[0] = &off_11198;
  v22[1] = &off_111A8;
  v21[2] = &off_10CA8;
  v22[2] = &off_111B8;
  double v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v3 scaledValue:v11 withOverrides:28.5];
  qword_16410 = v12;

  v19[0] = &off_10C78;
  v19[1] = &off_10CA8;
  v20[0] = &off_111C8;
  v20[1] = &off_111D8;
  double v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v3 scaledValue:v13 withOverrides:-27.0];
  *(void *)&xmmword_16418 = v14;

  v17[0] = &off_10C78;
  v17[1] = &off_10CA8;
  v18[0] = &off_111E8;
  v18[1] = &off_111F8;
  v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v3 scaledValue:v15 withOverrides:-31.5];
  *((void *)&xmmword_16418 + 1) = v16;
}

uint64_t sub_629C()
{
  qword_16440 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_6350(id a1)
{
  v3[0] = &off_10CD8;
  v3[1] = &off_10CF0;
  v4[0] = NTKFaceBundleColorRed;
  v4[1] = NTKFaceBundleColorRedWhite;
  v3[2] = &off_10D08;
  v4[2] = NTKFaceBundleColorWhite;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  id v2 = (void *)qword_16460;
  qword_16460 = v1;
}

void sub_6E68(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:3];
  qword_16470 = 0x4004000000000000;
  v9[0] = &off_10DC8;
  v9[1] = &off_10DE0;
  v10[0] = &off_11208;
  v10[1] = &off_11218;
  id v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 scaledValue:v3 withOverrides:20.75];
  qword_16478 = v4;

  v7[0] = &off_10DC8;
  v7[1] = &off_10DE0;
  v8[0] = &off_11228;
  v8[1] = &off_11238;
  double v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 scaledValue:v5 withOverrides:6.25];
  qword_16480 = v6;

  qword_16488 = 0x4002000000000000;
}

id _ringColor()
{
  if (qword_164B0 != -1) {
    dispatch_once(&qword_164B0, &stru_104C8);
  }
  v0 = (void *)qword_164A8;

  return v0;
}

id _minuteTickColor()
{
  if (qword_164F0 != -1) {
    dispatch_once(&qword_164F0, &stru_10528);
  }
  v0 = (void *)qword_164E8;

  return v0;
}

id _numeralsGreyColor()
{
  if (qword_16510 != -1) {
    dispatch_once(&qword_16510, &stru_10568);
  }
  v0 = (void *)qword_16508;

  return v0;
}

double _hourNumeralOpacity(uint64_t a1)
{
  double result = 0.0;
  if (a1 == 2) {
    return 1.0;
  }
  return result;
}

void sub_8760(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllAnimations];
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  v10[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v10[5] = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  _OWORD v10[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v10[7] = v5;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  v10[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v10[1] = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  void v10[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v10[3] = v7;
  [v3 setTransform:v10];
  _numeralsGreyColor();
  id v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForegroundColor:", objc_msgSend(v8, "CGColor"));

  double v9 = *(double *)(a1 + 32);
  *(float *)&double v9 = v9;
  [v3 setOpacity:v9];
}

double _minuteNumeralOpacity(uint64_t a1)
{
  double result = 0.0;
  if (a1 == 3) {
    return 1.0;
  }
  return result;
}

void sub_881C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllAnimations];
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  v10[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v10[5] = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  _OWORD v10[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v10[7] = v5;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  v10[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v10[1] = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  void v10[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v10[3] = v7;
  [v3 setTransform:v10];
  _numeralsGreyColor();
  id v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForegroundColor:", objc_msgSend(v8, "CGColor"));

  double v9 = *(double *)(a1 + 32);
  *(float *)&double v9 = v9;
  [v3 setOpacity:v9];
}

id _secondTickColor(uint64_t a1)
{
  if (qword_164E0 != -1) {
    dispatch_once(&qword_164E0, &stru_10508);
  }
  id v2 = &qword_164D8;
  if (a1 != 2) {
    id v2 = &qword_164D0;
  }
  id v3 = (void *)*v2;

  return v3;
}

id _hourTickColor(uint64_t a1)
{
  if (qword_164C8 != -1) {
    dispatch_once(&qword_164C8, &stru_104E8);
  }
  id v2 = &qword_164C0;
  if (a1 != 2) {
    id v2 = &qword_164B8;
  }
  id v3 = (void *)*v2;

  return v3;
}

__n128 _minuteClusterTransform@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_16698 != -1) {
    dispatch_once(&qword_16698, &stru_10588);
  }
  if (a1 == 3)
  {
    long long v4 = &xmmword_16598;
  }
  else if (a1)
  {
    long long v4 = &xmmword_16518;
  }
  else
  {
    long long v4 = &xmmword_16618;
  }
  long long v5 = v4[5];
  *(_OWORD *)(a2 + 64) = v4[4];
  *(_OWORD *)(a2 + 80) = v5;
  long long v6 = v4[7];
  *(_OWORD *)(a2 + 96) = v4[6];
  *(_OWORD *)(a2 + 112) = v6;
  long long v7 = v4[1];
  *(_OWORD *)a2 = *v4;
  *(_OWORD *)(a2 + 16) = v7;
  __n128 result = (__n128)v4[2];
  long long v9 = v4[3];
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v9;
  return result;
}

__n128 _minuteInstanceTransform@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_16820 != -1) {
    dispatch_once(&qword_16820, &stru_105A8);
  }
  if (a1 == 3)
  {
    long long v4 = &xmmword_16720;
  }
  else if (a1)
  {
    long long v4 = &xmmword_166A0;
  }
  else
  {
    long long v4 = &xmmword_167A0;
  }
  long long v5 = v4[5];
  *(_OWORD *)(a2 + 64) = v4[4];
  *(_OWORD *)(a2 + 80) = v5;
  long long v6 = v4[7];
  *(_OWORD *)(a2 + 96) = v4[6];
  *(_OWORD *)(a2 + 112) = v6;
  long long v7 = v4[1];
  *(_OWORD *)a2 = *v4;
  *(_OWORD *)(a2 + 16) = v7;
  __n128 result = (__n128)v4[2];
  long long v9 = v4[3];
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v9;
  return result;
}

uint64_t _minuteInstanceCount(uint64_t a1)
{
  if (a1 == 3) {
    return 4;
  }
  else {
    return 1;
  }
}

double _minuteTickOpacity(uint64_t a1)
{
  double result = 1.0;
  if (!a1) {
    return 0.0;
  }
  return result;
}

double _secondReplicatorInstanceDelay(uint64_t a1)
{
  double result = 1.0;
  if (a1 == 2) {
    return 3.0;
  }
  return result;
}

void sub_8EA8(uint64_t a1, void *a2, uint64_t a3)
{
  long long v4 = *(void **)(a1 + 32);
  double v5 = dbl_F9C0[a3];
  id v6 = a2;
  [v4 setBeginTime:v5];
  [v6 addAnimation:*(void *)(a1 + 32) forKey:@"hourNumeralShow"];
}

void sub_8F24(uint64_t a1, void *a2, uint64_t a3)
{
  long long v4 = *(void **)(a1 + 32);
  double v5 = dbl_F9D8[a3];
  id v6 = a2;
  [v4 setBeginTime:v5];
  [v6 addAnimation:*(void *)(a1 + 32) forKey:@"hourNumeralHide"];
}

void sub_8FA0(uint64_t a1, void *a2, unint64_t a3)
{
  long long v4 = *(void **)(a1 + 32);
  double v5 = (double)a3 * 5.0 + 0.00000011920929;
  id v6 = a2;
  [v4 setBeginTime:v5];
  [v6 addAnimation:*(void *)(a1 + 32) forKey:@"minuteNumeralShow"];
}

uint64_t sub_930C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 49)) {
      goto LABEL_6;
    }
    id v6 = v3;
    id v3 = [*(id *)(a1 + 32) insertSublayer:v3 above:*(void *)(*(void *)(a1 + 40) + 48)];
  }
  else
  {
    id v6 = v3;
    id v3 = [v3 removeFromSuperlayer];
  }
  id v4 = v6;
LABEL_6:

  return _objc_release_x1(v3, v4);
}

uint64_t sub_938C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 49)) {
      goto LABEL_6;
    }
    id v6 = v3;
    id v3 = [*(id *)(a1 + 32) insertSublayer:v3 above:*(void *)(*(void *)(a1 + 40) + 48)];
  }
  else
  {
    id v6 = v3;
    id v3 = [v3 removeFromSuperlayer];
  }
  id v4 = v6;
LABEL_6:

  return _objc_release_x1(v3, v4);
}

double _minuteReplicatorInstanceDelay()
{
  return 5.0;
}

void sub_A34C(id a1)
{
  uint64_t v1 = +[UIColor colorWithRed:0.0949019608 green:0.0956862745 blue:0.0988235294 alpha:1.0];
  uint64_t v2 = qword_164A8;
  qword_164A8 = v1;

  _objc_release_x1(v1, v2);
}

void sub_A3A8(id a1)
{
  uint64_t v1 = +[UIColor colorWithRed:0.780392157 green:0.784313725 blue:0.792156863 alpha:1.0];
  uint64_t v2 = (void *)qword_164C0;
  qword_164C0 = v1;

  uint64_t v3 = +[UIColor colorWithRed:0.862745098 green:0.866666667 blue:0.870588235 alpha:1.0];
  uint64_t v4 = qword_164B8;
  qword_164B8 = v3;

  _objc_release_x1(v3, v4);
}

void sub_A444(id a1)
{
  uint64_t v1 = +[UIColor colorWithWhite:0.588235294 alpha:1.0];
  uint64_t v2 = (void *)qword_164D8;
  qword_164D8 = v1;

  uint64_t v3 = +[UIColor colorWithRed:0.345098039 green:0.349019608 blue:0.356862745 alpha:1.0];
  uint64_t v4 = qword_164D0;
  qword_164D0 = v3;

  _objc_release_x1(v3, v4);
}

void sub_A4D0(id a1)
{
  uint64_t v1 = +[UIColor colorWithRed:0.388235294 green:0.392156863 blue:0.4 alpha:1.0];
  uint64_t v2 = qword_164E8;
  qword_164E8 = v1;

  _objc_release_x1(v1, v2);
}

id _numeralsRedColor()
{
  if (qword_16500 != -1) {
    dispatch_once(&qword_16500, &stru_10548);
  }
  v0 = (void *)qword_164F8;

  return v0;
}

void sub_A580(id a1)
{
  uint64_t v1 = +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  uint64_t v2 = qword_164F8;
  qword_164F8 = v1;

  _objc_release_x1(v1, v2);
}

void sub_A5D8(id a1)
{
  uint64_t v1 = +[UIColor colorWithRed:0.780392157 green:0.784313725 blue:0.792156863 alpha:1.0];
  uint64_t v2 = qword_16508;
  qword_16508 = v1;

  _objc_release_x1(v1, v2);
}

void sub_A634(id a1)
{
  CATransform3DMakeRotation(&v1, 0.471238898, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_16618 = v1;
  CATransform3DMakeRotation(&v1, 0.261799388, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_16518 = v1;
  CATransform3DMakeRotation(&v1, 0.41887902, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_16598 = v1;
}

void sub_A71C(id a1)
{
  long long v1 = *(_OWORD *)&CATransform3DIdentity.m33;
  xmmword_166E0 = *(_OWORD *)&CATransform3DIdentity.m31;
  unk_166F0 = v1;
  long long v2 = *(_OWORD *)&CATransform3DIdentity.m43;
  xmmword_16700 = *(_OWORD *)&CATransform3DIdentity.m41;
  unk_16710 = v2;
  long long v3 = *(_OWORD *)&CATransform3DIdentity.m13;
  xmmword_166A0 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)algn_166B0 = v3;
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m23;
  xmmword_166C0 = *(_OWORD *)&CATransform3DIdentity.m21;
  unk_166D0 = v4;
  CATransform3DMakeRotation(&v5, -0.104719755, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_16720 = v5;
  CATransform3DMakeRotation(&v5, -0.0174532925, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_167A0 = v5;
}

void sub_A908(uint64_t a1, void *a2)
{
  id v2 = a2;
  long long v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 setRoundingBehavior:2];
  v76[0] = &off_10EE8;
  long long v63 = xmmword_F8E0;
  long long v4 = +[NSValue valueWithBytes:&v63 objCType:"{CGSize=dd}"];
  v77[0] = v4;
  v76[1] = &off_10F00;
  long long v62 = xmmword_F8F0;
  CATransform3D v5 = +[NSValue valueWithBytes:&v62 objCType:"{CGSize=dd}"];
  v77[1] = v5;
  v76[2] = &off_10F18;
  long long v61 = xmmword_F8F0;
  id v6 = +[NSValue valueWithBytes:&v61 objCType:"{CGSize=dd}"];
  v77[2] = v6;
  v76[3] = &off_10F30;
  long long v60 = xmmword_F900;
  long long v7 = +[NSValue valueWithBytes:&v60 objCType:"{CGSize=dd}"];
  v77[3] = v7;
  v76[4] = &off_10F48;
  long long v59 = xmmword_F900;
  id v8 = +[NSValue valueWithBytes:&v59 objCType:"{CGSize=dd}"];
  v77[4] = v8;
  long long v9 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:5];
  objc_msgSend(v3, "scaledSize:withOverrides:", v9, 5.0, 12.0);
  qword_16A18 = v10;
  unk_16A20 = v11;

  v74[0] = &off_10EE8;
  long long v58 = xmmword_F910;
  uint64_t v12 = +[NSValue valueWithBytes:&v58 objCType:"{CGSize=dd}"];
  v75[0] = v12;
  v74[1] = &off_10F00;
  long long v57 = xmmword_F920;
  double v13 = +[NSValue valueWithBytes:&v57 objCType:"{CGSize=dd}"];
  v75[1] = v13;
  v74[2] = &off_10F18;
  long long v56 = xmmword_F930;
  uint64_t v14 = +[NSValue valueWithBytes:&v56 objCType:"{CGSize=dd}"];
  v75[2] = v14;
  v74[3] = &off_10F30;
  long long v55 = xmmword_F920;
  v15 = +[NSValue valueWithBytes:&v55 objCType:"{CGSize=dd}"];
  v75[3] = v15;
  v74[4] = &off_10F48;
  long long v54 = xmmword_F920;
  uint64_t v16 = +[NSValue valueWithBytes:&v54 objCType:"{CGSize=dd}"];
  v75[4] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:5];
  objc_msgSend(v3, "scaledSize:withOverrides:", v17, 2.0, 10.0);
  qword_16A28 = v18;
  qword_16A30 = v19;

  v72[0] = &off_10EE8;
  long long v53 = xmmword_F940;
  v20 = +[NSValue valueWithBytes:&v53 objCType:"{CGSize=dd}"];
  v73[0] = v20;
  v72[1] = &off_10F00;
  long long v52 = xmmword_F950;
  v21 = +[NSValue valueWithBytes:&v52 objCType:"{CGSize=dd}"];
  v73[1] = v21;
  v72[2] = &off_10F18;
  long long v51 = xmmword_F960;
  v22 = +[NSValue valueWithBytes:&v51 objCType:"{CGSize=dd}"];
  v73[2] = v22;
  v72[3] = &off_10F30;
  long long v50 = xmmword_F970;
  v23 = +[NSValue valueWithBytes:&v50 objCType:"{CGSize=dd}"];
  v73[3] = v23;
  v72[4] = &off_10F48;
  long long v49 = xmmword_F980;
  v24 = +[NSValue valueWithBytes:&v49 objCType:"{CGSize=dd}"];
  v73[4] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:5];
  objc_msgSend(v3, "scaledSize:withOverrides:", v25, 2.0, 7.0);
  qword_16A38 = v26;
  qword_16A40 = v27;

  v70[0] = &off_10EE8;
  v70[1] = &off_10F00;
  v71[0] = &off_11278;
  v71[1] = &off_11288;
  v28 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
  [v3 scaledValue:v28 withOverrides:14.0];
  qword_16828 = v29;

  v68[0] = &off_10EE8;
  v68[1] = &off_10F00;
  v69[0] = &off_11298;
  v69[1] = &off_112A8;
  v30 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
  [v3 scaledValue:v30 withOverrides:43.0];
  qword_16830 = v31;

  memset_pattern16(&unk_16958, &unk_F9A0, 0xC0uLL);
  uint64_t v32 = CLKLocaleCurrentNumberSystem();
  if (v32 != 1)
  {
    if (v32 != 2)
    {
      [v3 scaledValue:0 withOverride:10.0 forSizeClass:8.5];
      qword_16A48 = v35;
      [v3 scaledValue:3 withOverride:22.0 forSizeClass:23.0];
      qword_16A58 = v36;
      xmmword_169C8 = xmmword_F990;
      unk_169D8 = xmmword_F990;
      xmmword_169E8 = xmmword_F990;
      goto LABEL_6;
    }
    [v3 scaledValue:-1.5];
  }
  [v3 scaledValue:0 withOverride:11.0 forSizeClass:9.5];
  qword_16A48 = v33;
  [v3 scaledValue:3 withOverride:22.5 forSizeClass:23.5];
  qword_16A58 = v34;
LABEL_6:
  v66[0] = &off_10EE8;
  v66[1] = &off_10F00;
  v67[0] = &off_112B8;
  v67[1] = &off_112C8;
  v37 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
  [v3 scaledValue:v37 withOverrides:56.0];

  v64[0] = &off_10EE8;
  v64[1] = &off_10F00;
  v65[0] = &off_112D8;
  v65[1] = &off_112E8;
  v38 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
  [v3 scaledValue:v38 withOverrides:51.0];

  v39 = &unk_168A0;
  for (unint64_t i = 1; i != 13; ++i)
  {
    __sincos_stret((double)i * -3.14159265 / 6.0 + 1.57079633);
    [v2 screenScale];
    UIRoundToScale();
    uint64_t v42 = v41;
    [v2 screenScale];
    UIRoundToScale();
    *(v39 - 1) = v42;
    void *v39 = v43;
    v39 += 2;
  }
  uint64_t v44 = 0;
  v45 = &unk_16840;
  do
  {
    __sincos_stret(*(double *)&qword_FA08[v44]);
    [v2 screenScale];
    UIRoundToScale();
    uint64_t v47 = v46;
    [v2 screenScale];
    UIRoundToScale();
    *(v45 - 1) = v47;
    void *v45 = v48;
    ++v44;
    v45 += 2;
  }
  while (v44 != 3);
}

void sub_B0FC(id a1)
{
  long long v1 = +[NSNull null];
  v4[0] = @"instanceTransform";
  v4[1] = @"contentsMultiplyColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"backgroundColor";
  void v4[3] = @"transform";
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = @"hidden";
  v4[5] = @"position";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"opacity";
  v4[7] = @"instanceCount";
  v5[6] = v1;
  v5[7] = v1;
  v4[8] = @"instanceDelay";
  v5[8] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  long long v3 = (void *)qword_16A80;
  qword_16A80 = v2;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKLocaleNumberSystemPrefix()
{
  return _CLKLocaleNumberSystemPrefix();
}

uint64_t CLKRectCenteredAboutPointForDevice()
{
  return _CLKRectCenteredAboutPointForDevice();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllSmallComplicationTypes()
{
  return _NTKAllSmallComplicationTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKKeylineViewWithCircle()
{
  return _NTKKeylineViewWithCircle();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKNameForDuotones()
{
  return _NTKNameForDuotones();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKShowHardwareSpecificFaces()
{
  return _NTKShowHardwareSpecificFaces();
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_msgSend__addOrRemoveChildLayers(void *a1, const char *a2, ...)
{
  return [a1 _addOrRemoveChildLayers];
}

id objc_msgSend__applyFullSignalStrengthForSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _applyFullSignalStrengthForSnapshot];
}

id objc_msgSend__contentCenterOffset(void *a1, const char *a2, ...)
{
  return [a1 _contentCenterOffset];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__hourNumeralHideAnimation(void *a1, const char *a2, ...)
{
  return [a1 _hourNumeralHideAnimation];
}

id objc_msgSend__minuteClusterExpandAnimation(void *a1, const char *a2, ...)
{
  return [a1 _minuteClusterExpandAnimation];
}

id objc_msgSend__minuteTickShowAnimation(void *a1, const char *a2, ...)
{
  return [a1 _minuteTickShowAnimation];
}

id objc_msgSend__minuteTickShrinkAndGrow(void *a1, const char *a2, ...)
{
  return [a1 _minuteTickShrinkAndGrow];
}

id objc_msgSend__numeralShowAnimation(void *a1, const char *a2, ...)
{
  return [a1 _numeralShowAnimation];
}

id objc_msgSend__secondTickBrightenAnimation(void *a1, const char *a2, ...)
{
  return [a1 _secondTickBrightenAnimation];
}

id objc_msgSend__secondTickDimAnimation(void *a1, const char *a2, ...)
{
  return [a1 _secondTickDimAnimation];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_cleanupAfterEditing(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEditing];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationPlatter(void *a1, const char *a2, ...)
{
  return [a1 complicationPlatter];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_density(void *a1, const char *a2, ...)
{
  return [a1 density];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_faceViewComplicationFactory(void *a1, const char *a2, ...)
{
  return [a1 faceViewComplicationFactory];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hands(void *a1, const char *a2, ...)
{
  return [a1 hands];
}

id objc_msgSend_handsInlay(void *a1, const char *a2, ...)
{
  return [a1 handsInlay];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isExplorer(void *a1, const char *a2, ...)
{
  return [a1 isExplorer];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pigmentFaceDomain(void *a1, const char *a2, ...)
{
  return [a1 pigmentFaceDomain];
}

id objc_msgSend_prepareForEditing(void *a1, const char *a2, ...)
{
  return [a1 prepareForEditing];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_primaryShiftedColor(void *a1, const char *a2, ...)
{
  return [a1 primaryShiftedColor];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandInlay(void *a1, const char *a2, ...)
{
  return [a1 secondHandInlay];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_showsCanonicalContent(void *a1, const char *a2, ...)
{
  return [a1 showsCanonicalContent];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_subdialLayer(void *a1, const char *a2, ...)
{
  return [a1 subdialLayer];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}