@interface FLFollowUpItem
+ (BOOL)supportsSecureCoding;
+ (id)_expirationDateFormatter;
+ (int64_t)_daysRemaining:(id)a3 ceiling:(BOOL)a4;
- (BOOL)_shouldAdjustInstanceToMidnight;
- (BOOL)displayExpirationDate;
- (BOOL)isExpired;
- (BOOL)isHSA2LoginItem;
- (BOOL)isHSA2PasswordResetItem;
- (BOOL)shouldPersistWhenActivated;
- (BOOL)shouldPersistWhenDismissed;
- (BOOL)showInSettings;
- (FLFollowUpItem)init;
- (FLFollowUpItem)initWithCoder:(id)a3;
- (FLFollowUpItem)initWithoutDefaults;
- (FLFollowUpNotification)notification;
- (NSArray)actions;
- (NSData)_userInfoData;
- (NSDate)expirationDate;
- (NSDictionary)userInfo;
- (NSString)accountIdentifier;
- (NSString)bundleIconName;
- (NSString)categoryIdentifier;
- (NSString)clientIdentifier;
- (NSString)collectionIdentifier;
- (NSString)delegateMachServiceName;
- (NSString)extensionIdentifier;
- (NSString)groupIdentifier;
- (NSString)informativeFooterText;
- (NSString)informativeText;
- (NSString)representingBundlePath;
- (NSString)targetBundleIdentifier;
- (NSString)title;
- (NSString)typeIdentifier;
- (NSString)uniqueIdentifier;
- (id)_informativeNotificationTextOrDate;
- (id)_midnightAdjustedDate;
- (id)_priorityFlagString;
- (id)_styleFlagsString;
- (id)description;
- (id)formattedExpirationDate;
- (unint64_t)displayStyle;
- (unint64_t)sqlID;
- (void)_userInfoData;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setActions:(id)a3;
- (void)setBundleIconName:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setDelegateMachServiceName:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setInformativeFooterText:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setNotification:(id)a3;
- (void)setRepresentingBundlePath:(id)a3;
- (void)setShouldPersistWhenActivated:(BOOL)a3;
- (void)setShouldPersistWhenDismissed:(BOOL)a3;
- (void)setShowInSettings:(BOOL)a3;
- (void)setSqlID:(unint64_t)a3;
- (void)setTargetBundleIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)set_userInfoData:(id)a3;
@end

@implementation FLFollowUpItem

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setTypeIdentifier:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (void)setShouldPersistWhenDismissed:(BOOL)a3
{
  self->_shouldPersistWhenDismissed = a3;
}

- (void)setShouldPersistWhenActivated:(BOOL)a3
{
  self->_shouldPersistWhenActivated = a3;
}

- (void)setRepresentingBundlePath:(id)a3
{
}

- (void)setInformativeText:(id)a3
{
}

- (void)setInformativeFooterText:(id)a3
{
}

- (void)setGroupIdentifier:(id)a3
{
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (void)setBundleIconName:(id)a3
{
}

- (void)setActions:(id)a3
{
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void)setNotification:(id)a3
{
}

- (void)set_userInfoData:(id)a3
{
  if (a3)
  {
    id v8 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v8];
    id v5 = v8;
    [(FLFollowUpItem *)self setUserInfo:v4];

    v6 = [(FLFollowUpItem *)self userInfo];

    if (!v6)
    {
      v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[FLFollowUpItem set_userInfoData:]();
      }
    }
  }
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (void)setTargetBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  targetBundleIdentifier = self->_targetBundleIdentifier;
  self->_targetBundleIdentifier = v5;

  char v7 = [v4 isEqualToString:@"com.apple.Preferences"];
  self->_showInSettings = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMachServiceName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIconName, 0);
  objc_storeStrong((id *)&self->_representingBundlePath, 0);
  objc_storeStrong((id *)&self->_informativeFooterText, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (FLFollowUpItem)initWithoutDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)FLFollowUpItem;
  return [(FLFollowUpItem *)&v3 init];
}

