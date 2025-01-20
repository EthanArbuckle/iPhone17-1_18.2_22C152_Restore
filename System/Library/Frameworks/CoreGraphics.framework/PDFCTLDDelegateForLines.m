@interface PDFCTLDDelegateForLines
- (PDFCTLDDelegateForLines)initWithPageLayout:(void *)a3 quadToPageTransform:(CGAffineTransform *)a4;
- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4;
@end

@implementation PDFCTLDDelegateForLines

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 boundingQuad];
  [v8 boundingBox];
  long long v9 = *(_OWORD *)&self->_quadToPageTransform.c;
  *(_OWORD *)&v60.a = *(_OWORD *)&self->_quadToPageTransform.a;
  *(_OWORD *)&v60.c = v9;
  *(_OWORD *)&v60.tdouble x = *(_OWORD *)&self->_quadToPageTransform.tx;
  CGRect v62 = CGRectApplyAffineTransform(v61, &v60);
  double x = v62.origin.x;
  double y = v62.origin.y;
  double width = v62.size.width;
  double height = v62.size.height;

  v13 = [v7 boundingQuad];
  [v13 boundingBox];
  long long v14 = *(_OWORD *)&self->_quadToPageTransform.c;
  *(_OWORD *)&v59.a = *(_OWORD *)&self->_quadToPageTransform.a;
  *(_OWORD *)&v59.c = v14;
  *(_OWORD *)&v59.tdouble x = *(_OWORD *)&self->_quadToPageTransform.tx;
  CGRect v64 = CGRectApplyAffineTransform(v63, &v59);
  double v56 = v64.origin.x;
  double v57 = v64.origin.y;
  double v15 = v64.size.width;
  double v16 = v64.size.height;

  CGFloat v17 = height;
  CGFloat v18 = y;
  double v53 = height;
  BOOL v19 = height < 0.0 || width < 0.0;
  double v20 = x;
  double v21 = width;
  if (v19)
  {
    v65.origin.double x = x;
    v65.origin.double y = y;
    v65.size.double width = width;
    v65.size.double height = height;
    *(CGRect *)&double v20 = CGRectStandardize(v65);
  }
  double v22 = v20 + v21;
  BOOL v23 = v16 < 0.0 || v15 < 0.0;
  double v54 = v15;
  double v55 = v16;
  if (v23)
  {
    v66.origin.double x = v56;
    v66.origin.double y = v57;
    v66.size.double width = v15;
    v66.size.double height = v16;
    double v24 = COERCE_DOUBLE(CGRectStandardize(v66));
    if (v22 >= v24)
    {
      v67.origin.double x = v56;
      v67.origin.double y = v57;
      v67.size.double width = v15;
      v67.size.double height = v55;
      CGRect v68 = CGRectStandardize(v67);
      double v15 = v68.size.width;
      goto LABEL_13;
    }
  }
  else
  {
    double v24 = v56;
    v68.origin.double x = v56;
    if (v22 >= v56)
    {
LABEL_13:
      double v22 = v68.origin.x + v15;
      double v24 = x;
      if (v19)
      {
        v69.origin.double x = x;
        v69.origin.double y = y;
        v69.size.double width = width;
        v69.size.double height = v17;
        *(void *)&double v24 = (unint64_t)CGRectStandardize(v69);
      }
      if (v22 >= v24) {
        goto LABEL_36;
      }
    }
  }
  layout = self->_layout;
  v26 = (double *)*((void *)layout + 57);
  v27 = (double *)*((void *)layout + 58);
  if (v27 != v26)
  {
    unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (v27 - v26);
    do
    {
      unint64_t v29 = v28 >> 1;
      v30 = &v26[3 * (v28 >> 1)];
      double v32 = *v30;
      v31 = v30 + 3;
      v28 += ~(v28 >> 1);
      if (v32 < v22) {
        v26 = v31;
      }
      else {
        unint64_t v28 = v29;
      }
    }
    while (v28);
  }
  if (v26 != v27)
  {
    int64_t v33 = 1;
    do
    {
      if (*v26 >= v24) {
        break;
      }
      double v35 = v26[1];
      double v34 = v26[2];
      if (v19)
      {
        v70.origin.double x = x;
        v70.origin.double y = y;
        v70.size.double width = width;
        v70.size.double height = v17;
        CGRect v71 = CGRectStandardize(v70);
        if (v35 > v71.origin.y + v71.size.height) {
          goto LABEL_35;
        }
        v72.origin.double x = x;
        v72.origin.double y = y;
        v72.size.double width = width;
        v72.size.double height = v17;
        CGRect v73 = CGRectStandardize(v72);
      }
      else
      {
        v73.origin.double y = y;
        if (v35 > y + v53) {
          goto LABEL_35;
        }
      }
      if (v34 >= v73.origin.y)
      {
        if (v23)
        {
          v74.origin.double x = v56;
          v74.origin.double y = v57;
          v74.size.double width = v54;
          v74.size.double height = v55;
          CGRect v75 = CGRectStandardize(v74);
          if (v35 <= v75.origin.y + v75.size.height)
          {
            v76.origin.double x = v56;
            v76.origin.double y = v57;
            v76.size.double width = v54;
            v76.size.double height = v55;
            CGRect v77 = CGRectStandardize(v76);
LABEL_34:
            if (v34 >= v77.origin.y) {
              goto LABEL_66;
            }
          }
        }
        else
        {
          v77.origin.double y = v57;
          if (v35 <= v57 + v55) {
            goto LABEL_34;
          }
        }
      }
LABEL_35:
      v26 += 3;
    }
    while (v26 != v27);
  }
