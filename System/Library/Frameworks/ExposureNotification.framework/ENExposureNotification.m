@interface ENExposureNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)revoked;
- (ENExposureClassification)classification;
- (ENExposureNotification)initWithCoder:(id)a3;
- (ENRegion)region;
- (NSDate)date;
- (NSDate)notificationDate;
- (NSString)localizedBodyText;
- (NSString)localizedDetailBodyText;
- (NSString)localizedSubjectText;
- (NSURL)learnMoreURL;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setClassification:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setLocalizedBodyText:(id)a3;
- (void)setLocalizedDetailBodyText:(id)a3;
- (void)setLocalizedSubjectText:(id)a3;
- (void)setNotificationDate:(id)a3;
- (void)setRegion:(id)a3;
- (void)setRevoked:(BOOL)a3;
@end

@implementation ENExposureNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENExposureNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ENExposureNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classification"];
    classification = v5->_classification;
    v5->_classification = (ENExposureClassification *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    legacyDate = v5->_legacyDate;
    v5->_legacyDate = (NSDate *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learnMoreURL"];
      learnMoreURL = v5->_learnMoreURL;
      v5->_learnMoreURL = (NSURL *)v14;

      v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textBody"];
      v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 copy];
        localizedBodyText = v5->_localizedBodyText;
        v5->_localizedBodyText = (NSString *)v18;

        uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailsTextBody"];
        localizedDetailBodyText = v5->_localizedDetailBodyText;
        v5->_localizedDetailBodyText = (NSString *)v20;

        v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textSubject"];
        v23 = v22;
        if (v22
          && ((uint64_t v24 = [v22 copy],
               localizedSubjectText = v5->_localizedSubjectText,
               v5->_localizedSubjectText = (NSString *)v24,
               localizedSubjectText,
               [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationDate"],
               (v26 = (NSDate *)objc_claimAutoreleasedReturnValue()) != 0)
           || (v26 = v5->_legacyDate) != 0))
        {
          uint64_t v27 = [(NSDate *)v26 copy];
          notificationDate = v5->_notificationDate;
          v5->_notificationDate = (NSDate *)v27;

          v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reg"];
          if (v29)
          {
            objc_storeStrong((id *)&v5->_region, v29);
            v5->_revoked = [v4 decodeBoolForKey:@"revoked"];
            v30 = v5;
          }
          else
          {
            v30 = 0;
          }
        }
        else
        {
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (NSDate)date
{
  v3 = self->_legacyDate;
  if (!v3)
  {
    v3 = [(ENExposureClassification *)self->_classification date];
    if (!v3) {
      v3 = self->_notificationDate;
    }
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  classification = self->_classification;
  id v5 = a3;
  [v5 encodeObject:classification forKey:@"classification"];
  [v5 encodeObject:self->_identifier forKey:@"id"];
  [v5 encodeObject:self->_learnMoreURL forKey:@"learnMoreURL"];
  [v5 encodeObject:self->_localizedBodyText forKey:@"textBody"];
  [v5 encodeObject:self->_localizedDetailBodyText forKey:@"detailsTextBody"];
  [v5 encodeObject:self->_localizedSubjectText forKey:@"textSubject"];
  [v5 encodeObject:self->_notificationDate forKey:@"notificationDate"];
  [v5 encodeObject:self->_region forKey:@"reg"];
  [v5 encodeBool:self->_revoked forKey:@"revoked"];
}

- (ENExposureClassification)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (NSString)localizedBodyText
{
  return self->_localizedBodyText;
}

- (void)setLocalizedBodyText:(id)a3
{
}

- (NSString)localizedDetailBodyText
{
  return self->_localizedDetailBodyText;
}

- (void)setLocalizedDetailBodyText:(id)a3
{
}

- (NSString)localizedSubjectText
{
  return self->_localizedSubjectText;
}

- (void)setLocalizedSubjectText:(id)a3
{
}

- (NSDate)notificationDate
{
  return self->_notificationDate;
}

- (void)setNotificationDate:(id)a3
{
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (BOOL)revoked
{
  return self->_revoked;
}

- (void)setRevoked:(BOOL)a3
{
  self->_revoked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_notificationDate, 0);
  objc_storeStrong((id *)&self->_localizedSubjectText, 0);
  objc_storeStrong((id *)&self->_localizedDetailBodyText, 0);
  objc_storeStrong((id *)&self->_localizedBodyText, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_classification, 0);

  objc_storeStrong((id *)&self->_legacyDate, 0);
}

@end