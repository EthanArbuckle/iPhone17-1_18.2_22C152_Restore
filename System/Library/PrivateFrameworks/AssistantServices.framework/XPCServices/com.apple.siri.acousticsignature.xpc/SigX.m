@interface SigX
+ (basic_string<char,)getVersion;
- (BOOL)flowFloatSamples:(const float *)a3 sampleCount:(int)a4 error:(id *)a5;
- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6;
- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5;
- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6;
- (BOOL)getSignature:(void *)a3 error:(id *)a4;
- (BOOL)getSignature:(void *)a3 signatureOptions:(int)a4 error:(id *)a5;
- (BOOL)resetWithError:(id *)a3;
- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5;
- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 signatureOptions:(int)a5 error:(id *)a6;
- (id)ConvertGenericException:(const exception *)a3;
- (id)ConvertSigException:(const SigException *)a3;
- (id)ConvertSigxException:(const SigxException *)a3;
- (id)FillUnknownError;
- (void)dealloc;
@end

@implementation SigX

- (void)dealloc
{
  mySigX = (uint64_t *)self->mySigX;
  if (mySigX)
  {
    uint64_t v3 = *mySigX;
    uint64_t *mySigX = 0;
    if (v3) {
      (*(void (**)(uint64_t, SEL))(*(void *)v3 + 8))(v3, a2);
    }
    operator delete();
  }
  v4.receiver = self;
  v4.super_class = (Class)SigX;
  [(SigX *)&v4 dealloc];
}

- (BOOL)getSignature:(void *)a3 error:(id *)a4
{
  return [(SigX *)self getSignature:a3 signatureOptions:0xFFFFFFFFLL error:a4];
}

- (BOOL)getSignature:(void *)a3 signatureOptions:(int)a4 error:(id *)a5
{
  mySigX = self->mySigX;
  *((void *)a3 + 1) = *(void *)a3;
  (*(void (**)(void, void *, void))(*(void *)*mySigX + 32))(*mySigX, a3, *(void *)&a4);
  sub_100007A44((uint64_t)&v8, *(int **)a3, *((void *)a3 + 1) - *(void *)a3);
}

- (BOOL)resetWithError:(id *)a3
{
  return 1;
}

- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  mySigX = self->mySigX;
  if (a5 >= 2 && a4)
  {
    uint64_t v7 = 0;
    float v8 = 1.0 / (float)(unint64_t)a5;
    v9 = a3 + 1;
    do
    {
      float v10 = v8 * a3[v7 * a5];
      a3[v7] = v10;
      v11 = v9;
      uint64_t v12 = a5 - 1;
      do
      {
        float v13 = *v11++;
        float v10 = v10 + (float)(v13 * v8);
        a3[v7] = v10;
        --v12;
      }
      while (v12);
      ++v7;
      v9 += a5;
    }
    while (v7 != a4);
  }
  (*(void (**)(void, float *, void))(*(void *)*mySigX + 24))(*mySigX, a3, *(void *)&a4);
  return 1;
}

- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  mySigX = self->mySigX;
  if (a5 >= 2 && a4)
  {
    uint64_t v7 = 0;
    float v8 = 1.0 / (float)(unint64_t)a5;
    v9 = a3 + 1;
    do
    {
      int v10 = (int)(float)(v8 * (float)a3[v7 * a5]);
      a3[v7] = v10;
      v11 = v9;
      uint64_t v12 = a5 - 1;
      do
      {
        int v13 = *v11++;
        int v10 = (int)(float)((float)(__int16)v10 + (float)((float)v13 * v8));
        a3[v7] = v10;
        --v12;
      }
      while (v12);
      ++v7;
      v9 += a5;
    }
    while (v7 != a4);
  }
  (*(void (**)(void, signed __int16 *, void))(*(void *)*mySigX + 16))(*mySigX, a3, *(void *)&a4);
  return 1;
}

- (BOOL)flowFloatSamples:(const float *)a3 sampleCount:(int)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5
{
  return 1;
}

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5
{
  return [(SigX *)self initWithSignatureType:*(void *)&a3 sampleRate:*(void *)&a4 signatureOptions:0 error:a5];
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

- (id)FillUnknownError
{
  v2 = +[NSDictionary dictionaryWithObject:@"Something unexpected happened." forKey:NSLocalizedDescriptionKey];
  uint64_t v3 = +[NSError errorWithDomain:@"com.shazam.sigx" code:-200 userInfo:v2];

  return v3;
}

- (id)ConvertGenericException:(const exception *)a3
{
  uint64_t v3 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), +[NSString defaultCStringEncoding]);
  objc_super v4 = +[NSDictionary dictionaryWithObject:v3 forKey:NSLocalizedDescriptionKey];
  v5 = +[NSError errorWithDomain:@"com.shazam.sigx" code:-100 userInfo:v4];

  return v5;
}

- (id)ConvertSigException:(const SigException *)a3
{
  objc_super v4 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const SigException *, SEL))a3->var0 + 2))(a3, a2), +[NSString defaultCStringEncoding]);
  uint64_t var0 = a3->var2.var0;
  v6 = +[NSDictionary dictionaryWithObject:v4 forKey:NSLocalizedDescriptionKey];
  objc_super v7 = +[NSError errorWithDomain:@"com.shazam.sigvalidation" code:var0 userInfo:v6];

  return v7;
}

- (id)ConvertSigxException:(const SigxException *)a3
{
  objc_super v4 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", (*((uint64_t (**)(const SigxException *, SEL))a3->var0 + 2))(a3, a2), +[NSString defaultCStringEncoding]);
  uint64_t var0 = a3->var2.var0;
  v6 = +[NSDictionary dictionaryWithObject:v4 forKey:NSLocalizedDescriptionKey];
  objc_super v7 = +[NSError errorWithDomain:@"com.shazam.sigx" code:var0 userInfo:v6];

  return v7;
}

+ (basic_string<char,)getVersion
{
  sub_100004B5C(&v3, "7.2.1");
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::append(&v3, " (compilation mode 'debug', built on 'OS X')");
  retstr->var0.uint64_t var0 = result->var0.var0;
  result->var0.var0.var0.var1.var1 = 0;
  *((void *)&result->var0.var0.var0.var1 + 2) = 0;
  result->var0.var0.var0.var1.uint64_t var0 = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
  return result;
}

@end