LABEL_36:
  double v36 = y;
  double v37 = v53;
  if (v19)
  {
    v78.origin.double x = x;
    v78.origin.double y = y;
    v78.size.double width = width;
    v78.size.double height = v17;
    *(CGRect *)(&v36 - 1) = CGRectStandardize(v78);
  }
  double v38 = v36 + v37;
  if (v23)
  {
    v79.origin.double x = v56;
    v79.origin.double y = v57;
    v79.size.double width = v54;
    v79.size.double height = v55;
    CGRect v80 = CGRectStandardize(v79);
    double v39 = v80.origin.y;
    if (v38 >= v80.origin.y)
    {
      v81.origin.double x = v56;
      v81.origin.double y = v57;
      v81.size.double width = v54;
      v81.size.double height = v55;
      CGRect v82 = CGRectStandardize(v81);
      goto LABEL_42;
    }
  }
  else
  {
    double v39 = v57;
    v82.origin.double y = v57;
    v82.size.double height = v55;
    if (v38 >= v57)
    {
LABEL_42:
      double v38 = v82.origin.y + v82.size.height;
      if (v19)
      {
        v83.origin.double x = x;
        v83.origin.double y = y;
        v83.size.double width = width;
        v83.size.double height = v17;
        CGRect v84 = CGRectStandardize(v83);
        double y = v84.origin.y;
      }
      double v39 = y;
      if (v38 >= y) {
        goto LABEL_65;
      }
    }
  }
  v40 = self->_layout;
  v41 = (double *)*((void *)v40 + 54);
  v42 = (double *)*((void *)v40 + 55);
  if (v42 != v41)
  {
    unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * (v42 - v41);
    do
    {
      unint64_t v44 = v43 >> 1;
      v45 = &v41[3 * (v43 >> 1)];
      double v47 = *v45;
      v46 = v45 + 3;
      v43 += ~(v43 >> 1);
      if (v47 < v38) {
        v41 = v46;
      }
      else {
        unint64_t v43 = v44;
      }
    }
    while (v43);
  }
  if (v41 != v42)
  {
    int64_t v33 = 1;
    do
    {
      if (*v41 >= v39) {
        break;
      }
      double v48 = v41[1];
      double v49 = v41[2];
      if (v19)
      {
        v85.origin.double x = x;
        v85.origin.double y = v18;
        v85.size.double width = width;
        v85.size.double height = v17;
        CGRect v86 = CGRectStandardize(v85);
        if (v48 > v86.origin.x + v86.size.width) {
          goto LABEL_64;
        }
        v87.origin.double x = x;
        v87.origin.double y = v18;
        v87.size.double width = width;
        v87.size.double height = v17;
        *(void *)&double v50 = (unint64_t)CGRectStandardize(v87);
      }
      else
      {
        double v50 = x;
        if (v48 > x + width) {
          goto LABEL_64;
        }
      }
      if (v49 >= v50)
      {
        if (v23)
        {
          v88.origin.double x = v56;
          v88.origin.double y = v57;
          v88.size.double width = v54;
          v88.size.double height = v55;
          CGRect v89 = CGRectStandardize(v88);
          if (v48 <= v89.origin.x + v89.size.width)
          {
            v90.origin.double x = v56;
            v90.origin.double y = v57;
            v90.size.double width = v54;
            v90.size.double height = v55;
            *(void *)&double v51 = (unint64_t)CGRectStandardize(v90);
LABEL_63:
            if (v49 >= v51) {
              goto LABEL_66;
            }
          }
        }
        else
        {
          double v51 = v56;
          if (v48 <= v56 + v54) {
            goto LABEL_63;
          }
        }
      }
LABEL_64:
      v41 += 3;
    }
    while (v41 != v42);
  }
LABEL_65:
  int64_t v33 = 0;
LABEL_66:

  return v33;
}

- (PDFCTLDDelegateForLines)initWithPageLayout:(void *)a3 quadToPageTransform:(CGAffineTransform *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PDFCTLDDelegateForLines;
  result = [(PDFCTLDDelegateForLines *)&v9 init];
  if (result)
  {
    result->_layout = a3;
    long long v7 = *(_OWORD *)&a4->a;
    long long v8 = *(_OWORD *)&a4->tx;
    *(_OWORD *)&result->_quadToPageTransform.c = *(_OWORD *)&a4->c;
    *(_OWORD *)&result->_quadToPageTransform.tdouble x = v8;
    *(_OWORD *)&result->_quadToPageTransform.a = v7;
  }
  return result;
}

@end