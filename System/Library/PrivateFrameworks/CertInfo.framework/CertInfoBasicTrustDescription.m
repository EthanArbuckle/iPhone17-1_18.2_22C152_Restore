@interface CertInfoBasicTrustDescription
- (BOOL)isRootCertificate;
- (BOOL)isTrusted;
- (CertInfoBasicTrustDescription)initWithTrust:(__SecTrust *)a3 action:(int)a4;
- (id)_expirationDate;
- (id)certificateExpirationDateAtIndex:(unint64_t)a3;
- (id)certificateIssuerSummaryAtIndex:(unint64_t)a3;
- (id)certificatePropertiesAtIndex:(unint64_t)a3;
- (id)certificateSubjectSummaryAtIndex:(unint64_t)a3;
- (id)summaryDescriptionItems;
- (id)summarySubtitle;
- (id)summaryTitle;
- (unint64_t)certificateCount;
- (void)dealloc;
@end

@implementation CertInfoBasicTrustDescription

- (CertInfoBasicTrustDescription)initWithTrust:(__SecTrust *)a3 action:(int)a4
{
  if (!a3) {
    -[CertInfoBasicTrustDescription initWithTrust:action:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)CertInfoBasicTrustDescription;
  v6 = [(CertInfoBasicTrustDescription *)&v8 init];
  if (v6)
  {
    v6->_trust = (__SecTrust *)CFRetain(a3);
    v6->_action = a4;
  }
  return v6;
}

- (void)dealloc
{
  trust = self->_trust;
  if (trust) {
    CFRelease(trust);
  }
  v4.receiver = self;
  v4.super_class = (Class)CertInfoBasicTrustDescription;
  [(CertInfoBasicTrustDescription *)&v4 dealloc];
}

- (id)summaryTitle
{
  if (SecTrustGetCertificateCount(self->_trust) < 1)
  {
    objc_super v4 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, 0);
    objc_super v4 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return v4;
}

- (id)summarySubtitle
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(self->_trust);
  if (CertificateCount < 1)
  {
    v5 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, CertificateCount - 1);
    v5 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return v5;
}

- (id)summaryDescriptionItems
{
  v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [(CertInfoBasicTrustDescription *)self _expirationDate];
  if (v4)
  {
    v5 = [MEMORY[0x263F08790] localizedStringFromDate:v4 dateStyle:2 timeStyle:2];
    if (v5)
    {
      [v4 timeIntervalSinceNow];
      double v7 = v6;
      objc_super v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
      v9 = v8;
      if (v7 >= 0.0) {
        v10 = @"EXPIRES";
      }
      else {
        v10 = @"EXPIRED";
      }
      v11 = [v8 localizedStringForKey:v10 value:&stru_26C9B5AF8 table:@"CertInfo"];
      [v3 addObject:v11];

      [v3 addObject:v5];
    }
  }
  return v3;
}

- (BOOL)isTrusted
{
  return self->_action == 1;
}

- (BOOL)isRootCertificate
{
  if (SecTrustGetCertificateCount(self->_trust) < 1) {
    return 0;
  }
  SecTrustGetCertificateAtIndex(self->_trust, 0);
  return SecCertificateIsSelfSignedCA();
}

- (unint64_t)certificateCount
{
  unint64_t result = (unint64_t)self->_trust;
  if (result) {
    return SecTrustGetCertificateCount((SecTrustRef)result);
  }
  return result;
}

- (id)certificateSubjectSummaryAtIndex:(unint64_t)a3
{
  CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, a3);
  if (CertificateAtIndex) {
    CertificateAtIndex = (__SecCertificate *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return CertificateAtIndex;
}

- (id)certificateIssuerSummaryAtIndex:(unint64_t)a3
{
  CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, a3);
  if (CertificateAtIndex) {
    CertificateAtIndex = (void *)SecCertificateCopyIssuerSummary();
  }
  return CertificateAtIndex;
}

- (id)certificateExpirationDateAtIndex:(unint64_t)a3
{
  SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, a3);
  if (CertificateAtIndex)
  {
    SecCertificateNotValidAfter();
    SecCertificateRef CertificateAtIndex = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v4);
  }
  return CertificateAtIndex;
}

- (id)certificatePropertiesAtIndex:(unint64_t)a3
{
  v3 = (void *)SecTrustCopyDetailedPropertiesAtIndex();
  return v3;
}

- (id)_expirationDate
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(self->_trust);
  if (CertificateCount < 1) {
    goto LABEL_10;
  }
  CFIndex v4 = CertificateCount;
  CFIndex v5 = 0;
  int v6 = 0;
  double v7 = *MEMORY[0x263EFFAF0];
  do
  {
    if (SecTrustGetCertificateAtIndex(self->_trust, v5))
    {
      SecCertificateNotValidAfter();
      int v9 = v6 ^ 1 | (v8 < v7);
      if ((v6 ^ 1) & 1 | (v8 < v7)) {
        double v7 = v8;
      }
      v6 |= v9;
    }
    ++v5;
  }
  while (v4 != v5);
  if (v6) {
    CFDateRef v10 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7);
  }
  else {
LABEL_10:
  }
    CFDateRef v10 = 0;
  return v10;
}

- (void)initWithTrust:action:.cold.1()
{
  __assert_rtn("-[CertInfoBasicTrustDescription initWithTrust:action:]", "CertInfoTrustDescription.m", 31, "NULL != trust");
}

@end