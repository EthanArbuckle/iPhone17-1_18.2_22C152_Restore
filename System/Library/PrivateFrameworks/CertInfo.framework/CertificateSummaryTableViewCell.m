@interface CertificateSummaryTableViewCell
- (void)setCertificateName:(id)a3 issuer:(id)a4 isRoot:(BOOL)a5;
- (void)updateWithCertificateTrust:(__SecTrust *)a3;
@end

@implementation CertificateSummaryTableViewCell

- (void)updateWithCertificateTrust:(__SecTrust *)a3
{
  if (a3 && SecTrustGetCertificateCount(a3) >= 1)
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
    SecCertificateCopySubjectSummary(CertificateAtIndex);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    SecCertificateCopyIssuerSummary();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t IsSelfSignedCA = SecCertificateIsSelfSignedCA();
    v8 = v10;
    uint64_t v9 = IsSelfSignedCA;
  }
  else
  {
    uint64_t v9 = 0;
    v8 = &stru_26C9B5AF8;
    v6 = &stru_26C9B5AF8;
  }
  v11 = v8;
  [(CertificateSummaryTableViewCell *)self setCertificateName:v8 issuer:v6 isRoot:v9];
}

- (void)setCertificateName:(id)a3 issuer:(id)a4 isRoot:(BOOL)a5
{
  id v15 = a4;
  v7 = &stru_26C9B5AF8;
  if (a3) {
    v8 = (__CFString *)a3;
  }
  else {
    v8 = &stru_26C9B5AF8;
  }
  id v9 = a3;
  v10 = [(CertUIItemSummaryCell *)self itemTitleLabel];
  [v10 setText:v8];

  if (v15)
  {
    v11 = NSString;
    v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v13 = [v12 localizedStringForKey:@"ISSUED_BY_LABEL" value:&stru_26C9B5AF8 table:@"CertInfo"];
    objc_msgSend(v11, "stringWithFormat:", v13, v15);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v14 = [(CertUIItemSummaryCell *)self itemSubtitleLabel];
  [v14 setText:v7];

  [(CertificateSummaryTableViewCell *)self setNeedsLayout];
}

@end