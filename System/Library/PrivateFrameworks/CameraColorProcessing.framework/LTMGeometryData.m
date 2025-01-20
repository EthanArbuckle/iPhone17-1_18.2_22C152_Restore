@interface LTMGeometryData
- (CGPoint)deepZoomOrigin;
- (CGRect)cropRect;
- (CGRect)sourceRect;
- (CGSize)inputTextureSize;
- (LTMGeometryData)initWithInputTextureWidth:(unint64_t)a3 height:(unint64_t)a4;
- (float)inputTextureDownsampleRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCropRect:(CGRect)a3 sourceRect:(CGRect)a4;
- (void)setDeepZoomOrigin:(CGPoint)a3;
- (void)setInputTextureDownsampleRatio:(float)a3;
@end

@implementation LTMGeometryData

- (LTMGeometryData)initWithInputTextureWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)LTMGeometryData;
  v6 = [(LTMGeometryData *)&v12 init];
  v7 = v6;
  if (v6 && a3 >= 0x1E0 && a4 > 0x13F)
  {
    *((double *)v6 + 12) = (double)a3;
    *((double *)v6 + 13) = (double)a4;
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = 0;
    *((double *)v6 + 3) = (double)a3;
    *((double *)v6 + 4) = (double)a4;
    v8.i64[0] = a3;
    v8.i64[1] = a4;
    *(float64x2_t *)(v6 + 40) = vcvtq_f64_u64(vshrq_n_u64((uint64x2_t)vaddq_s64(v8, (int64x2_t)xmmword_23FF52860), 1uLL));
    *(_OWORD *)(v6 + 56) = xmmword_23FF52870;
    *((void *)v6 + 10) = 0;
    *((void *)v6 + 11) = 0;
    *((_DWORD *)v6 + 18) = 1065353216;
    v9 = v6;
  }
  else
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[LTMGeometryData alloc] initWithInputTextureWidth:(unint64_t)self->_inputTextureSize.width height:(unint64_t)self->_inputTextureSize.height];
  -[LTMGeometryData setCropRect:sourceRect:](v4, "setCropRect:sourceRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  [(LTMGeometryData *)self inputTextureDownsampleRatio];
  -[LTMGeometryData setInputTextureDownsampleRatio:](v4, "setInputTextureDownsampleRatio:");
  [(LTMGeometryData *)self deepZoomOrigin];
  -[LTMGeometryData setDeepZoomOrigin:](v4, "setDeepZoomOrigin:");
  return v4;
}

