@interface CAMediaTimingFunction
+ (BOOL)supportsSecureCoding;
+ (CAMediaTimingFunction)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;
+ (CAMediaTimingFunction)functionWithName:(CAMediaTimingFunctionName)name;
+ (void)CAMLParserEndElement:(id)a3 content:(id)a4;
- (CAMediaTimingFunction)initWithCoder:(id)a3;
- (CAMediaTimingFunction)initWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;
- (Object)CA_copyRenderValue;
- (float)_solveForInput:(float)a3;
- (id)CAMLType;
- (id)description;
- (unint64_t)CA_copyNumericValue:(double *)a3;
- (unint64_t)CA_numericValueCount;
- (void)_getPoints:(double *)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getControlPointAtIndex:(size_t)idx values:(float *)ptr;
@end

@implementation CAMediaTimingFunction

+ (CAMediaTimingFunction)functionWithName:(CAMediaTimingFunctionName)name
{
  if ([(NSString *)name isEqualToString:@"default"])
  {
    unsigned int v4 = 0;
  }
  else if ([(NSString *)name isEqualToString:@"easeInEaseOut"])
  {
    unsigned int v4 = 4;
  }
  else if ([(NSString *)name isEqualToString:@"easeIn"])
  {
    unsigned int v4 = 2;
  }
  else if ([(NSString *)name isEqualToString:@"easeOut"])
  {
    unsigned int v4 = 3;
  }
  else
  {
    if (![(NSString *)name isEqualToString:@"linear"])
    {
      [MEMORY[0x1E4F1CA00] raise:@"CAMediaTimingFunctionInvalid", @"unknown timing function name: %@", name format];
      return 0;
    }
    unsigned int v4 = 1;
  }

  return (CAMediaTimingFunction *)builtin_function(v4);
}

- (void)getControlPointAtIndex:(size_t)idx values:(float *)ptr
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (idx - 1 < 2)
  {
    memset(v11, 0, sizeof(v11));
    [(CAMediaTimingFunction *)self _getPoints:v11];
    _D0 = vcvt_f32_f64((float64x2_t)v11[idx - 1]);
LABEL_7:
    *(float32x2_t *)ptr = _D0;
    return;
  }
  if (idx == 3)
  {
    __asm { FMOV            V0.2S, #1.0 }
    goto LABEL_7;
  }
  if (idx) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"CAMediaTimingFunctionInvalidControlPoint", @"no timing function control point with index: %d", idx);
  }
  else {
    *(void *)ptr = 0;
  }
}

- (float)_solveForInput:(float)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(v6, 0, sizeof(v6));
  [(CAMediaTimingFunction *)self _getPoints:v6];
  return CA::Render::TimingFunction::evaluate((CA::Render::TimingFunction *)v6, v4, a3, 0.00001);
}

- (void)_getPoints:(double *)a3
{
  priv = (float32x2_t *)self->_priv;
  float64x2_t v4 = vcvtq_f64_f32(priv[1]);
  *(float64x2_t *)a3 = vcvtq_f64_f32(*priv);
  *((float64x2_t *)a3 + 1) = v4;
}

- (CAMediaTimingFunction)initWithCoder:(id)a3
{
  [a3 decodeFloatForKey:@"c1x"];
  int v6 = v5;
  [a3 decodeFloatForKey:@"c1y"];
  int v8 = v7;
  [a3 decodeFloatForKey:@"c2x"];
  int v10 = v9;
  [a3 decodeFloatForKey:@"c2y"];
  LODWORD(v11) = LODWORD(v12);
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;

  return [(CAMediaTimingFunction *)self initWithControlPoints:v12 :v13 :v14 :v11];
}

+ (CAMediaTimingFunction)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y
{
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = c1x;
  *(float *)&double v12 = c1y;
  *(float *)&double v13 = c2x;
  *(float *)&double v14 = c2y;
  v15 = (void *)[v10 initWithControlPoints:v11 :v12 :v13 :v14];

  return (CAMediaTimingFunction *)v15;
}

