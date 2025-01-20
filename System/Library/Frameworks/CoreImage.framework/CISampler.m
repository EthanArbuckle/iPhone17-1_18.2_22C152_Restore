@interface CISampler
+ (CISampler)samplerWithImage:(CIImage *)im;
+ (CISampler)samplerWithImage:(CIImage *)im keysAndValues:(id)key0;
+ (CISampler)samplerWithImage:(CIImage *)im options:(NSDictionary *)dict;
- (CGRect)extent;
- (CIFilterShape)definition;
- (CISampler)init;
- (CISampler)initWithImage:(CIImage *)im;
- (CISampler)initWithImage:(CIImage *)im keysAndValues:(id)key0;
- (CISampler)initWithImage:(CIImage *)im options:(NSDictionary *)dict;
- (id)_initWithImage:(id)a3 key0:(id)a4 vargs:(char *)a5;
- (id)debugDescription;
- (id)description;
- (id)opaqueShape;
- (id)wrapMode;
- (void)_internalRepresentation;
- (void)colorSpace;
- (void)dealloc;
- (void)init;
@end

@implementation CISampler

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    if (priv[18] > 0x3FFu)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __20__CISampler_dealloc__block_invoke_2;
      v5[3] = &__block_descriptor_40_e5_v8__0l;
      v5[4] = priv;
      CI::Object::performDeferredRoot(v5);
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __20__CISampler_dealloc__block_invoke;
      v6[3] = &__block_descriptor_40_e5_v8__0l;
      v6[4] = priv;
      CI::Object::performDeferred(v6);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CISampler;
  [(CISampler *)&v4 dealloc];
}

void __20__CISampler_dealloc__block_invoke(uint64_t a1)
{
  v1 = *(CI::Object **)(a1 + 32);
  if (v1) {
    CI::Object::unref(v1);
  }
}

void __20__CISampler_dealloc__block_invoke_2(uint64_t a1)
{
  v1 = *(CI::Object **)(a1 + 32);
  if (v1) {
    CI::Object::unref(v1);
  }
}

- (CISampler)init
{
  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CISampler init](v3);
  }

  return 0;
}

- (CISampler)initWithImage:(CIImage *)im
{
  return [(CISampler *)self initWithImage:im options:0];
}

- (CISampler)initWithImage:(CIImage *)im keysAndValues:(id)key0
{
  va_start(va, key0);
  return (CISampler *)[(CISampler *)self _initWithImage:im key0:key0 vargs:va];
}

- (id)_initWithImage:(id)a3 key0:(id)a4 vargs:(char *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23 = a5;
  v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (a4)
  {
    *(void *)&long long v9 = 138543362;
    long long v20 = v9;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = ci_logger_api();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[CISampler _initWithImage:key0:vargs:](&v21, v22, v13);
        }
        goto LABEL_13;
      }
      v10 = (const void **)v23;
      v23 += 8;
      v11 = *v10;
      if (*v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (CFTypeID v12 = CFGetTypeID(v11), v12 == CGColorSpaceGetTypeID()))
        {
          objc_msgSend(v8, "setValue:forKey:", v11, a4, v20);
        }
        else
        {
          v17 = ci_logger_api();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            id v25 = a4;
            v15 = v17;
            v16 = "CISampler value for key '%{public}@' must be a NSObject or a CGColorSpaceRef. Skipping.";
            goto LABEL_16;
          }
        }
      }
      else
      {
        v14 = ci_logger_api();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          id v25 = a4;
          v15 = v14;
          v16 = "CISampler value for key '%{public}@' is nil. Skipping.";
LABEL_16:
          _os_log_error_impl(&dword_193671000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
        }
      }
LABEL_13:
      v18 = (id *)v23;
      v23 += 8;
      a4 = *v18;
    }
    while (*v18);
  }
  return -[CISampler initWithImage:options:](self, "initWithImage:options:", a3, v8, v20);
}

- (CISampler)initWithImage:(CIImage *)im options:(NSDictionary *)dict
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!im)
  {
LABEL_44:

    return 0;
  }
  v6 = im;
  objc_msgSend(-[NSDictionary valueForKey:](dict, "valueForKey:", @"blur"), "doubleValue");
  double v8 = fmax(v7, 0.0);
  if (v8 > 0.0)
  {
    if ([(NSDictionary *)dict valueForKey:@"blur_format"])
    {
      long long v9 = ci_logger_api();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[CISampler initWithImage:options:]";
        _os_log_impl(&dword_193671000, v9, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerBlurFormat because it is not supported.", buf, 0xCu);
      }
    }
    v6 = [(CIImage *)v6 imageByApplyingGaussianBlurWithSigma:v8];
  }
  id v10 = [(NSDictionary *)dict valueForKey:@"wrap_mode"];
  if (v10)
  {
    v11 = v10;
    if ([v10 isEqual:@"clamp"])
    {
      [(CIImage *)v6 extent];
      if (!CGRectIsInfinite(v42)) {
        v6 = [(CIImage *)v6 imageByClampingToExtent];
      }
    }
    if ([v11 isEqual:@"periodic"])
    {
      [(CIImage *)v6 extent];
      if (!CGRectIsInfinite(v43))
      {
        CFTypeID v12 = ci_logger_api();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[CISampler initWithImage:options:]";
          _os_log_impl(&dword_193671000, v12, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerWrapPeriodic because it is not supported.", buf, 0xCu);
        }
      }
    }
  }
  id v13 = [(NSDictionary *)dict valueForKey:@"filter_mode"];
  if (v13)
  {
    v14 = v13;
    if ([v13 isEqual:@"nearest"])
    {
      uint64_t v15 = [(CIImage *)v6 imageBySamplingNearest];
LABEL_18:
      v6 = (CIImage *)v15;
      goto LABEL_22;
    }
    if (([v14 isEqual:@"point"] & 1) == 0
      && [v14 isEqual:@"linear"])
    {
      uint64_t v15 = [(CIImage *)v6 imageBySamplingLinear];
      goto LABEL_18;
    }
  }
