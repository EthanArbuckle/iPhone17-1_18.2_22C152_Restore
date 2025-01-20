unint64_t sub_376C(unsigned __int8 *a1)
{
  return ((unint64_t)a1[2] << 16) | ((unint64_t)a1[1] << 8) | *a1;
}

unint64_t sub_3788(unsigned __int8 *a1)
{
  return *a1 | ((unint64_t)*(unsigned int *)(a1 + 1) << 8);
}

CGRect sub_3E94(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, -7.0, 0.0);
}

CGRect sub_3EA0(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, 0.0, -7.0);
}

CGRect sub_406C(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, -1.0, -1.0);
}

CGRect sub_43F4(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, -4.5, 0.0);
}

CGRect sub_4400(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, 0.0, -3.5);
}

CGRect sub_440C(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, -5.5, -5.5);
}

float sub_4A2C(void *a1, double a2, double a3)
{
  v6 = (char *)[a1 baseAddress];
  float v7 = 0.0;
  if (a2 >= 0.0 && a3 >= 0.0)
  {
    v8 = v6;
    [a1 region];
    if (a2 + 1.0 <= v9)
    {
      [a1 region];
      if (a3 + 1.0 <= v10)
      {
        unsigned int v11 = [a1 format];
        double v12 = 4.0;
        if (v11 == kCIFormatRf)
        {
          int v13 = 0;
        }
        else
        {
          if (v11 == kCIFormatRGBAf)
          {
            int v13 = 0;
            char v14 = 1;
            double v12 = 16.0;
            goto LABEL_16;
          }
          if (v11 == kCIFormatR8)
          {
            int v13 = 1;
            double v12 = 1.0;
          }
          else
          {
            if (v11 == kCIFormatRGBAh)
            {
              int v13 = 0;
              char v14 = 0;
              double v12 = 8.0;
              goto LABEL_16;
            }
            if (v11 != kCIFormatRGBA8) {
              abort();
            }
            int v13 = 1;
          }
        }
        char v14 = 1;
LABEL_16:
        double v15 = floor(a2) * v12 + floor(a3) * (double)(unint64_t)[a1 bytesPerRow] + 0.0;
        v16 = &v8[(unint64_t)v15];
        if (v13)
        {
          LOBYTE(v15) = *v16;
          return (double)*(unint64_t *)&v15 / 255.0;
        }
        else if (v14)
        {
          return *(float *)v16;
        }
        else
        {
          float v20 = 0.0;
          src.data = &v8[(unint64_t)v15];
          *(int64x2_t *)&src.height = vdupq_n_s64(1uLL);
          src.rowBytes = 2;
          dest.data = &v20;
          *(_OWORD *)&dest.height = *(_OWORD *)&src.height;
          dest.rowBytes = 4;
          vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
          if (v20 == 1.0) {
            return 0.0;
          }
          else {
            return v20;
          }
        }
      }
    }
  }
  return v7;
}

void sub_4CC4(id a1)
{
  qword_8C8D8 = (uint64_t)+[CIKernel PFKernelWithString:&cfstr_KernelVec4PfPi];
}

void sub_4ED4(id a1)
{
  qword_8C8E8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_transitionDepths(__sample edges,__sample depthLo) { float v = float((edges.r) > 0.5)*depthLo.r; return vec4(v,v,v,1.0); }"];
}

void sub_52C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double sub_52EC(uint64_t a1)
{
  return *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
}

void sub_57B0(id a1)
{
  qword_8C8F8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_renormalize01(__sample a,__sample b) { float zmin = b.r; float zmax = b.g; float v = (a.r - zmin)/(zmax-zmin); return vec4(v,v,v,1.0); }"];
}

void sub_5828(id a1)
{
  qword_8C908 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_featherBand(__sample image,__sample threshold,__sample mm,vec3 params) { \n  float zMin = mm.r;\n  float zMax = mm.g;\n  float zRange = zMax - zMin;\n  float lowerBandOffset  = -params.y * zRange;\n  float upperBandOffset  = -params.x * zRange;\n  float featherBandRange =  params.z * zRange;\n  float bandRange = upperBandOffset - lowerBandOffset;\n  float bandCenter = threshold.r + lowerBandOffset + bandRange / 2.0;\n  float band = abs(image.r - bandCenter) - bandRange / 2.0;\n  band = 1.0 - smoothstep(0.0, featherBandRange, band);\n   return vec4(band,band,band,1.0);\n }"];
}

void sub_58A0(id a1)
{
  qword_8C918 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_protectInterior(__sample C,__sample band) { \n   float v = max(min(C.r - band.r * 0.5,0.999),1e-4);\n   return vec4(v,v,v,1.0);\n }"];
}

void sub_5918(id a1)
{
  qword_8C928 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_invertImage(__sample a) { float v = 1.0 - a.r; return vec4(v,v,v,1.0); }"];
}

void sub_5990(id a1)
{
  qword_8C938 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_normalizeToPhysicalDepth(__sample threshold,__sample mm,float thresholdOffset) { float v = threshold.r + thresholdOffset *(1.0 -threshold.r)/(mm.g-mm.r);  return vec4(v,v,v,1.0); }\n"];
}

void sub_5A08(id a1)
{
  qword_8C948 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_foreground(__sample mask,__sample threshold) { float v = (mask.r < threshold.r) ? mask.r : 0.0; return vec4(v,v,v,1.0); }\n"];
}

void sub_5A80(id a1)
{
  qword_8C958 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_filterCut(__sample mask,__sample threshold,float filterCut) {\n  float v = min(1.0, mask.r * filterCut / threshold.r);\n  return vec4(v,v,v,1.0); }\n"];
}

void sub_5AF8(id a1)
{
  qword_8C968 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_bb3Mono(sampler a) { \n   float r = 0.0;\n   vec2 dc = destCoord();\n   r += sample(a,samplerTransform(a, dc + vec2(-1.0, -1.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2(-1.0,  0.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2(-1.0,  1.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2( 0.0, -1.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2( 0.0,  0.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2( 0.0,  1.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2( 1.0, -1.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2( 1.0,  0.0))).r;\n   r += sample(a,samplerTransform(a, dc + vec2( 1.0,  1.0))).r;\n   r *= 0.111111111;\n   return vec4(r,r,r,1.0);\n}\n"];
}

void sub_5B70(id a1)
{
  qword_8C978 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_denormalize(__sample image, __sample minMaxImage)\n{\n    float v = image.r;\n    float maxV = minMaxImage.g;\n    float minV = minMaxImage.r;\n    v = v * (maxV - minV) + minV;\n    return vec4(v,v,v,1.0);\n}\n"];
}

void sub_5BE8(id a1)
{
  qword_8C988 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_confidenceConvertToHalfFloat (__sample c) __attribute__((outputFormat(kCIFormatRGBAh))) {\n  return c;\n}"];
}

void sub_5C60(id a1)
{
  qword_8C998 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_renormalizeThreshold(__sample threshold,__sample disparityMinMax) { \n  float minV = disparityMinMax.x; \n  float maxV = disparityMinMax.y; \n  float range = maxV - minV; \n  float absoluteThreshold = threshold.r; \n  float v = (absoluteThreshold - minV) / max(0.0001,range); \n  return vec4(v,v,v,1.0); \n} \n"];
}

void sub_6634(id a1)
{
  qword_8C9A8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_confidenceExtractRed (__sample c) __attribute__((outputFormat(kCIFormatRh))) {\n  return vec4(c.r, 0.0, 0.0, 1.0);\n}"];
}

CGRect sub_6C64(id a1, int a2, CGRect a3)
{
  return CGRectInset(a3, -1.0, -1.0);
}

CGRect sub_6C70(id a1, int a2, CGRect a3)
{
  double v3 = -7.0;
  if (a2) {
    double v3 = -1.0;
  }
  return CGRectInset(a3, -1.0, v3);
}

void sub_6CBC(id a1)
{
  qword_8C9B8 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_boxBlur3_7_H(sampler image)\n{\n\n    vec2 dc = destCoord();\n\n    float c =  sample(image, samplerTransform(image, dc + vec2(-7.0, 0.0))).r * 0.0005;\n         c += sample(image, samplerTransform(image, dc + vec2(-6.0, 0.0))).r * 0.0032;\n         c += sample(image, samplerTransform(image, dc + vec2(-5.0, 0.0))).r * 0.0128;\n         c += sample(image, samplerTransform(image, dc + vec2(-4.0, 0.0))).r * 0.0352;\n         c += sample(image, samplerTransform(image, dc + vec2(-3.0, 0.0))).r * 0.0736;\n         c += sample(image, samplerTransform(image, dc + vec2(-2.0, 0.0))).r * 0.1216;\n         c += sample(image, samplerTransform(image, dc + vec2(-1.0, 0.0))).r * 0.1632;\n         c += sample(image, samplerTransform(image, dc + vec2( 0.0, 0.0))).r * 0.1797;\n         c += sample(image, samplerTransform(image, dc + vec2( 1.0, 0.0))).r * 0.1632;\n         c += sample(image, samplerTransform(image, dc + vec2( 2.0, 0.0))).r * 0.1216;\n         c += sample(image, samplerTransform(image, dc + vec2( 3.0, 0.0))).r * 0.0736;\n         c += sample(image, samplerTransform(image, dc + vec2( 4.0, 0.0))).r * 0.0352;\n         c += sample(image, samplerTransform(image, dc + vec2( 5.0, 0.0))).r * 0.0128;\n         c += sample(image, samplerTransform(image, dc + vec2( 6.0, 0.0))).r * 0.0032;\n         c += sample(image, samplerTransform(image, dc + vec2( 7.0, 0.0))).r * 0.0005;\n        \n    return vec4(c,c,c,1.0);\n}\n"];
}

void sub_6CF0(id a1)
{
  qword_8C9C8 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_boxBlur3_7_V(sampler image)\n{\n\n    vec2 dc = destCoord();\n\n    float c =  sample(image, samplerTransform(image, dc + vec2(0.0, -7.0))).r * 0.0005;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0,-6.0))).r * 0.0032;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0,-5.0))).r * 0.0128;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0,-4.0))).r * 0.0352;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0,-3.0))).r * 0.0736;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0,-2.0))).r * 0.1216;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0,-1.0))).r * 0.1632;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 0.0))).r * 0.1797;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 1.0))).r * 0.1632;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 2.0))).r * 0.1216;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 3.0))).r * 0.0736;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 4.0))).r * 0.0352;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 5.0))).r * 0.0128;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 6.0))).r * 0.0032;\n         c += sample(image, samplerTransform(image, dc + vec2(0.0, 7.0))).r * 0.0005;\n        \n    return vec4(c,c,c,1.0);\n}\n"];
}

void sub_6D24(id a1)
{
  qword_8C9D8 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_sobelHV(sampler image)        {\n            vec2 dc = destCoord();\n    float c0 = sample(image, samplerTransform(image, dc + vec2(-1.0,1.0))).r;\n    float c1 = sample(image, samplerTransform(image, dc + vec2( 0.0,1.0))).r;\n    float c2 = sample(image, samplerTransform(image, dc + vec2( 1.0,1.0))).r;\n    float c3 = sample(image, samplerTransform(image, dc + vec2(-1.0,0.0))).r;\n    float c5 = sample(image, samplerTransform(image, dc + vec2( 1.0,0.0))).r;\n    float c6 = sample(image, samplerTransform(image, dc + vec2(-1.0,-1.0))).r;\n    float c7 = sample(image, samplerTransform(image, dc + vec2( 0.0,-1.0))).r;\n    float c8 = sample(image, samplerTransform(image, dc + vec2( 1.0,-1.0))).r;\n    float h = abs((c0 + 2.0 * c1 + c2) - (c6 + 2.0 * c7 + c8));\n    float v = abs((c0 + 2.0 * c3 + c6) - (c2 + 2.0 * c5 + c8));\n    float total = (h + v);\n    return vec4(total, total, total, 1.0);\n}\n"];
}

void sub_6D58(id a1)
{
  qword_8C9E8 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_h9(sampler a)  { \n   float m = 0.0;\n   vec2 dc = destCoord();\n   for (int i = -4; i <= 4; i++) {\n      m = max(m, sample(a,samplerTransform(a, dc + vec2(float(i), 0.0))).r);\n   }\n   return vec4(m,m,m,1.0);\n}\n"];
}

void sub_6D8C(id a1)
{
  qword_8C9F8 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_v7(sampler a)  { \n   float m = 0.0;\n   vec2 dc = destCoord();\n   for (int i = -3; i <= 3; i++) {\n      m = max(m, sample(a,samplerTransform(a, dc + vec2(float(i), 0.0))).r);\n   }\n   return vec4(m,m,m,1.0);\n}\n"];
}

void sub_6DC0(id a1)
{
  qword_8CA08 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_dilateRem(sampler a,sampler o) { \n   float m = sample(a, samplerCoord(a)).r;\n   vec2 dc = destCoord();\n   for (int i = -3; i<= 3; i++) {\n      m = max(m, sample(o,samplerTransform(o, dc + vec2(float(i), 4.0))).r);\n   }\n   for (int i = -3; i<= 3; i++) {\n      m = max(m, sample(o,samplerTransform(o, dc + vec2(float(i), -4.0))).r);\n   }\n   m = max(m, sample(o,samplerTransform(o, dc + vec2( 0.0, 5.0))).r);\n   m = max(m, sample(o,samplerTransform(o, dc + vec2( 0.0,-5.0))).r);\n   m = max(m, sample(o,samplerTransform(o, dc + vec2( 5.0, 0.0))).r);\n   m = max(m, sample(o,samplerTransform(o, dc + vec2(-5.0, 0.0))).r);\n   return vec4(m,m,m,1.0);\n}\n"];
}

void sub_6DF4(id a1)
{
  qword_8CA18 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_sobelHVGeoMean(sampler image)        {\n            vec2 dc = destCoord();\n    float c0 = sample(image, samplerTransform(image, dc + vec2(-1.0,1.0))).r;\n    float c1 = sample(image, samplerTransform(image, dc + vec2( 0.0,1.0))).r;\n    float c2 = sample(image, samplerTransform(image, dc + vec2( 1.0,1.0))).r;\n    float c3 = sample(image, samplerTransform(image, dc + vec2(-1.0,0.0))).r;\n    float c5 = sample(image, samplerTransform(image, dc + vec2( 1.0,0.0))).r;\n    float c6 = sample(image, samplerTransform(image, dc + vec2(-1.0,-1.0))).r;\n    float c7 = sample(image, samplerTransform(image, dc + vec2( 0.0,-1.0))).r;\n    float c8 = sample(image, samplerTransform(image, dc + vec2( 1.0,-1.0))).r;\n    float h = (c0 + 2.0 * c1 + c2) - (c6 + 2.0 * c7 + c8);\n    float v = (c0 + 2.0 * c3 + c6) - (c2 + 2.0 * c5 + c8);\n    float total = sqrt(max(0.0000001,h*h + v*v));\n    return vec4(total, total, total, 1.0);\n}\n"];
}

void sub_6E28(id a1)
{
  qword_8CA28 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_invertImages(__sample c) { float v = c.r; v = 1.0 - min(1.0,v); v = max(min(v,1.0),0.0001); return vec4(v,v,v,1.0); }"];
}

void sub_6E5C(id a1)
{
  qword_8CA38 = (uint64_t)+[CIKernel PFKernelWithString:@"kernel vec4 _pf_dilateDisparityEdgeDetectLuminance(sampler image, vec2 ninj,sampler lumImage){\n    float m = 0.0, n = 0.0;\n    vec2 dc = destCoord();\n    \n    int i;\n    for (i = -int(ninj.x); i <= int(ninj.x); i++) {\n        float v = sample(image, samplerTransform(image, dc + vec2(float(i),0.0))).r;\n        n = max(v,n);\n    }\n    for (i = -int(ninj.y); i <= int(ninj.y); i++) {\n        float v = sample(image, samplerTransform(image, dc + vec2(0.0,float(i)))).r;\n        m = max(v,m);\n    }\n    float r = m + n;\n    float c0 = sample(lumImage, samplerTransform(lumImage, dc + vec2(-1.0,1.0))).r;\n    float c1 = sample(lumImage, samplerTransform(lumImage, dc + vec2( 0.0,1.0))).r;\n    float c2 = sample(lumImage, samplerTransform(lumImage, dc + vec2( 1.0,1.0))).r;\n    float c3 = sample(lumImage, samplerTransform(lumImage, dc + vec2(-1.0,0.0))).r;\n    float c5 = sample(lumImage, samplerTransform(lumImage, dc + vec2( 1.0,0.0))).r;\n    float c6 = sample(lumImage, samplerTransform(lumImage, dc + vec2(-1.0,-1.0))).r;\n    float c7 = sample(lumImage, samplerTransform(lumImage, dc + vec2( 0.0,-1.0))).r;\n    float c8 = sample(lumImage, samplerTransform(lumImage, dc + vec2( 1.0,-1.0))).r;\n    float h = abs((c0 + 2.0 * c1 + c2) - (c6 + 2.0 * c7 + c8));\n    float v = abs((c0 + 2.0 * c3 + c6) - (c2 + 2.0 * c5 + c8));\n    float total = h + v;\n    float result = max(total, r);\n    return vec4(result,result,result,1.0);\n}\n\n"];
}

CVPixelBufferRef sub_9BB4(void *a1, double a2, double a3, double a4, double a5)
{
  unsigned int v8 = [a1 format];
  CIFormat v9 = kCIFormatRf;
  unsigned int v10 = [a1 format];
  if (v8 == v9)
  {
    if (v10 != v8) {
      sub_4BB4C();
    }
    [a1 region];
    int v12 = (int)-v11;
    [a1 region];
    int v14 = (int)-v13;
    size_t v15 = (size_t)[a1 bytesPerRow];
    v16 = (char *)[a1 baseAddress] + 4 * v12 + v15 * v14;
    return sub_9DB8((unint64_t)a4, (unint64_t)a5, v15, v16);
  }
  else
  {
    if (v10 != kCIFormatRh) {
      return 0;
    }
    if ([a1 format] != v10) {
      sub_4BB78();
    }
    v18 = (char *)[a1 baseAddress];
    [a1 region];
    vImagePixelCount v20 = (unint64_t)v19;
    [a1 region];
    vImagePixelCount v22 = (unint64_t)v21;
    size_t v23 = (size_t)[a1 bytesPerRow];
    [a1 region];
    int v25 = (int)-v24;
    [a1 region];
    v27 = &v18[2 * v25 + v23 * (int)-v26];
    v28 = malloc_type_malloc(4 * (unint64_t)a4 * (unint64_t)a5, 0x100004052888210uLL);
    src.data = v27;
    src.height = v22;
    src.width = v20;
    src.rowBytes = v23;
    v30.data = v28;
    v30.height = (unint64_t)a5;
    v30.width = (unint64_t)a4;
    v30.rowBytes = 4 * (unint64_t)a4;
    vImageConvert_Planar16FtoPlanarF(&src, &v30, 0);
    CVPixelBufferRef v29 = sub_9DB8((unint64_t)a4, (unint64_t)a5, 4 * (unint64_t)a4, (char *)v28);
    free(v28);
    return v29;
  }
}

CVPixelBufferRef sub_9DB8(size_t a1, size_t a2, size_t a3, char *a4)
{
  v18[0] = &__NSDictionary0__struct;
  v17[0] = kCVPixelBufferIOSurfacePropertiesKey;
  v17[1] = kCVPixelBufferPixelFormatTypeKey;
  v18[1] = +[NSNumber numberWithUnsignedInt:1278226534];
  CVPixelBufferRef pixelBuffer = 0;
  CVReturn v8 = CVPixelBufferCreate(0, a1, a2, 0x4C303066u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2], &pixelBuffer);
  CVPixelBufferRef result = 0;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_14;
    }
    if (CVPixelBufferLockBaseAddress(pixelBuffer, 0)) {
      goto LABEL_17;
    }
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (BytesPerRow == a3)
    {
      memcpy(BaseAddress, a4, a3 * a2);
    }
    else if (BytesPerRow >= a3)
    {
      NSLog(@"Can't work with an image where there are more bytes in the source than in the destination.");
      CVPixelBufferRelease(pixelBuffer);
      CVPixelBufferRef pixelBuffer = 0;
    }
    else
    {
      size_t v12 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      if (a2)
      {
        size_t v13 = v12;
        size_t v14 = 0;
        unsigned int v15 = 1;
        do
        {
          memcpy(&BaseAddress[v14 * v13], &a4[v14 * a3], v13);
          size_t v14 = v15++;
        }
        while (v14 < a2);
      }
    }
    if (CVPixelBufferUnlockBaseAddress(pixelBuffer, 0))
    {
LABEL_17:
      CVPixelBufferRelease(pixelBuffer);
      CVPixelBufferRef pixelBuffer = 0;
    }
    else
    {
LABEL_14:
      if (pixelBuffer && CVPixelBufferGetPixelFormatType(pixelBuffer) == 1278226534) {
        return pixelBuffer;
      }
    }
    sub_4BBA4();
  }
  return result;
}

int sub_A914(id a1, NSDictionary *a2)
{
  if (qword_8CA50 != -1) {
    dispatch_once(&qword_8CA50, &stru_74D08);
  }
  unsigned int v3 = objc_msgSend(-[NSDictionary valueForKey:](a2, "valueForKey:", @"kContextInfoIsSoftware"), "BOOLValue");
  return (v3 ^ 1) & byte_8CA48;
}

void sub_A980(id a1)
{
  id v1 = MTLCreateSystemDefaultDevice();
  if (v1)
  {
    byte_8CA48 = 1;
    CFRelease(v1);
  }
}

void sub_AE10(id a1)
{
  qword_8CA58 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_kickLightKernel_pos(__sample im, vec2 xy1, vec4 abc1, vec2 xy2, vec4 abc2, vec2 xy3, vec4 abc3, vec2 xy4, vec4 abc4, float str) \n{ \n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n    dx = xy2.x-destCoord().x ; \n    dy = xy2.y-destCoord().y ; \n    float g = exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy)); \n    dx = xy3.x-destCoord().x ; \n    dy = xy3.y-destCoord().y ; \n    float ss = exp(-(abc3.r*dx*dx +2.0*abc3.g*dx*dy +abc3.b*dy*dy)); \n    dx = xy4.x-destCoord().x ; \n    dy = xy4.y-destCoord().y ; \n    float gg = exp(-(abc4.r*dx*dx +2.0*abc4.g*dx*dy +abc4.b*dy*dy)); \n    vec3 orig = im.rgb; \n    vec3 neg = min(im.rgb, 0.0); \n    vec3 pos = max(im.rgb, 1.0)-1.0; \n    im.rgb = clamp(im.rgb, 0.0, 1.0); \n    vec3 m = 1.0-im.rgb; \n    float a = 0.6; \n    vec4 CVPixelBufferRef result = im; \n    result.rgb = 1.0 - (pow(m, vec3(str))+a*( ((str-1.0)*m*(1.0-m*m))/(str*str))); \n    im.rgb = pow(im.rgb, vec3(1.0-((min(str, 2.95)-1.0)/2.6))); \n    result.rgb = mix(im.rgb, result.rgb, .85); \n    result.rgb = mix(orig, result.rgb+neg+pos, (s+g+ss+gg)); \n    return result; \n}"];
}

void sub_AE88(id a1)
{
  qword_8CA68 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_kickLightKernel_neg(__sample im, vec2 xy1, vec4 abc1, vec2 xy2, vec4 abc2, vec2 xy3, vec4 abc3, vec2 xy4, vec4 abc4, float str) \n{ \n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n    dx = xy2.x-destCoord().x ; \n    dy = xy2.y-destCoord().y ; \n    float g = exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy)); \n    dx = xy3.x-destCoord().x ; \n    dy = xy3.y-destCoord().y ; \n    float ss = exp(-(abc3.r*dx*dx +2.0*abc3.g*dx*dy +abc3.b*dy*dy)); \n    dx = xy4.x-destCoord().x ; \n    dy = xy4.y-destCoord().y ; \n    float gg = exp(-(abc4.r*dx*dx +2.0*abc4.g*dx*dy +abc4.b*dy*dy)); \n    vec3 neg = min(im.rgb, 0.0); \n    vec3 pos = max(im.rgb, 1.0)-1.0; \n    im.rgb = clamp(im.rgb, 0.0, 1.0); \n    vec4 orig = im; \n    float lum = max(max(im.r, im.g), im.b); \n    vec3 gamma = compare(vec3(lum)-.001, vec3(0.0), pow(im.rgb, vec3(1.0-str*min(s+g+ss+gg, 1.0)))); \n    im.rgb = mix(gamma, mix(orig.rgb, orig.rgb*lum, -str*min(s+g+ss+gg, 1.0)), 0.3) ;\n    im.rgb = mix(orig.rgb, im.rgb, 4.0*lum*(1.0-lum)) + pos + neg; \n    return im; \n}"];
}

void sub_BB34(id a1)
{
  qword_8CA78 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_dualLightKernel(__sample im, vec2 xy1, vec4 abc1, vec2 xy2, vec4 abc2, vec3 mcb) \n{ \n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n    dx = xy2.x-destCoord().x ; \n    dy = xy2.y-destCoord().y ; \n    float g = exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy)); \n    float contrast = .1*mcb.g*g; \n    vec3 neg = min(im.rgb, 0.0); \n    vec3 pos = max(im.rgb, 1.0)-1.0; \n    im.rgb = clamp(im.rgb, 0.0, 1.0); \n    vec3 orig = im.rgb; \n    float lum = (dot(im.rgb, vec3(.333333))); \n    float y = sqrt(lum); \n    vec3 light = vec3((1.0-y)*g-mcb.b*.4*(1.0-lum)*s); \n    float yy = compare(light.r, pow(lum, 1.0+abc1.a*light.r), pow(lum, 1.0+abc2.a*light.r)); \n    yy = mix(yy, 0.5, -(y*(1.0-y))*contrast); \n    im.rgb = lum > 0.0 ? im.rgb*yy/lum : vec3(0.0); \n    im.rgb = mix(orig.rgb, im.rgb, mcb.r) + pos + neg; \n    return im; \n}"];
}

void sub_C398(id a1)
{
  qword_8CA88 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_strobeKernel(__sample im, vec2 xy1, vec4 abc1, float str) \n{ \n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n    vec3 orig = im.rgb; \n    float lum = (dot(im.rgb, vec3(.333333))); \n    float y = sqrt(lum); \n    vec3 light = vec3(.4*(1.0-lum)*s); \n    float yy = pow(lum, 1.0-abc1.a*light.r); \n    im.rgb = lum > 0.0 ? im.rgb*yy/lum : vec3(0.0); \n    im.rgb = mix(orig.rgb, im.rgb, str); \n    return im; \n}"];
}

void sub_CA14(id a1)
{
  qword_8CA98 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_contourExtractRed (__sample c) __attribute__((outputFormat(kCIFormatRh))) {\n  return vec4(c.r, 0.0, 0.0, 1.0);\n}"];
}

void sub_CA8C(id a1)
{
  qword_8CAA8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_contourLightKernel (__sample back, __sample fore, vec4 xy1, vec4 abc1, vec4 eyes, float str, float radius)\n{\n    fore = vec4(fore.r, fore.r, fore.r, 1.0);\n    fore = max(fore, 0.0); \n    vec3 neg = min(back.rgb, 0.0); \n    vec3 pos = max(back.rgb, 1.0)-1.0; \n    back = clamp(back, 0.0, 1.0); \n    vec4 DCb = compare(0.25 - back, sqrt(back), ((16.0 * back - 12.0) * back + 4.0) * back);\n    vec4 B  = back + (2.0 * fore - 1.0) * compare(0.5 - fore, DCb - back, back * (1.0 - back));\n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = str*exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n    dx = eyes.x-destCoord().x ;\n    dy = eyes.y-destCoord().y ;\n    float le = .8*str*exp(-(dx*dx + dy*dy)/(2.0*radius)); \n    dx = eyes.z-destCoord().x ;\n    dy = eyes.w-destCoord().y ;\n    float re = .8*str*exp(-(dx*dx + dy*dy)/(2.0*radius)); \n    dx = xy1.z-destCoord().x ;\n    dy = xy1.w-destCoord().y ;\n    float chin = .5*str*exp(-(dx*dx + dy*dy)/(1.0*radius)); \n    B = mix(pow(B, vec4(1.6)), B, smoothstep(0.1, .7, fore.r+chin)) ;\n    vec4 im = back; \n    im.rgb = mix(im.rgb, B.rgb, smoothstep(0.0,0.75,(s - re -le +chin))) + pos + neg; \n    return im; \n}"];
}

void sub_D1E8(id a1)
{
  qword_8CAB8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_portraitSpotKernel (__sample c, vec4 xy1, vec4 abc1, vec2 darken)\n{\n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n  vec3 orig = c.rgb; \n  vec3 neg = min(c.rgb, 0.0); \n  vec3 pos = max(c.rgb, 1.0)-1.0; \n  c.rgb = clamp(c.rgb, 0.0, 1.0); \n  vec3 m = 1.0-c.rgb; \n  float a = 0.6; \n  vec4 CVPixelBufferRef result = c; \n  float gamma = abc1.w; \n  result.rgb = 1.0 - (pow(m, vec3(gamma))+a*( ((gamma-1.0)*m*(1.0-m*m))/(gamma*gamma))); \n  c.rgb = pow(c.rgb, vec3(1.0-((min(gamma, 2.95)-1.0)/2.6))); \n  result.rgb = darken.g*mix(c.rgb, result.rgb, .85); \n  result.rgb = mix(darken.r*orig, result.rgb+neg+pos, s); \n  return result; \n}"];
}

void sub_D85C(id a1)
{
  qword_8CAC8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_neckContour(__sample im, vec4 xy1, vec4 abc1, vec4 abc2, float str) \n{ \n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = -smoothstep(0.0, .1, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n    dx = xy1.z-destCoord().x ; \n    dy = xy1.w-destCoord().y ; \n    float ss = smoothstep(0.0, .1, exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy))) ; \n    s = clamp(ss+s, 0.0, 1.0); \n    im.rgb = mix(im.rgb, .85*im.rgb, str*s); \n    im.rgb = mix(im.rgb, im.rgb*im.rgb, .6*str*s); \n    return im; \n}"];
}

void sub_E0A8(id a1)
{
  qword_8CAD8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_contourExtractRedStudio (__sample c) __attribute__((outputFormat(kCIFormatRh))) {\n  return vec4(c.r, 0.0, 0.0, 1.0);\n}"];
}

void sub_E120(id a1)
{
  qword_8CAE8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_studioLightKernel (__sample back, __sample fore, vec4 xy1, vec4 abc1, vec4 eyes, float str, float radius)\n {\n fore = vec4(fore.r, fore.r, fore.r, 1.0);\n fore = max(fore, 0.0); \n fore = pow(fore, vec4(.65)); \n vec3 neg = min(back.rgb, 0.0); \n vec3 pos = max(back.rgb, 1.0)-1.0; \n back = clamp(back, 0.0, 1.0); \n vec4 DCb = compare(0.25 - back, sqrt(back), ((16.0 * back - 12.0) * back + 4.0) * back);\n vec4 B = back + (2.0 * fore - 1.0) * compare(0.5 - fore, DCb - back, back * (1.0 - back));\n float dx = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = str*exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n dx = eyes.x-destCoord().x ;\n dy = eyes.y-destCoord().y ;\n float le = .8*str*exp(-(dx*dx + dy*dy)/(2.0*radius)); \n dx = eyes.z-destCoord().x ;\n dy = eyes.w-destCoord().y ;\n float re = .8*str*exp(-(dx*dx + dy*dy)/(2.0*radius)); \n dx = xy1.z-destCoord().x ;\n dy = xy1.w-destCoord().y ;\n float chin = .5*str*exp(-(dx*dx + dy*dy)/(1.0*radius)); \n B = mix(pow(B, vec4(1.6)), B, smoothstep(0.1, .7, fore.r+chin)) ;\n vec4 im = back; \n im.rgb = mix(im.rgb, B.rgb, smoothstep(0.0,0.75,(s - re -le +chin))) + pos + neg; \n return im; \n }"];
}

void sub_E198(id a1)
{
  qword_8CAF8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_cheapEdgePreserveStudio (__sample i, __sample b) \n { \n float d = 1.0*distance(i.rgb, b.rgb); b = mix(b, i, d); \n return b; \n }"];
}

void sub_E8C8(id a1)
{
  qword_8CB08 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_strobeKernelV2(__sample im, vec2 xy1, vec4 abc1, float str) \n{ \n    float dx = xy1.x-destCoord().x ; \n    float dy = xy1.y-destCoord().y ; \n    float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n    vec3 orig = im.rgb; \n    float lum = (dot(im.rgb, vec3(.333333))); \n    float y = sqrt(lum); \n    vec3 light = vec3(.4*(1.0-lum)*s); \n    float yy = pow(lum, 1.0-abc1.a*light.r); \n    im.rgb = lum > 0.0 ? im.rgb*yy/lum : vec3(0.0); \n    im.rgb = mix(orig.rgb, im.rgb, str*lum); \n    return im; \n}"];
}

void sub_EE90(id a1)
{
  qword_8CB18 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_contourExtractRedV2 (__sample c) __attribute__((outputFormat(kCIFormatRh))) {\n return vec4(c.r, 0.0, 0.0, 1.0);\n }"];
}

void sub_EF08(id a1)
{
  qword_8CB28 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_contourLightKernelV2 (__sample back, __sample fore, vec4 xy1, vec4 abc1, vec4 eyes, float str, float radius)\n {\n fore.r = pow(fore.r, .85); \n fore = vec4(fore.r, fore.r, fore.r, 1.0);\n fore = max(fore, 0.0); \n vec3 neg = min(back.rgb, 0.0); \n vec3 pos = max(back.rgb, 1.0)-1.0; \n back = clamp(back, 0.0, 1.0); \n vec4 DCb = compare(0.25 - back, sqrt(back), ((16.0 * back - 12.0) * back + 4.0) * back);\n vec4 B = back + (2.0 * fore - 1.0) * compare(0.5 - fore, DCb - back, back * (1.0 - back));\n float dx = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = str*exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n dx = eyes.x-destCoord().x ;\n dy = eyes.y-destCoord().y ;\n float le = .8*str*exp(-(dx*dx + dy*dy)/(2.0*radius)); \n dx = eyes.z-destCoord().x ;\n dy = eyes.w-destCoord().y ;\n float re = .8*str*exp(-(dx*dx + dy*dy)/(2.0*radius)); \n dx = xy1.z-destCoord().x ;\n dy = xy1.w-destCoord().y ;\n float chin = .5*str*exp(-(dx*dx + dy*dy)/(1.0*radius)); \n B = mix(pow(B, vec4(1.6)), B, smoothstep(0.1, .7, fore.r+chin)) ;\n vec4 im = back; \n im.rgb = mix(im.rgb, B.rgb, pow(fore.r, 0.35)*smoothstep(0.0,0.75,(s - re -le +chin))); \n im.rgb = mix(back.rgb, im.rgb, pow(fore.r, .15)) + pos + neg; \n return im; \n }"];
}

void sub_EF80(id a1)
{
  qword_8CB38 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_cheapEdgePreserveContourV2 (__sample i, __sample b) \n { \n float d = 1.25*distance(i.rgb, b.rgb); b = mix(b, i, d); \n return b; \n }"];
}

void sub_F580(id a1)
{
  qword_8CB48 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceContourMask(__sample im, vec4 xy1, vec4 abc1, vec4 abc2) \n { \n float dx = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = 1.75*exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n float g = exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy)); \n g = clamp(g-s, 0.0, 1.0); \n g = smoothstep(0.0, 0.18, g); \n return vec4(g,g,g,1.0); \n }"];
}

void sub_F5F8(id a1)
{
  qword_8CB58 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_darkenContour(__sample im, float str) \n { \n im = clamp(im, 0.0, 1.0); \n vec4 im2 = 1.0 - sqrt(1.0-im*im); \n float y = dot(im.rgb, vec3(.333333)); \n float y2 = 1.0 - sqrt(1.0-y*y); \n vec4 im3 = (y>0) ? im*y2/y : vec4(0.0, 0.0, 0.0, 1.0) ; \n float s = im.r + im.g + im.b - y; \n im3 = mix(im2, im3, s); \n im3 = mix(im, im3, str); \n return vec4(im3.rgb, 1.0); \n }"];
}

void sub_FC78(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.PortraitFilters"];
  if (!v1) {
    sub_4BCD8();
  }
  v2 = [(NSBundle *)v1 URLForResource:@"portrait_filters" withExtension:@"metallib"];
  if (!v2) {
    sub_4BD04();
  }
  qword_8CB68 = +[NSData dataWithContentsOfURL:v2];
  if (!qword_8CB68) {
    sub_4BD30();
  }
}

int sub_FCE8(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C778);

  return [AssociatedObject intValue];
}

void sub_FD18(NSDictionary *self, SEL a2, int a3)
{
  v4 = +[NSNumber numberWithInt:*(void *)&a3];

  objc_setAssociatedObject(self, off_8C778, v4, (char *)&dword_0 + 1);
}

float sub_FD68(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C780);

  [AssociatedObject floatValue];
  return result;
}

void sub_FD98(NSDictionary *self, SEL a2, float a3)
{
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, off_8C780, v4, (char *)&dword_0 + 1);
}

float sub_FDE8(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C788);

  [AssociatedObject floatValue];
  return result;
}

void sub_FE18(NSDictionary *self, SEL a2, float a3)
{
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, off_8C788, v4, (char *)&dword_0 + 1);
}

CGRect sub_FE68(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C790);

  [AssociatedObject rectValue];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void sub_FE98(NSDictionary *self, SEL a2, CGRect a3)
{
  double v4 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  objc_setAssociatedObject(self, off_8C790, v4, (char *)&dword_0 + 1);
}

uint64_t sub_10770(void *a1, uint64_t a2, CGRect *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CGRectGetWidth(*a3);
  unint64_t Height = (unint64_t)CGRectGetHeight(*a3);
  Alignedsize_t BytesPerRow = CGBitmapGetAlignedBytesPerRow();
  id v12 = [objc_alloc((Class)NSMutableData) initWithLength:AlignedBytesPerRow * Height];
  id v13 = [v12 mutableBytes];
  size_t Width = (unint64_t)CGRectGetWidth(*a3);
  CGFloat v15 = CGRectGetHeight(*a3);
  v16 = CGBitmapContextCreate(v13, Width, (unint64_t)v15, 8uLL, AlignedBytesPerRow, 0, 7u);
  CGContextTranslateCTM(v16, -a3->origin.x, -a3->origin.y);
  CGContextSetRGBFillColor(v16, 1.0, 1.0, 1.0, 1.0);
  CGContextSetRGBStrokeColor(v16, 1.0, 1.0, 1.0, 1.0);
  CGContextSetLineWidth(v16, 1.0);
  CGContextAddPath(v16, (CGPathRef)objc_msgSend(objc_msgSend(a1, "eyebrowRightTopLine"), "boundsPath"));
  CGContextAddPath(v16, (CGPathRef)objc_msgSend(objc_msgSend(a1, "eyebrowLeftTopLine"), "boundsPath"));
  CGContextAddPath(v16, (CGPathRef)[a1 noseTipPerimeterPath]);
  CGContextFillPath(v16);
  CGContextAddPath(v16, (CGPathRef)objc_msgSend(objc_msgSend(a1, "leftEyePair"), "boundsPath"));
  CGContextAddPath(v16, (CGPathRef)objc_msgSend(objc_msgSend(a1, "rightEyePair"), "boundsPath"));
  CGContextAddPath(v16, (CGPathRef)objc_msgSend(objc_msgSend(a1, "teethPair"), "boundsPath"));
  CGContextAddPath(v16, (CGPathRef)[a1 headPerimeter]);
  CGContextStrokePath(v16);
  CFRelease(v16);
  id v184 = [v12 bytes];
  id v17 = [a1 faceData];
  double v18 = *(double *)(a2 + 16);
  double v19 = *(double *)(a2 + 24);
  [v17 faceBounds];
  double v192 = v21;
  double v193 = v20;
  double v190 = v22;
  double v191 = v23;
  unint64_t v24 = (unint64_t)v19;
  unint64_t v25 = (unint64_t)v18;
  double v26 = objc_alloc_init(Rgon);
  [v17 iOD];
  float v28 = v27;
  [v17 rightEye];
  double v31 = sub_359A8(0, v29, v30, (float)(unint64_t)v18, (float)(unint64_t)v19);
  double v33 = v32;
  [v17 leftEye];
  float v188 = (float)(unint64_t)v18;
  float v189 = (float)(unint64_t)v19;
  double v36 = sub_359A8(0, v34, v35, v188, v189);
  double v38 = v37;
  [v17 mouthCenter];
  double v41 = sub_359A8(0, v39, v40, v188, v189);
  double v187 = v31;
  float v43 = sqrt(((v33 + v38) * 0.5 - v42) * ((v33 + v38) * 0.5 - v42) + ((v31 + v36) * 0.5 - v41)
                                                                   * ((v31 + v36) * 0.5 - v41));
  float v44 = sqrt((v33 - v38) * (v33 - v38) + (v31 - v36) * (v31 - v36));
  double v45 = v44;
  if (v45 >= 0.01) {
    double v46 = (v31 - v36) / v45;
  }
  else {
    double v46 = 0.0;
  }
  if (v45 >= 0.01) {
    double v47 = (v33 - v38) / v45;
  }
  else {
    double v47 = 0.0;
  }
  double v48 = (float)(v28 * -0.25);
  double v49 = v46 * v48;
  double v50 = v47 * v48;
  [v17 faceOrientationIndex];
  double v52 = v51;
  double v53 = (v52 + 3.0) / 3.0;
  if (v53 >= 1.0) {
    double v53 = 1.0;
  }
  float v54 = v53;
  double v55 = v54;
  double v56 = v49 * v55;
  double v57 = v50 * v55;
  float v58 = v43 * 0.15;
  double v59 = v58;
  double v60 = v47 * v59;
  double v61 = -(v46 * v59);
  double v62 = (float)(v43 * 0.5);
  double v63 = v47 * v62;
  double v64 = -(v46 * v62);
  double v65 = v36 + v60 + v56;
  double v66 = v38 + v61 + v57;
  double v67 = v36 + v63 + v56;
  double v68 = v38 + v64 + v57;
  double v69 = (3.0 - v52) / 3.0;
  if (v69 >= 1.0) {
    double v69 = 1.0;
  }
  float v70 = v69;
  double v71 = (float)-v70;
  double v72 = v49 * v71;
  double v73 = v50 * v71;
  double v74 = v60 + v72;
  double v75 = v61 + v73;
  double v76 = v63 + v72;
  double v77 = v64 + v73;
  double v78 = v187 + v74;
  double v79 = v33 + v75;
  double v80 = v187 + v76;
  double v81 = v33 + v77;
  *(float *)&double v77 = v65;
  *(float *)&double v76 = v66;
  [(Rgon *)v26 AdjustForPointX:v77 Y:v76];
  *(float *)&double v82 = v67;
  *(float *)&double v83 = v68;
  [(Rgon *)v26 AdjustForPointX:v82 Y:v83];
  *(float *)&double v84 = v78;
  *(float *)&double v85 = v79;
  [(Rgon *)v26 AdjustForPointX:v84 Y:v85];
  *(float *)&double v86 = v80;
  *(float *)&double v87 = v81;
  [(Rgon *)v26 AdjustForPointX:v86 Y:v87];
  [(Rgon *)v26 CalculateVertices];
  [(Rgon *)v26 CalculateEdges];
  [v17 setSkinSampleRgon:v26];
  v202.n128_u64[0] = sub_359A8(0, v193, v192, v188, v189);
  v202.n128_u64[1] = v88;
  *(void *)&long long v203 = sub_359A8(0, v193 + v190, v192 + v191, v188, v189);
  *((void *)&v203 + 1) = v89;
  sub_35B0C(v202.n128_f64);
  __n128 v198 = v202;
  long long v199 = v203;
  *((double *)&v203 + 1) = *((double *)&v203 + 1) + v191 * 0.449999988;
  v202.n128_f64[1] = v202.n128_f64[1] + v191 * -0.300000012;
  v202.n128_f64[0] = v202.n128_f64[0] + v190 * -0.305999994;
  *(double *)&long long v203 = *(double *)&v203 + v190 * 0.305999994;
  sub_35B58((float64x2_t *)&v202, v25, v24);
  v198.n128_f64[0] = v198.n128_f64[0] + v190 * -0.25;
  v198.n128_f64[1] = v198.n128_f64[1] + v191 * -0.349999994;
  *(double *)&long long v199 = *(double *)&v199 + v190 * 0.25;
  *((double *)&v199 + 1) = *((double *)&v199 + 1) + v191 * 0.5;
  sub_35B58((float64x2_t *)&v198, v25, v24);
  objc_msgSend(v17, "setAdjustmentRect:", *(_OWORD *)&v202, *(double *)&v203 - v202.n128_f64[0], *((double *)&v203 + 1) - v202.n128_f64[1]);
  objc_msgSend(v17, "setHeadRect:", *(_OWORD *)&v198, *(double *)&v199 - v198.n128_f64[0], *((double *)&v199 + 1) - v198.n128_f64[1]);
  v90 = (char *)[v17 skinSeedPoints];
  [v17 iOD];
  double v92 = v91;
  [v17 betweenTheEyes];
  uint64_t v93 = 0;
  float v94 = v92 * 0.3;
  double v96 = v95 + 0.0;
  double v98 = v97 + v94;
  do
  {
    v99 = (double *)&v90[v93];
    double *v99 = v96;
    v99[1] = v98;
    [v17 iOD];
    *(float *)&double v100 = v100 * 0.03;
    double v101 = *(float *)&v100;
    double v96 = v96 - v47 * v101;
    double v98 = v98 + v46 * v101;
    v93 += 16;
  }
  while (v93 != 64);
  [v17 setSkinSeedPointCount:4];
  objc_msgSend(objc_msgSend(v17, "skinSampleRgon"), "CalculateAndReturnVertices:", &v209);
  uint64_t v102 = 0;
  v103 = (double *)(v90 + 64);
  do
  {
    v104 = (const float *)((char *)&v209 + v102);
    float32x4x2_t v244 = vld2q_f32(v104);
    v245.val[0] = vcvtq_f64_f32(*(float32x2_t *)v244.val[0].f32);
    v245.val[1] = vcvtq_f64_f32(*(float32x2_t *)v244.val[1].f32);
    v105 = v103 + 8;
    vst2q_f64(v103, v245);
    v106 = v103 + 4;
    v245.val[0] = vcvt_hight_f64_f32(v244.val[0]);
    v245.val[1] = vcvt_hight_f64_f32(v244.val[1]);
    vst2q_f64(v106, v245);
    v102 += 32;
    v103 = v105;
  }
  while (v102 != 256);
  [v17 setSkinSeedPointCount:36];
  CGFloat x = a3->origin.x;
  CGFloat y = a3->origin.y;
  CGFloat v109 = a3->size.width;
  CGFloat v110 = a3->size.height;
  objc_msgSend(objc_msgSend(objc_msgSend(a1, "faceData"), "skinSampleRgon"), "boundsFloatRect");
  CGRect v261 = NSIntegralRectWithOptions(v246, 0xF00uLL);
  v247.origin.CGFloat x = x;
  v247.origin.CGFloat y = y;
  v247.size.width = v109;
  v247.size.height = v110;
  CGRect v248 = CGRectIntersection(v247, v261);
  CGFloat v111 = v248.origin.x;
  CGFloat v112 = v248.origin.y;
  CGFloat v113 = v248.size.width;
  CGFloat v114 = v248.size.height;
  id v115 = objc_msgSend(objc_msgSend(a1, "faceData"), "skinSampleRgon");
  long long v239 = 0u;
  long long v240 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  v249.origin.CGFloat x = v111;
  v249.origin.CGFloat y = v112;
  v249.size.width = v113;
  v249.size.height = v114;
  double MinY = CGRectGetMinY(v249);
  v250.origin.CGFloat x = v111;
  v250.origin.CGFloat y = v112;
  v250.size.width = v113;
  v250.size.height = v114;
  int v117 = (int)MinY;
  if ((int)MinY >= (int)CGRectGetMaxY(v250)) {
    goto LABEL_38;
  }
  int v118 = 0;
  do
  {
    v251.origin.CGFloat x = v111;
    v251.origin.CGFloat y = v112;
    v251.size.width = v113;
    v251.size.height = v114;
    double MinX = CGRectGetMinX(v251);
    v252.origin.CGFloat x = v111;
    v252.origin.CGFloat y = v112;
    v252.size.width = v113;
    v252.size.height = v114;
    CGFloat MaxX = CGRectGetMaxX(v252);
    for (int i = (int)MinX; i < (int)MaxX; ++i)
    {
      *(float *)&CGFloat MaxX = (float)i;
      *(float *)&double v121 = (float)v117;
      if ([v115 containsPointX:MaxX Y:v121])
      {
        v242.CGFloat x = (double)i;
        v242.CGFloat y = (double)v117;
        if (CGRectContainsPoint(*a3, v242))
        {
          double v123 = CGRectGetMinX(*a3);
          CGFloat MaxY = CGRectGetMaxY(*a3);
          unint64_t v125 = (unint64_t)((double)i - v123);
          unint64_t v126 = (unint64_t)(MaxY - (double)v117);
          BOOL v127 = v126 >= (unint64_t)a3->size.height || v125 >= (unint64_t)a3->size.width;
          v128 = (unsigned __int8 *)(a4 + v126 * a5 + 4 * v125);
          if (v127) {
            v128 = 0;
          }
          int v129 = v128[1] + v128[2] + *v128;
          if ((v129 - 6) <= 0x2F3) {
            *((float *)&v209 + ((10923 * v129) >> 16)) = *((float *)&v209
          }
                                                                       + ((10923 * v129) >> 16))
                                                                     + 1.0;
          ++v118;
        }
      }
      v253.origin.CGFloat x = v111;
      v253.origin.CGFloat y = v112;
      v253.size.width = v113;
      v253.size.height = v114;
      CGFloat MaxX = CGRectGetMaxX(v253);
    }
    v254.origin.CGFloat x = v111;
    v254.origin.CGFloat y = v112;
    v254.size.width = v113;
    v254.size.height = v114;
    CGFloat v130 = CGRectGetMaxY(v254);
    ++v117;
  }
  while (v117 < (int)v130);
  if (v118 < 1)
  {
LABEL_38:
    uint64_t v133 = 0;
  }
  else
  {
    uint64_t v131 = 0;
    *(float *)&CGFloat v130 = (float)v118;
    float32x4_t v132 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v130, 0);
    do
    {
      *(long long *)((char *)&v209 + v131) = (__int128)vdivq_f32(*(float32x4_t *)((char *)&v209 + v131), v132);
      v131 += 16;
    }
    while (v131 != 512);
    uint64_t v133 = 0;
    float v134 = 0.0;
    v135 = (float *)&v209;
    do
    {
      float v134 = v134 + *v135;
      if (v134 > 0.02) {
        break;
      }
      v133 += 6;
      ++v135;
    }
    while (v133 != 768);
  }
  v136 = objc_alloc_init(RgonStack);
  [(RgonStack *)v136 setBinSize:20.0];
  [(RgonStack *)v136 setZDarkThr:v133];
  v255.origin.CGFloat x = v111;
  v255.origin.CGFloat y = v112;
  v255.size.width = v113;
  v255.size.height = v114;
  double v137 = CGRectGetMinY(v255);
  v256.origin.CGFloat x = v111;
  v256.origin.CGFloat y = v112;
  v256.size.width = v113;
  v256.size.height = v114;
  int v138 = (int)v137;
  if ((int)v137 < (int)CGRectGetMaxY(v256))
  {
    do
    {
      v257.origin.CGFloat x = v111;
      v257.origin.CGFloat y = v112;
      v257.size.width = v113;
      v257.size.height = v114;
      double v139 = CGRectGetMinX(v257);
      v258.origin.CGFloat x = v111;
      v258.origin.CGFloat y = v112;
      v258.size.width = v113;
      v258.size.height = v114;
      CGFloat v140 = CGRectGetMaxX(v258);
      for (int j = (int)v139; j < (int)v140; ++j)
      {
        *(float *)&CGFloat v140 = (float)j;
        *(float *)&double v141 = (float)v138;
        if ([v115 containsPointX:v140 Y:v141])
        {
          v243.CGFloat x = (double)j;
          v243.CGFloat y = (double)v138;
          if (CGRectContainsPoint(*a3, v243))
          {
            double v143 = CGRectGetMinX(*a3);
            CGFloat v144 = CGRectGetMaxY(*a3);
            unint64_t v145 = (unint64_t)((double)j - v143);
            unint64_t v146 = (unint64_t)(v144 - (double)v138);
            BOOL v147 = v146 >= (unint64_t)a3->size.height || v145 >= (unint64_t)a3->size.width;
            v148 = v147 ? 0 : (unsigned __int8 *)(a4 + v146 * a5 + 4 * v145);
            unsigned int v149 = v148[2];
            unsigned int v150 = v148[1];
            unsigned int v151 = *v148;
            if ((int)(v150 + v149 + v151) > (int)v133) {
              [(RgonStack *)v136 AdjustForPointX:(float)((float)((float)((float)v150 * -0.33126) + (float)((float)v149 * -0.16874))+ (float)((float)v151 * 0.5)) Y:(float)((float)((float)((float)v150 * -0.41869) + (float)((float)v149 * 0.5))+ (float)((float)v151 * -0.081312)) Z:(float)((float)((float)((float)v150 * 0.587) + (float)((float)v149 * 0.299))+ (float)((float)v151 * 0.114))];
            }
          }
        }
        v259.origin.CGFloat x = v111;
        v259.origin.CGFloat y = v112;
        v259.size.width = v113;
        v259.size.height = v114;
        CGFloat v140 = CGRectGetMaxX(v259);
      }
      v260.origin.CGFloat x = v111;
      v260.origin.CGFloat y = v112;
      v260.size.width = v113;
      v260.size.height = v114;
      ++v138;
    }
    while (v138 < (int)CGRectGetMaxY(v260));
  }
  [(RgonStack *)v136 CalculateVertices];
  [(RgonStack *)v136 CalculateEdges];
  int v206 = -16776961;
  int v205 = -1;
  unsigned int v152 = objc_msgSend(objc_msgSend(a1, "faceData"), "skinSeedPointCount");
  long long v210 = 0u;
  long long v211 = 0u;
  long long v209 = 0u;
  if (v152)
  {
    uint64_t v153 = 0;
    uint64_t v154 = 16 * v152;
    double v155 = 0.0;
    double v156 = 0.0;
    do
    {
      double v157 = v156;
      v158 = (double *)((char *)objc_msgSend(objc_msgSend(a1, "faceData"), "skinSeedPoints") + v153);
      double v159 = *v158;
      double v156 = v158[1];
      if (v155 != *v158 || v157 != v156)
      {
        v161 = (const CGPath *)[a1 headPerimeter];
        v241.CGFloat x = v159;
        v241.CGFloat y = v156;
        if (CGPathContainsPoint(v161, 0, v241, 1))
        {
          __n128 v202 = 0uLL;
          double v162 = CGRectGetMinX(*a3);
          CGFloat v163 = CGRectGetMaxY(*a3);
          v202.n128_f64[0] = v159 - v162;
          v202.n128_f64[1] = v163 - v156;
          sub_11B0C(&v209, &v202);
        }
      }
      v153 += 16;
      double v155 = v159;
    }
    while (v154 != v153);
  }
  v207[0] = @"skinRgonStack";
  v207[1] = @"skinColorToleranceDark";
  v208[0] = v136;
  v208[1] = &off_7AA30;
  v207[2] = @"skinColorToleranceLight";
  v207[3] = @"skinColorToleranceMid";
  v208[2] = &off_7AA40;
  v208[3] = &off_7AA50;
  sub_117F8(&v209, a3, a4, a5, (uint64_t)v184, AlignedBytesPerRow, a6, a7, &v206, &v205, 0, +[NSDictionary dictionaryWithObjects:v208 forKeys:v207 count:4]);
  long long v203 = 0u;
  long long v204 = 0u;
  __n128 v202 = 0u;
  sub_125C0((uint64_t)&v209, (uint64_t)&v202);
  sub_1287C(&v202);
  uint64_t v164 = 0;
  int v201 = -16711936;
  long long v203 = 0u;
  long long v204 = 0u;
  __n128 v202 = 0u;
  do
  {
    v165 = (char *)objc_msgSend(objc_msgSend(a1, "faceData"), "teethSeedPoints");
    double v166 = *(double *)&v165[v164];
    double v167 = *(double *)&v165[v164 + 8];
    __n128 v198 = 0uLL;
    double v168 = CGRectGetMinX(*a3);
    CGFloat v169 = CGRectGetMaxY(*a3);
    v198.n128_f64[0] = v166 - v168;
    v198.n128_f64[1] = v169 - v167;
    sub_11B0C(&v202, &v198);
    v164 += 16;
  }
  while (v164 != 112);
  sub_117F8(&v202, a3, a4, a5, (uint64_t)v184, AlignedBytesPerRow, a6, a7, &v201, &v205, 1, &off_7C410);
  long long v199 = 0u;
  long long v200 = 0u;
  __n128 v198 = 0u;
  sub_125C0((uint64_t)&v202, (uint64_t)&v198);
  sub_1287C(&v198);
  uint64_t v170 = 0;
  int v197 = -65536;
  long long v199 = 0u;
  long long v200 = 0u;
  __n128 v198 = 0u;
  do
  {
    v171 = (char *)objc_msgSend(objc_msgSend(a1, "faceData"), "leftIrisSeedPoints");
    double v172 = *(double *)&v171[v170];
    double v173 = *(double *)&v171[v170 + 8];
    __n128 v196 = 0uLL;
    double v174 = CGRectGetMinX(*a3);
    CGFloat v175 = CGRectGetMaxY(*a3);
    v196.n128_f64[0] = v172 - v174;
    v196.n128_f64[1] = v175 - v173;
    *(void *)&double v176 = sub_11B0C(&v198, &v196).n128_u64[0];
    v170 += 16;
  }
  while (v170 != 240);
  for (uint64_t k = 0; k != 240; k += 16)
  {
    v178 = (char *)objc_msgSend(objc_msgSend(a1, "faceData", v176), "rightIrisSeedPoints");
    double v179 = *(double *)&v178[k];
    double v180 = *(double *)&v178[k + 8];
    __n128 v196 = 0uLL;
    double v181 = CGRectGetMinX(*a3);
    CGFloat v182 = CGRectGetMaxY(*a3);
    v196.n128_f64[0] = v179 - v181;
    v196.n128_f64[1] = v182 - v180;
    *(void *)&double v176 = sub_11B0C(&v198, &v196).n128_u64[0];
  }
  sub_117F8(&v198, a3, a4, a5, (uint64_t)v184, AlignedBytesPerRow, a6, a7, &v197, &v205, 2, 0);
  memset(&v196, 0, 48);
  sub_125C0((uint64_t)&v198, (uint64_t)&v196);
  sub_1287C(&v196);

  sub_1287C(&v198);
  sub_1287C(&v202);
  return sub_1287C(&v209);
}

void sub_11740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
}

void sub_117F8(void *a1, CGRect *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, int *a10, int a11, void *a12)
{
  if (a1[5])
  {
    unint64_t Width = (unint64_t)CGRectGetWidth(*a2);
    unint64_t Height = (unint64_t)CGRectGetHeight(*a2);
    uint64_t v41 = a3;
    uint64_t v42 = a4;
    uint64_t v43 = a5;
    uint64_t v44 = a6;
    int v45 = *a10;
    int v46 = a11;
    id v47 = [a12 objectForKeyedSubscript:@"skinRgonStack"];
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"skinColorToleranceDark"), "floatValue");
    int v48 = v20;
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"skinColorToleranceLight"), "floatValue");
    int v49 = v21;
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"skinColorToleranceMid"), "floatValue");
    int v50 = v22;
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"eps2"), "floatValue");
    int v51 = v23;
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"c1"), "floatValue");
    int v52 = v24;
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"c2"), "floatValue");
    int v53 = v25;
    objc_msgSend(objc_msgSend(a12, "objectForKeyedSubscript:", @"c3"), "floatValue");
    int v54 = v26;
    double v27 = (void **)sub_2BA84(Width, Height);
    char v28 = 1;
    do
    {
      uint64_t v30 = a1[5] - 1;
      double v31 = (double *)(*(void *)(a1[1] + (((unint64_t)(v30 + a1[4]) >> 5) & 0x7FFFFFFFFFFFFF8))
                     + 16 * (v30 + *((unsigned char *)a1 + 32)));
      double v32 = *v31;
      double v33 = v31[1];
      a1[5] = v30;
      sub_12550(a1, 1);
      unsigned int v34 = vcvtmd_s64_f64(v32);
      LODWORD(a6) = vcvtmd_s64_f64(v33);
      if (v28)
      {
        sub_2515C(a3, (uint64_t)v27, v34, a6, (uint64_t)&Width, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_12364);
      }
      else
      {
        sub_2BCDC((uint64_t)v27, v34, a6, 1);
        sub_256E4(a3, (uint64_t)v27, v34, a6, (uint64_t)&Width, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_12364);
      }
      char v28 = 0;
    }
    while (a1[5]);
    unint64_t v35 = Height;
    if (Height)
    {
      uint64_t v36 = 0;
      unint64_t v37 = Width;
      do
      {
        if (v37)
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if ((*((unsigned __int8 *)*v27 + *((int *)v27 + 4) * (uint64_t)(int)v36 + (i >> 3)) >> (i & 7))) {
              *(_DWORD *)(a7 + 4 * i) = *a9;
            }
          }
        }
        a7 += a8;
        ++v36;
      }
      while (v36 != v35);
    }
    sub_2BB98(v27);
  }
}

uint64_t sub_11ABC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  double v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

__n128 sub_11B0C(void *a1, __n128 *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 32 * (v4 - v5) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_11B98(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  __n128 result = *a2;
  *(__n128 *)(*(void *)(v5 + ((v7 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v7) = *a2;
  ++a1[5];
  return result;
}

void sub_11B98(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x100;
  unint64_t v4 = v2 - 256;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    CVReturn v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    CIFormat v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)CVReturn v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unsigned int v34 = (char *)sub_1232C(v5, v33);
      unint64_t v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      double v38 = (uint64_t *)a1[1];
      CVReturn v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        CVReturn v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    double v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      CIFormat v9 = (char *)a1[1];
    }
    CVReturn v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_11EB0(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_11FC8((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    CVReturn v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    CIFormat v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unsigned int v34 = (char *)sub_1232C((uint64_t)(a1 + 3), v46);
      unint64_t v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      int v48 = (uint64_t *)a1[1];
      CVReturn v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        CVReturn v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        int v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)int v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        CVReturn v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  double v56 = a1 + 3;
  *(void *)&long long v54 = sub_1232C((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  int v53 = operator new(0x1000uLL);
  sub_120E8(&v54, &v53);
  double v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_12200((uint64_t)&v54, v27);
  }
  double v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_11E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_11EB0(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      double v19 = (char *)sub_1232C(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      double v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_11FC8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_1232C(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_120E8(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_1232C(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_12200(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_1232C(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_1231C()
{
}

void *sub_1232C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1231C();
  }
  return operator new(8 * a2);
}

BOOL sub_12364(uint64_t a1, float a2, double a3, uint64_t a4, int a5, int a6)
{
  BOOL v6 = *(void *)(a1 + 8) > (unint64_t)a6 && *(void *)a1 > (unint64_t)a5;
  uint64_t v7 = (unsigned __int8 *)(*(void *)(a1 + 16) + *(void *)(a1 + 24) * a6 + 4 * a5);
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (!*(unsigned char *)(v8 + *(void *)(a1 + 40) * a6 + a5) && v7 != 0)
    {
      unsigned int v12 = v7[2];
      v22[0] = v7[2];
      unsigned int v13 = v7[1];
      v22[1] = v7[1];
      unsigned int v14 = *v7;
      v22[2] = *v7;
      int v15 = *(_DWORD *)(a1 + 52);
      if (v15 == 2)
      {
        float v24 = 0.0;
        float32x2_t v23 = 0;
        sub_3601C(v22, (float *)&v23, a2, *(float *)&a3);
        return v23.f32[0] < 100.0;
      }
      if (v15 == 1)
      {
        float v24 = 0.0;
        float32x2_t v23 = 0;
        sub_361D8(v22, &v23, 1.0, a3);
        return (float)((float)((float)((float)(*(float *)(a1 + 84) * v23.f32[1])
                                     + (float)(*(float *)(a1 + 80) * v23.f32[0]))
                             + (float)(*(float *)(a1 + 88) * v24))
                     - *(float *)(a1 + 76)) > 0.0;
      }
      if (!v15 && (int)(v13 + v12 + v14) > (int)[*(id *)(a1 + 56) zDarkThr])
      {
        *(float *)&double v18 = (float)((float)((float)v13 * 0.587) + (float)((float)v12 * 0.299))
                       + (float)((float)v14 * 0.114);
        *(float *)&double v16 = (float)((float)((float)v13 * -0.33126) + (float)((float)v12 * -0.16874))
                       + (float)((float)v14 * 0.5);
        *(float *)&double v17 = (float)((float)((float)v13 * -0.41869) + (float)((float)v12 * 0.5))
                       + (float)((float)v14 * -0.081312);
        LODWORD(v19) = *(_DWORD *)(a1 + 64);
        LODWORD(v20) = *(_DWORD *)(a1 + 68);
        LODWORD(v21) = *(_DWORD *)(a1 + 72);
        return [*(id *)(a1 + 56) containsPointPlanarConditionalX2:0 Y:v16 Z:v17 epsilonDark:v18 epsilonLight:v19 epsilonMid:v20 shouldPrint:v21] != 0;
      }
    }
  }
  return 0;
}

uint64_t sub_12550(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 32 * (v2 - v3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x100) {
    a2 = 1;
  }
  if (v5 < 0x200) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

uint64_t sub_125C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void ***)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 40) = 0;
  unint64_t v6 = v5 - (void)v4;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*v4);
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v4 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v4;
      unint64_t v6 = v7 - (void)v4;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    uint64_t v8 = 128;
    goto LABEL_7;
  }
  if (v6 >> 3 == 2)
  {
    uint64_t v8 = 256;
LABEL_7:
    *(void *)(a1 + 32) = v8;
  }
  sub_12664((void **)a1);
  uint64_t result = sub_1280C(a1, a2);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_12664(void **a1)
{
  if (a1[5])
  {
    sub_126E4((uint64_t)a1, 0);
    sub_12550(a1, 0);
  }
  else
  {
    uint64_t v3 = a1[1];
    for (uint64_t i = (uint64_t)a1[2]; (void *)i != v3; a1[2] = (void *)i)
    {
      operator delete(*(void **)(i - 8));
      uint64_t v3 = a1[1];
      uint64_t i = (uint64_t)a1[2] - 8;
    }
    a1[4] = 0;
  }

  sub_12744(a1);
}

uint64_t sub_126E4(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x100) {
    a2 = 1;
  }
  if (v2 < 0x200) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 256;
  }
  return v4 ^ 1u;
}

void sub_12744(void **a1)
{
  uint64_t v3 = a1[3];
  uint64_t v2 = (uint64_t)(a1 + 3);
  int v4 = a1[1];
  uint64_t v5 = a1[2];
  unint64_t v6 = (v5 - v4) >> 3;
  if (v6 >= (v3 - (unsigned char *)*a1) >> 3) {
    return;
  }
  if (v5 == v4)
  {
    uint64_t v10 = 0;
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = (char *)sub_1232C(v2, v6);
  uint64_t v8 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v10 = &v7[8 * v9];
  uint64_t v11 = v5 - v8;
  if (v5 == v8)
  {
LABEL_8:
    unsigned int v14 = v5;
    goto LABEL_9;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 8 * (v11 >> 3);
  do
  {
    *(void *)&v7[v12] = *(void *)&v8[v12];
    v12 += 8;
  }
  while (v13 != v12);
  uint64_t v5 = a1[1];
  unsigned int v14 = a1[2];
LABEL_9:
  int64_t v15 = v14 - v5;
  double v16 = *a1;
  *a1 = v7;
  a1[1] = v7;
  a1[2] = &v7[v15];
  a1[3] = v10;
  if (v16)
  {
    operator delete(v16);
  }
}

uint64_t sub_1280C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4 != v5) {
    *(void *)(a1 + 16) = v4 + ((v5 - v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  sub_12744((void **)a1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return a1;
}

uint64_t sub_1287C(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 128;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 256;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }

  return sub_11ABC((uint64_t)a1);
}

void *sub_12924(size_t a1)
{
  return malloc_type_malloc(a1, 0x4A7C05C1uLL);
}

void *sub_12930(size_t a1, size_t a2)
{
  return malloc_type_calloc(a1, a2, 0x293D63F1uLL);
}

uint64_t sub_12944()
{
  return puts("leak testing is off");
}

void *sub_12950(uint64_t a1, int a2, int a3, int a4, int a5, float a6)
{
  *(_DWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 12) = a3;
  *(_DWORD *)(a1 + 28) = a4;
  *(_DWORD *)(a1 + 32) = a5;
  *(float *)(a1 + 36) = a6;
  int v7 = a4 * a2 * a5;
  *(_DWORD *)(a1 + 16) = a4 * a2;
  *(_DWORD *)(a1 + 20) = v7;
  *(_DWORD *)(a1 + 24) = v7 * a3;
  uint64_t result = malloc_type_malloc(v7 * a3, 0x4A7C05C1uLL);
  *(void *)a1 = result;
  return result;
}

void sub_129A4(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  *a1 = 0;
}

uint64_t sub_129D4(uint64_t result, uint64_t a2, int a3, int a4, int a5, int a6, int a7, float a8)
{
  *(void *)uint64_t result = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(_DWORD *)(result + 28) = a5;
  *(_DWORD *)(result + 32) = a6;
  *(float *)(result + 36) = a8;
  *(_DWORD *)(result + 16) = a7 / a6;
  *(_DWORD *)(result + 20) = a7;
  *(_DWORD *)(result + 24) = a7 * a4;
  return result;
}

float sub_129F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = *(_DWORD *)(a1 + 16);
  int v4 = *(_DWORD *)(a1 + 20);
  int v6 = *(_DWORD *)(a1 + 28);
  int v7 = *(_DWORD *)(a1 + 32);
  *(void *)a2 = *(void *)a1 + v4 * (int)a3 + v6 * (int)a4 * v7;
  *(_DWORD *)(a2 + 8) = HIDWORD(a4) - a4;
  *(_DWORD *)(a2 + 12) = HIDWORD(a3) - a3;
  *(_DWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 20) = v4;
  *(_DWORD *)(a2 + 24) = v4 * (HIDWORD(a3) - a3);
  *(_DWORD *)(a2 + 28) = v6;
  *(_DWORD *)(a2 + 32) = v7;
  float result = *(float *)(a1 + 36);
  *(float *)(a2 + 36) = result;
  return result;
}

BOOL sub_12A4C(uint64_t a1, float a2, float a3)
{
  BOOL result = 0;
  if (a2 >= 0.0 && a3 >= 0.0) {
    return (float)(*(_DWORD *)(a1 + 8) - 1) >= a2 && (float)(*(_DWORD *)(a1 + 12) - 1) >= a3;
  }
  return result;
}

uint64_t sub_12A9C(uint64_t a1, float a2, float a3)
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a2 >= 0.0)
  {
    float v4 = a2;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a2) {
      float v4 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v5 = *(_DWORD *)(a1 + 12);
  if (a3 >= 0.0)
  {
    float v3 = a3;
    if ((float)(v5 - 1) < a3) {
      float v3 = (float)(v5 - 1);
    }
  }
  int v6 = vcvtms_s32_f32(v4);
  signed int v7 = vcvtms_s32_f32(v3);
  if (*(_DWORD *)(a1 + 8) - 2 < v6) {
    int v6 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v8 = v5 - 2;
  if (v8 >= v7) {
    int v8 = v7;
  }
  float v9 = v4 - (float)v6;
  float v10 = v3 - (float)v8;
  uint64_t v11 = *(int *)(a1 + 16);
  uint64_t v12 = *(int *)(a1 + 28);
  uint64_t v13 = (unsigned __int8 *)(*(void *)a1 + v8 * (int)v11 + (int)v12 * v6);
  float v14 = (float)*v13 + (float)((float)(v13[v12] - *v13) * v9);
  return (int)rintf(v14+ (float)((float)((float)((float)v13[v11]+ (float)((float)(v13[(int)v12 + (int)v11] - v13[v11]) * v9))- v14)* v10));
}

uint64_t sub_12B84(uint64_t a1, float a2, float a3)
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a2 >= 0.0)
  {
    float v4 = a2;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a2) {
      float v4 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v5 = *(_DWORD *)(a1 + 12);
  if (a3 >= 0.0)
  {
    float v3 = a3;
    if ((float)(v5 - 1) < a3) {
      float v3 = (float)(v5 - 1);
    }
  }
  int v6 = vcvtms_s32_f32(v4);
  signed int v7 = vcvtms_s32_f32(v3);
  if (*(_DWORD *)(a1 + 8) - 2 < v6) {
    int v6 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v8 = v5 - 2;
  if (v8 >= v7) {
    int v8 = v7;
  }
  float v9 = v4 - (float)v6;
  float v10 = v3 - (float)v8;
  uint64_t v11 = *(int *)(a1 + 16);
  uint64_t v12 = *(int *)(a1 + 28);
  uint64_t v13 = (unsigned __int16 *)(*(void *)a1 + 2 * v8 * (int)v11 + 2 * (int)v12 * v6);
  float v14 = (float)*v13 + (float)((float)(v13[v12] - *v13) * v9);
  return (int)rintf(v14+ (float)((float)((float)((float)v13[v11]+ (float)((float)(v13[(int)v12 + (int)v11] - v13[v11]) * v9))- v14)* v10));
}

uint64_t sub_12C6C(uint64_t a1, float a2, float a3)
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a2 >= 0.0)
  {
    float v4 = a2;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a2) {
      float v4 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v5 = *(_DWORD *)(a1 + 12);
  if (a3 >= 0.0)
  {
    float v3 = a3;
    if ((float)(v5 - 1) < a3) {
      float v3 = (float)(v5 - 1);
    }
  }
  int v6 = vcvtms_s32_f32(v4);
  signed int v7 = vcvtms_s32_f32(v3);
  if (*(_DWORD *)(a1 + 8) - 2 < v6) {
    int v6 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v8 = v5 - 2;
  if (v8 >= v7) {
    int v8 = v7;
  }
  int v9 = (int)rintf((float)(v4 - (float)v6) * 64.0);
  float v10 = rintf((float)(v3 - (float)v8) * 64.0);
  uint64_t v11 = *(int *)(a1 + 16);
  uint64_t v12 = *(int *)(a1 + 28);
  uint64_t v13 = (unsigned __int8 *)(*(void *)a1 + v8 * (int)v11 + (int)v12 * v6);
  int v14 = v13[v11];
  LODWORD(v11) = v13[(int)v12 + (int)v11];
  LODWORD(v13) = *v13 + (((v13[v12] - *v13) * v9 + 32) >> 6);
  return ((v14 - v13 + ((((int)v11 - v14) * v9 + 32) >> 6)) * (int)v10 + (v13 << 6));
}

uint64_t sub_12D6C(uint64_t a1, float a2, float a3)
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a2 >= 0.0)
  {
    float v4 = a2;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a2) {
      float v4 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v5 = *(_DWORD *)(a1 + 12);
  if (a3 >= 0.0)
  {
    float v3 = a3;
    if ((float)(v5 - 1) < a3) {
      float v3 = (float)(v5 - 1);
    }
  }
  int v6 = vcvtms_s32_f32(v4);
  signed int v7 = vcvtms_s32_f32(v3);
  if (*(_DWORD *)(a1 + 8) - 2 < v6) {
    int v6 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v8 = v5 - 2;
  if (v8 >= v7) {
    int v8 = v7;
  }
  int v9 = (int)rintf((float)(v4 - (float)v6) * 64.0);
  float v10 = rintf((float)(v3 - (float)v8) * 64.0);
  uint64_t v11 = *(int *)(a1 + 16);
  uint64_t v12 = *(int *)(a1 + 28);
  uint64_t v13 = (unsigned __int16 *)(*(void *)a1 + 2 * v8 * (int)v11 + 2 * (int)v12 * v6);
  int v14 = v13[v11];
  LODWORD(v11) = v13[(int)v12 + (int)v11];
  LODWORD(v13) = *v13 + (((v13[v12] - *v13) * v9 + 32) >> 6);
  return ((v14 - v13 + ((((int)v11 - v14) * v9 + 32) >> 6)) * (int)v10 + (v13 << 6));
}

double sub_12E6C(uint64_t a1, float a2, float a3)
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a2 >= 0.0)
  {
    float v4 = a2;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a2) {
      float v4 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v5 = *(_DWORD *)(a1 + 12);
  if (a3 >= 0.0)
  {
    float v3 = a3;
    if ((float)(v5 - 1) < a3) {
      float v3 = (float)(v5 - 1);
    }
  }
  int v6 = vcvtms_s32_f32(v4);
  signed int v7 = vcvtms_s32_f32(v3);
  if (*(_DWORD *)(a1 + 8) - 2 < v6) {
    int v6 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v8 = v5 - 2;
  if (v8 >= v7) {
    int v8 = v7;
  }
  float v9 = v4 - (float)v6;
  float v10 = v3 - (float)v8;
  uint64_t v11 = *(int *)(a1 + 16);
  uint64_t v12 = *(int *)(a1 + 28);
  uint64_t v13 = (unsigned __int8 *)(*(void *)a1 + v8 * (int)v11 + (int)v12 * v6);
  float v14 = (float)*v13 + (float)((float)(v13[v12] - *v13) * v9);
  return (double)(uint64_t)rintf(v14+ (float)((float)((float)((float)v13[v11]+ (float)((float)(v13[(int)v12 + (int)v11] - v13[v11]) * v9))- v14)* v10));
}

double sub_12FA8(uint64_t a1, float a2, float a3)
{
  float v3 = 0.0;
  float v4 = 0.0;
  if (a2 >= 0.0)
  {
    float v4 = a2;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a2) {
      float v4 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v5 = *(_DWORD *)(a1 + 12);
  if (a3 >= 0.0)
  {
    float v3 = a3;
    if ((float)(v5 - 1) < a3) {
      float v3 = (float)(v5 - 1);
    }
  }
  int v6 = vcvtms_s32_f32(v4);
  signed int v7 = vcvtms_s32_f32(v3);
  if (*(_DWORD *)(a1 + 8) - 2 < v6) {
    int v6 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v8 = v5 - 2;
  if (v8 >= v7) {
    int v8 = v7;
  }
  float v9 = v4 - (float)v6;
  float v10 = v3 - (float)v8;
  uint64_t v11 = *(int *)(a1 + 16);
  uint64_t v12 = *(int *)(a1 + 28);
  uint64_t v13 = (unsigned __int16 *)(*(void *)a1 + 2 * v8 * (int)v11 + 2 * (int)v12 * v6);
  float v14 = (float)*v13 + (float)((float)(v13[v12] - *v13) * v9);
  return (double)(uint64_t)rintf(v14+ (float)((float)((float)((float)v13[v11]+ (float)((float)(v13[(int)v12 + (int)v11] - v13[v11]) * v9))- v14)* v10));
}

float sub_130E4(uint64_t a1, unsigned char *a2, float a3, float a4)
{
  float v4 = 0.0;
  float v5 = 0.0;
  if (a3 >= 0.0)
  {
    float v5 = a3;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a3) {
      float v5 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v6 = *(_DWORD *)(a1 + 12);
  if (a4 >= 0.0)
  {
    float v4 = a4;
    if ((float)(v6 - 1) < a4) {
      float v4 = (float)(v6 - 1);
    }
  }
  int v7 = vcvtms_s32_f32(v5);
  signed int v8 = vcvtms_s32_f32(v4);
  if (*(_DWORD *)(a1 + 8) - 2 < v7) {
    int v7 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v9 = v6 - 2;
  if (v9 >= v8) {
    int v9 = v8;
  }
  float v10 = v5 - (float)v7;
  float v11 = v4 - (float)v9;
  uint64_t v12 = *(int *)(a1 + 16);
  uint64_t v13 = *(int *)(a1 + 28);
  float v14 = (unsigned __int8 *)(*(void *)a1 + v9 * (int)v12 + (int)v13 * v7);
  unsigned int v15 = *v14;
  unsigned int v16 = v14[1];
  unsigned int v17 = v14[2];
  unsigned int v18 = v14[3];
  int v19 = v14[v13];
  int v20 = v14[v13 + 1];
  int v21 = v14[v13 + 2];
  int v22 = v14[v13 + 3];
  unsigned int v23 = v14[v12];
  unsigned int v24 = v14[v12 + 1];
  unsigned int v25 = v14[v12 + 2];
  unsigned int v26 = v14[v12 + 3];
  double v27 = &v14[(int)v13 + (int)v12];
  LODWORD(v12) = *v27;
  LODWORD(v13) = v27[1];
  int v28 = v27[2];
  LODWORD(v27) = v27[3];
  *a2 = (uint64_t)rintf((float)((float)v15 + (float)((float)(int)(v19 - v15) * v10))+ (float)((float)((float)((float)v23 + (float)((float)(int)(v12 - v23) * v10))- (float)((float)v15 + (float)((float)(int)(v19 - v15) * v10)))* v11));
  float v29 = (float)v16 + (float)((float)(int)(v20 - v16) * v10);
  a2[1] = (uint64_t)rintf(v29 + (float)((float)((float)((float)v24 + (float)((float)(int)(v13 - v24) * v10)) - v29) * v11));
  float v30 = (float)v17 + (float)((float)(int)(v21 - v17) * v10);
  a2[2] = (uint64_t)rintf(v30 + (float)((float)((float)((float)v25 + (float)((float)(int)(v28 - v25) * v10)) - v30) * v11));
  float v31 = (float)v18 + (float)((float)(int)(v22 - v18) * v10);
  float result = rintf(v31 + (float)((float)((float)((float)v26 + (float)((float)(int)(v27 - v26) * v10)) - v31) * v11));
  a2[3] = (uint64_t)result;
  return result;
}

float sub_132A8(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, float a6, float a7)
{
  float v7 = 0.0;
  float v8 = 0.0;
  if (a6 >= 0.0)
  {
    float v8 = a6;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a6) {
      float v8 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v9 = *(_DWORD *)(a1 + 12);
  if (a7 >= 0.0)
  {
    float v7 = a7;
    if ((float)(v9 - 1) < a7) {
      float v7 = (float)(v9 - 1);
    }
  }
  int v10 = vcvtms_s32_f32(v8);
  signed int v11 = vcvtms_s32_f32(v7);
  if (*(_DWORD *)(a1 + 8) - 2 < v10) {
    int v10 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v12 = v9 - 2;
  if (v12 >= v11) {
    int v12 = v11;
  }
  float v13 = v8 - (float)v10;
  float v14 = v7 - (float)v12;
  uint64_t v15 = *(int *)(a1 + 16);
  uint64_t v16 = *(int *)(a1 + 28);
  unsigned int v17 = (unsigned __int8 *)(*(void *)a1 + v12 * (int)v15 + (int)v16 * v10);
  unsigned int v18 = *v17;
  unsigned int v19 = v17[1];
  unsigned int v20 = v17[2];
  unsigned int v21 = v17[3];
  int v22 = v17[v16];
  int v23 = v17[v16 + 1];
  int v24 = v17[v16 + 2];
  int v25 = v17[v16 + 3];
  unsigned int v26 = v17[v15];
  unsigned int v27 = v17[v15 + 1];
  unsigned int v28 = v17[v15 + 2];
  unsigned int v29 = v17[v15 + 3];
  float v30 = &v17[(int)v16 + (int)v15];
  LODWORD(v15) = *v30;
  LODWORD(v16) = v30[1];
  int v31 = v30[2];
  LODWORD(v30) = v30[3];
  float v32 = (float)v18 + (float)((float)(int)(v22 - v18) * v13);
  *a2 = (int)rintf(v32 + (float)((float)((float)((float)v26 + (float)((float)(int)(v15 - v26) * v13)) - v32) * v14));
  float v33 = (float)v19 + (float)((float)(int)(v23 - v19) * v13);
  *a3 = (int)rintf(v33 + (float)((float)((float)((float)v27 + (float)((float)(int)(v16 - v27) * v13)) - v33) * v14));
  float v34 = (float)v20 + (float)((float)(int)(v24 - v20) * v13);
  *a4 = (int)rintf(v34 + (float)((float)((float)((float)v28 + (float)((float)(int)(v31 - v28) * v13)) - v34) * v14));
  float v35 = (float)v21 + (float)((float)(int)(v25 - v21) * v13);
  float result = rintf(v35 + (float)((float)((float)((float)v29 + (float)((float)(int)(v30 - v29) * v13)) - v35) * v14));
  *a5 = (int)result;
  return result;
}

float sub_13474(uint64_t a1, unsigned char *a2, float a3, float a4)
{
  float v4 = 0.0;
  float v5 = 0.0;
  if (a3 >= 0.0)
  {
    float v5 = a3;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a3) {
      float v5 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v6 = *(_DWORD *)(a1 + 12);
  if (a4 >= 0.0)
  {
    float v4 = a4;
    if ((float)(v6 - 1) < a4) {
      float v4 = (float)(v6 - 1);
    }
  }
  int v7 = vcvtms_s32_f32(v5);
  signed int v8 = vcvtms_s32_f32(v4);
  if (*(_DWORD *)(a1 + 8) - 2 < v7) {
    int v7 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v9 = v6 - 2;
  if (v9 >= v8) {
    int v9 = v8;
  }
  float v10 = v5 - (float)v7;
  float v11 = v4 - (float)v9;
  uint64_t v12 = *(int *)(a1 + 16);
  uint64_t v13 = *(int *)(a1 + 28);
  float v14 = (unsigned __int16 *)(*(void *)a1 + 2 * v9 * (int)v12 + 2 * (int)v13 * v7);
  unsigned int v15 = *v14;
  unsigned int v16 = v14[1];
  unsigned int v17 = v14[2];
  unsigned int v18 = v14[3];
  int v19 = v14[v13];
  int v20 = v14[(int)v13 + 1];
  int v21 = v14[(int)v13 + 2];
  int v22 = v14[(int)v13 + 3];
  unsigned int v23 = v14[v12];
  unsigned int v24 = v14[(int)v12 + 1];
  unsigned int v25 = v14[(int)v12 + 2];
  unsigned int v26 = v14[(int)v12 + 3];
  unsigned int v27 = &v14[(int)v13 + (int)v12];
  LODWORD(v14) = v27[1];
  int v28 = v27[2];
  float v29 = rintf((float)((float)v15 + (float)((float)(int)(v19 - v15) * v10))+ (float)((float)((float)((float)v23 + (float)((float)(int)(*v27 - v23) * v10))- (float)((float)v15 + (float)((float)(int)(v19 - v15) * v10)))* v11));
  LODWORD(v27) = v27[3];
  a2[1] = (unsigned __int16)(uint64_t)v29 >> 8;
  float v30 = (float)v16 + (float)((float)(int)(v20 - v16) * v10);
  a2[2] = (unsigned __int16)(uint64_t)rintf(v30+ (float)((float)((float)((float)v24+ (float)((float)(int)(v14 - v24) * v10))- v30)* v11)) >> 8;
  float v31 = (float)v17 + (float)((float)(int)(v21 - v17) * v10);
  a2[3] = (unsigned __int16)(uint64_t)rintf(v31+ (float)((float)((float)((float)v25 + (float)((float)(int)(v28 - v25) * v10)) - v31)* v11)) >> 8;
  float v32 = (float)v18 + (float)((float)(int)(v22 - v18) * v10);
  float result = rintf(v32 + (float)((float)((float)((float)v26 + (float)((float)(int)(v27 - v26) * v10)) - v32) * v11));
  *a2 = (unsigned __int16)(uint64_t)result >> 8;
  return result;
}

float sub_13658(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, float a5, float a6)
{
  float v6 = 0.0;
  float v7 = 0.0;
  if (a5 >= 0.0)
  {
    float v7 = a5;
    if ((float)(*(_DWORD *)(a1 + 8) - 1) < a5) {
      float v7 = (float)(*(_DWORD *)(a1 + 8) - 1);
    }
  }
  int v8 = *(_DWORD *)(a1 + 12);
  if (a6 >= 0.0)
  {
    float v6 = a6;
    if ((float)(v8 - 1) < a6) {
      float v6 = (float)(v8 - 1);
    }
  }
  int v9 = vcvtms_s32_f32(v7);
  signed int v10 = vcvtms_s32_f32(v6);
  if (*(_DWORD *)(a1 + 8) - 2 < v9) {
    int v9 = *(_DWORD *)(a1 + 8) - 2;
  }
  int v11 = v8 - 2;
  if (v11 >= v10) {
    int v11 = v10;
  }
  float v12 = v7 - (float)v9;
  float v13 = v6 - (float)v11;
  uint64_t v14 = *(int *)(a1 + 16);
  uint64_t v15 = *(int *)(a1 + 28);
  unsigned int v16 = (unsigned __int16 *)(*(void *)a1 + 2 * v11 * (int)v14 + 2 * (int)v15 * v9);
  unsigned int v17 = *v16;
  int v18 = v16[v15];
  int v19 = v16[(int)v15 + 1];
  unsigned int v20 = v16[1];
  int v21 = v16[(int)v15 + 3];
  unsigned int v22 = v16[v14];
  unsigned int v23 = v16[(int)v14 + 1];
  unsigned int v24 = v16[(int)v14 + 3];
  unsigned int v25 = v16[3];
  unsigned int v26 = &v16[(int)v15 + (int)v14];
  LODWORD(v14) = *v26;
  LODWORD(v15) = v26[1];
  LODWORD(v26) = v26[3];
  float v27 = (float)v17 + (float)((float)(int)(v18 - v17) * v12);
  *a2 = (int)rintf(v27 + (float)((float)((float)((float)v22 + (float)((float)(int)(v14 - v22) * v12)) - v27) * v13));
  float v28 = (float)v20 + (float)((float)(int)(v19 - v20) * v12);
  *a3 = (int)rintf(v28 + (float)((float)((float)((float)v23 + (float)((float)(int)(v15 - v23) * v12)) - v28) * v13));
  float v29 = (float)v25 + (float)((float)(int)(v21 - v25) * v12);
  float result = rintf(v29 + (float)((float)((float)((float)v24 + (float)((float)(int)(v26 - v24) * v12)) - v29) * v13));
  *a4 = (int)result;
  return result;
}

int *sub_137E0(int *result, char **a2, uint64_t a3, uint64_t a4)
{
  if (result[8] == *((_DWORD *)a2 + 8) && (float v4 = result, result[7] == *((_DWORD *)a2 + 7)))
  {
    int v5 = HIDWORD(a3) - a3;
    if (SHIDWORD(a3) > (int)a3)
    {
      int v6 = a4;
      int v7 = HIDWORD(a4) - a4;
      int v8 = *a2;
      uint64_t v9 = result[5];
      uint64_t v10 = *(void *)result + (int)v9 * (uint64_t)(int)a3;
      uint64_t v11 = *((int *)a2 + 5);
      do
      {
        int v12 = v4[8] * v4[7];
        float result = (int *)memmove(v8, (const void *)(v10 + v12 * v6), v12 * v7);
        v10 += v9;
        v8 += v11;
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    return (int *)puts("copySliceOfBitmapToBitmap: bytes per sample or samples per pixel differs!");
  }
  return result;
}

int *sub_138C4(int *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result[8] == *(_DWORD *)(a2 + 32) && (int v5 = result, result[7] == *(_DWORD *)(a2 + 28)))
  {
    int v6 = HIDWORD(a3) - a3;
    if (SHIDWORD(a3) > (int)a3)
    {
      int v7 = a4;
      int v8 = HIDWORD(a4) - a4;
      uint64_t v9 = *(int *)(a2 + 20);
      uint64_t v10 = *(void *)a2 + (int)v9 * (uint64_t)(int)a3;
      uint64_t v11 = *(char **)result;
      uint64_t v12 = result[5];
      do
      {
        float result = (int *)memmove((void *)(v10 + *(int *)(a2 + 28) * (uint64_t)v7 * *(int *)(a2 + 32)), v11, v5[7] * (uint64_t)v8 * v5[8]);
        v11 += v12;
        v10 += v9;
        --v6;
      }
      while (v6);
    }
  }
  else
  {
    return (int *)puts("copyBitmapToSliceOfBitmap: bytes per sample or samples per pixel differs!");
  }
  return result;
}

unint64_t sub_139B8(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, int8x8_t a7)
{
  int v7 = *(_DWORD *)(a1 + 12);
  if (v7 < 1) {
    return 0;
  }
  char v8 = 0;
  unsigned int v9 = 0;
  uint64_t v10 = (*(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28));
  uint64_t v11 = *(unsigned __int8 **)a2;
  uint64_t v12 = *(unsigned __int8 **)a1;
  uint64_t v13 = *(int *)(a1 + 20);
  int v14 = *(_DWORD *)(a1 + 8);
  if (v14 <= 1) {
    int v15 = 1;
  }
  else {
    int v15 = *(_DWORD *)(a1 + 8);
  }
  int32x2_t v16 = 0;
  int32x2_t v17 = 0;
  do
  {
    if (v14 >= 1)
    {
      if (v10 > 8 || ((1 << v10) & 0x116) == 0)
      {
        puts("bitmapToBitmapDifferenceBitmapRect: source pixel configuration illegal");
        return 0;
      }
      unsigned int v18 = 0;
      int v19 = v11;
      unsigned int v20 = v12;
      int32x2_t v21 = v16;
      do
      {
        switch(v10)
        {
          case 4:
            if (*v20 != *v19
              || (v20[1] == v19[1] ? (BOOL v22 = v20[2] == v19[2]) : (BOOL v22 = 0),
                  v22 ? (BOOL v23 = v20[3] == v19[3]) : (BOOL v23 = 0),
                  !v23))
            {
LABEL_35:
              int32x2_t v16 = (int32x2_t)__PAIR64__(v18, v9);
              if (v8)
              {
                a7 = (int8x8_t)vcgt_s32(v17, (int32x2_t)__PAIR64__(v18, v9));
                int32x2_t v17 = vmin_s32((int32x2_t)__PAIR64__(v18, v9), v17);
                int32x2_t v16 = (int32x2_t)vbsl_s8(a7, (int8x8_t)v21, (int8x8_t)vmax_s32((int32x2_t)__PAIR64__(v18, v9), v21));
                char v8 = 1;
              }
              else
              {
                char v8 = 1;
                int32x2_t v17 = (int32x2_t)__PAIR64__(v18, v9);
              }
              goto LABEL_38;
            }
            break;
          case 2:
            if (*v20 != *v19 || v20[1] != v19[1]) {
              goto LABEL_35;
            }
            break;
          case 1:
            if (*v20 != *v19) {
              goto LABEL_35;
            }
            break;
          default:
            if (*v20 != *v19) {
              goto LABEL_35;
            }
            v16.i32[0] = *(_DWORD *)(v19 + 1);
            a7.i32[0] = *(_DWORD *)(v20 + 1);
            a7 = (int8x8_t)vmovl_u8((uint8x8_t)a7).u64[0];
            if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16((int16x4_t)vmvn_s8((int8x8_t)vceq_s16((int16x4_t)a7, (int16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v16))), 0xFuLL))) & 1) != 0|| v20[5] != v19[5]|| v20[6] != v19[6]|| v20[7] != v19[7])
            {
              goto LABEL_35;
            }
            break;
        }
        int32x2_t v16 = v21;
LABEL_38:
        ++v18;
        v20 += v10;
        v19 += *(int *)(a2 + 32) * (uint64_t)*(int *)(a2 + 28);
        int32x2_t v21 = v16;
      }
      while (v15 != v18);
    }
    ++v9;
    v12 += v13;
    v11 += *(int *)(a2 + 20);
  }
  while (v9 != v7);
  if (v8)
  {
    v25.i64[0] = v17.u32[0];
    v25.i64[1] = v17.u32[1];
    return vorrq_s8((int8x16_t)vshll_n_s32(vadd_s32(v16, (int32x2_t)0x100000001), 0x20uLL), v25).u64[0];
  }
  return 0;
}

unint64_t sub_13BF4(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return a2 | (unint64_t)(a4 << 32);
}

uint64_t sub_13C0C(uint64_t a1, char *a2)
{
  uint64_t v3 = *(int *)(a1 + 16);
  uint64_t v4 = *(int *)(a1 + 28);
  puts(a2);
  if (*(int *)(a1 + 12) >= 1)
  {
    int v5 = 0;
    int v6 = *(unsigned __int8 **)a1;
    do
    {
      if (*(int *)(a1 + 8) >= 1)
      {
        int v7 = 0;
        char v8 = v6;
        do
        {
          printf("%3d ", *v8);
          ++v7;
          v8 += v4;
        }
        while (v7 < *(_DWORD *)(a1 + 8));
      }
      putchar(10);
      ++v5;
      v6 += v3;
    }
    while (v5 < *(_DWORD *)(a1 + 12));
  }

  return putchar(10);
}

unint64_t sub_13CE0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (a1 + a4) | ((unint64_t)(HIDWORD(a1) - a4) << 32);
}

unint64_t sub_13D04(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (a1 + a4) | ((unint64_t)(HIDWORD(a1) + a4) << 32);
}

uint64_t sub_13D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((int)a1 <= (int)a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = a1;
  }
  if (SHIDWORD(a1) >= SHIDWORD(a3)) {
    uint64_t v4 = HIDWORD(a3);
  }
  else {
    uint64_t v4 = HIDWORD(a1);
  }
  return v3 | (v4 << 32);
}

uint64_t sub_13D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((int)a1 >= (int)a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = a1;
  }
  if (SHIDWORD(a1) <= SHIDWORD(a3)) {
    uint64_t v4 = HIDWORD(a3);
  }
  else {
    uint64_t v4 = HIDWORD(a1);
  }
  return v3 | (v4 << 32);
}

unint64_t sub_13DA0(uint64_t a1)
{
  if ((int)a1 >= 0) {
    int v1 = a1;
  }
  else {
    int v1 = a1 + 1;
  }
  return (v1 >> 1) | ((unint64_t)(SHIDWORD(a1) / 2) << 32);
}

unint64_t sub_13DE4(uint64_t a1)
{
  return (2 * a1) & 0xFFFFFFFEFFFFFFFELL;
}

unint64_t sub_13DF8(uint64_t a1)
{
  return (a1 + 0x100000000) & 0xFFFFFFFE00000000 | a1 & 0xFFFFFFFE;
}

double sub_13E20(unsigned int a1, unsigned int a2, unsigned int a3)
{
  int32x2_t v3 = vdup_n_s32(a3);
  int32x2_t v4 = vadd_s32(v3, (int32x2_t)__PAIR64__(a1, a2));
  int8x8_t v5 = (int8x8_t)vadd_s32(v4, (int32x2_t)0x100000001);
  unint64_t v6 = *(void *)&vsub_s32((int32x2_t)__PAIR64__(a1, a2), v3) & 0xFFFFFFFEFFFFFFFELL;
  v7.i64[0] = v6;
  v7.i64[1] = HIDWORD(v6);
  *(void *)&double result = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)vbsl_s8((int8x8_t)vceqz_s32((int32x2_t)vand_s8(v5, (int8x8_t)0x100000001)), v5, (int8x8_t)vadd_s32((int32x2_t)(*(void *)&v4 & 0xFFFFFFFEFFFFFFFELL), (int32x2_t)0x200000002)), 0x20uLL), v7).u64[0];
  return result;
}

unint64_t sub_13E70(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = HIDWORD(a1);
  if ((int)(*(_DWORD *)(a3 + 12) & 0xFFFFFFFE) < SHIDWORD(a1)) {
    LODWORD(v3) = *(_DWORD *)(a3 + 12) & 0xFFFFFFFE;
  }
  return a1 & ~((int)a1 >> 31) | ((unint64_t)(v3
                                                                 - (((_BYTE)v3
                                                                   - (a1 & ~((int)a1 >> 31))) & 1)) << 32);
}

uint64_t sub_13EE4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = a1;
  if ((int)(a4 & 0xFFFFFFFE) >= SHIDWORD(a1)) {
    uint64_t v5 = HIDWORD(a1);
  }
  else {
    uint64_t v5 = a4 & 0xFFFFFFFE;
  }
  if ((int)a1 < 0) {
    uint64_t v4 = 0;
  }
  return v4 | (v5 << 32);
}

char *sub_13F2C(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 8) < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  int v3 = *(_DWORD *)(a1 + 12);
  if (v3 < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  size_t v4 = *(int *)(a1 + 16);
  uint64_t v5 = *(int *)(a1 + 28);
  if (a2 >= 0) {
    int v6 = a2;
  }
  else {
    int v6 = a2 + 1;
  }
  if (v3 <= (int)v4) {
    int v3 = *(_DWORD *)(a1 + 16);
  }
  double result = (char *)malloc_type_calloc(v3, 1uLL, 0x293D63F1uLL);
  if (result)
  {
    int v9 = -(v6 >> 1);
    int v10 = a2 - (v6 >> 1);
    int v11 = *(_DWORD *)(a1 + 12);
    int v12 = a2;
    if (v11 >= 1)
    {
      int v13 = 0;
      int v14 = 0;
      int v15 = *(char **)a1;
      int v16 = v6 >> 1;
      if ((v6 >> 1) + 1 <= 1) {
        int v17 = 1;
      }
      else {
        int v17 = (v6 >> 1) + 1;
      }
      double v64 = result;
      int v65 = v12;
      uint64_t v63 = (int)v5 * (uint64_t)v12;
      do
      {
        int v67 = v14;
        double v66 = v15;
        memmove(result, v15, v4);
        if ((int)v5 < 1)
        {
          double result = v64;
          int v12 = v65;
          int v19 = v67;
          unsigned int v20 = v66;
        }
        else
        {
          uint64_t v18 = 0;
          double result = v64;
          int v12 = v65;
          int v19 = v67;
          unsigned int v20 = v66;
          uint64_t v62 = v5 * (v9 - 1);
          do
          {
            int32x2_t v21 = &v64[v18];
            BOOL v22 = &v66[v18];
            if (v65 < -1)
            {
              int v28 = 0;
            }
            else
            {
              int v23 = 0;
              int v24 = -(v6 >> 1);
              do
              {
                if (v23 <= v16) {
                  int v25 = v6 >> 1;
                }
                else {
                  int v25 = v23;
                }
                if (v23 < v16) {
                  int v26 = -v23;
                }
                else {
                  int v26 = -(v6 >> 1);
                }
                if (v26 >= v10)
                {
                  int v13 = 0;
                }
                else
                {
                  int v13 = 0;
                  uint64_t v27 = (int)v5 * (v25 + v24);
                  do
                  {
                    if (v13 <= v21[v27]) {
                      int v13 = v21[v27];
                    }
                    ++v26;
                    v27 += v5;
                  }
                  while (v26 < v10);
                }
                ++v23;
                *BOOL v22 = v13;
                v21 += v5;
                v22 += v5;
                --v24;
              }
              while (v23 != v17);
              int v28 = v17;
            }
            int v29 = *(_DWORD *)(a1 + 8);
            int v30 = v29 - v10;
            if (v28 < v29 - v10)
            {
              float v31 = &v21[v62];
              float v32 = (unsigned __int8 *)&v21[v62 + v63];
              do
              {
                if (v13 <= *v31 || v13 <= *v32)
                {
                  float v33 = (unsigned __int8 *)&v31[v5];
                  if (&v31[v5] <= (char *)v32)
                  {
                    int v13 = 0;
                    do
                    {
                      if (v13 <= *v33) {
                        int v13 = *v33;
                      }
                      v33 += v5;
                    }
                    while (v33 <= v32);
                  }
                  else
                  {
                    int v13 = 0;
                  }
                }
                ++v28;
                v21 += v5;
                *BOOL v22 = v13;
                v31 += v5;
                v32 += v5;
                v22 += v5;
              }
              while (v28 < v30);
              goto LABEL_47;
            }
            int v30 = v28;
            while (v30 < v29)
            {
              if (v30 + v10 <= v29) {
                int v34 = v10;
              }
              else {
                int v34 = v29 - v30;
              }
              if (v9 >= v34)
              {
                LOBYTE(v35) = 0;
              }
              else
              {
                int v35 = 0;
                uint64_t v36 = (int)v5 * v9;
                int v37 = -(v6 >> 1);
                do
                {
                  if (v35 <= v21[v36]) {
                    int v35 = v21[v36];
                  }
                  ++v37;
                  v36 += v5;
                }
                while (v37 < v34);
              }
              *BOOL v22 = v35;
              ++v30;
              v21 += v5;
              v22 += v5;
LABEL_47:
              int v29 = *(_DWORD *)(a1 + 8);
            }
            ++v18;
          }
          while (v18 != v5);
        }
        int v14 = v19 + 1;
        int v15 = &v20[v4];
        int v11 = *(_DWORD *)(a1 + 12);
      }
      while (v14 < v11);
    }
    if (*(_DWORD *)(a1 + 8) * (int)v5 >= 1)
    {
      int v38 = 0;
      uint64_t v39 = *(char **)a1;
      int v40 = (v6 >> 1) + 1;
      int v41 = v6 >> 1;
      if (v40 <= 1) {
        int v40 = 1;
      }
      do
      {
        if (v11 >= 1)
        {
          uint64_t v42 = 0;
          uint64_t v43 = v39;
          do
          {
            result[v42] = *v43;
            v43 += v4;
            int v11 = *(_DWORD *)(a1 + 12);
            ++v42;
          }
          while ((int)v42 < v11);
        }
        if (v12 < -1)
        {
          int v52 = 0;
          int v50 = 0;
          uint64_t v47 = result;
          unint64_t v46 = v39;
        }
        else
        {
          int v44 = 0;
          int v45 = -(v6 >> 1);
          unint64_t v46 = v39;
          uint64_t v47 = result;
          do
          {
            if (v44 <= v41) {
              int v48 = v6 >> 1;
            }
            else {
              int v48 = v44;
            }
            if (v44 < v41) {
              int v49 = -v44;
            }
            else {
              int v49 = -(v6 >> 1);
            }
            if (v49 >= v10)
            {
              int v50 = 0;
            }
            else
            {
              int v50 = 0;
              uint64_t v51 = v48 + v45;
              do
              {
                if (v50 <= v47[v51]) {
                  int v50 = v47[v51];
                }
                ++v51;
              }
              while ((int)v51 < v10);
            }
            ++v44;
            *unint64_t v46 = v50;
            ++v47;
            v46 += v4;
            --v45;
          }
          while (v44 != v40);
          int v11 = *(_DWORD *)(a1 + 12);
          int v52 = v40;
        }
        int v53 = v11 - v10;
        if (v52 < v11 - v10)
        {
          long long v54 = &v47[v9 - 1];
          long long v55 = (unsigned __int8 *)&v54[v12];
          do
          {
            if (v50 <= *v54 || v50 <= *v55)
            {
              double v56 = (unsigned __int8 *)(v54 + 1);
              if (v54 + 1 <= (char *)v55)
              {
                int v50 = 0;
                do
                {
                  int v58 = *v56++;
                  int v57 = v58;
                  if (v50 <= v58) {
                    int v50 = v57;
                  }
                }
                while (v56 <= v55);
              }
              else
              {
                int v50 = 0;
              }
            }
            ++v52;
            ++v47;
            *unint64_t v46 = v50;
            ++v54;
            ++v55;
            v46 += v4;
          }
          while (v52 < v53);
          goto LABEL_101;
        }
        int v53 = v52;
        while (v53 < v11)
        {
          if (v53 + v10 <= v11) {
            int v59 = v10;
          }
          else {
            int v59 = v11 - v53;
          }
          if (v9 >= v59)
          {
            LOBYTE(v60) = 0;
          }
          else
          {
            int v60 = 0;
            uint64_t v61 = v9;
            do
            {
              if (v60 <= v47[v61]) {
                int v60 = v47[v61];
              }
              ++v61;
            }
            while ((int)v61 < v59);
          }
          *unint64_t v46 = v60;
          ++v53;
          ++v47;
          v46 += v4;
LABEL_101:
          int v11 = *(_DWORD *)(a1 + 12);
        }
        ++v38;
        ++v39;
      }
      while (v38 < *(_DWORD *)(a1 + 8) * (int)v5);
    }
    free(result);
    return (unsigned char *)(&dword_0 + 1);
  }
  return result;
}

char *sub_143F0(char **a1, int a2)
{
  if (*((_DWORD *)a1 + 2) < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  int v4 = *((_DWORD *)a1 + 3);
  if (v4 < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  size_t v5 = *((int *)a1 + 4);
  uint64_t v6 = *((int *)a1 + 7);
  if (a2 >= 0) {
    int v7 = a2;
  }
  else {
    int v7 = a2 + 1;
  }
  if (v4 <= (int)v5) {
    int v4 = *((_DWORD *)a1 + 4);
  }
  double result = (char *)malloc_type_malloc(v4, 0x4A7C05C1uLL);
  if (result)
  {
    int v9 = result;
    int v10 = -(v7 >> 1);
    int v11 = a2 - (v7 >> 1);
    int v12 = *((_DWORD *)a1 + 3);
    if (v12 >= 1)
    {
      int v13 = 0;
      int v14 = *a1;
      int v15 = -v10;
      do
      {
        memmove(v9, v14, v5);
        if ((int)v6 >= 1)
        {
          uint64_t v16 = 0;
          int v17 = *((_DWORD *)a1 + 2);
          do
          {
            if (v17 >= 1)
            {
              int v18 = 0;
              int v19 = &v14[v16];
              unsigned int v20 = &v9[v16];
              int v21 = v10;
              do
              {
                if (v18 <= v15) {
                  int v22 = -v10;
                }
                else {
                  int v22 = v18;
                }
                if (v18 < v15) {
                  int v23 = -v18;
                }
                else {
                  int v23 = v10;
                }
                if (v18 + v11 <= v17) {
                  int v24 = v11;
                }
                else {
                  int v24 = v17 - v18;
                }
                if (v23 >= v24)
                {
                  LOBYTE(v26) = -1;
                }
                else
                {
                  uint64_t v25 = (int)v6 * (v22 + v21);
                  int v26 = 255;
                  do
                  {
                    if (v26 >= v20[v25]) {
                      int v26 = v20[v25];
                    }
                    ++v23;
                    v25 += v6;
                  }
                  while (v23 < v24);
                }
                *int v19 = v26;
                ++v18;
                v20 += v6;
                v19 += v6;
                int v17 = *((_DWORD *)a1 + 2);
                --v21;
              }
              while (v18 < v17);
            }
            ++v16;
          }
          while (v16 != v6);
        }
        ++v13;
        v14 += v5;
        int v12 = *((_DWORD *)a1 + 3);
      }
      while (v13 < v12);
    }
    if (*((_DWORD *)a1 + 2) * (int)v6 >= 1)
    {
      int v27 = 0;
      int v28 = *a1;
      int v29 = -v10;
      do
      {
        if (v12 >= 1)
        {
          uint64_t v30 = 0;
          float v31 = v28;
          do
          {
            v9[v30] = *v31;
            v31 += v5;
            int v12 = *((_DWORD *)a1 + 3);
            ++v30;
          }
          while ((int)v30 < v12);
          if (v12 >= 1)
          {
            int v32 = 0;
            int v33 = v10;
            int v34 = v28;
            int v35 = v9;
            do
            {
              if (v32 <= v29) {
                int v36 = -v10;
              }
              else {
                int v36 = v32;
              }
              if (v32 < v29) {
                int v37 = -v32;
              }
              else {
                int v37 = v10;
              }
              if (v32 + v11 <= v12) {
                int v38 = v11;
              }
              else {
                int v38 = v12 - v32;
              }
              if (v37 >= v38)
              {
                LOBYTE(v40) = -1;
              }
              else
              {
                uint64_t v39 = v36 + v33;
                int v40 = 255;
                do
                {
                  if (v40 >= v35[v39]) {
                    int v40 = v35[v39];
                  }
                  ++v39;
                }
                while ((int)v39 < v38);
              }
              *int v34 = v40;
              ++v32;
              ++v35;
              v34 += v5;
              int v12 = *((_DWORD *)a1 + 3);
              --v33;
            }
            while (v32 < v12);
          }
        }
        ++v27;
        ++v28;
      }
      while (v27 < *((_DWORD *)a1 + 2) * (int)v6);
    }
    free(v9);
    return (unsigned char *)(&dword_0 + 1);
  }
  return result;
}

char *sub_14664(char **a1, int a2)
{
  if (*((_DWORD *)a1 + 2) < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  int v4 = *((_DWORD *)a1 + 3);
  if (v4 < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  uint64_t v5 = *((int *)a1 + 4);
  uint64_t v6 = *((int *)a1 + 7);
  if (a2 >= 0) {
    int v7 = a2;
  }
  else {
    int v7 = a2 + 1;
  }
  if (v4 <= (int)v5) {
    int v4 = *((_DWORD *)a1 + 4);
  }
  double result = (char *)malloc_type_malloc(2 * v4, 0x4A7C05C1uLL);
  if (result)
  {
    int v9 = result;
    int v10 = -(v7 >> 1);
    int v11 = a2 - (v7 >> 1);
    int v12 = *((_DWORD *)a1 + 3);
    size_t v13 = 2 * v5;
    if (v12 >= 1)
    {
      uint64_t v45 = v5;
      int v14 = 0;
      int v15 = *a1;
      int v16 = v7 >> 1;
      uint64_t v17 = 2 * v6;
      do
      {
        int v46 = v14;
        memmove(v9, v15, v13);
        if ((int)v6 >= 1)
        {
          uint64_t v18 = 0;
          int v19 = *((_DWORD *)a1 + 2);
          unsigned int v20 = v9;
          do
          {
            if (v19 >= 1)
            {
              int v21 = 0;
              int v22 = v10;
              int v23 = v20;
              int v24 = &v15[2 * v18];
              do
              {
                if (v21 <= v16) {
                  int v25 = -v10;
                }
                else {
                  int v25 = v21;
                }
                if (v21 < v16) {
                  int v26 = -v21;
                }
                else {
                  int v26 = v10;
                }
                int v27 = v19 - v21;
                if (v21 + v11 <= v19) {
                  int v27 = v11;
                }
                if (v26 >= v27)
                {
                  LOWORD(v28) = 0;
                }
                else
                {
                  int v28 = 0;
                  int v29 = &v23[2 * (int)v6 * (v25 + v22)];
                  do
                  {
                    if (v28 <= *(unsigned __int16 *)v29) {
                      int v28 = *(unsigned __int16 *)v29;
                    }
                    ++v26;
                    v29 += v17;
                  }
                  while (v26 < v27);
                }
                *(_WORD *)int v24 = v28;
                ++v21;
                v24 += 2 * v6;
                v23 += v17;
                --v22;
              }
              while (v21 != v19);
            }
            ++v18;
            v20 += 2;
          }
          while (v18 != v6);
        }
        int v14 = v46 + 1;
        v15 += 2 * v45;
        int v12 = *((_DWORD *)a1 + 3);
      }
      while (v46 + 1 < v12);
      uint64_t v5 = v45;
    }
    int v30 = *((_DWORD *)a1 + 2) * v6;
    if (v30 >= 1)
    {
      int v31 = 0;
      int v32 = *a1;
      int v33 = -v10;
      do
      {
        if (v12 >= 1)
        {
          uint64_t v34 = 0;
          int v35 = v32;
          do
          {
            *(_WORD *)&v9[2 * v34++] = *v35;
            int v35 = (_WORD *)((char *)v35 + v13);
          }
          while (v12 != v34);
          int v36 = 0;
          int v37 = v10;
          int v38 = v32;
          uint64_t v39 = v9;
          do
          {
            if (v36 <= v33) {
              int v40 = -v10;
            }
            else {
              int v40 = v36;
            }
            if (v36 < v33) {
              int v41 = -v36;
            }
            else {
              int v41 = v10;
            }
            int v42 = v12 - v36;
            if (v36 + v11 <= v12) {
              int v42 = v11;
            }
            if (v41 >= v42)
            {
              LOWORD(v43) = 0;
            }
            else
            {
              int v43 = 0;
              uint64_t v44 = 2 * (v40 + v37);
              do
              {
                if (v43 <= *(unsigned __int16 *)&v39[v44]) {
                  int v43 = *(unsigned __int16 *)&v39[v44];
                }
                ++v41;
                v44 += 2;
              }
              while (v41 < v42);
            }
            *int v38 = v43;
            ++v36;
            v39 += 2;
            v38 += v5;
            --v37;
          }
          while (v36 != v12);
        }
        ++v31;
        v32 += 2;
      }
      while (v31 != v30);
    }
    free(v9);
    return (unsigned char *)(&dword_0 + 1);
  }
  return result;
}

char *sub_148F8(char **a1, int a2)
{
  if (*((_DWORD *)a1 + 2) < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  int v4 = *((_DWORD *)a1 + 3);
  if (v4 < a2) {
    return (unsigned char *)(&dword_0 + 1);
  }
  uint64_t v5 = *((int *)a1 + 4);
  uint64_t v6 = *((int *)a1 + 7);
  if (a2 >= 0) {
    int v7 = a2;
  }
  else {
    int v7 = a2 + 1;
  }
  if (v4 <= (int)v5) {
    int v4 = *((_DWORD *)a1 + 4);
  }
  double result = (char *)malloc_type_malloc(2 * v4, 0x4A7C05C1uLL);
  if (result)
  {
    int v9 = result;
    int v10 = -(v7 >> 1);
    int v11 = a2 - (v7 >> 1);
    int v12 = *((_DWORD *)a1 + 3);
    size_t v13 = 2 * v5;
    if (v12 >= 1)
    {
      uint64_t v45 = v5;
      int v14 = 0;
      int v15 = *a1;
      int v16 = v7 >> 1;
      uint64_t v17 = 2 * v6;
      do
      {
        int v46 = v14;
        memmove(v9, v15, v13);
        if ((int)v6 >= 1)
        {
          uint64_t v18 = 0;
          int v19 = *((_DWORD *)a1 + 2);
          unsigned int v20 = v9;
          do
          {
            if (v19 >= 1)
            {
              int v21 = 0;
              int v22 = v10;
              int v23 = v20;
              int v24 = &v15[2 * v18];
              do
              {
                if (v21 <= v16) {
                  int v25 = -v10;
                }
                else {
                  int v25 = v21;
                }
                if (v21 < v16) {
                  int v26 = -v21;
                }
                else {
                  int v26 = v10;
                }
                if (v21 + v11 <= v19) {
                  int v27 = v11;
                }
                else {
                  int v27 = v19 - v21;
                }
                if (v26 >= v27)
                {
                  LOWORD(v29) = -1;
                }
                else
                {
                  int v28 = &v23[2 * (int)v6 * (v25 + v22)];
                  int v29 = 0xFFFF;
                  do
                  {
                    if (v29 >= *(unsigned __int16 *)v28) {
                      int v29 = *(unsigned __int16 *)v28;
                    }
                    ++v26;
                    v28 += v17;
                  }
                  while (v26 < v27);
                }
                *(_WORD *)int v24 = v29;
                ++v21;
                v24 += 2 * v6;
                v23 += v17;
                --v22;
              }
              while (v21 != v19);
            }
            ++v18;
            v20 += 2;
          }
          while (v18 != v6);
        }
        int v14 = v46 + 1;
        v15 += 2 * v45;
        int v12 = *((_DWORD *)a1 + 3);
      }
      while (v46 + 1 < v12);
      uint64_t v5 = v45;
    }
    int v30 = *((_DWORD *)a1 + 2) * v6;
    if (v30 >= 1)
    {
      int v31 = 0;
      int v32 = *a1;
      int v33 = -v10;
      do
      {
        if (v12 >= 1)
        {
          uint64_t v34 = 0;
          int v35 = v32;
          do
          {
            *(_WORD *)&v9[2 * v34++] = *v35;
            int v35 = (_WORD *)((char *)v35 + v13);
          }
          while (v12 != v34);
          int v36 = 0;
          int v37 = v10;
          int v38 = v32;
          uint64_t v39 = v9;
          do
          {
            if (v36 <= v33) {
              int v40 = -v10;
            }
            else {
              int v40 = v36;
            }
            if (v36 < v33) {
              int v41 = -v36;
            }
            else {
              int v41 = v10;
            }
            if (v36 + v11 <= v12) {
              int v42 = v11;
            }
            else {
              int v42 = v12 - v36;
            }
            if (v41 >= v42)
            {
              LOWORD(v44) = -1;
            }
            else
            {
              uint64_t v43 = 2 * (v40 + v37);
              int v44 = 0xFFFF;
              do
              {
                if (v44 >= *(unsigned __int16 *)&v39[v43]) {
                  int v44 = *(unsigned __int16 *)&v39[v43];
                }
                ++v41;
                v43 += 2;
              }
              while (v41 < v42);
            }
            *int v38 = v44;
            ++v36;
            v39 += 2;
            v38 += v5;
            --v37;
          }
          while (v36 != v12);
        }
        ++v31;
        v32 += 2;
      }
      while (v31 != v30);
    }
    free(v9);
    return (unsigned char *)(&dword_0 + 1);
  }
  return result;
}

void sub_14CE4(id a1)
{
  id v1 = +[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_srgbToIPT(__sample im) \n { \n vec3 lms = im.r * vec3(0.3139902162, 0.15537240628, 0.01775238698) + \n im.g * vec3(0.63951293834, 0.75789446163, 0.1094420944) + \n im.b * vec3(0.04649754622, 0.08670141862, 0.87256922462); \n lms = sign(lms)*pow(abs(lms), vec3(0.43)); \n vec3 ipt = lms.r * vec3(0.4, 4.455, 0.8056) + \n lms.g * vec3(0.4, -4.851, 0.3572) + \n lms.b * vec3(0.2, 0.396,-1.1628); \n return vec4(ipt, im.a); \n } \n"];
  qword_8CB78 = (uint64_t)v1;

  [v1 setPerservesAlpha:1];
}

void sub_14D70(id a1)
{
  qword_8CB88 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_rectToHueChroma(__sample im) \n { \n vec4 ihc = im; \n ihc.g = atan(im.b, im.g); \n ihc.b = sqrt(im.g*im.g+im.b*im.b); \n return ihc; \n } \n"];
}

void sub_15054(id a1)
{
  id v1 = +[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_iptToSRGB(__sample ipt) \n { \n vec3 lms = ipt.r * vec3(1.0000, 1.0000, 1.0000) + \n ipt.g * vec3(0.0976,-0.1139, 0.0326) + \n ipt.b * vec3(0.2052, 0.1332,-0.6769); \n lms = sign(lms)*pow(abs(lms), vec3(1.0/.43)); \n vec3 im = lms.r * vec3(5.472212058380287, -1.125241895533569, 0.029801651173470) + \n lms.g * vec3(-4.641960098354471, 2.293170938060623, -0.193180728257140) + \n lms.b * vec3(0.169637076827974, -0.167895202223709, 1.163647892783812); \n return vec4(im, ipt.a); \n } \n"];
  qword_8CB98 = (uint64_t)v1;

  [v1 setPerservesAlpha:1];
}

void sub_150E0(id a1)
{
  qword_8CBA8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_hueChromaToRect(__sample ihc) \n { \n vec4 ipt = ihc; \n ipt.g = ihc.b * cos(ihc.g); \n ipt.b = ihc.b * sin(ihc.g); \n return ipt; \n } \n"];
}

void sub_15E9C(id a1)
{
  qword_8CBB8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_scaleHue(__sample im, float s) \n { \n im.g = (im.g+s)/(2.0*s); \n return im; \n } \n"];
}

void sub_15F14(id a1)
{
  qword_8CBC8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_scaleHuePi(__sample im, float s) \n { \n im.g = im.g*2.0*s - s; \n return im; \n } \n"];
}

void sub_17140(id a1)
{
  qword_8CBD8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"float _inTriangle(vec2 p1, vec2 p2, vec2 p3){ \n float b1 = (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y); \n return b1; \n } \n BOOL _isInTriangle(vec4 p12, vec2 p34, vec2 pt){ \n BOOL b1, b2, b3 ;\n vec2 v1 = p12.xy; \n vec2 v2 = p12.zw; \n vec2 int v3 = p34.xy; \n b1 = _inTriangle(pt, v1, v2) < 0.0; \n b2 = _inTriangle(pt, v2, v3) < 0.0; \n b3 = _inTriangle(pt, v3, v1) < 0.0; \n return ((b1 == b2) && (b2 == b3)); \n } \n kernel vec4 _pf_drawTriangle(__sample im, vec4 p12, vec2 p34, float str, float alpha) \n { \n vec2 pt = destCoord(); \n BOOL ins = _isInTriangle(p12, p34, pt); \n vec4 scaled = clamp(str*im, 0.0, 1.0); \n float y = dot(im.rgb, vec3(.333333)); \n float s = im.r+im.g+im.b-3.0*y; \n s = -.333*smoothstep(0.0, .333, s) + .333; \n scaled.rgb = s*(scaled.rgb-str*y)+str*y; \n scaled.a = alpha * (.3*y+.7); \n im = ins ? scaled : vec4(0.0); \n return im; \n }"];
}

void sub_171B8(id a1)
{
  qword_8CBE8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_protectEyes(__sample im, vec4 eyes, float radius) \n { \n vec2 pt = destCoord(); \n float dCGFloat x = eyes.x-pt.x; \n float dy = eyes.y-pt.y; \n float a = 1.0 - exp(-(dx*dx + dy*dy)/(2.0*radius)); \n im *= a; dCGFloat x = eyes.z-pt.x; \n dy = eyes.w-pt.y; \n a = 1.0 - exp(-(dx*dx + dy*dy)/(2.0*radius)); \n im *= a; \n return im; \n }"];
}

char *sub_18208(unsigned int a1)
{
  uint64_t v2 = (char *)malloc_type_malloc(16 * a1 + 24, 0x344C54A3uLL);
  int v3 = v2 + 24;
  *(void *)uint64_t v2 = v2 + 24;
  *((_DWORD *)v2 + 2) = a1;
  *((void *)v2 + 2) = 0;
  if (a1)
  {
    uint64_t v4 = a1;
    do
    {
      *int v3 = 0;
      v3 += 16;
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = malloc_type_malloc(0x1D4D8uLL, 0x61CF12B5uLL);
  *uint64_t v5 = v5 + 3;
  v5[1] = 5000;
  v5[2] = 0;
  *((void *)v2 + 2) = v5;
  return v2;
}

void sub_18298(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[2];
    if (v2)
    {
      do
      {
        int v3 = (void *)v2[2];
        free(v2);
        uint64_t v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

void sub_182EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(void **)(v2 + 16);
  if (v3)
  {
    do
    {
      uint64_t v4 = (void *)v3[2];
      free(v3);
      int v3 = v4;
    }
    while (v4);
  }
  *(_DWORD *)(v2 + 12) = 0;
  *(void *)(v2 + 16) = 0;
  uint64_t v5 = *(void **)a1;
  size_t v6 = 16 * *(unsigned int *)(a1 + 8);

  bzero(v5, v6);
}

uint64_t sub_18354(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v3 = BYTE2(a2) | (BYTE2(a2) << 8);
  if (!*(unsigned char *)(*(void *)a1
                 + 16
                 * ((257 * (16974593 * a2 + BYTE3(a2) + 66049 * BYTE1(a2) + v3) + BYTE4(a2) + 842144005)
                  % *(_DWORD *)(a1 + 8))))
    return 0;
  uint64_t v4 = *(void *)(*(void *)a1
                 + 16
                 * ((257 * (16974593 * a2 + BYTE3(a2) + 66049 * BYTE1(a2) + v3) + BYTE4(a2) + 842144005)
                  % *(_DWORD *)(a1 + 8))
                 + 8);
  if (!v4) {
    return 0;
  }
  while (*(void *)v4 != a2)
  {
    uint64_t v4 = *(void *)(v4 + 16);
    if (!v4) {
      return 0;
    }
  }
  *a3 = *(_DWORD *)(v4 + 8);
  return 1;
}

char *sub_183F0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = (257 * (16974593 * a2 + BYTE3(a2) + 66049 * BYTE1(a2) + (BYTE2(a2) | (BYTE2(a2) << 8)))
      + BYTE4(a2)
      + 842144005)
     % *(_DWORD *)(a1 + 8);
  uint64_t v6 = *(void *)a1;
  int v7 = (unsigned char *)(*(void *)a1 + 16 * v5);
  int v8 = *v7;
  double result = sub_184B8(a1);
  if (v8)
  {
    *((void *)result + 2) = *(void *)(v6 + 16 * v5 + 8);
  }
  else
  {
    *((void *)result + 2) = 0;
    *int v7 = 1;
  }
  *(void *)double result = a2;
  *((_DWORD *)result + 2) = a3;
  *(void *)(v6 + 16 * v5 + 8) = result;
  return result;
}

char *sub_184B8(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 16);
  unsigned int v3 = v2[3];
  if (v3 == v2[2])
  {
    uint64_t v2 = malloc_type_malloc(24 * v3 + 24, 0x61CF12B5uLL);
    uint64_t v4 = (char *)(v2 + 6);
    *(void *)uint64_t v2 = v2 + 6;
    v2[2] = v3;
    v2[3] = 0;
    *((void *)v2 + 2) = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v2;
    unsigned int v3 = 0;
  }
  else
  {
    uint64_t v4 = *(char **)v2;
  }
  v2[3] = v3 + 1;
  return &v4[24 * v3];
}

id sub_18A44(void *a1, void *a2, void *a3)
{
  id result = [a1 length];
  if (result)
  {
    unint64_t v7 = (unint64_t)result;
    signed int v8 = [a2 intValue];
    unsigned int v9 = [a3 intValue];
    if (!v8 || (signed int v10 = v9) == 0)
    {
      signed int v8 = vcvtmd_s64_f64(sqrt((double)v7 * 0.5));
      signed int v10 = v8;
    }
    if (v7 == 2 * v8 * v10)
    {
      v16[0] = kCIImageProviderContentDigest;
      v16[1] = kCIImageProviderName;
      v17[0] = a1;
      v17[1] = @"CILocalLight";
      int v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      id v12 = objc_alloc((Class)CIImage);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_19490;
      v13[3] = &unk_750C8;
      signed int v14 = v8;
      signed int v15 = v10;
      v13[4] = a1;
      v13[5] = v7;
      return [v12 initWithImageProvider:v13 width:v8 height:v10 format:kCIFormatRG8 colorSpace:0 options:v11];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

id sub_18BCC(void *a1, void *a2, uint64_t a3)
{
  id result = 0;
  if (a1 && a2)
  {
    [a1 extent];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [a2 extent];
    v33.origin.CGFloat x = v15;
    v33.origin.CGFloat y = v16;
    v33.size.width = v17;
    v33.size.height = v18;
    v31.origin.CGFloat x = v8;
    v31.origin.CGFloat y = v10;
    v31.size.width = v12;
    v31.size.height = v14;
    if (CGRectEqualToRect(v31, v33))
    {
      return a1;
    }
    else
    {
      [a1 extent];
      v34.origin.CGFloat x = 0.0;
      v34.origin.CGFloat y = 0.0;
      v34.size.width = 1.0;
      v34.size.height = 1.0;
      if (CGRectEqualToRect(v32, v34))
      {
        id v19 = [a1 imageByClampingToExtent];
        [a2 extent];
        return objc_msgSend(v19, "imageByCroppingToRect:");
      }
      else
      {
        v29[0] = a1;
        v29[1] = a2;
        unsigned int v20 = +[NSArray arrayWithObjects:v29 count:2];
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 0), "extent");
        v28[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 1), "extent");
        v28[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
        int v21 = +[NSArray arrayWithObjects:v28 count:2];
        [a2 extent];
        v26[0] = @"imageExtents";
        v26[1] = @"guidedFilterEpsilon";
        v27[0] = v21;
        v27[1] = a3;
        return +[CIDynamicGuidedFilter applyWithExtent:inputs:arguments:error:](CIDynamicGuidedFilter, "applyWithExtent:inputs:arguments:error:", v20, +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2], 0, v22, v23, v24, v25);
      }
    }
  }
  return result;
}

void sub_190D4(id a1)
{
  qword_8CBF8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_shadowKernelDynamic(__sample im, __sample adj, float str) \n { \n adj.r = 3.4*adj.r-1.2; \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n vec4 orig = im; \n float y = sqrt(dot(im.rgb, vec3(.33333))); \n float s = mix(0.0, adj.r, str); \n vec3 gain = s > 0.0 ? vec3(0.0*s) : vec3(-2.75*s*s, -2.75*s*s, -2.5*s*s); \n gain *= 1.0 - .9*smoothstep(.5, .7, im.b); \n im.rgb = im.rgb*im.rgb*gain + im.rgb*(1.0-gain); \n float m = 1.0 + 1.85*s*(max(0.1-y, 0.0))*(1.0 - .9*smoothstep(.5, 0.7, im.b)) ;\n im.rgb = (clamp(m*im.rgb, 0.0, 1.0)); \n float midAmt = s < 0.0 ? min(s*s,1.0) : 0.0; \n y = y*(1.0-y); \n im.rgb = sqrt(im.rgb); \n float pivot = .4; \n float a = midAmt*y; \n float b = -pivot*a; \n vec3 piCGFloat x = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(pivot), -y*midAmt); \n im.rgb = mix(im.rgb, pix, 0.8); \n im.rgb = max(im.rgb, 0.0); \n im.rgb *= im.rgb; \n im.rgb = clamp(im.rgb, 0.0,1.0)+pos+neg; \n return im; \n }\n"];
}

void sub_1914C(id a1)
{
  qword_8CC08 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_polyKernelDynamic(__sample im, __sample adj, float str) \n { \n adj.r = 3.4*adj.r-1.2; \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n vec4 orig = im; \n float y = sqrt(dot(im.rgb, vec3(.33333))); \n float s = mix(0.0, adj.r, str); \n vec3 gain = s > 0.0 ? vec3(1.5*s) : vec3(1.75*s, 1.75*s, 1.55*s)*(1.0-.9*smoothstep(.5, .7, im.b)); \n im.rgb = im.rgb*im.rgb*gain + im.rgb*(1.0-gain); \n im.rgb = (clamp(im.rgb, 0.0, 1.0)); \n float midAmt = min(str, .5); \n y = y*(1.0-y); \n im.rgb = sqrt(im.rgb); \n float pivot = max(adj.g, 0.5); \n float a = midAmt*y; \n float b = -pivot*a; \n vec3 piCGFloat x = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(pivot), -y*midAmt); \n im.rgb = mix(im.rgb, pix, 0.8); \n im.rgb = max(im.rgb, 0.0); \n im.rgb *= im.rgb; \n im.rgb = clamp(im.rgb, 0.0,1.0)+pos+neg; \n return im; \n } \n"];
}

char *sub_19490(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4) {
    sub_4C0CC();
  }
  if (a5) {
    sub_4C0A0();
  }
  uint64_t v9 = *(int *)(a1 + 48);
  if (v9 != a6) {
    sub_4C074();
  }
  uint64_t v10 = a7;
  if (*(_DWORD *)(a1 + 52) != a7) {
    sub_4C048();
  }
  if (a3 == 2 * v9)
  {
    id v13 = [*(id *)(a1 + 32) bytes];
    size_t v14 = *(void *)(a1 + 40);
    return (char *)memcpy(a2, v13, v14);
  }
  else
  {
    id result = (char *)[*(id *)(a1 + 32) bytes];
    if (v10)
    {
      CGFloat v16 = result;
      size_t v17 = 2 * a6;
      do
      {
        id result = (char *)memcpy(a2, v16, v17);
        v16 += v17;
        a2 += a3;
        --v10;
      }
      while (v10);
    }
  }
  return result;
}

int sub_19574(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C798);

  return [AssociatedObject intValue];
}

void sub_195A4(NSDictionary *self, SEL a2, int a3)
{
  uint64_t v4 = +[NSNumber numberWithInt:*(void *)&a3];

  objc_setAssociatedObject(self, off_8C798, v4, (char *)&dword_0 + 1);
}

float sub_195F4(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C7A0);

  [AssociatedObject floatValue];
  return result;
}

void sub_19624(NSDictionary *self, SEL a2, float a3)
{
  uint64_t v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, off_8C7A0, v4, (char *)&dword_0 + 1);
}

float sub_19674(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C7A8);

  [AssociatedObject floatValue];
  return result;
}

void sub_196A4(NSDictionary *self, SEL a2, float a3)
{
  uint64_t v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, off_8C7A8, v4, (char *)&dword_0 + 1);
}

CGRect sub_196F4(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, &off_8C7B0);

  [AssociatedObject rectValue];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

void sub_19724(NSDictionary *self, SEL a2, CGRect a3)
{
  double v4 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  objc_setAssociatedObject(self, &off_8C7B0, v4, (char *)&dword_0 + 1);
}

id sub_1A2D0(uint64_t a1, void *a2)
{
  if (qword_8CEC0 != -1) {
    dispatch_once(&qword_8CEC0, &stru_755E8);
  }
  if (!qword_8CEC8) {
    sub_4C0F8();
  }
  if (a2) {
    double v4 = a2;
  }
  else {
    double v4 = CIContext;
  }

  return objc_msgSend(v4, "loadArchiveWithName:fromURL:", a1);
}

void sub_1B04C(id a1)
{
  CFStringRef v1 = (const __CFString *)CFPreferencesCopyAppValue(@"render_lighting_proxy", @"com.apple.coremedia");
  if (v1)
  {
    CFStringRef v2 = v1;
    if ((sub_1B0E8(v1) & 0x80000000) != 0 || (int)sub_1B0E8(v2) <= 2)
    {
      if ((sub_1B0E8(v2) & 0x80000000) != 0) {
        int v3 = 0;
      }
      else {
        int v3 = sub_1B0E8(v2);
      }
    }
    else
    {
      int v3 = 2;
    }
    dword_8C7B8 = v3;
    CFRelease(v2);
  }
}

uint64_t sub_1B0E8(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID())
  {
    uint64_t IntValue = CFStringGetIntValue(a1);
    if (!IntValue)
    {
      uint64_t IntValue = 1;
      if (CFStringCompare(a1, @"true", 1uLL))
      {
        uint64_t IntValue = 1;
        if (CFStringCompare(a1, @"yes", 1uLL))
        {
          if (CFStringCompare(a1, @"false", 1uLL) && CFStringCompare(a1, @"no", 1uLL)) {
            CFStringCompare(a1, @"0", 1uLL);
          }
          return 0;
        }
      }
    }
  }
  else
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFNumberGetTypeID())
    {
      unsigned int valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr)) {
        return valuePtr;
      }
      else {
        return 0;
      }
    }
    else
    {
      CFTypeID v5 = CFGetTypeID(a1);
      if (v5 != CFBooleanGetTypeID()) {
        return 0;
      }
      return CFEqual(a1, kCFBooleanTrue);
    }
  }
  return IntValue;
}

void sub_1B2AC(id a1)
{
  CFStringRef v1 = (const __CFString *)CFPreferencesCopyAppValue(@"refineStageMatte", @"com.apple.coremedia");
  if (v1)
  {
    CFStringRef v2 = v1;
    if ((sub_1B0E8(v1) & 0x80000000) != 0 || (int)sub_1B0E8(v2) <= 2)
    {
      if ((sub_1B0E8(v2) & 0x80000000) != 0) {
        int v3 = 0;
      }
      else {
        int v3 = sub_1B0E8(v2);
      }
    }
    else
    {
      int v3 = 2;
    }
    dword_8C7BC = v3;
    CFRelease(v2);
  }
}

void sub_1B3C4(id a1)
{
  CFStringRef v1 = (const __CFString *)CFPreferencesCopyAppValue(@"renderSpillCache", @"com.apple.coremedia");
  if (v1)
  {
    CFStringRef v2 = v1;
    if ((sub_1B0E8(v1) & 0x80000000) != 0 || (int)sub_1B0E8(v2) <= 2)
    {
      if ((sub_1B0E8(v2) & 0x80000000) != 0) {
        int v3 = 0;
      }
      else {
        int v3 = sub_1B0E8(v2);
      }
    }
    else
    {
      int v3 = 2;
    }
    dword_8C7C0 = v3;
    CFRelease(v2);
  }
}

void sub_1B55C(id a1)
{
  qword_8CC30 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_whitenteethV2(__sample pix, __sample mask, float amt) \n { \n float m = mask.g; \n vec4 modifiedPiCGFloat x = pow(clamp(pix,0.0, 1.0), vec4(.35)); \n modifiedPix.b += .1; \n modifiedPiCGFloat x = modifiedPix * modifiedPix; \n vec4 displayPiCGFloat x = clamp(modifiedPix,0.0, 1.0); \n displayPix.a = 1.0; \n float r = clamp(1.0 - pix.r/(pix.r+pix.g+pix.b), 0.0, 1.0); \n displayPix.rgb = mix(pix.rgb, displayPix.rgb, r*max(m, 0.0)); \n displayPix.a = pix.a; \n return mix(pix, displayPix, amt); \n } \n"];
}

void sub_1B5D4(id a1)
{
  qword_8CC40 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_enrichV2 (__sample s, float amt,vec4 params) { \n vec4 orig = s; \n s = clamp(s, 0.0, 1.0); \n float x0 = params.r; \n float x1 = params.g; \n float delta = params.b; \n float pwr = params.a; \n s = pow( s, vec4(pwr)); \n float x2 = 1.0 - delta; \n float m1 = 0.5/(x1-x0); \n float b1 = - m1 * x0; \n float m2 = (.5 - delta)/(x2 - x1); \n float b2 = (m1-m2) * x1 + b1; \n vec4 w = (1.0 - step(x1, s)) * (vec4(m1)*s + vec4(b1)) + step(x1, s) * (vec4(m2)*s + vec4(b2)) + step(x2,s) *(s - (vec4(m2)*s + vec4(b2))) ; \n w.rgb = clamp(w.rgb, 0.0, 1.0); \n x0+= .02; \n x1+= .0005; \n m1 = 0.5/(x1-x0); \n b1 = - m1 * x0; \n m2 = (.5 - delta)/(x2 - x1); \n b2 = (m1-m2) * x1 + b1; \n w.r = (1.0 - step(x1, s.r)) * ((m1)*s.r + (b1)) + step(x1, s.r) * ((m2)*s.r + (b2)) + step(x2,s.r) *(s.r - ((m2)*s.r + (b2))) ; \n w.r = clamp(w.r, 0.0, 1.0); \n x0-= .01; \n x1+= .000; \n m1 = 0.5/(x1-x0); \n b1 = - m1 * x0; \n m2 = (.5 - delta)/(x2 - x1); \n b2 = (m1-m2) * x1 + b1; \n w.b = (1.0 - step(x1, s.b)) * ((m1)*s.b + (b1)) + step(x1, s.b) * ((m2)*s.b + (b2)) + step(x2,s.b) *(s.b - ((m2)*s.b + (b2))) ; \n w.b = clamp(w.b, 0.0, 1.0); \n w.rgb = w.rgb * w.rgb; \n w.r = pow(w.r, .75); \n w = mix(orig, w, vec4(amt)); w.a = 1.0; \n return w; \n } \n"];
}

void sub_1B64C(id a1)
{
  qword_8CC50 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_eyeBrightenV2 (__sample im, __sample m, float str) \n { \n float CGFloat y = dot(im.rgb, vec3(0.333333)); \n vec3 bright = mix(im.rgb, 3.0*im.rgb, m.r); \n im.rgb = mix(im.rgb, bright, y*str); \n return im; \n }"];
}

void sub_1B6C4(id a1)
{
  qword_8CC60 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_eyeBrightenSoftlightV2 (__sample uCb, __sample m, float str) \n { \n float g = .75*(1.0-dot(uCb.rgb, vec3(.333333))); \n vec4 uCf = vec4(g, g, g, 1.0); \n vec4 D = compare(uCb-0.25, ((16.0*uCb-12.0)*uCb+4.0)*uCb, sqrt(uCb)); \n vec4 Ct = clamp(uCb + (2.0*uCf-1.0) * compare(uCf - 0.5, uCb*(1.0-uCb), D-uCb), 0.0, 1.0); \n vec4 bright = Ct; \n uCf.rgb = mix(uCb.rgb, bright.rgb, m.r); \n uCf.rgb = mix(uCb.rgb, uCf.rgb, str); \n return uCf; \n }"];
}

void sub_1B73C(id a1)
{
  qword_8CC70 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_textureDiffV2 (__sample c, __sample b, float scale) \n { \n vec3 fullDiff = c.rgb - b.rgb; \n c.rgb = compare(fullDiff, scale*fullDiff, fullDiff); \n return c; \n }"];
}

void sub_1B7B4(id a1)
{
  qword_8CC80 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_textureAddV2 (__sample c, __sample b, float scale) \n { \n scale = c.r > b.r ? .5*scale : scale; \n c.rgb = c.rgb + scale*b.rgb; \n return c; \n }"];
}

void sub_1B82C(id a1)
{
  qword_8CC90 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_cheapEdgePreserveV2 (__sample i, __sample b) \n { \n float d = .75*distance(i.rgb, b.rgb); \n b = mix(b, i, d); \n return b; \n }"];
}

void sub_1B8A4(id a1)
{
  qword_8CCA0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_protectEyesNose (__sample faceMask, vec4 eyes, vec4 abc1, vec4 abc2, vec2 centerNose, vec4 abc3) \n { \n vec2 d = destCoord(); \n float dCGFloat x = eyes.x-d.x; \n float dy = eyes.y-d.y; \n float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n faceMask.rgb -= s; \n dCGFloat x = eyes.z-d.x; \n dy = eyes.w-d.y; \n s = exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy)); \n faceMask.rgb -= s; \n dCGFloat x = centerNose.x-d.x; \n dy = centerNose.y-d.y; \n s = exp(-(abc3.r*dx*dx +2.0*abc3.g*dx*dy +abc3.b*dy*dy)); \n faceMask.rgb -= s; \n faceMask = clamp(faceMask, 0.0, 1.0); \n return faceMask; \n }"];
}

void sub_1B91C(id a1)
{
  qword_8CCB0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_eyeBlurV2 (__sample faceMask, vec4 eyes, vec4 abc1, vec4 abc2, vec4 abc3, vec4 abc4) \n { \n vec2 d = destCoord(); \n float dCGFloat x = eyes.x-d.x; \n float dy = eyes.y-d.y; \n float s = exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy)); \n faceMask.b += s; \n faceMask.a += s; \n dCGFloat x = eyes.z-d.x; \n dy = eyes.w-d.y; \n s = exp(-(abc2.r*dx*dx +2.0*abc2.g*dx*dy +abc2.b*dy*dy)); \n faceMask.b += s; \n faceMask.a += s; \n s = exp(-(abc4.r*dx*dx +2.0*abc4.g*dx*dy +abc4.b*dy*dy)); \n faceMask.r += s; \n faceMask.a += s; \n dCGFloat x = eyes.x-d.x; \n dy = eyes.y-d.y; \n s = exp(-(abc4.r*dx*dx +2.0*abc4.g*dx*dy +abc4.b*dy*dy)); \n faceMask.r += s; \n faceMask.a += s; \n faceMask = clamp(faceMask, 0.0, 1.0); \n return faceMask; \n }"];
}

void sub_1B994(id a1)
{
  qword_8CCC0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_featherEdgeLight(__sample im, vec4 b, float t) \n { \n vec2 dc = destCoord(); \n float dxl = smoothstep(0.0, t, abs(dc.x-b.x)); \n float dxr = smoothstep(0.0, t, abs(dc.x-b.z)); \n float dyt = smoothstep(0.0, t, abs(dc.y-b.y)); \n float dyb = smoothstep(0.0, t, abs(dc.y-b.w)); \n im.rgb = vec3(dxl*dxr*dyt*dyb); \n im = clamp(im, 0.0, 1.0); \n return im; \n }"];
}

BOOL sub_1DC78@<W0>(int a1@<W0>, _OWORD *a2@<X8>, double a3@<D0>, double a4@<D2>, double a5@<D3>)
{
  BOOL result = CGRectIsInfinite(*(CGRect *)&a3);
  if (result)
  {
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *a2 = *(_OWORD *)&CGAffineTransformIdentity.a;
    a2[1] = v11;
    a2[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    v15[0] = 0x3FF0000000000000;
    v15[1] = 0;
    v15[2] = 0;
    v15[3] = 0x3FF0000000000000;
    v15[4] = 0;
    v15[5] = 0;
    v15[6] = 0xBFF0000000000000;
    v15[7] = 0;
    v15[8] = 0;
    v15[9] = 0x3FF0000000000000;
    *(double *)&v15[10] = a4;
    long long v16 = xmmword_55F30;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    unint64_t v19 = 0xBFF0000000000000;
    double v20 = a4;
    double v21 = a5;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v22 = 0x3FF0000000000000;
    long long v25 = xmmword_55F40;
    double v26 = a5;
    long long v27 = xmmword_55F30;
    long long v28 = xmmword_55F40;
    double v29 = a5;
    double v30 = a4;
    long long v31 = xmmword_55F30;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v32 = 0x3FF0000000000000;
    double v35 = a4;
    long long v36 = xmmword_55F50;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v37 = 0x3FF0000000000000;
    uint64_t v40 = 0x3FF0000000000000;
    long long v41 = xmmword_55F40;
    double v42 = a5;
    uint64_t v43 = 0;
    if ((a1 - 9) >= 0xFFFFFFF8) {
      int v12 = a1 - 1;
    }
    else {
      int v12 = 0;
    }
    id v13 = &v15[6 * v12];
    long long v14 = v13[2];
    a2[1] = v13[1];
    a2[2] = v14;
    *a2 = *v13;
  }
  return result;
}

void sub_1E554(id a1)
{
  qword_8CCD0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareDepthV2 (__sample c, float m) \n { \n c.r = smoothstep(m, 0.7, 2.0*c.r); \n return c.rrra; \n }"];
}

void sub_1E5CC(id a1)
{
  qword_8CCE0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceVignetteStudioV2(__sample vig, vec2 xy1, vec4 abc1) \n { \n float dCGFloat x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, .4, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))); \n vig.rgb = min(vig.rgb + vec3(s), 1.0); \n return vig; \n }"];
}

void sub_1E644(id a1)
{
  qword_8CCF0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyFaceProtectStudio(__sample im, __sample fg, __sample fp, __sample vig) \n { \n im.rgb = mix(im.rgb, fg.rgb, (1.0-fp.r)*vig.r); \n return im; \n }"];
}

void sub_1FD44(id a1)
{
  qword_8CD00 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareDepthContourV2 (__sample c, float m) \n { \n c.r = smoothstep(m, 0.7, 2.0*c.r); \n return vec4(vec3(c.r), 1.0); \n }"];
}

void sub_1FDBC(id a1)
{
  qword_8CD10 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_blendSingleChannelMaskV2 (__sample c, __sample b, __sample m) \n { \n c.rgb = mix(c.rgb, b.rgb, m.r); \n return c; \n }"];
}

void sub_1FE34(id a1)
{
  qword_8CD20 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceVignetteContourV2(__sample im, __sample vig, vec2 xy1, vec4 abc1) \n { \n float dCGFloat x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, .4, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))); \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_1FEAC(id a1)
{
  qword_8CD30 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyVignetteContourV2(__sample im, __sample fg, __sample vig, float amt) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = mix(im.rgb, pow(im.rgb, vec3(2.0)), (1.0-.6*vig.rgb)*.1); \n im.rgb = mix(im.rgb, im.rgb*(vig.rgb), amt) + pos + neg; \n return im; \n }"];
}

void sub_1FF24(id a1)
{
  qword_8CD40 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyFaceProtect(__sample im, __sample fg, __sample fp, __sample vig) \n { \n im.rgb = mix(im.rgb, fg.rgb, (1.0-fp.r)*vig.r); \n return im; \n }"];
}

void sub_1FF9C(id a1)
{
  qword_8CD50 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_transparentBorder(__sample im, vec3 params) \n { \n vec2 dc = destCoord(); \n float d = exp(-params.b*((dc.x - params.r)*(dc.x-params.r)+(dc.y - params.g)*(dc.y - params.g))); \n d = smoothstep(0.02, .2, d); \n im += vec4(d); \n im = clamp(im, 0.0, 1.0); \n return im; \n }"];
}

void sub_20014(id a1)
{
  qword_8CD60 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyTransparentBorder(__sample im, __sample alphaMatte) \n { \n im.a = alphaMatte.a; \n im = premultiply(im); \n return im; \n }"];
}

void sub_22508(id a1)
{
  qword_8CD70 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareBlackDisparityV2 (__sample dm, const float thresh) \n { \n float g = 1.0-smoothstep(0.0, thresh, 4.0*dm.r); \n return vec4(g,g,g, 1.0); \n }"];
}

void sub_22580(id a1)
{
  qword_8CD80 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareBlackDepthV2 (__sample dm, const float thresh) \n { \n float g = 1.0-smoothstep(0.0, thresh, 2.0*dm.r*dm.r); \n return vec4(g,g,g, 1.0); \n }"];
}

void sub_225F8(id a1)
{
  qword_8CD90 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyBlackDepthV2 (__sample im, __sample dm, float g) \n { \n im.rgb *= pow(dm.r, g); \n return im; \n }"];
}

void sub_22670(id a1)
{
  qword_8CDA0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyStageNoFeather (__sample im, __sample dm) \n { \n im.rgb = mix(im.rgb*im.rgb*im.rgb, im.rgb, dm.r); \n im.rgb = mix(vec3(0.0), im.rgb, dm.r); \n return im; \n }"];
}

void sub_226E8(id a1)
{
  qword_8CDB0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyStageNoFeatherSpill (__sample im, __sample spill) \n { \n vec3 diCFStringRef v2 = sqrt(vec3(1.0)-(spill.rgb*spill.rgb)); \n spill.r = div2.r>0.01? (spill.r / div2.r):0.0; \n spill.g = div2.g>0.01? (spill.g / div2.g):0.0; \n spill.b = div2.b>0.01? (spill.b / div2.b):0.0; \n spill.rgb = spill.rgb*vec3(4.0); \n spill.rgb = smoothstep(0.0, 1.0, spill.rgb); \n im.rgb = mix(vec3(0.0), max(vec3(0.005),im.rgb), spill.rgb); \n return im; \n }"];
}

void sub_22760(id a1)
{
  qword_8CDC0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_getRefinedMatte (__sample spill) \n { \n vec3 diCFStringRef v2 = sqrt(vec3(1.0)-(spill.rgb*spill.rgb)); \n spill.r = div2.r>0.01? (spill.r / div2.r):0.0; \n spill.g = div2.g>0.01? (spill.g / div2.g):0.0; \n spill.b = div2.b>0.01? (spill.b / div2.b):0.0; \n spill.rgb = spill.rgb*vec3(4.0); \n spill.rgb = mix(min(spill.rgb, 1.0), smoothstep(0.0, 1.0, spill.rgb), .5); \n return vec4(spill.rgb, 1.0); \n }"];
}

void sub_227D8(id a1)
{
  qword_8CDD0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyRefinedMatte (__sample im, __sample spill, __sample edge) \n { \n im.rgb = im.rgb * spill.rgb; \n im.rgb = mix(im.rgb, im.rgb*im.rgb*im.rgb, edge.rgb); \n return im; }"];
}

void sub_22850(id a1)
{
  qword_8CDE0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_refineBlackDepthV2 (__sample im, __sample dm, __sample bm, __sample protect, vec3 g, __sample aft) \n { \n float b = smoothstep(0.0, 1.0, pow(dm.r*bm.r,g.r)+protect.r); \n im.rgb = max(im.rgb, 0.0); \n vec3 gamma = (g.b) > 0.0 ? vec3(1.0+g.g-g.g*b*b*dm.r) : vec3(1.0+g.g-g.g*b*b); \n im.rgb = pow(im.rgb, gamma); \n im.rgb = mix(vec3(0.0), im.rgb, b); \n gamma = vec3(1.35-.35*b*aft.r); \n im.rgb = pow(im.rgb, gamma); \n float r = im.r/(im.r+im.g+im.b+0.00001); \n float sat = max(min(1.0, (1.3-.9*r)), 0.0); \n float CGFloat y = dot(im.rgb, vec3(.3333333)); \n im.rgb = mix(sat*(im.rgb-y)+y, im.rgb, b*dm.r); \n return im; \n }"];
}

void sub_228C8(id a1)
{
  qword_8CDF0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceVignetteStageV2(__sample im, __sample vig, vec2 xy1, vec4 abc1) \n { \n float dCGFloat x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, .4, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_22940(id a1)
{
  qword_8CE00 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceProtectV2(__sample im, __sample vig, vec2 xy1, vec4 abc1, float feather) \n { \n float dCGFloat x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, feather, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_229B8(id a1)
{
  qword_8CE10 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyVignetteStageV2(__sample im, __sample vig, float amt) \n { \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = mix(im.rgb, im.rgb*(vig.rgb), amt); \n im.rgb = mix(im.rgb, im.rgb*im.rgb, (1.0-vig.rgb)*.3); \n return im; \n }"];
}

void sub_22A30(id a1)
{
  qword_8CE20 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_invertRedV2(__sample rNormalized) __attribute__((outputFormat(kCIFormatRh))) \n { \n return vec4(1.0 - rNormalized.r, 0.0, 0.0, 1.0); \n } \n"];
}

void sub_22AA8(id a1)
{
  qword_8CE30 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_blendDepthV2(__sample depth, __sample tightDepth, __sample im, __sample blur, __sample weight) \n{\n  float d = distance(im.rgb, blur.rgb); \n  float g = mix(tightDepth.r, depth.r, weight.r); \n  g += (d*weight.r*(1.0-dot(im.rgb, vec3(.333333)))); \n  g = clamp(g, 0.0, 1.0); \n  return vec4(g, g, g, 1.0); \n}\n"];
}

void sub_22B4C(_Unwind_Exception *a1)
{
}

void sub_22BD4(_Unwind_Exception *a1)
{
}

void sub_243A8(_Unwind_Exception *a1)
{
}

void sub_24430(_Unwind_Exception *a1)
{
}

void sub_2448C(id a1)
{
  qword_8CE80 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareWhiteDepth (__sample dm, const float thresh) \n { \n float g = 1.0-smoothstep(0.0, thresh, 2.0*dm.r*dm.r); \n return vec4(g,g,g, 1.0); \n }"];
}

void sub_24504(id a1)
{
  qword_8CE90 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _applyWhiteNoFeather (__sample im, __sample dm) \n { \n im.rgb = mix(im.rgb*im.rgb*im.rgb, im.rgb, dm.r); \n im.rgb = mix(vec3(1.0), im.rgb, dm.r); \n return im; \n }"];
}

void sub_2457C(id a1)
{
  qword_8CEA0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _getRefinedWhiteMatte (__sample spill) \n { \n vec3 diCFStringRef v2 = sqrt(vec3(1.0)-(spill.rgb*spill.rgb)); \n spill.r = div2.r>0.01? (spill.r / div2.r):0.0; \n spill.g = div2.g>0.01? (spill.g / div2.g):0.0; \n spill.b = div2.b>0.01? (spill.b / div2.b):0.0; \n spill.rgb = spill.rgb*vec3(4.0); \n spill.rgb = mix(min(spill.rgb, 1.0), smoothstep(0.4, 1.0, spill.rgb), 1.0); \n return vec4( spill.rgb, 1.0); \n }"];
}

void sub_245F4(id a1)
{
  qword_8CEB0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _applyRefinedWhiteMatte (__sample im, __sample spill, __sample edge, __sample alpha) \n { \n im.rgb *= spill.rgb; \n im.rgb = mix(im.rgb, im.rgb*im.rgb*im.rgb, min(2.0*edge.r, 1.0)); \n im.rgb = mix(vec3(1.0), im.rgb, alpha.r); \n return im; }"];
}

void sub_25118(id a1)
{
  CFStringRef v1 = +[NSBundle bundleWithIdentifier:@"com.apple.PortraitFilters"];
  if (!v1) {
    sub_4C150();
  }
  qword_8CEC8 = [(NSBundle *)v1 bundleURL];
  if (!qword_8CEC8) {
    sub_4C17C();
  }
}

uint64_t sub_2515C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  unsigned __int16 v37 = 0;
  int v36 = 0;
  bzero(*(void **)a2, *(int *)(a2 + 16) * (uint64_t)*(int *)(a2 + 12));
  int v12 = sub_25468();
  if (v12)
  {
    uint64_t v13 = (uint64_t)v12;
    unsigned __int16 v39 = 0;
    int v38 = 0;
    sub_254DC(a1, a2, a3, a4, &v38, a5, a6);
    unsigned int v14 = HIWORD(v38);
    if (HIWORD(v38) <= v39)
    {
      int v15 = (unsigned __int16)v38;
      int v16 = v39 + 1;
      do
        sub_2BCDC(a2, v14++, v15, 1);
      while (v16 != v14);
    }
    sub_25608(v13, &v38);
    uint64_t v35 = v13;
    while (1)
    {
LABEL_6:
      uint64_t v18 = *(void *)(v13 + 8);
      uint64_t v17 = *(void *)(v13 + 16);
      if (v17 == v18 + 16)
      {
        uint64_t v19 = *(void *)(v18 + 8);
        if (!v19)
        {
          sub_25698((void **)v13);
          return 1;
        }
        *(void *)(v13 + 8) = v19;
        uint64_t v17 = v19 + 316;
      }
      *(void *)(v13 + 16) = v17 - 6;
      int v38 = *(_DWORD *)(v17 - 6);
      unsigned __int16 v39 = *(_WORD *)(v17 - 2);
      int v34 = (unsigned __int16)v38;
      if ((_WORD)v38)
      {
        uint64_t v20 = HIWORD(v38);
        int v21 = v39;
        if (HIWORD(v38) <= v39)
        {
          uint64_t v22 = (unsigned __int16)v38 - 1;
          do
          {
            if (!sub_2BC54(a2, v20, v22) && a6(a5, a1, v20, v22))
            {
              sub_254DC(a1, a2, v20, v22, &v36, a5, a6);
              unsigned int v23 = HIWORD(v36);
              int v24 = v37;
              if (HIWORD(v36) <= v37)
              {
                int v25 = (unsigned __int16)v36;
                do
                  sub_2BCDC(a2, v23++, v25, 1);
                while (v24 + 1 != v23);
              }
              uint64_t v13 = v35;
              if (!sub_25608(v35, &v36))
              {
LABEL_32:
                puts("seedFill: can not push span onto stack");
                sub_25698((void **)v13);
                return 0;
              }
              LODWORD(v20) = v24 + 2;
            }
            BOOL v26 = (int)v20 < v21;
            uint64_t v20 = (v20 + 1);
          }
          while (v26);
        }
      }
      if (*(_DWORD *)(a2 + 12) - 1 > v34)
      {
        uint64_t v27 = HIWORD(v38);
        int v28 = v39;
        if (HIWORD(v38) <= v39)
        {
          uint64_t v29 = (v34 + 1);
          while (1)
          {
            if (!sub_2BC54(a2, v27, v29) && a6(a5, a1, v27, v29))
            {
              sub_254DC(a1, a2, v27, v29, &v36, a5, a6);
              unsigned int v30 = HIWORD(v36);
              int v31 = v37;
              if (HIWORD(v36) <= v37)
              {
                int v32 = (unsigned __int16)v36;
                do
                  sub_2BCDC(a2, v30++, v32, 1);
                while (v31 + 1 != v30);
              }
              uint64_t v13 = v35;
              if (!sub_25608(v35, &v36)) {
                goto LABEL_32;
              }
              LODWORD(v27) = v31 + 2;
            }
            BOOL v26 = (int)v27 < v28;
            uint64_t v27 = (v27 + 1);
            if (!v26) {
              goto LABEL_6;
            }
          }
        }
      }
    }
  }
  puts("seedFill: can not allocate span stack");
  return 0;
}

void *sub_25468()
{
  v0 = sub_12924(0x18uLL);
  if (v0)
  {
    CFStringRef v1 = sub_12924(0x140uLL);
    void *v0 = v1;
    v0[1] = v1;
    if (v1)
    {
      *CFStringRef v1 = 0;
      v1[1] = 0;
      v0[2] = v1 + 2;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    puts("allocSpanStack: span stack could not be allocated");
  }
  return v0;
}

uint64_t sub_254DC(uint64_t result, uint64_t a2, int a3, uint64_t a4, _WORD *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  int v11 = a3;
  uint64_t v13 = result;
  *a5 = a4;
  LODWORD(v14) = a3;
  do
  {
    __int16 v15 = v14;
    BOOL v16 = __OFSUB__(v14, 1);
    uint64_t v14 = (v14 - 1);
    if ((int)v14 < 0 != v16) {
      break;
    }
    BOOL result = sub_2BC54(a2, v14, a4);
    if (result == 1) {
      break;
    }
    BOOL result = a7(a6, v13, v14, a4);
  }
  while (result);
  a5[1] = v15;
  do
  {
    int v17 = v11;
    uint64_t v18 = (v11 + 1);
    if ((int)v18 >= *(_DWORD *)(a2 + 8)) {
      break;
    }
    BOOL result = sub_2BC54(a2, v18, a4);
    if (result == 1) {
      break;
    }
    BOOL result = a7(a6, v13, v18, a4);
    int v11 = v17 + 1;
  }
  while (result);
  a5[2] = v17;
  if ((unsigned __int16)a5[1] > (unsigned __int16)v17)
  {
    return puts("spanSearch: empty span");
  }
  return result;
}

void *sub_25608(uint64_t a1, int *a2)
{
  CFTypeID v5 = *(uint64_t **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4 - (uint64_t)v5 - 16 >= 295)
  {
    uint64_t v6 = *v5;
    if (!v6)
    {
      BOOL result = sub_12924(0x140uLL);
      CGFloat v8 = *(uint64_t **)(a1 + 8);
      uint64_t *v8 = (uint64_t)result;
      if (!result) {
        return result;
      }
      *BOOL result = 0;
      uint64_t v6 = *v8;
      *(void *)(*v8 + 8) = v8;
    }
    uint64_t v4 = v6 + 16;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = v6 + 16;
  }
  int v9 = *a2;
  *(_WORD *)(v4 + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)uint64_t v4 = v9;
  *(void *)(a1 + 16) += 6;
  return (void *)(&dword_0 + 1);
}

void sub_25698(void **a1)
{
  CFStringRef v2 = *a1;
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      j__free(v2);
      CFStringRef v2 = v3;
    }
    while (v3);
  }

  j__free(a1);
}

uint64_t sub_256E4(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  unsigned __int16 v59 = 0;
  int v58 = 0;
  int v12 = sub_25468();
  if (!v12)
  {
    puts("seedFill: can not allocate span stack");
    return 0;
  }
  double v56 = v12;
  unsigned __int16 v61 = 0;
  int v60 = 0;
  unint64_t v13 = sub_2CEA4((uint64_t *)a2, a3, a4);
  unint64_t v15 = sub_13CE0(v13, v14, 0xFFFFFFFFLL, -1);
  uint64_t v17 = v15 & ~((int)v15 >> 31);
  if (*(_DWORD *)(a2 + 12) >= SHIDWORD(v15)) {
    int v18 = HIDWORD(v15);
  }
  else {
    int v18 = *(_DWORD *)(a2 + 12);
  }
  long long v55 = a6;
  uint64_t v57 = a5;
  if ((int)v17 < v18)
  {
    int v19 = *(_DWORD *)(a2 + 8);
    unint64_t v20 = v16 & 0xFFFFFFFF00000000;
    if ((v16 & 0x80000000) == 0) {
      unint64_t v20 = v16;
    }
    if (v19 >= SHIDWORD(v20)) {
      unint64_t v21 = v20;
    }
    else {
      unint64_t v21 = v20 | ((unint64_t)v19 << 32);
    }
    unint64_t v22 = HIDWORD(v21);
    int v53 = v18;
    unint64_t v52 = v21;
    do
    {
      if ((int)v21 >= (int)v22)
      {
        uint64_t v34 = (v17 + 1);
      }
      else
      {
        unsigned int v54 = v17 + 1;
        unint64_t v23 = v21;
        do
        {
          uint64_t v24 = *(void *)a2;
          uint64_t v25 = *(int *)(a2 + 16);
          uint64_t v26 = *(void *)a2 + (int)v25 * (uint64_t)(int)v17;
          if ((v23 & 0x80000000) == 0) {
            int v27 = v23;
          }
          else {
            int v27 = v23 + 7;
          }
          int v28 = 1 << (v23 & 7);
          if ((v28 & *(unsigned char *)(v26 + (v27 >> 3))) == 0)
          {
            if ((int)v23 >= 1
              && ((*(unsigned __int8 *)(v26 + ((unint64_t)(v23 - 1) >> 3)) >> ((v23 - 1) & 7)) & 1) != 0)
            {
              goto LABEL_68;
            }
            if ((int)v23 < *(_DWORD *)(a2 + 8) - 1)
            {
              int v29 = v23 + 8;
              if ((int)v23 >= -1) {
                int v29 = v23 + 1;
              }
              if ((*(unsigned __int8 *)(v26 + (v29 >> 3)) >> ((v23 + 1) & 7))) {
                goto LABEL_68;
              }
            }
            if ((uint64_t v30 = (uint64_t)v27 >> 3, v17)
              && (v28 & *(unsigned char *)(v24 + v25 * ((int)v17 - 1) + v30)) != 0
              || (int)v17 < *(_DWORD *)(a2 + 12) - 1
              && (v28 & *(unsigned char *)(v24 + (int)v25 * (uint64_t)(int)v54 + v30)) != 0)
            {
LABEL_68:
              if (a6(a5, a1, v23, v17))
              {
                sub_254DC(a1, a2, v23, v17, &v60, a5, a6);
                unsigned int v31 = HIWORD(v60);
                if (HIWORD(v60) <= v61)
                {
                  int v32 = (unsigned __int16)v60;
                  int v33 = v61 + 1;
                  do
                    sub_2BCDC(a2, v31++, v32, 1);
                  while (v33 != v31);
                }
                sub_25608((uint64_t)v56, &v60);
                a6 = v55;
                a5 = v57;
              }
            }
          }
          unint64_t v23 = (v23 + 1);
        }
        while (v23 != v22);
        int v18 = v53;
        uint64_t v34 = v54;
        unint64_t v21 = v52;
      }
      uint64_t v17 = v34;
    }
    while (v34 != v18);
  }
  while (1)
  {
LABEL_37:
    uint64_t v36 = v56[1];
    uint64_t v35 = v56[2];
    if (v35 == v36 + 16)
    {
      uint64_t v37 = *(void *)(v36 + 8);
      if (!v37)
      {
        sub_25698((void **)v56);
        return 1;
      }
      v56[1] = v37;
      uint64_t v35 = v37 + 316;
    }
    v56[2] = v35 - 6;
    int v60 = *(_DWORD *)(v35 - 6);
    unsigned __int16 v61 = *(_WORD *)(v35 - 2);
    int v38 = (unsigned __int16)v60;
    if ((_WORD)v60)
    {
      uint64_t v39 = HIWORD(v60);
      int v40 = v61;
      if (HIWORD(v60) <= v61) {
        break;
      }
    }
LABEL_50:
    if (*(_DWORD *)(a2 + 12) - 1 > v38)
    {
      uint64_t v45 = HIWORD(v60);
      int v46 = v61;
      if (HIWORD(v60) <= v61)
      {
        uint64_t v47 = (v38 + 1);
        while (1)
        {
          if (!sub_2BC54(a2, v45, v47) && a6(a5, a1, v45, v47))
          {
            sub_254DC(a1, a2, v45, v47, &v58, a5, a6);
            unsigned int v48 = HIWORD(v58);
            int v49 = v59;
            if (HIWORD(v58) <= v59)
            {
              int v50 = (unsigned __int16)v58;
              do
                sub_2BCDC(a2, v48++, v50, 1);
              while (v49 + 1 != v48);
            }
            if (!sub_25608((uint64_t)v56, &v58)) {
              goto LABEL_63;
            }
            LODWORD(v45) = v49 + 2;
            a5 = v57;
          }
          BOOL v44 = (int)v45 < v46;
          uint64_t v45 = (v45 + 1);
          if (!v44) {
            goto LABEL_37;
          }
        }
      }
    }
  }
  while (1)
  {
    if (sub_2BC54(a2, v39, v38 - 1) || !a6(a5, a1, v39, (v38 - 1))) {
      goto LABEL_49;
    }
    sub_254DC(a1, a2, v39, (v38 - 1), &v58, a5, a6);
    unsigned int v41 = HIWORD(v58);
    int v42 = v59;
    if (HIWORD(v58) <= v59)
    {
      int v43 = (unsigned __int16)v58;
      do
        sub_2BCDC(a2, v41++, v43, 1);
      while (v42 + 1 != v41);
    }
    if (!sub_25608((uint64_t)v56, &v58)) {
      break;
    }
    LODWORD(v39) = v42 + 2;
    a6 = v55;
    a5 = v57;
LABEL_49:
    BOOL v44 = (int)v39 < v40;
    uint64_t v39 = (v39 + 1);
    if (!v44) {
      goto LABEL_50;
    }
  }
LABEL_63:
  puts("seedFill: can not push span onto stack");
  sub_25698((void **)v56);
  return 0;
}

int sub_25B84(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, &off_8C7C8);

  return [AssociatedObject intValue];
}

void sub_25BB4(NSDictionary *self, SEL a2, int a3)
{
  uint64_t v4 = +[NSNumber numberWithInt:*(void *)&a3];

  objc_setAssociatedObject(self, &off_8C7C8, v4, (char *)&dword_0 + 1);
}

float sub_25C04(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, &off_8C7D0);

  [AssociatedObject floatValue];
  return result;
}

void sub_25C34(NSDictionary *self, SEL a2, float a3)
{
  uint64_t v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, &off_8C7D0, v4, (char *)&dword_0 + 1);
}

float sub_25C84(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, &off_8C7D8);

  [AssociatedObject floatValue];
  return result;
}

void sub_25CB4(NSDictionary *self, SEL a2, float a3)
{
  uint64_t v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, &off_8C7D8, v4, (char *)&dword_0 + 1);
}

CGRect sub_25D04(NSDictionary *self, SEL a2)
{
  id AssociatedObject = objc_getAssociatedObject(self, &off_8C7E0);

  [AssociatedObject rectValue];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

void sub_25D34(NSDictionary *self, SEL a2, CGRect a3)
{
  double v4 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  objc_setAssociatedObject(self, &off_8C7E0, v4, (char *)&dword_0 + 1);
}

double sub_28F18(int a1, double *a2, double *a3, uint64_t a4, double *a5)
{
  double v5 = a3[1];
  double v6 = a2[1];
  double v7 = a3[2];
  double v8 = a3[3];
  double v9 = *a3 + *a2 * v7;
  double v10 = v5 + v6 * v8;
  switch(a1)
  {
    case 2:
      double v11 = 1.0;
      double v12 = v10;
      goto LABEL_5;
    case 3:
      double v11 = 1.0;
      double v12 = 1.0 - v10;
LABEL_5:
      double v10 = v11 - v9;
      break;
    case 4:
      double v12 = 1.0 - v10;
      goto LABEL_7;
    case 5:
      float v13 = v9;
      double v10 = 1.0 - v10;
      goto LABEL_12;
    case 6:
      float v14 = v9;
      double v10 = 1.0 - v10;
      goto LABEL_13;
    case 7:
      float v14 = v9;
      goto LABEL_13;
    case 8:
      float v13 = v9;
LABEL_12:
      float v14 = 1.0 - v13;
LABEL_13:
      double v12 = v14;
      break;
    default:
      double v12 = v5 + v6 * v8;
LABEL_7:
      double v10 = *a3 + *a2 * v7;
      break;
  }
  double result = *(double *)(a4 + 16) * v10;
  double v16 = *(double *)(a4 + 24) * v12;
  *a5 = result;
  a5[1] = v16;
  return result;
}

uint64_t sub_294F0(void *a1, void *a2)
{
  id v4 = [a1 objectForKeyedSubscript:@"x"];
  id v5 = [a1 objectForKeyedSubscript:@"y"];
  id v6 = [a1 objectForKeyedSubscript:@"w"];
  id v7 = [a1 objectForKeyedSubscript:@"h"];
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v11 = v8 || v6 == 0 || v7 == 0 || a2 == 0;
  uint64_t v12 = !v11;
  if (!v11)
  {
    float v13 = v7;
    [v4 doubleValue];
    uint64_t v15 = v14;
    [v5 doubleValue];
    uint64_t v17 = v16;
    [v6 doubleValue];
    uint64_t v19 = v18;
    [v13 doubleValue];
    *a2 = v15;
    a2[1] = v17;
    a2[2] = v19;
    a2[3] = v20;
  }
  return v12;
}

uint64_t sub_295D4(void *a1, double *a2, double a3, double a4, double a5, double a6)
{
  id v12 = [a1 objectForKeyedSubscript:@"x"];
  id v13 = [a1 objectForKeyedSubscript:@"y"];
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = v14 || a2 == 0;
  uint64_t v16 = !v15;
  if (!v15)
  {
    uint64_t v17 = v13;
    [v12 doubleValue];
    double v19 = a3 + a5 * v18;
    [v17 doubleValue];
    *a2 = v19;
    a2[1] = a4 + a6 * v20;
  }
  return v16;
}

unint64_t sub_29D34(uint64_t a1, int a2)
{
  unint64_t result = *(unsigned __int8 *)(a1 + a2 - 1);
  uint64_t v4 = (a2 - 2);
  if (a2 >= 2)
  {
    do
      unint64_t result = *(unsigned __int8 *)(a1 + v4--) | (result << 8);
    while (v4 != -1);
  }
  return result;
}

uint64_t sub_29D60(uint64_t a1, int a2, int a3)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a1;
  unsigned int v3 = *((unsigned __int8 *)v5 + a2) + a3;
  if (v3 > 0xFF) {
    return -1;
  }
  *((unsigned char *)v5 + a2) = v3;
  return v5[0];
}

unint64_t sub_29D9C(int a1)
{
  return ((unint64_t)(a1 & 0x80) << 49) | ((((unint64_t)(a1 & 0x40) >> 6) & 1) << 48) | ((((unint64_t)(a1 & 0x20) >> 5) & 1) << 40) | ((((unint64_t)(a1 & 0x10) >> 4) & 1) << 32) | (a1 << 21) & 0x1000000 | (unint64_t)((a1 << 14) & 0x10000) | (a1 << 7) & 0x100 | (unint64_t)(a1 & 1);
}

void sub_2B2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

id sub_2B2E4(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 40), "newDefaultLibraryWithBundle:error:", +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), 0);
  qword_8CEE8 = (uint64_t)result;
  return result;
}

void sub_2B338(uint64_t a1, uint64_t a2)
{
}

void sub_2B348(uint64_t a1)
{
}

NSDate *sub_2B354(uint64_t a1)
{
  id result = +[NSDate date];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void sub_2B38C(uint64_t a1)
{
}

void sub_2BA50(id a1)
{
  qword_8CEF8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_accumulateTileKernel( __sample sampleAcc, __sample sampleTile, vec4 tileRect, vec4 tileRectNoOverlap) __attribute__((outputFormat(kCIFormatRGBA8))) { vec2 dc = destCoord(); if (dc.x < tileRect.x || dc.x >= (tileRect.x + tileRect.z) || dc.y < tileRect.y || dc.y >= tileRect.y + tileRect.w) { return sampleAcc; } vec2 tileStart = tileRect.xy; vec2 tileEnd = tileStart + tileRect.zw; vec2 tileStartNoOverlap = tileRectNoOverlap.xy; vec2 tileEndNoOverlap = tileStartNoOverlap + tileRectNoOverlap.zw; vec2 overlapStart = tileStartNoOverlap - tileStart; vec2 overlapEnd = tileEnd - tileEndNoOverlap; vec2 weightStart = vec2( overlapStart.x > 0.f, overlapStart.y > 0.f) *(tileStartNoOverlap - dc) / overlapStart; vec2 weightEnd = vec2( overlapEnd.x > 0.f, overlapEnd.y > 0.f) *(dc - tileEndNoOverlap) / overlapEnd; vec2 weight = vec2( 1.f) - max( vec2( 0.f), max( weightStart, weightEnd)); vec4 id result = sampleAcc + sampleTile * weight.x * weight.y; return vec4( result.xyz, 1.f); }"];
}

void *sub_2BA84(int a1, int a2)
{
  uint64_t v4 = sub_12924(0x18uLL);
  if (!v4)
  {
    BOOL v8 = "initBitmask: bitmap record can not be allocated";
    goto LABEL_7;
  }
  id v5 = v4;
  int v6 = a1 + 7;
  if (a1 < -7) {
    int v6 = a1 + 14;
  }
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = v6 >> 3;
  id v7 = sub_12930(a2, (uint64_t)v6 >> 3);
  *id v5 = v7;
  if (!v7)
  {
    j__free(v5);
    BOOL v8 = "initBitmask: bitmap body can not be allocated";
LABEL_7:
    puts(v8);
    return 0;
  }
  return v5;
}

BOOL sub_2BB24(_DWORD *a1, int a2, int a3)
{
  int v4 = a2 + 7;
  if (a2 < -7) {
    int v4 = a2 + 14;
  }
  a1[2] = a2;
  a1[3] = a3;
  a1[4] = v4 >> 3;
  id v5 = sub_12930(a3, (uint64_t)v4 >> 3);
  *(void *)a1 = v5;
  if (!v5)
  {
    j__free(a1);
    puts("initBitmask: bitmap body can not be allocated");
  }
  return v5 != 0;
}

void sub_2BB98(void **a1)
{
  if (a1)
  {
    unsigned int v3 = *a1;
    if (v3) {
      j__free(v3);
    }
    j__free(a1);
  }
  else
  {
    puts("termBitmask: bitmap was null");
  }
}

void sub_2BBF4(uint64_t a1)
{
}

void **sub_2BC08(uint64_t a1)
{
  CFStringRef v2 = (void **)sub_2BA84(*(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  unsigned int v3 = v2;
  if (v2) {
    memmove(*v2, *(const void **)a1, *(int *)(a1 + 12) * (uint64_t)*(int *)(a1 + 16));
  }
  return v3;
}

uint64_t sub_2BC54(uint64_t a1, unsigned int a2, int a3)
{
  if ((a2 & 0x80000000) != 0) {
    return 0;
  }
  uint64_t result = 0;
  if ((a3 & 0x80000000) == 0 && *(_DWORD *)(a1 + 8) > (signed int)a2)
  {
    if (*(_DWORD *)(a1 + 12) > a3) {
      return (*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * (uint64_t)a3 + ((unint64_t)a2 >> 3)) >> (a2 & 7)) & 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_2BCAC(uint64_t a1, int a2, int a3)
{
  return (*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * (uint64_t)a3 + a2 / 8) >> (a2 & 7)) & 1;
}

uint64_t sub_2BCDC(uint64_t result, unsigned int a2, int a3, int a4)
{
  if ((a2 & 0x80000000) != 0 || a3 < 0 || *(_DWORD *)(result + 8) <= (signed int)a2 || *(_DWORD *)(result + 12) <= a3) {
    return puts("setBitInBitmask: coordinate out of range");
  }
  uint64_t v4 = *(void *)result + *(int *)(result + 16) * (uint64_t)a3;
  unint64_t v5 = (unint64_t)a2 >> 3;
  int v6 = 1 << (a2 & 7);
  char v7 = *(unsigned char *)(v4 + v5);
  char v8 = v7 | v6;
  char v9 = v7 & ~(_BYTE)v6;
  if (a4) {
    char v9 = v8;
  }
  *(unsigned char *)(v4 + v5) = v9;
  return result;
}

void *sub_2BD44(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3 == *(_DWORD *)(a2 + 8)
    && (int v5 = *(_DWORD *)(a1 + 12), v5 == *(_DWORD *)(a2 + 12))
    && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16))
  {
    uint64_t result = sub_2BA84(v3, v5);
    int v7 = *(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 16);
    if (v7 >= 1)
    {
      char v8 = (unsigned char *)*result;
      char v9 = *(char **)a2;
      double v10 = *(char **)a1;
      do
      {
        char v12 = *v10++;
        char v11 = v12;
        char v13 = *v9++;
        *v8++ = v13 & v11;
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    puts("bitmaskAndBitmask: bitmasks have different shapes");
    return 0;
  }
  return result;
}

void *sub_2BDE4(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3 == *(_DWORD *)(a2 + 8)
    && (int v5 = *(_DWORD *)(a1 + 12), v5 == *(_DWORD *)(a2 + 12))
    && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16))
  {
    uint64_t result = sub_2BA84(v3, v5);
    int v7 = *(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 16);
    if (v7 >= 1)
    {
      char v8 = (unsigned char *)*result;
      char v9 = *(char **)a2;
      double v10 = *(char **)a1;
      do
      {
        char v12 = *v10++;
        char v11 = v12;
        char v13 = *v9++;
        *v8++ = v13 | v11;
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    puts("bitmaskOrBitmask: bitmasks have different shapes");
    return 0;
  }
  return result;
}

void *sub_2BE84(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3 == *(_DWORD *)(a2 + 8)
    && (int v5 = *(_DWORD *)(a1 + 12), v5 == *(_DWORD *)(a2 + 12))
    && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16))
  {
    uint64_t result = sub_2BA84(v3, v5);
    int v7 = *(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 16);
    if (v7 >= 1)
    {
      char v8 = (unsigned char *)*result;
      char v9 = *(char **)a2;
      double v10 = *(char **)a1;
      do
      {
        char v12 = *v10++;
        char v11 = v12;
        char v13 = *v9++;
        *v8++ = v11 & ~v13;
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    puts("bitmaskAndNotBitmask: bitmasks have different shapes");
    return 0;
  }
  return result;
}

uint64_t sub_2BF24(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(result + 8) != *(_DWORD *)(a2 + 8)) {
    return puts("bitmaskMinus: bitmasks have different shapes");
  }
  int v2 = *(_DWORD *)(result + 12);
  if (v2 != *(_DWORD *)(a2 + 12)) {
    return puts("bitmaskMinus: bitmasks have different shapes");
  }
  int v3 = *(_DWORD *)(result + 16);
  if (v3 != *(_DWORD *)(a2 + 16)) {
    return puts("bitmaskMinus: bitmasks have different shapes");
  }
  int v4 = v3 * v2;
  if (v4 >= 1)
  {
    int v5 = *(char **)a2;
    int v6 = *(unsigned char **)result;
    do
    {
      char v7 = *v5++;
      *v6++ &= ~v7;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_2BF90(uint64_t result, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(result + 12);
  if (v3 >= 1)
  {
    uint64_t v6 = result;
    int v7 = 0;
    int v8 = *(_DWORD *)(result + 8);
    do
    {
      if (v8 <= 0)
      {
        LODWORD(v10) = v7 + 1;
      }
      else
      {
        unsigned int v9 = 0;
        uint64_t v10 = v7 + 1;
        do
        {
          uint64_t v11 = *(void *)v6;
          int v12 = *(_DWORD *)(v6 + 12);
          uint64_t v13 = *(int *)(v6 + 16);
          uint64_t v14 = *(void *)v6 + (int)v13 * (uint64_t)v7;
          int v15 = a3;
          if (v9)
          {
            int v15 = a3;
            if (v12 > v7) {
              int v15 = (*(unsigned __int8 *)(v14 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1;
            }
          }
          int v16 = v9 + 1;
          int v17 = a3;
          if (v8 > (int)(v9 + 1))
          {
            int v17 = a3;
            if (v12 > v7) {
              int v17 = (*(unsigned __int8 *)(v14 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
            }
          }
          unint64_t v18 = (unint64_t)v9 >> 3;
          char v19 = v9 & 7;
          int v20 = a3;
          if (v7)
          {
            int v20 = a3;
            if (v12 >= v7) {
              int v20 = (*(unsigned __int8 *)(v11 + v13 * (v7 - 1) + v18) >> v19) & 1;
            }
          }
          int v21 = a3;
          if (v12 > (int)v10) {
            int v21 = (*(unsigned __int8 *)(v11 + v13 * v10 + v18) >> v19) & 1;
          }
          uint64_t result = sub_2BCDC(a2, v16 - 1, v7, v15 | (*(unsigned __int8 *)(v14 + v18) >> v19) & 1 | v17 | v20 | v21);
          int v8 = *(_DWORD *)(v6 + 8);
          unsigned int v9 = v16;
        }
        while (v16 < v8);
        int v3 = *(_DWORD *)(v6 + 12);
      }
      int v7 = v10;
    }
    while ((int)v10 < v3);
  }
  return result;
}

uint64_t sub_2C108(uint64_t result, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(result + 12);
  if (v3 >= 1)
  {
    uint64_t v6 = result;
    int v7 = 0;
    int v8 = *(_DWORD *)(result + 8);
    while (v8 <= 0)
    {
      LODWORD(v11) = v7 + 1;
LABEL_75:
      int v7 = v11;
      if ((int)v11 >= v3) {
        return result;
      }
    }
    unsigned int v9 = 0;
    uint64_t v10 = v7 - 1;
    uint64_t v11 = v7 + 1;
    uint64_t v12 = v7 - 2;
    uint64_t v13 = v7 + 2;
    while (1)
    {
      uint64_t v14 = *(void *)v6;
      uint64_t v15 = *(int *)(v6 + 16);
      uint64_t v16 = *(void *)v6 + (int)v15 * (uint64_t)v7;
      unint64_t v17 = (unint64_t)v9 >> 3;
      char v18 = v9 & 7;
      int v19 = (*(unsigned __int8 *)(v16 + v17) >> (v9 & 7)) & 1;
      if (v9 >= 2)
      {
        int v21 = *(_DWORD *)(v6 + 12);
        int v23 = a3;
        if (v7)
        {
          int v23 = a3;
          if (v21 >= v7) {
            int v23 = (*(unsigned __int8 *)(v14 + v15 * v10 + ((unint64_t)(v9 - 2) >> 3)) >> ((v9 - 2) & 7)) & 1;
          }
        }
        int v24 = a3;
        if (v21 > v7) {
          int v24 = (*(unsigned __int8 *)(v16 + ((unint64_t)(v9 - 2) >> 3)) >> ((v9 - 2) & 7)) & 1;
        }
        int v25 = a3;
        if (v21 > (int)v11) {
          int v25 = (*(unsigned __int8 *)(v14 + v15 * v11 + ((unint64_t)(v9 - 2) >> 3)) >> ((v9 - 2) & 7)) & 1;
        }
        int v20 = v23 | v24 | v25 | v19;
      }
      else
      {
        int v20 = v19 | a3;
        int v21 = *(_DWORD *)(v6 + 12);
        int v22 = a3;
        if (!v9) {
          goto LABEL_32;
        }
      }
      if (v7 >= 2) {
        break;
      }
      int v26 = v20 | a3;
      int v27 = a3;
      if (v7) {
        goto LABEL_22;
      }
LABEL_25:
      int v28 = a3;
      if (v21 > v7) {
        int v28 = (*(unsigned __int8 *)(v16 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1;
      }
      int v29 = a3;
      if (v21 > (int)v11) {
        int v29 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v11 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1;
      }
      int v20 = v27 | v26 | v28 | v29;
      if (v21 <= (int)v13) {
        int v22 = a3;
      }
      else {
        int v22 = (*(unsigned __int8 *)(v14 + v15 * v13 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1;
      }
LABEL_32:
      int v30 = v22 | v20;
      if (v7 >= 2)
      {
        int v33 = a3;
        if (v21 > (int)v12) {
          int v33 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v12 + v17) >> v18) & 1;
        }
        int v31 = v30 | v33;
      }
      else
      {
        int v31 = v30 | a3;
        int v32 = a3;
        if (!v7) {
          goto LABEL_41;
        }
      }
      if (v21 >= v7) {
        int v32 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v10 + v17) >> v18) & 1;
      }
      else {
        int v32 = a3;
      }
LABEL_41:
      int v34 = a3;
      if (v21 > (int)v11) {
        int v34 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v11 + v17) >> v18) & 1;
      }
      int v35 = a3;
      if (v21 > (int)v13) {
        int v35 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v13 + v17) >> v18) & 1;
      }
      signed int v36 = v9 + 1;
      int v37 = a3;
      if (v8 > (int)(v9 + 1))
      {
        int v37 = a3;
        if (v7 >= 2)
        {
          int v37 = a3;
          if (v21 > (int)v12) {
            int v37 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v12 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
          }
        }
      }
      int v38 = a3;
      if (v7)
      {
        int v38 = a3;
        if (v8 > v36)
        {
          int v38 = a3;
          if (v21 >= v7) {
            int v38 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v10 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
          }
        }
      }
      int v39 = v31 | v32 | v34 | v35 | v37 | v38;
      if (v8 > v36)
      {
        int v41 = a3;
        if (v21 > v7) {
          int v41 = (*(unsigned __int8 *)(v16 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
        }
        int v42 = a3;
        if (v21 > (int)v11) {
          int v42 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v11 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
        }
        int v40 = v41 | v42 | v39;
        if (v21 > (int)v13)
        {
          int v43 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v13 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
          goto LABEL_62;
        }
      }
      else
      {
        int v40 = v39 | a3;
      }
      int v43 = a3;
LABEL_62:
      unint64_t v44 = v9 + 2;
      int v45 = a3;
      if (v7)
      {
        int v45 = a3;
        if (v8 > (int)v44)
        {
          int v45 = a3;
          if (v21 >= v7) {
            int v45 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v10 + ((unint64_t)(v9 + 2) >> 3)) >> ((v9 + 2) & 7)) & 1;
          }
        }
      }
      int v46 = a3;
      int v47 = a3;
      if (v8 > (int)v44)
      {
        int v46 = a3;
        if (v21 > v7) {
          int v46 = (*(unsigned __int8 *)(v16 + (v44 >> 3)) >> ((v9 + 2) & 7)) & 1;
        }
        if (v21 <= (int)v11) {
          int v47 = a3;
        }
        else {
          int v47 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v11 + (v44 >> 3)) >> ((v9 + 2) & 7)) & 1;
        }
      }
      uint64_t result = sub_2BCDC(a2, v9, v7, v43 | v40 | v45 | v46 | v47);
      int v8 = *(_DWORD *)(v6 + 8);
      unsigned int v9 = v36;
      if (v36 >= v8)
      {
        int v3 = *(_DWORD *)(v6 + 12);
        goto LABEL_75;
      }
    }
    if (v21 <= (int)v12) {
      int v26 = v20 | a3;
    }
    else {
      int v26 = (*(unsigned __int8 *)(v14 + v12 * v15 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1 | v20;
    }
LABEL_22:
    if (v21 >= v7) {
      int v27 = (*(unsigned __int8 *)(v14 + (int)v15 * (uint64_t)(int)v10 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1;
    }
    else {
      int v27 = a3;
    }
    goto LABEL_25;
  }
  return result;
}

void sub_2C5A8(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v6 = sub_2C9D4(a1);
  uint64_t v8 = v7;
  bzero(*(void **)a2, *(int *)(a2 + 12) * (uint64_t)*(int *)(a2 + 16));
  int v9 = *(_DWORD *)(a1 + 12);
  if ((int)v6 < 1
    || ((unint64_t v10 = HIDWORD(v6), v9 > SHIDWORD(v6)) ? (v11 = (int)v8 < 1) : (v11 = 1),
        v11 || *(_DWORD *)(a1 + 8) <= SHIDWORD(v8)))
  {
    if (v9 < 1) {
      return;
    }
    int v26 = 0;
    int v27 = *(_DWORD *)(a1 + 8);
    while (v27 <= 0)
    {
      LODWORD(v30) = v26 + 1;
LABEL_63:
      int v26 = v30;
      if ((int)v30 >= v9) {
        return;
      }
    }
    unsigned int v28 = 0;
    uint64_t v29 = v26 - 1;
    uint64_t v30 = v26 + 1;
    while (1)
    {
      int v31 = 2 * a3;
      int v32 = a3;
      if (!v28) {
        goto LABEL_37;
      }
      int v33 = *(_DWORD *)(a1 + 12);
      int v34 = a3;
      if (v26)
      {
        int v34 = a3;
        if (v33 >= v26) {
          int v34 = (*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * v29 + ((unint64_t)(v28 - 1) >> 3)) >> ((v28 - 1) & 7)) & 1;
        }
      }
      int v35 = a3;
      if (v33 > v26) {
        int v35 = (*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * (uint64_t)v26 + ((unint64_t)(v28 - 1) >> 3)) >> ((v28 - 1) & 7)) & 1;
      }
      int v31 = v35 + v34;
      if (v33 > (int)v30) {
        break;
      }
      int v32 = a3;
      if (v26)
      {
LABEL_38:
        uint64_t v36 = *(void *)a1;
        int v37 = *(_DWORD *)(a1 + 12);
        int v38 = *(_DWORD *)(a1 + 16);
        if (v37 >= v26) {
          int v39 = (*(unsigned __int8 *)(v36 + v38 * (uint64_t)(int)v29 + ((unint64_t)v28 >> 3)) >> (v28 & 7)) & 1;
        }
        else {
          int v39 = a3;
        }
        goto LABEL_43;
      }
LABEL_41:
      uint64_t v36 = *(void *)a1;
      int v39 = a3;
      int v37 = *(_DWORD *)(a1 + 12);
      int v38 = *(_DWORD *)(a1 + 16);
LABEL_43:
      int v40 = v38;
      unint64_t v41 = (unint64_t)v28 >> 3;
      char v42 = v28 & 7;
      int v43 = a3;
      if (v37 > (int)v30) {
        int v43 = (*(unsigned __int8 *)(v36 + v38 * (uint64_t)(int)v30 + v41) >> v42) & 1;
      }
      signed int v44 = v28 + 1;
      int v45 = a3;
      if (v27 > (int)(v28 + 1))
      {
        int v45 = a3;
        if (v37 >= v26)
        {
          int v45 = a3;
          if (v26) {
            int v45 = (*(unsigned __int8 *)(v36 + v38 * (uint64_t)(int)v29 + ((unint64_t)(v28 + 1) >> 3)) >> ((v28 + 1) & 7)) & 1;
          }
        }
      }
      uint64_t v46 = v36 + v38 * (uint64_t)v26;
      unsigned int v47 = *(unsigned __int8 *)(v46 + v41);
      int v48 = a3;
      int v49 = a3;
      if (v27 > v44)
      {
        int v48 = a3;
        if (v37 > v26) {
          int v48 = (*(unsigned __int8 *)(v46 + ((unint64_t)(v28 + 1) >> 3)) >> ((v28 + 1) & 7)) & 1;
        }
        if (v37 <= (int)v30) {
          int v49 = a3;
        }
        else {
          int v49 = (*(unsigned __int8 *)(v36 + v40 * (uint64_t)(int)v30 + ((unint64_t)(v28 + 1) >> 3)) >> ((v28 + 1) & 7)) & 1;
        }
      }
      int v50 = v32 + v31 + v39;
      int v51 = (v47 >> v42) & 1;
      if (v50 + v51 + v43 + v45 + v48 + v49 > 1 || v51 != 0)
      {
        sub_2BCDC(a2, v28, v26, 1);
        int v27 = *(_DWORD *)(a1 + 8);
      }
      unsigned int v28 = v44;
      if (v44 >= v27)
      {
        int v9 = *(_DWORD *)(a1 + 12);
        goto LABEL_63;
      }
    }
    int v32 = (*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * v30 + ((unint64_t)(v28 - 1) >> 3)) >> ((v28 - 1) & 7)) & 1;
LABEL_37:
    if (v26) {
      goto LABEL_38;
    }
    goto LABEL_41;
  }
  if ((int)v6 < SHIDWORD(v6))
  {
    int v12 = v6;
    do
    {
      if ((int)v8 >= SHIDWORD(v8))
      {
        int v13 = v12 + 1;
      }
      else
      {
        int v13 = v12 + 1;
        signed int v14 = v8;
        do
        {
          uint64_t v15 = *(void *)a1;
          uint64_t v16 = *(int *)(a1 + 16);
          uint64_t v17 = *(void *)a1 + v16 * (v12 - 1);
          int v18 = v14 + 6;
          if (v14 - 1 >= 0) {
            int v18 = v14 - 1;
          }
          uint64_t v19 = v15 + (int)v16 * (uint64_t)v12;
          uint64_t v20 = v15 + (int)v16 * (uint64_t)v13;
          int v21 = (*(unsigned __int8 *)(v19 + v14 / 8) >> (v14 & 7)) & 1;
          int v22 = ((*(unsigned __int8 *)(v19 + (v18 >> 3)) >> ((v14 - 1) & 7)) & 1)
              + ((*(unsigned __int8 *)(v20 + (v18 >> 3)) >> ((v14 - 1) & 7)) & 1)
              + ((*(unsigned __int8 *)(v17 + (v18 >> 3)) >> ((v14 - 1) & 7)) & 1)
              + ((*(unsigned __int8 *)(v17 + v14 / 8) >> (v14 & 7)) & 1)
              + v21;
          signed int v23 = v14 + 1;
          int v24 = v14 + 8;
          if (v14 + 1 >= 0) {
            int v24 = v14 + 1;
          }
          if (v22
             + ((*(unsigned __int8 *)(v20 + v14 / 8) >> (v14 & 7)) & 1)
             + ((*(unsigned __int8 *)(v17 + (v24 >> 3)) >> (v23 & 7)) & 1)
             + ((*(unsigned __int8 *)(v19 + (v24 >> 3)) >> (v23 & 7)) & 1)
             + ((*(unsigned __int8 *)(v20 + (v24 >> 3)) >> (v23 & 7)) & 1u) > 1
            || v21 != 0)
          {
            sub_2BCDC(a2, v14, v12, 1);
          }
          signed int v14 = v23;
        }
        while (HIDWORD(v8) != v23);
      }
      int v12 = v13;
    }
    while (v13 != v10);
  }
}

unint64_t sub_2C9D4(uint64_t a1)
{
  int v4 = *(_DWORD *)(a1 + 8);
  signed int v3 = *(_DWORD *)(a1 + 12);
  if (v3 < 1)
  {
    unsigned int v15 = -1;
    uint64_t v14 = *(unsigned int *)(a1 + 8);
    unsigned int v10 = -1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(unsigned int *)(a1 + 12);
    uint64_t v7 = *(__int8 **)a1;
    int v8 = *(_DWORD *)(a1 + 16);
    uint32x4_t v9 = (uint32x4_t)vdupq_n_s32(v4 - 1);
    unsigned int v10 = -1;
    v11.i64[0] = 0x700000007;
    v11.i64[1] = 0x700000007;
    v12.i64[0] = 0x100000001;
    v12.i64[1] = 0x100000001;
    v13.i64[0] = 0x800000008;
    v13.i64[1] = 0x800000008;
    uint64_t v14 = *(unsigned int *)(a1 + 8);
    unsigned int v15 = -1;
    do
    {
      if (v8 >= 1)
      {
        uint64_t v16 = 0;
        while (!v7[v16])
        {
          if (v8 == ++v16) {
            goto LABEL_28;
          }
        }
        if (v4 >= 1)
        {
          int8x16_t v17 = (int8x16_t)vdupq_n_s32(v10);
          int8x16_t v18 = (int8x16_t)vdupq_n_s32(v14);
          int32x4_t v19 = vdupq_n_s32(v15);
          int32x4_t v20 = vdupq_n_s32(v3);
          unsigned int v21 = (v4 + 7) & 0xFFFFFFF8;
          int v22 = v7;
          int32x4_t v23 = (int32x4_t)v17;
          int32x4_t v24 = (int32x4_t)v18;
          int32x4_t v25 = vdupq_n_s32(v5);
          int32x4_t v26 = v19;
          int32x4_t v27 = v20;
          int32x4_t v28 = (int32x4_t)xmmword_56230;
          int32x4_t v29 = (int32x4_t)xmmword_56220;
          do
          {
            int8x16_t v30 = (int8x16_t)v27;
            int8x16_t v31 = (int8x16_t)v20;
            int8x16_t v32 = (int8x16_t)v26;
            int8x16_t v33 = (int8x16_t)v19;
            int8x16_t v34 = (int8x16_t)v24;
            int32x4_t v35 = (int32x4_t)v18;
            int8x16_t v36 = (int8x16_t)v23;
            int32x4_t v37 = (int32x4_t)v17;
            int32x4_t v38 = (int32x4_t)vcgeq_u32(v9, (uint32x4_t)v28);
            *(int16x4_t *)v2.i8 = vmovn_s32(v38);
            uint8x8_t v39 = (uint8x8_t)vmovn_s16(v2);
            if (v39.i8[0]) {
              v39.i8[0] = *v22;
            }
            if (vmovn_s16(v2).i8[1]) {
              v39.i8[1] = *v22;
            }
            int16x4_t v40 = (int16x4_t)vmovn_s16(v2);
            if (v40.i8[2]) {
              v39.i8[2] = *v22;
            }
            if (vmovn_s16(v2).i8[3]) {
              v39.i8[3] = *v22;
            }
            int16x8_t v2 = (int16x8_t)vcgeq_u32(v9, (uint32x4_t)v29);
            int16x4_t v41 = (int16x4_t)vmovn_s16(vmovn_hight_s32(v40, (int32x4_t)v2));
            if (v41.i8[4]) {
              v39.i8[4] = *v22;
            }
            int16x4_t v42 = (int16x4_t)vmovn_s16(vmovn_hight_s32(v41, (int32x4_t)v2));
            if (v42.i8[5]) {
              v39.i8[5] = *v22;
            }
            int16x4_t v43 = (int16x4_t)vmovn_s16(vmovn_hight_s32(v42, (int32x4_t)v2));
            if (v43.i8[6]) {
              v39.i8[6] = *v22;
            }
            if (vmovn_s16(vmovn_hight_s32(v43, *(int32x4_t *)&v2)).i8[7]) {
              v39.i8[7] = *v22;
            }
            uint16x8_t v44 = vmovl_u8(v39);
            int8x16_t v45 = (int8x16_t)vmovl_high_u16(v44);
            int8x16_t v46 = vbicq_s8((int8x16_t)v38, (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v12, (uint32x4_t)vandq_s8((int8x16_t)v28, v11)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v44.i8))));
            int8x16_t v47 = vbicq_s8((int8x16_t)v2, (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v12, (uint32x4_t)vandq_s8((int8x16_t)v29, v11)), v45)));
            int32x4_t v27 = (int32x4_t)vbslq_s8(v47, (int8x16_t)vminq_s32(v25, v27), (int8x16_t)v27);
            int32x4_t v20 = (int32x4_t)vbslq_s8(v46, (int8x16_t)vminq_s32(v25, v20), (int8x16_t)v20);
            int32x4_t v26 = (int32x4_t)vbslq_s8(v47, (int8x16_t)vmaxq_s32(v25, v26), (int8x16_t)v26);
            int32x4_t v19 = (int32x4_t)vbslq_s8(v46, (int8x16_t)vmaxq_s32(v25, v19), (int8x16_t)v19);
            int32x4_t v24 = (int32x4_t)vbslq_s8(v47, (int8x16_t)vminq_s32(v29, v24), (int8x16_t)v24);
            int8x16_t v18 = vbslq_s8(v46, (int8x16_t)vminq_s32(v28, v35), (int8x16_t)v35);
            int32x4_t v23 = (int32x4_t)vbslq_s8(v47, (int8x16_t)vmaxq_s32(v29, v23), (int8x16_t)v23);
            int8x16_t v17 = vbslq_s8(v46, (int8x16_t)vmaxq_s32(v28, v37), (int8x16_t)v37);
            int32x4_t v28 = vaddq_s32(v28, v13);
            int32x4_t v29 = vaddq_s32(v29, v13);
            ++v22;
            v21 -= 8;
          }
          while (v21);
          signed int v3 = vminvq_s32(vminq_s32((int32x4_t)vbslq_s8((int8x16_t)v38, (int8x16_t)v20, v31), (int32x4_t)vbslq_s8((int8x16_t)v2, (int8x16_t)v27, v30)));
          unsigned int v15 = vmaxvq_s32(vmaxq_s32((int32x4_t)vbslq_s8((int8x16_t)v38, (int8x16_t)v19, v33), (int32x4_t)vbslq_s8((int8x16_t)v2, (int8x16_t)v26, v32)));
          uint64_t v14 = vminvq_s32(vminq_s32((int32x4_t)vbslq_s8((int8x16_t)v38, v18, (int8x16_t)v35), (int32x4_t)vbslq_s8((int8x16_t)v2, (int8x16_t)v24, v34)));
          unsigned int v10 = vmaxvq_s32(vmaxq_s32((int32x4_t)vbslq_s8((int8x16_t)v38, v17, (int8x16_t)v37), (int32x4_t)vbslq_s8((int8x16_t)v2, (int8x16_t)v23, v36)));
        }
      }
LABEL_28:
      ++v5;
      v7 += v8;
    }
    while (v5 != v6);
  }
  return sub_13BF4(v14, v3, v10 + 1, v15 + 1);
}

uint64_t sub_2CCA0(uint64_t result, uint64_t a2, char a3)
{
  int v3 = *(_DWORD *)(result + 12);
  if (v3 >= 1)
  {
    uint64_t v6 = result;
    int v7 = 0;
    int v8 = *(_DWORD *)(result + 8);
    do
    {
      if (v8 <= 0)
      {
        LODWORD(v10) = v7 + 1;
      }
      else
      {
        unsigned int v9 = 0;
        uint64_t v10 = v7 + 1;
        do
        {
          uint64_t v11 = *(void *)v6;
          int v12 = *(_DWORD *)(v6 + 12);
          uint64_t v13 = *(int *)(v6 + 16);
          uint64_t v14 = *(void *)v6 + (int)v13 * (uint64_t)v7;
          LOBYTE(v15) = a3;
          if (v9)
          {
            LOBYTE(v15) = a3;
            if (v12 > v7) {
              int v15 = (*(unsigned __int8 *)(v14 + ((unint64_t)(v9 - 1) >> 3)) >> ((v9 - 1) & 7)) & 1;
            }
          }
          int v16 = v9 + 1;
          LOBYTE(v17) = a3;
          if (v8 > (int)(v9 + 1))
          {
            LOBYTE(v17) = a3;
            if (v12 > v7) {
              int v17 = (*(unsigned __int8 *)(v14 + ((unint64_t)(v9 + 1) >> 3)) >> ((v9 + 1) & 7)) & 1;
            }
          }
          unint64_t v18 = (unint64_t)v9 >> 3;
          char v19 = v9 & 7;
          LOBYTE(v20) = a3;
          if (v7)
          {
            LOBYTE(v20) = a3;
            if (v12 >= v7) {
              int v20 = (*(unsigned __int8 *)(v11 + v13 * (v7 - 1) + v18) >> v19) & 1;
            }
          }
          LOBYTE(v21) = a3;
          if (v12 > (int)v10) {
            int v21 = (*(unsigned __int8 *)(v11 + v13 * v10 + v18) >> v19) & 1;
          }
          uint64_t result = sub_2BCDC(a2, v16 - 1, v7, (*(unsigned __int8 *)(v14 + v18) >> v19) & 1 & v15 & v17 & v20 & v21);
          int v8 = *(_DWORD *)(v6 + 8);
          unsigned int v9 = v16;
        }
        while (v16 < v8);
        int v3 = *(_DWORD *)(v6 + 12);
      }
      int v7 = v10;
    }
    while ((int)v10 < v3);
  }
  return result;
}

unsigned __int8 *sub_2CE18(unsigned __int8 *result, uint64_t *a2, int a3)
{
  int v3 = *((_DWORD *)result + 3);
  if (v3 >= 1)
  {
    int v4 = 0;
    int v5 = *((_DWORD *)result + 2);
    uint64_t v6 = *a2;
    int v7 = *(unsigned __int8 **)result;
    uint64_t v8 = *((int *)a2 + 4);
    uint64_t v9 = *((int *)result + 7);
    uint64_t v10 = *((int *)result + 4);
    do
    {
      if (v5 >= 1)
      {
        unsigned int v11 = 0;
        uint64_t result = v7;
        do
        {
          if (*result > a3) {
            *(unsigned char *)(v6 + ((unint64_t)v11 >> 3)) |= 1 << (v11 & 7);
          }
          ++v11;
          result += v9;
        }
        while (v5 != v11);
      }
      ++v4;
      v7 += v10;
      v6 += v8;
    }
    while (v4 != v3);
  }
  return result;
}

unint64_t sub_2CEA4(uint64_t *a1, int a2, int a3)
{
  if (a2 < 0
    || a3 < 0
    || (uint64_t v4 = *((unsigned int *)a1 + 2), (int)v4 <= a2)
    || (uint64_t v5 = *((unsigned int *)a1 + 3), (int)v5 <= a3)
    || (uint64_t v6 = *a1,
        uint64_t v7 = *((int *)a1 + 4),
        uint64_t v8 = *a1 + (int)v7 * (uint64_t)a3,
        unint64_t v9 = (unint64_t)a2 >> 3,
        int v10 = 1 << (a2 & 7),
        (v10 & *(unsigned char *)(v8 + v9)) == 0))
  {
    puts("bitmaskBoundingBitmapRectWithSeedPoint: seed point outside bitmask");
    uint64_t v13 = 0;
    LODWORD(v14) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    LODWORD(v11) = a2;
    while (1)
    {
      BOOL v12 = __OFSUB__(v11, 1);
      unint64_t v11 = (v11 - 1);
      if (((v11 & 0x80000000) != 0) != v12) {
        break;
      }
      if (((*(unsigned __int8 *)(v8 + (v11 >> 3)) >> (v11 & 7)) & 1) == 0)
      {
        uint64_t v13 = (v11 + 1);
        goto LABEL_15;
      }
    }
    uint64_t v13 = 0;
LABEL_15:
    int v18 = v4 - 1;
    if (a2 > (int)v4 - 1) {
      int v18 = a2;
    }
    while (v18 != a2)
    {
      uint64_t v15 = (a2 + 1);
      if ((int)v15 >= 0) {
        int v19 = a2 + 1;
      }
      else {
        int v19 = a2 + 8;
      }
      int v20 = *(unsigned __int8 *)(v8 + (v19 >> 3)) >> (v15 & 7);
      a2 = v15;
      if ((v20 & 1) == 0) {
        goto LABEL_24;
      }
    }
    uint64_t v15 = (v18 + 1);
LABEL_24:
    uint64_t v21 = a3;
    LODWORD(v14) = a3 + 1;
    int v22 = (unsigned __int8 *)(v6 + v9 + (a3 - 1) * v7);
    uint64_t v23 = a3;
    while (1)
    {
      BOOL v24 = v23-- < 1;
      if (v24) {
        break;
      }
      int v25 = *v22;
      LODWORD(v14) = v14 - 1;
      v22 -= v7;
      if ((v10 & v25) == 0) {
        goto LABEL_29;
      }
    }
    LODWORD(v14) = a3 & (a3 >> 31);
LABEL_29:
    int v26 = v5 - 1;
    if (a3 > (int)v5 - 1) {
      int v26 = a3;
    }
    int v27 = a3 - 1;
    uint64_t v28 = v26 - v21;
    int32x4_t v29 = (unsigned __int8 *)(v6 + v9 + v7 + (int)v7 * (uint64_t)(int)v21);
    while (v28)
    {
      int v30 = *v29;
      ++v27;
      --v28;
      v29 += v7;
      if ((v10 & v30) == 0) {
        goto LABEL_36;
      }
    }
    int v27 = v26;
LABEL_36:
    uint64_t v16 = (v27 + 1);
    while (1)
    {
LABEL_37:
      if ((int)v13 >= 1)
      {
        int v31 = 0;
        uint64_t v32 = v13;
        while ((int)v16 > (int)v14)
        {
          int v33 = v32 + 6;
          if ((int)v32 >= 1) {
            int v33 = v32 - 1;
          }
          int8x16_t v34 = (unsigned __int8 *)(v6 + (int)v7 * (uint64_t)(int)v14 + (v33 >> 3));
          int v35 = v16 - v14;
          while (((1 << ((v32 - 1) & 7)) & *v34) == 0)
          {
            v34 += v7;
            if (!--v35)
            {
              uint64_t v13 = v32;
              goto LABEL_50;
            }
          }
          int v31 = 1;
          BOOL v24 = (int)v32 < 2;
          uint64_t v32 = (v32 - 1);
          if (v24)
          {
            uint64_t v13 = 0;
            goto LABEL_50;
          }
        }
      }
      int v31 = 0;
LABEL_50:
      if ((int)v15 < (int)v4)
      {
        int v36 = v31;
        uint64_t v37 = v15;
        while ((int)v16 > (int)v14)
        {
          int32x4_t v38 = (unsigned __int8 *)(v6 + (int)v7 * (uint64_t)(int)v14 + (int)v37 / 8);
          int v39 = v16 - v14;
          while (((1 << (v37 & 7)) & *v38) == 0)
          {
            v38 += v7;
            if (!--v39)
            {
              uint64_t v15 = v37;
              int v31 = v36;
              goto LABEL_59;
            }
          }
          uint64_t v37 = (v37 + 1);
          int v36 = 1;
          if (v37 == v4)
          {
            uint64_t v15 = v4;
            int v31 = 1;
            break;
          }
        }
      }
LABEL_59:
      if ((int)v14 >= 1)
      {
        uint64_t v14 = v14;
        int v40 = v31;
        while ((int)v13 < (int)v15)
        {
          int v41 = v13;
          while (((*(unsigned __int8 *)(v6 + (v14 - 1) * v7 + v41 / 8) >> (v41 & 7)) & 1) == 0)
          {
            if (v15 == ++v41) {
              goto LABEL_70;
            }
          }
          int v40 = 1;
          BOOL v24 = v14-- < 2;
          if (v24)
          {
            LODWORD(v14) = 0;
            goto LABEL_70;
          }
        }
      }
      int v40 = v31;
LABEL_70:
      if ((int)v16 < (int)v5)
      {
        uint64_t v16 = (int)v16;
        int v42 = v40;
LABEL_72:
        if ((int)v13 < (int)v15) {
          break;
        }
      }
      if (!v40) {
        goto LABEL_11;
      }
    }
    int v43 = v13;
    do
    {
      if ((*(unsigned __int8 *)(v6 + v16 * v7 + v43 / 8) >> (v43 & 7)))
      {
        ++v16;
        int v42 = 1;
        if (v16 != (int)v5) {
          goto LABEL_72;
        }
        uint64_t v16 = v5;
        goto LABEL_37;
      }
      ++v43;
    }
    while (v15 != v43);
    if (v42) {
      goto LABEL_37;
    }
  }
LABEL_11:

  return sub_13BF4(v13, v14, v15, v16);
}

uint64_t sub_2D234(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((int)a2 < SHIDWORD(a2))
  {
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = a2;
    do
    {
      if ((int)a3 < SHIDWORD(a3))
      {
        int v7 = a3;
        do
        {
          int v8 = *(unsigned __int8 *)(*(void *)result + *(int *)(result + 16) * (uint64_t)v6 + v7 / 8);
          int v9 = 1 << (v7 & 7);
          BOOL v10 = (v9 & v8) == 0;
          if ((v9 & v8) != 0) {
            int v11 = v7;
          }
          else {
            int v11 = 0;
          }
          v5 += v11;
          if (v10) {
            int v12 = 0;
          }
          else {
            int v12 = v6;
          }
          v4 += v12;
          if (!v10) {
            ++v3;
          }
          ++v7;
        }
        while (HIDWORD(a3) != v7);
      }
      ++v6;
    }
    while (v6 != HIDWORD(a2));
  }
  return result;
}

uint64_t sub_2D30C(uint64_t a1)
{
  unint64_t v3 = sub_2C9D4(a1);

  return sub_2D234(a1, v3, v2);
}

float sub_2D354(uint64_t a1)
{
  unint64_t v3 = sub_2C9D4(a1);

  return sub_2D39C(a1, v3, v2);
}

float sub_2D39C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3 = 1.0 / (float)(HIDWORD(a3) - a3);
  int v4 = HIDWORD(a2) - a2;
  float v5 = 1.0 / (float)(HIDWORD(a2) - a2);
  if (SHIDWORD(a2) <= (int)a2)
  {
    int v7 = 0;
  }
  else
  {
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = (uint64_t)rintf(v5 * 16777000.0);
    float v9 = rintf(v3 * 16777000.0);
    do
    {
      if (SHIDWORD(a3) > (int)a3)
      {
        int v10 = ((int)(uint64_t)v9 >> 1) + 2048;
        int v11 = a3;
        do
        {
          v7 += (*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * (uint64_t)(int)a2 + v11 / 8) >> (v11 & 7)) & 1 ^ (((((((int)v8 >> 1) + 2048 + v6 * (int)v8) >> 12) - 2048) * (((((int)v8 >> 1) + 2048 + v6 * (int)v8) >> 12) - 2048) + ((v10 >> 12) - 2048) * ((v10 >> 12) - 2048)) < 0x400000);
          ++v11;
          v10 += (uint64_t)v9;
        }
        while (HIDWORD(a3) != v11);
      }
      LODWORD(a2) = a2 + 1;
      ++v6;
    }
    while (v6 != v4);
  }
  return (float)v7 * -2.0 * v5 * v3 + 1.0;
}

uint64_t sub_2D4B8(uint64_t a1)
{
  unint64_t v3 = sub_2C9D4(a1);

  return sub_2D500(a1, v3, v2);
}

uint64_t sub_2D500(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = HIDWORD(a2);
  if ((int)a2 >= SHIDWORD(a2)) {
    return 0;
  }
  uint64_t v4 = 0;
  do
  {
    if ((int)a3 < SHIDWORD(a3))
    {
      int v5 = a3;
      do
      {
        uint64_t v4 = ((*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * (uint64_t)(int)a2 + v5 / 8) >> (v5 & 7)) & 1)
           + v4;
        ++v5;
      }
      while (HIDWORD(a3) != v5);
    }
    LODWORD(a2) = a2 + 1;
  }
  while (a2 != v3);
  return v4;
}

uint64_t sub_2D578()
{
  return 0;
}

uint64_t sub_2D580(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 2);
  uint64_t v2 = 0;
  signed int v3 = v1 - 1;
  if (v1 >= 1)
  {
    uint64_t v4 = *a1;
    int32x4_t v5 = (int32x4_t)xmmword_56230;
    uint32x4_t v6 = (uint32x4_t)vdupq_n_s32(v3);
    int8x16_t v7 = 0uLL;
    v8.i64[0] = 0x700000007;
    v8.i64[1] = 0x700000007;
    v9.i64[0] = 0x400000004;
    v9.i64[1] = 0x400000004;
    do
    {
      int32x4_t v10 = (int32x4_t)v7;
      int32x4_t v11 = (int32x4_t)vcgeq_u32(v6, (uint32x4_t)v5);
      int16x4_t v12 = vmovn_s32(v11);
      if (v12.i8[0]) {
        v7.i8[0] = *(unsigned char *)(v4 + ((unint64_t)v2 >> 3));
      }
      if (v12.i8[2]) {
        v7.i8[2] = *(unsigned char *)(v4 + ((unint64_t)v2 >> 3));
      }
      if (v12.i8[4]) {
        v7.i8[4] = *(unsigned char *)(v4 + ((unint64_t)v2 >> 3));
      }
      if (v12.i8[6]) {
        v7.i8[6] = *(unsigned char *)(v4 + ((unint64_t)v2 >> 3));
      }
      int8x16_t v7 = (int8x16_t)vaddq_s32((int32x4_t)(*(_OWORD *)&vshlq_u32(vmovl_u16((uint16x4_t)(v7.i64[0] & 0xFF00FF00FF00FFLL)), (uint32x4_t)vnegq_s32((int32x4_t)vandq_s8((int8x16_t)v5, v8))) & __PAIR128__(0xFFFFFF01FFFFFF01, 0xFFFFFF01FFFFFF01)), v10);
      LODWORD(v2) = v2 + 4;
      int32x4_t v5 = vaddq_s32(v5, v9);
    }
    while (((v1 + 3) & 0xFFFFFFFC) != v2);
    uint64_t v2 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)v11, v7, (int8x16_t)v10));
  }
  int v13 = *((_DWORD *)a1 + 3);
  if (v13 < 3)
  {
    LODWORD(v14) = 1;
  }
  else
  {
    uint64_t v14 = (v13 - 1);
    if (v3 >= 0) {
      int v15 = v1 - 1;
    }
    else {
      int v15 = v1 + 6;
    }
    uint64_t v16 = *((int *)a1 + 4);
    uint64_t v17 = (uint64_t)v15 >> 3;
    char v18 = v3 & 7;
    int v19 = (unsigned char *)(*a1 + v16);
    uint64_t v20 = v14 - 1;
    do
    {
      uint64_t v2 = v2 + (*v19 & 1) + ((v19[v17] >> v18) & 1u);
      v19 += v16;
      --v20;
    }
    while (v20);
  }
  unsigned int v21 = v1 - 1;
  if (v1 < 1) {
    return v2;
  }
  unsigned int v22 = 0;
  uint64_t v23 = *a1 + *((int *)a1 + 4) * (uint64_t)(int)v14;
  unsigned int v24 = (v1 + 3) & 0xFFFFFFFC;
  uint32x4_t v25 = (uint32x4_t)vdupq_n_s32(v21);
  int8x16_t v26 = (int8x16_t)v2;
  int32x4_t v27 = (int32x4_t)xmmword_56230;
  v28.i64[0] = 0x700000007;
  v28.i64[1] = 0x700000007;
  v29.i64[0] = 0x400000004;
  v29.i64[1] = 0x400000004;
  do
  {
    int32x4_t v30 = (int32x4_t)v26;
    int32x4_t v31 = (int32x4_t)vcgeq_u32(v25, (uint32x4_t)v27);
    int16x4_t v32 = vmovn_s32(v31);
    if (v32.i8[0]) {
      v26.i8[0] = *(unsigned char *)(v23 + ((unint64_t)v22 >> 3));
    }
    if (v32.i8[2]) {
      v26.i8[2] = *(unsigned char *)(v23 + ((unint64_t)v22 >> 3));
    }
    if (v32.i8[4]) {
      v26.i8[4] = *(unsigned char *)(v23 + ((unint64_t)v22 >> 3));
    }
    if (v32.i8[6]) {
      v26.i8[6] = *(unsigned char *)(v23 + ((unint64_t)v22 >> 3));
    }
    int8x16_t v26 = (int8x16_t)vaddq_s32((int32x4_t)(*(_OWORD *)&vshlq_u32(vmovl_u16((uint16x4_t)(v26.i64[0] & 0xFF00FF00FF00FFLL)), (uint32x4_t)vnegq_s32((int32x4_t)vandq_s8((int8x16_t)v27, v28))) & __PAIR128__(0xFFFFFF01FFFFFF01, 0xFFFFFF01FFFFFF01)), v30);
    v22 += 4;
    int32x4_t v27 = vaddq_s32(v27, v29);
  }
  while (v24 != v22);
  return vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)v31, v26, (int8x16_t)v30));
}

uint64_t sub_2D774(uint64_t a1, char *a2)
{
  uint64_t result = puts(a2);
  if (*(int *)(a1 + 12) >= 1)
  {
    int v4 = 0;
    do
    {
      printf("  ");
      if (*(int *)(a1 + 8) >= 1)
      {
        unsigned int v5 = 0;
        do
        {
          if ((*(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 16) * (uint64_t)v4 + ((unint64_t)v5 >> 3)) >> (v5 & 7))) {
            int v6 = 49;
          }
          else {
            int v6 = 48;
          }
          putchar(v6);
          ++v5;
        }
        while ((signed int)v5 < *(_DWORD *)(a1 + 8));
      }
      uint64_t result = putchar(10);
      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 12));
  }
  return result;
}

uint64_t sub_2D834(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 >= 0) {
    int v3 = *(_DWORD *)(a1 + 12);
  }
  else {
    int v3 = v2 + 1;
  }
  int v4 = sub_2BA84(*(_DWORD *)(a1 + 8) / 2, v3 >> 1);
  uint64_t v5 = (uint64_t)v4;
  int v6 = *((_DWORD *)v4 + 3);
  if (v6 >= 1)
  {
    int v7 = 0;
    int v8 = *((_DWORD *)v4 + 2);
    do
    {
      if (v8 >= 1)
      {
        int v9 = 0;
        for (unsigned int i = 0; (int)i < v8; ++i)
        {
          uint64_t v11 = *(int *)(a1 + 16);
          unint64_t v12 = (unint64_t)i >> 2;
          unsigned int v13 = *(unsigned __int8 *)(*(void *)a1 + (int)v11 * (uint64_t)(2 * v7) + v12);
          int v14 = *(unsigned __int8 *)(*(void *)a1 + v11 * ((2 * v7) | 1) + v12);
          sub_2BCDC(v5, i, v7, (((v14 | v13) >> (v9 & 6 | 1)) | ((v14 | v13) >> (v9 & 6))) & 1);
          int v8 = *(_DWORD *)(v5 + 8);
          v9 += 2;
        }
        int v6 = *(_DWORD *)(v5 + 12);
      }
      ++v7;
    }
    while (v7 < v6);
  }
  return v5;
}

uint64_t sub_2D938(uint64_t result, unint64_t a2, uint64_t a3, int *a4, int *a5, double a6, double a7)
{
  unint64_t v7 = HIDWORD(a2);
  if ((int)a2 >= SHIDWORD(a2))
  {
    int v10 = -1;
    int v9 = -1;
  }
  else
  {
    float v8 = (float)(*(_DWORD *)(result + 8) * *(_DWORD *)(result + 8) + *(_DWORD *)(result + 12) * *(_DWORD *)(result + 12));
    int v9 = -1;
    int v10 = -1;
    do
    {
      if ((int)a3 < SHIDWORD(a3))
      {
        float v11 = (float)(int)a2 - a7;
        float v12 = v11 * v11;
        int v13 = a3;
        do
        {
          if ((*(unsigned __int8 *)(*(void *)result + *(int *)(result + 16) * (uint64_t)(int)a2 + v13 / 8) >> (v13 & 7)))
          {
            float v14 = (float)v13 - a6;
            float v15 = v12 + (float)(v14 * v14);
            if (v15 < v8)
            {
              int v10 = v13;
              int v9 = a2;
              float v8 = v15;
            }
          }
          ++v13;
        }
        while (HIDWORD(a3) != v13);
      }
      LODWORD(a2) = a2 + 1;
    }
    while (a2 != v7);
  }
  *a4 = v10;
  *a5 = v9;
  return result;
}

uint64_t sub_2DA04(uint64_t a1, int *a2, int *a3, double a4, double a5)
{
  unint64_t v11 = sub_2C9D4(a1);

  return sub_2D938(a1, v11, v10, a2, a3, a4, a5);
}

double sub_2DA7C(uint64_t a1, uint64_t *a2, float *a3, int *a4)
{
  unint64_t v9 = sub_2C9D4(a1);

  return sub_2DADC(a1, a2, v9, v8, a3, a4);
}

double sub_2DADC(uint64_t a1, uint64_t *a2, uint64_t a3, unint64_t a4, float *a5, int *a6)
{
  unint64_t v6 = HIDWORD(a4);
  int v8 = *((_DWORD *)a2 + 2);
  int v7 = *((_DWORD *)a2 + 3);
  if ((int)a4 <= 1) {
    LODWORD(a4) = 1;
  }
  if (v8 <= (int)v6) {
    LODWORD(v6) = v8 - 1;
  }
  if ((int)a3 <= 1) {
    int v9 = 1;
  }
  else {
    int v9 = a3;
  }
  if (v7 <= SHIDWORD(a3)) {
    int v10 = v7 - 1;
  }
  else {
    int v10 = HIDWORD(a3);
  }
  if (v9 >= v10)
  {
    *a5 = 0.0;
    *a6 = 0;
  }
  else
  {
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    uint64_t v14 = *a2;
    uint64_t v15 = *((int *)a2 + 4);
    uint64_t v16 = (int)v15 * v9;
    uint64_t v17 = *((int *)a2 + 7);
    uint64_t v18 = *a2 + v16 + -(int)v15 - v17;
    uint64_t v19 = *a2 + v16 + (int)v17 - (int)v15;
    uint64_t v20 = *a2 + v16 - v17;
    uint64_t v21 = *a2 + v17 + v16;
    uint64_t v22 = *a2 + v16 - v15;
    uint64_t v23 = v14 + v15 + v16 - v17;
    uint64_t v24 = v14 + v15 + v16;
    uint64_t v25 = v14 + v16 + (int)v17 + (int)v15;
    uint64_t v26 = (int)v17 * (int)a4;
    int v46 = v10;
    int v47 = a4;
    do
    {
      if ((int)a4 >= (int)v6)
      {
        ++v9;
      }
      else
      {
        uint64_t v27 = v19;
        uint64_t v28 = *(int *)(a1 + 16);
        uint64_t v29 = *(void *)a1 + (int)v28 * (uint64_t)v9;
        uint64_t v30 = *(void *)a1 + v28 * (v9 + 1);
        uint64_t v31 = *(void *)a1 + v28 * (v9 - 1);
        uint64_t v32 = v25;
        uint64_t v33 = v24;
        uint64_t v49 = v23;
        uint64_t v50 = v21;
        uint64_t v51 = v20;
        uint64_t v52 = v19;
        uint64_t v53 = v22;
        uint64_t v34 = v18;
        unsigned int v35 = a4;
        do
        {
          unint64_t v36 = (unint64_t)v35 >> 3;
          unsigned int v37 = v35 + 1;
          if (((*(unsigned __int8 *)(v29 + v36) >> (v35 & 7)) & 1) != 0
            && ((*(unsigned __int8 *)(v29 + ((unint64_t)(v35 + 1) >> 3)) >> ((v35 + 1) & 7)) & 1)
             + ((*(unsigned __int8 *)(v30 + v36) >> (v35 & 7)) & 1)
             + ((*(unsigned __int8 *)(v29 + ((unint64_t)(v35 - 1) >> 3)) >> ((v35 - 1) & 7)) & 1)
             + ((*(unsigned __int8 *)(v31 + v36) >> (v35 & 7)) & 1u) <= 3)
          {
            int v38 = *(unsigned __int8 *)(v34 + v26) - *(unsigned __int8 *)(v32 + v26);
            if (v38 < 0) {
              int v38 = *(unsigned __int8 *)(v32 + v26) - *(unsigned __int8 *)(v34 + v26);
            }
            int v39 = *(unsigned __int8 *)(v22 + v26) - *(unsigned __int8 *)(v33 + v26);
            if (v39 < 0) {
              int v39 = *(unsigned __int8 *)(v33 + v26) - *(unsigned __int8 *)(v22 + v26);
            }
            int v40 = *(unsigned __int8 *)(v27 + v26) - *(unsigned __int8 *)(v23 + v26);
            if (v40 < 0) {
              int v40 = *(unsigned __int8 *)(v23 + v26) - *(unsigned __int8 *)(v27 + v26);
            }
            int v41 = *(unsigned __int8 *)(v20 + v26) - *(unsigned __int8 *)(v21 + v26);
            if (v41 < 0) {
              int v41 = *(unsigned __int8 *)(v21 + v26) - *(unsigned __int8 *)(v20 + v26);
            }
            int v42 = v40 + v41 + v39 + v38;
            if (v42 >= v11) {
              int v43 = v11;
            }
            else {
              int v43 = v42;
            }
            if (v12) {
              int v11 = v43;
            }
            else {
              int v11 = v42;
            }
            v13 += v42;
            ++v12;
          }
          v34 += v17;
          v22 += v17;
          v27 += v17;
          v20 += v17;
          v21 += v17;
          v23 += v17;
          v33 += v17;
          v32 += v17;
          unsigned int v35 = v37;
        }
        while (v6 != v37);
        int v10 = v46;
        LODWORD(a4) = v47;
        ++v9;
        uint64_t v19 = v52;
        uint64_t v22 = v53;
        uint64_t v21 = v50;
        uint64_t v20 = v51;
        uint64_t v23 = v49;
      }
      v18 += v15;
      v22 += v15;
      v19 += v15;
      v20 += v15;
      v21 += v15;
      v23 += v15;
      v24 += v15;
      v25 += v15;
    }
    while (v9 != v10);
    *a5 = (float)v11;
    *a6 = v12;
    if (v12)
    {
      *(float *)&double result = (float)v13 / (float)v12;
      return result;
    }
  }
  return 0.0;
}

void sub_2DDB4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6 = sub_2C9D4(a1);
  unint64_t v8 = v7;
  *(void *)(a3 + 36) = v6;
  *(void *)(a3 + 44) = v7;
  sub_2D234(a1, v6, v7);
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v10;
  *(_DWORD *)(a3 + 16) = sub_2D500(a1, v6, v8);
  *(float *)(a3 + 20) = sub_2D39C(a1, v6, v8);
  double v11 = sub_2DADC(a1, a2, v6, v8, (float *)(a3 + 28), (int *)(a3 + 32));
  *(_DWORD *)(a3 + 24) = LODWORD(v11);
  BOOL v12 = *(int *)(a3 + 36) < 1
     || *(_DWORD *)(a3 + 40) >= *(_DWORD *)(a1 + 12)
     || *(int *)(a3 + 44) < 1
     || *(_DWORD *)(a3 + 48) >= *(_DWORD *)(a1 + 8);
  *(unsigned char *)(a3 + 56) = v12;
}

void sub_2DEA0(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, int a5)
{
  unint64_t v8 = sub_2CEA4((uint64_t *)a1, a4, a5);
  unint64_t v10 = v9;
  *(void *)(a3 + 36) = v8;
  *(void *)(a3 + 44) = v9;
  sub_2D234(a1, v8, v9);
  *(void *)a3 = v11;
  *(void *)(a3 + 8) = v12;
  *(_DWORD *)(a3 + 16) = sub_2D500(a1, v8, v10);
  *(float *)(a3 + 20) = sub_2D39C(a1, v8, v10);
  double v13 = sub_2DADC(a1, a2, v8, v10, (float *)(a3 + 28), (int *)(a3 + 32));
  *(_DWORD *)(a3 + 24) = LODWORD(v13);
  BOOL v14 = *(int *)(a3 + 36) < 1
     || *(_DWORD *)(a3 + 40) >= *(_DWORD *)(a1 + 12)
     || *(int *)(a3 + 44) < 1
     || *(_DWORD *)(a3 + 48) >= *(_DWORD *)(a1 + 8);
  *(unsigned char *)(a3 + 56) = v14;
}

void sub_2DF94(uint64_t a1, uint64_t a2, int8x16_t a3, int32x4_t a4)
{
  if (!a1) {
    sub_4C570();
  }
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32((int32x4_t)vextq_s8(a3, (int8x16_t)vrev64q_s32(a4), 8uLL), (int32x4_t)vextq_s8((int8x16_t)a4, (int8x16_t)vrev64q_s32((int32x4_t)a3), 8uLL)))))sub_4C5C8(); {
  int32x2_t v4 = vsub_s32((int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL), *(int32x2_t *)a3.i8);
  }
  uint32x2_t v5 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)v4);
  if ((vpmin_u32(v5, v5).u32[0] & 0x80000000) == 0
    || (int32x2_t v6 = (int32x2_t)vsubq_s32((int32x4_t)a3, a4).u64[0],
        uint32x2_t v7 = (uint32x2_t)vcgt_s32(v6, (int32x2_t)-1),
        (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    sub_4C59C();
  }
  int32x2_t v8 = vadd_s32(v4, (int32x2_t)0x100000001);
  __int32 v9 = v8.i32[1];
  if (v8.i32[1] >= 1)
  {
    uint64_t v11 = (char *)(a1 + v6.i32[1] * a2 + v6.i32[0]);
    size_t v12 = v8.i32[0];
    do
    {
      bzero(v11, v12);
      v11 += a2;
      --v9;
    }
    while (v9);
  }
}

double sub_2E068(uint64_t a1)
{
  *(_OWORD *)a1 = xmmword_56240;
  *(void *)&double result = 0x8000000080000000;
  *(void *)(a1 + 16) = 0x8000000080000000;
  return result;
}

uint64_t sub_2E080(uint64_t result, uint64_t a2, uint64_t a3, int8x16_t a4, int32x4_t a5, int32x2_t a6, int32x2_t a7, int32x2_t a8, int32x2_t a9)
{
  if (!result) {
    sub_4C5F4();
  }
  if (!a2) {
    sub_4C620();
  }
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32((int32x4_t)vextq_s8(a4, (int8x16_t)vrev64q_s32(a5), 8uLL), (int32x4_t)vextq_s8((int8x16_t)a5, (int8x16_t)vrev64q_s32((int32x4_t)a4), 8uLL)))))sub_4C678(); {
  uint32x2_t v11 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32((int32x2_t)*(_OWORD *)&vextq_s8(a4, a4, 8uLL), *(int32x2_t *)a4.i8));
  }
  if ((vpmin_u32(v11, v11).u32[0] & 0x80000000) == 0
    || (uint32x2_t v12 = (uint32x2_t)vcgt_s32(vsub_s32(*(int32x2_t *)a4.i8, *(int32x2_t *)a5.i8), (int32x2_t)-1),
        (vpmin_u32(v12, v12).u32[0] & 0x80000000) == 0))
  {
    sub_4C64C();
  }
  if (a4.i32[1] <= a4.i32[3])
  {
    uint64_t v15 = result;
    signed __int32 v16 = a4.i32[0];
    signed __int32 v17 = a4.i32[2];
    unsigned __int32 v18 = a4.i32[2] + 1;
    unsigned __int32 v19 = a4.u32[1];
    unsigned __int32 v20 = a4.i32[3] + 1;
    uint64_t v21 = a3 * (a4.i32[1] - (uint64_t)a5.i32[1]) + 4 * a4.i32[0] - 4 * a5.i32[0] + a2 + 2;
    do
    {
      if (v16 <= v17)
      {
        uint64_t v22 = (unsigned char *)v21;
        signed __int32 v23 = v16;
        do
        {
          double result = sub_2E2D0(a6, a7, a8, a9, (int32x2_t)__PAIR64__(v19, v23));
          if (result)
          {
            LOBYTE(v24) = *v22;
            float v27 = (float)v24;
            LOBYTE(v25) = *(v22 - 1);
            float v28 = (float)v25;
            LOBYTE(v26) = *(v22 - 2);
            float v29 = (float)v26;
            signed int v30 = llroundf((float)((float)((float)(v28 * -0.41869) + (float)(v27 * 0.5)) + (float)(v29 * -0.08131)) + 127.5);
            int32x2_t v31 = vcvt_s32_f32(vrnda_f32(vadd_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32((float32x2_t)0xBEA99AE93F1645A2, v28), (float32x2_t)0xBE2CCA2E3E991687, v27), (float32x2_t)0x3F0000003DE978D5, v29), (float32x2_t)0x42FF000000000000)));
            *(int32x2_t *)uint64_t v15 = vmin_s32(*(int32x2_t *)v15, v31);
            signed int v32 = *(_DWORD *)(v15 + 8);
            if (v32 >= v30) {
              signed int v32 = v30;
            }
            *(_DWORD *)(v15 + 8) = v32;
            *(int32x2_t *)(v15 + 12) = vmax_s32(*(int32x2_t *)(v15 + 12), v31);
            if (*(_DWORD *)(v15 + 20) > v30) {
              signed int v30 = *(_DWORD *)(v15 + 20);
            }
            *(_DWORD *)(v15 + 20) = v30;
          }
          ++v23;
          v22 += 4;
        }
        while (v18 != v23);
      }
      ++v19;
      v21 += a3;
    }
    while (v20 != v19);
  }
  return result;
}

uint64_t sub_2E2D0(int32x2_t a1, int32x2_t a2, int32x2_t a3, int32x2_t a4, int32x2_t a5)
{
  unsigned __int8 v5 = 0;
  int32x2_t v6 = vmul_s32(vrev64_s32(vsub_s32(a2, a1)), vsub_s32(a5, a1));
  if (vcge_s32(vdup_lane_s32(v6, 1), v6).u8[0])
  {
    int32x2_t v7 = vmul_s32(vrev64_s32(vsub_s32(a3, a2)), vsub_s32(a5, a2));
    int32x2_t v8 = vmul_s32(vrev64_s32(vsub_s32(a4, a3)), vsub_s32(a5, a3));
    int32x2_t v9 = vcge_s32(vzip2_s32(v8, v7), vzip1_s32(v8, v7));
    if (v9.i8[4] & 1) != 0 && (v9.i8[0])
    {
      int32x2_t v10 = vmul_s32(vrev64_s32(vsub_s32(a1, a4)), vsub_s32(a5, a4));
      unsigned __int8 v5 = vcge_s32(vdup_lane_s32(v10, 1), v10).u8[0];
    }
  }
  return v5 & 1;
}

float32x4_t sub_2E354(uint64_t a1, float32x4_t *a2, float32x4_t a3, double a4, float32x4_t a5)
{
  *(float32x2_t *)a3.f32 = vcvt_f32_s32(*(int32x2_t *)a1);
  a3.f32[2] = (float)*(int *)(a1 + 8);
  float32x4_t v5 = (float32x4_t)vdupq_n_s32(0x3B808081u);
  float32x4_t v6 = vmulq_f32(a3, v5);
  *(float32x2_t *)a5.f32 = vcvt_f32_s32(*(int32x2_t *)(a1 + 12));
  a5.f32[2] = (float)*(int *)(a1 + 20);
  float32x4_t v7 = vmulq_f32(a5, v5);
  v8.i64[0] = 0x4200000042000000;
  v8.i64[1] = 0x4200000042000000;
  __asm { FMOV            V4.4S, #24.0 }
  float32x4_t v14 = vdivq_f32(vmulq_f32(vsubq_f32(v7, v6), v8), _Q4);
  *(float32x2_t *)_Q4.f32 = vmaxnm_f32(*(float32x2_t *)v14.f32, (float32x2_t)vdup_n_s32(0x3E008081u));
  _Q4.i32[2] = fmaxf(v14.f32[2], 0.12549);
  float32x4_t v15 = vaddq_f32(v6, v7);
  v7.i64[0] = 0x3F0000003F000000;
  v7.i64[1] = 0x3F0000003F000000;
  float32x4_t v16 = vmulq_f32(v15, v7);
  v7.i64[0] = 0xBF000000BF000000;
  v7.i64[1] = 0xBF000000BF000000;
  float32x4_t result = vmlaq_f32(v16, v7, _Q4);
  *a2 = result;
  a2[1] = vdivq_f32(v8, _Q4);
  return result;
}

uint64_t sub_2E3E8(uint64_t result, uint64_t a2, uint64_t a3, int8x16_t a4, int32x4_t a5, float32x4_t a6, float32x4_t a7, int32x2_t a8, int32x2_t a9, int32x2_t a10, int32x2_t a11)
{
  if (!a3) {
    sub_4C6A4();
  }
  if (!result) {
    sub_4C6D0();
  }
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32((int32x4_t)vextq_s8(a4, (int8x16_t)vrev64q_s32(a5), 8uLL), (int32x4_t)vextq_s8((int8x16_t)a5, (int8x16_t)vrev64q_s32((int32x4_t)a4), 8uLL)))))sub_4C728(); {
  uint32x2_t v11 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32((int32x2_t)*(_OWORD *)&vextq_s8(a4, a4, 8uLL), *(int32x2_t *)a4.i8));
  }
  if ((vpmin_u32(v11, v11).u32[0] & 0x80000000) == 0
    || (uint32x2_t v12 = (uint32x2_t)vcgt_s32(vsub_s32(*(int32x2_t *)a4.i8, *(int32x2_t *)a5.i8), (int32x2_t)-1),
        (vpmin_u32(v12, v12).u32[0] & 0x80000000) == 0))
  {
    sub_4C6FC();
  }
  if (a4.i32[1] <= a4.i32[3])
  {
    signed __int32 v19 = a4.i32[0];
    signed __int32 v20 = a4.i32[2];
    unsigned __int32 v21 = a4.i32[2] + 1;
    unsigned __int32 v22 = a4.u32[1];
    unsigned __int32 v23 = a4.i32[3] + 1;
    uint64_t v24 = a2 * (a4.i32[1] - (uint64_t)a5.i32[1]) + 4 * a4.i32[0] - 4 * a5.i32[0] + result + 2;
    do
    {
      if (v19 <= v20)
      {
        unsigned int v25 = (unsigned char *)v24;
        signed __int32 v26 = v19;
        do
        {
          float32x4_t result = sub_2E2D0(a8, a9, a10, a11, (int32x2_t)__PAIR64__(v22, v26));
          if (result)
          {
            LOBYTE(v27) = *v25;
            float v31 = (float)v27 * 0.0039216;
            LOBYTE(v28) = *(v25 - 1);
            float v32 = (float)v28 * 0.0039216;
            LOBYTE(v29) = *(v25 - 2);
            float v33 = (float)v29 * 0.0039216;
            *(float32x2_t *)v30.f32 = vadd_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32((float32x2_t)0xBEA99AE93F1645A2, v32), (float32x2_t)0xBE2CCA2E3E991687, v31), (float32x2_t)0x3F0000003DE978D5, v33), (float32x2_t)0x3F00000000000000);
            v30.f32[2] = (float)((float)((float)(v32 * -0.41869) + (float)(v31 * 0.5)) + (float)(v33 * -0.08131)) + 0.5;
            float32x4_t v34 = vmulq_f32(a7, vsubq_f32(v30, a6));
            *(float32x2_t *)v35.f32 = vrndm_f32(*(float32x2_t *)v34.f32);
            v35.i64[1] = __PAIR64__(a7.u32[3], COERCE_UNSIGNED_INT(floorf(v34.f32[2])));
            int32x4_t v36 = vcvtq_s32_f32(v35);
            v35.i64[0] = -1;
            v35.i64[1] = -1;
            uint32x4_t v37 = (uint32x4_t)vcgtq_s32(v36, (int32x4_t)v35);
            v37.i32[3] = v37.i32[2];
            if ((vminvq_u32(v37) & 0x80000000) != 0)
            {
              v38.i64[0] = 0x2000000020;
              v38.i64[1] = 0x2000000020;
              uint32x4_t v39 = (uint32x4_t)vcgtq_s32(v38, v36);
              v39.i32[3] = v39.i32[2];
              if ((vminvq_u32(v39) & 0x80000000) != 0)
              {
                uint32x2_t v40 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v36, (int8x16_t)v36, 4uLL), (uint32x2_t)0xA00000005);
                *(unsigned char *)(a3 + v40.i32[0] + v36.i32[0] + v40.i32[1]) = 1;
              }
            }
          }
          ++v26;
          v25 += 4;
        }
        while (v21 != v26);
      }
      ++v22;
      v24 += a2;
    }
    while (v23 != v22);
  }
  return result;
}

uint64_t sub_2E690(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6, double a7, double a8, __n128 a9)
{
  uint64_t v9 = 0;
  v10.i64[0] = -1;
  v10.i64[1] = -1;
  unsigned int v11 = vminvq_u32(v10);
  v12.i64[0] = 0x2000000020;
  v12.i64[1] = 0x2000000020;
  do
  {
    uint64_t v13 = 0;
    a9.n128_u32[0] = v9;
    float32x4_t v14 = a2;
    do
    {
      uint64_t v15 = 0;
      __n128 v16 = a9;
      v16.n128_u32[1] = v13;
      signed __int32 v17 = v14;
      do
      {
        char v18 = 0;
        int32x4_t v19 = (int32x4_t)v16;
        v19.i32[2] = v15;
        int32x4_t v20 = v19;
        v20.i32[3] = 0;
        int32x4_t v21 = vmaxq_s32(v20, (int32x4_t)0);
        v21.i32[3] = 0;
        int32x4_t v22 = vminq_s32(v21, (int32x4_t)xmmword_56250);
        uint32x4_t v23 = (uint32x4_t)vceqq_s32(v22, v19);
        v23.i32[3] = v23.i32[2];
        if ((vminvq_u32(v23) & 0x80000000) != 0)
        {
          uint32x2_t v24 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v22, (int8x16_t)v22, 4uLL), (uint32x2_t)0xA00000005);
          char v18 = *(unsigned char *)(result + v24.i32[0] + v22.i32[0] + v24.i32[1]);
        }
        char v25 = 0;
        int32x4_t v26 = vaddq_s32(v19, (int32x4_t)xmmword_56260);
        int32x4_t v27 = v26;
        v27.i32[3] = 0;
        int32x4_t v28 = vmaxq_s32(v27, (int32x4_t)0);
        v28.i32[3] = 0;
        int32x4_t v29 = vminq_s32(v28, (int32x4_t)xmmword_56250);
        uint32x4_t v30 = (uint32x4_t)vceqq_s32(v29, v26);
        v30.i32[3] = v30.i32[2];
        if ((vminvq_u32(v30) & 0x80000000) != 0)
        {
          uint32x2_t v31 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v29, (int8x16_t)v29, 4uLL), (uint32x2_t)0xA00000005);
          char v25 = *(unsigned char *)(result + v31.i32[0] + v29.i32[0] + v31.i32[1]);
        }
        char v32 = 0;
        int32x4_t v33 = vaddq_s32(v19, (int32x4_t)xmmword_55E10);
        int32x4_t v34 = v33;
        v34.i32[3] = 0;
        int32x4_t v35 = vmaxq_s32(v34, (int32x4_t)0);
        v35.i32[3] = 0;
        int32x4_t v36 = vminq_s32(v35, (int32x4_t)xmmword_56250);
        uint32x4_t v37 = (uint32x4_t)vceqq_s32(v36, v33);
        v37.i32[3] = v37.i32[2];
        if ((vminvq_u32(v37) & 0x80000000) != 0)
        {
          uint32x2_t v38 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v36, (int8x16_t)v36, 4uLL), (uint32x2_t)0xA00000005);
          char v32 = *(unsigned char *)(result + v38.i32[0] + v36.i32[0] + v38.i32[1]);
          if ((v11 & 0x80000000) == 0) {
            goto LABEL_14;
          }
        }
        else if ((v11 & 0x80000000) == 0)
        {
          goto LABEL_14;
        }
        uint32x4_t v39 = vcgtq_u32(v12, (uint32x4_t)v19);
        v39.i32[3] = v39.i32[2];
        if ((vminvq_u32(v39) & 0x80000000) != 0) {
          *signed __int32 v17 = v25 | v18 | v32;
        }
LABEL_14:
        ++v15;
        v17 += 1024;
      }
      while (v15 != 32);
      ++v13;
      v14 += 32;
    }
    while (v13 != 32);
    ++v9;
    ++a2;
  }
  while (v9 != 32);
  return result;
}

uint64_t sub_2E838(uint64_t result, unsigned char *a2, float a3, float a4, float a5)
{
  unint64_t v7 = 0;
  LODWORD(v5) = vcvtas_u32_f32((float)(a5 - a3) * a4);
  v8.i64[0] = -1;
  v8.i64[1] = -1;
  unsigned int v9 = vminvq_u32(v8);
  v10.i64[0] = 0x2000000020;
  v10.i64[1] = 0x2000000020;
  v11.i64[0] = 0xFFFFFFFF00000000;
  v11.i64[1] = 0xFFFFFFFF00000000;
  do
  {
    uint64_t v12 = 0;
    v6.i32[0] = v7;
    uint64_t v13 = a2;
    do
    {
      uint64_t v14 = 0;
      int32x4_t v15 = v6;
      v15.i32[1] = v12;
      __n128 v16 = v13;
      do
      {
        char v17 = 0;
        int32x4_t v18 = v15;
        v18.i32[2] = v14;
        int32x4_t v19 = v18;
        v19.i32[3] = 0;
        int32x4_t v20 = vmaxq_s32(v19, (int32x4_t)0);
        v20.i32[3] = 0;
        int32x4_t v21 = vminq_s32(v20, (int32x4_t)xmmword_56250);
        uint32x4_t v22 = (uint32x4_t)vceqq_s32(v21, v18);
        v22.i32[3] = v22.i32[2];
        if ((vminvq_u32(v22) & 0x80000000) != 0)
        {
          uint32x2_t v23 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v21, (int8x16_t)v21, 4uLL), (uint32x2_t)0xA00000005);
          char v17 = *(unsigned char *)(result + v23.i32[0] + v21.i32[0] + v23.i32[1]);
        }
        if (v7 >= v5)
        {
          char v24 = 0;
          int32x4_t v25 = vaddq_s32(v18, v11);
          int32x4_t v26 = v25;
          v26.i32[3] = 0;
          int32x4_t v27 = vmaxq_s32(v26, (int32x4_t)0);
          v27.i32[3] = 0;
          int32x4_t v28 = vminq_s32(v27, (int32x4_t)xmmword_56250);
          uint32x4_t v29 = (uint32x4_t)vceqq_s32(v28, v25);
          v29.i32[3] = v29.i32[2];
          if ((vminvq_u32(v29) & 0x80000000) != 0)
          {
            uint32x2_t v30 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 4uLL), (uint32x2_t)0xA00000005);
            char v24 = *(unsigned char *)(result + v30.i32[0] + v28.i32[0] + v30.i32[1]);
          }
          char v31 = 0;
          int32x4_t v32 = vaddq_s32(v18, (int32x4_t)xmmword_56270);
          int32x4_t v33 = v32;
          v33.i32[3] = 0;
          int32x4_t v34 = vmaxq_s32(v33, (int32x4_t)0);
          v34.i32[3] = 0;
          int32x4_t v35 = vminq_s32(v34, (int32x4_t)xmmword_56250);
          uint32x4_t v36 = (uint32x4_t)vceqq_s32(v35, v32);
          v36.i32[3] = v36.i32[2];
          if ((vminvq_u32(v36) & 0x80000000) != 0)
          {
            uint32x2_t v37 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v35, (int8x16_t)v35, 4uLL), (uint32x2_t)0xA00000005);
            char v31 = *(unsigned char *)(result + v37.i32[0] + v35.i32[0] + v37.i32[1]);
          }
          char v38 = 0;
          int32x4_t v39 = vaddq_s32(v18, (int32x4_t)xmmword_56280);
          int32x4_t v40 = v39;
          v40.i32[3] = 0;
          int32x4_t v41 = vmaxq_s32(v40, (int32x4_t)0);
          v41.i32[3] = 0;
          int32x4_t v42 = vminq_s32(v41, (int32x4_t)xmmword_56250);
          uint32x4_t v43 = (uint32x4_t)vceqq_s32(v42, v39);
          v43.i32[3] = v43.i32[2];
          if ((vminvq_u32(v43) & 0x80000000) != 0)
          {
            uint32x2_t v44 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v42, (int8x16_t)v42, 4uLL), (uint32x2_t)0xA00000005);
            char v38 = *(unsigned char *)(result + v44.i32[0] + v42.i32[0] + v44.i32[1]);
          }
          char v45 = 0;
          int32x4_t v46 = vaddq_s32(v18, (int32x4_t)xmmword_56290);
          int32x4_t v47 = v46;
          v47.i32[3] = 0;
          int32x4_t v48 = vmaxq_s32(v47, (int32x4_t)0);
          v48.i32[3] = 0;
          int32x4_t v49 = vminq_s32(v48, (int32x4_t)xmmword_56250);
          uint32x4_t v50 = (uint32x4_t)vceqq_s32(v49, v46);
          v50.i32[3] = v50.i32[2];
          if ((vminvq_u32(v50) & 0x80000000) != 0)
          {
            uint32x2_t v51 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v49, (int8x16_t)v49, 4uLL), (uint32x2_t)0xA00000005);
            char v45 = *(unsigned char *)(result + v51.i32[0] + v49.i32[0] + v51.i32[1]);
          }
          v17 |= v24 | v31 | v38 | v45;
        }
        if ((v9 & 0x80000000) != 0)
        {
          uint32x4_t v52 = vcgtq_u32(v10, (uint32x4_t)v18);
          v52.i32[3] = v52.i32[2];
          if ((vminvq_u32(v52) & 0x80000000) != 0) {
            unsigned char *v16 = v17;
          }
        }
        ++v14;
        v16 += 1024;
      }
      while (v14 != 32);
      ++v12;
      v13 += 32;
    }
    while (v12 != 32);
    ++v7;
    ++a2;
  }
  while (v7 != 32);
  return result;
}

uint64_t sub_2EAA0(uint64_t result, uint64_t a2, float a3, float a4, float a5, double a6, __n128 a7)
{
  unint64_t v8 = 0;
  LODWORD(v7) = vcvtas_u32_f32((float)(a5 - a3) * a4);
  v9.i64[0] = -1;
  v9.i64[1] = -1;
  unsigned int v10 = vminvq_u32(v9);
  v11.i64[0] = 0x2000000020;
  v11.i64[1] = 0x2000000020;
  do
  {
    uint64_t v12 = 0;
    a7.n128_u32[0] = v8;
    do
    {
      uint64_t v13 = 0;
      __n128 v14 = a7;
      v14.n128_u32[1] = v12;
      do
      {
        int32x4_t v15 = (int32x4_t)v14;
        v15.i32[2] = v13;
        if (v8 >= v7)
        {
          char v16 = 0;
          for (int i = -1; i != 2; ++i)
          {
            v23.i32[0] = 0;
            v23.i64[1] = 0;
            v23.i32[1] = i;
            for (int j = -1; j != 2; ++j)
            {
              char v25 = 0;
              int32x4_t v26 = v23;
              v26.i32[2] = j;
              int32x4_t v27 = vaddq_s32(v26, v15);
              int32x4_t v28 = v27;
              v28.i32[3] = 0;
              int32x4_t v29 = vmaxq_s32(v28, (int32x4_t)0);
              v29.i32[3] = 0;
              int32x4_t v30 = vminq_s32(v29, (int32x4_t)xmmword_56250);
              uint32x4_t v31 = (uint32x4_t)vceqq_s32(v30, v27);
              v31.i32[3] = v31.i32[2];
              if ((vminvq_u32(v31) & 0x80000000) != 0)
              {
                uint32x2_t v32 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v30, (int8x16_t)v30, 4uLL), (uint32x2_t)0xA00000005);
                char v25 = *(unsigned char *)(result + v32.i32[0] + v30.i32[0] + v32.i32[1]);
              }
              v16 |= v25;
            }
          }
        }
        else
        {
          char v16 = 0;
          int32x4_t v17 = v15;
          v17.i32[3] = 0;
          int32x4_t v18 = vmaxq_s32(v17, (int32x4_t)0);
          v18.i32[3] = 0;
          int32x4_t v19 = vminq_s32(v18, (int32x4_t)xmmword_56250);
          uint32x4_t v20 = (uint32x4_t)vceqq_s32(v19, v15);
          v20.i32[3] = v20.i32[2];
          if ((vminvq_u32(v20) & 0x80000000) != 0)
          {
            uint32x2_t v21 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v19, (int8x16_t)v19, 4uLL), (uint32x2_t)0xA00000005);
            char v16 = *(unsigned char *)(result + v21.i32[0] + v19.i32[0] + v21.i32[1]);
          }
        }
        if ((v10 & 0x80000000) != 0)
        {
          uint32x4_t v33 = vcgtq_u32(v11, (uint32x4_t)v15);
          v33.i32[3] = v33.i32[2];
          if ((vminvq_u32(v33) & 0x80000000) != 0) {
            *(unsigned char *)(a2 + v8 + 32 * v12 + (v13 << 10)) = v16;
          }
        }
        ++v13;
      }
      while (v13 != 32);
      ++v12;
    }
    while (v12 != 32);
    ++v8;
  }
  while (v8 != 32);
  return result;
}

uint64_t sub_2EC1C(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  uint64_t v8 = 0;
  v9.i64[0] = -1;
  v9.i64[1] = -1;
  unsigned int v10 = vminvq_u32(v9);
  v11.i64[0] = 0x2000000020;
  v11.i64[1] = 0x2000000020;
  do
  {
    uint64_t v12 = 0;
    a8.n128_u32[0] = v8;
    uint64_t v13 = a2;
    do
    {
      uint64_t v14 = 0;
      __n128 v15 = a8;
      v15.n128_u32[1] = v12;
      char v16 = v13;
      do
      {
        if ((v10 & 0x80000000) != 0)
        {
          int32x4_t v17 = (int32x4_t)v15;
          v17.i32[2] = v14;
          uint32x4_t v18 = vcgtq_u32(v11, (uint32x4_t)v17);
          v18.i32[3] = v18.i32[2];
          if ((vminvq_u32(v18) & 0x80000000) != 0)
          {
            int32x4_t v19 = v17;
            v19.i32[3] = 0;
            int32x4_t v20 = vmaxq_s32(v19, (int32x4_t)0);
            v20.i32[3] = 0;
            int32x4_t v21 = vminq_s32(v20, (int32x4_t)xmmword_56250);
            char v22 = *(unsigned char *)(result + v21.i32[0] + 32 * v21.i32[1] + (v21.i32[2] << 10));
            int32x4_t v23 = vaddq_s32(v17, (int32x4_t)xmmword_56260);
            v23.i32[3] = 0;
            int32x4_t v24 = vmaxq_s32(v23, (int32x4_t)0);
            v24.i32[3] = 0;
            int32x4_t v25 = vminq_s32(v24, (int32x4_t)xmmword_56250);
            int32x4_t v26 = vaddq_s32(v17, (int32x4_t)xmmword_55E10);
            v26.i32[3] = 0;
            int32x4_t v27 = vmaxq_s32(v26, (int32x4_t)0);
            v27.i32[3] = 0;
            int32x4_t v28 = vminq_s32(v27, (int32x4_t)xmmword_56250);
            unsigned char *v16 = *(unsigned char *)(result + v25.i32[0] + 32 * v25.i32[1] + (v25.i32[2] << 10)) & v22 & *(unsigned char *)(result + v28.i32[0] + 32 * v28.i32[1] + (v28.i32[2] << 10));
          }
        }
        ++v14;
        v16 += 1024;
      }
      while (v14 != 32);
      ++v12;
      v13 += 32;
    }
    while (v12 != 32);
    ++v8;
    ++a2;
  }
  while (v8 != 32);
  return result;
}

uint64_t sub_2ED4C(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, __n128 a10)
{
  uint64_t v10 = 0;
  v11.i64[0] = -1;
  v11.i64[1] = -1;
  unsigned int v12 = vminvq_u32(v11);
  v13.i64[0] = 0xFFFFFFFF00000000;
  v13.i64[1] = 0xFFFFFFFF00000000;
  v14.i64[0] = 0x2000000020;
  v14.i64[1] = 0x2000000020;
  do
  {
    uint64_t v15 = 0;
    a10.n128_u32[0] = v10;
    char v16 = a2;
    do
    {
      uint64_t v17 = 0;
      __n128 v18 = a10;
      v18.n128_u32[1] = v15;
      int32x4_t v19 = v16;
      do
      {
        if ((v12 & 0x80000000) != 0)
        {
          int32x4_t v20 = (int32x4_t)v18;
          v20.i32[2] = v17;
          uint32x4_t v21 = vcgtq_u32(v14, (uint32x4_t)v20);
          v21.i32[3] = v21.i32[2];
          if ((vminvq_u32(v21) & 0x80000000) != 0)
          {
            int32x4_t v22 = v20;
            v22.i32[3] = 0;
            int32x4_t v23 = vmaxq_s32(v22, (int32x4_t)0);
            v23.i32[3] = 0;
            int32x4_t v24 = vminq_s32(v23, (int32x4_t)xmmword_56250);
            char v25 = *(unsigned char *)(result + v24.i32[0] + 32 * v24.i32[1] + (v24.i32[2] << 10));
            int32x4_t v26 = vaddq_s32(v20, v13);
            v26.i32[3] = 0;
            int32x4_t v27 = vmaxq_s32(v26, (int32x4_t)0);
            v27.i32[3] = 0;
            int32x4_t v28 = vminq_s32(v27, (int32x4_t)xmmword_56250);
            char v29 = *(unsigned char *)(result + v28.i32[0] + 32 * v28.i32[1] + (v28.i32[2] << 10));
            int32x4_t v30 = vaddq_s32(v20, (int32x4_t)xmmword_56270);
            v30.i32[3] = 0;
            int32x4_t v31 = vmaxq_s32(v30, (int32x4_t)0);
            v31.i32[3] = 0;
            int32x4_t v32 = vminq_s32(v31, (int32x4_t)xmmword_56250);
            char v33 = v29 & v25;
            char v34 = *(unsigned char *)(result + v32.i32[0] + 32 * v32.i32[1] + (v32.i32[2] << 10));
            int32x4_t v35 = vaddq_s32(v20, (int32x4_t)xmmword_56280);
            v35.i32[3] = 0;
            int32x4_t v36 = vmaxq_s32(v35, (int32x4_t)0);
            v36.i32[3] = 0;
            int32x4_t v37 = vminq_s32(v36, (int32x4_t)xmmword_56250);
            int32x4_t v38 = vaddq_s32(v20, (int32x4_t)xmmword_56290);
            v38.i32[3] = 0;
            int32x4_t v39 = vmaxq_s32(v38, (int32x4_t)0);
            v39.i32[3] = 0;
            int32x4_t v40 = vminq_s32(v39, (int32x4_t)xmmword_56250);
            *int32x4_t v19 = v33 & v34 & *(unsigned char *)(result + v37.i32[0] + 32 * v37.i32[1] + (v37.i32[2] << 10)) & *(unsigned char *)(result + v40.i32[0] + 32 * v40.i32[1] + (v40.i32[2] << 10));
          }
        }
        ++v17;
        v19 += 1024;
      }
      while (v17 != 32);
      ++v15;
      v16 += 32;
    }
    while (v15 != 32);
    ++v10;
    ++a2;
  }
  while (v10 != 32);
  return result;
}

uint64_t sub_2EEE8(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6, __n128 a7)
{
  uint64_t v7 = 0;
  v8.i64[0] = -1;
  v8.i64[1] = -1;
  unsigned int v9 = vminvq_u32(v8);
  v10.i64[0] = 0x2000000020;
  v10.i64[1] = 0x2000000020;
  do
  {
    uint64_t v11 = 0;
    a7.n128_u32[0] = v7;
    do
    {
      uint64_t v12 = 0;
      __n128 v13 = a7;
      v13.n128_u32[1] = v11;
      do
      {
        int32x4_t v14 = (int32x4_t)v13;
        v14.i32[2] = v12;
        char v15 = -1;
        for (int i = -1; i != 2; ++i)
        {
          v17.i32[0] = 0;
          v17.i64[1] = 0;
          v17.i32[1] = i;
          for (int j = -1; j != 2; ++j)
          {
            int32x4_t v19 = v17;
            v19.i32[2] = j;
            int32x4_t v20 = vaddq_s32(v19, v14);
            v20.i32[3] = 0;
            int32x4_t v21 = vmaxq_s32(v20, (int32x4_t)0);
            v21.i32[3] = 0;
            int8x16_t v22 = (int8x16_t)vminq_s32(v21, (int32x4_t)xmmword_56250);
            uint32x2_t v23 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 4uLL), (uint32x2_t)0xA00000005);
            v15 &= *(unsigned char *)(result + v23.i32[0] + v22.i32[0] + v23.i32[1]);
          }
        }
        if ((v9 & 0x80000000) != 0)
        {
          uint32x4_t v24 = vcgtq_u32(v10, (uint32x4_t)v14);
          v24.i32[3] = v24.i32[2];
          if ((vminvq_u32(v24) & 0x80000000) != 0) {
            *(unsigned char *)(a2 + v7 + 32 * v11 + (v12 << 10)) = v15;
          }
        }
        ++v12;
      }
      while (v12 != 32);
      ++v11;
    }
    while (v11 != 32);
    ++v7;
  }
  while (v7 != 32);
  return result;
}

uint64_t sub_2EFE4(uint64_t result)
{
  *(void *)(result + 8) = 0;
  return result;
}

_DWORD *sub_2EFEC(_DWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int8x16_t a6, int32x4_t a7, float32x4_t a8, float32x4_t a9)
{
  if (!result) {
    sub_4C754();
  }
  if (!a2) {
    sub_4C780();
  }
  if (!a3) {
    sub_4C7AC();
  }
  if (!a4) {
    sub_4C7D8();
  }
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32((int32x4_t)vextq_s8(a6, (int8x16_t)vrev64q_s32(a7), 8uLL), (int32x4_t)vextq_s8((int8x16_t)a7, (int8x16_t)vrev64q_s32((int32x4_t)a6), 8uLL)))))sub_4C830(); {
  uint32x2_t v13 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32((int32x2_t)*(_OWORD *)&vextq_s8(a6, a6, 8uLL), *(int32x2_t *)a6.i8));
  }
  if ((vpmin_u32(v13, v13).u32[0] & 0x80000000) == 0
    || (uint32x2_t v14 = (uint32x2_t)vcgt_s32(vsub_s32(*(int32x2_t *)a6.i8, *(int32x2_t *)a7.i8), (int32x2_t)-1),
        (vpmin_u32(v14, v14).u32[0] & 0x80000000) == 0))
  {
    sub_4C804();
  }
  if (a6.i32[3] >= a6.i32[1])
  {
    uint64_t v15 = a5 * (a6.i32[1] - (uint64_t)a7.i32[1]) + 4 * a6.i32[0] - 4 * a7.i32[0] + a4 + 2;
    v16.i64[0] = 0xBF000000BF000000;
    v16.i64[1] = 0xBF000000BF000000;
    v17.i64[0] = 0x100000001;
    v17.i64[1] = 0x100000001;
    uint64_t v18 = a6.i32[1];
    do
    {
      if (a6.i32[0] >= a6.i32[2])
      {
        __int16 v108 = -1;
      }
      else
      {
        BOOL v19 = 0;
        unsigned __int16 v20 = 0;
        __int16 v21 = 0;
        __int16 v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0xFFFFLL;
        char v25 = (__int8 *)v15;
        uint64_t v26 = a6.i32[0];
        do
        {
          _Q26.i8[0] = *v25;
          float v27 = (float)_Q26.u32[0] * 0.0039216;
          v10.i8[0] = *(v25 - 1);
          v10.f32[0] = (float)v10.u32[0] * 0.0039216;
          LOBYTE(v11) = *(v25 - 2);
          float v28 = (float)LODWORD(v11) * 0.0039216;
          *(float32x2_t *)v12.f32 = vadd_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32((float32x2_t)0xBEA99AE93F1645A2, v10.f32[0]), (float32x2_t)0xBE2CCA2E3E991687, v27), (float32x2_t)0x3F0000003DE978D5, v28), (float32x2_t)0x3F00000000000000);
          v12.f32[2] = (float)((float)((float)(v10.f32[0] * -0.41869) + (float)(v27 * 0.5)) + (float)(v28 * -0.08131))
                     + 0.5;
          float32x4_t v29 = vaddq_f32(vmulq_f32(a9, vsubq_f32(v12, a8)), v16);
          *(float32x2_t *)v10.f32 = vrndm_f32(*(float32x2_t *)v29.f32);
          v10.i32[2] = floorf(v29.f32[2]);
          int32x4_t v30 = vcvtq_s32_f32(v10);
          int32x4_t v31 = v30;
          v31.i32[3] = 0;
          int32x4_t v32 = vmaxq_s32(v31, (int32x4_t)0);
          v32.i32[3] = 0;
          int32x4_t v33 = vminq_s32(v32, (int32x4_t)xmmword_56250);
          uint32x4_t v34 = (uint32x4_t)vceqq_s32(v33, v30);
          v34.i32[3] = v34.i32[2];
          unsigned int v35 = vminvq_u32(v34);
          v12.i32[0] = 0;
          float v36 = 0.0;
          if ((v35 & 0x80000000) != 0)
          {
            uint32x2_t v37 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v33, (int8x16_t)v33, 4uLL), (uint32x2_t)0xA00000005);
            v37.i8[0] = *(unsigned char *)(a3 + v37.i32[0] + v33.i32[0] + v37.i32[1]);
            float v36 = (float)v37.u32[0];
          }
          int32x4_t v38 = vaddq_s32(v30, (int32x4_t)xmmword_56290);
          int32x4_t v39 = v38;
          v39.i32[3] = 0;
          int32x4_t v40 = vmaxq_s32(v39, (int32x4_t)0);
          v40.i32[3] = 0;
          int32x4_t v41 = vminq_s32(v40, (int32x4_t)xmmword_56250);
          uint32x4_t v42 = (uint32x4_t)vceqq_s32(v41, v38);
          v42.i32[3] = v42.i32[2];
          if ((vminvq_u32(v42) & 0x80000000) != 0)
          {
            float32x4_t v12 = (float32x4_t)vextq_s8((int8x16_t)v41, (int8x16_t)v41, 4uLL);
            *(uint32x2_t *)v12.f32 = vshl_u32(*(uint32x2_t *)v12.f32, (uint32x2_t)0xA00000005);
            v12.i8[0] = *(unsigned char *)(a3 + v12.i32[0] + v41.i32[0] + v12.i32[1]);
            v12.f32[0] = (float)v12.u32[0];
          }
          int32x4_t v43 = vaddq_s32(v30, (int32x4_t)xmmword_56270);
          int32x4_t v44 = v43;
          v44.i32[3] = 0;
          int32x4_t v45 = vmaxq_s32(v44, (int32x4_t)0);
          v45.i32[3] = 0;
          int32x4_t v46 = vminq_s32(v45, (int32x4_t)xmmword_56250);
          uint32x4_t v47 = (uint32x4_t)vceqq_s32(v46, v43);
          v47.i32[3] = v47.i32[2];
          unsigned int v48 = vminvq_u32(v47);
          float v49 = 0.0;
          float v50 = 0.0;
          if ((v48 & 0x80000000) != 0)
          {
            uint32x2_t v51 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v46, (int8x16_t)v46, 4uLL), (uint32x2_t)0xA00000005);
            v51.i8[0] = *(unsigned char *)(a3 + v51.i32[0] + v46.i32[0] + v51.i32[1]);
            float v50 = (float)v51.u32[0];
          }
          int32x4_t v52 = vaddq_s32(v30, (int32x4_t)xmmword_562A0);
          int32x4_t v53 = v52;
          v53.i32[3] = 0;
          int32x4_t v54 = vmaxq_s32(v53, (int32x4_t)0);
          v54.i32[3] = 0;
          int32x4_t v55 = vminq_s32(v54, (int32x4_t)xmmword_56250);
          uint32x4_t v56 = (uint32x4_t)vceqq_s32(v55, v52);
          v56.i32[3] = v56.i32[2];
          if ((vminvq_u32(v56) & 0x80000000) != 0)
          {
            uint32x2_t v57 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v55, (int8x16_t)v55, 4uLL), (uint32x2_t)0xA00000005);
            v57.i8[0] = *(unsigned char *)(a3 + v57.i32[0] + v55.i32[0] + v57.i32[1]);
            float v49 = (float)v57.u32[0];
          }
          int32x4_t v58 = vaddq_s32(v30, (int32x4_t)xmmword_55E10);
          int32x4_t v59 = v58;
          v59.i32[3] = 0;
          int32x4_t v60 = vmaxq_s32(v59, (int32x4_t)0);
          v60.i32[3] = 0;
          int32x4_t v61 = vminq_s32(v60, (int32x4_t)xmmword_56250);
          uint32x4_t v62 = (uint32x4_t)vceqq_s32(v61, v58);
          v62.i32[3] = v62.i32[2];
          unsigned int v63 = vminvq_u32(v62);
          float v64 = 0.0;
          float v65 = 0.0;
          if ((v63 & 0x80000000) != 0)
          {
            uint32x2_t v66 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v61, (int8x16_t)v61, 4uLL), (uint32x2_t)0xA00000005);
            v66.i8[0] = *(unsigned char *)(a3 + v66.i32[0] + v61.i32[0] + v66.i32[1]);
            float v65 = (float)v66.u32[0];
          }
          int32x4_t v67 = vaddq_s32(v30, (int32x4_t)xmmword_562B0);
          int32x4_t v68 = v67;
          v68.i32[3] = 0;
          int32x4_t v69 = vmaxq_s32(v68, (int32x4_t)0);
          v69.i32[3] = 0;
          int32x4_t v70 = vminq_s32(v69, (int32x4_t)xmmword_56250);
          uint32x4_t v71 = (uint32x4_t)vceqq_s32(v70, v67);
          v71.i32[3] = v71.i32[2];
          if ((vminvq_u32(v71) & 0x80000000) != 0)
          {
            uint32x2_t v72 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v70, (int8x16_t)v70, 4uLL), (uint32x2_t)0xA00000005);
            v72.i8[0] = *(unsigned char *)(a3 + v72.i32[0] + v70.i32[0] + v72.i32[1]);
            float v64 = (float)v72.u32[0];
          }
          int32x4_t v73 = vaddq_s32(v30, (int32x4_t)xmmword_562C0);
          int32x4_t v74 = v73;
          v74.i32[3] = 0;
          int32x4_t v75 = vmaxq_s32(v74, (int32x4_t)0);
          v75.i32[3] = 0;
          int32x4_t v76 = vminq_s32(v75, (int32x4_t)xmmword_56250);
          uint32x4_t v77 = (uint32x4_t)vceqq_s32(v76, v73);
          v77.i32[3] = v77.i32[2];
          unsigned int v78 = vminvq_u32(v77);
          float v79 = 0.0;
          float v80 = 0.0;
          if ((v78 & 0x80000000) != 0)
          {
            uint32x2_t v81 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v76, (int8x16_t)v76, 4uLL), (uint32x2_t)0xA00000005);
            v81.i8[0] = *(unsigned char *)(a3 + v81.i32[0] + v76.i32[0] + v81.i32[1]);
            float v80 = (float)v81.u32[0];
          }
          int32x4_t v82 = vaddq_s32(v30, v17);
          int32x4_t v83 = v82;
          v83.i32[3] = 0;
          int32x4_t v84 = vmaxq_s32(v83, (int32x4_t)0);
          v84.i32[3] = 0;
          int32x4_t v85 = vminq_s32(v84, (int32x4_t)xmmword_56250);
          uint32x4_t v86 = (uint32x4_t)vceqq_s32(v85, v82);
          v86.i32[3] = v86.i32[2];
          if ((vminvq_u32(v86) & 0x80000000) != 0)
          {
            uint32x2_t v87 = vshl_u32((uint32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v85, (int8x16_t)v85, 4uLL), (uint32x2_t)0xA00000005);
            v85.i8[0] = *(unsigned char *)(a3 + v87.i32[0] + v85.i32[0] + v87.i32[1]);
            float v79 = (float)v85.u32[0];
          }
          _Q26 = vsubq_f32(v29, v10);
          _S27 = v12.f32[0] - v36;
          __asm { FMLA            S28, S27, V26.S[2] }
          _S27 = v49 - v50;
          __asm { FMLA            S31, S27, V26.S[2] }
          _S27 = v64 - v65;
          __asm { FMLA            S9, S27, V26.S[2] }
          _S27 = v79 - v80;
          __asm { FMLA            S11, S27, V26.S[2] }
          _S27 = _S31 - _S28;
          __asm { FMLA            S28, S27, V26.S[1] }
          _S27 = _S11 - _S9;
          __asm { FMLA            S9, S27, V26.S[1] }
          v10.f32[0] = _S9 - _S28;
          float v11 = vmlas_n_f32(_S28, _S9 - _S28, _Q26.f32[0]);
          if (v11 <= 0.0)
          {
            if (v19)
            {
              unsigned __int16 v104 = v26 - 1;
              unsigned __int16 v20 = v26 - 1;
            }
            else
            {
              unsigned __int16 v104 = v20;
            }
          }
          else if (v19)
          {
            unsigned __int16 v104 = a6.u16[4];
          }
          else
          {
            int v105 = result[2];
            result[2] = v105 + 1;
            uint64_t v106 = (unsigned __int16)v105;
            if (v24 != 0xFFFF)
            {
              v107 = (char *)result + 14 * v23;
              *((_WORD *)v107 + 8) = v105;
              *((_WORD *)v107 + 9) = v23;
              *((_WORD *)v107 + 10) = v22;
              *((_WORD *)v107 + 11) = v21;
              *((_WORD *)v107 + 12) = v20;
              *(_DWORD *)(v107 + 26) = 0;
              uint64_t v106 = v24;
            }
            __int16 v22 = -1;
            unsigned __int16 v104 = a6.u16[4];
            unsigned int v23 = (unsigned __int16)v105;
            __int16 v21 = v26;
            uint64_t v24 = v106;
          }
          v25 += 4;
          ++v26;
          BOOL v19 = v11 > 0.0;
        }
        while (a6.i32[2] != v26);
        __int16 v108 = -1;
        if (v24 != 0xFFFF)
        {
          CGFloat v109 = (char *)result + 14 * v23;
          *((_WORD *)v109 + 8) = -1;
          *((_WORD *)v109 + 9) = v23;
          *((_WORD *)v109 + 10) = v22;
          *((_WORD *)v109 + 11) = v21;
          *((_WORD *)v109 + 12) = v104;
          *(_DWORD *)(v109 + 26) = 0;
          __int16 v108 = v24;
        }
      }
      *(_WORD *)(a2 + 2 * (v18 - a6.i32[1])) = v108;
      *float32x4_t result = a6.i32[3] - a6.i32[1] + 1;
      ++v18;
      v15 += a5;
    }
    while (a6.i32[3] + 1 != v18);
  }
  return result;
}

_DWORD *sub_2F5EC(_DWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, int8x16_t a5, int32x4_t a6)
{
  if (!result) {
    sub_4C85C();
  }
  if (!a2) {
    sub_4C888();
  }
  if (!a3) {
    sub_4C8B4();
  }
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32((int32x4_t)vextq_s8(a5, (int8x16_t)vrev64q_s32(a6), 8uLL), (int32x4_t)vextq_s8((int8x16_t)a6, (int8x16_t)vrev64q_s32((int32x4_t)a5), 8uLL)))))sub_4C90C(); {
  uint32x2_t v9 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32((int32x2_t)*(_OWORD *)&vextq_s8(a5, a5, 8uLL), *(int32x2_t *)a5.i8));
  }
  if ((vpmin_u32(v9, v9).u32[0] & 0x80000000) == 0
    || (uint32x2_t v10 = (uint32x2_t)vcgt_s32(vsub_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8), (int32x2_t)-1),
        (vpmin_u32(v10, v10).u32[0] & 0x80000000) == 0))
  {
    sub_4C8E0();
  }
  if (a5.i32[3] >= a5.i32[1])
  {
    uint64_t v11 = a4 * (a5.i32[1] - (uint64_t)a6.i32[1]) + 4 * a5.i32[0] - 4 * a6.i32[0] + a3 + 2;
    uint64_t v12 = a5.i32[1];
    do
    {
      if (a5.i32[0] >= a5.i32[2])
      {
        __int16 v30 = -1;
      }
      else
      {
        BOOL v13 = 0;
        unsigned __int16 v14 = 0;
        __int16 v15 = 0;
        __int16 v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0xFFFFLL;
        BOOL v19 = (unsigned char *)v11;
        uint64_t v20 = a5.i32[0];
        do
        {
          LOBYTE(v6) = *v19;
          float v21 = (float)LODWORD(v6) * 0.0039216;
          LOBYTE(v7) = *(v19 - 1);
          float v22 = (float)LODWORD(v7) * 0.0039216;
          LOBYTE(v8) = *(v19 - 2);
          float v8 = (float)LODWORD(v8) * 0.0039216;
          float v23 = (float)((float)((float)(v22 * 0.587) + (float)(v21 * 0.299)) + (float)(v8 * 0.114)) + 0.0;
          float v24 = (float)((float)((float)(v22 * -0.274) + (float)(v21 * 0.596)) + (float)(v8 * -0.321)) + 0.0;
          float v25 = (float)((float)((float)(v22 * -0.522) + (float)(v21 * 0.211)) + (float)(v8 * 0.311)) + 0.0;
          float v7 = (float)(v24 * 0.1403) + (float)(v23 * 0.2227);
          float v6 = (float)(v7 + (float)(v25 * -3.0)) + 0.0;
          if (v6 <= -0.008)
          {
            if (v13)
            {
              unsigned __int16 v26 = v20 - 1;
              unsigned __int16 v14 = v20 - 1;
            }
            else
            {
              unsigned __int16 v26 = v14;
            }
          }
          else if (v13)
          {
            unsigned __int16 v26 = a5.u16[4];
          }
          else
          {
            int v27 = result[2];
            result[2] = v27 + 1;
            uint64_t v28 = (unsigned __int16)v27;
            if (v18 != 0xFFFF)
            {
              float32x4_t v29 = (char *)result + 14 * v17;
              *((_WORD *)v29 + 8) = v27;
              *((_WORD *)v29 + 9) = v17;
              *((_WORD *)v29 + 10) = v16;
              *((_WORD *)v29 + 11) = v15;
              *((_WORD *)v29 + 12) = v14;
              *(_DWORD *)(v29 + 26) = 0;
              uint64_t v28 = v18;
            }
            __int16 v16 = -1;
            unsigned __int16 v26 = a5.u16[4];
            unsigned int v17 = (unsigned __int16)v27;
            __int16 v15 = v20;
            uint64_t v18 = v28;
          }
          v19 += 4;
          ++v20;
          BOOL v13 = v6 > -0.008;
        }
        while (a5.i32[2] != v20);
        __int16 v30 = -1;
        if (v18 != 0xFFFF)
        {
          int32x4_t v31 = (char *)result + 14 * v17;
          *((_WORD *)v31 + 8) = -1;
          *((_WORD *)v31 + 9) = v17;
          *((_WORD *)v31 + 10) = v16;
          *((_WORD *)v31 + 11) = v15;
          *((_WORD *)v31 + 12) = v26;
          *(_DWORD *)(v31 + 26) = 0;
          __int16 v30 = v18;
        }
      }
      *(_WORD *)(a2 + 2 * (v12 - a5.i32[1])) = v30;
      *float32x4_t result = a5.i32[3] - a5.i32[1] + 1;
      ++v12;
      v11 += a4;
    }
    while (a5.i32[3] + 1 != v12);
  }
  return result;
}

unsigned int *sub_2F8D0(unsigned int *result, uint64_t a2)
{
  uint64_t v2 = *result;
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (i)
      {
        int32x2_t v4 = (unsigned __int16 *)(a2 + 2 * i);
        unsigned int v5 = *(v4 - 1);
        unsigned int v6 = *v4;
        while (v5 != 0xFFFF && v6 != 0xFFFF)
        {
          float v8 = (unsigned __int16 *)result + 7 * v6 + 8;
          uint32x2_t v9 = (unsigned __int16 *)result + 7 * v5 + 8;
          if ((__int16)v8[3] <= (__int16)v9[3]) {
            int v10 = (__int16)v9[3];
          }
          else {
            int v10 = (__int16)v8[3];
          }
          int v11 = (__int16)v8[4];
          int v12 = (__int16)v9[4];
          if (v11 >= v12) {
            int v13 = (__int16)v9[4];
          }
          else {
            int v13 = (__int16)v8[4];
          }
          if (v10 <= v13)
          {
            unsigned __int16 v14 = (char *)result + 14 * v6;
            int v16 = *((unsigned __int16 *)v14 + 9);
            __int16 v15 = v14 + 18;
            if (v16 == v6)
            {
              *__int16 v15 = v5;
            }
            else
            {
              uint64_t v17 = (int)result[3];
              result[3] = v17 + 1;
              uint64_t v18 = &result[v17 + 229373];
              *(_WORD *)uint64_t v18 = v5;
              *((_WORD *)v18 + 1) = v6;
            }
          }
          if (v12 >= v11) {
            unsigned int v6 = *v8;
          }
          else {
            unsigned int v5 = *v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2F9A8(uint64_t result, int a2, unsigned int *a3, uint64_t a4)
{
  unsigned int v4 = *a3;
  if (*a3 > result)
  {
    int v5 = 0;
    int v6 = 0;
    unsigned int v7 = result;
    do
    {
      for (unsigned int i = *(unsigned __int16 *)(a4 + 2 * v7); i != 0xFFFF; unsigned int i = *v9)
      {
        uint32x2_t v9 = (unsigned __int16 *)a3 + 7 * i + 8;
        v9[1] = *((_WORD *)a3 + 7 * v9[1] + 9);
      }
      unsigned int v10 = v6 + 1;
      if ((v6 + 1) < HIDWORD(result)) {
        ++v6;
      }
      else {
        int v6 = 0;
      }
      if (v10 >= HIDWORD(result)) {
        ++v5;
      }
      unsigned int v7 = v6 + result + v5 * a2;
    }
    while (v7 < v4);
  }
  return result;
}

uint64_t sub_2FA1C(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 12);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = (_WORD *)(result + 917494);
    do
    {
      unsigned int v3 = (unsigned __int16)*v2;
      *(v2 - 1) = *(_WORD *)(result + 16 + 14 * (unsigned __int16)*(v2 - 1) + 2);
      _WORD *v2 = *(_WORD *)(result + 16 + 14 * v3 + 2);
      v2 += 2;
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_2FA64(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 12);
  if ((int)v1 >= 1)
  {
    for (uint64_t i = 0; i != v1; ++i)
    {
      unsigned __int16 v3 = *(_WORD *)(result + 4 * i + 917492);
      unsigned int v4 = *(unsigned __int16 *)(result + 4 * i + 917494);
      uint64_t v5 = result + 16;
      int v6 = *(unsigned __int16 *)(result + 16 + 14 * v3 + 2);
      if (v6 != *(unsigned __int16 *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917494) + 2))
      {
        unsigned int v7 = *(unsigned __int16 *)(v5 + 14 * *(unsigned __int16 *)(result + 4 * i + 917492) + 4);
        unsigned int v8 = *(unsigned __int16 *)(v5 + 14 * *(unsigned __int16 *)(result + 4 * i + 917494) + 4);
        if (v7 == 0xFFFF)
        {
          if (v8 == 0xFFFF) {
            unsigned int v9 = *(unsigned __int16 *)(result + 4 * i + 917494);
          }
          else {
            unsigned int v9 = v8;
          }
          __int16 v10 = 1;
          int v11 = *(unsigned __int16 *)(result + 4 * i + 917494);
          LOWORD(v12) = 1;
          unsigned int v13 = *(unsigned __int16 *)(result + 4 * i + 917492);
        }
        else
        {
          unsigned int v14 = *(unsigned __int16 *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917492) + 10);
          unsigned int v12 = *(unsigned __int16 *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917494) + 10);
          if (v8 == 0xFFFF) {
            unsigned int v15 = *(unsigned __int16 *)(result + 4 * i + 917494);
          }
          else {
            unsigned int v15 = v8;
          }
          if (v12 > v14) {
            int v11 = *(unsigned __int16 *)(result + 4 * i + 917492);
          }
          else {
            int v11 = *(unsigned __int16 *)(result + 4 * i + 917494);
          }
          if (v12 > v14) {
            unsigned int v13 = *(unsigned __int16 *)(result + 4 * i + 917494);
          }
          else {
            unsigned int v13 = *(unsigned __int16 *)(result + 4 * i + 917492);
          }
          if (v12 <= v14)
          {
            unsigned __int16 v3 = v7;
          }
          else
          {
            unsigned int v4 = *(unsigned __int16 *)(result + 4 * i + 917492);
            LOWORD(v6) = *(_WORD *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917494) + 2);
            unsigned __int16 v3 = v15;
          }
          if (v12 > v14) {
            unsigned int v9 = v7;
          }
          else {
            unsigned int v9 = v15;
          }
          if (v12 > v14) {
            __int16 v10 = *(_WORD *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917494) + 10);
          }
          else {
            __int16 v10 = *(_WORD *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917492) + 10);
          }
          if (v12 > v14) {
            LOWORD(v12) = *(_WORD *)(result + 16 + 14 * *(unsigned __int16 *)(result + 4 * i + 917492) + 10);
          }
        }
        *(_WORD *)(result + 14 * v4 + 18) = v6;
        for (unsigned int j = v9; j != v11; unsigned int j = *(unsigned __int16 *)(v17 + 20))
        {
          uint64_t v17 = result + 14 * j;
          *(_WORD *)(v17 + 18) = v6;
        }
        uint64_t v18 = result + 16 + 14 * v4;
        *(_WORD *)(v18 + 4) = v3;
        *(_WORD *)(v18 + 10) = 0;
        uint64_t v19 = result + 16 + 14 * v13;
        *(_WORD *)(v19 + 4) = v9;
        *(_WORD *)(v19 + 10) = v12 + v10;
      }
    }
  }
  return result;
}

uint64_t sub_2FB7C(uint64_t result, char a2, unsigned __int32 *a3, uint64_t a4, __n128 a5)
{
  if (a5.n128_i32[0] <= (int)result)
  {
    BOOL v5 = a5.n128_i32[2] < (int)result || SHIDWORD(result) < (signed __int32)a5.n128_u32[1];
    if (!v5 && (signed __int32)a5.n128_u32[3] >= SHIDWORD(result))
    {
      unsigned __int32 v7 = HIDWORD(result) - a5.n128_u32[1];
      if ((signed __int32)(HIDWORD(result) - a5.n128_u32[1]) >= 0 && v7 < *a3)
      {
        unsigned int v8 = *(unsigned __int16 *)(a4 + 2 * v7);
        if (v8 != 0xFFFF)
        {
          while (1)
          {
            unsigned int v9 = (char *)a3 + 14 * v8;
            if (*((__int16 *)v9 + 11) <= (int)result && *((__int16 *)a3 + 7 * v8 + 12) >= (int)result) {
              break;
            }
            unsigned int v8 = *((unsigned __int16 *)v9 + 8);
            if (v8 == 0xFFFF) {
              return result;
            }
          }
          *((unsigned char *)a3 + 14 * *((unsigned __int16 *)a3 + 7 * v8 + 9) + 28) = a2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2FC28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int32x4_t a5, int32x4_t a6)
{
  if (!result) {
    sub_4C938();
  }
  if (!a2) {
    sub_4C964();
  }
  if (!a3) {
    sub_4C990();
  }
  int32x2_t v6 = (int32x2_t)vmaxq_s32(a5, a6).u64[0];
  int8x16_t v7 = (int8x16_t)vminq_s32(a5, a6);
  int32x2_t v8 = (int32x2_t)vextq_s8(v7, v7, 8uLL).u64[0];
  uint32x2_t v9 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32(v8, v6));
  if ((vpmin_u32(v9, v9).u32[0] & 0x80000000) == 0) {
    sub_4C9BC();
  }
  if (v6.i32[1] <= v7.i32[3])
  {
    uint64_t v10 = a5.i32[1];
    if (a6.i32[1] <= (uint64_t)a5.i32[1]) {
      uint64_t v11 = a5.i32[1];
    }
    else {
      uint64_t v11 = a6.i32[1];
    }
    int v12 = v7.i32[3] + v11 - v6.i32[1] + 1;
    do
    {
      unsigned int v13 = *(unsigned __int16 *)(a2 + 2 * (v11 - v10));
      if (v13 != 0xFFFF)
      {
        char v14 = 0;
        v15.i32[0] = 0;
        v15.i32[1] = v11;
        char v16 = 1;
        do
        {
          if (v16)
          {
            uint64_t v17 = result + 16 + 14 * v13;
            v15.i32[0] = *(__int16 *)(v17 + 6);
            char v14 = *(unsigned char *)(result + 16 + 14 * *(unsigned __int16 *)(v17 + 2) + 12);
            if (!v14) {
              goto LABEL_18;
            }
          }
          __int32 v18 = v15.i32[0];
          if ((vorr_s8((int8x8_t)vcgt_s32(v6, v15), (int8x8_t)vcgt_s32(v15, v8)).u8[0] & 1) == 0) {
            *(unsigned char *)(a3 + (v11 - a6.i32[1]) * a4 + v15.i32[0] - a6.i32[0]) = v14;
          }
          ++v15.i32[0];
          if (v18 >= *(__int16 *)(result + 14 * v13 + 24))
          {
LABEL_18:
            unsigned int v13 = *(unsigned __int16 *)(result + 14 * v13 + 16);
            char v16 = 1;
          }
          else
          {
            char v16 = 0;
          }
        }
        while (v13 != 0xFFFF);
      }
      ++v11;
    }
    while (v12 != v11);
  }
  return result;
}

uint64_t sub_2FD6C(uint64_t result, uint64_t a2, uint64_t a3, int32x4_t a4, int32x4_t a5)
{
  if (!result) {
    sub_4C9E8();
  }
  if (!a2) {
    sub_4CA14();
  }
  signed __int32 v5 = a4.i32[0];
  signed __int32 v6 = a5.i32[0];
  if (a4.i32[0] >= a5.i32[0])
  {
    signed __int32 v7 = a5.i32[1];
    if (a4.i32[1] >= a5.i32[1])
    {
      int16x4_t v8 = vmovn_s32(vcgtq_s32(a4, a5));
      if ((v8.i8[4] & 1) == 0 && (v8.i8[6] & 1) == 0)
      {
        uint32x2_t v9 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a4, (int8x16_t)a4, 8uLL), *(int32x2_t *)a4.i8));
        if ((vpmin_u32(v9, v9).u32[0] & 0x80000000) == 0
          || (unsigned int v10 = -1,
              uint32x2_t v11 = (uint32x2_t)vcgt_s32(vsub_s32(*(int32x2_t *)a4.i8, *(int32x2_t *)a5.i8), (int32x2_t)-1),
              (vpmin_u32(v11, v11).u32[0] & 0x80000000) == 0))
        {
          sub_4CA40();
        }
        if (a4.i32[1] <= a4.i32[3])
        {
          int v12 = (unsigned int *)result;
          LOBYTE(v10) = *(unsigned char *)(result + 8);
          float v65 = (float)v10;
          uint64_t v13 = v6;
          unsigned __int32 v14 = a4.i32[2] + 1;
          uint64_t v15 = a4.i32[1];
          uint64_t v60 = v7;
          unsigned __int32 v61 = a4.i32[3] + 1;
          signed __int32 v62 = a4.i32[2];
          char v16 = (int32x2_t *)(result + 40);
          float v17 = 1.0 / (float)*(unsigned int *)(result + 4);
          do
          {
            if (v5 <= v62)
            {
              uint64_t v18 = v5;
              uint64_t v19 = a2 + (v15 - v60) * a3;
              do
              {
                uint64_t v20 = *v12;
                if (v20)
                {
                  float32x2_t v21 = vcvt_f32_s32((int32x2_t)__PAIR64__(v15, v18));
                  float v22 = 3.4028e38;
                  float v23 = v16;
                  do
                  {
                    int32x2_t v24 = v23[-3];
                    int32x2_t v25 = v23[-2];
                    int32x2_t v26 = v23[-1];
                    int32x2_t v27 = *v23;
                    float32x4_t result = sub_2E2D0(v24, v25, v26, *v23, (int32x2_t)__PAIR64__(v15, v18));
                    float32x2_t v28 = vcvt_f32_s32(v24);
                    float32x2_t v29 = vcvt_f32_s32(v25);
                    float32x2_t v30 = vcvt_f32_s32(v26);
                    float32x2_t v31 = vcvt_f32_s32(v27);
                    float32x2_t v32 = vsub_f32(v29, v28);
                    float32x2_t v33 = vsub_f32(v30, v29);
                    float32x2_t v34 = vsub_f32(v31, v30);
                    float32x2_t v35 = vsub_f32(v28, v31);
                    *(float *)v36.i32 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v32, v32).i32[1]), v32.f32[0], v32.f32[0]));
                    int32x2_t v37 = (int32x2_t)vmul_f32(v34, v34);
                    *(float *)v38.i32 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v33, v33).i32[1]), v33.f32[0], v33.f32[0]));
                    *(float *)v37.i32 = sqrtf(vmlas_n_f32(*(float *)&v37.i32[1], v34.f32[0], v34.f32[0]));
                    int32x2_t v39 = (int32x2_t)vmul_f32(v35, v35);
                    *(float *)v39.i32 = sqrtf(vmlas_n_f32(*(float *)&v39.i32[1], v35.f32[0], v35.f32[0]));
                    float32x2_t v40 = vdiv_f32(v32, (float32x2_t)vdup_lane_s32(v36, 0));
                    float32x2_t v41 = vdiv_f32(v33, (float32x2_t)vdup_lane_s32(v38, 0));
                    float32x2_t v42 = vdiv_f32(v34, (float32x2_t)vdup_lane_s32(v37, 0));
                    float32x2_t v43 = vsub_f32(v21, v28);
                    float32x2_t v44 = vdiv_f32(v35, (float32x2_t)vdup_lane_s32(v39, 0));
                    float32x2_t v45 = vsub_f32(vmla_n_f32(v28, v40, fminf(fmaxf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v43, v40).i32[1]), v40.f32[0], v43.f32[0]), 0.0), *(float *)v36.i32)), v21);
                    float32x2_t v46 = vsub_f32(v21, v29);
                    float32x2_t v47 = vsub_f32(vmla_n_f32(v29, v41, fminf(fmaxf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v46, v41).i32[1]), v41.f32[0], v46.f32[0]), 0.0), *(float *)v38.i32)), v21);
                    v35.f32[0] = vmlas_n_f32(COERCE_FLOAT(vmul_f32(v45, v45).i32[1]), v45.f32[0], v45.f32[0]);
                    float32x2_t v48 = vsub_f32(v21, v30);
                    v45.f32[0] = vmlas_n_f32(COERCE_FLOAT(vmul_f32(v47, v47).i32[1]), v47.f32[0], v47.f32[0]);
                    float32x2_t v49 = vsub_f32(vmla_n_f32(v30, v42, fminf(fmaxf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v48, v42).i32[1]), v42.f32[0], v48.f32[0]), 0.0), *(float *)v37.i32)), v21);
                    float v50 = sqrtf(v35.f32[0]);
                    *(float *)v37.i32 = vmlas_n_f32(COERCE_FLOAT(vmul_f32(v49, v49).i32[1]), v49.f32[0], v49.f32[0]);
                    float32x2_t v51 = vsub_f32(v21, v31);
                    float v52 = sqrtf(v45.f32[0]);
                    float32x2_t v53 = vmla_n_f32(v31, v44, fminf(fmaxf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v51, v44).i32[1]), v44.f32[0], v51.f32[0]), 0.0), *(float *)v39.i32));
                    float v54 = sqrtf(*(float *)v37.i32);
                    float32x2_t v55 = vsub_f32(v53, v21);
                    float v56 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v55, v55).i32[1]), v55.f32[0], v55.f32[0]));
                    if (result) {
                      float v57 = 0.0;
                    }
                    else {
                      float v57 = v22;
                    }
                    float v22 = fminf(v57, fminf(fminf(v50, v52), fminf(v54, v56)));
                    v23 += 4;
                    --v20;
                  }
                  while (v20);
                }
                else
                {
                  float v22 = 3.4028e38;
                }
                double v58 = 1.0;
                float v59 = 1.0 - fmax(fmin((float)(v17 * v22), 1.0), 0.0);
                if (v59 > 0.0)
                {
                  LOBYTE(v58) = *(unsigned char *)(v19 + v18 - v13);
                  *(unsigned char *)(v19 + v18 - v13) = llroundf((float)LODWORD(v58)+ (float)((float)(v65 - (float)LODWORD(v58)) * v59));
                }
                ++v18;
              }
              while (v14 != v18);
            }
            ++v15;
          }
          while (v61 != v15);
        }
      }
    }
  }
  return result;
}

void sub_30330(id a1)
{
  qword_8CF08 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_brightenSat(__sample im, __sample noise, float str, float sat, float pShift, float tShift) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n vec3 lms = im.r * vec3(0.3139902162, 0.15537240628, 0.01775238698) + \n im.g * vec3(0.63951293834, 0.75789446163, 0.1094420944) + \n im.b * vec3(0.04649754622, 0.08670141862, 0.87256922462); \n lms = sign(lms)*pow(abs(lms), vec3(0.43)); \n vec3 ipt = lms.r * vec3(0.4, 4.455, 0.8056) + \n lms.g * vec3(0.4, -4.851, 0.3572) + \n lms.b * vec3(0.2, 0.396,-1.1628); \n float c = sqrt(ipt.g*ipt.g+ipt.b*ipt.b); \n float h = atan(ipt.b, ipt.g); \n float brightGreen = exp(-(h-1.735)*(h-1.735)/(0.35*0.35))*ipt.r ;\n float blueDamp = exp(-(h+1.9)*(h+1.9)/(0.75*0.75))*ipt.r ;\n blueDamp *= (1.0 - smoothstep(0.65, 0.75, c)); \n float s = 1.0 + .6*str*(1.0 - .85*brightGreen)*(1.0-blueDamp); \n float greenDamp = exp(-(h-3.14159*0.8)*(h-3.14159*0.8)/(0.7*0.7)) ;\n float dampHighlights = 1.0; \n c *= s*sat * dampHighlights*(1.0 - .1*brightGreen)*(1.0-.2*blueDamp); \n float y2 = pow(ipt.r, .5); \n float y3 = mix(2.0*ipt.r, ipt.r, ipt.r); \n y2 = mix(y2, y3, .5); \n float dd = 1.0 - 0.15*smoothstep(0.7, 0.8, ipt.r); \n dd *= sqrt(y2); \n float CGFloat y = mix(ipt.r, y2, dd); \n float t = ipt.r*(1.0-ipt.r); \n CGFloat y = mix(y, 1.0, -t*str) ;\n ipt.r = mix(ipt.r, y, str); \n greenDamp += exp(-(h+3.14159*1.2)*(h+3.14159*1.2)/(0.7*0.7)) ;\n h = mix(h, h-.125, greenDamp); \n ipt.g = c * cos(h); \n ipt.b = c * sin(h); \n ipt.g += (pShift*ipt.r); ipt.b += (tShift*ipt.r); lms = ipt.r * vec3(1.0000, 1.0000, 1.0000) + \n ipt.g * vec3(0.0976,-0.1139, 0.0326) + \n ipt.b * vec3(0.2052, 0.1332,-0.6769); \n lms = sign(lms)*pow(abs(lms), vec3(1.0/.43)); \n im.rgb = lms.r * vec3(5.472212058380287, -1.125241895533569, 0.029801651173470) + \n lms.g * vec3(-4.641960098354471, 2.293170938060623, -0.193180728257140) + \n lms.b * vec3(0.169637076827974, -0.167895202223709, 1.163647892783812); \n c = smoothstep(0.0, 0.3, c); \n float ydamp = smoothstep(0.0, 1.0, ipt.r); \n im.rgb = mix(im.rgb, 0.95*im.rgb*im.rgb*im.rgb, greenDamp*ydamp*c); \n float nn = (noise.r + noise.g + noise.b + noise.a)*0.25 - 0.5; \n im.rgb = mix(im.rgb, im.rgb+(.03*nn), im.b); \n im.rgb = clamp(im.rgb, 0.0, 1.0) + neg + pos; \n return im; \n } \n"];
}

void sub_30514(id a1)
{
  qword_8CF18 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_brightenFood(__sample im, float str, float sat, float pShift, float tShift) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n vec3 lms = im.r * vec3(0.3139902162, 0.15537240628, 0.01775238698) + \n im.g * vec3(0.63951293834, 0.75789446163, 0.1094420944) + \n im.b * vec3(0.04649754622, 0.08670141862, 0.87256922462); \n lms = sign(lms)*pow(abs(lms), vec3(0.43)); \n vec3 ipt = lms.r * vec3(0.4, 4.455, 0.8056) + \n lms.g * vec3(0.4, -4.851, 0.3572) + \n lms.b * vec3(0.2, 0.396,-1.1628); \n float c = sqrt(ipt.g*ipt.g+ipt.b*ipt.b); \n float h = atan(ipt.b, ipt.g); \n float redDamp = 1.0 - .65*exp(-(h-3.14159*.14)*(h-3.14159*.14)/(.55*.55)); float brightGreen = exp(-(h-1.735)*(h-1.735)/(0.35*0.35))*ipt.r ;\n float cc = smoothstep(0.0, 0.55, c); \n float dampHighlights = 1.0 - smoothstep(.5, 1.0, ipt.r); \n float s = 1.0 + .6*str*cc*redDamp*(1.0-brightGreen); \n float dampBlue = 1.0 - smoothstep(0.5, 1.0, im.b); \n sat = (sat >= 1.0) ? 1.0+(sat-1.0)*cc*dampHighlights*redDamp*(1.0-brightGreen) : sat; \n float rgDamp = (1.0 - .15*(1.0-redDamp))*(1.0 - .1*brightGreen); \n c *= s*sat*dampBlue*rgDamp; \n float y2 = pow(ipt.r, .5); \n float y3 = mix(2.0*ipt.r, ipt.r, ipt.r); \n y2 = mix(y2, y3, .5); \n float dd = 1.0 - .15*smoothstep(0.7, 0.8, ipt.r); \n dd *= sqrt(y2); \n float CGFloat y = mix(ipt.r, y2, dd); \n float t = ipt.r*(1.0-ipt.r); \n CGFloat y = mix(y, 1.0, -t*str) ;\n ipt.r = mix(ipt.r, y, str); \n float hue_shift = .25*exp(-(h*h)/(.45*.45)); h += hue_shift; ipt.g = c * cos(h); \n ipt.b = c * sin(h); \n ipt.g += (pShift*ipt.r*redDamp); ipt.b += (tShift*ipt.r*redDamp); lms = ipt.r * vec3(1.0000, 1.0000, 1.0000) + \n ipt.g * vec3(0.0976,-0.1139, 0.0326) + \n ipt.b * vec3(0.2052, 0.1332,-0.6769); \n lms = sign(lms)*pow(abs(lms), vec3(1.0/.43)); \n im.rgb = lms.r * vec3(5.472212058380287, -1.125241895533569, 0.029801651173470) + \n lms.g * vec3(-4.641960098354471, 2.293170938060623, -0.193180728257140) + \n lms.b * vec3(0.169637076827974, -0.167895202223709, 1.163647892783812); \n im.rgb = mix(im.rgb, pow(im.rgb, vec3(1.6)), smoothstep(0.915, 1.0, ipt.r)); \n im.rgb = clamp(im.rgb, 0.0, 1.0) + neg + pos; \n return im; \n } \n"];
}

void sub_3083C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_30850(id a1)
{
  qword_8CF28 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

void sub_30890(uint64_t a1)
{
  id v5 = +[NSMutableArray arrayWithCapacity:9];
  for (uint64_t i = 24; i != 96; i += 8)
    [v5 addObject:*(void *)(*(void *)(a1 + 32) + i)];
  id v3 = (id)qword_8CF28;
  objc_sync_enter(v3);
  unsigned int v4 = +[NSArray arrayWithArray:v5];
  [(id)qword_8CF28 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  objc_sync_exit(v3);
}

void sub_30958(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_30DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_30DD4(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8 * *(int *)(a1 + 56) + 24), a2);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 96));
  atomic_fetch_add((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 1u);
  int v4 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if (v4 == 9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

float *sub_34074(float *result, float *a2)
{
  float v2 = result[3] - result[1];
  float v3 = result[2] - *result;
  float v4 = sqrtf((float)(v3 * v3) + (float)(v2 * v2));
  if (v4 <= 0.0)
  {
    *a2 = *result;
    float v5 = result[1];
  }
  else
  {
    *a2 = v2 / v4;
    float v5 = (float)-v3 / v4;
  }
  a2[1] = v5;
  return result;
}

BOOL sub_340BC(float *a1, float a2, float a3)
{
  float v3 = a1[1];
  float v4 = a1[3] - v3;
  float v5 = a1[2] - *a1;
  float v6 = sqrtf((float)(v5 * v5) + (float)(v4 * v4));
  float v7 = *a1;
  float v8 = v3;
  if (v6 > 0.0)
  {
    float v7 = v4 / v6;
    float v8 = (float)-v5 / v6;
  }
  return (float)((float)((float)(a3 - v3) * v8) + (float)((float)(a2 - *a1) * v7)) >= 0.0;
}

float sub_34110(float *a1, float a2, float a3)
{
  float v3 = a1[1];
  float v4 = a1[3] - v3;
  float v5 = a1[2] - *a1;
  float v6 = sqrtf((float)(v5 * v5) + (float)(v4 * v4));
  float v7 = *a1;
  float v8 = v3;
  if (v6 > 0.0)
  {
    float v7 = v4 / v6;
    float v8 = (float)-v5 / v6;
  }
  return (float)((float)(a3 - v3) * v8) + (float)((float)(a2 - *a1) * v7);
}

float sub_3415C(float *a1, float a2, float a3)
{
  float v3 = a1[1];
  float v4 = a1[2] - *a1;
  float v5 = a1[3] - v3;
  float v6 = (float)((float)(a3 - v3) * v5) + (float)((float)(a2 - *a1) * v4);
  float v7 = 1.0;
  if ((float)((float)(v5 * v5) + (float)(v4 * v4)) > 0.0) {
    float v7 = (float)(v5 * v5) + (float)(v4 * v4);
  }
  return v6 / v7;
}

float sub_34198(float *a1, float a2, float a3)
{
  float v3 = a1[2];
  float v4 = a1[3];
  float v5 = *a1;
  float v6 = a1[1];
  float v7 = v3 - *a1;
  float v8 = v4 - v6;
  float v9 = (float)(v8 * v8) + (float)(v7 * v7);
  float v10 = a2 - *a1;
  float v11 = a3 - v6;
  if (v9 <= 0.0) {
    float v9 = 1.0;
  }
  float v12 = (float)((float)((float)(a3 - v6) * (float)(v4 - v6)) + (float)(v10 * v7)) / v9;
  if (v12 > 1.0)
  {
    float v13 = (float)((float)(a3 - v4) * (float)(a3 - v4)) + (float)((float)(a2 - v3) * (float)(a2 - v3));
    return sqrtf(v13);
  }
  if (v12 < 0.0)
  {
    float v13 = (float)(v11 * v11) + (float)(v10 * v10);
    return sqrtf(v13);
  }
  float v15 = sqrtf((float)(v7 * v7) + (float)(v8 * v8));
  if (v15 > 0.0)
  {
    float v5 = v8 / v15;
    float v6 = (float)-v7 / v15;
  }
  return (float)(v11 * v6) + (float)(v10 * v5);
}

void sub_34230(float *a1, int a2, float a3, float a4)
{
  if (a2 >= 2)
  {
    uint64_t v7 = (a2 - 1);
    float v8 = 3.4028e38;
    do
    {
      if (sub_340BC(a1, a3, a4))
      {
        float v9 = sub_34198(a1, a3, a4);
        if (v9 < v8) {
          float v8 = v9;
        }
      }
      a1 += 2;
      --v7;
    }
    while (v7);
  }
}

__n128 sub_354B4@<Q0>(unsigned int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  v8[0] = 0x3FF0000000000000;
  v8[1] = 0;
  if (a1 <= 7) {
    unsigned int v4 = a1;
  }
  else {
    unsigned int v4 = 0;
  }
  v8[2] = 0;
  v8[3] = 0x3FF0000000000000;
  v8[4] = 0;
  v8[5] = 0;
  v8[6] = 0xBFF0000000000000;
  v8[7] = 0;
  v8[8] = 0;
  v8[9] = 0xBFF0000000000000;
  *(double *)&v8[10] = a3;
  *(double *)&v8[11] = a4;
  long long v9 = xmmword_55F50;
  long long v10 = xmmword_55F40;
  double v11 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  long long v14 = xmmword_564A0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  double v17 = a3;
  unint64_t v18 = 0xBFF0000000000000;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0x3FF0000000000000;
  double v22 = a3;
  long long v23 = xmmword_55F50;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  unint64_t v26 = 0xBFF0000000000000;
  uint64_t v27 = 0;
  double v28 = a4;
  long long v29 = xmmword_55F50;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v30 = 0x3FF0000000000000;
  unint64_t v33 = 0xBFF0000000000000;
  long long v34 = xmmword_55F40;
  double v35 = a4;
  double v36 = a3;
  float v5 = &v8[6 * v4];
  __n128 result = *(__n128 *)v5;
  long long v7 = *((_OWORD *)v5 + 2);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)v5 + 1);
  *(_OWORD *)(a2 + 32) = v7;
  *(__n128 *)a2 = result;
  return result;
}

__n128 sub_355C4@<Q0>(unsigned int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  v8[0] = 0x3FF0000000000000;
  v8[1] = 0;
  if (a1 <= 7) {
    unsigned int v4 = a1;
  }
  else {
    unsigned int v4 = 0;
  }
  v8[2] = 0;
  v8[3] = 0x3FF0000000000000;
  v8[4] = 0;
  v8[5] = 0;
  v8[6] = 0xBFF0000000000000;
  v8[7] = 0;
  v8[8] = 0;
  v8[9] = 0xBFF0000000000000;
  *(double *)&v8[10] = a3;
  *(double *)&v8[11] = a4;
  long long v9 = xmmword_55F30;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0x3FF0000000000000;
  double v13 = a4;
  long long v14 = xmmword_55F50;
  long long v15 = xmmword_55F40;
  double v16 = a3;
  long long v17 = xmmword_55F30;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0x3FF0000000000000;
  double v21 = a3;
  long long v22 = xmmword_55F50;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  unint64_t v25 = 0xBFF0000000000000;
  uint64_t v26 = 0;
  double v27 = a4;
  long long v28 = xmmword_55F50;
  long long v31 = 0u;
  long long v30 = 0u;
  uint64_t v29 = 0x3FF0000000000000;
  unint64_t v32 = 0xBFF0000000000000;
  long long v33 = xmmword_55F40;
  double v34 = a3;
  double v35 = a4;
  float v5 = &v8[6 * v4];
  __n128 result = *(__n128 *)v5;
  long long v7 = *((_OWORD *)v5 + 2);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)v5 + 1);
  *(_OWORD *)(a2 + 32) = v7;
  *(__n128 *)a2 = result;
  return result;
}

__n128 sub_356D8@<Q0>(unsigned int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  v9[0] = 0x3FF0000000000000;
  v9[1] = 0;
  v9[2] = 0;
  v9[3] = 0x3FF0000000000000;
  v9[4] = 0;
  v9[5] = 0;
  v9[6] = 0xBFF0000000000000;
  v9[7] = 0;
  v9[8] = 0;
  v9[9] = 0x3FF0000000000000;
  *(double *)&v9[10] = a3;
  long long v10 = xmmword_55F30;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = 0xBFF0000000000000;
  double v14 = a3;
  double v15 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = 0x3FF0000000000000;
  long long v19 = xmmword_55F40;
  double v20 = a4;
  long long v21 = xmmword_55F30;
  long long v22 = xmmword_55F40;
  double v23 = a4;
  double v24 = a3;
  long long v25 = xmmword_55F30;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0x3FF0000000000000;
  double v29 = a3;
  long long v30 = xmmword_55F50;
  long long v33 = 0u;
  long long v32 = 0u;
  uint64_t v31 = 0x3FF0000000000000;
  uint64_t v34 = 0x3FF0000000000000;
  long long v35 = xmmword_55F40;
  double v36 = a4;
  uint64_t v37 = 0;
  if (a1 <= 7) {
    unsigned int v4 = a1 - 1;
  }
  else {
    unsigned int v4 = 0;
  }
  float v5 = &v9[6 * (int)v4];
  long long v6 = *((_OWORD *)v5 + 2);
  long long v8 = *(_OWORD *)v5;
  __n128 result = *((__n128 *)v5 + 1);
  *(__n128 *)(a2 + 16) = result;
  *(_OWORD *)(a2 + 32) = v6;
  *(_OWORD *)a2 = v8;
  return result;
}

uint64_t sub_357F4(int *a1, int *a2, _DWORD *a3, int a4, int a5)
{
  uint64_t v10 = a4;
  __chkstk_darwin();
  uint64_t v12 = malloc_type_malloc(4 * (v11 * v11), 0x100004052888210uLL);
  unint64_t v13 = v12;
  if (a5)
  {
    if (a4 < 1) {
      goto LABEL_15;
    }
    uint64_t v14 = 0;
    uint64_t v15 = 4 * v10;
    uint64_t v16 = v12;
    do
    {
      uint64_t v17 = v10;
      uint64_t v18 = a1;
      long long v19 = v16;
      do
      {
        int v20 = *v18++;
        *long long v19 = v20;
        long long v19 = (_DWORD *)((char *)v19 + v15);
        --v17;
      }
      while (v17);
      ++v14;
      ++v16;
      a1 = (int *)((char *)a1 + v15);
    }
    while (v14 != v10);
  }
  else
  {
    if (a4 < 1) {
      goto LABEL_15;
    }
    uint64_t v21 = 0;
    uint64_t v22 = 4 * v10;
    double v23 = v12;
    do
    {
      uint64_t v24 = v10;
      long long v25 = v23;
      uint64_t v26 = a1;
      do
      {
        int v27 = *v26++;
        *v25++ = v27;
        --v24;
      }
      while (v24);
      ++v21;
      a1 = (int *)((char *)a1 + v22);
      double v23 = (_DWORD *)((char *)v23 + v22);
    }
    while (v21 != v10);
  }
  uint64_t v28 = a3;
  do
  {
    int v29 = *a2++;
    *v28++ = v29;
    --v10;
  }
  while (v10);
LABEL_15:
  sgesv_NEWLAPACK();
  free(v13);
  return 1;
}

double sub_359A8(int a1, double a2, double a3, float a4, float a5)
{
  double v5 = (float)(a4 + -1.0) - a2;
  double v6 = (float)(a5 + -1.0) - a3;
  if (a1 != 3) {
    a3 = a2;
  }
  if (a1 == 2) {
    double v7 = v6;
  }
  else {
    double v7 = a3;
  }
  if (a1 == 1) {
    return v5;
  }
  else {
    return v7;
  }
}

double sub_359EC(int a1, double a2, double a3, double a4, double a5, float a6)
{
  switch(a1)
  {
    case 1:
      double result = (float)(a6 + -1.0) - a4;
      break;
    case 2:
      double result = a3;
      break;
    case 3:
      double result = (float)(a6 + -1.0) - a5;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_35AB8(float a1, float a2, double a3, double a4, double a5, double a6)
{
  return (a1 - a3) * (a1 - a5) < 0.0 && (a2 - a4) * (a2 - a6) < 0.0;
}

double sub_35B0C(double *a1)
{
  double v1 = *a1;
  double v2 = a1[1];
  double v3 = a1[2];
  double v4 = a1[3];
  if (*a1 >= v3) {
    double v5 = a1[2];
  }
  else {
    double v5 = *a1;
  }
  float v6 = v5;
  if (*a1 < v3) {
    double v1 = a1[2];
  }
  float v7 = v1;
  if (v2 >= v4) {
    double v8 = a1[3];
  }
  else {
    double v8 = a1[1];
  }
  float v9 = v8;
  if (v2 < v4) {
    double v2 = a1[3];
  }
  float v10 = v2;
  *a1 = v6;
  a1[1] = v9;
  double result = v7;
  a1[2] = result;
  a1[3] = v10;
  return result;
}

float64x2_t sub_35B58(float64x2_t *a1, unsigned int a2, unsigned int a3)
{
  int32x2_t v3 = vadd_s32((int32x2_t)__PAIR64__(a3, a2), (int32x2_t)-1);
  v4.i64[0] = v3.i32[0];
  v4.i64[1] = v3.i32[1];
  float64x2_t v5 = vcvtq_f64_s64(v4);
  float64x2_t result = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(a1[1], v5), (int8x16_t)v5, (int8x16_t)a1[1]);
  *a1 = vmaxnmq_f64(*a1, (float64x2_t)0);
  a1[1] = result;
  return result;
}

double sub_35B8C(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 >= a3) {
    double v5 = a3;
  }
  else {
    double v5 = a1;
  }
  float v6 = v5;
  if (a1 < a3) {
    a1 = a3;
  }
  float v7 = a1;
  if (v6 >= v7) {
    float v8 = v7;
  }
  else {
    float v8 = v6;
  }
  if (a5 <= v8) {
    return (float)a5;
  }
  else {
    return v8;
  }
}

double sub_35C20(double a1)
{
  float v1 = a1;
  return floorf(v1);
}

double *sub_35C54(double *result, uint64_t a2, float64x2_t *a3)
{
  {
    *(float64x2_t *)float64x2_t result = vaddq_f64(a3[2], vmlaq_n_f64(vmulq_n_f64(a3[1], result[1]), *a3, *result));
    result += 2;
  }
  return result;
}

float sub_35C80(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double sub_35C9C(double a1, double a2, double a3)
{
  return a1 + a3;
}

double sub_35CA8(double a1, double a2, double a3)
{
  return a1 - a3;
}

double sub_35CB4(double a1, double a2)
{
  return -a2;
}

double sub_35CC4(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double sub_35CDC(double a1, double a2, float a3)
{
  return a1 * a3;
}

double sub_35CEC(double a1, double a2, double a3, double a4, float a5)
{
  return a1 + (a3 - a1) * a5;
}

float sub_35D0C(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double sub_35D1C(double a1, double a2)
{
  float v2 = sqrt(a2 * a2 + a1 * a1);
  double v3 = v2;
  double v4 = 0.0;
  if (v3 >= 0.01) {
    return a1 / v3;
  }
  return v4;
}

double sub_35D5C(double a1, double a2, double a3, double a4, float a5)
{
  return a3 * a5 + a1 * (float)(1.0 - a5);
}

float sub_35D88(double a1, double a2, double a3, double a4, double a5, double a6)
{
  float v6 = (a3 - a1) * (a6 - a2) - (a5 - a1) * (a4 - a2);
  BOOL v7 = v6 < 0.0;
  float result = 0.0;
  if (!v7) {
    return 1.0;
  }
  return result;
}

float sub_35DB8(double *a1, int a2, double a3, double a4)
{
  float v4 = 0.0;
  if (a3 >= *a1 && a3 <= a1[2 * a2 - 2])
  {
    uint64_t v5 = 0xFFFFFFFE00000000;
    float v6 = a1;
    do
    {
      double v7 = *v6;
      v6 += 2;
      double v8 = v7;
      v5 += 0x100000000;
    }
    while (a3 > v7);
    float v9 = (double *)((char *)a1 + (v5 >> 28));
    float v10 = (a3 - *v9) / (v8 - *v9);
    float v11 = v9[1] + v10 * (*(v6 - 1) - v9[1]);
    return a4 - v11;
  }
  return v4;
}

float sub_35E38(unsigned __int8 *a1)
{
  return (double)(a1[1] + *a1 + a1[2]) * 0.333333333;
}

float sub_35E64(float *a1)
{
  return (float)((float)(*a1 + a1[1]) + a1[2]) * 0.333333333;
}

float sub_35E8C(float *a1, float a2)
{
  float v3 = (float)((float)(*a1 + a1[1]) + a1[2]) * 0.333333333;
  return powf(v3, a2);
}

float sub_35EB8(unsigned __int8 *a1, float a2)
{
  float v3 = (double)(a1[1] + *a1 + a1[2]) * 0.333333333 / 255.0;
  return powf(v3, a2) * 255.0;
}

float sub_35F14(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  unsigned int v2 = a1[1];
  if (v1 <= v2) {
    unsigned int v3 = a1[1];
  }
  else {
    unsigned int v3 = *a1;
  }
  unsigned int v4 = a1[2];
  if (v1 >= v2) {
    unsigned int v1 = a1[1];
  }
  if (v3 <= v4) {
    unsigned int v5 = a1[2];
  }
  else {
    unsigned int v5 = v3;
  }
  if (v1 >= v4) {
    unsigned int v1 = a1[2];
  }
  return (float)(int)(v5 - v1);
}

float sub_35F48(float *a1)
{
  float v1 = *a1;
  float v2 = a1[1];
  if (*a1 >= v2) {
    float v3 = *a1;
  }
  else {
    float v3 = a1[1];
  }
  float v4 = a1[2];
  if (*a1 >= v2) {
    float v1 = a1[1];
  }
  if (v3 >= v4) {
    float v5 = v3;
  }
  else {
    float v5 = a1[2];
  }
  if (v1 >= v4) {
    float v1 = a1[2];
  }
  return v5 - v1;
}

uint64_t sub_35F74(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 <= a1[1]) {
    unsigned int v1 = a1[1];
  }
  if (v1 <= a1[2]) {
    return a1[2];
  }
  else {
    return v1;
  }
}

float sub_35F94(float *a1, float *a2)
{
  *a2 = (float)((float)(a1[1] * 0.587) + (float)(*a1 * 0.299)) + (float)(a1[2] * 0.114);
  a2[1] = (float)((float)(a1[1] * -0.33126) + (float)(*a1 * -0.16874)) + (float)(a1[2] * 0.5);
  float result = (float)((float)(a1[1] * -0.41869) + (float)(*a1 * 0.5)) + (float)(a1[2] * -0.081312);
  a2[2] = result;
  return result;
}

float sub_3601C(unsigned char *a1, float *a2, float a3, float a4)
{
  LOBYTE(a3) = *a1;
  LOBYTE(a4) = a1[1];
  *(float *)&unsigned int v4 = (float)LODWORD(a4) * 0.587;
  float v5 = *(float *)&v4 + (float)((float)LODWORD(a3) * 0.299);
  LOBYTE(v4) = a1[2];
  *(float *)&unsigned int v6 = (float)v4;
  *(float *)&unsigned int v7 = v5 + (float)(*(float *)&v6 * 0.114);
  *a2 = *(float *)&v7;
  LOBYTE(v7) = *a1;
  LOBYTE(v6) = a1[1];
  *(float *)&unsigned int v8 = (float)v6 * -0.33126;
  float v9 = *(float *)&v8 + (float)((float)v7 * -0.16874);
  LOBYTE(v8) = a1[2];
  *(float *)&unsigned int v10 = (float)v8;
  *(float *)&unsigned int v11 = v9 + (float)(*(float *)&v10 * 0.5);
  a2[1] = *(float *)&v11;
  LOBYTE(v11) = *a1;
  LOBYTE(v10) = a1[1];
  *(float *)&unsigned int v12 = (float)v10 * -0.41869;
  float v13 = *(float *)&v12 + (float)((float)v11 * 0.5);
  LOBYTE(v12) = a1[2];
  float result = v13 + (float)((float)v12 * -0.081312);
  a2[2] = result;
  return result;
}

float sub_360D4(float *a1, float *a2)
{
  *a2 = (float)((float)((float)(a1[1] * 0.587) + (float)(*a1 * 0.299)) + (float)(a1[2] * 0.114)) * 255.0;
  a2[1] = (float)((float)((float)(a1[1] * -0.33126) + (float)(*a1 * -0.16874)) + (float)(a1[2] * 0.5)) * 255.0;
  float result = (float)((float)((float)(a1[1] * -0.41869) + (float)(*a1 * 0.5)) + (float)(a1[2] * -0.081312)) * 255.0;
  a2[2] = result;
  return result;
}

float sub_36170(float *a1, float *a2)
{
  *a2 = (float)(*a1 + (float)(a1[1] * 0.0)) + (float)(a1[2] * 1.403);
  a2[1] = (float)(*a1 + (float)(a1[1] * -0.344)) + (float)(a1[2] * -0.714);
  float result = (float)(*a1 + (float)(a1[1] * 1.773)) + (float)(a1[2] * -0.0);
  a2[2] = result;
  return result;
}

float32_t sub_361D8(unsigned char *a1, float32x2_t *a2, float a3, double a4)
{
  LOBYTE(a4) = *a1;
  double v6 = (double)*(unint64_t *)&a4;
  double v5 = v6 / 255.0;
  LOBYTE(v6) = a1[1];
  double v7 = (double)*(unint64_t *)&v6 / 255.0;
  long double v8 = a3;
  double v10 = fabs(a3 + -1.0);
  BOOL v9 = v10 <= 0.01;
  LOBYTE(v10) = a1[2];
  double v11 = (double)*(unint64_t *)&v10 / 255.0;
  if (!v9)
  {
    __CGFloat x = (double)*(unint64_t *)&v6 / 255.0;
    long double v14 = (double)*(unint64_t *)&v10 / 255.0;
    long double v15 = pow(v5, v8);
    long double __xa = pow(__x, v8);
    long double v12 = pow(v14, v8);
    double v5 = v15;
    double v7 = __xa;
    double v11 = v12;
  }
  *a2 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_564B0, v7), (float64x2_t)xmmword_564C0, v5), (float64x2_t)xmmword_564D0, v11));
  float32_t result = v7 * -0.522 + v5 * 0.211 + v11 * 0.311;
  a2[1].f32[0] = result;
  return result;
}

float32_t sub_362E8(float *a1, float32x2_t *a2, float a3)
{
  double v4 = *a1;
  double v5 = a1[1];
  double v6 = a1[2];
  long double v7 = a3;
  if (fabs(a3 + -1.0) > 0.01)
  {
    long double v11 = a1[2];
    __CGFloat x = a1[1];
    long double v10 = pow(*a1, v7);
    long double __xa = pow(__x, v7);
    long double v8 = pow(v11, v7);
    double v5 = __xa;
    double v4 = v10;
    double v6 = v8;
  }
  *a2 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_564B0, v5), (float64x2_t)xmmword_564C0, v4), (float64x2_t)xmmword_564D0, v6));
  float32_t result = v5 * -0.522 + v4 * 0.211 + v6 * 0.311;
  a2[1].f32[0] = result;
  return result;
}

float sub_363E0(unsigned char *a1, float *a2, float a3, float a4, double a5, float a6)
{
  LOBYTE(a3) = *a1;
  LOBYTE(a4) = a1[1];
  *(float *)&unsigned int v6 = (float)LODWORD(a4) * 0.587;
  float v7 = *(float *)&v6 + (float)((float)LODWORD(a3) * 0.299);
  LOBYTE(v6) = a1[2];
  *(float *)&unsigned int v8 = (float)v6;
  *(float *)&unsigned int v9 = v7 + (float)(*(float *)&v8 * 0.114);
  *a2 = *(float *)&v9;
  LOBYTE(v9) = *a1;
  LOBYTE(v8) = a1[1];
  *(float *)&unsigned int v10 = (float)v8 * -0.331;
  float v11 = *(float *)&v10 + (float)((float)v9 * -0.169);
  LOBYTE(v10) = a1[2];
  unsigned int v12 = 0.5;
  *(float *)&unsigned int v13 = (float)(v11 + (float)((float)v10 * 0.5)) + 128.0;
  a2[1] = *(float *)&v13;
  LOBYTE(v13) = *a1;
  LOBYTE(a6) = a1[1];
  LOBYTE(v12) = a1[2];
  float result = (float)((float)((float)((float)LODWORD(a6) * -0.419) + (float)((float)v13 * 0.5))
                 + (float)((float)v12 * -0.081))
         + 128.0;
  a2[2] = result;
  return result;
}

float sub_364A4(float *a1, float *a2)
{
  float v2 = a1[1] + -128.0;
  float v3 = a1[2] + -128.0;
  *a2 = (float)(*a1 + (float)(v2 * 0.0)) + (float)(v3 * 1.403);
  a2[1] = (float)(*a1 + (float)(v2 * -0.344)) + (float)(v3 * -0.714);
  float result = (float)(*a1 + (float)(v2 * -1.773)) + (float)(v3 * -0.0);
  a2[2] = result;
  return result;
}

uint64_t sub_36510(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4 = 0;
  int v5 = 0;
  double v6 = (double)a3;
  if (!a3) {
    double v6 = 3.0;
  }
  float v7 = (unsigned __int8 *)(a1 + a4);
  unsigned int v8 = *v7;
  int v9 = v7[a2];
  unsigned int v10 = v7;
  float v11 = &v7[-a2];
  int v13 = v7[4];
  unsigned int v12 = v7 + 4;
  int v14 = (int)(v6 + (double)v8 * 0.008) + v8;
  BOOL v15 = v14 < v12[a2];
  v26[0] = v14 < v13;
  v26[1] = v15;
  BOOL v16 = v14 < v9;
  int v19 = *(v10 - 4);
  uint64_t v18 = v10 - 4;
  int v17 = v19;
  int v20 = v18[a2];
  int v21 = v16;
  void v26[2] = v21;
  v26[3] = v14 < v20;
  BOOL v22 = v14 < v18[-a2];
  v26[4] = v14 < v17;
  v26[5] = v22;
  BOOL v23 = v14 < v12[-a2];
  v26[6] = v14 < *v11;
  v26[7] = v23;
  int v24 = 1;
  do
  {
    v5 += v26[v4] * v24;
    v24 *= 2;
    ++v4;
  }
  while (v4 != 8);
  return v5;
}

uint64_t sub_36634(unsigned __int8 *a1, _DWORD *a2, uint64_t a3)
{
  int v4 = *a1;
  uint64_t result = *a2;
  if (!v4)
  {
    double v6 = a1 + 1;
    while (1)
    {
      uint64_t result = (result + 1);
      if (!*v6 && (int)result >= (int)a3) {
        break;
      }
      *a2 = result;
      if (*v6++) {
        return result;
      }
    }
    return a3;
  }
  return result;
}

unint64_t sub_36674(unint64_t result, unsigned int *a2, uint64_t a3, int a4)
{
  if (*(unsigned char *)result) {
    return *a2;
  }
  unint64_t v4 = result;
  LODWORD(result) = *a2;
  int v5 = (unsigned char *)(v4 + a4);
  while (1)
  {
    uint64_t result = (result + 1);
    if (*v5)
    {
      BOOL v7 = 0;
      BOOL v6 = 1;
    }
    else
    {
      BOOL v7 = __OFSUB__(result, a3);
      BOOL v6 = (int)result - (int)a3 < 0;
    }
    if (v6 == v7) {
      break;
    }
    *a2 = result;
    int v8 = *v5;
    v5 += a4;
    if (v8) {
      return result;
    }
  }
  return a3;
}

BOOL sub_366C4(unsigned char *a1, int a2, int a3)
{
  if (a3 == 1) {
    int v3 = -a2;
  }
  else {
    int v3 = a2;
  }
  if (a3 == 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3;
  }
  if (a3 == 3) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  return !*a1 || !a1[v5] || a1[-v5] == 0;
}

BOOL sub_36714(unsigned char *a1, int a2, int a3)
{
  if (a3 == 3) {
    int v3 = -a2;
  }
  else {
    int v3 = 1;
  }
  if (a3 == 2) {
    int v3 = a2;
  }
  if (a3 == 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3;
  }
  return !*a1 || !a1[v4] || a1[-v4] == 0;
}

unint64_t sub_36764(unint64_t result, unsigned int *a2, uint64_t a3, int a4, int a5)
{
  if (*(unsigned char *)result) {
    return *a2;
  }
  int v5 = (unsigned char *)result;
  LODWORD(result) = *a2;
  while (1)
  {
    if (a5 == 3) {
      int v6 = -a4;
    }
    else {
      int v6 = 1;
    }
    if (a5 == 2) {
      int v6 = a4;
    }
    if (a5 == 1) {
      int v6 = -1;
    }
    v5 += v6;
    uint64_t result = (result + 1);
    if (!*v5 && (int)result >= (int)a3) {
      break;
    }
    *a2 = result;
    if (*v5) {
      return result;
    }
  }
  return a3;
}

unint64_t sub_367CC(unint64_t result, unsigned int *a2, uint64_t a3, int a4, int a5)
{
  if (*(unsigned char *)result) {
    return *a2;
  }
  int v5 = (unsigned char *)result;
  LODWORD(result) = *a2;
  while (1)
  {
    if (a5 == 1) {
      int v6 = -a4;
    }
    else {
      int v6 = a4;
    }
    if (a5 == 2) {
      int v6 = -1;
    }
    if (a5 == 3) {
      int v6 = 1;
    }
    v5 += v6;
    uint64_t result = (result + 1);
    if (!*v5 && (int)result >= (int)a3) {
      break;
    }
    *a2 = result;
    if (*v5) {
      return result;
    }
  }
  return a3;
}

double sub_36834(uint64_t *a1, uint64_t *a2, uint64_t *a3, double *a4, double *a5, double *a6)
{
  double v9 = (double)*a1 / 255.0;
  double v10 = (double)*a2 / 255.0;
  double v11 = (double)*a3;
  if (v9 <= 0.0404499993)
  {
    double v13 = v9 / 12.9200001;
  }
  else
  {
    float v12 = (v9 + 0.0549999997) / 1.05499995;
    double v13 = powf(v12, 2.4);
  }
  double v14 = v11 / 255.0;
  if (v10 <= 0.04045)
  {
    double v16 = v10 / 12.9200001;
  }
  else
  {
    float v15 = (v10 + 0.0549999997) / 1.05499995;
    double v16 = powf(v15, 2.4);
  }
  if (v14 <= 0.0404499993)
  {
    double v18 = v14 / 12.9200001;
  }
  else
  {
    float v17 = (v14 + 0.0549999997) / 1.05499995;
    double v18 = powf(v17, 2.4);
  }
  double v19 = v18 * 100.0;
  *a4 = v16 * 100.0 * 0.357600003 + v13 * 100.0 * 0.412400007 + v19 * 0.180500001;
  *a5 = v16 * 100.0 * 0.715200007 + v13 * 100.0 * 0.212599993 + v19 * 0.0722000003;
  double result = v16 * 100.0 * 0.119199999 + v13 * 100.0 * 0.0193000007 + v19 * 0.950500011;
  *a6 = result;
  return result;
}

void sub_36A00(uint64_t a1, float64x2_t *a2)
{
  for (uint64_t i = 0; i != 24; i += 8)
  {
    double v5 = *(double *)(a1 + i);
    if (v5 <= 0.04045) {
      double v6 = v5 / 12.92;
    }
    else {
      double v6 = pow((v5 + 0.055) / 1.055, 2.4);
    }
    *(double *)((char *)&v10 + i) = v6;
  }
  double v7 = v10;
  double v8 = v11;
  double v9 = v12;
  *a2 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_564E0, v11), (float64x2_t)xmmword_564F0, v10), (float64x2_t)xmmword_56500, v12);
  a2[1].f64[0] = v8 * 0.1192 + v7 * 0.0193 + v9 * 0.9505;
}

float64x2_t sub_36B34(float64x2_t *a1, uint64_t a2)
{
  float64x2_t v3 = *a1;
  double v4 = a1->f64[1];
  double v5 = v4 / 0.333333333;
  double v6 = a1[1].f64[0];
  if (v4 / 0.333333333 <= 0.00885645168)
  {
    double v8 = v5 * 903.296296;
  }
  else
  {
    float64x2_t v10 = *a1;
    long double v7 = pow(v5, 0.333333333);
    float64x2_t v3 = v10;
    double v8 = v7 * 116.0 + -16.0;
  }
  *(double *)a2 = v8;
  float64x2_t result = vmulq_n_f64(vaddq_f64(vdivq_f64(vmulq_f64(v3, (float64x2_t)xmmword_56510), (float64x2_t)vdupq_lane_s64(COERCE__INT64(v3.f64[0] + v4 * 15.0 + v6 * 3.0), 0)), (float64x2_t)xmmword_56520), v8 * 13.0);
  *(float64x2_t *)(a2 + 8) = result;
  return result;
}

double sub_36BFC(uint64_t a1, uint64_t a2)
{
  sub_36A00(a1, &v4);
  *(void *)&double result = *(_OWORD *)&sub_36B34(&v4, a2);
  return result;
}

double sub_36C64(unsigned char *a1, unsigned char *a2, double a3, double a4, double a5)
{
  LOBYTE(a3) = *a1;
  double v5 = (double)*(unint64_t *)&a3 / 255.0;
  LOBYTE(a5) = a1[1];
  *(double *)&unint64_t v6 = (double)*(unint64_t *)&a5 / 255.0;
  *(double *)long long v25 = v5;
  v25[1] = v6;
  LOBYTE(v5) = a1[2];
  *(double *)&unint64_t v7 = (double)*(unint64_t *)&v5 / 255.0;
  v25[2] = v7;
  LOBYTE(v7) = *a2;
  double v8 = (double)v7 / 255.0;
  LOBYTE(v6) = a2[1];
  *(double *)int v24 = v8;
  *(double *)&v24[1] = (double)v6 / 255.0;
  LOBYTE(v8) = a2[2];
  *(double *)&v24[2] = (double)*(unint64_t *)&v8 / 255.0;
  sub_36A00((uint64_t)v25, &v26);
  float64x2_t v9 = v26;
  float64_t v10 = v26.f64[1] / 0.333333333;
  double v23 = v27;
  if (v26.f64[1] / 0.333333333 <= 0.00885645168) {
    double v11 = v10 * 903.296296;
  }
  else {
    double v11 = pow(v10, 0.333333333) * 116.0 + -16.0;
  }
  sub_36A00((uint64_t)v24, &v26);
  float64x2_t v12 = v26;
  float64_t v13 = v26.f64[1] / 0.333333333;
  double v14 = v27;
  if (v26.f64[1] / 0.333333333 <= 0.00885645168) {
    double v15 = v13 * 903.296296;
  }
  else {
    double v15 = pow(v13, 0.333333333) * 116.0 + -16.0;
  }
  float64_t v16 = v9.f64[0] + v9.f64[1] * 15.0 + v23 * 3.0;
  float64_t v17 = (v9.f64[1] * 9.0 / v16 + -0.473684211) * (v11 * 13.0);
  float64_t v18 = (v9.f64[0] * 4.0 / v16 + -0.222222222) * (v11 * 13.0);
  float64_t v19 = v12.f64[0] + v12.f64[1] * 15.0 + v14 * 3.0;
  float64_t v20 = v12.f64[1] * 9.0 / v19;
  float64_t v21 = (v12.f64[0] * 4.0 / v19 + -0.222222222) * (v15 * 13.0);
  return fabs(sqrt((v21 - v18) * (v21 - v18)+ (v15 - v11) * (v15 - v11)+ ((v20 + -0.473684211) * (v15 * 13.0) - v17) * ((v20 + -0.473684211) * (v15 * 13.0) - v17)));
}

double sub_36E74(unsigned char *a1, double *a2, double a3)
{
  LOBYTE(a3) = *a1;
  double v3 = (double)*(unint64_t *)&a3 / 255.0;
  *a2 = v3;
  LOBYTE(v3) = a1[1];
  double v4 = (double)*(unint64_t *)&v3 / 255.0;
  a2[1] = v4;
  LOBYTE(v4) = a1[2];
  double result = (double)*(unint64_t *)&v4 / 255.0;
  a2[2] = result;
  return result;
}

char *sub_36EB0(char *result, unsigned char *a2, int a3, int a4, int a5, int a6)
{
  if (a4 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a5;
    uint64_t v8 = a4;
    do
    {
      if (a3 >= 1)
      {
        uint64_t v9 = 0;
        float64_t v10 = result;
        double v11 = a2;
        do
        {
          uint64_t v12 = a6;
          float64_t v13 = v10;
          double v14 = v11;
          if (a6 >= 1)
          {
            do
            {
              char v15 = *v13++;
              *v14++ = v15;
              --v12;
            }
            while (v12);
          }
          ++v9;
          v11 += a6;
          v10 += a6;
        }
        while (v9 != a3);
      }
      ++v6;
      a2 += a3;
      result += v7;
    }
    while (v6 != v8);
  }
  return result;
}

uint64_t sub_36F38(uint64_t result, int a2, unsigned int a3, int a4, int a5)
{
  if ((int)a3 >= 2)
  {
    uint64_t v5 = 0;
    do
    {
      if (a2 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = result;
        do
        {
          if (a5 >= 1)
          {
            uint64_t v8 = (unsigned __int8 *)(result + v5 * a4 + v6 * a5);
            float v9 = (double)(v8[1] + *v8 + v8[2]) * 0.333333333;
            float v10 = (double)(*(unsigned __int8 *)(result + (a3 - v5) * a4 + v6 * a5 + 1)
                         + *(unsigned __int8 *)(result + (a3 - v5) * a4 + v6 * a5)
                         + *(unsigned __int8 *)(result + (a3 - v5) * a4 + v6 * a5 + 2))
                * 0.333333333;
            if (v9 <= v10) {
              uint64_t v11 = v5 * a4;
            }
            else {
              uint64_t v11 = (a3 - v5) * a4;
            }
            if (v9 <= v10) {
              uint64_t v12 = (a3 - v5) * a4;
            }
            else {
              uint64_t v12 = v5 * a4;
            }
            float64_t v13 = (unsigned char *)(v7 + v11);
            double v14 = (char *)(v7 + v12);
            uint64_t v15 = a5;
            do
            {
              char v16 = *v14++;
              *v13++ = v16;
              --v15;
            }
            while (v15);
          }
          ++v6;
          v7 += a5;
        }
        while (v6 != a2);
      }
      ++v5;
    }
    while (v5 != a3 >> 1);
  }
  return result;
}

uint64_t sub_3702C(uint64_t result, int a2, int a3, int a4, int a5)
{
  if (a3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a5;
    uint64_t v8 = a4;
    uint64_t v9 = a3;
    float v10 = (unsigned __int8 *)(result + 2);
    uint64_t v11 = a2;
    do
    {
      uint64_t v12 = v11;
      float64_t v13 = v10;
      if (a2 >= 1)
      {
        do
        {
          double result = printf("{%d,%d,%d},", *(v13 - 2), *(v13 - 1), *v13);
          v13 += v7;
          --v12;
        }
        while (v12);
      }
      ++v6;
      v10 += v8;
    }
    while (v6 != v9);
  }
  return result;
}

float sub_370E8(double a1, double a2, double a3, double a4, float a5, float a6)
{
  return sqrt((a6 - a2) * (a6 - a2) + (a5 - a1) * (a5 - a1)) + sqrt((a6 - a4) * (a6 - a4) + (a5 - a3) * (a5 - a3));
}

float sub_37124(double a1, double a2, double a3, double a4, float a5, float a6, float a7)
{
  double v10 = a6;
  double v11 = a5;
  double v12 = a5 - a1;
  if (a2 <= a6 && a4 <= v10)
  {
    long double v15 = a7;
    double v16 = pow(fabs(v12), a7);
    long double v17 = pow(vabdd_f64(v10, a2), v15);
    double v18 = pow(v16 + v17, 1.0 / v15);
    double v19 = pow(vabdd_f64(v11, a3), v15);
    long double v20 = pow(vabdd_f64(v10, a4), v15);
    return v18 + pow(v19 + v20, 1.0 / v15);
  }
  else
  {
    return sqrt((v10 - a2) * (v10 - a2) + v12 * v12) + sqrt((v10 - a4) * (v10 - a4) + (v11 - a3) * (v11 - a3));
  }
}

BOOL sub_37210(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, long double a10)
{
  float v18 = sqrt((a2 - a6) * (a2 - a6) + (a1 - a5) * (a1 - a5));
  float v19 = sqrt((a4 - a6) * (a4 - a6) + (a3 - a5) * (a3 - a5));
  if (v18 >= v19) {
    float v18 = v19;
  }
  return sub_37284(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, v18 * 0.02);
}

BOOL sub_37284(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, long double a10, double a11)
{
  double v19 = a1 - a5;
  double v20 = a2 - a6;
  float v21 = sqrt(v20 * v20 + v19 * v19);
  double v22 = v21;
  double v23 = a3 - a5;
  double v24 = a4 - a6;
  float v25 = sqrt(v24 * v24 + v23 * v23);
  double v26 = v25;
  double v27 = 0.0;
  double v28 = 0.0;
  double v29 = 0.0;
  if (v22 >= 0.01)
  {
    double v28 = v19 / v22;
    double v29 = v20 / v22;
  }
  double v30 = 0.0;
  if (v26 >= 0.01)
  {
    double v27 = v23 / v26;
    double v30 = v24 / v26;
  }
  double v31 = 1.0 / v26;
  double v32 = 1.0 / v22;
  double v33 = a7 - a5;
  float v34 = (a8 - a6) * v29 + (a7 - a5) * v28;
  float v35 = (a8 - a6) * v30 + v33 * v27;
  if (v34 >= 0.0) {
    a10 = a9;
  }
  double v37 = pow(fabs(v32 * v34), a10);
  return v37 + pow(fabs(v31 * v35), a10) < a11 + 1.0;
}

BOOL sub_37398(double a1, double a2, double a3, double a4, double a5, double a6, long double a7, long double a8, double a9)
{
  if (a6 <= a4) {
    a7 = a8;
  }
  double v21 = pow(fabs((a5 - a3) / a1), a7);
  return v21 + pow(fabs((a6 - a4) / a2), a7) < a9 + 1.0;
}

BOOL sub_3741C(double a1, double a2, double a3, double a4, double a5, double a6, long double a7, long double a8, double a9)
{
  if (a5 <= a3) {
    a7 = a8;
  }
  double v21 = pow(fabs((a5 - a3) / a1), a7);
  return v21 + pow(fabs((a6 - a4) / a2), a7) < a9 + 1.0;
}

double sub_374A0(double a1, double a2)
{
  return a2;
}

double sub_374B0()
{
  return 0.0;
}

double sub_374BC(int a1, int a2, int a3, int *a4, int *a5, double result)
{
  if (a1 == 3)
  {
    *a4 = a3;
    double result = result - (double)a2 + -1.0;
    *a5 = (int)result;
  }
  else if (!a1)
  {
    *a5 = a3;
    *a4 = a2;
  }
  return result;
}

double sub_374F4(int a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  double v9 = a2;
  if (a1 == 2)
  {
    double v11 = a6 - CGRectGetMaxY(*(CGRect *)&a2);
    v14.origin.CGFloat x = v9;
    v14.origin.CGFloat y = a3;
    v14.size.width = a4;
    v14.size.height = a5;
    CGRectGetMinX(v14);
    return v11;
  }
  else if (a1 == 3)
  {
    CGFloat MinY = CGRectGetMinY(*(CGRect *)&a2);
    v13.origin.CGFloat x = v9;
    v13.origin.CGFloat y = a3;
    v13.size.width = a4;
    v13.size.height = a5;
    CGRectGetMaxX(v13);
    return MinY;
  }
  return v9;
}

double sub_375CC(int a1, double a2, double a3)
{
  if (a1 == 3) {
    return a3;
  }
  return result;
}

double sub_375E0(double a1)
{
  float v1 = a1;
  return roundf(v1);
}

uint64_t sub_375F4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t v7 = 4 * a4;
  uint64_t v8 = a1 + (a4 - a3) * v7;
  uint64_t v9 = a1 + (a5 - a2) * (uint64_t)(int)v7;
  uint64_t v10 = a1 + (int)v7 * (uint64_t)a2;
  if (a6) {
    uint64_t v10 = v9;
  }
  if (a6 == 3) {
    int v11 = (a5 - a2) * a7;
  }
  else {
    int v11 = a7 * a3;
  }
  if (a6 == 3) {
    uint64_t v10 = v8;
  }
  return v10 + v11;
}

uint64_t sub_37638(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7)
{
  int v7 = a7 * a4;
  switch(a6)
  {
    case 0:
      result += v7 * (uint64_t)(~a3 + a5) + a7 * (uint64_t)a2;
      break;
    case 1:
      uint64_t v8 = result + v7 * (uint64_t)a3;
      int v9 = ~a2;
      goto LABEL_6;
    case 2:
      result += v7 * (uint64_t)a2 + a7 * (uint64_t)a3;
      break;
    case 3:
      uint64_t v8 = result + v7 * (uint64_t)(~a2 + a5);
      int v9 = ~a3;
LABEL_6:
      double result = v8 + (v9 + a4) * (uint64_t)a7;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_376C0(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  switch(a6)
  {
    case 0:
      result += (~a3 + a5) * (uint64_t)a8 + a7 * (uint64_t)a2;
      break;
    case 1:
      uint64_t v8 = result + a8 * (uint64_t)a3;
      int v9 = ~a2;
      goto LABEL_6;
    case 2:
      result += a8 * (uint64_t)a2 + a7 * (uint64_t)a3;
      break;
    case 3:
      uint64_t v8 = result + (~a2 + a5) * (uint64_t)a8;
      int v9 = ~a3;
LABEL_6:
      double result = v8 + (v9 + a4) * (uint64_t)a7;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_37744(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  switch(a6)
  {
    case 0:
      result += 4 * (a7 * a2 + (~a3 + a5) * a8);
      return result;
    case 1:
      uint64_t v8 = result + 4 * a8 * a3;
      int v9 = ~a2;
      goto LABEL_6;
    case 2:
      uint64_t v8 = result + 4 * a8 * a2;
      int v10 = a7 * a3;
      goto LABEL_7;
    case 3:
      uint64_t v8 = result + 4 * (~a2 + a5) * a8;
      int v9 = ~a3;
LABEL_6:
      int v10 = (v9 + a4) * a7;
LABEL_7:
      double result = v8 + 4 * v10;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_377DC(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7)
{
  int v7 = a7 * a4;
  switch(a6)
  {
    case 0:
      uint64_t v8 = result + 4 * v7 * (~a3 + a5);
      int v9 = a7 * a2;
      goto LABEL_7;
    case 1:
      uint64_t v8 = result + 4 * v7 * a3;
      int v10 = ~a2;
      goto LABEL_6;
    case 2:
      uint64_t v8 = result + 4 * v7 * a2;
      int v9 = a7 * a3;
      goto LABEL_7;
    case 3:
      uint64_t v8 = result + 4 * v7 * (~a2 + a5);
      int v10 = ~a3;
LABEL_6:
      int v9 = (v10 + a4) * a7;
LABEL_7:
      double result = v8 + 4 * v9;
      break;
    default:
      return result;
  }
  return result;
}

double sub_37878(double a1, double a2, double a3, double a4)
{
  return a1 + a4;
}

double sub_37888(double a1, double a2, double a3, double a4)
{
  return a1 - a4;
}

double sub_37898(double a1, double a2, double a3, double a4)
{
  return (a1 + a4) * 0.5;
}

double sub_378B8(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return (a1 + a4 + a9) / 3.0;
}

double *sub_378EC(double *result)
{
  double v1 = *result;
  double v2 = result[1];
  double v3 = result[2];
  double v4 = sqrt(v2 * v2 + v1 * v1 + v3 * v3);
  if (v4 == 0.0)
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    double v5 = v1 / v4;
    double v6 = v2 / v4;
    double v7 = v3 / v4;
  }
  *double result = v5;
  result[1] = v6;
  result[2] = v7;
  return result;
}

uint64_t sub_37934(uint64_t a1, int a2)
{
  uint64_t v2 = 0;
  long long v67 = xmmword_56740;
  *(_OWORD *)int32x4_t v68 = unk_56750;
  *(_OWORD *)&v68[16] = xmmword_56760;
  *(_OWORD *)&v64[16] = xmmword_56700;
  long long v65 = unk_56710;
  *(_OWORD *)uint32x2_t v66 = xmmword_56720;
  *(_OWORD *)&v66[16] = unk_56730;
  long long v63 = xmmword_566E0;
  *(_OWORD *)float v64 = unk_566F0;
  float64x2_t v3 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCCuLL);
  do
  {
    *(float64x2_t *)&v64[v2 - 16] = vmulq_f64(*(float64x2_t *)&v64[v2 - 16], v3);
    v2 += 24;
  }
  while (v2 != 144);
  long long v4 = v63;
  long long v5 = v63;
  *(_OWORD *)a1 = v63;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)&v66[8];
  long long v6 = v67;
  long long v7 = v67;
  *(_OWORD *)(a1 + 48) = v67;
  *(_OWORD *)(a1 + 128) = v4;
  *(_OWORD *)(a1 + 152) = v6;
  long long v8 = *(_OWORD *)&v68[8];
  *(_OWORD *)(a1 + 176) = *(_OWORD *)&v68[8];
  *(_OWORD *)(a1 + 280) = v8;
  long long v9 = v65;
  *(_OWORD *)(a1 + 304) = v65;
  *(_OWORD *)(a1 + 408) = v9;
  *(_OWORD *)(a1 + 536) = v7;
  *(_OWORD *)(a1 + 664) = *(_OWORD *)&v68[8];
  long long v10 = v65;
  *(_OWORD *)(a1 + 792) = v65;
  uint64_t v11 = *(void *)v64;
  uint64_t v12 = *(void *)v64;
  *(void *)(a1 + 16) = *(void *)v64;
  uint64_t v13 = *(void *)&v66[24];
  *(void *)(a1 + 40) = *(void *)&v66[24];
  uint64_t v14 = *(void *)v68;
  uint64_t v15 = *(void *)v68;
  *(void *)(a1 + 64) = *(void *)v68;
  *(void *)(a1 + 144) = v11;
  *(void *)(a1 + 168) = v14;
  uint64_t v16 = *(void *)&v68[24];
  uint64_t v17 = *(void *)&v68[24];
  *(void *)(a1 + 192) = *(void *)&v68[24];
  *(void *)(a1 + 296) = v16;
  uint64_t v18 = *(void *)v66;
  *(void *)(a1 + 320) = *(void *)v66;
  *(void *)(a1 + 272) = v12;
  *(void *)(a1 + 400) = v12;
  *(void *)(a1 + 424) = v18;
  *(void *)(a1 + 448) = v13;
  uint64_t v19 = *(void *)&v64[24];
  *(void *)(a1 + 528) = *(void *)&v64[24];
  *(void *)(a1 + 552) = v15;
  uint64_t v20 = *(void *)&v66[24];
  *(void *)(a1 + 576) = *(void *)&v66[24];
  *(void *)(a1 + 656) = v19;
  *(void *)(a1 + 680) = v17;
  *(void *)(a1 + 704) = *(void *)v68;
  uint64_t v21 = *(void *)&v64[24];
  *(void *)(a1 + 784) = *(void *)&v64[24];
  uint64_t v22 = *(void *)v66;
  *(void *)(a1 + 808) = *(void *)v66;
  *(void *)(a1 + 832) = *(void *)&v68[24];
  *(void *)(a1 + 120) = 0xC08F400000000000;
  *(void *)(a1 + 248) = 0xC08F400000000000;
  *(_OWORD *)(a1 + 256) = v5;
  *(void *)(a1 + 376) = 0xC08F400000000000;
  *(_OWORD *)(a1 + 384) = v5;
  *(_OWORD *)(a1 + 432) = *(_OWORD *)&v66[8];
  *(void *)(a1 + 504) = 0xC08F400000000000;
  *(_OWORD *)(a1 + 512) = *(_OWORD *)&v64[8];
  *(_OWORD *)(a1 + 560) = *(_OWORD *)&v66[8];
  *(void *)(a1 + 632) = 0xC08F400000000000;
  *(_OWORD *)(a1 + 640) = *(_OWORD *)&v64[8];
  *(_OWORD *)(a1 + 688) = v67;
  *(void *)(a1 + 760) = 0xC08F400000000000;
  *(_OWORD *)(a1 + 768) = *(_OWORD *)&v64[8];
  *(_OWORD *)(a1 + 816) = *(_OWORD *)&v68[8];
  *(void *)(a1 + 888) = 0xC08F400000000000;
  *(void *)(a1 + 912) = v21;
  *(_OWORD *)(a1 + 896) = *(_OWORD *)&v64[8];
  long long v23 = *(_OWORD *)&v66[8];
  *(void *)(a1 + 936) = v20;
  *(_OWORD *)(a1 + 920) = v23;
  *(void *)(a1 + 960) = v22;
  *(_OWORD *)(a1 + 944) = v10;
  *(void *)(a1 + 1016) = 0xC08F400000000000;
  if (a2 < 1) {
    return 8;
  }
  int v24 = 0;
  float v25 = (double *)(a1 + 32);
  uint64_t v26 = a1 + 192;
  uint64_t result = 8;
  do
  {
    if ((int)result >= 1)
    {
      uint64_t v28 = result;
      uint64_t v29 = v26 + ((unint64_t)result << 7);
      uint64_t result = (4 * result);
      double v30 = v25;
      do
      {
        double v31 = *(v30 - 4);
        double v32 = *(v30 - 1);
        double v33 = (v31 + v32) * 0.5;
        double v34 = *(v30 - 3);
        double v35 = *(v30 - 2);
        double v36 = v30[1];
        double v37 = (v34 + *v30) * 0.5;
        double v38 = (v35 + v36) * 0.5;
        double v39 = sqrt(v37 * v37 + v33 * v33 + v38 * v38);
        double v40 = 0.0;
        double v41 = 0.0;
        double v42 = 0.0;
        double v43 = 0.0;
        if (v39 != 0.0)
        {
          double v41 = v33 / v39;
          double v42 = v37 / v39;
          double v43 = v38 / v39;
        }
        double v44 = v30[2];
        double v45 = (v32 + v44) * 0.5;
        double v46 = v30[3];
        double v47 = v30[4];
        double v48 = (*v30 + v46) * 0.5;
        double v49 = (v36 + v47) * 0.5;
        double v50 = sqrt(v48 * v48 + v45 * v45 + v49 * v49);
        double v51 = 0.0;
        double v52 = 0.0;
        if (v50 != 0.0)
        {
          double v40 = v45 / v50;
          double v51 = v48 / v50;
          double v52 = v49 / v50;
        }
        double v53 = (v31 + v44) * 0.5;
        double v54 = (v34 + v46) * 0.5;
        double v55 = (v35 + v47) * 0.5;
        double v56 = sqrt(v54 * v54 + v53 * v53 + v55 * v55);
        if (v56 == 0.0)
        {
          double v57 = 0.0;
          double v58 = 0.0;
          double v59 = 0.0;
        }
        else
        {
          double v57 = v53 / v56;
          double v58 = v54 / v56;
          double v59 = v55 / v56;
        }
        long long v60 = *((_OWORD *)v30 - 2);
        *(double *)(v29 - 176) = *(v30 - 2);
        *(_OWORD *)(v29 - 192) = v60;
        *(double *)(v29 - 168) = v41;
        *(double *)(v29 - 160) = v42;
        *(double *)(v29 - 152) = v43;
        *(double *)(v29 - 144) = v57;
        *(double *)(v29 - 136) = v58;
        *(double *)(v29 - 128) = v59;
        *(void *)(v29 - 72) = 0xC08F400000000000;
        *(double *)(v29 - 64) = v41;
        *(double *)(v29 - 56) = v42;
        *(double *)(v29 - 48) = v43;
        long long v61 = *(_OWORD *)(v30 - 1);
        *(double *)(v29 - 24) = v30[1];
        *(_OWORD *)(v29 - 40) = v61;
        *(double *)(v29 - 16) = v40;
        *(double *)(v29 - 8) = v51;
        *(double *)uint64_t v29 = v52;
        *(void *)(v29 + 56) = 0xC08F400000000000;
        *(double *)(v29 + 64) = v40;
        *(double *)(v29 + 72) = v51;
        *(double *)(v29 + 80) = v52;
        long long v62 = *((_OWORD *)v30 + 1);
        *(double *)(v29 + 104) = v30[4];
        *(_OWORD *)(v29 + 88) = v62;
        *(double *)(v29 + 112) = v57;
        *(double *)(v29 + 120) = v58;
        *(double *)(v29 + 128) = v59;
        *(void *)(v29 + 184) = 0xC08F400000000000;
        *(v30 - 4) = v41;
        *(v30 - 3) = v42;
        *(v30 - 2) = v43;
        *(v30 - 1) = v40;
        *double v30 = v51;
        v30[1] = v52;
        v30[2] = v57;
        v30[3] = v58;
        v30[4] = v59;
        v30 += 16;
        v29 += 384;
        --v28;
      }
      while (v28);
    }
    ++v24;
  }
  while (v24 != a2);
  return result;
}

uint64_t sub_37D54(uint64_t result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    uint64_t v4 = a2;
    do
    {
      printf("Thickness[.0015], Line[{");
      for (uint64_t i = 0; i != 72; i += 24)
        printf("{%f, %f, %f}, ", *(double *)(v2 + ((unint64_t)(v3 & 0xFFFFFFF) << 7) + i), *(double *)(v2 + ((unint64_t)(v3 & 0xFFFFFFF) << 7) + i + 8), *(double *)(v2 + ((unint64_t)(v3 & 0xFFFFFFF) << 7) + i + 16));
      printf("{%f, %f, %f} ", *(double *)(v2 + 8 * (16 * v3)), *(double *)(v2 + 8 * (16 * v3) + 8), *(double *)(v2 + 8 * (16 * v3) + 16));
      printf(" }], ");
      ++v3;
    }
    while (v3 != v4);
    uint64_t v6 = 0;
    long long v7 = (double *)(v2 + 32);
    do
    {
      uint64_t result = printf(" Text[%d, {%f,%f,%f}],", v6++, (*(v7 - 4) + *(v7 - 1) + v7[2]) / 3.0, (*(v7 - 3) + *v7 + v7[3]) / 3.0, (*(v7 - 2) + v7[1] + v7[4]) / 3.0);
      v7 += 16;
    }
    while (v4 != v6);
  }
  return result;
}

uint64_t sub_37EB8(uint64_t a1, int a2, float a3, float a4)
{
  LODWORD(v6) = a2;
  puts("\n");
  if ((int)v6 >= 1)
  {
    double v8 = a4;
    double v9 = a3;
    uint64_t v6 = v6;
    long long v10 = (void *)(a1 + 112);
    do
    {
      long long v11 = *((_OWORD *)v10 - 1);
      double v12 = *(double *)v10;
      v10 += 16;
      printf("PointSize[%4.2f], Hue[%3.2f], Point[{%f, %f, %f}],", v8, v9, *(double *)&v11, *((double *)&v11 + 1), v12);
      --v6;
    }
    while (v6);
  }

  return puts("\n");
}

float sub_37F64(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = a2;
    uint64_t v4 = (float *)(a3 + 8);
    long long v5 = (double *)(a1 + 112);
    do
    {
      *((float32x2_t *)v4 - 1) = vcvt_f32_f64(*(float64x2_t *)(v5 - 2));
      double v6 = *v5;
      v5 += 16;
      float result = v6;
      float *v4 = result;
      v4 += 3;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_37F9C(uint64_t result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (double *)(result + 48);
    do
    {
      double v4 = *(v3 - 6);
      double v5 = *(v3 - 5);
      double v6 = *(v3 - 4);
      double v7 = *(v3 - 3) - v4;
      double v8 = *v3 - v4;
      double v9 = *(v3 - 2) - v5;
      double v10 = v3[1] - v5;
      double v11 = *(v3 - 1) - v6;
      double v12 = v3[2] - v6;
      double v13 = v9 * v12 - v10 * v11;
      double v14 = v8 * v11 - v7 * v12;
      double v15 = v7 * v10 - v8 * v9;
      double v16 = 1.0 / sqrt(v14 * v14 + v13 * v13 + v15 * v15);
      v3[3] = v13 * v16;
      v3[4] = v14 * v16;
      v3[5] = v15 * v16;
      v3 += 16;
      --v2;
    }
    while (v2);
  }
  return result;
}

double sub_3802C(uint64_t a1, int a2)
{
  if (a2 < 1)
  {
    double v6 = 0.0;
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v3 = (double *)(a1 + 112);
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    do
    {
      double v6 = v6 + *(v3 - 2);
      double v5 = v5 + *(v3 - 1);
      double v7 = *v3;
      v3 += 16;
      double v4 = v4 + v7;
      --v2;
    }
    while (v2);
  }
  return v6 / (double)a2;
}

uint64_t sub_38088(uint64_t result, int a2, double a3, double a4, double a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    double v6 = (double *)(result + 120);
    do
    {
      double v7 = a4 * *(v6 - 5) + *(v6 - 6) * a3 + *(v6 - 4) * a5;
      if (*v6 == -1000.0 || v7 > *v6)
      {
        *(v6 - 1) = a5;
        double *v6 = v7;
        *(v6 - 3) = a3;
        *(v6 - 2) = a4;
      }
      v6 += 16;
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_380E0(uint64_t a1, int a2)
{
  double v4 = sub_3802C(a1, a2);
  if (a2 >= 1)
  {
    double v7 = v4;
    double v8 = v5;
    double v9 = v6;
    uint64_t v10 = 0;
    do
    {
      sub_38088(a1, a2, v7 + *(double *)(a1 + v10 + 96) - v7, v8 + *(double *)(a1 + v10 + 104) - v8, v9 + *(double *)(a1 + v10 + 112) - v9);
      v10 += 128;
    }
    while ((unint64_t)a2 << 7 != v10);
  }
}

double sub_38178(uint64_t a1, int a2, double result)
{
  if (a2 >= 1)
  {
    float result = *(float *)&result;
    uint64_t v3 = a2;
    float64x2_t v4 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&result, 0);
    double v5 = (double *)(a1 + 120);
    do
    {
      double v6 = *v5 + result;
      double v7 = *(v5 - 1) + *(v5 - 4) * result;
      *(float64x2_t *)(v5 - 3) = vmlaq_f64(*(float64x2_t *)(v5 - 3), v4, *(float64x2_t *)(v5 - 6));
      *(v5 - 1) = v7;
      *double v5 = v6;
      v5 += 16;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_381C8(uint64_t result, int a2, float a3)
{
  if (a2 >= 1)
  {
    double v3 = a3;
    uint64_t v4 = a2;
    double v5 = (double *)(result + 120);
    do
    {
      *double v5 = *v5 + v3;
      v5 += 16;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_381F4(uint64_t result, int a2, float a3)
{
  if (a2 >= 1)
  {
    double v3 = a3;
    uint64_t v4 = a2;
    double v5 = (double *)(result + 120);
    do
    {
      *double v5 = *v5 - v3;
      v5 += 16;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_38220(uint64_t a1, int a2, double a3, double a4, double a5)
{
  if (a2 < 1) {
    return 1;
  }
  uint64_t v5 = a2;
  for (uint64_t i = (double *)(a1 + 72); a4 * i[1] + *i * a3 + i[2] * a5 < i[6]; i += 16)
  {
    if (!--v5) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_3826C(uint64_t a1, int a2)
{
  putchar(123);
  uint64_t v4 = 0;
  uint64_t v5 = a1 + 128 * a2;
  do
  {
    printf("{%f, %f, %f},", *(double *)(v5 + v4), *(double *)(v5 + v4 + 8), *(double *)(v5 + v4 + 16));
    v4 += 24;
  }
  while (v4 != 96);

  return puts(" } ");
}

uint64_t sub_382FC(uint64_t a1, int a2)
{
  putchar(123);
  uint64_t v4 = 0;
  uint64_t v5 = a1 + 128 * a2;
  do
  {
    printf("{%f, %f, %f},", *(double *)(v5 + v4), *(double *)(v5 + v4 + 8), *(double *)(v5 + v4 + 16));
    v4 += 24;
  }
  while (v4 != 72);

  return puts(" } ");
}

uint64_t sub_3838C(unsigned int a1)
{
  for (int i = 7; i != -1; --i)
    putchar((a1 >> i) & 1 | 0x30);

  return putchar(32);
}

float sub_383E0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = 0;
  long long v6 = xmmword_56530;
  uint64_t v7 = a2;
  uint64_t v8 = -a2;
  uint64_t v9 = a2 + 1;
  uint64_t v10 = 1 - a2;
  uint64_t v11 = ~a2;
  uint64_t v12 = a2 - 1;
  float v4 = 0.0;
  do
  {
    if ((*(unsigned char *)(a1 + *(void *)((char *)&v6 + v3)) & a3) != 0) {
      float v4 = v4 + 1.0;
    }
    v3 += 8;
  }
  while (v3 != 64);
  return v4 * 0.125;
}

float sub_38490(float *a1, float *a2)
{
  return (float)(a1[1] * a2[1]) + (float)(*a1 * *a2);
}

float sub_384A4(float *a1, float *a2)
{
  return (float)((float)(a1[1] * a2[1]) + (float)(*a1 * *a2)) + (float)(a1[2] * a2[2]);
}

double sub_384C4(uint64_t a1, uint64_t a2, float *a3, uint64_t a4, int a5, int a6)
{
  if (a5 < 1) {
    return 0.0;
  }
  uint64_t v6 = a5;
  uint64_t v7 = (_DWORD *)(a4 + 4);
  double result = 0.0;
  do
  {
    *(float *)&double result = *(float *)&result
                      + (float)((float)(*(float *)(a2 + 4 * *v7 * a6 + 4 * (int)*(v7 - 1)) * a3[1])
                              + (float)(*(float *)(a1 + 4 * *v7 * a6 + 4 * (int)*(v7 - 1)) * *a3));
    v7 += 2;
    --v6;
  }
  while (v6);
  return result;
}

void sub_3A9B0(id a1)
{
  id v1 = +[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_imToIPT(__sample im) \n { \n vec3 lms = im.r * vec3(0.3139902162, 0.15537240628, 0.01775238698) + \n im.g * vec3(0.63951293834, 0.75789446163, 0.1094420944) + \n im.b * vec3(0.04649754622, 0.08670141862, 0.87256922462); \n lms = sign(lms)*pow(abs(lms), vec3(0.43)); \n vec3 ipt = lms.r * vec3(0.4, 4.455, 0.8056) + \n lms.g * vec3(0.4, -4.851, 0.3572) + \n lms.b * vec3(0.2, 0.396,-1.1628); \n return vec4(ipt, im.a); \n } \n"];
  qword_8CF38 = (uint64_t)v1;

  [v1 setPerservesAlpha:1];
}

void sub_3AA3C(id a1)
{
  qword_8CF48 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_iptToHueChroma(__sample im) \n { \n vec4 ihc = im; \n float hue = atan(im.b, im.g); \n ihc.g = (hue/3.14159 + 1.0)/2.0; \n ihc.b = sqrt(im.g*im.g+im.b*im.b); \n ihc.a = 1.0; \n return ihc; \n } \n"];
}

void sub_3B0B4(id a1)
{
  CFStringRef v1 = (const __CFString *)CFPreferencesCopyAppValue(@"semdev_debug_overlay", @"com.apple.coremedia");
  if (!v1) {
    return;
  }
  CFStringRef v2 = v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFStringGetTypeID())
  {
    int IntValue = CFStringGetIntValue(v2);
    if (!IntValue)
    {
      int IntValue = 1;
      if (CFStringCompare(v2, @"true", 1uLL))
      {
        int IntValue = 1;
        if (CFStringCompare(v2, @"yes", 1uLL))
        {
          if (CFStringCompare(v2, @"false", 1uLL) && CFStringCompare(v2, @"no", 1uLL)) {
            CFStringCompare(v2, @"0", 1uLL);
          }
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    CFTypeID v5 = CFGetTypeID(v2);
    if (v5 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)v2, kCFNumberIntType, &valuePtr)) {
        int IntValue = valuePtr;
      }
      else {
        int IntValue = 0;
      }
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(v2);
      if (v6 != CFBooleanGetTypeID())
      {
LABEL_15:
        int IntValue = 0;
        goto LABEL_16;
      }
      int IntValue = CFEqual(v2, kCFBooleanTrue);
    }
  }
LABEL_16:
  unsigned int v7 = IntValue & ~(IntValue >> 31);
  if (v7 >= 2) {
    unsigned int v7 = 2;
  }
  dword_8C8A8 = v7;
  CFRelease(v2);
}

void sub_3B454(id a1)
{
  qword_8CF60 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_softExposure(__sample im) \n { \n float CGFloat y = dot(im.rgb, vec3(0.1, 0.8, .1)); \n float g = -0.2664*y*y + 1.2695*y; \n im.rgb = (y > 0.0) ? im.rgb/y*g : vec3(0.0); \n return im; \n }"];
}

void sub_3C53C(id a1)
{
  qword_8CF70 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_foodVignette(__sample im, __sample vig, vec2 xy1, vec4 abc1) \n { \n float dCGFloat x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, .4, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))); \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_3C5B4(id a1)
{
  qword_8CF80 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyFoodVignette(__sample im, __sample orig, __sample vig, float amt) \n { \n im.rgb = mix(.9*orig.rgb, im.rgb, amt*vig.rgb) ;\n return im; \n }"];
}

void sub_3D7A4(id a1)
{
  id v1 = +[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_highKey(__sample im, float str) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0) - 1.0; \n im = clamp(im, 0.0, 1.0); \n vec4 im2 = 1.0-((im-1.0)*(im-1.0)); \n im2 = sqrt(im2); \n float y = dot(im.rgb, vec3(.333333)); \n float y2 = sqrt(1.0-(y-1.0)*(y-1.0)); \n y2 = mix(y2, smoothstep(0.0, 1.0, y2), 0.5); \n vec4 im3 = (y>0) ? im*y2/y : vec4(0.0, 0.0, 0.0, 1.0) ; \n im3 = mix(im3, im2, .7*sqrt(y2)); \n im3 = mix(im, im3, sqrt(y)) ; \n im.rgb = mix(im.rgb, im3.rgb, str) + pos + neg; \n return im; } \n"];
  qword_8CF90 = (uint64_t)v1;

  [v1 setPerservesAlpha:1];
}

id sub_3D908(void *a1, uint64_t a2, double a3)
{
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix", a3 forKey];
  CFTypeID v6 = +[NSString stringWithFormat:@"%@.%@", a2, @"suffix"];

  return [a1 encodeDouble:v6 forKey:a3];
}

id sub_3D9B0(void *a1, uint64_t a2, double a3, double a4)
{
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix", a3 forKey];
  unsigned int v7 = +[NSString stringWithFormat:@"%@.%@", a2, @"suffix"];

  return [a1 encodeDouble:v7 forKey:a4];
}

id sub_3DA5C(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix", a3 forKey];
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix", a4 forKey];
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix", a5 forKey];
  uint64_t v11 = +[NSString stringWithFormat:@"%@.%@", a2, @"suffix"];

  return [a1 encodeDouble:v11 forKey:a6];
}

id sub_3DB58(void *a1, double *a2, uint64_t a3)
{
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a3, @"suffix", *a2 forKey];
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a3, @"suffix", a2[1] forKey];
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a3, @"suffix", a2[2] forKey];
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a3, @"suffix", a2[3] forKey];
  [a1 encodeDouble:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a3, @"suffix", a2[4] forKey];
  double v6 = a2[5];
  unsigned int v7 = +[NSString stringWithFormat:@"%@.%@", a3, @"suffix"];

  return [a1 encodeDouble:v7 forKey:v6];
}

double sub_3DC98(void *a1, uint64_t a2)
{
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  double v5 = v4;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  return v5;
}

double sub_3DD34(void *a1, uint64_t a2)
{
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  double v5 = v4;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  return v5;
}

id sub_3DE20@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  *(void *)a3 = v6;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  *(void *)(a3 + 8) = v7;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  *(void *)(a3 + 16) = v8;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  *(void *)(a3 + 24) = v9;
  [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  *(void *)(a3 + 32) = v10;
  id result = [a1 decodeDoubleForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", a2, @"suffix"];
  *(void *)(a3 + 40) = v12;
  return result;
}

NSValue *sub_3DF40(double a1, double a2)
{
  *(double *)CFTypeID v3 = a1;
  *(double *)&v3[1] = a2;
  return +[NSValue valueWithBytes:v3 objCType:"{CGPoint=dd}"];
}

NSValue *sub_3DF78(double a1, double a2)
{
  *(double *)CFTypeID v3 = a1;
  *(double *)&v3[1] = a2;
  return +[NSValue valueWithBytes:v3 objCType:"{CGSize=dd}"];
}

NSValue *sub_3DFB0(double a1, double a2, double a3, double a4)
{
  *(double *)double v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&void v5[3] = a4;
  return +[NSValue valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

NSValue *sub_3DFEC(uint64_t a1)
{
  return +[NSValue valueWithBytes:a1 objCType:"{CGAffineTransform=dddddd}"];
}

double sub_3E004(void *a1)
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return *(double *)v2;
}

double sub_3E030(void *a1)
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2];
  return *(double *)v2;
}

id sub_3E064@<X0>(void *a1@<X0>, _OWORD *x8_0@<X8>)
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0];
}

id sub_3E078(uint64_t a1, uint64_t a2)
{
  return +[NSKeyedUnarchiver unarchivedObjectOfClass:a1 fromData:a2 error:0];
}

id sub_3E090(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = self;
  uint64_t v2 = self;
  uint64_t v3 = self;
  uint64_t v4 = self;
  uint64_t v5 = self;
  uint64_t v6 = self;
  uint64_t v7 = self;
  uint64_t v8 = self;
  uint64_t v9 = self;
  uint64_t v10 = self;
  uint64_t v11 = self;
  uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, self, a1, 0);

  return +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:a2 error:0];
}

id sub_3E1EC(uint64_t a1)
{
  return +[NSKeyedArchiver archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
}

void sub_3E488(id a1)
{
  qword_8CFA0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_portraitConvertToGrayscale (__sample c) __attribute__((outputFormat(kCIFormatRh))) {\n  float g = dot(c.rgb, vec3(0.333333));\n  return vec4(g, 0.0, 0.0, 1.0);\n}"];
}

void sub_3E500(id a1)
{
  qword_8CFB0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_portraitLocalContrast(__sample im, __sample shc, float amt)\n {\n float midAmt = amt;\n vec3 neg = min(im.rgb, 0.0);\n vec3 pos = max(im.rgb, 1.0)-1.0;\n im.rgb = clamp(im.rgb, 0.0, 1.0);\n float y = dot(im.rgb, vec3(0.3333));\n y = sqrt(y);\n y = y*(1.0-y);\n im.rgb = sqrt(im.rgb);\n float pivot = sqrt(shc.r);\n float a = midAmt*y;\n float b = -pivot*a;\n vec3 piCGFloat x = im.r * vec3(0.299*a) +\n im.g * vec3(0.587*a) +\n im.b * vec3(0.114*a) +\n im.rgb + vec3(b);\n im.rgb = mix(im.rgb, vec3(pivot), -y*midAmt);\n im.rgb = mix(im.rgb, pix, 0.8);\n im.rgb = max(im.rgb, 0.0);\n im.rgb *= im.rgb;\n im.rgb = im.rgb + neg + pos;\n return im;\n }\n"];
}

vImage_Error sub_3E980(void *a1)
{
  [a1 extent];
  vImage_Error result = CGRectIsInfinite(v23);
  if ((result & 1) == 0)
  {
    [a1 extent];
    double x = v24.origin.x;
    double y = v24.origin.y;
    double width = v24.size.width;
    double height = v24.size.height;
    vImage_Error result = CGRectIsInfinite(v24);
    if ((result & 1) == 0)
    {
      id v7 = [a1 imageByClampingToExtent];
      uint64_t v21 = kCIInputExtentKey;
      uint64_t v22 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, width, height);
      id v8 = objc_msgSend(objc_msgSend(v7, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1)), "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0);
      CIContextOption v18 = kCIContextWorkingFormat;
      uint64_t v9 = kCIFormatRGBAh;
      uint64_t v19 = +[NSNumber numberWithInt:kCIFormatRGBAh];
      uint64_t v10 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1]);
      uint64_t v17 = 0;
      [v8 extent];
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v8, &v17, 8, v9, [(CIContext *)v10 workingColorSpace], v11, v12, v13, v14);
      *(_OWORD *)&src.double height = xmmword_56000;
      src.rowBytes = 8;
      v15.data = &v20;
      *(_OWORD *)&v15.double height = xmmword_56000;
      v15.rowBytes = 16;
      src.data = &v17;
      return vImageConvert_Planar16FtoPlanarF(&src, &v15, 0);
    }
  }
  return result;
}

id sub_3EB88(void *a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  memset(&v17, 0, sizeof(v17));
  [a1 extent];
  CGFloat v13 = v12;
  [a1 extent];
  CGAffineTransformMakeScale(&v17, v13, v14);
  CGAffineTransform v16 = v17;
  v18.origin.double x = a3;
  v18.origin.double y = a4;
  v18.size.double width = a5;
  v18.size.double height = a6;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v16);
  return objc_msgSend(objc_msgSend(a1, "imageByCroppingToRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height), "writeToTIFF:", a2);
}

void sub_3F8F0(id a1)
{
  qword_8CFC0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_whitenteeth(__sample pix, __sample mask, float amt) \n { \n float m = mask.g; \n vec4 modifiedPidouble x = pow(clamp(pix,0.0, 1.0), vec4(.35)); \n modifiedPix.b += .1; \n modifiedPidouble x = modifiedPix * modifiedPix; \n modifiedPix.rgb = compare(vec3(m - .8), modifiedPix.rgb, pix.rgb); \n vec4 displayPidouble x = clamp(modifiedPix,0.0, 1.0); \n displayPix.a = 1.0; \n displayPix.rgb = mix(pix.rgb, displayPix.rgb, max(m, 0.0)); \n displayPix.a = pix.a; \n return mix(pix, displayPix, amt); \n } \n"];
}

void sub_3F968(id a1)
{
  qword_8CFD0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_enrich (__sample s, float amt,vec4 params) { \n vec4 orig = s; \n s = clamp(s, 0.0, 1.0); \n float x0 = params.r; \n float x1 = params.g; \n float delta = params.b; \n float pwr = params.a; \n s = pow( s, vec4(pwr)); \n float x2 = 1.0 - delta; \n float m1 = 0.5/(x1-x0); \n float b1 = - m1 * x0; \n float m2 = (.5 - delta)/(x2 - x1); \n float b2 = (m1-m2) * x1 + b1; \n vec4 w = (1.0 - step(x1, s)) * (vec4(m1)*s + vec4(b1)) + step(x1, s) * (vec4(m2)*s + vec4(b2)) + step(x2,s) *(s - (vec4(m2)*s + vec4(b2))) ; \n w.rgb = clamp(w.rgb, 0.0, 1.0); \n x0+= .02; \n x1+= .0005; \n m1 = 0.5/(x1-x0); \n b1 = - m1 * x0; \n m2 = (.5 - delta)/(x2 - x1); \n b2 = (m1-m2) * x1 + b1; \n w.r = (1.0 - step(x1, s.r)) * ((m1)*s.r + (b1)) + step(x1, s.r) * ((m2)*s.r + (b2)) + step(x2,s.r) *(s.r - ((m2)*s.r + (b2))) ; \n w.r = clamp(w.r, 0.0, 1.0); \n x0-= .01; \n x1+= .000; \n m1 = 0.5/(x1-x0); \n b1 = - m1 * x0; \n m2 = (.5 - delta)/(x2 - x1); \n b2 = (m1-m2) * x1 + b1; \n w.b = (1.0 - step(x1, s.b)) * ((m1)*s.b + (b1)) + step(x1, s.b) * ((m2)*s.b + (b2)) + step(x2,s.b) *(s.b - ((m2)*s.b + (b2))) ; \n w.b = clamp(w.b, 0.0, 1.0); \n w.rgb = w.rgb * w.rgb; \n w.r = pow(w.r, .75); \n w = mix(orig, w, vec4(amt)); w.a = 1.0; \n return w; \n } \n"];
}

void sub_3F9E0(id a1)
{
  qword_8CFE0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_eyeBrightenSoftlight (__sample uCb, __sample m, float str) \n { \n float g = .75*(1.0-dot(uCb.rgb, vec3(.333333))); \n vec4 uCf = vec4(g, g, g, 1.0); \n vec4 D = compare(uCb-0.25, ((16.0*uCb-12.0)*uCb+4.0)*uCb, sqrt(uCb)); \n vec4 Ct = clamp(uCb + (2.0*uCf-1.0) * compare(uCf - 0.5, uCb*(1.0-uCb), D-uCb), 0.0, 1.0); \n vec4 bright = Ct; \n uCf.rgb = mix(uCb.rgb, bright.rgb, m.r); \n uCf.rgb = mix(uCb.rgb, uCf.rgb, str); \n return uCf; \n }"];
}

void sub_3FA58(id a1)
{
  qword_8CFF0 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_mixKernel1 (__sample c, __sample b, float m) \n { \n c.rgb = mix(c.rgb, b.rgb, m); \n return c; \n }"];
}

void sub_3FAD0(id a1)
{
  qword_8D000 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_textureDiff (__sample c, __sample b) \n { \n c.rgb = c.rgb - b.rgb; \n return c; \n }"];
}

void sub_3FB48(id a1)
{
  qword_8D010 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_textureAdd (__sample c, __sample b, float scale) \n { \n c.rgb = c.rgb + scale*b.rgb; \n return c; \n }"];
}

void sub_40F78(id a1)
{
  id v1 = getenv("CI_USE_OLD_FACE_MASK");
  if (v1) {
    int v2 = atoi(v1);
  }
  else {
    int v2 = byte_8C8D0;
  }
  byte_8C8D0 = v2 != 0;
}

void sub_416F8(id a1)
{
  qword_8D028 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareDepth (__sample c, float m) \n { \n c.r = smoothstep(m, 0.7, 2.0*c.r); \n return c.rrra; \n }"];
}

void sub_41770(id a1)
{
  qword_8D038 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_mixKernel2 (__sample c, __sample b, float m) \n { \n c.rgb = mix(c.rgb, b.rgb, m); \n return c; \n }"];
}

void sub_426C8(id a1)
{
  qword_8D048 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareDepth2 (__sample c, float m) \n { \n c.r = smoothstep(0.0, m, 2.0*c.r); \n return vec4(vec3(c.r), 1.0); \n }"];
}

void sub_42740(id a1)
{
  qword_8D058 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_mixKernel3 (__sample c, __sample b, float m) \n { \n c.rgb = mix(c.rgb, b.rgb, m); \n c.a = b.a; return c; \n }"];
}

void sub_427B8(id a1)
{
  qword_8D068 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_blendSingleChannelMask (__sample c, __sample b, __sample m) \n { \n c.rgb = mix(c.rgb, b.rgb, m.r); \n return c; \n }"];
}

void sub_42830(id a1)
{
  qword_8D078 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceVignetteContour(__sample im, __sample vig, vec2 xy1, vec4 abc1) \n { \n float ddouble x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, .4, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))); \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_428A8(id a1)
{
  qword_8D088 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyVignetteContour(__sample im, __sample vig, float amt) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = mix(im.rgb, pow(im.rgb, vec3(2.0)), (1.0-.6*vig.rgb)*.1); \n im.rgb = mix(im.rgb, im.rgb*(vig.rgb), .1) + pos + neg; \n return im; \n }"];
}

void sub_454CC(id a1)
{
  qword_8D098 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareBlackDisparity (__sample dm, const float thresh) \n { \n float g = 1.0-smoothstep(0.0, thresh, 4.0*dm.r); \n return vec4(g,g,g, 1.0); \n }"];
}

void sub_45544(id a1)
{
  qword_8D0A8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_prepareBlackDepth (__sample dm, const float thresh) \n { \n float g = 1.0-smoothstep(0.0, thresh, 2.0*dm.r*dm.r); \n return vec4(g,g,g, 1.0); \n }"];
}

void sub_455BC(id a1)
{
  qword_8D0B8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyBlackDepth (__sample im, __sample dm, float g) \n { \n im.rgb *= pow(dm.r, g); \n return im; \n }"];
}

void sub_45634(id a1)
{
  qword_8D0C8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_refineBlackDepth (__sample im, __sample dm, __sample bm, __sample protect, vec3 g, __sample aft) \n { \n float b = smoothstep(0.0, 1.0, pow(dm.r*bm.r,g.r)+protect.r); \n im.rgb = max(im.rgb, 0.0); \n vec3 gamma = (g.b) > 0.0 ? vec3(1.0+g.g-g.g*b*b*dm.r) : vec3(1.0+g.g-g.g*b*b); \n im.rgb = pow(im.rgb, gamma); \n im.rgb = mix(vec3(0.0), im.rgb, b); \n gamma = vec3(1.35-.35*b*aft.r); \n im.rgb = pow(im.rgb, gamma); \n float r = im.r/(im.r+im.g+im.b+0.00001); \n float sat = max(min(1.0, (1.3-.9*r)), 0.0); \n float double y = dot(im.rgb, vec3(.3333333)); \n im.rgb = mix(sat*(im.rgb-y)+y, im.rgb, b*dm.r); \n return im; \n }"];
}

void sub_456AC(id a1)
{
  qword_8D0D8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceVignette1(__sample im, __sample vig, vec2 xy1, vec4 abc1) \n { \n float ddouble x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, .4, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_45724(id a1)
{
  qword_8D0E8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceProtect(__sample im, __sample vig, vec2 xy1, vec4 abc1, float feather) \n { \n float ddouble x = xy1.x-destCoord().x ; \n float dy = xy1.y-destCoord().y ; \n float s = smoothstep(0.0, feather, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n im.rgb = min(vig.rgb + vec3(s), 1.0); \n return im; \n }"];
}

void sub_4579C(id a1)
{
  qword_8D0F8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceAndBodyFill_1(__sample vig, vec2 xy1, vec4 abc1, vec2 fw, vec2 xy2) \n{ \n    vec2 dc = destCoord() ; \n    float ddouble x = xy1.x-dc.x ; \n    float dy = xy1.y-dc.y ; \n    float s = smoothstep(0.0, .15, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n    float t = .025*distance(vec2(dc.x, xy2.y), dc); \n    t = (fw.g*xy2.y < fw.g*dc.y) ? 0.0 : min(t, 1.0); \n    float u = clamp(fw.g*1.5*fw.r*dy/(dx*dx+0.0001), 0.0, 1.0); \n    vig.rgb = min(vig.rgb + vec3(s) + t + (u*u*u)+.2, 1.0); \n    return vig; \n}"];
}

void sub_45814(id a1)
{
  qword_8D108 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_faceAndBodyFill_6(__sample vig, vec2 xy1, vec4 abc1, vec2 fw, vec2 xy2) \n{ \n    vec2 dc = destCoord() ; \n    float ddouble x = xy1.x-dc.x ; \n    float dy = xy1.y-dc.y ; \n    float s = smoothstep(0.0, .15, exp(-(abc1.r*dx*dx +2.0*abc1.g*dx*dy +abc1.b*dy*dy))) ; \n    float t = .025*distance(vec2(xy2.x, dc.y), dc); \n    t = (fw.g*xy2.x > fw.g*dc.x) ? 0.0 : min(t, 1.0); \n    float u = clamp(-fw.g*1.5*fw.r*dx/(dy*dy+0.0001), 0.0, 1.0); \n    vig.rgb = min(vig.rgb + vec3(s) + t + (u*u*u)+.2, 1.0); \n    return vig; \n}"];
}

void sub_4588C(id a1)
{
  id v1 = +[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_applyVignette(__sample im, __sample vig, float amt) \n { \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = mix(im.rgb, im.rgb*(vig.rgb), amt); \n im.rgb = mix(im.rgb, im.rgb*im.rgb, (1.0-vig.rgb)*.3); \n return im; \n }"];
  qword_8D118 = (uint64_t)v1;

  [v1 setPerservesAlpha:1];
}

void sub_45918(id a1)
{
  qword_8D128 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_adaptiveNormalization2(__sample disparityImage, float dFocus, float e, float zRange, float zRangeScale, float thresholdOffset, float thresholdScale) \n { \n float d = disparityImage.r; \n float zCorrected = 1.0 / max(1e-1, (d - e)); \n float zFCorrected = thresholdScale / max(1e-1, (dFocus - e)) + thresholdOffset; \n float zEffRange = zRange + zRangeScale * zFCorrected; \n float v = smoothstep(zFCorrected - zEffRange, zFCorrected + zEffRange, zCorrected); \n return vec4(v, v, v, 1.0); \n } \n"];
}

void sub_45990(id a1)
{
  qword_8D138 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_adaptiveNormalizationGPU(__sample disparityImage, __sample offsets, float zRange, float zRangeScale, float thresholdOffset, float thresholdScale) \n { \n float d = disparityImage.r; \n float dFocus = offsets.r; \n float e = offsets.g; \n float zCorrected = 1.0 / max(1e-1, (d - e)); \n float zFCorrected = thresholdScale / max(1e-1, (dFocus - e)) + thresholdOffset; \n float zEffRange = zRange + zRangeScale * zFCorrected; \n float v = smoothstep(zFCorrected - zEffRange, zFCorrected + zEffRange, zCorrected); \n return vec4(v, v, v, 1.0); \n } \n"];
}

void sub_45A08(id a1)
{
  qword_8D148 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_adaptiveNormalizationAbsolute(__sample disparityImage, __sample offsets, float zRange, float zRangeScale, float thresholdOffset, float thresholdScale) \n { \n float d = disparityImage.r; \n float dFocus = offsets.r; \n float e = offsets.g; \n float zCorrected = 1.0 / max(1e-1, (d - e)); \n float zFCorrected = thresholdScale / max(1e-1, (dFocus - e)) + thresholdOffset; \n float zEffRange = zRange + zRangeScale * zFCorrected; \n float v = smoothstep(zFCorrected - zEffRange, zFCorrected + zEffRange, zCorrected); \n zFCorrected = thresholdScale / max(1e-1, (dFocus - e)) + .25*thresholdOffset ; \n zEffRange = zRange + zRangeScale * zFCorrected; \n float int v2 = smoothstep(zFCorrected - .04, zFCorrected + .04, zCorrected); \n v = (1.75*v + v2)/2.75; \n return vec4(v, v, v, 1.0); \n } \n"];
}

void sub_45A80(id a1)
{
  qword_8D158 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_invertRed(__sample rNormalized) __attribute__((outputFormat(kCIFormatRh))) \n { \n return vec4(1.0 - rNormalized.r, 0.0, 0.0, 1.0); \n } \n"];
}

void sub_45AF8(id a1)
{
  qword_8D168 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_blendDepth(__sample depth, __sample tightDepth, __sample im, __sample blur, __sample weight) \n{\n  float d = distance(im.rgb, blur.rgb); \n  float g = mix(tightDepth.r, depth.r, weight.r); \n  g += (d*weight.r*(1.0-dot(im.rgb, vec3(.333333)))); \n  g = clamp(g, 0.0, 1.0); \n  return vec4(g, g, g, 1.0); \n}\n"];
}

void sub_45B9C(_Unwind_Exception *a1)
{
}

void sub_45C24(_Unwind_Exception *a1)
{
}

id sub_461A8(void *a1)
{
  int v2 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:]([LightingFacePoints alloc], "initWithFaceLandmarkDictionary:forImageRect:", a1, 0.0, 0.0, 1.0, 1.0);
  [(LightingFacePoints *)v2 faceRect];

  if ([a1 objectForKeyedSubscript:@"faceJunkinessIndex"]) {
    objc_msgSend(objc_msgSend(a1, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
  }
  if ([a1 objectForKeyedSubscript:@"faceBoundingBox"]) {
    objc_msgSend(objc_msgSend(objc_msgSend(a1, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
  }
  id result = [a1 objectForKeyedSubscript:@"roll"];
  if (result) {
    return objc_msgSend(objc_msgSend(a1, "objectForKeyedSubscript:", @"roll"), "floatValue");
  }
  return result;
}

float sub_46318(void *a1)
{
  id v1 = [a1 depthData];
  float v2 = 1.6369;
  if (v1)
  {
    id v3 = [v1 cameraCalibrationData];
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 intrinsicMatrix];
      float v8 = v5;
      [v4 intrinsicMatrixReferenceDimensions];
      if (v6 > 0.0) {
        return v8 / v6;
      }
    }
  }
  return v2;
}

void sub_495E8(_Unwind_Exception *a1)
{
}

void sub_49628(id a1)
{
  id v1 = getenv("CI_GPU_OFFSET_CALCULATOR");
  if (v1) {
    int v2 = atoi(v1);
  }
  else {
    int v2 = byte_8C8D1;
  }
  byte_8C8D1 = v2 != 0;
}

void sub_49670(id a1)
{
  id v1 = getenv("CI_OVERRIDE_MAX_NUM_VERTICES");
  if (v1) {
    int v2 = atoi(v1);
  }
  else {
    int v2 = byte_8C8D2;
  }
  byte_8C8D2 = v2 != 0;
}

void sub_49B24(id a1)
{
  qword_8D1A8 = (uint64_t)+[CIColorKernel PFKernelWithString:@"float _computeZFromFaceRect(vec2 faceSize,float focalLengthNormalized, float marginError) \n{ \n  float kAverageFaceDiagonalBitragionBreadthMeters = 0.22f;  \n  float d = length(faceSize) * marginError; \n  return (kAverageFaceDiagonalBitragionBreadthMeters  * focalLengthNormalized) / d; \n} \nkernel vec4 _pf_disparityError(__sample s0,__sample s1,__sample s2,__sample s3, \n                            vec4 faceSizes01,vec4 faceSizes23, \n                            vec4 valid,vec4 params,float marginError,float doDisparityError, __sample focusDisparity) \n{\n   float kFaceDetectionRangeCloseMeters = params.x; \n   float kFaceDetectionRangeFarMeters   = params.y; \n   float faceGroupRange                 = params.z; \n    float focalLengthNormalized          = params.w; \n   float focusDisparityValue = focusDisparity.r; \n   float outDisparityOffsetError = 0.0; \n   vec4 faceAverageDisparities = vec4( s0.r, s1.r, s2.r, s3.r); \n   if (doDisparityError > 0.0) { \n      vec4 faceTrueZ = valid; \n      faceTrueZ.double x = valid.x > 0.0 ? _computeZFromFaceRect(faceSizes01.xy, focalLengthNormalized, marginError) : -1.0; \n      faceTrueZ.y = valid.y > 0.0 ? _computeZFromFaceRect(faceSizes01.zw, focalLengthNormalized, marginError) : -1.0; \n      faceTrueZ.z = valid.z > 0.0 ? _computeZFromFaceRect(faceSizes23.xy, focalLengthNormalized, marginError) : -1.0; \n      faceTrueZ.w = valid.w > 0.0 ? _computeZFromFaceRect(faceSizes23.zw, focalLengthNormalized, marginError) : -1.0; \n      vec4 faceTrueDisparity = vec4(1.0) / faceTrueZ; \n      BOOL R = valid.x > 0.0 && (faceTrueZ.r >= kFaceDetectionRangeCloseMeters) && (faceTrueZ.r <= kFaceDetectionRangeFarMeters); \n      BOOL G = valid.y > 0.0 && (faceTrueZ.g >= kFaceDetectionRangeCloseMeters) && (faceTrueZ.g <= kFaceDetectionRangeFarMeters); \n      BOOL B = valid.z > 0.0 && (faceTrueZ.b >= kFaceDetectionRangeCloseMeters) && (faceTrueZ.b <= kFaceDetectionRangeFarMeters); \n      BOOL A = valid.w > 0.0 && (faceTrueZ.a >= kFaceDetectionRangeCloseMeters) && (faceTrueZ.a <= kFaceDetectionRangeFarMeters); \n      vec4 e = compare( vec4(R, G, B, A) - vec4(0.01), vec4(0.0), faceAverageDisparities - faceTrueDisparity); \n      float eSum = e.r + e.g + e.b + e.a; \n      int countFacesForDisparityError = int(R) + int(G) + int(B) + int(A); \n      outDisparityOffsetError = countFacesForDisparityError > 0 ? eSum / float(countFacesForDisparityError) : 0.0; \n   } \n   float focusDepth = 1.0 / max(1e-1, (focusDisparityValue - outDisparityOffsetError)); \n   vec4 faceDepth   = vec4(1.0) / max( vec4(1e-1), faceAverageDisparities - vec4(outDisparityOffsetError)); \n   float faceDisparityFarBackground = 1000000.0; \n   BOOL haveIddouble x = false; \n   float depthPlusRange = focusDepth + faceGroupRange; \n   if (valid.x > 0.0 && faceDepth.x < depthPlusRange && faceAverageDisparities.x < faceDisparityFarBackground) { \n      faceDisparityFarBackground = faceAverageDisparities.x; \n      haveIddouble x = true; \n   } \n   if (valid.y > 0.0 && faceDepth.y < depthPlusRange && faceAverageDisparities.y < faceDisparityFarBackground) { \n      faceDisparityFarBackground = faceAverageDisparities.y; \n      haveIddouble x = true; \n   } \n   if (valid.z > 0.0 && faceDepth.z < depthPlusRange && faceAverageDisparities.z < faceDisparityFarBackground) { \n      faceDisparityFarBackground = faceAverageDisparities.z; \n      haveIddouble x = true; \n   } \n   if (valid.w > 0.0 && faceDepth.w < depthPlusRange && faceAverageDisparities.w < faceDisparityFarBackground) { \n      faceDisparityFarBackground = faceAverageDisparities.w; \n      haveIddouble x = true; \n   } \n   return vec4(haveIdx ? faceDisparityFarBackground : focusDisparityValue, outDisparityOffsetError, 0.0, 1.0); \n} \n"];
}

void sub_4AFF4()
{
  __assert_rtn("-[PFBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 577, "region.size.width == surfaceW");
}

void sub_4B020()
{
  __assert_rtn("-[PFBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 578, "region.size.height == surfaceH");
}

void sub_4B04C()
{
}

void sub_4B078()
{
  __assert_rtn("-[PFBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 588, "w <= surfaceW");
}

void sub_4B0A4()
{
  __assert_rtn("-[PFBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 589, "h <= surfaceH");
}

void sub_4B0D0()
{
  __assert_rtn("-[PFBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 557, "t == kCVPixelFormatType_32BGRA");
}

void sub_4B0FC()
{
}

void sub_4B128()
{
}

void sub_4B154()
{
}

void sub_4B180()
{
}

void sub_4B1AC()
{
}

void sub_4B1D8()
{
}

void sub_4B204()
{
}

void sub_4B230()
{
}

void sub_4B25C()
{
}

void sub_4B288()
{
}

void sub_4B2B4()
{
}

void sub_4B2E0()
{
}

void sub_4B30C()
{
}

void sub_4B338()
{
}

void sub_4B364()
{
}

void sub_4B390()
{
}

void sub_4B3BC()
{
}

void sub_4B3E8()
{
}

void sub_4B414()
{
}

void sub_4B440()
{
}

void sub_4B46C()
{
}

void sub_4B498()
{
}

void sub_4B4C4()
{
}

void sub_4B4F0()
{
}

void sub_4B51C()
{
}

void sub_4B548()
{
}

void sub_4B574()
{
}

void sub_4B5A0()
{
}

void sub_4B5CC()
{
}

void sub_4B5F8()
{
}

void sub_4B624()
{
}

void sub_4B650()
{
}

void sub_4B67C()
{
}

void sub_4B6A8()
{
}

void sub_4B6D4()
{
}

void sub_4B700()
{
}

void sub_4B72C()
{
}

void sub_4B758()
{
}

void sub_4B784()
{
}

void sub_4B7B0()
{
}

void sub_4B7DC()
{
}

void sub_4B808()
{
}

void sub_4B834()
{
}

void sub_4B860()
{
}

void sub_4B88C()
{
}

void sub_4B8B8()
{
}

void sub_4B8E4()
{
}

void sub_4B910()
{
}

void sub_4B93C()
{
}

void sub_4B968()
{
}

void sub_4B994()
{
}

void sub_4B9C0()
{
}

void sub_4B9EC()
{
  __assert_rtn("-[MetalFaceMask drawEyeMaskUsingQuads:OutputMaskTexture:OutputRegion:FaceBounds:CommandBuffer:]", "MetalFaceMask.m", 777, "eyeQuads->nQuads <= FACEMASK_MAX_NEYEQUADS");
}

void sub_4BA18()
{
}

void sub_4BA44()
{
}

void sub_4BA70()
{
}

void sub_4BA9C()
{
}

void sub_4BAC8()
{
}

void sub_4BAF4()
{
}

void sub_4BB20()
{
}

void sub_4BB4C()
{
  __assert_rtn("createCroppedPixelBufferRf", "PortraitFastBilateralSolver.m", 344, "input.format == kCIFormatRf");
}

void sub_4BB78()
{
  __assert_rtn("createCroppedPixelBufferRh", "PortraitFastBilateralSolver.m", 367, "input.format == kCIFormatRh");
}

void sub_4BBA4()
{
  __assert_rtn("createPixelBuffer", "PortraitFastBilateralSolver.m", 317, "p != nil && pixelFormat == CVPixelBufferGetPixelFormatType(p)");
}

void sub_4BBD0()
{
}

void sub_4BBFC()
{
}

void sub_4BC28()
{
}

void sub_4BC54()
{
}

void sub_4BC80()
{
}

void sub_4BCAC()
{
}

void sub_4BCD8()
{
}

void sub_4BD04()
{
}

void sub_4BD30()
{
}

void sub_4BD5C()
{
}

void sub_4BD88()
{
}

void sub_4BDB4()
{
}

void sub_4BDE0()
{
}

void sub_4BE0C()
{
}

void sub_4BE38()
{
}

void sub_4BE64()
{
}

void sub_4BE90()
{
}

void sub_4BEBC()
{
}

void sub_4BEE8()
{
}

void sub_4BF14()
{
}

void sub_4BF40()
{
}

void sub_4BF6C()
{
  __assert_rtn("-[CILLFilter outputImage]", "CIDynamicLocalLight.mm", 532, "inputImage != nil");
}

void sub_4BF98()
{
  __assert_rtn("-[CILLFilter outputImage]", "CIDynamicLocalLight.mm", 533, "guideImage != nil");
}

void sub_4BFC4()
{
  __assert_rtn("-[CILLFilter outputImage]", "CIDynamicLocalLight.mm", 535, "inputLocalLight != nil");
}

void sub_4BFF0()
{
}

void sub_4C01C()
{
}

void sub_4C048()
{
  __assert_rtn("_lightMapImageFromData_block_invoke", "CIDynamicLocalLight.mm", 186, "height == lmHeight");
}

void sub_4C074()
{
  __assert_rtn("_lightMapImageFromData_block_invoke", "CIDynamicLocalLight.mm", 185, "width == lmWidth");
}

void sub_4C0A0()
{
  __assert_rtn("_lightMapImageFromData_block_invoke", "CIDynamicLocalLight.mm", 184, "y == 0");
}

void sub_4C0CC()
{
  __assert_rtn("_lightMapImageFromData_block_invoke", "CIDynamicLocalLight.mm", 183, "x == 0");
}

void sub_4C0F8()
{
}

void sub_4C124()
{
}

void sub_4C150()
{
}

void sub_4C17C()
{
}

void sub_4C1A8()
{
  __assert_rtn("-[CIPortraitToothMask outputImage]", "CIPortraitToothMask.m", 102, "( imageExtentN.origin.x == 0) &&(imageExtentN.origin.y == 0)");
}

void sub_4C1D4()
{
}

void sub_4C200()
{
}

void sub_4C22C()
{
}

void sub_4C258()
{
}

void sub_4C284()
{
}

void sub_4C2B0()
{
}

void sub_4C2DC()
{
}

void sub_4C308()
{
}

void sub_4C334()
{
}

void sub_4C360()
{
}

void sub_4C38C()
{
}

void sub_4C3B8()
{
}

void sub_4C3E4()
{
}

void sub_4C410()
{
}

void sub_4C43C()
{
}

void sub_4C468()
{
  __assert_rtn("-[CPUFaceMask drawEyeMaskUsingQuads:OutputMask:OutputBytesPerRow:OutputRegion:]", "CPUFaceMask.m", 379, "eyeQuads->nQuads <= FACEMASK_MAX_NEYEQUADS");
}

void sub_4C494()
{
}

void sub_4C4C0()
{
  __assert_rtn("+[CIPortraitEffectSpillCorrectionProcessor processWithInputs:arguments:output:error:]", "CIPortraitEffectSpillCorrection.m", 179, "width == output.region.size.width && height == output.region.size.height");
}

void sub_4C4EC()
{
  __assert_rtn("+[CIPortraitEffectSpillCorrectionProcessor processWithInputs:arguments:output:error:]", "CIPortraitEffectSpillCorrection.m", 178, "width == inputs[1].region.size.width && height == inputs[1].region.size.height");
}

void sub_4C518()
{
}

void sub_4C544()
{
}

void sub_4C570()
{
  __assert_rtn("CPUFaceMask_Clear", "CPUFaceMask_algorithms.c", 160, "outputMaskBaseAddr != NULL");
}

void sub_4C59C()
{
  __assert_rtn("CPUFaceMask_Clear", "CPUFaceMask_algorithms.c", 165, "simd_all( length > 0) && simd_all( offset >= 0)");
}

void sub_4C5C8()
{
  __assert_rtn("CPUFaceMask_Clear", "CPUFaceMask_algorithms.c", 161, "( bounds.x >= region.x) &&(bounds.y >= region.y) &&(bounds.z <= region.z) &&(bounds.w <= region.w)");
}

void sub_4C5F4()
{
  __assert_rtn("CPUFaceMask_MinMax", "CPUFaceMask_algorithms.c", 193, "minMaxObj != NULL");
}

void sub_4C620()
{
  __assert_rtn("CPUFaceMask_MinMax", "CPUFaceMask_algorithms.c", 194, "inputBGRAImageBaseAddr != NULL");
}

void sub_4C64C()
{
  __assert_rtn("CPUFaceMask_MinMax", "CPUFaceMask_algorithms.c", 199, "simd_all( length > 0) && simd_all( offset >= 0)");
}

void sub_4C678()
{
  __assert_rtn("CPUFaceMask_MinMax", "CPUFaceMask_algorithms.c", 195, "( bounds.x >= region.x) &&(bounds.y >= region.y) &&(bounds.z <= region.z) &&(bounds.w <= region.w)");
}

void sub_4C6A4()
{
  __assert_rtn("CPUFaceMask_PopulateCube", "CPUFaceMask_algorithms.c", 263, "outputCube != NULL");
}

void sub_4C6D0()
{
  __assert_rtn("CPUFaceMask_PopulateCube", "CPUFaceMask_algorithms.c", 264, "inputBGRAImageBaseAddr != NULL");
}

void sub_4C6FC()
{
  __assert_rtn("CPUFaceMask_PopulateCube", "CPUFaceMask_algorithms.c", 269, "simd_all( length > 0) && simd_all( offset >= 0)");
}

void sub_4C728()
{
  __assert_rtn("CPUFaceMask_PopulateCube", "CPUFaceMask_algorithms.c", 265, "( bounds.x >= region.x) &&(bounds.y >= region.y) &&(bounds.z <= region.z) &&(bounds.w <= region.w)");
}

void sub_4C754()
{
  __assert_rtn("CPUFaceMask_GenerateMask", "CPUFaceMask_algorithms.c", 467, "spanTable != NULL");
}

void sub_4C780()
{
  __assert_rtn("CPUFaceMask_GenerateMask", "CPUFaceMask_algorithms.c", 468, "firstSpanInRows != NULL");
}

void sub_4C7AC()
{
  __assert_rtn("CPUFaceMask_GenerateMask", "CPUFaceMask_algorithms.c", 469, "inputCube != NULL");
}

void sub_4C7D8()
{
  __assert_rtn("CPUFaceMask_GenerateMask", "CPUFaceMask_algorithms.c", 470, "inputBGRAImageBaseAddr != NULL");
}

void sub_4C804()
{
  __assert_rtn("CPUFaceMask_GenerateMask", "CPUFaceMask_algorithms.c", 475, "simd_all( length > 0) && simd_all( offset >= 0)");
}

void sub_4C830()
{
  __assert_rtn("CPUFaceMask_GenerateMask", "CPUFaceMask_algorithms.c", 471, "( bounds.x >= region.x) &&(bounds.y >= region.y) &&(bounds.z <= region.z) &&(bounds.w <= region.w)");
}

void sub_4C85C()
{
  __assert_rtn("CPUFaceMask_GenerateToothMask", "CPUFaceMask_algorithms.c", 561, "spanTable != NULL");
}

void sub_4C888()
{
  __assert_rtn("CPUFaceMask_GenerateToothMask", "CPUFaceMask_algorithms.c", 562, "firstSpanInRows != NULL");
}

void sub_4C8B4()
{
  __assert_rtn("CPUFaceMask_GenerateToothMask", "CPUFaceMask_algorithms.c", 563, "inputBGRAImageBaseAddr != NULL");
}

void sub_4C8E0()
{
  __assert_rtn("CPUFaceMask_GenerateToothMask", "CPUFaceMask_algorithms.c", 568, "simd_all( length > 0) && simd_all( offset >= 0)");
}

void sub_4C90C()
{
  __assert_rtn("CPUFaceMask_GenerateToothMask", "CPUFaceMask_algorithms.c", 564, "( bounds.x >= region.x) &&(bounds.y >= region.y) &&(bounds.z <= region.z) &&(bounds.w <= region.w)");
}

void sub_4C938()
{
  __assert_rtn("CPUFaceMask_DrawSpans", "CPUFaceMask_algorithms.c", 806, "spanTable != NULL");
}

void sub_4C964()
{
  __assert_rtn("CPUFaceMask_DrawSpans", "CPUFaceMask_algorithms.c", 807, "firstSpanInRows != NULL");
}

void sub_4C990()
{
  __assert_rtn("CPUFaceMask_DrawSpans", "CPUFaceMask_algorithms.c", 808, "outputMaskBaseAddr != NULL");
}

void sub_4C9BC()
{
}

void sub_4C9E8()
{
  __assert_rtn("CPUFaceMask_DrawEye", "CPUFaceMask_algorithms.c", 860, "eyeQuads != NULL");
}

void sub_4CA14()
{
  __assert_rtn("CPUFaceMask_DrawEye", "CPUFaceMask_algorithms.c", 861, "outputMaskBaseAddr != NULL");
}

void sub_4CA40()
{
  __assert_rtn("CPUFaceMask_DrawEye", "CPUFaceMask_algorithms.c", 867, "simd_all( length > 0) && simd_all( offset >= 0)");
}

void sub_4CA6C()
{
  __assert_rtn("-[PFBilateralSolverGPU _setupPipelineCache]", "BilateralSolverGPU.m", 120, "[pipelineArray count] == COMPUTE_COUNT");
}

void sub_4CA98()
{
}

void sub_4CAC4()
{
  __assert_rtn("-[CIPortraitSkinMask outputImage]", "CIPortraitSkinMask.mm", 139, "( imageExtentN.origin.x == 0) &&(imageExtentN.origin.y == 0)");
}

void sub_4CAF0()
{
}

void sub_4CB1C()
{
}

void sub_4CB48()
{
}

void sub_4CB74()
{
}

void sub_4CBA0()
{
  __assert_rtn("+[CIPortraitSkinMaskProcessor processWithInputs:arguments:output:error:]", "CIPortraitSkinMask.mm", 367, "rightEyePoints.count == 8");
}

void sub_4CBCC()
{
  __assert_rtn("+[CIPortraitSkinMaskProcessor processWithInputs:arguments:output:error:]", "CIPortraitSkinMask.mm", 366, "leftEyePoints.count == 8");
}

void sub_4CBF8()
{
}

void sub_4CC24()
{
}

void sub_4CC50()
{
}

void sub_4CC7C()
{
}

void sub_4CCA8()
{
}

void sub_4CCD4()
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return _CGBitmapGetAlignedBytesPerRow();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return _CGPathContainsPoint(path, m, point, eoFill);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return _CGPathCreateCopy(path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  return _CGPathGetPathBoundingBox(path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

uint64_t CGRectIsIntegral()
{
  return _CGRectIsIntegral();
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBytesPerRow(buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return _IOSurfaceGetHeight(buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPixelFormat(buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return _IOSurfaceGetWidth(buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

NSRect NSIntegralRectWithOptions(NSRect aRect, NSAlignmentOptions opts)
{
  return _NSIntegralRectWithOptions(aRect, opts);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void abort(void)
{
}

float asinf(float a1)
{
  return _asinf(a1);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

float atanf(float a1)
{
  return _atanf(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

float expf(float a1)
{
  return _expf(a1);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

long double log(long double __x)
{
  return _log(__x);
}

long double log2(long double __x)
{
  return _log2(__x);
}

float log2f(float a1)
{
  return _log2f(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

uint64_t sgesv_NEWLAPACK()
{
  return _sgesv_NEWLAPACK();
}

long double sin(long double __x)
{
  return _sin(__x);
}

float sinf(float a1)
{
  return _sinf(a1);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return _vImageConvert_Planar16FtoPlanarF(src, dest, flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return _vImageConvert_PlanarFtoPlanar16F(src, dest, flags);
}

id objc_msgSend_Area(void *a1, const char *a2, ...)
{
  return [a1 Area];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_CalculateEdges(void *a1, const char *a2, ...)
{
  return [a1 CalculateEdges];
}

id objc_msgSend_CalculateFromVertices(void *a1, const char *a2, ...)
{
  return [a1 CalculateFromVertices];
}

id objc_msgSend_CalculateVertices(void *a1, const char *a2, ...)
{
  return [a1 CalculateVertices];
}

id objc_msgSend_Diameter(void *a1, const char *a2, ...)
{
  return [a1 Diameter];
}

id objc_msgSend_MinDiameter(void *a1, const char *a2, ...)
{
  return [a1 MinDiameter];
}

id objc_msgSend_PrintConstraints(void *a1, const char *a2, ...)
{
  return [a1 PrintConstraints];
}

id objc_msgSend_W(void *a1, const char *a2, ...)
{
  return [a1 W];
}

id objc_msgSend_X(void *a1, const char *a2, ...)
{
  return [a1 X];
}

id objc_msgSend_XCenter(void *a1, const char *a2, ...)
{
  return [a1 XCenter];
}

id objc_msgSend_Y(void *a1, const char *a2, ...)
{
  return [a1 Y];
}

id objc_msgSend_YCenter(void *a1, const char *a2, ...)
{
  return [a1 YCenter];
}

id objc_msgSend_Z(void *a1, const char *a2, ...)
{
  return [a1 Z];
}

id objc_msgSend__CIPrepareBlackDepth(void *a1, const char *a2, ...)
{
  return [a1 _CIPrepareBlackDepth];
}

id objc_msgSend__CIPrepareWhiteDepth(void *a1, const char *a2, ...)
{
  return [a1 _CIPrepareWhiteDepth];
}

id objc_msgSend__CIRefineBlackDepth(void *a1, const char *a2, ...)
{
  return [a1 _CIRefineBlackDepth];
}

id objc_msgSend__applyFaceProtect(void *a1, const char *a2, ...)
{
  return [a1 _applyFaceProtect];
}

id objc_msgSend__applyFaceProtectStudio(void *a1, const char *a2, ...)
{
  return [a1 _applyFaceProtectStudio];
}

id objc_msgSend__applyRefinedMatte(void *a1, const char *a2, ...)
{
  return [a1 _applyRefinedMatte];
}

id objc_msgSend__applyTransparentBorder(void *a1, const char *a2, ...)
{
  return [a1 _applyTransparentBorder];
}

id objc_msgSend__applyVignette(void *a1, const char *a2, ...)
{
  return [a1 _applyVignette];
}

id objc_msgSend__applyVignetteStage(void *a1, const char *a2, ...)
{
  return [a1 _applyVignetteStage];
}

id objc_msgSend__blendSingleChannelMask(void *a1, const char *a2, ...)
{
  return [a1 _blendSingleChannelMask];
}

id objc_msgSend__brightenFood(void *a1, const char *a2, ...)
{
  return [a1 _brightenFood];
}

id objc_msgSend__brightenSat(void *a1, const char *a2, ...)
{
  return [a1 _brightenSat];
}

id objc_msgSend__cheapEdgePreserve(void *a1, const char *a2, ...)
{
  return [a1 _cheapEdgePreserve];
}

id objc_msgSend__computeBlurIndices(void *a1, const char *a2, ...)
{
  return [a1 _computeBlurIndices];
}

id objc_msgSend__computeCoordIndices(void *a1, const char *a2, ...)
{
  return [a1 _computeCoordIndices];
}

id objc_msgSend__computeInterpIndices(void *a1, const char *a2, ...)
{
  return [a1 _computeInterpIndices];
}

id objc_msgSend__confidenceExtractRed(void *a1, const char *a2, ...)
{
  return [a1 _confidenceExtractRed];
}

id objc_msgSend__contourLightKernel(void *a1, const char *a2, ...)
{
  return [a1 _contourLightKernel];
}

id objc_msgSend__convertToGrayscale(void *a1, const char *a2, ...)
{
  return [a1 _convertToGrayscale];
}

id objc_msgSend__darken(void *a1, const char *a2, ...)
{
  return [a1 _darken];
}

id objc_msgSend__drawTriangle(void *a1, const char *a2, ...)
{
  return [a1 _drawTriangle];
}

id objc_msgSend__dualLightKernel(void *a1, const char *a2, ...)
{
  return [a1 _dualLightKernel];
}

id objc_msgSend__enrich(void *a1, const char *a2, ...)
{
  return [a1 _enrich];
}

id objc_msgSend__enrichV2(void *a1, const char *a2, ...)
{
  return [a1 _enrichV2];
}

id objc_msgSend__extractRed(void *a1, const char *a2, ...)
{
  return [a1 _extractRed];
}

id objc_msgSend__extractRedStudio(void *a1, const char *a2, ...)
{
  return [a1 _extractRedStudio];
}

id objc_msgSend__eyeBlurV2(void *a1, const char *a2, ...)
{
  return [a1 _eyeBlurV2];
}

id objc_msgSend__eyeBrightenSoftlight(void *a1, const char *a2, ...)
{
  return [a1 _eyeBrightenSoftlight];
}

id objc_msgSend__eyeBrightenV2(void *a1, const char *a2, ...)
{
  return [a1 _eyeBrightenV2];
}

id objc_msgSend__faceContourMask(void *a1, const char *a2, ...)
{
  return [a1 _faceContourMask];
}

id objc_msgSend__faceProtect(void *a1, const char *a2, ...)
{
  return [a1 _faceProtect];
}

id objc_msgSend__faceVignette(void *a1, const char *a2, ...)
{
  return [a1 _faceVignette];
}

id objc_msgSend__faceVignetteStudio(void *a1, const char *a2, ...)
{
  return [a1 _faceVignetteStudio];
}

id objc_msgSend__featherEdge(void *a1, const char *a2, ...)
{
  return [a1 _featherEdge];
}

id objc_msgSend__foodVignette(void *a1, const char *a2, ...)
{
  return [a1 _foodVignette];
}

id objc_msgSend__getRefinedMatte(void *a1, const char *a2, ...)
{
  return [a1 _getRefinedMatte];
}

id objc_msgSend__highKey(void *a1, const char *a2, ...)
{
  return [a1 _highKey];
}

id objc_msgSend__hueChromaToRect(void *a1, const char *a2, ...)
{
  return [a1 _hueChromaToRect];
}

id objc_msgSend__imageByRenderingToIntermediate(void *a1, const char *a2, ...)
{
  return [a1 _imageByRenderingToIntermediate];
}

id objc_msgSend__iptToSRGB(void *a1, const char *a2, ...)
{
  return [a1 _iptToSRGB];
}

id objc_msgSend__kernelLocalContrast(void *a1, const char *a2, ...)
{
  return [a1 _kernelLocalContrast];
}

id objc_msgSend__mixKernel(void *a1, const char *a2, ...)
{
  return [a1 _mixKernel];
}

id objc_msgSend__neckContourKernel(void *a1, const char *a2, ...)
{
  return [a1 _neckContourKernel];
}

id objc_msgSend__polyKernel(void *a1, const char *a2, ...)
{
  return [a1 _polyKernel];
}

id objc_msgSend__portraitSpotKernel(void *a1, const char *a2, ...)
{
  return [a1 _portraitSpotKernel];
}

id objc_msgSend__prepareDepth(void *a1, const char *a2, ...)
{
  return [a1 _prepareDepth];
}

id objc_msgSend__protectEyes(void *a1, const char *a2, ...)
{
  return [a1 _protectEyes];
}

id objc_msgSend__protectEyesNose(void *a1, const char *a2, ...)
{
  return [a1 _protectEyesNose];
}

id objc_msgSend__rectToHueChroma(void *a1, const char *a2, ...)
{
  return [a1 _rectToHueChroma];
}

id objc_msgSend__scaleHuePi(void *a1, const char *a2, ...)
{
  return [a1 _scaleHuePi];
}

id objc_msgSend__scaleHueZeroOne(void *a1, const char *a2, ...)
{
  return [a1 _scaleHueZeroOne];
}

id objc_msgSend__setupBuffer(void *a1, const char *a2, ...)
{
  return [a1 _setupBuffer];
}

id objc_msgSend__setupMetal(void *a1, const char *a2, ...)
{
  return [a1 _setupMetal];
}

id objc_msgSend__setupPipelineCache(void *a1, const char *a2, ...)
{
  return [a1 _setupPipelineCache];
}

id objc_msgSend__shadowKernel(void *a1, const char *a2, ...)
{
  return [a1 _shadowKernel];
}

id objc_msgSend__softExposure(void *a1, const char *a2, ...)
{
  return [a1 _softExposure];
}

id objc_msgSend__srgbToIPT(void *a1, const char *a2, ...)
{
  return [a1 _srgbToIPT];
}

id objc_msgSend__strobeKernel(void *a1, const char *a2, ...)
{
  return [a1 _strobeKernel];
}

id objc_msgSend__studioLightKernel(void *a1, const char *a2, ...)
{
  return [a1 _studioLightKernel];
}

id objc_msgSend__textureAdd(void *a1, const char *a2, ...)
{
  return [a1 _textureAdd];
}

id objc_msgSend__textureDiff(void *a1, const char *a2, ...)
{
  return [a1 _textureDiff];
}

id objc_msgSend__transparentBorder(void *a1, const char *a2, ...)
{
  return [a1 _transparentBorder];
}

id objc_msgSend__whitenTeeth(void *a1, const char *a2, ...)
{
  return [a1 _whitenTeeth];
}

id objc_msgSend_adaptiveNormalization2(void *a1, const char *a2, ...)
{
  return [a1 adaptiveNormalization2];
}

id objc_msgSend_adaptiveNormalizationAbsolute(void *a1, const char *a2, ...)
{
  return [a1 adaptiveNormalizationAbsolute];
}

id objc_msgSend_adaptiveNormalizationGPU(void *a1, const char *a2, ...)
{
  return [a1 adaptiveNormalizationGPU];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundPreviewCubeName(void *a1, const char *a2, ...)
{
  return [a1 backgroundPreviewCubeName];
}

id objc_msgSend_baseAddress(void *a1, const char *a2, ...)
{
  return [a1 baseAddress];
}

id objc_msgSend_betweenTheEyes(void *a1, const char *a2, ...)
{
  return [a1 betweenTheEyes];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blendDepth(void *a1, const char *a2, ...)
{
  return [a1 blendDepth];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_blue(void *a1, const char *a2, ...)
{
  return [a1 blue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottom(void *a1, const char *a2, ...)
{
  return [a1 bottom];
}

id objc_msgSend_bottomShadow(void *a1, const char *a2, ...)
{
  return [a1 bottomShadow];
}

id objc_msgSend_boundsFloatRect(void *a1, const char *a2, ...)
{
  return [a1 boundsFloatRect];
}

id objc_msgSend_boundsPath(void *a1, const char *a2, ...)
{
  return [a1 boundsPath];
}

id objc_msgSend_bridgeGapsLinear(void *a1, const char *a2, ...)
{
  return [a1 bridgeGapsLinear];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bytesPerRow];
}

id objc_msgSend_cameraCalibrationData(void *a1, const char *a2, ...)
{
  return [a1 cameraCalibrationData];
}

id objc_msgSend_centerChin(void *a1, const char *a2, ...)
{
  return [a1 centerChin];
}

id objc_msgSend_centerNose(void *a1, const char *a2, ...)
{
  return [a1 centerNose];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_colorSpace(void *a1, const char *a2, ...)
{
  return [a1 colorSpace];
}

id objc_msgSend_computeBand(void *a1, const char *a2, ...)
{
  return [a1 computeBand];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_convertToHalfFloat(void *a1, const char *a2, ...)
{
  return [a1 convertToHalfFloat];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreImageROIrect(void *a1, const char *a2, ...)
{
  return [a1 coreImageROIrect];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countDims(void *a1, const char *a2, ...)
{
  return [a1 countDims];
}

id objc_msgSend_countVertices(void *a1, const char *a2, ...)
{
  return [a1 countVertices];
}

id objc_msgSend_createWithCollapsedOrphans2(void *a1, const char *a2, ...)
{
  return [a1 createWithCollapsedOrphans2];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_denormalize(void *a1, const char *a2, ...)
{
  return [a1 denormalize];
}

id objc_msgSend_depthData(void *a1, const char *a2, ...)
{
  return [a1 depthData];
}

id objc_msgSend_depthDataAccuracy(void *a1, const char *a2, ...)
{
  return [a1 depthDataAccuracy];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_emptyImage(void *a1, const char *a2, ...)
{
  return [a1 emptyImage];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_extrapolateAndJoinTopAndBottom(void *a1, const char *a2, ...)
{
  return [a1 extrapolateAndJoinTopAndBottom];
}

id objc_msgSend_eyebrowLeftTopLine(void *a1, const char *a2, ...)
{
  return [a1 eyebrowLeftTopLine];
}

id objc_msgSend_eyebrowRightTopLine(void *a1, const char *a2, ...)
{
  return [a1 eyebrowRightTopLine];
}

id objc_msgSend_faceBounds(void *a1, const char *a2, ...)
{
  return [a1 faceBounds];
}

id objc_msgSend_faceData(void *a1, const char *a2, ...)
{
  return [a1 faceData];
}

id objc_msgSend_faceHeight(void *a1, const char *a2, ...)
{
  return [a1 faceHeight];
}

id objc_msgSend_faceOrientationIndex(void *a1, const char *a2, ...)
{
  return [a1 faceOrientationIndex];
}

id objc_msgSend_faceRect(void *a1, const char *a2, ...)
{
  return [a1 faceRect];
}

id objc_msgSend_faceWidth(void *a1, const char *a2, ...)
{
  return [a1 faceWidth];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_green(void *a1, const char *a2, ...)
{
  return [a1 green];
}

id objc_msgSend_hasValidPipelines(void *a1, const char *a2, ...)
{
  return [a1 hasValidPipelines];
}

id objc_msgSend_headPerimeter(void *a1, const char *a2, ...)
{
  return [a1 headPerimeter];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_iOD(void *a1, const char *a2, ...)
{
  return [a1 iOD];
}

id objc_msgSend_imageByClampingToExtent(void *a1, const char *a2, ...)
{
  return [a1 imageByClampingToExtent];
}

id objc_msgSend_imageByInsertingIntermediate(void *a1, const char *a2, ...)
{
  return [a1 imageByInsertingIntermediate];
}

id objc_msgSend_imageHeightScale(void *a1, const char *a2, ...)
{
  return [a1 imageHeightScale];
}

id objc_msgSend_imageWidthScale(void *a1, const char *a2, ...)
{
  return [a1 imageWidthScale];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputAdaptiveThresholdConstOffset(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdConstOffset];
}

id objc_msgSend_inputAdaptiveThresholdDoDisparityError(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdDoDisparityError];
}

id objc_msgSend_inputAdaptiveThresholdFaceErrorMargin(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdFaceErrorMargin];
}

id objc_msgSend_inputAdaptiveThresholdFaceGroupRange(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdFaceGroupRange];
}

id objc_msgSend_inputAdaptiveThresholdLinearDepthOffset(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdLinearDepthOffset];
}

id objc_msgSend_inputAdaptiveThresholdZRangeConst(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdZRangeConst];
}

id objc_msgSend_inputAdaptiveThresholdZRangeLinearDepth(void *a1, const char *a2, ...)
{
  return [a1 inputAdaptiveThresholdZRangeLinearDepth];
}

id objc_msgSend_inputFocalLengthNormalized(void *a1, const char *a2, ...)
{
  return [a1 inputFocalLengthNormalized];
}

id objc_msgSend_inputKeys(void *a1, const char *a2, ...)
{
  return [a1 inputKeys];
}

id objc_msgSend_inputStrength(void *a1, const char *a2, ...)
{
  return [a1 inputStrength];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intrinsicMatrix(void *a1, const char *a2, ...)
{
  return [a1 intrinsicMatrix];
}

id objc_msgSend_intrinsicMatrixReferenceDimensions(void *a1, const char *a2, ...)
{
  return [a1 intrinsicMatrixReferenceDimensions];
}

id objc_msgSend_invertRed(void *a1, const char *a2, ...)
{
  return [a1 invertRed];
}

id objc_msgSend_isempty(void *a1, const char *a2, ...)
{
  return [a1 isempty];
}

id objc_msgSend_leftCheekContour(void *a1, const char *a2, ...)
{
  return [a1 leftCheekContour];
}

id objc_msgSend_leftCheekStrobe(void *a1, const char *a2, ...)
{
  return [a1 leftCheekStrobe];
}

id objc_msgSend_leftChinContour(void *a1, const char *a2, ...)
{
  return [a1 leftChinContour];
}

id objc_msgSend_leftContour(void *a1, const char *a2, ...)
{
  return [a1 leftContour];
}

id objc_msgSend_leftEye(void *a1, const char *a2, ...)
{
  return [a1 leftEye];
}

id objc_msgSend_leftEyeOutline(void *a1, const char *a2, ...)
{
  return [a1 leftEyeOutline];
}

id objc_msgSend_leftEyePair(void *a1, const char *a2, ...)
{
  return [a1 leftEyePair];
}

id objc_msgSend_leftIrisSeedPoints(void *a1, const char *a2, ...)
{
  return [a1 leftIrisSeedPoints];
}

id objc_msgSend_leftKickLights(void *a1, const char *a2, ...)
{
  return [a1 leftKickLights];
}

id objc_msgSend_leftLipContour(void *a1, const char *a2, ...)
{
  return [a1 leftLipContour];
}

id objc_msgSend_leftNose(void *a1, const char *a2, ...)
{
  return [a1 leftNose];
}

id objc_msgSend_leftNoseContour(void *a1, const char *a2, ...)
{
  return [a1 leftNoseContour];
}

id objc_msgSend_leftRightVec(void *a1, const char *a2, ...)
{
  return [a1 leftRightVec];
}

id objc_msgSend_leftToRightVec(void *a1, const char *a2, ...)
{
  return [a1 leftToRightVec];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localLightStatisticsNoProxy(void *a1, const char *a2, ...)
{
  return [a1 localLightStatisticsNoProxy];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_metalCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 metalCommandBuffer];
}

id objc_msgSend_metalTexture(void *a1, const char *a2, ...)
{
  return [a1 metalTexture];
}

id objc_msgSend_mouthCenter(void *a1, const char *a2, ...)
{
  return [a1 mouthCenter];
}

id objc_msgSend_mouthPerimeterLinePair(void *a1, const char *a2, ...)
{
  return [a1 mouthPerimeterLinePair];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_neckContour1(void *a1, const char *a2, ...)
{
  return [a1 neckContour1];
}

id objc_msgSend_neckContourLeft(void *a1, const char *a2, ...)
{
  return [a1 neckContourLeft];
}

id objc_msgSend_neckContourRight(void *a1, const char *a2, ...)
{
  return [a1 neckContourRight];
}

id objc_msgSend_normV(void *a1, const char *a2, ...)
{
  return [a1 normV];
}

id objc_msgSend_noseStrobe(void *a1, const char *a2, ...)
{
  return [a1 noseStrobe];
}

id objc_msgSend_noseTip(void *a1, const char *a2, ...)
{
  return [a1 noseTip];
}

id objc_msgSend_noseTipPerimeterPath(void *a1, const char *a2, ...)
{
  return [a1 noseTipPerimeterPath];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_portraitScore(void *a1, const char *a2, ...)
{
  return [a1 portraitScore];
}

id objc_msgSend_previewCubeName(void *a1, const char *a2, ...)
{
  return [a1 previewCubeName];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_protectInterior(void *a1, const char *a2, ...)
{
  return [a1 protectInterior];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_red(void *a1, const char *a2, ...)
{
  return [a1 red];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_registryID(void *a1, const char *a2, ...)
{
  return [a1 registryID];
}

id objc_msgSend_releasePipelines(void *a1, const char *a2, ...)
{
  return [a1 releasePipelines];
}

id objc_msgSend_renormalize01(void *a1, const char *a2, ...)
{
  return [a1 renormalize01];
}

id objc_msgSend_renormalizeThreshold(void *a1, const char *a2, ...)
{
  return [a1 renormalizeThreshold];
}

id objc_msgSend_rgonPtr(void *a1, const char *a2, ...)
{
  return [a1 rgonPtr];
}

id objc_msgSend_rightCheekContour(void *a1, const char *a2, ...)
{
  return [a1 rightCheekContour];
}

id objc_msgSend_rightCheekStrobe(void *a1, const char *a2, ...)
{
  return [a1 rightCheekStrobe];
}

id objc_msgSend_rightChinContour(void *a1, const char *a2, ...)
{
  return [a1 rightChinContour];
}

id objc_msgSend_rightContour(void *a1, const char *a2, ...)
{
  return [a1 rightContour];
}

id objc_msgSend_rightEye(void *a1, const char *a2, ...)
{
  return [a1 rightEye];
}

id objc_msgSend_rightEyeOutline(void *a1, const char *a2, ...)
{
  return [a1 rightEyeOutline];
}

id objc_msgSend_rightEyePair(void *a1, const char *a2, ...)
{
  return [a1 rightEyePair];
}

id objc_msgSend_rightIrisSeedPoints(void *a1, const char *a2, ...)
{
  return [a1 rightIrisSeedPoints];
}

id objc_msgSend_rightKickLights(void *a1, const char *a2, ...)
{
  return [a1 rightKickLights];
}

id objc_msgSend_rightLipContour(void *a1, const char *a2, ...)
{
  return [a1 rightLipContour];
}

id objc_msgSend_rightNose(void *a1, const char *a2, ...)
{
  return [a1 rightNose];
}

id objc_msgSend_rightNoseContour(void *a1, const char *a2, ...)
{
  return [a1 rightNoseContour];
}

id objc_msgSend_s0(void *a1, const char *a2, ...)
{
  return [a1 s0];
}

id objc_msgSend_s1(void *a1, const char *a2, ...)
{
  return [a1 s1];
}

id objc_msgSend_sanityCheckStatus(void *a1, const char *a2, ...)
{
  return [a1 sanityCheckStatus];
}

id objc_msgSend_setDefaultsAbsoluteDisparity(void *a1, const char *a2, ...)
{
  return [a1 setDefaultsAbsoluteDisparity];
}

id objc_msgSend_skinSampleRgon(void *a1, const char *a2, ...)
{
  return [a1 skinSampleRgon];
}

id objc_msgSend_skinSeedPointCount(void *a1, const char *a2, ...)
{
  return [a1 skinSeedPointCount];
}

id objc_msgSend_skinSeedPoints(void *a1, const char *a2, ...)
{
  return [a1 skinSeedPoints];
}

id objc_msgSend_smartToneStatistics(void *a1, const char *a2, ...)
{
  return [a1 smartToneStatistics];
}

id objc_msgSend_standbyCubeName(void *a1, const char *a2, ...)
{
  return [a1 standbyCubeName];
}

id objc_msgSend_surface(void *a1, const char *a2, ...)
{
  return [a1 surface];
}

id objc_msgSend_teethPair(void *a1, const char *a2, ...)
{
  return [a1 teethPair];
}

id objc_msgSend_teethSeedPoints(void *a1, const char *a2, ...)
{
  return [a1 teethSeedPoints];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_thresholdAndApplyMatte(void *a1, const char *a2, ...)
{
  return [a1 thresholdAndApplyMatte];
}

id objc_msgSend_thresholdAndApplyWhiteBG(void *a1, const char *a2, ...)
{
  return [a1 thresholdAndApplyWhiteBG];
}

id objc_msgSend_thresholdKernel(void *a1, const char *a2, ...)
{
  return [a1 thresholdKernel];
}

id objc_msgSend_thresholdMatte(void *a1, const char *a2, ...)
{
  return [a1 thresholdMatte];
}

id objc_msgSend_thresholdWhiteMatte(void *a1, const char *a2, ...)
{
  return [a1 thresholdWhiteMatte];
}

id objc_msgSend_top(void *a1, const char *a2, ...)
{
  return [a1 top];
}

id objc_msgSend_transitionDepthsKernel(void *a1, const char *a2, ...)
{
  return [a1 transitionDepthsKernel];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_workingColorSpace(void *a1, const char *a2, ...)
{
  return [a1 workingColorSpace];
}

id objc_msgSend_xyBoundsRect(void *a1, const char *a2, ...)
{
  return [a1 xyBoundsRect];
}

id objc_msgSend_yy(void *a1, const char *a2, ...)
{
  return [a1 yy];
}

id objc_msgSend_zDarkThr(void *a1, const char *a2, ...)
{
  return [a1 zDarkThr];
}