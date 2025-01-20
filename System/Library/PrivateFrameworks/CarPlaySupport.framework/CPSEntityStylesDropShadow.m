@interface CPSEntityStylesDropShadow
- (CGRect)rectsForSource:(CGRect)a3 shadowRect:(CGRect *)a4 unionRect:(CGRect *)a5 positionTransform:(CGAffineTransform *)a6;
- (CGSize)offset;
- (UIColor)color;
- (double)opacity;
- (double)radius;
- (void)applyShadowToLayer:(id)a3;
- (void)setColor:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation CPSEntityStylesDropShadow

- (void)applyShadowToLayer:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = location[0];
  v7 = [(CPSEntityStylesDropShadow *)v12 color];
  objc_msgSend(v6, "setShadowColor:", -[UIColor CGColor](v7, "CGColor"));

  id v8 = location[0];
  [(CPSEntityStylesDropShadow *)v12 offset];
  objc_msgSend(v8, "setShadowOffset:", v3, v4);
  id v9 = location[0];
  [(CPSEntityStylesDropShadow *)v12 radius];
  objc_msgSend(v9, "setShadowRadius:");
  id v10 = location[0];
  [(CPSEntityStylesDropShadow *)v12 opacity];
  *(float *)&double v5 = v5;
  [v10 setShadowOpacity:v5];
  objc_storeStrong(location, 0);
}

- (CGRect)rectsForSource:(CGRect)a3 shadowRect:(CGRect *)a4 unionRect:(CGRect *)a5 positionTransform:(CGAffineTransform *)a6
{
  CGRect v38 = a3;
  v37 = self;
  SEL v36 = a2;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  [(CPSEntityStylesDropShadow *)self radius];
  [(CPSEntityStylesDropShadow *)v37 radius];
  [(CPSEntityStylesDropShadow *)v37 radius];
  [(CPSEntityStylesDropShadow *)v37 radius];
  CGRectMake_12();
  v32.origin.x = v6;
  v32.origin.y = v7;
  v32.size.width = v8;
  v32.size.height = v9;
  [(CPSEntityStylesDropShadow *)v37 offset];
  double v28 = v10;
  uint64_t v29 = v11;
  CGFloat tx = v10;
  [(CPSEntityStylesDropShadow *)v37 offset];
  uint64_t v26 = v12;
  CGFloat ty = v13;
  CGAffineTransformMakeTranslation(&v30, tx, v13);
  CGRect v31 = CGRectApplyAffineTransform(v32, &v30);
  CGRect v32 = v31;
  CGRect v25 = CGRectUnion(v38, v31);
  memset(&__b, 0, sizeof(__b));
  CGAffineTransformMakeTranslation(&__b, -v25.origin.x, -v25.origin.y);
  long long v39 = 0u;
  long long v40 = 0u;
  memcpy(&__dst, &__b, sizeof(__dst));
  CGRect v41 = CGRectApplyAffineTransform(v38, &__dst);
  *(CGFloat *)&long long v39 = v41.origin.x;
  *((void *)&v39 + 1) = *(void *)&v41.origin.y;
  *(CGFloat *)&long long v40 = v41.size.width;
  *((void *)&v40 + 1) = *(void *)&v41.size.height;
  memcpy(&v21, &__b, sizeof(v21));
  CGRect v22 = CGRectApplyAffineTransform(v32, &v21);
  CGRect v32 = v22;
  memcpy(&v19, &__b, sizeof(v19));
  CGRect v20 = CGRectApplyAffineTransform(v25, &v19);
  CGRect v25 = v20;
  if (v35) {
    CGRect *v35 = v32;
  }
  if (v34) {
    CGRect *v34 = v25;
  }
  if (v33) {
    memcpy(v33, &__b, sizeof(CGAffineTransform));
  }
  double v15 = *((double *)&v39 + 1);
  double v14 = *(double *)&v39;
  double v17 = *((double *)&v40 + 1);
  double v16 = *(double *)&v40;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (CGSize)offset
{
  double height = self->_offset.height;
  double width = self->_offset.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opaciCGFloat ty = a3;
}

- (void).cxx_destruct
{
}

@end