@interface ENRegionUserConsent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ENRegionUserConsent)initWithCoder:(id)a3;
- (ENRegionUserConsent)initWithConsentVersion:(id)a3;
- (NSString)consentText;
- (NSString)consentVersion;
- (double)consentTimestamp;
- (double)differentialPrivacyConsentTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updatedConsent:(id)a3;
- (int64_t)consent;
- (int64_t)differentialPrivacyConsent;
- (void)encodeWithCoder:(id)a3;
- (void)setConsent:(int64_t)a3;
- (void)setConsentText:(id)a3;
- (void)setConsentTimestamp:(double)a3;
- (void)setConsentVersion:(id)a3;
- (void)setDifferentialPrivacyConsent:(int64_t)a3;
- (void)setDifferentialPrivacyConsentTimestamp:(double)a3;
@end

@implementation ENRegionUserConsent

- (ENRegionUserConsent)initWithConsentVersion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENRegionUserConsent;
  v6 = [(ENRegionUserConsent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_consentVersion, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ENRegionUserConsent *)self consentVersion];
  unint64_t v5 = [(ENRegionUserConsent *)self consent];
  if (v5 > 4) {
    v6 = "?";
  }
  else {
    v6 = (&off_2642452A0)[v5];
  }
  [(ENRegionUserConsent *)self consentTimestamp];
  uint64_t v8 = v7;
  unint64_t v9 = [(ENRegionUserConsent *)self differentialPrivacyConsent];
  if (v9 > 4) {
    v10 = "?";
  }
  else {
    v10 = (&off_2642452A0)[v9];
  }
  [(ENRegionUserConsent *)self differentialPrivacyConsentTimestamp];
  v12 = [v3 stringWithFormat:@"Consent [version: %@] - %s, ConsentTimestamp: %f, DPConsent: %s, DPConsentTimestamp: %f", v4, v6, v8, v10, v11];

  return v12;
}

- (ENRegionUserConsent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ENRegionUserConsent;
  unint64_t v5 = [(ENRegionUserConsent *)&v14 init];
  if (!v5) {
    goto LABEL_4;
  }
  v5->_consent = [v4 decodeIntegerForKey:@"consent"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consentText"];
  consentText = v5->_consentText;
  v5->_consentText = (NSString *)v6;

  [v4 decodeDoubleForKey:@"consentTimestamp"];
  v5->_consentTimestamp = v8;
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consentVersion"];
  if (v9)
  {
    consentVersion = v5->_consentVersion;
    v5->_consentVersion = (NSString *)v9;

    v5->_differentialPrivacyConsent = [v4 decodeIntegerForKey:@"differentialPrivacyConsent"];
    [v4 decodeDoubleForKey:@"differentialPrivacyConsentTimestamp"];
    v5->_differentialPrivacyConsentTimestamp = v11;
LABEL_4:
    v12 = v5;
    goto LABEL_5;
  }
  if (gLogCategory_ENRegionConfiguration <= 30
    && (gLogCategory_ENRegionConfiguration != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v12 = 0;
LABEL_5:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[ENRegionUserConsent consent](self, "consent"), @"consent");
  id v4 = [(ENRegionUserConsent *)self consentText];
  [v6 encodeObject:v4 forKey:@"consentText"];

  [(ENRegionUserConsent *)self consentTimestamp];
  objc_msgSend(v6, "encodeDouble:forKey:", @"consentTimestamp");
  unint64_t v5 = [(ENRegionUserConsent *)self consentVersion];
  [v6 encodeObject:v5 forKey:@"consentVersion"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[ENRegionUserConsent differentialPrivacyConsent](self, "differentialPrivacyConsent"), @"differentialPrivacyConsent");
  [(ENRegionUserConsent *)self differentialPrivacyConsentTimestamp];
  objc_msgSend(v6, "encodeDouble:forKey:", @"differentialPrivacyConsentTimestamp");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ENRegionUserConsent allocWithZone:a3] initWithConsentVersion:self->_consentVersion];
  [(ENRegionUserConsent *)v4 setConsent:[(ENRegionUserConsent *)self consent]];
  [(ENRegionUserConsent *)self consentTimestamp];
  -[ENRegionUserConsent setConsentTimestamp:](v4, "setConsentTimestamp:");
  [(ENRegionUserConsent *)v4 setDifferentialPrivacyConsent:[(ENRegionUserConsent *)self differentialPrivacyConsent]];
  [(ENRegionUserConsent *)self differentialPrivacyConsentTimestamp];
  -[ENRegionUserConsent setDifferentialPrivacyConsentTimestamp:](v4, "setDifferentialPrivacyConsentTimestamp:");
  return v4;
}

