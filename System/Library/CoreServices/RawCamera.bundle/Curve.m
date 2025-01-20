@interface Curve
+ (id)curve;
+ (id)curveWith:(id)a3 of:(id)a4;
+ (id)curveWithBlock:(id)a3 andInverse:(id)a4;
+ (id)curveWithBlock:(id)a3 domainMin:(double)a4 domainMax:(double)a5;
+ (id)curveWithCount:(int)a3 domainMin:(double)a4 domainMax:(double)a5 values:(double *)a6;
+ (id)curveWithCount:(int)a3 xvalues:(double *)a4 yvalues:(double *)a5;
+ (id)curveWithGamma:(double)a3;
+ (id)curveWithInverseOf:(id)a3;
- (Curve)init;
- (Curve)initWith:(id)a3 of:(id)a4;
- (Curve)initWithBlock:(id)a3 andInverse:(id)a4;
- (Curve)initWithBlock:(id)a3 domainMin:(double)a4 domainMax:(double)a5;
- (Curve)initWithCount:(int)a3 domainMin:(double)a4 domainMax:(double)a5 values:(double *)a6;
- (Curve)initWithCount:(int)a3 xvalues:(double *)a4 yvalues:(double *)a5;
- (Curve)initWithGamma:(double)a3;
- (Curve)initWithInverseOf:(id)a3;
- (double)domainMax;
- (double)domainMin;
- (double)rangeMax;
- (double)rangeMin;
- (id)function;
- (id)inverse;
- (void)setFunction:(id)a3;
- (void)setInverse:(id)a3;
@end

@implementation Curve

+ (id)curve
{
  v2 = [Curve alloc];
  v7 = objc_msgSend_init(v2, v3, v4, v5, v6);

  return v7;
}

- (Curve)init
{
  v10.receiver = self;
  v10.super_class = (Class)Curve;
  v2 = [(Curve *)&v10 init];
  objc_msgSend_setFunction_(v2, v3, (uint64_t)&unk_1F397B870, v4, v5);
  objc_msgSend_setInverse_(v2, v6, (uint64_t)&unk_1F397B890, v7, v8);
  *(_OWORD *)(v2 + 24) = xmmword_1DDBFEAB0;
  *(_OWORD *)(v2 + 40) = xmmword_1DDBFEAB0;
  return (Curve *)v2;
}

+ (id)curveWithGamma:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v7 = [Curve alloc];
    uint64_t v4 = objc_msgSend_initWithGamma_(v7, v8, v9, v10, v11, a3);
  }
  return v4;
}

- (Curve)initWithGamma:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)Curve;
    self = [(Curve *)&v14 init];
    uint64_t v3 = self;
    if (self)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1DDB45B64;
      v13[3] = &unk_1E6D05558;
      *(double *)&v13[4] = a3;
      objc_msgSend_setFunction_(self, v5, (uint64_t)v13, v6, v7);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = sub_1DDB45BA0;
      v12[3] = &unk_1E6D05558;
      *(double *)&v12[4] = a3;
      objc_msgSend_setInverse_(v3, v8, (uint64_t)v12, v9, v10);
      self = v3;
      uint64_t v3 = self;
    }
  }

  return v3;
}

+ (id)curveWithInverseOf:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [Curve alloc];
    uint64_t v8 = objc_msgSend_initWithInverseOf_(v4, v5, (uint64_t)v3, v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (Curve)initWithInverseOf:(id)a3
{
  id v4 = a3;
  if (v4
    && (v38.receiver = self, v38.super_class = (Class)Curve, (self = [(Curve *)&v38 init]) != 0))
  {
    objc_msgSend_rangeMin(v4, v5, v6, v7, v8);
    self->_domainMin = v9;
    objc_msgSend_rangeMax(v4, v10, v11, v12, v13);
    self->_domainMax = v14;
    objc_msgSend_domainMin(v4, v15, v16, v17, v18);
    self->_rangeMin = v19;
    objc_msgSend_domainMax(v4, v20, v21, v22, v23);
    self->_rangeMax = v24;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1DDB45DB4;
    v36[3] = &unk_1E6D05580;
    id v25 = v4;
    id v37 = v25;
    objc_msgSend_setFunction_(self, v26, (uint64_t)v36, v27, v28);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1DDB45E08;
    v34[3] = &unk_1E6D05580;
    id v35 = v25;
    objc_msgSend_setInverse_(self, v29, (uint64_t)v34, v30, v31);
    self = self;

    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)curveWith:(id)a3 of:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [Curve alloc];
    id v4 = objc_msgSend_initWith_of_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);
  }

  return v4;
}

