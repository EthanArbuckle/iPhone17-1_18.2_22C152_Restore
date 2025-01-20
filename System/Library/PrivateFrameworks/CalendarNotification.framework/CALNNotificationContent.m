@interface CALNNotificationContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualForDiffingPurposesToContent:(id)a3;
- (BOOL)isEqualToContent:(id)a3;
- (BOOL)shouldHideTime;
- (BOOL)shouldSuppressSyncDismissalWhenRemoved;
- (CALNNotificationContent)initWithCoder:(id)a3;
- (CALNNotificationSound)sound;
- (NSArray)peopleIdentifiers;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSDictionary)userInfo;
- (NSString)body;
- (NSString)categoryIdentifier;
- (NSString)filterCriteria;
- (NSString)iconIdentifier;
- (NSString)sectionIdentifier;
- (NSString)subtitle;
- (NSString)threadIdentifier;
- (NSString)title;
- (NSURL)defaultActionURL;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 sectionIdentifier:(id)a7 date:(id)a8 expirationDate:(id)a9 defaultActionURL:(id)a10 iconIdentifier:(id)a11 shouldHideTime:(BOOL)a12 shouldSuppressSyncDismissalWhenRemoved:(BOOL)a13 peopleIdentifiers:(id)a14 sound:(id)a15 userInfo:(id)a16 threadIdentifier:(id)a17 interruptionLevel:(unint64_t)a18 filterCriteria:(id)a19;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)interruptionLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNNotificationContent

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 sectionIdentifier:(id)a7 date:(id)a8 expirationDate:(id)a9 defaultActionURL:(id)a10 iconIdentifier:(id)a11 shouldHideTime:(BOOL)a12 shouldSuppressSyncDismissalWhenRemoved:(BOOL)a13 peopleIdentifiers:(id)a14 sound:(id)a15 userInfo:(id)a16 threadIdentifier:(id)a17 interruptionLevel:(unint64_t)a18 filterCriteria:(id)a19
{
  id v24 = a3;
  id v25 = a4;
  id v69 = a5;
  id v68 = a6;
  id v67 = a7;
  id v66 = a8;
  v26 = v25;
  id v65 = a9;
  id v64 = a10;
  id v63 = a11;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a19;
  v70.receiver = self;
  v70.super_class = (Class)CALNNotificationContent;
  v32 = [(CALNNotificationContent *)&v70 init];
  if (v32)
  {
    uint64_t v33 = [v24 copy];
    title = v32->_title;
    v32->_title = (NSString *)v33;

    uint64_t v35 = [v26 copy];
    subtitle = v32->_subtitle;
    v32->_subtitle = (NSString *)v35;

    uint64_t v37 = [v69 copy];
    body = v32->_body;
    v32->_body = (NSString *)v37;

    uint64_t v39 = [v68 copy];
    categoryIdentifier = v32->_categoryIdentifier;
    v32->_categoryIdentifier = (NSString *)v39;

    uint64_t v41 = [v67 copy];
    sectionIdentifier = v32->_sectionIdentifier;
    v32->_sectionIdentifier = (NSString *)v41;

    uint64_t v43 = [v66 copy];
    date = v32->_date;
    v32->_date = (NSDate *)v43;

    uint64_t v45 = [v65 copy];
    expirationDate = v32->_expirationDate;
    v32->_expirationDate = (NSDate *)v45;

    uint64_t v47 = [v64 copy];
    defaultActionURL = v32->_defaultActionURL;
    v32->_defaultActionURL = (NSURL *)v47;

    uint64_t v49 = [v63 copy];
    iconIdentifier = v32->_iconIdentifier;
    v32->_iconIdentifier = (NSString *)v49;

    v32->_shouldHideTime = a12;
    v32->_shouldSuppressSyncDismissalWhenRemoved = a13;
    uint64_t v51 = [v27 copy];
    peopleIdentifiers = v32->_peopleIdentifiers;
    v32->_peopleIdentifiers = (NSArray *)v51;

    uint64_t v53 = [v28 copy];
    sound = v32->_sound;
    v32->_sound = (CALNNotificationSound *)v53;

    uint64_t v55 = [v29 copy];
    userInfo = v32->_userInfo;
    v32->_userInfo = (NSDictionary *)v55;

    uint64_t v57 = [v30 copy];
    threadIdentifier = v32->_threadIdentifier;
    v32->_threadIdentifier = (NSString *)v57;

    v32->_interruptionLevel = a18;
    uint64_t v59 = [v31 copy];
    filterCriteria = v32->_filterCriteria;
    v32->_filterCriteria = (NSString *)v59;
  }
  return v32;
}

