@interface SigSonify
+ (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4;
+ (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4;
+ (BOOL)FillUnknownError:(id *)a3;
+ (id)sonifySignature:(id)a3 withSampleRate:(unsigned int)a4 error:(id *)a5;
@end

@implementation SigSonify

+ (id)sonifySignature:(id)a3 withSampleRate:(unsigned int)a4 error:(id *)a5
{
  v6 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)[a3 bytes], (gsl::details *)objc_msgSend(a3, "length"));
  shazam::packed_signature_view::packed_signature_view(v14, v6, v7);
  shazam::basic_signature<(shazam::signature_density)2147483647>::basic_signature(v12, v14);
  shazam::sonify_signature((uint64_t)v12, a4, &__p);
  v8 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:__p length:v11 - (unsigned char *)__p];
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
  __p = &v13;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v8;
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
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigsonify", var0, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
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
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigsonify", -100, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
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
    *a3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigsonify", -200, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  }
  return a3 != 0;
}

@end