- (id)updatedConsent:(id)a3
{
  id v6 = (ENRegionUserConsent *)a3;
  uint64_t v7 = (void *)[(ENRegionUserConsent *)self copy];
  if ([v7 consent] != 4 && !-[ENRegionUserConsent consent](v6, "consent")
    || (uint64_t v8 = [(ENRegionUserConsent *)v6 consent],
        int64_t v9 = [(ENRegionUserConsent *)self consent],
        v10 = v6,
        v8 == v9))
  {
    v10 = self;
  }
  objc_msgSend(v7, "setConsent:", -[ENRegionUserConsent consent](v10, "consent"));
  double v11 = [(ENRegionUserConsent *)v6 consentText];
  uint64_t v12 = [v11 length];
  if (!v12) {
    goto LABEL_12;
  }
  v13 = [(ENRegionUserConsent *)v6 consentText];
  objc_super v14 = [(ENRegionUserConsent *)self consentText];
  id v3 = v13;
  id v15 = v14;
  if (v3 == v15)
  {

    id v4 = v3;
    goto LABEL_12;
  }
  id v4 = v15;
  if ((v3 == 0) != (v15 != 0))
  {
    char v16 = [v3 isEqual:v15];

    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(ENRegionUserConsent *)self consentText];
    [v7 setConsentText:v17];

    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

LABEL_15:
  v18 = [(ENRegionUserConsent *)v6 consentText];
  [v7 setConsentText:v18];

LABEL_16:
LABEL_17:

  v19 = [(ENRegionUserConsent *)v6 consentVersion];
  uint64_t v20 = [v19 length];
  if (!v20
    || ([(ENRegionUserConsent *)v6 consentVersion],
        id v3 = (id)objc_claimAutoreleasedReturnValue(),
        [(ENRegionUserConsent *)self consentVersion],
        id v4 = objc_claimAutoreleasedReturnValue(),
        ([v3 isEqualToString:v4] & 1) != 0))
  {
    v22 = [(ENRegionUserConsent *)self consentVersion];
    [v7 setConsentVersion:v22];

    if (!v20) {
      goto LABEL_22;
    }
  }
  else
  {
    v21 = [(ENRegionUserConsent *)v6 consentVersion];
    [v7 setConsentVersion:v21];
  }
LABEL_22:

  if ([v7 differentialPrivacyConsent] != 4
    && ![(ENRegionUserConsent *)v6 differentialPrivacyConsent]
    || (uint64_t v23 = [(ENRegionUserConsent *)v6 differentialPrivacyConsent],
        int64_t v24 = [(ENRegionUserConsent *)self differentialPrivacyConsent],
        v25 = v6,
        v23 == v24))
  {
    v25 = self;
  }
  objc_msgSend(v7, "setDifferentialPrivacyConsent:", -[ENRegionUserConsent differentialPrivacyConsent](v25, "differentialPrivacyConsent"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(ENRegionUserConsent *)self consent];
    if (v5 == [v4 consent])
    {
      id v6 = [(ENRegionUserConsent *)self consentText];
      uint64_t v7 = [v4 consentText];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v12 = 0;
          objc_super v14 = v9;
          v13 = v8;
LABEL_13:

          goto LABEL_14;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          BOOL v12 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v13 = [(ENRegionUserConsent *)self consentVersion];
      objc_super v14 = [v4 consentVersion];
      if ([v13 isEqualToString:v14])
      {
        int64_t v15 = [(ENRegionUserConsent *)self differentialPrivacyConsent];
        BOOL v12 = v15 == [v4 differentialPrivacyConsent];
      }
      else
      {
        BOOL v12 = 0;
      }
      goto LABEL_13;
    }
  }
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (void)setConsent:(int64_t)a3
{
  self->_consent = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  self->_consentTimestamp = v4;
}

- (void)setDifferentialPrivacyConsent:(int64_t)a3
{
  self->_differentialPrivacyConsent = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  self->_differentialPrivacyConsentTimestamp = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)consent
{
  return self->_consent;
}

- (NSString)consentText
{
  return self->_consentText;
}

- (void)setConsentText:(id)a3
{
}

- (double)consentTimestamp
{
  return self->_consentTimestamp;
}

- (void)setConsentTimestamp:(double)a3
{
  self->_consentTimestamp = a3;
}

- (NSString)consentVersion
{
  return self->_consentVersion;
}

- (void)setConsentVersion:(id)a3
{
}

- (int64_t)differentialPrivacyConsent
{
  return self->_differentialPrivacyConsent;
}

- (double)differentialPrivacyConsentTimestamp
{
  return self->_differentialPrivacyConsentTimestamp;
}

- (void)setDifferentialPrivacyConsentTimestamp:(double)a3
{
  self->_differentialPrivacyConsentTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentVersion, 0);

  objc_storeStrong((id *)&self->_consentText, 0);
}

@end