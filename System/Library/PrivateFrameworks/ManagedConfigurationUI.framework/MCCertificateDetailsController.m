@interface MCCertificateDetailsController
+ (id)_dateFormatter;
- (id)_propertiesFromTrust:(__SecTrust *)a3;
- (id)specifiers;
- (id)specifiersFromCertificateProperties:(id)a3;
- (id)specifiersFromTrust:(__SecTrust *)a3;
- (id)valueForSpecifier:(id)a3;
@end

@implementation MCCertificateDetailsController

+ (id)_dateFormatter
{
  v2 = (void *)_dateFormatter_sFormatter;
  if (!_dateFormatter_sFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v4 = (void *)_dateFormatter_sFormatter;
    _dateFormatter_sFormatter = (uint64_t)v3;

    [(id)_dateFormatter_sFormatter setDateStyle:1];
    [(id)_dateFormatter_sFormatter setTimeStyle:1];
    v2 = (void *)_dateFormatter_sFormatter;
  }
  return v2;
}

- (id)_propertiesFromTrust:(__SecTrust *)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  CFErrorRef error = 0;
  if (!SecTrustEvaluateWithError(a3, &error)) {
    NSLog(&cfstr_SectrustNotTru.isa, a3, error);
  }
  if (error) {
    CFRelease(error);
  }
  int CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount >= 1)
  {
    uint64_t v5 = 0;
    v6 = 0;
    uint64_t v7 = CertificateCount;
    do
    {
      v8 = (void *)SecTrustCopyDetailedPropertiesAtIndex();
      v9 = (void *)[v8 copy];

      ++v5;
      v6 = v9;
    }
    while (v7 != v5);
  }
  else
  {
LABEL_10:
    v9 = 0;
  }
  return v9;
}

- (id)valueForSpecifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F93250];
  uint64_t v5 = [v3 propertyForKey:*MEMORY[0x1E4F93250]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id HexStringForBytes = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = +[MCCertificateDetailsController _dateFormatter];
    id HexStringForBytes = [v8 stringFromDate:v7];

LABEL_7:
    [v3 setProperty:HexStringForBytes forKey:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v5;
    [v9 bytes];
    [v9 length];

    id HexStringForBytes = (id)_CreateHexStringForBytes();
    goto LABEL_7;
  }
  id HexStringForBytes = 0;
LABEL_9:

  return HexStringForBytes;
}

- (id)specifiersFromCertificateProperties:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  v22 = v3;
  int v5 = [v3 count];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v20 = *MEMORY[0x1E4F3BC28];
    uint64_t v7 = *MEMORY[0x1E4F3BC30];
    uint64_t v8 = *MEMORY[0x1E4F3BC40];
    uint64_t v9 = *MEMORY[0x1E4F3BC38];
    uint64_t v19 = *MEMORY[0x1E4F93250];
    uint64_t v10 = v5;
    do
    {
      v11 = [v22 objectAtIndex:v6];
      v12 = [v11 objectForKey:v20];
      v13 = [v11 objectForKey:v7];
      int v14 = [v13 isEqualToString:v8];

      if (v14)
      {
        v15 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v12];
        [v4 addObject:v15];

        v16 = [v11 objectForKey:v9];
        v17 = [(MCCertificateDetailsController *)self specifiersFromCertificateProperties:v16];
        [v4 addObjectsFromArray:v17];
      }
      else
      {
        v16 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v12 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
        v17 = [v11 objectForKey:v9];
        [v16 setProperty:v17 forKey:v19];
        [v4 addObject:v16];
      }

      ++v6;
    }
    while (v10 != v6);
  }

  return v4;
}

- (id)specifiersFromTrust:(__SecTrust *)a3
{
  uint64_t v4 = [(MCCertificateDetailsController *)self _propertiesFromTrust:a3];
  int v5 = [(MCCertificateDetailsController *)self specifiersFromCertificateProperties:v4];

  return v5;
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x1E4F92F08];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (!v3)
  {
    int v5 = MCUILocalizedString(@"CERT_DETAILS");
    [(MCCertificateDetailsController *)self setTitle:v5];

    uint64_t v6 = [(MCCertificateDetailsController *)self specifier];
    uint64_t v7 = [v6 propertyForKey:@"kMCCertificateDetailsTrustRefKey"];

    if (v7)
    {
      uint64_t v8 = [(MCCertificateDetailsController *)self specifiersFromTrust:v7];
      uint64_t v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v8;
    }
    else
    {
      uint64_t v10 = [(MCCertificateDetailsController *)self specifier];
      uint64_t v11 = [v10 propertyForKey:@"kMCCertificateDetailsCertificateRefKey"];

      if (v11)
      {
        uint64_t v12 = SecCertificateCopyProperties();
        if (v12)
        {
          v13 = (const void *)v12;
          int v14 = [(MCCertificateDetailsController *)self specifiersFromCertificateProperties:v12];
          v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v14;

          CFRelease(v13);
        }
      }
    }
    id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    if (!v3)
    {
      *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)MEMORY[0x1E4F1CBF0];

      id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    }
  }
  id v16 = v3;
  return v16;
}

- (void).cxx_destruct
{
}

@end