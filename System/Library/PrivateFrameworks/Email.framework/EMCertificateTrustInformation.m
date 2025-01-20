@interface EMCertificateTrustInformation
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
- (BOOL)_forceNetworkAccessAllowed;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddressConvertible)firstEmailAddress;
- (ECSecureMIMETrustEvaluation)trustEvaluation;
- (EMCertificateTrustInformation)initWithCoder:(id)a3;
- (EMCertificateTrustInformation)initWithTrust:(__SecTrust *)a3 certificateType:(unint64_t)a4 sender:(id)a5;
- (NSArray)emailAddresses;
- (NSString)commonName;
- (NSString)sender;
- (__SecCertificate)certificate;
- (__SecTrust)trust;
- (unint64_t)certificateType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateTrustWithOptions:(unint64_t)a3;
- (void)reevaluateTrustWithNetworkAccessAllowed;
- (void)setCertificateType:(unint64_t)a3;
- (void)setSender:(id)a3;
- (void)setTrust:(__SecTrust *)a3;
- (void)setTrustEvaluation:(id)a3;
- (void)set_forceNetworkAccessAllowed:(BOOL)a3;
@end

@implementation EMCertificateTrustInformation

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EMCertificateTrustInformation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, block);
  }
  v2 = (void *)log_log_6;
  return (OS_os_log *)v2;
}

void __36__EMCertificateTrustInformation_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;
}

- (EMCertificateTrustInformation)initWithTrust:(__SecTrust *)a3 certificateType:(unint64_t)a4 sender:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EMCertificateTrustInformation;
  v9 = [(EMCertificateTrustInformation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_trust = a3;
    CFRetain(a3);
    v10->_certificateType = a4;
    uint64_t v11 = [v8 copy];
    sender = v10->_sender;
    v10->_sender = (NSString *)v11;
  }
  return v10;
}

- (void)dealloc
{
  CFRelease(self->_trust);
  v3.receiver = self;
  v3.super_class = (Class)EMCertificateTrustInformation;
  [(EMCertificateTrustInformation *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMCertificateTrustInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sender"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"EFPropertyKey_certificateType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trust"];
  if (v7 && (id v8 = (const void *)SecTrustDeserialize()) != 0)
  {
    self = [(EMCertificateTrustInformation *)self initWithTrust:v8 certificateType:v6 sender:v5];
    CFRelease(v8);
    v9 = self;
  }
  else
  {
    v10 = +[EMCertificateTrustInformation log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[EMCertificateTrustInformation initWithCoder:](v10);
    }

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(EMCertificateTrustInformation *)self sender];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_sender"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCertificateTrustInformation certificateType](self, "certificateType"), @"EFPropertyKey_certificateType");
  uint64_t v6 = (void *)SecTrustSerialize();
  if (v6)
  {
    [v4 encodeObject:v6 forKey:@"trust"];
  }
  else
  {
    v7 = +[EMCertificateTrustInformation log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EMCertificateTrustInformation encodeWithCoder:](v7);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMCertificateTrustInformation *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v7 = CFEqual([(EMCertificateTrustInformation *)self certificate], [(EMCertificateTrustInformation *)v6 certificate]) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EMCertificateTrustInformation *)self certificate];
  return CFHash(v2);
}

- (__SecCertificate)certificate
{
  CFArrayRef v2 = SecTrustCopyCertificateChain([(EMCertificateTrustInformation *)self trust]);
  objc_super v3 = [(__CFArray *)v2 firstObject];

  return (__SecCertificate *)v3;
}

- (NSString)commonName
{
  [(EMCertificateTrustInformation *)self certificate];
  CFArrayRef v2 = (void *)SecCertificateCopyCommonNames();
  objc_super v3 = [v2 firstObject];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (ECEmailAddressConvertible)firstEmailAddress
{
  [(EMCertificateTrustInformation *)self certificate];
  CFArrayRef v2 = (void *)SecCertificateCopyRFC822Names();
  objc_super v3 = [v2 firstObject];
  id v4 = (void *)[v3 copy];

  return (ECEmailAddressConvertible *)v4;
}

- (NSArray)emailAddresses
{
  [(EMCertificateTrustInformation *)self certificate];
  CFArrayRef v2 = (void *)SecCertificateCopyRFC822Names();
  objc_super v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)evaluateTrustWithOptions:(unint64_t)a3
{
  id v5 = [(EMCertificateTrustInformation *)self sender];
  uint64_t v6 = [v5 emailAddressValue];
  BOOL v7 = [v6 simpleAddress];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 stringValue];
  }
  id v12 = v9;

  v10 = [MEMORY[0x1E4F608D0] evaluateTrust:self->_trust withOptions:a3 signerEmailAddress:v12];
  trustEvaluation = self->_trustEvaluation;
  self->_trustEvaluation = v10;
}

- (void)reevaluateTrustWithNetworkAccessAllowed
{
  objc_super v3 = (void *)MEMORY[0x1E4F608D0];
  id v6 = [(EMCertificateTrustInformation *)self trustEvaluation];
  objc_msgSend(v3, "reevaluateWithNetworkAccessAllowed:");
  id v4 = (ECSecureMIMETrustEvaluation *)objc_claimAutoreleasedReturnValue();
  trustEvaluation = self->_trustEvaluation;
  self->_trustEvaluation = v4;
}

- (__SecTrust)trust
{
  return self->_trust;
}

- (void)setTrust:(__SecTrust *)a3
{
  self->_trust = a3;
}

- (ECSecureMIMETrustEvaluation)trustEvaluation
{
  return self->_trustEvaluation;
}

- (void)setTrustEvaluation:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (unint64_t)certificateType
{
  return self->_certificateType;
}

- (void)setCertificateType:(unint64_t)a3
{
  self->_certificateType = a3;
}

- (BOOL)_forceNetworkAccessAllowed
{
  return self->__forceNetworkAccessAllowed;
}

- (void)set_forceNetworkAccessAllowed:(BOOL)a3
{
  self->__forceNetworkAccessAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_trustEvaluation, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Error decoding trust data", v1, 2u);
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Trust encoding failed", v1, 2u);
}

@end