LABEL_22:
  id v16 = [(NSDictionary *)dict valueForKey:@"affine_matrix"];
  if (!v16) {
    goto LABEL_35;
  }
  v17 = v16;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v36 = *MEMORY[0x1E4F1DAB8];
  long long v37 = v18;
  long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (const char *)[v17 objCType];
    if (!strcmp(v19, "{CGAffineTransform=dddddd}") || !strcmp(v19, "{?=dddddd}"))
    {
      [v17 getValue:&v36 size:48];
LABEL_29:
      v35[0] = v36;
      v35[1] = v37;
      v35[2] = v38;
      v6 = [(CIImage *)v6 imageByApplyingTransform:v35];
      goto LABEL_35;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v40 = 0u;
      memset(buf, 0, sizeof(buf));
      [v17 transformStruct];
      long long v36 = *(_OWORD *)buf;
      long long v37 = *(_OWORD *)&buf[16];
      long long v38 = v40;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 count] == 6)
    {
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 0), "doubleValue");
      *(void *)&long long v36 = v20;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 1), "doubleValue");
      *((void *)&v36 + 1) = v21;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 2), "doubleValue");
      *(void *)&long long v37 = v22;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 3), "doubleValue");
      *((void *)&v37 + 1) = v23;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 4), "doubleValue");
      *(void *)&long long v38 = v24;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 5), "doubleValue");
      *((void *)&v38 + 1) = v25;
      goto LABEL_29;
    }
  }
  uint64_t v26 = ci_logger_api();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v17 description];
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[CISampler initWithImage:options:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v27;
    _os_log_impl(&dword_193671000, v26, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerAffineMatrix value because it is not a valid object '%{public}@'.", buf, 0x16u);
  }
LABEL_35:
  id v28 = [(NSDictionary *)dict valueForKey:@"color_space"];
  if (v28)
  {
    id v30 = v28;
    if (CI::ColorSpace_is_RGB_and_supports_output((BOOL)v28, v29))
    {
      v6 = [(CIImage *)v6 imageByColorMatchingWorkingSpaceToColorSpace:v30];
    }
    else
    {
      v31 = ci_logger_api();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[CISampler initWithImage:options:]";
        _os_log_impl(&dword_193671000, v31, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerColorSpace value because it is not an RGB CGColorSpaceRef that supports output.", buf, 0xCu);
      }
    }
  }
  if (!v6) {
    goto LABEL_44;
  }
  uint64_t v32 = [(CIImage *)v6 _internalRepresentation];
  v33 = (void *)v32;
  if (v32) {
    CI::Object::ref(v32);
  }
  self->_priv = v33;
  return self;
}

+ (CISampler)samplerWithImage:(CIImage *)im
{
  if (!im) {
    return 0;
  }
  v3 = [[CISampler alloc] initWithImage:im];

  return v3;
}

+ (CISampler)samplerWithImage:(CIImage *)im keysAndValues:(id)key0
{
  va_start(va, key0);
  if (im) {
    return (CISampler *)[[CISampler alloc] _initWithImage:im key0:key0 vargs:va];
  }
  else {
    return 0;
  }
}

+ (CISampler)samplerWithImage:(CIImage *)im options:(NSDictionary *)dict
{
  if (!im) {
    return 0;
  }
  objc_super v4 = [[CISampler alloc] initWithImage:im options:dict];

  return v4;
}

- (void)_internalRepresentation
{
  return self->_priv;
}

- (CIFilterShape)definition
{
  [(CISampler *)self extent];

  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:");
}

- (id)opaqueShape
{
  if (!(*(unsigned int (**)(void *, SEL))(*(void *)self->_priv + 128))(self->_priv, a2)) {
    return 0;
  }

  return [(CISampler *)self definition];
}

- (CGRect)extent
{
  (*(void (**)(void))(*(void *)self->_priv + 88))();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)wrapMode
{
  return 0;
}

- (void)colorSpace
{
  return (void *)(*(uint64_t (**)(void))(*(void *)self->_priv + 240))();
}

- (id)description
{
  [(CISampler *)self extent];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  if (CGRectIsInfinite(v12)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CISampler: %p extent [infinite]>", self, v8, v9, v10, v11);
  }
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  if (CGRectIsEmpty(v13)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CISampler: %p extent [empty]>", self, v8, v9, v10, v11);
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CISampler: %p extent [%g %g %g %g]>", self, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  }
}

- (id)debugDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__CISampler_debugDescription__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

size_t __29__CISampler_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  fprintf(a2, "<CISampler: %p>\n", *(const void **)(a1 + 32));
  CI::Image::print_graph(*(CI::Image **)(*(void *)(a1 + 32) + 8), a2);

  return fwrite("\n\n", 2uLL, 1uLL, a2);
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  double v2 = "-[CISampler init]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s init is not a valid initializer for CISampler", (uint8_t *)&v1, 0xCu);
}

- (void)_initWithImage:(uint8_t *)buf key0:(unsigned char *)a2 vargs:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "CISampler option key must be a NSString. Skipping.", buf, 2u);
}

@end