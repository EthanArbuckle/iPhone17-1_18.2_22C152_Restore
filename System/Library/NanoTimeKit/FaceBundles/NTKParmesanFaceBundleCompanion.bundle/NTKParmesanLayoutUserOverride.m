@interface NTKParmesanLayoutUserOverride
- (BOOL)useDepthEffect;
- (CGRect)crop;
- (NTKParmesanLayoutUserOverride)init;
- (NTKParmesanTimeLayout)timeLayout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCrop:(CGRect)a3;
- (void)setTimeLayout:(id)a3;
- (void)setUseDepthEffect:(BOOL)a3;
@end

@implementation NTKParmesanLayoutUserOverride

- (NTKParmesanLayoutUserOverride)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKParmesanLayoutUserOverride;
  v2 = [(NTKParmesanLayoutUserOverride *)&v7 init];
  v3 = (NTKParmesanLayoutUserOverride *)v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    *(_OWORD *)(v2 + 24) = *MEMORY[0x263F001A0];
    *(_OWORD *)(v2 + 40) = v4;
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0;

    v3->_useDepthEffect = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  objc_msgSend_setCrop_(v12, v13, v14, v15, self->_crop.origin.x, self->_crop.origin.y, self->_crop.size.width, self->_crop.size.height);
  objc_msgSend_setTimeLayout_(v12, v16, (uint64_t)self->_timeLayout, v17);
  objc_msgSend_setUseDepthEffect_(v12, v18, self->_useDepthEffect, v19);
  return v12;
}

- (id)description
{
  v3 = NSString;
  long long v4 = NSStringFromCGRect(self->_crop);
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[UserOverride: crop=%@, timeLayout=%@, depthEffect=%d]", v6, v4, self->_timeLayout, self->_useDepthEffect);

  return v7;
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  self->_crop = a3;
}

- (NTKParmesanTimeLayout)timeLayout
{
  return self->_timeLayout;
}

- (void)setTimeLayout:(id)a3
{
}

- (BOOL)useDepthEffect
{
  return self->_useDepthEffect;
}

- (void)setUseDepthEffect:(BOOL)a3
{
  self->_useDepthEffect = a3;
}

- (void).cxx_destruct
{
}

@end