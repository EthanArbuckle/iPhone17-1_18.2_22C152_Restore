@interface HKSummarySharingEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaused;
- (HKProfileIdentifier)profileIdentifier;
- (HKSummarySharingEntry)init;
- (HKSummarySharingEntry)initWithCoder:(id)a3;
- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 type:(int64_t)a8 status:(int64_t)a9 notificationStatus:(int64_t)a10 direction:(unint64_t)a11 modificationDate:(id)a12;
- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 userWheelchairMode:(int64_t)a8 type:(int64_t)a9 status:(int64_t)a10 notificationStatus:(int64_t)a11 direction:(unint64_t)a12 modificationDate:(id)a13;
- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 userWheelchairMode:(int64_t)a8 type:(int64_t)a9 status:(int64_t)a10 notificationStatus:(int64_t)a11 direction:(unint64_t)a12 modificationDate:(id)a13 dateAccepted:(id)a14 dateInvited:(id)a15 profileIdentifier:(id)a16 CNContactIdentifier:(id)a17 isPaused:(BOOL)a18;
- (NSArray)allContactIdentifiers;
- (NSDate)dateAccepted;
- (NSDate)dateInvited;
- (NSDate)modificationDate;
- (NSString)CNContactIdentifier;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)primaryContactIdentifier;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)notificationStatus;
- (int64_t)status;
- (int64_t)type;
- (int64_t)userWheelchairMode;
- (unint64_t)direction;
- (unint64_t)hash;
- (void)_setCNContactIdentifier:(id)a3;
- (void)_setDateAccepted:(id)a3;
- (void)_setDateInvited:(id)a3;
- (void)_setIsPaused:(BOOL)a3;
- (void)_setProfileIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSummarySharingEntry

- (HKSummarySharingEntry)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 userWheelchairMode:(int64_t)a8 type:(int64_t)a9 status:(int64_t)a10 notificationStatus:(int64_t)a11 direction:(unint64_t)a12 modificationDate:(id)a13
{
  LOBYTE(v14) = 0;
  return [(HKSummarySharingEntry *)self initWithUUID:a3 primaryContactIdentifier:a4 allContactIdentifiers:a5 firstName:a6 lastName:a7 userWheelchairMode:a8 type:a9 status:a10 notificationStatus:a11 direction:a12 modificationDate:a13 dateAccepted:0 dateInvited:0 profileIdentifier:0 CNContactIdentifier:0 isPaused:v14];
}

- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 type:(int64_t)a8 status:(int64_t)a9 notificationStatus:(int64_t)a10 direction:(unint64_t)a11 modificationDate:(id)a12
{
  return [(HKSummarySharingEntry *)self initWithUUID:a3 primaryContactIdentifier:a4 allContactIdentifiers:a5 firstName:a6 lastName:a7 userWheelchairMode:0 type:a8 status:a9 notificationStatus:a10 direction:a11 modificationDate:a12];
}

- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 userWheelchairMode:(int64_t)a8 type:(int64_t)a9 status:(int64_t)a10 notificationStatus:(int64_t)a11 direction:(unint64_t)a12 modificationDate:(id)a13 dateAccepted:(id)a14 dateInvited:(id)a15 profileIdentifier:(id)a16 CNContactIdentifier:(id)a17 isPaused:(BOOL)a18
{
  id v51 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a13;
  id v50 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  v52.receiver = self;
  v52.super_class = (Class)HKSummarySharingEntry;
  v30 = [(HKSummarySharingEntry *)&v52 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_UUID, a3);
    uint64_t v32 = [v22 copy];
    primaryContactIdentifier = v31->_primaryContactIdentifier;
    v31->_primaryContactIdentifier = (NSString *)v32;

    uint64_t v34 = [v23 copy];
    allContactIdentifiers = v31->_allContactIdentifiers;
    v31->_allContactIdentifiers = (NSArray *)v34;

    uint64_t v36 = [v24 copy];
    firstName = v31->_firstName;
    v31->_firstName = (NSString *)v36;

    uint64_t v38 = [v25 copy];
    lastName = v31->_lastName;
    v31->_lastName = (NSString *)v38;

    v31->_userWheelchairMode = a8;
    v31->_type = a9;
    v31->_status = a10;
    v31->_direction = a12;
    v31->_notificationStatus = a11;
    if (v26)
    {
      v40 = (NSDate *)v26;
    }
    else
    {
      v40 = [MEMORY[0x1E4F1C9C8] date];
    }
    modificationDate = v31->_modificationDate;
    v31->_modificationDate = v40;

    objc_storeStrong((id *)&v31->_dateAccepted, a14);
    objc_storeStrong((id *)&v31->_dateInvited, a15);
    uint64_t v42 = [v28 copy];
    profileIdentifier = v31->_profileIdentifier;
    v31->_profileIdentifier = (HKProfileIdentifier *)v42;

    uint64_t v44 = [v29 copy];
    CNContactIdentifier = v31->_CNContactIdentifier;
    v31->_CNContactIdentifier = (NSString *)v44;

    v31->_isPaused = a18;
  }

  return v31;
}

