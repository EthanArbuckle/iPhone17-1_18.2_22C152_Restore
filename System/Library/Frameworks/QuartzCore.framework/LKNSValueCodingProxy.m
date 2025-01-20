@interface LKNSValueCodingProxy
+ (BOOL)supportsSecureCoding;
- (LKNSValueCodingProxy)initWithCoder:(id)a3;
- (LKNSValueCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LKNSValueCodingProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)decodedObject
{
  v2 = 0;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  switch(self->_kind)
  {
    case 0:
      double x = self->_u.point.x;
      double y = self->_u.point.y;
      v5 = (void *)MEMORY[0x1E4F29238];
      return (id)objc_msgSend(v5, "valueWithPoint:", x, y);
    case 1:
      double v7 = self->_u.point.x;
      double v8 = self->_u.point.y;
      v9 = (void *)MEMORY[0x1E4F29238];
      return (id)objc_msgSend(v9, "valueWithSize:", v7, v8);
    case 2:
      double v10 = self->_u.point.x;
      double v11 = self->_u.point.y;
      double width = self->_u.rect.size.width;
      double height = self->_u.rect.size.height;
      v14 = (void *)MEMORY[0x1E4F29238];
      return (id)objc_msgSend(v14, "valueWithRect:", v10, v11, width, height);
    case 3:
      long long v15 = *((_OWORD *)&self->_u.affine_transform + 5);
      v32[4] = *((_OWORD *)&self->_u.affine_transform + 4);
      v32[5] = v15;
      long long v16 = *((_OWORD *)&self->_u.affine_transform + 7);
      v32[6] = *((_OWORD *)&self->_u.affine_transform + 6);
      v32[7] = v16;
      long long v17 = *(_OWORD *)&self->_u.affine_transform.c;
      v32[0] = self->_u.point;
      v32[1] = v17;
      long long v18 = *((_OWORD *)&self->_u.affine_transform + 3);
      v32[2] = *(_OWORD *)&self->_u.affine_transform.tx;
      v32[3] = v18;
      uint64_t v19 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v32];
      goto LABEL_20;
    case 8:
      double v20 = self->_u.point.x;
      double v21 = self->_u.point.y;
      double v22 = self->_u.rect.size.width;
      v23 = (void *)MEMORY[0x1E4F29238];
      return (id)objc_msgSend(v23, "valueWithCAPoint3D:", v20, v21, v22);
    case 9:
      long long v24 = *((_OWORD *)&self->_u.affine_transform + 3);
      v30[2] = *(_OWORD *)&self->_u.affine_transform.tx;
      v30[3] = v24;
      v30[4] = *((_OWORD *)&self->_u.affine_transform + 4);
      long long v25 = *(_OWORD *)&self->_u.affine_transform.c;
      v30[0] = self->_u.point;
      v30[1] = v25;
      uint64_t v19 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v30];
      goto LABEL_20;
    case 0xA:
      p_u = &self->_u;
      v27 = (void *)MEMORY[0x1E4F29238];
      return (id)[v27 valueWithBytes:p_u objCType:"{CGAffineTransform=dddddd}"];
    case 0xB:
      long long v28 = *(_OWORD *)&self->_u.affine_transform.c;
      v31[0] = self->_u.point;
      v31[1] = v28;
      long long v29 = *((_OWORD *)&self->_u.affine_transform + 3);
      v31[2] = *(_OWORD *)&self->_u.affine_transform.tx;
      v31[3] = v29;
      uint64_t v19 = [MEMORY[0x1E4F29238] valueWithCACornerRadii:v31];
LABEL_20:
      v2 = (void *)v19;
      break;
    default:
      return v2;
  }
  return v2;
}

