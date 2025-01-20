@interface CIBitmapContext
+ (id)context;
+ (id)contextWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6;
+ (id)contextWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6 options:(id)a7;
+ (id)contextWithOptions:(id)a3;
- (BOOL)setBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6;
- (CGRect)bounds;
- (CIBitmapContext)init;
- (CIBitmapContext)initWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6;
- (CIBitmapContext)initWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6 options:(id)a7;
- (CIBitmapContext)initWithOptions:(id)a3;
- (void)dealloc;
- (void)drawImage:(id)a3 inRect:(CGRect)a4 fromRect:(CGRect)a5;
@end

@implementation CIBitmapContext

+ (id)context
{
  v2 = objc_alloc_init(CIBitmapContext);

  return v2;
}

+ (id)contextWithOptions:(id)a3
{
  v3 = [[CIBitmapContext alloc] initWithOptions:a3];

  return v3;
}

+ (id)contextWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6
{
  v6 = -[CIBitmapContext initWithBitmap:rowBytes:bounds:format:]([CIBitmapContext alloc], "initWithBitmap:rowBytes:bounds:format:", a3, a4, *(void *)&a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  return v6;
}

+ (id)contextWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6 options:(id)a7
{
  v7 = -[CIBitmapContext initWithBitmap:rowBytes:bounds:format:options:]([CIBitmapContext alloc], "initWithBitmap:rowBytes:bounds:format:options:", a3, a4, *(void *)&a6, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  return v7;
}

- (CIBitmapContext)init
{
  return [(CIBitmapContext *)self initWithOptions:0];
}

- (CIBitmapContext)initWithOptions:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  [v4 setValue:MEMORY[0x1E4F1CC38] forKey:@"software_renderer"];
  v6.receiver = self;
  v6.super_class = (Class)CIBitmapContext;
  return [(CIContext *)&v6 initWithOptions:v4];
}

- (CIBitmapContext)initWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6
{
  return -[CIBitmapContext initWithBitmap:rowBytes:bounds:format:options:](self, "initWithBitmap:rowBytes:bounds:format:options:", a3, a4, *(void *)&a6, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (CIBitmapContext)initWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6 options:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v15 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a7];
  [v15 setValue:MEMORY[0x1E4F1CC38] forKey:@"software_renderer"];
  v19.receiver = self;
  v19.super_class = (Class)CIBitmapContext;
  v17 = [(CIContext *)&v19 initWithOptions:v15];
  if (v17
    && !-[CIBitmapContext setBitmap:rowBytes:bounds:format:](v17, "setBitmap:rowBytes:bounds:format:", a3, a4, CI::format_modernize(v7, (CI *)"-[CIBitmapContext initWithBitmap:rowBytes:bounds:format:options:]", v16), x, y, width, height))
  {

    return 0;
  }
  return v17;
}

- (BOOL)setBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  bcpriv = self->_bcpriv;
  if (bcpriv)
  {
    free(bcpriv);
    self->_bcpriv = 0;
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRect v32 = CGRectStandardize(v31);
  if (!a3) {
    goto LABEL_5;
  }
  CGFloat v15 = v32.origin.x;
  CGFloat v16 = v32.origin.y;
  double v17 = v32.size.width;
  double v18 = v32.size.height;
  if (CGRectIsEmpty(v32)) {
    goto LABEL_5;
  }
  v33.origin.CGFloat x = v15;
  v33.origin.CGFloat y = v16;
  v33.size.CGFloat width = v17;
  v33.size.CGFloat height = v18;
  if (CGRectIsInfinite(v33) || v17 >= 1000000.0 || v18 >= 1000000.0)
  {
    v26 = ci_logger_api();
    BOOL v19 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v19) {
      return v19;
    }
    -[CIBitmapContext setBitmap:rowBytes:bounds:format:](v26);
  }
  else
  {
    int v21 = CI::format_modernize(v6, (CI *)"-[CIBitmapContext setBitmap:rowBytes:bounds:format:]", v20);
    if (v21 == 258) {
      int v22 = 259;
    }
    else {
      int v22 = v21;
    }
    if (CI::format_is_supported_render_to_bitmap(v22))
    {
      unint64_t v23 = CI::format_destination_rowbytes_requirement(v22);
      if (!(a4 % v23))
      {
        v28 = (CIBitmapContextPrivate *)malloc_type_malloc(0x38uLL, 0x10800402C4B44A1uLL);
        self->_bcpriv = v28;
        v28->var0 = a3;
        v29 = self->_bcpriv;
        v29->var1 = a4;
        v29->var2.origin.CGFloat x = v15;
        v29->var2.origin.CGFloat y = v16;
        v29->var2.size.CGFloat width = v17;
        v29->var2.size.CGFloat height = v18;
        v29->var3 = v22;
LABEL_5:
        LOBYTE(v19) = 1;
        return v19;
      }
      uint64_t v24 = v23;
      v25 = ci_logger_api();
      BOOL v19 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (!v19) {
        return v19;
      }
      -[CIBitmapContext setBitmap:rowBytes:bounds:format:](v24, v25);
    }
    else
    {
      v27 = ci_logger_api();
      BOOL v19 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (!v19) {
        return v19;
      }
      -[CIBitmapContext setBitmap:rowBytes:bounds:format:](v22);
    }
  }
  LOBYTE(v19) = 0;
  return v19;
}

