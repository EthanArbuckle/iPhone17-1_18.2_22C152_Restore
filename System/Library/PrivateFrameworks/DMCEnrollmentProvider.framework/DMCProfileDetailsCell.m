@interface DMCProfileDetailsCell
+ (id)cellIdentifier;
+ (id)localizedExpirationLabelForExpiry:(id)a3;
- (id)_attributedSubtitleComboWithSubtitle1:(id)a3 subtitle2:(id)a4 nearExpiration:(BOOL)a5;
- (id)_attributes:(id)a3 modifiedWithAttributes:(id)a4;
- (id)_expirationSubtitleForExpiry:(id)a3 outNearExpiration:(BOOL *)a4;
- (id)_textForLabel:(id)a3 value:(id)a4;
- (id)_titleFromCertificate:(__SecCertificate *)a3 outSubtitle1:(id *)a4 outSubtitle2:(id *)a5 outNearExpiration:(BOOL *)a6;
- (id)_titleFromPayloadInfo:(id)a3 outSubtitle1:(id *)a4 outSubtitle2:(id *)a5 outNearExpiration:(BOOL *)a6;
- (void)setDetails:(id)a3;
@end

@implementation DMCProfileDetailsCell

+ (id)cellIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setDetails:(id)a3
{
  id v4 = a3;
  [(DMCProfileDetailsCell *)self setAccessoryType:1];
  [(DMCProfileDetailsCell *)self setSelectionStyle:3];
  unsigned __int8 v18 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isManagedAppPayload])
    {
      v6 = [v5 managedApp];
      v7 = [v6 name];
      v8 = [v6 iconForVariant:0];
    }
    else
    {
      if (![v5 isManagedBookPayload])
      {
        id v16 = 0;
        id v17 = 0;
        v7 = [(DMCProfileDetailsCell *)self _titleFromPayloadInfo:v5 outSubtitle1:&v17 outSubtitle2:&v16 outNearExpiration:&v18];
        id v9 = v17;
        id v10 = v16;
        v8 = 0;
        if ([v5 showIcon])
        {
          v8 = +[DMCIconFactory gearIcon];
        }
        if (([v5 hasDetails] & 1) == 0)
        {
          [(DMCProfileDetailsCell *)self setAccessoryType:0];
          [(DMCProfileDetailsCell *)self setSelectionStyle:0];
        }
        goto LABEL_9;
      }
      v11 = [v5 managedBook];
      v7 = [v11 friendlyName];

      v8 = +[DMCApplicationProxy bookIconForVariant:0];
    }
    id v10 = 0;
    id v9 = 0;
LABEL_9:

    goto LABEL_11;
  }
  if (v4)
  {
    id v14 = 0;
    id v15 = 0;
    v7 = [(DMCProfileDetailsCell *)self _titleFromCertificate:v4 outSubtitle1:&v15 outSubtitle2:&v14 outNearExpiration:&v18];
    id v9 = v15;
    id v10 = v14;
    v8 = +[DMCIconFactory gearIcon];
  }
  else
  {
    NSLog(&cfstr_Dmcprofiledeta.isa, 0);
    v8 = 0;
    id v10 = 0;
    id v9 = 0;
    v7 = 0;
  }
LABEL_11:
  v12 = [(DMCProfileDetailsCell *)self defaultContentConfiguration];
  [v12 setImage:v8];
  [v12 setText:v7];
  v13 = [(DMCProfileDetailsCell *)self _attributedSubtitleComboWithSubtitle1:v9 subtitle2:v10 nearExpiration:v18];
  [v12 setSecondaryAttributedText:v13];

  [(DMCProfileDetailsCell *)self setContentConfiguration:v12];
}

- (id)_titleFromPayloadInfo:(id)a3 outSubtitle1:(id *)a4 outSubtitle2:(id *)a5 outNearExpiration:(BOOL *)a6
{
  id v10 = a3;
  v11 = [v10 title];
  v12 = [v10 subtitle1Label];
  v13 = [v10 subtitle1Description];
  *a4 = [(DMCProfileDetailsCell *)self _textForLabel:v12 value:v13];

  id v14 = [v10 certificateExpirationDate];
  id v15 = v14;
  if (v14 && ([v14 DMCProfilePastExpiration] & 1) != 0)
  {
    *a5 = [(DMCProfileDetailsCell *)self _expirationSubtitleForExpiry:v15 outNearExpiration:a6];
  }
  else
  {
    id v16 = [v10 subtitle2Label];
    id v17 = [v10 subtitle2Description];
    *a5 = [(DMCProfileDetailsCell *)self _textForLabel:v16 value:v17];
  }
  return v11;
}

- (id)_titleFromCertificate:(__SecCertificate *)a3 outSubtitle1:(id *)a4 outSubtitle2:(id *)a5 outNearExpiration:(BOOL *)a6
{
  id v10 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  v11 = v10;
  if (v10) {
    v12 = v10;
  }
  v13 = (void *)SecCertificateCopyIssuerSummary();
  if (v13)
  {
    id v14 = DMCEnrollmentLocalizedString(@"DMC_ISSUED_BY");
    *a4 = [(DMCProfileDetailsCell *)self _textForLabel:v14 value:v13];
  }
  id v15 = (void *)MEMORY[0x263EFF910];
  SecCertificateNotValidAfter();
  id v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  if (v16)
  {
    *a5 = [(DMCProfileDetailsCell *)self _expirationSubtitleForExpiry:v16 outNearExpiration:a6];
  }

  return v11;
}

- (id)_expirationSubtitleForExpiry:(id)a3 outNearExpiration:(BOOL *)a4
{
  v6 = (void *)MEMORY[0x263F08790];
  id v7 = a3;
  v8 = [v6 localizedStringFromDate:v7 dateStyle:3 timeStyle:0];
  *a4 = [v7 DMCProfileNearOrPastExpiration];
  id v9 = +[DMCProfileDetailsCell localizedExpirationLabelForExpiry:v7];

  id v10 = [(DMCProfileDetailsCell *)self _textForLabel:v9 value:v8];

  return v10;
}

+ (id)localizedExpirationLabelForExpiry:(id)a3
{
  if ([a3 DMCProfilePastExpiration]) {
    v3 = @"DMC_EXPIRED";
  }
  else {
    v3 = @"DMC_EXPIRES";
  }
  return DMCEnrollmentLocalizedString(v3);
}

- (id)_textForLabel:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v6 length])
    {
      id v7 = [v5 stringByAppendingFormat:@" %@", v6];
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)_attributes:(id)a3 modifiedWithAttributes:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v15);
        [v6 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_attributedSubtitleComboWithSubtitle1:(id)a3 subtitle2:(id)a4 nearExpiration:(BOOL)a5
{
  BOOL v5 = a5;
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = *MEMORY[0x263F81500];
  uint64_t v22 = *MEMORY[0x263F81500];
  v11 = [MEMORY[0x263F1C550] DMCProfileSecondaryLabelColor];
  v23[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];

  if (v7)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v12];
    [v9 appendAttributedString:v13];
  }
  if (v8)
  {
    if (v5)
    {
      uint64_t v20 = v10;
      id v14 = [MEMORY[0x263F1C550] DMCProfileRedColor];
      v21 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

      uint64_t v12 = (void *)v15;
    }
    id v16 = objc_alloc(MEMORY[0x263F086A0]);
    long long v17 = [NSString stringWithFormat:@"\n%@", v8];
    long long v18 = (void *)[v16 initWithString:v17 attributes:v12];
    [v9 appendAttributedString:v18];
  }
  return v9;
}

@end