- (void)setShowInSettings:(BOOL)a3
{
  self->_showInSettings = a3;
  if (a3) {
    self->_targetBundleIdentifier = (NSString *)@"com.apple.Preferences";
  }
  else {
    self->_targetBundleIdentifier = 0;
  }

  MEMORY[0x1F41817F8]();
}

+ (id)_expirationDateFormatter
{
  if (_expirationDateFormatter_onceToken != -1) {
    dispatch_once(&_expirationDateFormatter_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_expirationDateFormatter_formatter;

  return v2;
}

uint64_t __42__FLFollowUpItem__expirationDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_expirationDateFormatter_formatter;
  _expirationDateFormatter_formatter = (uint64_t)v0;

  [(id)_expirationDateFormatter_formatter setTimeStyle:0];
  v2 = (void *)_expirationDateFormatter_formatter;

  return [v2 setDateStyle:2];
}

- (FLFollowUpItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)FLFollowUpItem;
  v2 = [(FLFollowUpItem *)&v9 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_showInSettings = 1;
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v5;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = (NSString *)@"com.apple.followup.group.device";

    objc_storeStrong((id *)&v3->_targetBundleIdentifier, @"com.apple.Preferences");
    objc_storeStrong((id *)&v3->_categoryIdentifier, @"com.apple.followupd.FLDefaultCategory");
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"_uniqueIdentifier"];
  [v5 encodeObject:self->_notification forKey:@"_notification"];
  [v5 encodeBool:self->_showInSettings forKey:@"_showInSettings"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_informativeText forKey:@"_informativeText"];
  [v5 encodeInteger:self->_displayStyle forKey:@"_displayStyle"];
  [v5 encodeBool:self->_shouldPersistWhenActivated forKey:@"_shouldPersistWhenActivated"];
  [v5 encodeBool:self->_shouldPersistWhenDismissed forKey:@"_shouldPersistWhenDismissed"];
  [v5 encodeObject:self->_actions forKey:@"_actions"];
  [v5 encodeObject:self->_userInfo forKey:@"_userInfo"];
  [v5 encodeInteger:self->_sqlID forKey:@"_sqlID"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"_clientIdentifier"];
  [v5 encodeObject:self->_delegateMachServiceName forKey:@"_delegateMachServiceName"];
  [v5 encodeObject:self->_extensionIdentifier forKey:@"_extensionIdentifier"];
  [v5 encodeObject:self->_groupIdentifier forKey:@"_groupIdentifier"];
  [v5 encodeObject:self->_collectionIdentifier forKey:@"_collectionIdentifier"];
  [v5 encodeObject:self->_targetBundleIdentifier forKey:@"_targetBundleIdentifier"];
  [v5 encodeObject:self->_representingBundlePath forKey:@"_representingBundlePath"];
  [v5 encodeObject:self->_bundleIconName forKey:@"_bundleIconName"];
  [v5 encodeObject:self->_informativeFooterText forKey:@"_informativeFooterText"];
  [v5 encodeObject:self->_categoryIdentifier forKey:@"_categoryIdentifier"];
  [v5 encodeObject:self->_expirationDate forKey:@"_expirationDate"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"_accountIdentifier"];
  [v5 encodeObject:self->_typeIdentifier forKey:@"_typeIdentifier"];
}