- (void)dealloc
{
  bcpriv = self->_bcpriv;
  if (bcpriv)
  {
    free(bcpriv);
    self->_bcpriv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIBitmapContext;
  [(CIContext *)&v4 dealloc];
}

- (void)drawImage:(id)a3 inRect:(CGRect)a4 fromRect:(CGRect)a5
{
  if (!self->_bcpriv) {
    return;
  }
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGRect v39 = CGRectStandardize(a5);
  double v11 = v39.origin.x;
  double v12 = v39.origin.y;
  double v13 = v39.size.width;
  double v14 = v39.size.height;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGRect v40 = CGRectStandardize(v39);
  double v15 = v40.origin.x;
  double v16 = v40.origin.y;
  double v17 = v40.size.width;
  double v18 = v40.size.height;
  BOOL v19 = [(CIContext *)self _internalContext];
  if (!a3) {
    return;
  }
  if (!v19) {
    return;
  }
  v41.origin.CGFloat x = v15;
  v41.origin.CGFloat y = v16;
  v41.size.CGFloat width = v17;
  v41.size.CGFloat height = v18;
  if (CGRectIsEmpty(v41)) {
    return;
  }
  [a3 extent];
  v46.origin.CGFloat x = v20;
  v46.origin.CGFloat y = v21;
  v46.size.CGFloat width = v22;
  v46.size.CGFloat height = v23;
  v42.origin.CGFloat x = v11;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = v13;
  v42.size.CGFloat height = v14;
  CGRect v43 = CGRectIntersection(v42, v46);
  if (CGRectIsEmpty(v43)) {
    return;
  }
  v44.origin.CGFloat x = v11;
  v44.origin.CGFloat y = v12;
  v44.size.CGFloat width = v13;
  v44.size.CGFloat height = v14;
  if (CGRectIsInfinite(v44)
    || (v45.origin.x = v15, v45.origin.y = v16, v45.size.width = v17, v45.size.CGFloat height = v18, CGRectIsInfinite(v45)))
  {
    uint64_t v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CIBitmapContext drawImage:inRect:fromRect:](v24);
    }
    return;
  }
  v25 = [(CIContext *)self _outputColorSpace];
  CGColorSpaceModel Model = CGColorSpaceGetModel(v25);
  int var3 = self->_bcpriv->var3;
  if (!CI::format_is_luminance(var3))
  {
    if (Model != kCGColorSpaceModelRGB)
    {
      v25 = +[CIContext defaultRGBColorSpace];
      v30 = ci_logger_api();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[CIBitmapContext drawImage:inRect:fromRect:](var3);
      }
      goto LABEL_19;
    }
LABEL_16:
    int v29 = 0;
    goto LABEL_20;
  }
  if (Model == kCGColorSpaceModelMonochrome) {
    goto LABEL_16;
  }
  v25 = +[CIContext defaultGrayColorSpace];
  v28 = ci_logger_api();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[CIBitmapContext drawImage:inRect:fromRect:](var3);
  }
LABEL_19:
  int v29 = 1;
LABEL_20:
  double v33 = v17 / v13;
  double v34 = v17 / v13 * 0.0;
  double v35 = v18 / v14 * 0.0;
  double v36 = v18 / v14;
  double v37 = v15 - v17 / v13 * v11 - v35 * v12;
  double v38 = v16 - v34 * v11 - v18 / v14 * v12;
  uint64_t v31 = [a3 imageByApplyingTransform:&v33];
  bcpriv = self->_bcpriv;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](self, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v31, bcpriv->var0, bcpriv->var1, bcpriv->var3, v25, bcpriv->var2.origin.x, bcpriv->var2.origin.y, bcpriv->var2.size.width, bcpriv->var2.size.height);
  if (v29) {
    CGColorSpaceRelease(v25);
  }
}

- (CGRect)bounds
{
  bcpriv = self->_bcpriv;
  if (bcpriv) {
    p_CGFloat x = &bcpriv->var2.origin.x;
  }
  else {
    p_CGFloat x = (double *)MEMORY[0x1E4F1DB20];
  }
  double v4 = *p_x;
  double v5 = p_x[1];
  double v6 = p_x[2];
  double v7 = p_x[3];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)setBitmap:(os_log_t)log rowBytes:bounds:format:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  v2 = "-[CIBitmapContext setBitmap:rowBytes:bounds:format:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s bounds is too large\n", (uint8_t *)&v1, 0xCu);
}

- (void)setBitmap:(uint64_t)a1 rowBytes:(NSObject *)a2 bounds:format:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "-[CIBitmapContext setBitmap:rowBytes:bounds:format:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s rowBytes must be a multiple of %ld.\n", (uint8_t *)&v2, 0x16u);
}

- (void)setBitmap:(int)a1 rowBytes:bounds:format:.cold.3(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s format %{public}s is unsupported.\n", v3, v4, v5, v6, 2u);
}

- (void)drawImage:(os_log_t)log inRect:fromRect:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  uint64_t v2 = "-[CIBitmapContext drawImage:inRect:fromRect:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s given an infinite rect", (uint8_t *)&v1, 0xCu);
}

- (void)drawImage:(int)a1 inRect:fromRect:.cold.2(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s context's output colorspace can't be used with pixel format %{public}s. Using default grayscale output colorspace instead.\n", v3, v4, v5, v6, 2u);
}

- (void)drawImage:(int)a1 inRect:fromRect:.cold.3(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s context's output colorspace can't be used with pixel format %{public}s. Using default RGB output colorspace instead.\n", v3, v4, v5, v6, 2u);
}

@end