@interface ASDBetaAppLaunchInfo
+ (BOOL)supportsSecureCoding;
- (ASDBetaAppDisplayNames)displayNames;
- (ASDBetaAppLaunchInfo)initWithCoder:(id)a3;
- (ASDBetaAppVersion)version;
- (BOOL)hasSharedFeedback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeedbackEnabled;
- (BOOL)isLaunchScreenEnabled;
- (NSDate)expirationDate;
- (NSDate)lastWelcomeScreenViewDate;
- (NSDictionary)localizedTestNotes;
- (NSString)artistName;
- (NSString)iconURLTemplate;
- (NSString)testerEmail;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setDisplayNames:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFeedbackEnabled:(BOOL)a3;
- (void)setIconURLTemplate:(id)a3;
- (void)setLastWelcomeScreenViewDate:(id)a3;
- (void)setLaunchScreenEnabled:(BOOL)a3;
- (void)setLocalizedTestNotes:(id)a3;
- (void)setSharedFeedback:(BOOL)a3;
- (void)setTesterEmail:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ASDBetaAppLaunchInfo

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ by %@ (%@):\nFeedback Enabled: %d\nLaunch Screen Enabled: %d\nWhat to Test: %@", self->_displayNames, self->_artistName, self->_version, self->_feedbackEnabled, self->_launchScreenEnabled, self->_localizedTestNotes];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASDBetaAppLaunchInfo *)a3;
  if (self == v4)
  {
    char v26 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()) {
      goto LABEL_15;
    }
    artistName = self->_artistName;
    v7 = [(ASDBetaAppLaunchInfo *)v4 artistName];
    LODWORD(artistName) = [(NSString *)artistName isEqualToString:v7];

    if (!artistName) {
      goto LABEL_15;
    }
    displayNames = self->_displayNames;
    v9 = [(ASDBetaAppLaunchInfo *)v4 displayNames];
    LODWORD(displayNames) = [(ASDBetaAppDisplayNames *)displayNames isEqual:v9];

    if (!displayNames) {
      goto LABEL_15;
    }
    expirationDate = self->_expirationDate;
    v11 = [(ASDBetaAppLaunchInfo *)v4 expirationDate];
    LODWORD(expirationDate) = [(NSDate *)expirationDate isEqual:v11];

    if (!expirationDate) {
      goto LABEL_15;
    }
    BOOL feedbackEnabled = self->_feedbackEnabled;
    if (feedbackEnabled != [(ASDBetaAppLaunchInfo *)v4 isFeedbackEnabled]) {
      goto LABEL_15;
    }
    iconURLTemplate = self->_iconURLTemplate;
    v14 = [(ASDBetaAppLaunchInfo *)v4 iconURLTemplate];
    LODWORD(iconURLTemplate) = [(NSString *)iconURLTemplate isEqualToString:v14];

    if (!iconURLTemplate) {
      goto LABEL_15;
    }
    if (self->_lastWelcomeScreenViewDate)
    {
      uint64_t v15 = [(ASDBetaAppLaunchInfo *)v4 lastWelcomeScreenViewDate];
      if (v15)
      {
        v16 = (void *)v15;
        lastWelcomeScreenViewDate = self->_lastWelcomeScreenViewDate;
        v18 = [(ASDBetaAppLaunchInfo *)v4 lastWelcomeScreenViewDate];
        LODWORD(lastWelcomeScreenViewDate) = [(NSDate *)lastWelcomeScreenViewDate isEqualToDate:v18];

        if (!lastWelcomeScreenViewDate) {
          goto LABEL_15;
        }
      }
    }
    localizedTestNotes = self->_localizedTestNotes;
    v20 = [(ASDBetaAppLaunchInfo *)v4 localizedTestNotes];
    LODWORD(localizedTestNotes) = [(NSDictionary *)localizedTestNotes isEqual:v20];

    if (!localizedTestNotes) {
      goto LABEL_15;
    }
    BOOL sharedFeedback = self->_sharedFeedback;
    if (sharedFeedback == [(ASDBetaAppLaunchInfo *)v4 hasSharedFeedback]
      && (testerEmail = self->_testerEmail,
          [(ASDBetaAppLaunchInfo *)v4 testerEmail],
          v23 = objc_claimAutoreleasedReturnValue(),
          LODWORD(testerEmail) = [(NSString *)testerEmail isEqualToString:v23],
          v23,
          testerEmail))
    {
      version = self->_version;
      v25 = [(ASDBetaAppLaunchInfo *)v4 version];
      char v26 = [(ASDBetaAppVersion *)version isEqual:v25];
    }
    else
    {
LABEL_15:
      char v26 = 0;
    }
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  artistName = self->_artistName;
  id v5 = a3;
  [v5 encodeObject:artistName forKey:@"A"];
  [v5 encodeObject:self->_displayNames forKey:@"B"];
  [v5 encodeObject:self->_expirationDate forKey:@"C"];
  [v5 encodeBool:self->_feedbackEnabled forKey:@"D"];
  [v5 encodeObject:self->_iconURLTemplate forKey:@"E"];
  [v5 encodeObject:self->_lastWelcomeScreenViewDate forKey:@"K"];
  [v5 encodeBool:self->_launchScreenEnabled forKey:@"F"];
  [v5 encodeObject:self->_localizedTestNotes forKey:@"I"];
  [v5 encodeBool:self->_sharedFeedback forKey:@"G"];
  [v5 encodeObject:self->_testerEmail forKey:@"H"];
  [v5 encodeObject:self->_version forKey:@"J"];
}

- (ASDBetaAppLaunchInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ASDBetaAppLaunchInfo;
  id v5 = [(ASDBetaAppLaunchInfo *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    displayNames = v5->_displayNames;
    v5->_displayNames = (ASDBetaAppDisplayNames *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"C"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v5->_BOOL feedbackEnabled = [v4 decodeBoolForKey:@"D"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"E"];
    iconURLTemplate = v5->_iconURLTemplate;
    v5->_iconURLTemplate = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"K"];
    lastWelcomeScreenViewDate = v5->_lastWelcomeScreenViewDate;
    v5->_lastWelcomeScreenViewDate = (NSDate *)v14;

    v5->_launchScreenEnabled = [v4 decodeBoolForKey:@"F"];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"I"];
    localizedTestNotes = v5->_localizedTestNotes;
    v5->_localizedTestNotes = (NSDictionary *)v19;

    v5->_BOOL sharedFeedback = [v4 decodeBoolForKey:@"G"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"H"];
    testerEmail = v5->_testerEmail;
    v5->_testerEmail = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"J"];
    version = v5->_version;
    v5->_version = (ASDBetaAppVersion *)v23;
  }
  return v5;
}

- (NSString)artistName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArtistName:(id)a3
{
}

- (ASDBetaAppDisplayNames)displayNames
{
  return (ASDBetaAppDisplayNames *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayNames:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isFeedbackEnabled
{
  return self->_feedbackEnabled;
}

- (void)setFeedbackEnabled:(BOOL)a3
{
  self->_BOOL feedbackEnabled = a3;
}

- (NSString)iconURLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIconURLTemplate:(id)a3
{
}

- (NSDate)lastWelcomeScreenViewDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastWelcomeScreenViewDate:(id)a3
{
}

- (BOOL)isLaunchScreenEnabled
{
  return self->_launchScreenEnabled;
}

- (void)setLaunchScreenEnabled:(BOOL)a3
{
  self->_launchScreenEnabled = a3;
}

- (NSDictionary)localizedTestNotes
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedTestNotes:(id)a3
{
}

- (BOOL)hasSharedFeedback
{
  return self->_sharedFeedback;
}

- (void)setSharedFeedback:(BOOL)a3
{
  self->_BOOL sharedFeedback = a3;
}

- (NSString)testerEmail
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTesterEmail:(id)a3
{
}

- (ASDBetaAppVersion)version
{
  return (ASDBetaAppVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_testerEmail, 0);
  objc_storeStrong((id *)&self->_localizedTestNotes, 0);
  objc_storeStrong((id *)&self->_lastWelcomeScreenViewDate, 0);
  objc_storeStrong((id *)&self->_iconURLTemplate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end