- (FLFollowUpItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FLFollowUpItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notification"];
    notification = v5->_notification;
    v5->_notification = (FLFollowUpNotification *)v8;

    v5->_showInSettings = [v4 decodeBoolForKey:@"_showInSettings"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v12;

    v5->_displayStyle = [v4 decodeIntegerForKey:@"_displayStyle"];
    v5->_shouldPersistWhenActivated = [v4 decodeBoolForKey:@"_shouldPersistWhenActivated"];
    v5->_shouldPersistWhenDismissed = [v4 decodeBoolForKey:@"_shouldPersistWhenDismissed"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v25;

    v5->_sqlID = [v4 decodeIntegerForKey:@"_sqlID"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_delegateMachServiceName"];
    delegateMachServiceName = v5->_delegateMachServiceName;
    v5->_delegateMachServiceName = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionIdentifier"];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_collectionIdentifier"];
    collectionIdentifier = v5->_collectionIdentifier;
    v5->_collectionIdentifier = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetBundleIdentifier"];
    targetBundleIdentifier = v5->_targetBundleIdentifier;
    v5->_targetBundleIdentifier = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_representingBundlePath"];
    representingBundlePath = v5->_representingBundlePath;
    v5->_representingBundlePath = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIconName"];
    bundleIconName = v5->_bundleIconName;
    v5->_bundleIconName = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_informativeFooterText"];
    informativeFooterText = v5->_informativeFooterText;
    v5->_informativeFooterText = (NSString *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_categoryIdentifier"];
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_typeIdentifier"];
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v51;
  }
  return v5;
}

- (NSData)_userInfoData
{
  objc_super v3 = [(FLFollowUpItem *)self userInfo];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [(FLFollowUpItem *)self userInfo];
    id v9 = 0;
    objc_super v3 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v9];
    id v6 = v9;

    if (!v3)
    {
      char v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[FLFollowUpItem _userInfoData]();
      }
    }
  }

  return (NSData *)v3;
}

- (BOOL)_shouldAdjustInstanceToMidnight
{
  v2 = [(FLFollowUpItem *)self userInfo];
  objc_super v3 = [v2 objectForKeyedSubscript:@"FLUserInfoPropertyAdjustExpirationToMidnight"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_midnightAdjustedDate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = self->_expirationDate;
  char v4 = [(FLFollowUpItem *)self expirationDate];
  if (v4 && [(FLFollowUpItem *)self _shouldAdjustInstanceToMidnight])
  {
    id v5 = +[FLEnvironment currentEnvironment];
    int v6 = [v5 normalizeExpirationToMidnight];

    if (v6)
    {
      char v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v8 = [(FLFollowUpItem *)self expirationDate];
      id v9 = [v7 components:30 fromDate:v8];

      objc_msgSend(v7, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", objc_msgSend(v9, "era"), objc_msgSend(v9, "year"), objc_msgSend(v9, "month"), objc_msgSend(v9, "day"), 23, 59, 0, 0);
      uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = _FLLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          expirationDate = self->_expirationDate;
          *(_DWORD *)buf = 138412802;
          uint64_t v15 = v9;
          __int16 v16 = 2112;
          uint64_t v17 = v7;
          __int16 v18 = 2112;
          v19 = expirationDate;
          _os_log_error_impl(&dword_1BE24A000, v11, OS_LOG_TYPE_ERROR, "Could not build midnight adjusted date with comoponents %@ from calendar %@, reverting to expiration date as is %@", buf, 0x20u);
        }

        uint64_t v10 = self->_expirationDate;
      }

      objc_super v3 = v10;
    }
  }
  else
  {
  }

  return v3;
}

- (BOOL)isExpired
{
  v2 = [(FLFollowUpItem *)self _midnightAdjustedDate];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v4 = [v2 compare:v3] == -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)displayExpirationDate
{
  objc_super v3 = [(FLFollowUpItem *)self expirationDate];

  int v6 = [(FLFollowUpItem *)self userInfo];
  BOOL v4 = [v6 objectForKeyedSubscript:@"FLUserInfoPropertyDontDisplayDate"];

  objc_opt_class();
  int v5 = objc_opt_isKindOfClass() ^ 1;
  LOBYTE(v6) = v5 & (v3 != 0);
  if ((v5 & 1) == 0 && v3) {
    LODWORD(v6) = [v4 BOOLValue] ^ 1;
  }

  return (char)v6;
}

