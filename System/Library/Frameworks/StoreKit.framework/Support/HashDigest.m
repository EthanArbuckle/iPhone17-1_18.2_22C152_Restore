@interface HashDigest
+ (id)_stringRepresentationForDigest:(char *)a3 length:(unsigned int)a4;
- (HashDigest)initWithDigestType:(int64_t)a3;
- (id)finalAndCompute;
- (void)dealloc;
- (void)updateWithBuffer:(const char *)a3 length:(unint64_t)a4;
- (void)updateWithData:(id)a3;
@end

@implementation HashDigest

- (HashDigest)initWithDigestType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HashDigest;
  v4 = [(HashDigest *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_digestType = a3;
    switch(a3)
    {
      case 2:
        v7 = (CC_SHA256_CTX *)malloc_type_calloc(1uLL, 0x68uLL, 0x1000040ED882C02uLL);
        v5->_context = v7;
        CC_SHA256_Init(v7);
        break;
      case 1:
        v8 = (CC_SHA1_CTX *)malloc_type_calloc(1uLL, 0x60uLL, 0x1000040565EDBD2uLL);
        v5->_context = v8;
        CC_SHA1_Init(v8);
        break;
      case 0:
        v6 = (CC_MD5_CTX *)malloc_type_calloc(1uLL, 0x5CuLL, 0x100004034A301B9uLL);
        v5->_context = v6;
        CC_MD5_Init(v6);
        break;
    }
  }
  return v5;
}

- (void)dealloc
{
  free(self->_context);
  v3.receiver = self;
  v3.super_class = (Class)HashDigest;
  [(HashDigest *)&v3 dealloc];
}

- (id)finalAndCompute
{
  int64_t digestType = self->_digestType;
  if (digestType == 2)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    CC_SHA256_Final((unsigned __int8 *)&v5, (CC_SHA256_CTX *)self->_context);
    uint64_t v3 = 32;
  }
  else if (digestType == 1)
  {
    long long v5 = 0uLL;
    LODWORD(v6) = 0;
    CC_SHA1_Final((unsigned __int8 *)&v5, (CC_SHA1_CTX *)self->_context);
    uint64_t v3 = 20;
  }
  else
  {
    if (digestType) {
      goto LABEL_8;
    }
    long long v5 = 0uLL;
    CC_MD5_Final((unsigned __int8 *)&v5, (CC_MD5_CTX *)self->_context);
    uint64_t v3 = 16;
  }
  a2 = +[HashDigest _stringRepresentationForDigest:&v5 length:v3];
LABEL_8:

  return (id)(id)a2;
}

- (void)updateWithBuffer:(const char *)a3 length:(unint64_t)a4
{
  int64_t digestType = self->_digestType;
  switch(digestType)
  {
    case 2:
      CC_SHA256_Update((CC_SHA256_CTX *)self->_context, a3, a4);
      break;
    case 1:
      CC_SHA1_Update((CC_SHA1_CTX *)self->_context, a3, a4);
      break;
    case 0:
      CC_MD5_Update((CC_MD5_CTX *)self->_context, a3, a4);
      break;
  }
}

- (void)updateWithData:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009F358;
  v4[3] = &unk_10035A9C0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  objc_msgSend(v3, "lib_enumerateSubdataWithOffset:length:usingBlock:", 0, 0xFFFFFFFFLL, v4);
}

+ (id)_stringRepresentationForDigest:(char *)a3 length:(unsigned int)a4
{
  id v6 = [objc_alloc((Class)NSMutableString) initWithCapacity:2 * a4];
  if (a4)
  {
    uint64_t v7 = a4;
    do
    {
      unsigned int v8 = *a3++;
      objc_msgSend(v6, "appendFormat:", @"%02x", v8);
      --v7;
    }
    while (v7);
  }
  id v9 = [v6 copy];

  return v9;
}

@end