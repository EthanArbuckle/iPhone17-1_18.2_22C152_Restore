@interface SigCrop
+ (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4;
+ (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4;
+ (BOOL)FillUnknownError:(id *)a3;
+ (BOOL)cropSignature:(id)a3 toDuration:(double)a4 stride:(double)a5 error:(id *)a6 callback:(id)a7;
+ (double)getSampleLength:(id)a3 error:(id *)a4;
+ (id)cropSignature:(id)a3 atPosition:(double)a4 withDuration:(double)a5 error:(id *)a6;
@end

@implementation SigCrop

+ (id)cropSignature:(id)a3 atPosition:(double)a4 withDuration:(double)a5 error:(id *)a6
{
  v8 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)[a3 bytes], (gsl::details *)objc_msgSend(a3, "length"));
  shazam::packed_signature_view::packed_signature_view(v21, v8, v9);
  shazam::basic_signature<(shazam::signature_density)2147483647>::basic_signature(v19, v21);
  float v10 = a4;
  float v11 = a5;
  float v12 = v10 * 125.0;
  unsigned int v13 = vcvtps_u32_f32(v12);
  shazam::crop<(shazam::signature_density)2147483647>((uint64_t)v19, v13, (float)(v12 + (float)(v11 * 125.0)) - v13, (uint64_t)v17);
  memset(&__p, 0, sizeof(__p));
  shazam::io::pack(&__p, (uint64_t)v17);
  v14 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:__p.__begin_ length:__p.__end_ - __p.__begin_];
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  __p.__begin_ = (std::vector<char>::pointer)&v18;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v17[0] = (void **)&v20;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100](v17);
  return v14;
}

+ (BOOL)cropSignature:(id)a3 toDuration:(double)a4 stride:(double)a5 error:(id *)a6 callback:(id)a7
{
  unsigned __int8 v28 = 0;
  float v10 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)objc_msgSend(a3, "bytes", a1, a6), (gsl::details *)objc_msgSend(a3, "length"));
  shazam::packed_signature_view::packed_signature_view(v27, v10, v11);
  shazam::basic_signature<(shazam::signature_density)2147483647>::basic_signature(v23, v27);
  unsigned int v12 = (a5 * 125.0);
  unsigned int v13 = (float)((float)((float)v24 / (float)v25) * 125.0);
  if ((a4 * 125.0) >= v13)
  {
    uint64_t v16 = 1;
    unsigned int v17 = 1;
  }
  else
  {
    unsigned int v14 = vcvtps_u32_f32((float)(v13 - v12) / (float)v12);
    BOOL v15 = __CFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_10;
    }
    unsigned int v17 = v16;
  }
  unsigned int v18 = 0;
  uint64_t v19 = v17 - 1;
  uint64_t v20 = v16 - 1;
  do
  {
    shazam::crop<(shazam::signature_density)2147483647>((uint64_t)v23, v18, (a4 * 125.0), (uint64_t)v29);
    memset(&v31, 0, sizeof(v31));
    shazam::io::pack(&v31, (uint64_t)v29);
    (*((void (**)(id, uint64_t, BOOL, unsigned __int8 *))a7 + 2))(a7, [MEMORY[0x263EFF8F8] dataWithBytes:v31.__begin_ length:v31.__end_ - v31.__begin_], v20 == 0, &v28);
    int v21 = v28;
    if (v31.__begin_)
    {
      v31.__end_ = v31.__begin_;
      operator delete(v31.__begin_);
    }
    v31.__begin_ = (std::vector<char>::pointer)&v30;
    std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
    if (!v19) {
      break;
    }
    --v19;
    --v20;
    v18 += v12;
  }
  while (!v21);
LABEL_10:
  v29[0] = (void **)&v26;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100](v29);
  return 1;
}

+ (double)getSampleLength:(id)a3 error:(id *)a4
{
  v4 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)[a3 bytes], (gsl::details *)objc_msgSend(a3, "length"));
  shazam::packed_signature_view::packed_signature_view(v8, v4, v5);
  shazam::get_siginfo((uint64_t)v8, (uint64_t)v7);
  return shazam::signature_info::getSampleLength((shazam::signature_info *)v7);
}

+ (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const system_error *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(NSString, "defaultCStringEncoding"));
    uint64_t var0 = a3->var2.var0;
    uint64_t v9 = *MEMORY[0x263F08320];
    v10[0] = v6;
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigcrop", var0, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
  return a4 != 0;
}

+ (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(NSString, "defaultCStringEncoding"));
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = v5;
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigcrop", -100, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  }
  return a4 != 0;
}

+ (BOOL)FillUnknownError:(id *)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x263F08320];
    v6[0] = @"Something unexpected happened.";
    *a3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigcrop", -200, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  }
  return a3 != 0;
}

@end