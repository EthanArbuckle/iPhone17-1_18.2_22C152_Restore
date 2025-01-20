@interface SigX
+ (id)version;
- (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4;
- (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4;
- (BOOL)FillUnknownError:(id *)a3;
- (BOOL)flowBuffer:(id)a3 error:(id *)a4;
- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6;
- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 error:(id *)a5;
- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5;
- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)setRollingBufferSeconds:(float)a3 error:(id *)a4;
- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5;
- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 signatureOptions:(int)a5 error:(id *)a6;
- (id)signatureWithError:(id *)a3;
- (id)spectralOutputHandler;
- (uint64_t)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:;
- (void)dealloc;
- (void)disableSpectralOutput;
- (void)enableSpectralOutputForNumberOfFrequencyBins:(int)a3 callbackFrequency:(int)a4 completionHandler:(id)a5;
- (void)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:;
- (void)mySigX;
- (void)setMySigX:(void *)a3;
- (void)setSpectralOutputHandler:(id)a3;
@end

@implementation SigX

- (BOOL)flowBuffer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 int16ChannelData])
  {
    if ([v6 int32ChannelData] || !objc_msgSend(v6, "floatChannelData"))
    {
      +[SHError annotateClientError:a4 code:100 underlyingError:0];
      BOOL v11 = 0;
      goto LABEL_11;
    }
    if (*(void *)[v6 floatChannelData])
    {
      uint64_t v12 = *(void *)[v6 floatChannelData];
      uint64_t v13 = [v6 frameLength];
      v9 = [v6 format];
      BOOL v10 = -[SigX flowFloatSamples:sampleCount:channels:error:](self, "flowFloatSamples:sampleCount:channels:error:", v12, v13, [v9 channelCount], a4);
      goto LABEL_4;
    }
LABEL_10:
    BOOL v11 = 1;
    goto LABEL_11;
  }
  if (!*(void *)[v6 int16ChannelData]) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)[v6 int16ChannelData];
  uint64_t v8 = [v6 frameLength];
  v9 = [v6 format];
  BOOL v10 = -[SigX flowIntSamples:sampleCount:channels:error:](self, "flowIntSamples:sampleCount:channels:error:", v7, v8, [v9 channelCount], a4);
LABEL_4:
  BOOL v11 = v10;

LABEL_11:
  return v11;
}

- (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4
{
  if (a4) {
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigvalidation", a3->var2.var0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const system_error *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(NSString, "defaultCStringEncoding")), *MEMORY[0x263F08320]));
  }
  return a4 != 0;
}

- (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4
{
  if (a4) {
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigx", -100, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(NSString, "defaultCStringEncoding")), *MEMORY[0x263F08320]));
  }
  return a4 != 0;
}

- (BOOL)FillUnknownError:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.shazam.sigx", -200, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Something unexpected happened.", *MEMORY[0x263F08320]));
  }
  return a3 != 0;
}

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 signatureOptions:(int)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)SigX;
  if ([(SigX *)&v7 init]) {
    operator new();
  }
  return 0;
}

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5
{
  return [(SigX *)self initWithSignatureType:*(void *)&a3 sampleRate:*(void *)&a4 signatureOptions:0 error:a5];
}

- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 error:(id *)a5
{
  objc_super v7 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)a3, (gsl::details *)a4);
  uint64_t v9 = v8;
  uint64_t v10 = v8 + 4 * (void)v7;
  uint64_t v15 = v8;
  uint64_t v16 = v10;
  uint64_t v17 = v8;
  while (v17 != v10)
  {
    BOOL v11 = gsl::details::span_iterator<shazam::tfmatch const>::operator*((gsl::details *)&v15);
    *(float *)BOOL v11 = *(float *)v11 * 32767.0;
    uint64_t v12 = gsl::details::span_iterator<float>::operator++((gsl::details *)&v15);
    if (v15 != v9 || v16 != v10) {
      gsl::details::terminate(v12);
    }
  }
  SHAZAM_SIGX::flow((SHAZAM_SIGX *)self->_mySigX, a3);
  return 1;
}

- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  return 1;
}

- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  uint64_t v10 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)a3, (gsl::details *)(a5 * a4));
  uint64_t v12 = v11;
  uint64_t v13 = v11 + 4 * (void)v10;
  uint64_t v18 = v11;
  uint64_t v19 = v13;
  uint64_t v20 = v11;
  while (v20 != v13)
  {
    v14 = gsl::details::span_iterator<shazam::tfmatch const>::operator*((gsl::details *)&v18);
    *(float *)v14 = *(float *)v14 * 32767.0;
    uint64_t v15 = gsl::details::span_iterator<float>::operator++((gsl::details *)&v18);
    if (v18 != v12 || v19 != v13) {
      gsl::details::terminate(v15);
    }
  }
  SHAZAM_SIGX::flow((SHAZAM_SIGX *)self->_mySigX, a3, a4, a5);
  return 1;
}

- (BOOL)resetWithError:(id *)a3
{
  return 1;
}

- (id)signatureWithError:(id *)a3
{
  __p = 0;
  id v6 = 0;
  uint64_t v7 = 0;
  SHAZAM_SIGX::get_signature((uint64_t)self->_mySigX, &__p);
  v3 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:__p length:v6 - (unsigned char *)__p];
  if (__p)
  {
    id v6 = __p;
    operator delete(__p);
  }
  return v3;
}

+ (id)version
{
  v2 = NSString;
  uint64_t v3 = [NSString defaultCStringEncoding];

  return (id)objc_msgSend(v2, "stringWithCString:encoding:", "24.7.11 (compilation mode 'release', built on 'OS X')", v3);
}

- (void)dealloc
{
  mySigX = (SHAZAM_SIGX *)self->_mySigX;
  if (mySigX)
  {
    SHAZAM_SIGX::~SHAZAM_SIGX(mySigX);
    MEMORY[0x22A61F420]();
  }

  v4.receiver = self;
  v4.super_class = (Class)SigX;
  [(SigX *)&v4 dealloc];
}

- (BOOL)setRollingBufferSeconds:(float)a3 error:(id *)a4
{
  return 1;
}

- (void)enableSpectralOutputForNumberOfFrequencyBins:(int)a3 callbackFrequency:(int)a4 completionHandler:(id)a5
{
  v8[4] = *MEMORY[0x263EF8340];
  [(SigX *)self setSpectralOutputHandler:a5];
  v8[0] = &unk_26D7DA1A0;
  v8[1] = self;
  v8[3] = v8;
  SHAZAM_SIGX::setup_spectral_output((void *)[(SigX *)self mySigX], a3, a4, (uint64_t)v8);
}

- (void)disableSpectralOutput
{
  SHAZAM_SIGX::disable_spectral_output((SHAZAM_SIGX *)[(SigX *)self mySigX]);

  [(SigX *)self setSpectralOutputHandler:0];
}

- (void)mySigX
{
  return self->_mySigX;
}

- (void)setMySigX:(void *)a3
{
  self->_mySigX = a3;
}

- (id)spectralOutputHandler
{
  return self->_spectralOutputHandler;
}

- (void)setSpectralOutputHandler:(id)a3
{
}

- (void)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:
{
}

- (uint64_t)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end