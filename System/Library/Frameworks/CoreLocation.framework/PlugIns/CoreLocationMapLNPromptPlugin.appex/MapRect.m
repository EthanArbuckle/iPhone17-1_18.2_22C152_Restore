@interface MapRect
+ ($41299696D20B6C925B74A5D5E4D5CC87)boundingWithNormalizedRects:()vector<MKMapRect;
- ($41299696D20B6C925B74A5D5E4D5CC87)rect;
- (MapRect)initWithRectA:(id)a3 rectB:(id)a4;
@end

@implementation MapRect

+ ($41299696D20B6C925B74A5D5E4D5CC87)boundingWithNormalizedRects:()vector<MKMapRect
{
  var1 = a3->var1;
  if (var1 == a3->var0
    || (sub_100009D00((unint64_t)a3->var0, (__n128 *)var1, 126 - 2 * __clz((var1 - a3->var0) >> 5), 1),
        var0 = a3->var0,
        v6 = a3->var1,
        a3->var0 == v6))
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
LABEL_19:
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    goto LABEL_20;
  }
  double v7 = 0.0;
  double v8 = -INFINITY;
  double v9 = INFINITY;
  double v10 = 0.0;
  double v11 = NAN;
  do
  {
    double v12 = *((double *)var0 + 1);
    double v13 = v11;
    BOOL v21 = *(double *)var0 == v11;
    BOOL v14 = *(double *)var0 < v11;
    double v15 = *(double *)var0 - v11;
    if (!v14 && !v21 && v15 > v7)
    {
      double v10 = *(double *)var0;
      double v7 = v15;
    }
    double v11 = fmax(v13, *(double *)var0 + *((double *)var0 + 2));
    double v9 = fmin(v9, v12);
    double v8 = fmax(v8, v12 + *((double *)var0 + 3));
    var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var0 + 32);
  }
  while (var0 != v6);
  double v16 = v11 - NAN;
  double v17 = MKMapRectWorld.size.width;
  if (v7 <= v17 - v16) {
    double v18 = NAN;
  }
  else {
    double v18 = v10;
  }
  double x = MKMapRectNull.origin.x;
  double y = MKMapRectNull.origin.y;
  BOOL v21 = v18 == MKMapRectNull.origin.x && v9 == y;
  if (v21) {
    goto LABEL_19;
  }
  if (v7 <= v17 - v16) {
    double width = v16;
  }
  else {
    double width = v17 - v7;
  }
  double height = v8 - v9;
  double x = v18;
  double y = v9;
LABEL_20:
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (MapRect)initWithRectA:(id)a3 rectB:(id)a4
{
  double var1 = a4.var0.var1;
  double var0 = a4.var0.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  *(double *)&long long v53 = a3.var0.var0;
  *((void *)&v53 + 1) = *(void *)&a3.var0.var1;
  *(double *)&long long v54 = a3.var1.var0;
  *((void *)&v54 + 1) = *(void *)&a3.var1.var1;
  *(double *)&long long v51 = a4.var0.var0;
  *((void *)&v51 + 1) = *(void *)&a4.var0.var1;
  *(double *)&long long v52 = a4.var1.var0;
  *((void *)&v52 + 1) = *(void *)&a4.var1.var1;
  v50.receiver = self;
  v50.super_class = (Class)MapRect;
  double v8 = [(MapRect *)&v50 init];
  if (v8)
  {
    double v9 = 0;
    __p = 0;
    v48 = 0;
    v49 = 0;
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    if (v7 != MKMapRectNull.origin.x || v6 != y)
    {
      double v13 = (char *)sub_10000A9A0((uint64_t)&v49, 1uLL);
      long long v15 = v54;
      *(_OWORD *)double v13 = v53;
      *((_OWORD *)v13 + 1) = v15;
      double v9 = v13 + 32;
      __p = v13;
      v49 = &v13[32 * v14];
      v48 = v13 + 32;
      double x = MKMapRectNull.origin.x;
      double y = MKMapRectNull.origin.y;
    }
    if (var0 != x || var1 != y)
    {
      if (v9 >= v49)
      {
        v19 = (char *)__p;
        uint64_t v20 = (v9 - (unsigned char *)__p) >> 5;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 59) {
          sub_10000A8F8();
        }
        uint64_t v22 = v49 - (unsigned char *)__p;
        if ((v49 - (unsigned char *)__p) >> 4 > v21) {
          unint64_t v21 = v22 >> 4;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          v24 = (char *)sub_10000A9A0((uint64_t)&v49, v23);
          v19 = (char *)__p;
          double v9 = v48;
        }
        else
        {
          v24 = 0;
        }
        v25 = &v24[32 * v20];
        long long v26 = v52;
        v27 = &v24[32 * v23];
        *(_OWORD *)v25 = v51;
        *((_OWORD *)v25 + 1) = v26;
        double v18 = v25 + 32;
        if (v9 == v19)
        {
          v29 = v25;
        }
        else
        {
          do
          {
            long long v28 = *((_OWORD *)v9 - 1);
            v29 = v25 - 32;
            *((_OWORD *)v25 - 2) = *((_OWORD *)v9 - 2);
            *((_OWORD *)v25 - 1) = v28;
            v9 -= 32;
            v25 -= 32;
          }
          while (v9 != v19);
        }
        __p = v29;
        v48 = v18;
        v49 = v27;
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        long long v17 = v52;
        *(_OWORD *)double v9 = v51;
        *((_OWORD *)v9 + 1) = v17;
        double v18 = v9 + 32;
      }
      v48 = v18;
      double v9 = v18;
    }
    v45 = 0;
    uint64_t v46 = 0;
    v44 = 0;
    sub_10000AA0C(&v44, __p, (uint64_t)v9, (v9 - (unsigned char *)__p) >> 5);
    +[MapRect boundingWithNormalizedRects:&v44];
    double v31 = v30;
    double v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    if (v44)
    {
      v45 = v44;
      operator delete(v44);
    }
    double v38 = MKMapRectNull.origin.y;
    if (v31 == MKMapRectNull.origin.x && v33 == v38)
    {
      BOOL v40 = *((double *)&v53 + 1) == v38 && *(double *)&v53 == MKMapRectNull.origin.x;
      v41 = &v53;
      if (v40) {
        v41 = &v51;
      }
      long long v42 = v41[1];
      *(_OWORD *)(v8 + 8) = *v41;
      *(_OWORD *)(v8 + 24) = v42;
    }
    else
    {
      *((double *)v8 + 1) = v31;
      *((double *)v8 + 2) = v33;
      *((void *)v8 + 3) = v35;
      *((void *)v8 + 4) = v37;
    }
    if (__p)
    {
      v48 = (char *)__p;
      operator delete(__p);
    }
  }
  return (MapRect *)v8;
}

- ($41299696D20B6C925B74A5D5E4D5CC87)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.var1.double var1 = height;
  result.var1.double var0 = width;
  result.var0.double var1 = y;
  result.var0.double var0 = x;
  return result;
}

@end