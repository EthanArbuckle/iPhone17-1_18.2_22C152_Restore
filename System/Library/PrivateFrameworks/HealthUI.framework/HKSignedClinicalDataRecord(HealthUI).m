@interface HKSignedClinicalDataRecord(HealthUI)
- (BOOL)isExpired;
- (id)expiredAttributedString;
- (id)issuerDisplayStringWithSignatureStatusGlyph;
- (id)signatureStatusDisplayString;
@end

@implementation HKSignedClinicalDataRecord(HealthUI)

- (id)issuerDisplayStringWithSignatureStatusGlyph
{
  if ([a1 isExpired])
  {
    v2 = [a1 expiredAttributedString];
  }
  else
  {
    uint64_t v3 = [a1 signatureStatus];
    if (v3 == 3)
    {
      v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.seal.fill"];
      uint64_t v5 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else
    {
      if (v3 == 2)
      {
        v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.seal.fill"];
        [MEMORY[0x1E4FB1618] systemGreenColor];
      }
      else
      {
        v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.seal.fill"];
        [MEMORY[0x1E4FB1618] secondaryLabelColor];
      uint64_t v5 = };
    }
    v6 = (void *)v5;
    v7 = [v4 imageWithTintColor:v5];

    v8 = [a1 recordIssuerDisplayName];
    v2 = objc_msgSend(v8, "hk_attributedStringPrefixedWithImage:spacing:", v7, 2.0);
  }
  return v2;
}

- (id)signatureStatusDisplayString
{
  if ([a1 isExpired])
  {
    v2 = [a1 expiredAttributedString];
  }
  else
  {
    switch([a1 signatureStatus])
    {
      case 0:
        uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v4 = v3;
        uint64_t v5 = @"DETAIL_VIEW_SIGNATURE_STATUS_NOT_VERIFIED";
        goto LABEL_7;
      case 1:
        uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v4 = v3;
        uint64_t v5 = @"DETAIL_VIEW_SIGNATURE_STATUS_NOT_VERIFIED_UNABLE_TO";
LABEL_7:
        v6 = [v3 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

        goto LABEL_12;
      case 2:
        v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v6 = [v7 localizedStringForKey:@"DETAIL_VIEW_SIGNATURE_STATUS_VERIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

        v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.seal.fill"];
        uint64_t v9 = [MEMORY[0x1E4FB1618] systemGreenColor];
        goto LABEL_10;
      case 3:
        v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v6 = [v10 localizedStringForKey:@"DETAIL_VIEW_SIGNATURE_STATUS_NOT_VERIFIED_INVALID" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

        v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.seal.fill"];
        uint64_t v9 = [MEMORY[0x1E4FB1618] systemRedColor];
LABEL_10:
        v11 = (void *)v9;
        v12 = [v8 imageWithTintColor:v9];

        if (!v12) {
          goto LABEL_12;
        }
        v2 = objc_msgSend(v6, "hk_attributedStringPrefixedWithImage:spacing:", v12, 2.0);

        break;
      default:
        v6 = 0;
LABEL_12:
        v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
        break;
    }
  }
  return v2;
}

- (BOOL)isExpired
{
  v1 = [a1 expirationDate];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v3 = [v1 earlierDate:v2];
    BOOL v4 = v3 == v1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)expiredAttributedString
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v1 = [v0 localizedStringForKey:@"DETAIL_VIEW_SIGNATURE_STATUS_EXPIRED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

  v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.seal.fill"];
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemRedColor];
  BOOL v4 = [v2 imageWithTintColor:v3];

  uint64_t v5 = objc_msgSend(v1, "hk_attributedStringPrefixedWithImage:spacing:", v4, 2.0);

  return v5;
}

@end