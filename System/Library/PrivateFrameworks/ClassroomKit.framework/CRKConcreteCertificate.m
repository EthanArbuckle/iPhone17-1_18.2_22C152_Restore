@interface CRKConcreteCertificate
+ (id)certificateWithData:(id)a3;
- (BOOL)isCertificateAuthority;
- (BOOL)isTemporallyValid;
- (CRKConcreteCertificate)initWithCertificate:(__SecCertificate *)a3;
- (NSArray)commonNames;
- (NSData)dataRepresentation;
- (NSDateInterval)validityDateInterval;
- (NSString)description;
- (NSString)fingerprint;
- (__SecCertificate)underlyingCertificate;
- (int64_t)keySizeInBits;
- (unsigned)hashingAlgorithm;
- (void)dealloc;
- (void)keySizeInBits;
@end

@implementation CRKConcreteCertificate

- (void)dealloc
{
  CFRelease(self->_underlyingCertificate);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteCertificate;
  [(CRKConcreteCertificate *)&v3 dealloc];
}

- (CRKConcreteCertificate)initWithCertificate:(__SecCertificate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteCertificate;
  v4 = [(CRKConcreteCertificate *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingCertificate = a3;
  }
  return v4;
}

+ (id)certificateWithData:(id)a3
{
  SecCertificateRef v4 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)a3);
  if (v4)
  {
    SecCertificateRef v5 = v4;
    objc_super v6 = (void *)[objc_alloc((Class)a1) initWithCertificate:v4];
    CFRelease(v5);
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (NSArray)commonNames
{
  [(CRKConcreteCertificate *)self underlyingCertificate];
  v2 = (void *)SecCertificateCopyCommonNames();
  objc_super v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  SecCertificateRef v4 = v2;

  return v4;
}

- (NSString)fingerprint
{
  [(CRKConcreteCertificate *)self underlyingCertificate];
  v2 = SecCertificateGetSHA1Digest();
  objc_super v3 = objc_msgSend(v2, "crk_hexString");

  return (NSString *)v3;
}

- (NSDateInterval)validityDateInterval
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  objc_super v3 = self;
  [(CRKConcreteCertificate *)v3 underlyingCertificate];
  SecCertificateNotValidBefore();
  CFDateRef v5 = CFDateCreate(v2, v4);
  [(CRKConcreteCertificate *)v3 underlyingCertificate];
  SecCertificateNotValidAfter();
  CFDateRef v7 = CFDateCreate(v2, v6);
  CFDateRef v8 = v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    v10 = 0;
  }
  else {
    v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:v7];
  }

  return (NSDateInterval *)v10;
}

- (NSData)dataRepresentation
{
  CFDataRef v2 = SecCertificateCopyData([(CRKConcreteCertificate *)self underlyingCertificate]);

  return (NSData *)v2;
}

- (BOOL)isTemporallyValid
{
  CFDataRef v2 = [(CRKConcreteCertificate *)self validityDateInterval];
  char v3 = objc_msgSend(v2, "crk_containsCurrentDate");

  return v3;
}

- (BOOL)isCertificateAuthority
{
  CFDataRef v2 = [(CRKConcreteCertificate *)self underlyingCertificate];

  return MEMORY[0x270EFD838](v2);
}

- (unsigned)hashingAlgorithm
{
  CFDataRef v2 = [(CRKConcreteCertificate *)self underlyingCertificate];

  return MEMORY[0x270EFD818](v2);
}

- (int64_t)keySizeInBits
{
  CFDataRef v2 = SecCertificateCopyKey([(CRKConcreteCertificate *)self underlyingCertificate]);
  if (v2)
  {
    char v3 = v2;
    size_t BlockSize = SecKeyGetBlockSize(v2);
    CFRelease(v3);
    return 8 * BlockSize;
  }
  else
  {
    if (_CRKLogGeneral_onceToken_42 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_42, &__block_literal_global_117);
    }
    CFAbsoluteTime v6 = _CRKLogGeneral_logObj_42;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_42, OS_LOG_TYPE_ERROR)) {
      -[CRKConcreteCertificate keySizeInBits](v6);
    }
    return 0;
  }
}

- (NSString)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CFDateRef v5 = self;
  return (NSString *)[v3 stringWithFormat:@"%@: %p { underlyingCertificate = %@ }>", v4, v5, -[CRKConcreteCertificate underlyingCertificate](v5, "underlyingCertificate")];
}

- (__SecCertificate)underlyingCertificate
{
  return self->_underlyingCertificate;
}

- (void)keySizeInBits
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to copy public key from certificate when determining key size", v1, 2u);
}

@end