- (Curve)initWith:(id)a3 of:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  double v9 = 0;
  if (v6 && v7)
  {
    v45.receiver = self;
    v45.super_class = (Class)Curve;
    self = [(Curve *)&v45 init];
    if (self)
    {
      objc_msgSend_domainMin(v8, v10, v11, v12, v13);
      self->_domainMin = v14;
      objc_msgSend_domainMax(v8, v15, v16, v17, v18);
      self->_domainMax = v19;
      objc_msgSend_rangeMin(v6, v20, v21, v22, v23);
      self->_rangeMin = v24;
      objc_msgSend_rangeMax(v6, v25, v26, v27, v28);
      self->_rangeMax = v29;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = sub_1DDB4608C;
      v42[3] = &unk_1E6D055A8;
      id v30 = v6;
      id v43 = v30;
      id v31 = v8;
      id v44 = v31;
      objc_msgSend_setFunction_(self, v32, (uint64_t)v42, v33, v34);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = sub_1DDB46108;
      v39[3] = &unk_1E6D055A8;
      id v40 = v31;
      id v41 = v30;
      objc_msgSend_setInverse_(self, v35, (uint64_t)v39, v36, v37);
      self = self;

      double v9 = self;
    }
    else
    {
      double v9 = 0;
    }
  }

  return v9;
}

+ (id)curveWithBlock:(id)a3 andInverse:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [Curve alloc];
    id v4 = objc_msgSend_initWithBlock_andInverse_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);
  }

  return v4;
}

- (Curve)initWithBlock:(id)a3 andInverse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  double v9 = 0;
  if (v6 && v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)Curve;
    uint64_t v10 = [(Curve *)&v18 init];
    self = v10;
    if (v10)
    {
      objc_msgSend_setFunction_(v10, v11, (uint64_t)v6, v12, v13);
      objc_msgSend_setInverse_(self, v14, (uint64_t)v8, v15, v16);
      self = self;
      double v9 = self;
    }
    else
    {
      double v9 = 0;
    }
  }

  return v9;
}

+ (id)curveWithBlock:(id)a3 domainMin:(double)a4 domainMax:(double)a5
{
  id v7 = a3;
  uint64_t v8 = 0;
  if (v7)
  {
    if (fabs(a4) != INFINITY)
    {
      uint64_t v8 = 0;
      if (a5 > a4 && fabs(a5) != INFINITY)
      {
        double v9 = [Curve alloc];
        uint64_t v8 = objc_msgSend_initWithBlock_domainMin_domainMax_(v9, v10, (uint64_t)v7, v11, v12, a4, a5);
      }
    }
  }

  return v8;
}

- (Curve)initWithBlock:(id)a3 domainMin:(double)a4 domainMax:(double)a5
{
  id v8 = a3;
  double v9 = 0;
  if (v8 && fabs(a4) != INFINITY && fabs(a5) != INFINITY)
  {
    v19.receiver = self;
    v19.super_class = (Class)Curve;
    uint64_t v10 = [(Curve *)&v19 init];
    self = (Curve *)v10;
    if (v10)
    {
      *((double *)v10 + 3) = a4;
      *((double *)v10 + 4) = a5;
      *(_OWORD *)(v10 + 40) = xmmword_1DDBFEAB0;
      objc_msgSend_setFunction_(v10, v11, (uint64_t)v8, v12, v13);
      double v14 = sub_1DDB46464(v8, a4, a5);
      objc_msgSend_setInverse_(self, v15, (uint64_t)v14, v16, v17);

      self = self;
      double v9 = self;
    }
    else
    {
      double v9 = 0;
    }
  }

  return v9;
}

+ (id)curveWithCount:(int)a3 domainMin:(double)a4 domainMax:(double)a5 values:(double *)a6
{
  id v8 = 0;
  if (fabs(a4) != INFINITY)
  {
    uint64_t v9 = *(void *)&a3;
    if (a3 >= 2)
    {
      if (a6)
      {
        id v8 = 0;
        if (a5 > a4 && fabs(a5) != INFINITY)
        {
          uint64_t v11 = [Curve alloc];
          id v8 = objc_msgSend_initWithCount_domainMin_domainMax_values_(v11, v12, v9, (uint64_t)a6, v13, a4, a5);
        }
      }
    }
  }

  return v8;
}