- (id)description
{
  v20 = NSString;
  uint64_t v19 = objc_opt_class();
  v23 = [(CALNNotificationContent *)self title];
  v26 = ICSRedactString();
  v22 = [(CALNNotificationContent *)self subtitle];
  id v24 = ICSRedactString();
  v21 = [(CALNNotificationContent *)self body];
  id v25 = ICSRedactString();
  v18 = [(CALNNotificationContent *)self categoryIdentifier];
  v17 = [(CALNNotificationContent *)self sectionIdentifier];
  v16 = [(CALNNotificationContent *)self date];
  v15 = [(CALNNotificationContent *)self expirationDate];
  v13 = [(CALNNotificationContent *)self defaultActionURL];
  v14 = [(CALNNotificationContent *)self iconIdentifier];
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNNotificationContent shouldHideTime](self, "shouldHideTime"));
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"));
  v10 = [(CALNNotificationContent *)self peopleIdentifiers];
  v3 = [(CALNNotificationContent *)self sound];
  v4 = [(CALNNotificationContent *)self threadIdentifier];
  unint64_t v5 = [(CALNNotificationContent *)self interruptionLevel];
  v6 = [(CALNNotificationContent *)self filterCriteria];
  v7 = [(CALNNotificationContent *)self userInfo];
  objc_msgSend(v20, "stringWithFormat:", @"<%@: %p>(title = %@, subtitle = %@, body = %@, categoryIdentifier = %@, sectionIdentifier = %@, date = %@, expirationDate = %@, defaultActionURL = %@, iconIdentifier = %@, shouldHideTime = %@, shouldSuppressSyncDismissalWhenRemoved = %@, peopleIdentifiers = %@, sound = %@, threadIdentifier = %@, interruptionLevel = %lu, filterCriteria = %@, userInfo = %@)", v19, self, v26, v24, v25, v18, v17, v16, v15, v13, v14, v12, v11, v10, v3, v4,
    v5,
    v6,
  v8 = v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationContent *)self isEqualToContent:v4];

  return v5;
}