- (void)setCropRect:(CGRect)a3 sourceRect:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect v46 = CGRectIntegral(a4);
  CGFloat v9 = v46.origin.x;
  CGFloat v34 = v46.origin.y;
  CGFloat rect2 = v46.origin.x;
  CGFloat v10 = v46.origin.y;
  double v39 = v46.size.width;
  CGFloat v11 = v46.size.height;
  double v33 = v46.size.height;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGRect v47 = CGRectIntegral(v46);
  CGFloat v12 = v47.origin.x;
  CGFloat v13 = v47.origin.y;
  double v14 = v47.size.width;
  double v15 = v47.size.height;
  v53.origin.CGFloat x = v9;
  v53.origin.CGFloat y = v10;
  v53.size.CGFloat width = v39;
  v53.size.CGFloat height = v11;
  CGRect v48 = CGRectIntersection(self->_inputTextureRect, v53);
  CGFloat v16 = v48.origin.x;
  CGFloat rect1 = v48.origin.y;
  CGFloat v17 = v48.size.width;
  CGFloat v18 = v48.size.height;
  v54.origin.CGFloat x = v12;
  v54.origin.CGFloat y = v13;
  v54.size.CGFloat width = v14;
  v54.size.CGFloat height = v15;
  CGRect v49 = CGRectIntersection(self->_inputTextureRect, v54);
  CGFloat v40 = v49.origin.x;
  CGFloat v37 = v49.size.width;
  CGFloat v38 = v49.origin.y;
  CGFloat v36 = v49.size.height;
  double v43 = v16;
  v49.origin.CGFloat x = v16;
  v55.origin.CGFloat y = v34;
  v49.origin.CGFloat y = rect1;
  v49.size.CGFloat width = v17;
  v49.size.CGFloat height = v18;
  v55.origin.CGFloat x = rect2;
  v55.size.CGFloat width = v39;
  v55.size.CGFloat height = v33;
  if (!CGRectEqualToRect(v49, v55))
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v50.origin.CGFloat x = v40;
  v56.origin.CGFloat x = v12;
  v50.size.CGFloat width = v37;
  v50.origin.CGFloat y = v38;
  v50.size.CGFloat height = v36;
  v56.origin.CGFloat y = v13;
  v56.size.CGFloat width = v14;
  v56.size.CGFloat height = v15;
  CGFloat r1 = v18;
  if (!CGRectEqualToRect(v50, v56))
  {
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v39 < 480.0 || v33 < 320.0)
  {
    v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    CGFloat v22 = self->_minimumRect.origin.x;
    CGFloat rect1 = self->_minimumRect.origin.y;
    CGFloat v17 = self->_minimumRect.size.width;
    CGFloat r1 = self->_minimumRect.size.height;
    CGFloat v21 = v40;
  }
  else
  {
    CGFloat v21 = v40;
    CGFloat v22 = v43;
  }
  if (v14 < 480.0 || v15 < 320.0)
  {
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    CGFloat v21 = self->_minimumRect.origin.x;
    CGFloat v25 = self->_minimumRect.origin.y;
    CGFloat v26 = self->_minimumRect.size.width;
    CGFloat v24 = self->_minimumRect.size.height;
  }
  else
  {
    CGFloat v24 = v36;
    CGFloat v26 = v37;
    CGFloat v25 = v38;
  }
  CGFloat v44 = v22;
  v51.origin.CGFloat x = v22;
  v51.origin.CGFloat y = rect1;
  CGFloat v41 = v17;
  v51.size.CGFloat width = v17;
  v51.size.CGFloat height = r1;
  v57.origin.CGFloat x = v21;
  v57.origin.CGFloat y = v25;
  v57.size.CGFloat width = v26;
  v57.size.CGFloat height = v24;
  CGRect v52 = CGRectIntersection(v51, v57);
  CGFloat v28 = v52.origin.x;
  CGFloat v29 = v52.origin.y;
  CGFloat v30 = v52.size.width;
  CGFloat v31 = v52.size.height;
  v52.origin.CGFloat x = v21;
  v52.origin.CGFloat y = v25;
  v52.size.CGFloat width = v26;
  v52.size.CGFloat height = v24;
  v58.origin.CGFloat x = v28;
  v58.origin.CGFloat y = v29;
  v58.size.CGFloat width = v30;
  v58.size.CGFloat height = v31;
  if (!CGRectEqualToRect(v52, v58))
  {
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_cropRect.origin.CGFloat x = v28;
  self->_cropRect.origin.CGFloat y = v29;
  self->_cropRect.size.CGFloat width = v30;
  self->_cropRect.size.CGFloat height = v31;
  self->_sourceRect.origin.CGFloat x = v44;
  self->_sourceRect.origin.CGFloat y = rect1;
  self->_sourceRect.size.CGFloat width = v41;
  self->_sourceRect.size.CGFloat height = r1;
}

- (CGPoint)deepZoomOrigin
{
  double x = self->_deepZoomOrigin.x;
  double y = self->_deepZoomOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDeepZoomOrigin:(CGPoint)a3
{
  self->_deepZoomOrigin = a3;
}

- (float)inputTextureDownsampleRatio
{
  return self->_inputTextureDownsampleRatio;
}

- (void)setInputTextureDownsampleRatio:(float)a3
{
  self->_inputTextureDownsampleRatio = a3;
}

- (CGSize)inputTextureSize
{
  double width = self->_inputTextureSize.width;
  double height = self->_inputTextureSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end