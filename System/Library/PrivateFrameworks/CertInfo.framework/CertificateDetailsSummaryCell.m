@interface CertificateDetailsSummaryCell
- (CertificateDetailsSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)details;
- (void)setDetails:(id)a3;
- (void)setDetailsWithCertificateTrust:(__SecTrust *)a3 certificateExpiration:(id)a4 certificateIsTrusted:(BOOL)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CertificateDetailsSummaryCell

- (CertificateDetailsSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CertificateDetailsSummaryCell;
  v4 = [(CertUIItemDetailsSummaryCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CertificateDetailsSummaryCell *)v4 setSelectionStyle:0];
  }
  return v5;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CertificateDetailsSummaryCell;
  [(CertUIItemDetailsSummaryCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setDetails:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_details != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_details, a3);
    [(CertUIItemDetailsSummaryCell *)self createViewWithItemDetailArray:self->_details];
    [(CertificateDetailsSummaryCell *)self setNeedsLayout];
    v5 = v6;
  }
}

- (void)setDetailsWithCertificateTrust:(__SecTrust *)a3 certificateExpiration:(id)a4 certificateIsTrusted:(BOOL)a5
{
  BOOL v5 = a5;
  id v37 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  v10 = v9;
  if (v5) {
    v11 = @"TRUSTED";
  }
  else {
    v11 = @"NOT_TRUSTED";
  }
  v12 = &stru_26C9B5AF8;
  uint64_t v13 = [v9 localizedStringForKey:v11 value:&stru_26C9B5AF8 table:@"CertInfo"];

  if (v13) {
    v14 = (__CFString *)v13;
  }
  else {
    v14 = &stru_26C9B5AF8;
  }
  if (v5) {
    [MEMORY[0x263F1C550] CertUIVerifiedColor];
  }
  else {
  v15 = [MEMORY[0x263F1C550] systemRedColor];
  }
  LOBYTE(v35) = v5;
  v16 = +[CertUIItemDetail itemDetailWithDetailTitle:0 detail:0 detailHighlightColor:0 showCheckmarkView:1 checkmarkText:v14 checkmarkHighlightColor:v15 showCheckmark:v35];
  [v8 addObject:v16];
  v36 = self;
  if (a3)
  {
    CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
    if (CertificateCount < 1)
    {
      CFDateRef v24 = 0;
    }
    else
    {
      CFIndex v18 = CertificateCount;
      CFIndex v19 = 0;
      int v20 = 0;
      double v21 = *MEMORY[0x263EFFAF0];
      do
      {
        if (SecTrustGetCertificateAtIndex(a3, v19))
        {
          SecCertificateNotValidAfter();
          int v23 = v20 ^ 1 | (v22 < v21);
          v20 |= v23;
          if (v23) {
            double v21 = v22;
          }
        }
        ++v19;
      }
      while (v18 != v19);
      if (v20) {
        CFDateRef v24 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v21);
      }
      else {
        CFDateRef v24 = 0;
      }
    }
  }
  else
  {
    CFDateRef v24 = (CFDateRef)v37;
  }
  id v25 = objc_alloc_init(MEMORY[0x263F08790]);
  [v25 setDateStyle:1];
  [v25 setTimeStyle:2];
  v26 = [MEMORY[0x263EFF960] currentLocale];
  [v25 setLocale:v26];

  uint64_t v27 = [v25 stringFromDate:v24];
  if (v27) {
    v12 = (__CFString *)v27;
  }
  [(__CFDate *)v24 timeIntervalSinceNow];
  double v29 = v28;
  v30 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  v31 = v30;
  if (v29 >= 0.0)
  {
    v32 = [v30 localizedStringForKey:@"EXPIRES" value:&stru_26C9B5AF8 table:@"CertInfo"];

    v34 = +[CertUIItemDetail itemDetailWithDetailTitle:v32 detail:v12 detailHighlightColor:0];
  }
  else
  {
    v32 = [v30 localizedStringForKey:@"EXPIRED" value:&stru_26C9B5AF8 table:@"CertInfo"];

    v33 = [MEMORY[0x263F1C550] systemRedColor];
    v34 = +[CertUIItemDetail itemDetailWithDetailTitle:v32 detail:v12 detailHighlightColor:v33];
  }
  [v8 addObject:v34];
  [(CertificateDetailsSummaryCell *)v36 setDetails:v8];
  [(CertificateDetailsSummaryCell *)v36 setNeedsLayout];
}

- (NSArray)details
{
  return self->_details;
}

- (void).cxx_destruct
{
}

@end