- (id)description
{
  v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  UUID = self->_UUID;
  primaryContactIdentifier = self->_primaryContactIdentifier;
  firstName = self->_firstName;
  lastName = self->_lastName;
  v8 = HKWheelchairUseDisplayName(self->_userWheelchairMode);
  v9 = HKStringForSharingType(self->_type);
  v10 = HKStringForSharingStatus(self->_status);
  v11 = HKStringForNotificationStatus(self->_notificationStatus);
  v12 = HKStringForMessageDirection(self->_direction);
  v13 = [v16 stringWithFormat:@"<%@:%p UUID=%@, primaryContactIdentifier=%@, firstName=%@, lastName=%@, userWheelchairMode=%@, type=%@, status=%@, notificationStatus=%@, direction=%@, modificationDate=%@, dateAccepted=%@, dateInvited=%@, CNContactIdentifier=%@, isPaused=%d>", v4, self, UUID, primaryContactIdentifier, firstName, lastName, v8, v9, v10, v11, v12, self->_modificationDate, self->_dateAccepted, self->_dateInvited, self->_CNContactIdentifier, self->_isPaused];

  return v13;
}

- (void)_setProfileIdentifier:(id)a3
{
  uint64_t v4 = (HKProfileIdentifier *)[a3 copy];
  profileIdentifier = self->_profileIdentifier;
  self->_profileIdentifier = v4;

  MEMORY[0x1F41817F8](v4, profileIdentifier);
}

- (void)_setCNContactIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  CNContactIdentifier = self->_CNContactIdentifier;
  self->_CNContactIdentifier = v4;

  MEMORY[0x1F41817F8](v4, CNContactIdentifier);
}

- (void)_setDateAccepted:(id)a3
{
  uint64_t v4 = (NSDate *)[a3 copy];
  dateAccepted = self->_dateAccepted;
  self->_dateAccepted = v4;

  MEMORY[0x1F41817F8](v4, dateAccepted);
}

- (void)_setDateInvited:(id)a3
{
  uint64_t v4 = (NSDate *)[a3 copy];
  dateInvited = self->_dateInvited;
  self->_dateInvited = v4;

  MEMORY[0x1F41817F8](v4, dateInvited);
}