- (id)formattedExpirationDate
{
  objc_super v3 = [(FLFollowUpItem *)self _midnightAdjustedDate];
  if (!v3)
  {
    uint64_t v17 = 0;
    goto LABEL_21;
  }
  BOOL v4 = [(FLFollowUpItem *)self userInfo];
  int v5 = [v4 objectForKeyedSubscript:@"FLUserInfoPropertyAbsoluteFormat"];

  int v6 = [(FLFollowUpItem *)self userInfo];
  char v7 = [v6 objectForKeyedSubscript:@"FLUserInfoPropertyRelativeZeroDay"];

  uint64_t v8 = [(FLFollowUpItem *)self userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"FLUserInfoPropertyRelativeSingleDay"];

  uint64_t v10 = [(FLFollowUpItem *)self userInfo];
  v11 = [v10 objectForKeyedSubscript:@"FLUserInfoPropertyRelativePluralDaysFormat"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [(FLFollowUpItem *)self userInfo];
      v13 = [v12 objectForKeyedSubscript:@"FLUserInfoPropertyRelativeIsCeiling"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = [v13 BOOLValue];
      }
      else {
        uint64_t v14 = 0;
      }
      int64_t v21 = +[FLFollowUpItem _daysRemaining:v3 ceiling:v14];
      if (v21 == 1)
      {
        id v16 = v9;
        goto LABEL_17;
      }
      if (!v21)
      {
        id v16 = v7;
        goto LABEL_17;
      }
      uint64_t v22 = NSString;
      uint64_t v20 = [NSNumber numberWithInteger:v21];
      objc_msgSend(v22, "localizedStringWithFormat:", v11, v20);
      uint64_t v17 = LABEL_19:;

      goto LABEL_20;
    }
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    __int16 v18 = +[FLFollowUpItem _expirationDateFormatter];
    v13 = [v18 stringFromDate:v3];

    v19 = NSString;
    uint64_t v20 = FLLoc(@"ITEM_EXPIRATION_FORMAT");
    objc_msgSend(v19, "localizedStringWithFormat:", v20, v13);
    goto LABEL_19;
  }
  uint64_t v15 = +[FLFollowUpItem _expirationDateFormatter];
  v13 = [v15 stringFromDate:v3];

  objc_msgSend(NSString, "localizedStringWithFormat:", v5, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
  uint64_t v17 = v16;
LABEL_20:

LABEL_21:

  return v17;
}

- (id)_informativeNotificationTextOrDate
{
  objc_super v3 = [(FLFollowUpItem *)self notification];
  BOOL v4 = [v3 informativeText];

  int v5 = [(FLFollowUpItem *)self notification];
  int v6 = [v5 informativeText];
  char v7 = v6;
  if (!v6) {
    int v6 = &stru_1F18D0680;
  }
  if (-[__CFString isEqualToString:](v6, "isEqualToString:"))
  {
    BOOL v8 = [(FLFollowUpItem *)self displayExpirationDate];

    if (!v8) {
      goto LABEL_8;
    }
    [(FLFollowUpItem *)self formattedExpirationDate];
    v4 = int v5 = v4;
  }
  else
  {
  }
LABEL_8:

  return v4;
}

+ (int64_t)_daysRemaining:(id)a3 ceiling:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int v6 = +[FLEnvironment currentEnvironment];
  [v6 oneDayTimeInterval];
  double v8 = v7;

  [v5 timeIntervalSinceNow];
  double v10 = v9;

  double v11 = ceil(v10 / v8);
  double v12 = floor(v10 / v8);
  if (v4) {
    return (uint64_t)v11;
  }
  return (uint64_t)v12;
}

