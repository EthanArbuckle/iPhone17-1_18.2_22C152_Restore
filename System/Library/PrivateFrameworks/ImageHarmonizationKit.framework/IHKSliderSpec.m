@interface IHKSliderSpec
- (IHKSliderSpec)init;
- (IHKSliderSpec)initWithMin:(double)a3 max:(double)a4;
- (IHKSliderSpec)initWithMin:(double)a3 max:(double)a4 identity:(double)a5;
- (double)identity;
- (double)max;
- (double)min;
- (double)toNativeRange:(double)a3;
- (double)toNormalizedRange:(double)a3;
- (id)description;
- (void)_initWithMin:(double)a3 max:(double)a4 identity:(double)a5;
- (void)setIdentity:(double)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
@end

@implementation IHKSliderSpec

- (id)description
{
  v6 = NSString;
  objc_msgSend_identity(self, a2, v2, v3, v4);
  uint64_t v8 = v7;
  objc_msgSend_min(self, v9, v10, v11, v12);
  uint64_t v14 = v13;
  objc_msgSend_max(self, v15, v16, v17, v18);
  return (id)objc_msgSend_stringWithFormat_(v6, v19, @"<IHKSliderSpec identity: %.2f, min: %.2f, max:%.2f>", v20, v21, v8, v14, v22);
}

- (void)_initWithMin:(double)a3 max:(double)a4 identity:(double)a5
{
  objc_msgSend_setMin_(self, a2, v5, v6, v7, a3);
  objc_msgSend_setMax_(self, v10, v11, v12, v13, a4);

  MEMORY[0x270F9A6D0](self, sel_setIdentity_, v14, v15, v16);
}

- (IHKSliderSpec)init
{
  v9.receiver = self;
  v9.super_class = (Class)IHKSliderSpec;
  uint64_t v2 = [(IHKSliderSpec *)&v9 init];
  uint64_t v7 = v2;
  if (v2) {
    objc_msgSend__initWithMin_max_identity_(v2, v3, v4, v5, v6, -1.0, 1.0, 0.0);
  }
  return v7;
}

- (IHKSliderSpec)initWithMin:(double)a3 max:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)IHKSliderSpec;
  uint64_t v6 = [(IHKSliderSpec *)&v13 init];
  uint64_t v11 = v6;
  if (v6) {
    objc_msgSend__initWithMin_max_identity_(v6, v7, v8, v9, v10, a3, a4, 0.0);
  }
  return v11;
}

- (IHKSliderSpec)initWithMin:(double)a3 max:(double)a4 identity:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)IHKSliderSpec;
  uint64_t v8 = [(IHKSliderSpec *)&v15 init];
  objc_super v13 = v8;
  if (v8) {
    objc_msgSend__initWithMin_max_identity_(v8, v9, v10, v11, v12, a3, a4, a5);
  }
  return v13;
}

- (double)toNormalizedRange:(double)a3
{
  objc_msgSend_identity(self, a2, v3, v4, v5);
  if (v12 <= a3)
  {
    objc_msgSend_identity(self, v8, v9, v10, v11);
    double v28 = a3 - v27;
    objc_msgSend_max(self, v29, v30, v31, v32);
    double v34 = v33;
    objc_msgSend_identity(self, v35, v36, v37, v38);
    return v28 / (v34 - v39);
  }
  else
  {
    objc_msgSend_min(self, v8, v9, v10, v11);
    double v14 = a3 - v13;
    objc_msgSend_identity(self, v15, v16, v17, v18);
    double v20 = v19;
    objc_msgSend_min(self, v21, v22, v23, v24);
    return v14 / (v20 - v25) + -1.0;
  }
}

- (double)toNativeRange:(double)a3
{
  if (a3 >= 0.0)
  {
    objc_msgSend_max(self, a2, v3, v4, v5);
    double v9 = v19;
    objc_msgSend_identity(self, v20, v21, v22, v23);
  }
  else
  {
    objc_msgSend_identity(self, a2, v3, v4, v5);
    double v9 = v8;
    objc_msgSend_min(self, v10, v11, v12, v13);
  }
  double v24 = (v9 - v18) * a3;
  objc_msgSend_identity(self, v14, v15, v16, v17);
  return v25 + v24;
}

- (double)min
{
  return self->min;
}

- (void)setMin:(double)a3
{
  self->min = a3;
}

- (double)max
{
  return self->max;
}

- (void)setMax:(double)a3
{
  self->max = a3;
}

- (double)identity
{
  return self->identity;
}

- (void)setIdentity:(double)a3
{
  self->identity = a3;
}

@end