- (Curve)initWithCount:(int)a3 domainMin:(double)a4 domainMax:(double)a5 values:(double *)a6
{
  id v8 = self;
  uint64_t v9 = 0;
  if (fabs(a4) != INFINITY && a3 >= 2)
  {
    if (a6)
    {
      uint64_t v9 = 0;
      if (a5 > a4 && fabs(a5) != INFINITY)
      {
        v72.receiver = self;
        v72.super_class = (Class)Curve;
        id v8 = [(Curve *)&v72 init];
        if (v8)
        {
          int v15 = 0;
          int v16 = a3 - 1;
          double v17 = *a6;
          uint64_t v18 = 1;
          uint64_t v19 = a3;
          do
          {
            double v20 = a6[v18];
            if (v20 >= v17) {
              int v21 = 4;
            }
            else {
              int v21 = 2;
            }
            if (v20 > v17) {
              int v21 = 1;
            }
            v15 |= v21;
            ++v18;
            double v17 = v20;
          }
          while (a3 != v18);
          uint64_t v22 = 8 * a3;
          objc_msgSend_dataWithCapacity_(MEMORY[0x1E4F1CA58], v12, v22, v13, v14, v20);
          id v23 = objc_claimAutoreleasedReturnValue();
          uint64_t v28 = objc_msgSend_mutableBytes(v23, v24, v25, v26, v27);
          unint64_t v29 = 0;
          do
          {
            *(double *)(v28 + v29) = a6[v29 / 8];
            v29 += 8;
          }
          while (v22 != v29);
          v8->_domainMin = a4;
          v8->_domainMax = a5;
          double v31 = *a6;
          id v30 = a6 + 1;
          double v32 = v31;
          v8->_rangeMin = v31;
          v8->_rangeMax = v31;
          uint64_t v33 = v19 - 1;
          double v34 = v31;
          do
          {
            double v35 = *v30;
            if (v34 <= *v30)
            {
              double v36 = *v30;
            }
            else
            {
              v8->_rangeMin = v35;
              double v36 = *v30;
              double v34 = v35;
            }
            if (v32 < v36)
            {
              v8->_rangeMax = v36;
              double v32 = v36;
            }
            ++v30;
            --v33;
          }
          while (v33);
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = sub_1DDB468FC;
          v67[3] = &unk_1E6D055D0;
          id v37 = v23;
          id v68 = v37;
          double v69 = a4;
          double v70 = a5;
          int v71 = v16;
          objc_msgSend_setFunction_(v8, v38, (uint64_t)v67, v39, v40);
          if (v15 == 1)
          {
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = sub_1DDB46994;
            v62[3] = &unk_1E6D055D0;
            id v63 = v37;
            int v66 = v16;
            double v64 = a4;
            double v65 = a5;
            objc_msgSend_setInverse_(v8, v49, (uint64_t)v62, v50, v51);
            v48 = v63;
          }
          else if (v15 == 2)
          {
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = sub_1DDB46A2C;
            v57[3] = &unk_1E6D055D0;
            id v58 = v37;
            int v61 = v16;
            double v59 = a4;
            double v60 = a5;
            objc_msgSend_setInverse_(v8, v45, (uint64_t)v57, v46, v47);
            v48 = v58;
          }
          else
          {
            v48 = objc_msgSend_function(v8, v41, v42, v43, v44);
            v52 = sub_1DDB46464(v48, a4, a5);
            objc_msgSend_setInverse_(v8, v53, (uint64_t)v52, v54, v55);
          }
          id v8 = v8;

          uint64_t v9 = v8;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
    }
  }

  return v9;
}

+ (id)curveWithCount:(int)a3 xvalues:(double *)a4 yvalues:(double *)a5
{
  uint64_t v7 = *(void *)&a3;
  id v8 = [Curve alloc];
  uint64_t v10 = objc_msgSend_initWithCount_xvalues_yvalues_(v8, v9, v7, (uint64_t)a4, (uint64_t)a5);

  return v10;
}

- (Curve)initWithCount:(int)a3 xvalues:(double *)a4 yvalues:(double *)a5
{
  id v6 = 0;
  if (a3 >= 2 && a4 && a5)
  {
    uint64_t v8 = *(void *)&a3;
    uint64_t v9 = objc_msgSend_curveWithCount_domainMin_domainMax_values_(Curve, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, 0.0, 1.0);
    uint64_t v13 = objc_msgSend_curveWithInverseOf_(Curve, v10, (uint64_t)v9, v11, v12);
    int v16 = objc_msgSend_curveWithCount_domainMin_domainMax_values_(Curve, v14, v8, (uint64_t)a5, v15, 0.0, 1.0);
    objc_msgSend_curveWith_of_(Curve, v17, (uint64_t)v13, (uint64_t)v16, v18);
    id v6 = (Curve *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)function
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFunction:(id)a3
{
}

- (id)inverse
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInverse:(id)a3
{
}

- (double)domainMin
{
  return self->_domainMin;
}

- (double)domainMax
{
  return self->_domainMax;
}

- (double)rangeMin
{
  return self->_rangeMin;
}

- (double)rangeMax
{
  return self->_rangeMax;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inverse, 0);

  objc_storeStrong(&self->_function, 0);
}

@end