- (BOOL)isEqualToContent:(id)a3
{
  id v4 = (CALNNotificationContent *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(CALNNotificationContent *)self isEqualForDiffingPurposesToContent:v4])
  {
    BOOL v5 = [(CALNNotificationContent *)self expirationDate];
    v6 = [(CALNNotificationContent *)v4 expirationDate];
    char v7 = CalEqualObjects();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualForDiffingPurposesToContent:(id)a3
{
  id v4 = (CALNNotificationContent *)a3;
  if (self == v4)
  {
    char v46 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotificationContent *)self title];
    v6 = [(CALNNotificationContent *)v4 title];
    int v7 = CalEqualStrings();

    if (!v7) {
      goto LABEL_18;
    }
    v8 = [(CALNNotificationContent *)self subtitle];
    v9 = [(CALNNotificationContent *)v4 subtitle];
    int v10 = CalEqualStrings();

    if (!v10) {
      goto LABEL_18;
    }
    v11 = [(CALNNotificationContent *)self body];
    v12 = [(CALNNotificationContent *)v4 body];
    int v13 = CalEqualStrings();

    if (!v13) {
      goto LABEL_18;
    }
    v14 = [(CALNNotificationContent *)self categoryIdentifier];
    v15 = [(CALNNotificationContent *)v4 categoryIdentifier];
    int v16 = CalEqualStrings();

    if (!v16) {
      goto LABEL_18;
    }
    v17 = [(CALNNotificationContent *)self sectionIdentifier];
    v18 = [(CALNNotificationContent *)v4 sectionIdentifier];
    int v19 = CalEqualStrings();

    if (!v19) {
      goto LABEL_18;
    }
    v20 = [(CALNNotificationContent *)self date];
    v21 = [(CALNNotificationContent *)v4 date];
    int v22 = CalEqualObjects();

    if (!v22) {
      goto LABEL_18;
    }
    v23 = [(CALNNotificationContent *)self defaultActionURL];
    id v24 = [(CALNNotificationContent *)v4 defaultActionURL];
    int v25 = CalEqualObjects();

    if (!v25) {
      goto LABEL_18;
    }
    v26 = [(CALNNotificationContent *)self iconIdentifier];
    id v27 = [(CALNNotificationContent *)v4 iconIdentifier];
    int v28 = CalEqualStrings();

    if (!v28) {
      goto LABEL_18;
    }
    BOOL v29 = [(CALNNotificationContent *)self shouldHideTime];
    if (v29 != [(CALNNotificationContent *)v4 shouldHideTime]) {
      goto LABEL_18;
    }
    BOOL v30 = [(CALNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
    if (v30 != [(CALNNotificationContent *)v4 shouldSuppressSyncDismissalWhenRemoved])goto LABEL_18; {
    id v31 = [(CALNNotificationContent *)self peopleIdentifiers];
    }
    v32 = [(CALNNotificationContent *)v4 peopleIdentifiers];
    int v33 = CalEqualObjects();

    if (!v33) {
      goto LABEL_18;
    }
    v34 = [(CALNNotificationContent *)self sound];
    uint64_t v35 = [(CALNNotificationContent *)v4 sound];
    int v36 = CalEqualObjects();

    if (!v36) {
      goto LABEL_18;
    }
    uint64_t v37 = [(CALNNotificationContent *)self userInfo];
    v38 = [(CALNNotificationContent *)v4 userInfo];
    int v39 = CalEqualObjects();

    if (!v39) {
      goto LABEL_18;
    }
    v40 = [(CALNNotificationContent *)self threadIdentifier];
    uint64_t v41 = [(CALNNotificationContent *)v4 threadIdentifier];
    int v42 = CalEqualStrings();

    if (!v42) {
      goto LABEL_18;
    }
    unint64_t v43 = [(CALNNotificationContent *)self interruptionLevel];
    if (v43 == [(CALNNotificationContent *)v4 interruptionLevel])
    {
      v44 = [(CALNNotificationContent *)self filterCriteria];
      uint64_t v45 = [(CALNNotificationContent *)v4 filterCriteria];
      char v46 = CalEqualStrings();
    }
    else
    {
LABEL_18:
      char v46 = 0;
    }
  }

  return v46;
}

- (unint64_t)hash
{
  v3 = [(CALNNotificationContent *)self title];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(CALNNotificationContent *)self subtitle];
  uint64_t v6 = [v5 hash] ^ v4;

  int v7 = [(CALNNotificationContent *)self body];
  uint64_t v8 = [v7 hash];

  v9 = [(CALNNotificationContent *)self categoryIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(CALNNotificationContent *)self sectionIdentifier];
  uint64_t v12 = [v11 hash];

  int v13 = [(CALNNotificationContent *)self date];
  uint64_t v14 = v12 ^ [v13 hash];

  v15 = [(CALNNotificationContent *)self expirationDate];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];

  v17 = [(CALNNotificationContent *)self defaultActionURL];
  uint64_t v18 = [v17 hash];

  int v19 = [(CALNNotificationContent *)self iconIdentifier];
  uint64_t v20 = v18 ^ [v19 hash];

  v21 = [(CALNNotificationContent *)self sound];
  uint64_t v22 = v20 ^ [v21 hash];

  v23 = [(CALNNotificationContent *)self userInfo];
  uint64_t v24 = v16 ^ v22 ^ [v23 hash];

  uint64_t v25 = [(CALNNotificationContent *)self shouldHideTime];
  v26 = [(CALNNotificationContent *)self peopleIdentifiers];
  uint64_t v27 = v25 ^ [v26 hash];

  int v28 = [(CALNNotificationContent *)self threadIdentifier];
  uint64_t v29 = v27 ^ [v28 hash];

  unint64_t v30 = v24 ^ v29 ^ [(CALNNotificationContent *)self interruptionLevel];
  id v31 = [(CALNNotificationContent *)self filterCriteria];
  uint64_t v32 = [v31 hash];

  BOOL v33 = [(CALNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  uint64_t v34 = 2;
  if (!v33) {
    uint64_t v34 = 0;
  }
  return v30 ^ v32 ^ v34;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v20 = +[CALNMutableNotificationContent allocWithZone:a3];
  uint64_t v24 = [(CALNNotificationContent *)self title];
  v23 = [(CALNNotificationContent *)self subtitle];
  uint64_t v22 = [(CALNNotificationContent *)self body];
  int v19 = [(CALNNotificationContent *)self categoryIdentifier];
  uint64_t v18 = [(CALNNotificationContent *)self sectionIdentifier];
  v17 = [(CALNNotificationContent *)self date];
  v15 = [(CALNNotificationContent *)self expirationDate];
  int v13 = [(CALNNotificationContent *)self defaultActionURL];
  uint64_t v12 = [(CALNNotificationContent *)self iconIdentifier];
  BOOL v16 = [(CALNNotificationContent *)self shouldHideTime];
  BOOL v14 = [(CALNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  uint64_t v4 = [(CALNNotificationContent *)self peopleIdentifiers];
  BOOL v5 = [(CALNNotificationContent *)self sound];
  uint64_t v6 = [(CALNNotificationContent *)self userInfo];
  int v7 = [(CALNNotificationContent *)self threadIdentifier];
  unint64_t v8 = [(CALNNotificationContent *)self interruptionLevel];
  v9 = [(CALNNotificationContent *)self filterCriteria];
  BYTE1(v11) = v14;
  LOBYTE(v11) = v16;
  id v21 = -[CALNNotificationContent _initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:](v20, "_initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:", v24, v23, v22, v19, v18, v17, v15, v13, v12, v11, v4, v5, v6, v7, v8,
          v9);

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNNotificationContent *)self body];
  [v4 encodeObject:v5 forKey:@"body"];

  uint64_t v6 = [(CALNNotificationContent *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  int v7 = [(CALNNotificationContent *)self title];
  [v4 encodeObject:v7 forKey:@"title"];

  unint64_t v8 = [(CALNNotificationContent *)self categoryIdentifier];
  [v4 encodeObject:v8 forKey:@"categoryIdentifier"];

  v9 = [(CALNNotificationContent *)self sectionIdentifier];
  [v4 encodeObject:v9 forKey:@"sectionIdentifier"];

  uint64_t v10 = [(CALNNotificationContent *)self date];
  [v4 encodeObject:v10 forKey:@"date"];

  uint64_t v11 = [(CALNNotificationContent *)self iconIdentifier];
  [v4 encodeObject:v11 forKey:@"iconIdentifier"];

  uint64_t v12 = [(CALNNotificationContent *)self expirationDate];
  [v4 encodeObject:v12 forKey:@"expirationDate"];

  int v13 = [(CALNNotificationContent *)self defaultActionURL];
  [v4 encodeObject:v13 forKey:@"defaultActionURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CALNNotificationContent shouldHideTime](self, "shouldHideTime"), @"shouldHideTime");
  objc_msgSend(v4, "encodeBool:forKey:", -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"), @"shouldSuppressSyncDismissalWhenRemoved");
  BOOL v14 = [(CALNNotificationContent *)self peopleIdentifiers];
  [v4 encodeObject:v14 forKey:@"peopleIdentifiers"];

  v15 = [(CALNNotificationContent *)self sound];
  [v4 encodeObject:v15 forKey:@"sound"];

  BOOL v16 = [(CALNNotificationContent *)self userInfo];
  [v4 encodeObject:v16 forKey:@"userInfo"];

  v17 = [(CALNNotificationContent *)self threadIdentifier];
  [v4 encodeObject:v17 forKey:@"threadIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CALNNotificationContent interruptionLevel](self, "interruptionLevel"), @"interruptionLevel");
  id v18 = [(CALNNotificationContent *)self filterCriteria];
  [v4 encodeObject:v18 forKey:@"filterCriteria"];
}

- (CALNNotificationContent)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
  id v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  unint64_t v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"categoryIdentifier"];
  uint64_t v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sectionIdentifier"];
  uint64_t v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"defaultActionURL"];
  uint64_t v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"iconIdentifier"];
  char v21 = [v3 decodeBoolForKey:@"shouldHideTime"];
  char v20 = [v3 decodeBoolForKey:@"shouldSuppressSyncDismissalWhenRemoved"];
  if (initWithCoder__onceToken != -1) {
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_6);
  }
  int v19 = [v3 decodeObjectOfClasses:initWithCoder__peopleIdentifiersClasses forKey:@"peopleIdentifiers"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sound"];
  BOOL v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v18 = [v3 decodeObjectOfClasses:v12 forKey:@"userInfo"];

  int v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
  uint64_t v14 = [v3 decodeIntegerForKey:@"interruptionLevel"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"filterCriteria"];
  BYTE1(v17) = v20;
  LOBYTE(v17) = v21;
  int v28 = -[CALNNotificationContent _initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:](self, "_initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:", v30, v31, v32, v26, v25, v24, v29, v23, v22, v17, v19, v4, v18, v13, v14,
          v15);

  return v28;
}

void __41__CALNNotificationContent_initWithCoder___block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__peopleIdentifiersClasses;
  initWithCoder__peopleIdentifiersClasses = v2;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (BOOL)shouldHideTime
{
  return self->_shouldHideTime;
}

- (NSString)iconIdentifier
{
  return self->_iconIdentifier;
}

- (BOOL)shouldSuppressSyncDismissalWhenRemoved
{
  return self->_shouldSuppressSyncDismissalWhenRemoved;
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (CALNNotificationSound)sound
{
  return self->_sound;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end