- (void)_setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSummarySharingEntry *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      UUID = self->_UUID;
      v7 = [(HKSummarySharingEntry *)v5 UUID];
      LODWORD(UUID) = [(NSUUID *)UUID isEqual:v7];

      if (!UUID) {
        goto LABEL_39;
      }
      primaryContactIdentifier = self->_primaryContactIdentifier;
      uint64_t v9 = [(HKSummarySharingEntry *)v5 primaryContactIdentifier];
      if (primaryContactIdentifier == (NSString *)v9)
      {
      }
      else
      {
        v10 = (void *)v9;
        uint64_t v11 = [(HKSummarySharingEntry *)v5 primaryContactIdentifier];
        if (!v11) {
          goto LABEL_38;
        }
        v12 = (void *)v11;
        v13 = self->_primaryContactIdentifier;
        uint64_t v14 = [(HKSummarySharingEntry *)v5 primaryContactIdentifier];
        LODWORD(v13) = [(NSString *)v13 isEqualToString:v14];

        if (!v13) {
          goto LABEL_39;
        }
      }
      allContactIdentifiers = self->_allContactIdentifiers;
      uint64_t v17 = [(HKSummarySharingEntry *)v5 allContactIdentifiers];
      if (allContactIdentifiers == (NSArray *)v17)
      {
      }
      else
      {
        v10 = (void *)v17;
        uint64_t v18 = [(HKSummarySharingEntry *)v5 allContactIdentifiers];
        if (!v18) {
          goto LABEL_38;
        }
        v19 = (void *)v18;
        v20 = self->_allContactIdentifiers;
        v21 = [(HKSummarySharingEntry *)v5 allContactIdentifiers];
        LODWORD(v20) = [(NSArray *)v20 isEqualToArray:v21];

        if (!v20) {
          goto LABEL_39;
        }
      }
      firstName = self->_firstName;
      uint64_t v23 = [(HKSummarySharingEntry *)v5 firstName];
      if (firstName == (NSString *)v23)
      {
      }
      else
      {
        v10 = (void *)v23;
        uint64_t v24 = [(HKSummarySharingEntry *)v5 firstName];
        if (!v24) {
          goto LABEL_38;
        }
        id v25 = (void *)v24;
        id v26 = self->_firstName;
        id v27 = [(HKSummarySharingEntry *)v5 firstName];
        LODWORD(v26) = [(NSString *)v26 isEqualToString:v27];

        if (!v26) {
          goto LABEL_39;
        }
      }
      lastName = self->_lastName;
      uint64_t v29 = [(HKSummarySharingEntry *)v5 lastName];
      if (lastName == (NSString *)v29)
      {
      }
      else
      {
        v10 = (void *)v29;
        uint64_t v30 = [(HKSummarySharingEntry *)v5 lastName];
        if (!v30) {
          goto LABEL_38;
        }
        v31 = (void *)v30;
        uint64_t v32 = self->_lastName;
        v33 = [(HKSummarySharingEntry *)v5 lastName];
        LODWORD(v32) = [(NSString *)v32 isEqualToString:v33];

        if (!v32) {
          goto LABEL_39;
        }
      }
      int64_t userWheelchairMode = self->_userWheelchairMode;
      if (userWheelchairMode != [(HKSummarySharingEntry *)v5 userWheelchairMode]) {
        goto LABEL_39;
      }
      int64_t type = self->_type;
      if (type != [(HKSummarySharingEntry *)v5 type]) {
        goto LABEL_39;
      }
      int64_t status = self->_status;
      if (status != [(HKSummarySharingEntry *)v5 status]) {
        goto LABEL_39;
      }
      int64_t notificationStatus = self->_notificationStatus;
      if (notificationStatus != [(HKSummarySharingEntry *)v5 notificationStatus]) {
        goto LABEL_39;
      }
      unint64_t direction = self->_direction;
      if (direction != [(HKSummarySharingEntry *)v5 direction]) {
        goto LABEL_39;
      }
      modificationDate = self->_modificationDate;
      v40 = [(HKSummarySharingEntry *)v5 modificationDate];

      if (modificationDate != v40) {
        goto LABEL_39;
      }
      dateAccepted = self->_dateAccepted;
      uint64_t v42 = [(HKSummarySharingEntry *)v5 dateAccepted];

      if (dateAccepted != v42) {
        goto LABEL_39;
      }
      profileIdentifier = self->_profileIdentifier;
      uint64_t v44 = [(HKSummarySharingEntry *)v5 profileIdentifier];

      if (profileIdentifier != v44) {
        goto LABEL_39;
      }
      CNContactIdentifier = self->_CNContactIdentifier;
      uint64_t v46 = [(HKSummarySharingEntry *)v5 CNContactIdentifier];
      if (CNContactIdentifier == (NSString *)v46)
      {

LABEL_43:
        BOOL isPaused = self->_isPaused;
        BOOL v15 = isPaused == [(HKSummarySharingEntry *)v5 isPaused];
        goto LABEL_40;
      }
      v10 = (void *)v46;
      uint64_t v47 = [(HKSummarySharingEntry *)v5 CNContactIdentifier];
      if (v47)
      {
        v48 = (void *)v47;
        v49 = self->_CNContactIdentifier;
        id v50 = [(HKSummarySharingEntry *)v5 CNContactIdentifier];
        LODWORD(v49) = [(NSString *)v49 isEqualToString:v50];

        if (v49) {
          goto LABEL_43;
        }
LABEL_39:
        BOOL v15 = 0;
LABEL_40:

        goto LABEL_41;
      }