- (CAMediaTimingFunction)initWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y
{
  float v8 = c1y;
  float v9 = c1x;
  uint64_t v10 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  c1x = vabds_f32(1.0, c2y);
  double v11 = (float *)&dword_184999684;
  c1y = 0.001;
  while (vabds_f32(*(v11 - 2), v9) >= 0.001
       || vabds_f32(*(v11 - 1), v8) >= 0.001
       || vabds_f32(*v11, c2x) >= 0.001
       || c1x >= 0.001)
  {
    ++v10;
    v11 += 4;
    if (v10 == 5)
    {
      v17.receiver = self;
      v17.super_class = (Class)CAMediaTimingFunction;
      double v12 = [(CAMediaTimingFunction *)&v17 init];
      if (v12)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        double v14 = (CAMediaTimingFunctionPrivate *)malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
        v12->_priv = v14;
        if (v14)
        {
          *(float *)double v14 = v9;
          *((float *)v14 + 1) = v8;
          *((float *)v14 + 2) = c2x;
          *((float *)v14 + 3) = c2y;
        }
        else
        {

          return 0;
        }
      }
      return v12;
    }
  }

  v15 = builtin_function(v10);

  return (CAMediaTimingFunction *)v15;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, priv);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAMediaTimingFunction;
  [(CAMediaTimingFunction *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  [(CAMediaTimingFunction *)self _getPoints:&v8];
  HIDWORD(v4) = DWORD1(v8);
  *(float *)&double v4 = *(double *)&v8;
  [a3 encodeFloat:@"c1x" forKey:v4];
  HIDWORD(v5) = HIDWORD(v8);
  *(float *)&double v5 = *((double *)&v8 + 1);
  [a3 encodeFloat:@"c1y" forKey:v5];
  HIDWORD(v6) = DWORD1(v9);
  *(float *)&double v6 = *(double *)&v9;
  [a3 encodeFloat:@"c2x" forKey:v6];
  HIDWORD(v7) = HIDWORD(v9);
  *(float *)&double v7 = *((double *)&v9 + 1);
  [a3 encodeFloat:@"c2y" forKey:v7];
}

- (id)description
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v3 = 0u;
  long long v4 = 0u;
  [(CAMediaTimingFunction *)self _getPoints:&v3];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(%g %g; %g %g)", v3, v4);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  [(CAMediaTimingFunction *)self _getPoints:v5];
  CFStringRef v4 = CACreateStringWithDoubleArray((uint64_t)v5, 4uLL, 0.0001);
  [a3 setElementContent:v4];
  CFRelease(v4);
}

- (id)CAMLType
{
  return @"CAMediaTimingFunction";
}

+ (void)CAMLParserEndElement:(id)a3 content:(id)a4
{
  v27[1] = *(CAML **)MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"));
  if ([v5 length])
  {
    unsigned int v6 = [v5 characterAtIndex:0];
    if ((v6 > 0xFF || (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v6 + 60) & 0x400) == 0)
      && (v6 <= 0x2E ? (BOOL v7 = ((1 << v6) & 0x680000000000) == 0) : (BOOL v7 = 1), v7))
    {
      v26 = +[CAMediaTimingFunction functionWithName:v5];
      if (v26)
      {
        [a3 setElementValue:v26];
      }
      else
      {
        [a3 parserError:@"Unknown timing function: %@", v5];
      }
    }
    else
    {
      long long v8 = (const char *)[v5 UTF8String];
      size_t v9 = strlen(v8);
      uint64_t v10 = (CAML *)&v8[v9];
      v27[0] = (CAML *)v8;
      double v11 = x_strtod(v8, v27, &v8[v9]);
      v27[0] = CAML::skip_whitespace(v27[0], v10, v12);
      double v13 = x_strtod((const char *)v27[0], v27, (const char *)v10);
      v27[0] = CAML::skip_whitespace(v27[0], v10, v14);
      double v15 = x_strtod((const char *)v27[0], v27, (const char *)v10);
      v27[0] = CAML::skip_whitespace(v27[0], v10, v16);
      double v17 = x_strtod((const char *)v27[0], v27, (const char *)v10);
      v19 = CAML::skip_whitespace(v27[0], v10, v18);
      v20 = [CAMediaTimingFunction alloc];
      *(float *)&double v11 = v11;
      LODWORD(v21) = LODWORD(v11);
      *(float *)&double v13 = v13;
      LODWORD(v22) = LODWORD(v13);
      *(float *)&double v15 = v15;
      LODWORD(v23) = LODWORD(v15);
      *(float *)&double v17 = v17;
      LODWORD(v24) = LODWORD(v17);
      v25 = [(CAMediaTimingFunction *)v20 initWithControlPoints:v21 :v22 :v23 :v24];
      [a3 setElementValue:v25];

      if (v19 < v10)
      {
        if (*(unsigned char *)v19) {
          [a3 parserWarning:@"Ignoring trailing characters"];
        }
      }
    }
  }
  else
  {
    [a3 parserError:@"No timing function data"];
  }
}

- (unint64_t)CA_copyNumericValue:(double *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  [(CAMediaTimingFunction *)self _getPoints:&v6];
  long long v4 = v7;
  *(_OWORD *)a3 = v6;
  *((_OWORD *)a3 + 1) = v4;
  return 4;
}

- (unint64_t)CA_numericValueCount
{
  return 4;
}

- (Object)CA_copyRenderValue
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  [(CAMediaTimingFunction *)self _getPoints:v4];
  return (Object *)CA::Render::Vector::new_vector((CA::Render::Vector *)4, v4, v2);
}

@end