- (id)description
{
  v24 = NSString;
  uint64_t v3 = [(id)objc_opt_class() description];
  uniqueIdentifier = self->_uniqueIdentifier;
  uint64_t v23 = (void *)v3;
  groupIdentifier = self->_groupIdentifier;
  clientIdentifier = self->_clientIdentifier;
  actions = self->_actions;
  typeIdentifier = self->_typeIdentifier;
  accountIdentifier = self->_accountIdentifier;
  title = self->_title;
  targetBundleIdentifier = self->_targetBundleIdentifier;
  notification = self->_notification;
  collectionIdentifier = self->_collectionIdentifier;
  representingBundlePath = self->_representingBundlePath;
  bundleIconName = self->_bundleIconName;
  informativeFooterText = self->_informativeFooterText;
  categoryIdentifier = self->_categoryIdentifier;
  extensionIdentifier = self->_extensionIdentifier;
  double v11 = [(FLFollowUpItem *)self _styleFlagsString];
  double v12 = [(FLFollowUpItem *)self _priorityFlagString];
  objc_msgSend(v24, "stringWithFormat:", @"<%@: %p - UID:%@\nEID:%@\nTBI:%@\nClientID:%@\nGID:%@\nCollection:%@\nAccountID:%@\nTypeID:%@\ntitle:%@\nactions:%@\nnotification:%@\nrepresentingBundlePath:%@\nbundleIconName:%@\ninformativeFooterText:%@\nCategoryID:%@\nStyle:%@\nPriority:%@\nExpires:%@", v23, self, uniqueIdentifier, extensionIdentifier, targetBundleIdentifier, clientIdentifier, groupIdentifier, collectionIdentifier, accountIdentifier, typeIdentifier, title, actions, notification, representingBundlePath, bundleIconName, informativeFooterText,
    categoryIdentifier,
    v11,
    v12,
  v13 = self->_expirationDate);

  return v13;
}

- (id)_styleFlagsString
{
  [(FLFollowUpItem *)self displayStyle];
  uint64_t v3 = NSString;
  if (([(FLFollowUpItem *)self displayStyle] & 0x10) != 0) {
    BOOL v4 = @"YES";
  }
  else {
    BOOL v4 = @"NO";
  }
  if (([(FLFollowUpItem *)self displayStyle] & 8) != 0) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  if (([(FLFollowUpItem *)self displayStyle] & 2) != 0) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"omit badge: %@, badge only: %@, zero action: %@", v4, v5, v6];
}

- (id)_priorityFlagString
{
  if ([(FLFollowUpItem *)self displayStyle]) {
    return @"High";
  }
  if (([(FLFollowUpItem *)self displayStyle] & 4) != 0) {
    return @"Critical";
  }
  return @"Default";
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (FLFollowUpNotification)notification
{
  return self->_notification;
}

- (BOOL)showInSettings
{
  return self->_showInSettings;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (NSString)informativeFooterText
{
  return self->_informativeFooterText;
}

- (NSString)representingBundlePath
{
  return self->_representingBundlePath;
}

- (NSString)bundleIconName
{
  return self->_bundleIconName;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)accountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)actions
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)shouldPersistWhenActivated
{
  return self->_shouldPersistWhenActivated;
}

- (BOOL)shouldPersistWhenDismissed
{
  return self->_shouldPersistWhenDismissed;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)delegateMachServiceName
{
  return self->_delegateMachServiceName;
}

- (void)setDelegateMachServiceName:(id)a3
{
}

- (BOOL)isHSA2LoginItem
{
  v2 = [(FLFollowUpItem *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"FLHSA2LoginNotification"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isHSA2PasswordResetItem
{
  v2 = [(FLFollowUpItem *)self userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"FLHSA2PasswordResetNotification"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)_userInfoData
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE24A000, v0, v1, "%@: Failed to serialize userInfo for item %@ with error %@");
}

- (void)set_userInfoData:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE24A000, v0, v1, "%@: Failed to deserialize userInfo for item %@ with error %@");
}

@end