LABEL_38:

      goto LABEL_39;
    }
    BOOL v15 = 0;
  }
LABEL_41:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[HKSummarySharingEntry allocWithZone:a3];
  LOBYTE(v6) = self->_isPaused;
  return [(HKSummarySharingEntry *)v4 initWithUUID:self->_UUID primaryContactIdentifier:self->_primaryContactIdentifier allContactIdentifiers:self->_allContactIdentifiers firstName:self->_firstName lastName:self->_lastName userWheelchairMode:self->_userWheelchairMode type:self->_type status:self->_status notificationStatus:self->_notificationStatus direction:self->_direction modificationDate:self->_modificationDate dateAccepted:self->_dateAccepted dateInvited:self->_dateInvited profileIdentifier:self->_profileIdentifier CNContactIdentifier:self->_CNContactIdentifier isPaused:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_primaryContactIdentifier forKey:@"PrimaryContactIdentifier"];
  [v5 encodeObject:self->_allContactIdentifiers forKey:@"AllContactIdentifiersKey"];
  [v5 encodeObject:self->_firstName forKey:@"FirstName"];
  [v5 encodeObject:self->_lastName forKey:@"LastName"];
  [v5 encodeInteger:self->_userWheelchairMode forKey:@"UserWheelchairModeKey"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeInteger:self->_status forKey:@"Status"];
  [v5 encodeInteger:self->_notificationStatus forKey:@"NotificationStatus"];
  [v5 encodeInteger:self->_direction forKey:@"Direction"];
  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
  [v5 encodeObject:self->_dateAccepted forKey:@"DateAccepted"];
  [v5 encodeObject:self->_dateInvited forKey:@"DateInvited"];
  [v5 encodeObject:self->_profileIdentifier forKey:@"ProfileIdentifier"];
  [v5 encodeObject:self->_CNContactIdentifier forKey:@"CNContactIdentifierKey"];
  [v5 encodeBool:self->_isPaused forKey:@"IsPaused"];
}

- (HKSummarySharingEntry)initWithCoder:(id)a3
{
  id v3 = a3;
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryContactIdentifier"];
  uint64_t v14 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AllContactIdentifiersKey"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FirstName"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LastName"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"UserWheelchairModeKey"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"Type"];
  uint64_t v15 = [v3 decodeIntegerForKey:@"Status"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"NotificationStatus"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"Direction"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"DateAccepted"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"DateInvited"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileIdentifier"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CNContactIdentifierKey"];
  char v11 = [v3 decodeBoolForKey:@"IsPaused"];

  LOBYTE(v13) = v11;
  uint64_t v23 = [(HKSummarySharingEntry *)self initWithUUID:v21 primaryContactIdentifier:v16 allContactIdentifiers:v14 firstName:v20 lastName:v19 userWheelchairMode:v18 type:v17 status:v15 notificationStatus:v4 direction:v5 modificationDate:v6 dateAccepted:v7 dateInvited:v8 profileIdentifier:v9 CNContactIdentifier:v10 isPaused:v13];

  return v23;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)CNContactIdentifier
{
  return self->_CNContactIdentifier;
}

- (NSString)primaryContactIdentifier
{
  return self->_primaryContactIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (int64_t)userWheelchairMode
{
  return self->_userWheelchairMode;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (int64_t)notificationStatus
{
  return self->_notificationStatus;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)dateInvited
{
  return self->_dateInvited;
}

- (NSDate)dateAccepted
{
  return self->_dateAccepted;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (NSArray)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_dateAccepted, 0);
  objc_storeStrong((id *)&self->_dateInvited, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_primaryContactIdentifier, 0);
  objc_storeStrong((id *)&self->_CNContactIdentifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end