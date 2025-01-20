@interface SignatureAlignmentTracker
+ (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4;
+ (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4;
+ (BOOL)FillUnknownError:(id *)a3;
+ (id)compareQuerySignature:(id)a3 withReferenceSignature:(id)a4 mergeMode:(int64_t)a5 numHistogramBuckets:(unsigned int)a6 scoreThreshold:(float)a7 boundingBox:(unsigned int)a8 frequencyPenaltyMultiplier:(float)a9 forwardPassOnly:(BOOL)a10 singlePassOnly:(BOOL)a11 refineStartEnd:(BOOL)a12 queryThreshold:(float)a13 error:(id *)a14;
+ (id)signatureAlignmentFromTrackingResult:(TrackingResult *)a3;
@end

@implementation SignatureAlignmentTracker

+ (id)compareQuerySignature:(id)a3 withReferenceSignature:(id)a4 mergeMode:(int64_t)a5 numHistogramBuckets:(unsigned int)a6 scoreThreshold:(float)a7 boundingBox:(unsigned int)a8 frequencyPenaltyMultiplier:(float)a9 forwardPassOnly:(BOOL)a10 singlePassOnly:(BOOL)a11 refineStartEnd:(BOOL)a12 queryThreshold:(float)a13 error:(id *)a14
{
  v22 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)[a4 bytes], (gsl::details *)objc_msgSend(a4, "length"));
  shazam::packed_signature_view::packed_signature_view(v44, v22, v23);
  shazam::basic_signature<(shazam::signature_density)16>::basic_signature(v46, v44);
  v24 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)[a3 bytes], (gsl::details *)objc_msgSend(a3, "length"));
  shazam::packed_signature_view::packed_signature_view(&v30, v24, v25);
  shazam::basic_signature<(shazam::signature_density)24>::basic_signature(v44, &v30);
  unsigned int v37 = a6;
  float v38 = a7;
  unsigned int v39 = a8;
  float v40 = a9;
  BOOL v41 = a10;
  BOOL v42 = a11;
  BOOL v43 = a12;
  *(void *)&long long v30 = 0xBD4CCCCD00000000;
  BYTE8(v30) = 1;
  HIDWORD(v30) = 1028443341;
  char v31 = 1;
  float v32 = a13;
  __int16 v33 = 0;
  int v34 = 0;
  char v35 = 0;
  int v36 = 0;
  long long v28 = xmmword_224BC5480;
  SearchPlan::SearchPlan((uint64_t)v27, 1, 2);
  shazam::pairwise::compare(v46, v47, v44, v45, a5 != 0, (uint64_t)&v28, &v30, v27, &v29);
}

+ (id)signatureAlignmentFromTrackingResult:(TrackingResult *)a3
{
  double v4 = (float)((float)a3->var0.var0.var0 / 125.0);
  double v5 = (float)((float)a3->var0.var1.var0 / 125.0);
  double v6 = (float)((float)a3->var1.var0.var0 / 125.0);
  double v7 = (float)((float)a3->var1.var1.var0 / 125.0);
  v8 = [SignatureAlignmentTrackerResult alloc];
  *(float *)&double v9 = a3->var2;
  v10 = [(SignatureAlignmentTrackerResult *)v8 initWithQueryStart:v4 queryEnd:v5 referenceStart:v6 referenceEnd:v7 confidence:v9];

  return v10;
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
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigalignmenttracker", var0, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
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
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigalignmenttracker", -100, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
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
    *a3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigalignmenttracker", -200, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  }
  return a3 != 0;
}

@end