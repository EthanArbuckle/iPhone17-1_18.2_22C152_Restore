@interface CPLShareParticipant
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForAcceptanceStatus:(int64_t)a3;
+ (id)descriptionForPermission:(int64_t)a3;
+ (id)descriptionForRole:(int64_t)a3;
+ (void)initialize;
- (BOOL)hasiCloudAccount;
- (BOOL)isCurrentUser;
- (CPLShareParticipant)init;
- (CPLShareParticipant)initWithCoder:(id)a3;
- (CPLShareParticipant)initWithEmail:(id)a3;
- (CPLShareParticipant)initWithParticipantID:(id)a3;
- (CPLShareParticipant)initWithPhoneNumber:(id)a3;
- (CPLShareParticipant)initWithUserIdentifier:(id)a3;
- (CPLShareParticipant)initWithUserIdentifier:(id)a3 participantID:(id)a4 phoneNumber:(id)a5 email:(id)a6;
- (NSPersonNameComponents)nameComponents;
- (NSString)email;
- (NSString)participantID;
- (NSString)phoneNumber;
- (NSString)userIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (int64_t)acceptanceStatus;
- (int64_t)permission;
- (int64_t)role;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptanceStatus:(int64_t)a3;
- (void)setEmail:(id)a3;
- (void)setHasiCloudAccount:(BOOL)a3;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setNameComponents:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setPermission:(int64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation CPLShareParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)setHasiCloudAccount:(BOOL)a3
{
  self->_hasiCloudAccount = a3;
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (void)setNameComponents:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setAcceptanceStatus:(int64_t)a3
{
  self->_acceptanceStatus = a3;
}

- (int64_t)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (id)redactedDescription
{
  v3 = NSString;
  if (self->_hasiCloudAccount) {
    v4 = @"iCloud";
  }
  else {
    v4 = @"Non-iCloud";
  }
  v5 = [(id)objc_opt_class() descriptionForRole:self->_role];
  v6 = [(id)objc_opt_class() descriptionForPermission:self->_permission];
  v7 = [v3 stringWithFormat:@"[<redacted> %@ %@ %@]", v4, v5, v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  userIdentifier = self->_userIdentifier;
  participantID = self->_participantID;
  if (self->_hasiCloudAccount) {
    v6 = @"iCloud";
  }
  else {
    v6 = @"Non-iCloud";
  }
  v7 = [(id)objc_opt_class() descriptionForRole:self->_role];
  v8 = [(id)objc_opt_class() descriptionForPermission:self->_permission];
  v9 = [v3 stringWithFormat:@"[%@ %@ %@ %@ %@]", userIdentifier, participantID, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[CPLShareParticipant alloc] initWithUserIdentifier:self->_userIdentifier participantID:self->_participantID phoneNumber:self->_phoneNumber email:self->_email];
  [(CPLShareParticipant *)v4 setIsCurrentUser:self->_isCurrentUser];
  [(CPLShareParticipant *)v4 setRole:self->_role];
  [(CPLShareParticipant *)v4 setAcceptanceStatus:self->_acceptanceStatus];
  [(CPLShareParticipant *)v4 setPermission:self->_permission];
  v5 = (void *)[(NSPersonNameComponents *)self->_nameComponents copy];
  [(CPLShareParticipant *)v4 setNameComponents:v5];

  [(CPLShareParticipant *)v4 setHasiCloudAccount:self->_hasiCloudAccount];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  userIdentifier = self->_userIdentifier;
  id v5 = a3;
  [v5 encodeObject:userIdentifier forKey:@"uid"];
  [v5 encodeBool:self->_isCurrentUser forKey:@"current"];
  [v5 encodeInteger:self->_role forKey:@"role"];
  [v5 encodeInteger:self->_acceptanceStatus forKey:@"status"];
  [v5 encodeInteger:self->_permission forKey:@"perm"];
  [v5 encodeObject:self->_email forKey:@"email"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phone"];
  [v5 encodeObject:self->_participantID forKey:@"pid"];
  [v5 encodeObject:self->_nameComponents forKey:@"name"];
  [v5 encodeBool:self->_hasiCloudAccount forKey:@"iCloud"];
}

- (CPLShareParticipant)initWithUserIdentifier:(id)a3 participantID:(id)a4 phoneNumber:(id)a5 email:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CPLShareParticipant;
  v14 = [(CPLShareParticipant *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    userIdentifier = v14->_userIdentifier;
    v14->_userIdentifier = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    phoneNumber = v14->_phoneNumber;
    v14->_phoneNumber = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    email = v14->_email;
    v14->_email = (NSString *)v19;

    uint64_t v21 = [v11 copy];
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v21;

    v14->_permission = 1;
  }

  return v14;
}

- (CPLShareParticipant)initWithParticipantID:(id)a3
{
  return [(CPLShareParticipant *)self initWithUserIdentifier:0 participantID:a3 phoneNumber:0 email:0];
}

- (CPLShareParticipant)initWithEmail:(id)a3
{
  return [(CPLShareParticipant *)self initWithUserIdentifier:0 participantID:0 phoneNumber:0 email:a3];
}

- (CPLShareParticipant)initWithPhoneNumber:(id)a3
{
  return [(CPLShareParticipant *)self initWithUserIdentifier:0 participantID:0 phoneNumber:a3 email:0];
}

- (CPLShareParticipant)initWithUserIdentifier:(id)a3
{
  return [(CPLShareParticipant *)self initWithUserIdentifier:a3 participantID:0 phoneNumber:0 email:0];
}

- (CPLShareParticipant)init
{
  return [(CPLShareParticipant *)self initWithUserIdentifier:0 participantID:0 phoneNumber:0 email:0];
}

- (CPLShareParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPLShareParticipant;
  id v5 = [(CPLShareParticipant *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:_nsStringClass forKey:@"uid"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:_nsStringClass forKey:@"pid"];
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v8;

    v5->_isCurrentUser = [v4 decodeBoolForKey:@"current"];
    v5->_role = [v4 decodeIntegerForKey:@"role"];
    v5->_acceptanceStatus = [v4 decodeIntegerForKey:@"status"];
    v5->_permission = [v4 decodeIntegerForKey:@"perm"];
    uint64_t v10 = [v4 decodeObjectOfClass:_nsStringClass forKey:@"email"];
    email = v5->_email;
    v5->_email = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:_nsStringClass forKey:@"phone"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v14;

    v5->_hasiCloudAccount = [v4 decodeBoolForKey:@"iCloud"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _nsStringClass = objc_opt_class();
  }
}

+ (id)descriptionForRole:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"[role %ld]", a3);
  }
  else {
    v3 = off_1E60A7390[a3];
  }
  return v3;
}

+ (id)descriptionForPermission:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"[permission %ld]", a3);
  }
  else {
    v3 = off_1E60A7370[a3];
  }
  return v3;
}

+ (id)descriptionForAcceptanceStatus:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"[status %ld]", a3);
  }
  else {
    v3 = off_1E60A7350[a3];
  }
  return v3;
}

@end