- (LKNSValueCodingProxy)initWithCoder:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v80.receiver = self;
  v80.super_class = (Class)LKNSValueCodingProxy;
  v4 = [(LKNSValueCodingProxy *)&v80 init];
  if (v4)
  {
    int v5 = [a3 decodeIntForKey:@"kind"];
    v4->_kind = v5;
    switch(v5)
    {
      case 0:
        [a3 decodeFloatForKey:@"x"];
        p_u = &v4->_u;
        v4->_u.point.double x = v6;
        double v8 = @"y";
        goto LABEL_5;
      case 1:
        [a3 decodeFloatForKey:@"width"];
        p_u = &v4->_u;
        v4->_u.point.double x = v9;
        double v8 = @"height";
LABEL_5:
        [a3 decodeFloatForKey:v8];
        p_u->point.double y = v10;
        return v4;
      case 2:
        [a3 decodeFloatForKey:@"x"];
        v4->_u.point.double x = v11;
        [a3 decodeFloatForKey:@"y"];
        v4->_u.point.double y = v12;
        [a3 decodeFloatForKey:@"width"];
        v4->_u.rect.size.double width = v13;
        [a3 decodeFloatForKey:@"height"];
        v4->_u.rect.size.double height = v14;
        return v4;
      case 3:
        if ([a3 containsValueForKey:@"m11"])
        {
          [a3 decodeFloatForKey:@"m11"];
          v4->_u.point.double x = v15;
          [a3 decodeFloatForKey:@"m12"];
          v4->_u.point.double y = v16;
          [a3 decodeFloatForKey:@"m13"];
          v4->_u.rect.size.double width = v17;
          [a3 decodeFloatForKey:@"m14"];
          v4->_u.rect.size.double height = v18;
          [a3 decodeFloatForKey:@"m21"];
          v4->_u.transform.m21 = v19;
          [a3 decodeFloatForKey:@"m22"];
          v4->_u.transform.m22 = v20;
          [a3 decodeFloatForKey:@"m23"];
          v4->_u.transform.m23 = v21;
          [a3 decodeFloatForKey:@"m24"];
          v4->_u.transform.m24 = v22;
          [a3 decodeFloatForKey:@"m31"];
          v4->_u.transform.m31 = v23;
          [a3 decodeFloatForKey:@"m32"];
          v4->_u.transform.m32 = v24;
          [a3 decodeFloatForKey:@"m33"];
          v4->_u.transform.m33 = v25;
          [a3 decodeFloatForKey:@"m34"];
          v4->_u.transform.m34 = v26;
          [a3 decodeFloatForKey:@"m41"];
          v4->_u.transform.m41 = v27;
          [a3 decodeFloatForKey:@"m42"];
          v4->_u.transform.m42 = v28;
          [a3 decodeFloatForKey:@"m43"];
          v4->_u.transform.m43 = v29;
          [a3 decodeFloatForKey:@"m44"];
          v4->_u.transform.m44 = v30;
        }
        else
        {
          v4->_u.transform = CATransform3DIdentity;
        }
        return v4;
      case 5:
        [a3 decodeDoubleForKey:@"x"];
        v4->_u.point.double x = v31;
        [a3 decodeDoubleForKey:@"y"];
        v4->_u.point.double y = v32;
        v4->_kind = 0;
        return v4;
      case 6:
        [a3 decodeDoubleForKey:@"width"];
        v4->_u.point.double x = v33;
        [a3 decodeDoubleForKey:@"height"];
        v4->_u.point.double y = v34;
        int v35 = 1;
        goto LABEL_12;
      case 7:
        [a3 decodeDoubleForKey:@"x"];
        v4->_u.point.double x = v36;
        [a3 decodeDoubleForKey:@"y"];
        v4->_u.point.double y = v37;
        [a3 decodeDoubleForKey:@"width"];
        v4->_u.rect.size.double width = v38;
        [a3 decodeDoubleForKey:@"height"];
        v4->_u.rect.size.double height = v39;
        int v35 = 2;
LABEL_12:
        v4->_kind = v35;
        break;
      case 8:
        [a3 decodeFloatForKey:@"x"];
        v4->_u.point.double x = v40;
        [a3 decodeFloatForKey:@"y"];
        v4->_u.point.double y = v41;
        [a3 decodeFloatForKey:@"z"];
        v4->_u.rect.size.double width = v42;
        break;
      case 9:
        [a3 decodeFloatForKey:@"m11"];
        v4->_u.color_matrix.m11 = v43;
        [a3 decodeFloatForKey:@"m12"];
        v4->_u.color_matrix.m12 = v44;
        [a3 decodeFloatForKey:@"m13"];
        v4->_u.color_matrix.m13 = v45;
        [a3 decodeFloatForKey:@"m14"];
        v4->_u.color_matrix.m14 = v46;
        [a3 decodeFloatForKey:@"m15"];
        v4->_u.color_matrix.m15 = v47;
        [a3 decodeFloatForKey:@"m21"];
        v4->_u.color_matrix.m21 = v48;
        [a3 decodeFloatForKey:@"m22"];
        v4->_u.color_matrix.m22 = v49;
        [a3 decodeFloatForKey:@"m23"];
        v4->_u.color_matrix.m23 = v50;
        [a3 decodeFloatForKey:@"m24"];
        v4->_u.color_matrix.m24 = v51;
        [a3 decodeFloatForKey:@"m25"];
        v4->_u.color_matrix.m25 = v52;
        [a3 decodeFloatForKey:@"m31"];
        v4->_u.color_matrix.m31 = v53;
        [a3 decodeFloatForKey:@"m32"];
        v4->_u.color_matrix.m32 = v54;
        [a3 decodeFloatForKey:@"m33"];
        v4->_u.color_matrix.m33 = v55;
        [a3 decodeFloatForKey:@"m34"];
        v4->_u.color_matrix.m34 = v56;
        [a3 decodeFloatForKey:@"m35"];
        v4->_u.color_matrix.m35 = v57;
        [a3 decodeFloatForKey:@"m41"];
        v4->_u.color_matrix.m41 = v58;
        [a3 decodeFloatForKey:@"m42"];
        v4->_u.color_matrix.m42 = v59;
        [a3 decodeFloatForKey:@"m43"];
        v4->_u.color_matrix.m43 = v60;
        [a3 decodeFloatForKey:@"m44"];
        v4->_u.color_matrix.m44 = v61;
        [a3 decodeFloatForKey:@"m45"];
        v4->_u.color_matrix.m45 = v62;
        break;
      case 10:
        if ([a3 containsValueForKey:@"a"])
        {
          [a3 decodeFloatForKey:@"a"];
          v4->_u.point.double x = v63;
          [a3 decodeFloatForKey:@"b"];
          v4->_u.point.double y = v64;
          [a3 decodeFloatForKey:@"c"];
          v4->_u.rect.size.double width = v65;
          [a3 decodeFloatForKey:@"d"];
          v4->_u.rect.size.double height = v66;
          [a3 decodeFloatForKey:@"tx"];
          v4->_u.transform.m21 = v67;
          [a3 decodeFloatForKey:@"ty"];
          v4->_u.transform.m22 = v68;
        }
        else
        {
          long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          long long v77 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          v4->_u.point = (CGPoint)*MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v4->_u.affine_transform.c = v78;
          *(_OWORD *)&v4->_u.affine_transform.tdouble x = v77;
        }
        break;
      case 11:
        [a3 decodeFloatForKey:@"min_max_w"];
        v4->_u.point.double x = v69;
        [a3 decodeFloatForKey:@"min_max_h"];
        v4->_u.point.double y = v70;
        [a3 decodeFloatForKey:@"max_max_w"];
        v4->_u.rect.size.double width = v71;
        [a3 decodeFloatForKey:@"max_max_h"];
        v4->_u.rect.size.double height = v72;
        [a3 decodeFloatForKey:@"max_min_w"];
        v4->_u.transform.m21 = v73;
        [a3 decodeFloatForKey:@"max_min_h"];
        v4->_u.transform.m22 = v74;
        [a3 decodeFloatForKey:@"min_min_w"];
        v4->_u.transform.m23 = v75;
        [a3 decodeFloatForKey:@"min_min_h"];
        v4->_u.transform.m24 = v76;
        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  [a3 encodeInt:self->_kind forKey:@"kind"];
  switch(self->_kind)
  {
    case 0:
      p_u = &self->_u;
      double x = p_u->point.x;
      *(float *)&double x = p_u->point.x;
      [a3 encodeFloat:@"x" forKey:x];
      double y = p_u->point.y;
      *(float *)&double y = y;
      float v9 = @"y";
      goto LABEL_14;
    case 1:
      float v10 = &self->_u;
      double v11 = v10->point.x;
      *(float *)&double v11 = v10->point.x;
      [a3 encodeFloat:@"width" forKey:v11];
      double y = v10->point.y;
      goto LABEL_5;
    case 2:
      float v12 = &self->_u;
      double v13 = v12->point.x;
      *(float *)&double v13 = v12->point.x;
      [a3 encodeFloat:@"x" forKey:v13];
      double v14 = v12->point.y;
      *(float *)&double v14 = v14;
      [a3 encodeFloat:@"y" forKey:v14];
      double width = v12->rect.size.width;
      *(float *)&double width = width;
      [a3 encodeFloat:@"width" forKey:width];
      double y = v12->rect.size.height;
LABEL_5:
      *(float *)&double y = y;
      float v9 = @"height";
      goto LABEL_14;
    case 3:
      float v16 = &self->_u;
      double v17 = v16->point.x;
      if (v16->point.x != 1.0) {
        goto LABEL_7;
      }
      uint64_t v70 = 1;
      break;
    case 8:
      CGFloat v32 = &self->_u;
      double v33 = v32->point.x;
      *(float *)&double v33 = v32->point.x;
      [a3 encodeFloat:@"x" forKey:v33];
      double v34 = v32->point.y;
      *(float *)&double v34 = v34;
      [a3 encodeFloat:@"y" forKey:v34];
      double y = v32->rect.size.width;
      *(float *)&double y = y;
      float v9 = @"z";
      goto LABEL_14;
    case 9:
      int v35 = &self->_u;
      *(float *)&double v5 = v35->color_matrix.m11;
      [a3 encodeFloat:@"m11" forKey:v5];
      *(float *)&double v36 = v35->color_matrix.m12;
      [a3 encodeFloat:@"m12" forKey:v36];
      *(float *)&double v37 = v35->color_matrix.m13;
      [a3 encodeFloat:@"m13" forKey:v37];
      *(float *)&double v38 = v35->color_matrix.m14;
      [a3 encodeFloat:@"m14" forKey:v38];
      *(float *)&double v39 = v35->color_matrix.m15;
      [a3 encodeFloat:@"m15" forKey:v39];
      *(float *)&double v40 = v35->color_matrix.m21;
      [a3 encodeFloat:@"m21" forKey:v40];
      *(float *)&double v41 = v35->color_matrix.m22;
      [a3 encodeFloat:@"m22" forKey:v41];
      *(float *)&double v42 = v35->color_matrix.m23;
      [a3 encodeFloat:@"m23" forKey:v42];
      *(float *)&double v43 = v35->color_matrix.m24;
      [a3 encodeFloat:@"m24" forKey:v43];
      *(float *)&double v44 = v35->color_matrix.m25;
      [a3 encodeFloat:@"m25" forKey:v44];
      *(float *)&double v45 = v35->color_matrix.m31;
      [a3 encodeFloat:@"m31" forKey:v45];
      *(float *)&double v46 = v35->color_matrix.m32;
      [a3 encodeFloat:@"m32" forKey:v46];
      *(float *)&double v47 = v35->color_matrix.m33;
      [a3 encodeFloat:@"m33" forKey:v47];
      *(float *)&double v48 = v35->color_matrix.m34;
      [a3 encodeFloat:@"m34" forKey:v48];
      *(float *)&double v49 = v35->color_matrix.m35;
      [a3 encodeFloat:@"m35" forKey:v49];
      *(float *)&double v50 = v35->color_matrix.m41;
      [a3 encodeFloat:@"m41" forKey:v50];
      *(float *)&double v51 = v35->color_matrix.m42;
      [a3 encodeFloat:@"m42" forKey:v51];
      *(float *)&double v52 = v35->color_matrix.m43;
      [a3 encodeFloat:@"m43" forKey:v52];
      *(float *)&double v53 = v35->color_matrix.m44;
      [a3 encodeFloat:@"m44" forKey:v53];
      *(float *)&double y = v35->color_matrix.m45;
      float v9 = @"m45";
      goto LABEL_14;
    case 0xA:
      float v54 = &self->_u;
      long long v55 = *(_OWORD *)&v54->affine_transform.c;
      *(CGPoint *)&v74.a = v54->point;
      *(_OWORD *)&v74.c = v55;
      *(_OWORD *)&v74.tdouble x = *(_OWORD *)&v54->affine_transform.tx;
      if (!CGAffineTransformIsIdentity(&v74))
      {
        double v56 = v54->point.x;
        *(float *)&double v56 = v54->point.x;
        [a3 encodeFloat:@"a" forKey:v56];
        double v57 = v54->point.y;
        *(float *)&double v57 = v57;
        [a3 encodeFloat:@"b" forKey:v57];
        double v58 = v54->rect.size.width;
        *(float *)&double v58 = v58;
        [a3 encodeFloat:@"c" forKey:v58];
        double height = v54->rect.size.height;
        *(float *)&double height = height;
        [a3 encodeFloat:@"d" forKey:height];
        double m21 = v54->transform.m21;
        *(float *)&double m21 = m21;
        [a3 encodeFloat:@"tx" forKey:m21];
        double m22 = v54->transform.m22;
        *(float *)&double m22 = m22;
        [a3 encodeFloat:@"ty" forKey:m22];
      }
      return;
    case 0xB:
      float v62 = &self->_u;
      double v63 = v62->point.x;
      *(float *)&double v63 = v62->point.x;
      [a3 encodeFloat:@"min_max_w" forKey:v63];
      double v64 = v62->point.y;
      *(float *)&double v64 = v64;
      [a3 encodeFloat:@"min_max_h" forKey:v64];
      double v65 = v62->rect.size.width;
      *(float *)&double v65 = v65;
      [a3 encodeFloat:@"max_max_w" forKey:v65];
      double v66 = v62->rect.size.height;
      *(float *)&double v66 = v66;
      [a3 encodeFloat:@"max_max_h" forKey:v66];
      double v67 = v62->transform.m21;
      *(float *)&double v67 = v67;
      [a3 encodeFloat:@"max_min_w" forKey:v67];
      double v68 = v62->transform.m22;
      *(float *)&double v68 = v68;
      [a3 encodeFloat:@"max_min_h" forKey:v68];
      double m23 = v62->transform.m23;
      *(float *)&double m23 = m23;
      [a3 encodeFloat:@"min_min_w" forKey:m23];
      double y = v62->transform.m24;
      *(float *)&double y = y;
      float v9 = @"min_min_h";
      goto LABEL_14;
    default:
      return;
  }
  while (v70 != 16)
  {
    uint64_t v71 = v70;
    double v72 = *(&v16->point.x + v70);
    double v73 = *(&CATransform3DIdentity.m11 + v70++);
    if (v72 != v73)
    {
      if ((unint64_t)(v71 - 1) <= 0xE)
      {
LABEL_7:
        *(float *)&double v17 = v17;
        [a3 encodeFloat:@"m11" forKey:v17];
        double v18 = v16->point.y;
        *(float *)&double v18 = v18;
        [a3 encodeFloat:@"m12" forKey:v18];
        double v19 = v16->rect.size.width;
        *(float *)&double v19 = v19;
        [a3 encodeFloat:@"m13" forKey:v19];
        double v20 = v16->rect.size.height;
        *(float *)&double v20 = v20;
        [a3 encodeFloat:@"m14" forKey:v20];
        double v21 = v16->transform.m21;
        *(float *)&double v21 = v21;
        [a3 encodeFloat:@"m21" forKey:v21];
        double v22 = v16->transform.m22;
        *(float *)&double v22 = v22;
        [a3 encodeFloat:@"m22" forKey:v22];
        double v23 = v16->transform.m23;
        *(float *)&double v23 = v23;
        [a3 encodeFloat:@"m23" forKey:v23];
        double m24 = v16->transform.m24;
        *(float *)&double m24 = m24;
        [a3 encodeFloat:@"m24" forKey:m24];
        double m31 = v16->transform.m31;
        *(float *)&double m31 = m31;
        [a3 encodeFloat:@"m31" forKey:m31];
        double m32 = v16->transform.m32;
        *(float *)&double m32 = m32;
        [a3 encodeFloat:@"m32" forKey:m32];
        double m33 = v16->transform.m33;
        *(float *)&double m33 = m33;
        [a3 encodeFloat:@"m33" forKey:m33];
        double m34 = v16->transform.m34;
        *(float *)&double m34 = m34;
        [a3 encodeFloat:@"m34" forKey:m34];
        double m41 = v16->transform.m41;
        *(float *)&double m41 = m41;
        [a3 encodeFloat:@"m41" forKey:m41];
        double m42 = v16->transform.m42;
        *(float *)&double m42 = m42;
        [a3 encodeFloat:@"m42" forKey:m42];
        double m43 = v16->transform.m43;
        *(float *)&double m43 = m43;
        [a3 encodeFloat:@"m43" forKey:m43];
        double y = v16->transform.m44;
        *(float *)&double y = y;
        float v9 = @"m44";
LABEL_14:
        [a3 encodeFloat:v9 forKey:y];
      }
      return;
    }
  }
}

- (LKNSValueCodingProxy)initWithObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)LKNSValueCodingProxy;
  v4 = [(LKNSValueCodingProxy *)&v27 init];
  if (!v4) {
    return v4;
  }
  double v5 = (const char *)[a3 objCType];
  float v6 = v5;
  if (!v5)
  {
    if (strcmp(0, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      p_kind = &v4->_kind;
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  if (!strcmp(v5, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    v4->_kind = 2;
    [a3 rectValue];
    v4->_u.point.double x = v9;
    v4->_u.point.double y = v10;
    v4->_u.rect.size.double width = v11;
    v4->_u.rect.size.double height = v12;
    return v4;
  }
  if (!strcmp(v6, "{CGPoint=dd}"))
  {
    v4->_kind = 0;
    [a3 pointValue];
LABEL_21:
    v4->_u.point.double x = v13;
    v4->_u.point.double y = v14;
    return v4;
  }
  if (!strcmp(v6, "{CGSize=dd}"))
  {
    v4->_kind = 1;
    [a3 sizeValue];
    goto LABEL_21;
  }
  if (!strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
  {
    v4->_kind = 3;
    if (a3)
    {
      [a3 CATransform3DValue];
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      CGPoint v19 = (CGPoint)0;
      long long v20 = 0u;
    }
    *(_OWORD *)&v4->_u.affine_transform.tdouble x = v21;
    *((_OWORD *)&v4->_u.affine_transform + 3) = v22;
    v4->_u.point = v19;
    *(_OWORD *)&v4->_u.affine_transform.c = v20;
    *((_OWORD *)&v4->_u.affine_transform + 6) = v25;
    *((_OWORD *)&v4->_u.affine_transform + 7) = v26;
    *((_OWORD *)&v4->_u.affine_transform + 4) = v23;
    *((_OWORD *)&v4->_u.affine_transform + 5) = v24;
  }
  else
  {
    if (!strcmp(v6, "{CAPoint3D=ddd}"))
    {
      v4->_kind = 8;
      [a3 CAPoint3DValue];
      v4->_u.point.double x = v15;
      v4->_u.point.double y = v16;
      v4->_u.rect.size.double width = v17;
      return v4;
    }
    if (strcmp(v6, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
    {
      if (strcmp(v6, "{CAColorMatrix=ffffffffffffffffffff}"))
      {
        int v7 = strcmp(v6, "{CGAffineTransform=dddddd}");
        p_kind = &v4->_kind;
        if (!v7)
        {
          int *p_kind = 10;
          if (a3)
          {
            objc_msgSend(a3, "CA_CGAffineTransformValue");
          }
          else
          {
            long long v20 = 0u;
            long long v21 = 0u;
            CGPoint v19 = (CGPoint)0;
          }
          v4->_u.point = v19;
          *(_OWORD *)&v4->_u.affine_transform.c = v20;
          *(_OWORD *)&v4->_u.affine_transform.tdouble x = v21;
          return v4;
        }
LABEL_15:
        int *p_kind = 4;
        NSLog(&cfstr_CoreanimationU.isa, v6);
        return v4;
      }
LABEL_17:
      v4->_kind = 9;
      if (a3)
      {
        [a3 CAColorMatrixValue];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        CGPoint v19 = (CGPoint)0;
      }
      v4->_u.point = v19;
      *((_OWORD *)&v4->_u.affine_transform + 3) = v22;
      *((_OWORD *)&v4->_u.affine_transform + 4) = v23;
      *(_OWORD *)&v4->_u.affine_transform.c = v20;
      *(_OWORD *)&v4->_u.affine_transform.tdouble x = v21;
      return v4;
    }
    v4->_kind = 11;
    if (a3)
    {
      [a3 CACornerRadiiValue];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      CGPoint v19 = (CGPoint)0;
      long long v20 = 0u;
    }
    *(_OWORD *)&v4->_u.affine_transform.tdouble x = v21;
    *((_OWORD *)&v4->_u.affine_transform + 3) = v22;
    v4->_u.point = v19;
    *(_OWORD *)&v4->_u.affine_transform.c = v20;
  }
  return v4;
}

@end