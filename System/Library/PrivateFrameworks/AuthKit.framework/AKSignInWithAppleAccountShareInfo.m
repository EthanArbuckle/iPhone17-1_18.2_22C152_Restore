@interface AKSignInWithAppleAccountShareInfo
+ (BOOL)supportsSecureCoding;
- (AKSignInWithAppleAccountShareInfo)initWithCoder:(id)a3;
- (AKSignInWithAppleAccountShareInfo)initWithGroupID:(id)a3 participantID:(id)a4;
- (AKSignInWithAppleAccountShareInfo)initWithGroupID:(id)a3 participantID:(id)a4 participantName:(id)a5;
- (BOOL)isCurrentUser;
- (NSString)groupID;
- (NSString)participantHandle;
- (NSString)participantID;
- (NSString)participantName;
- (NSString)shareToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setParticipantHandle:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setShareToken:(id)a3;
@end

@implementation AKSignInWithAppleAccountShareInfo

- (AKSignInWithAppleAccountShareInfo)initWithGroupID:(id)a3 participantID:(id)a4 participantName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKSignInWithAppleAccountShareInfo;
  v12 = [(AKSignInWithAppleAccountShareInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupID, a3);
    objc_storeStrong((id *)&v13->_participantID, a4);
    objc_storeStrong((id *)&v13->_participantName, a5);
  }

  return v13;
}

- (AKSignInWithAppleAccountShareInfo)initWithGroupID:(id)a3 participantID:(id)a4
{
  return [(AKSignInWithAppleAccountShareInfo *)self initWithGroupID:a3 participantID:a4 participantName:&stru_1EE40D360];
}

- (AKSignInWithAppleAccountShareInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKSignInWithAppleAccountShareInfo;
  v5 = [(AKSignInWithAppleAccountShareInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"participantID"];
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"participantName"];
    participantName = v5->_participantName;
    v5->_participantName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"participantHandle"];
    participantHandle = v5->_participantHandle;
    v5->_participantHandle = (NSString *)v12;

    v5->_isCurrentUser = [v4 decodeBoolForKey:@"isCurrentUser"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  groupID = self->_groupID;
  id v5 = a3;
  [v5 encodeObject:groupID forKey:@"groupID"];
  [v5 encodeObject:self->_participantID forKey:@"participantID"];
  [v5 encodeObject:self->_participantName forKey:@"participantName"];
  [v5 encodeObject:self->_participantHandle forKey:@"participantHandle"];
  [v5 encodeBool:self->_isCurrentUser forKey:@"isCurrentUser"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_groupID copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_participantID copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_participantName copy];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_participantHandle copy];
  uint64_t v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  *(unsigned char *)(v4 + 8) = self->_isCurrentUser;
  return (id)v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)v5;
  if (self->_isCurrentUser) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p {\n\tgroupID: %@, \n\tparticipantID: %@, \n\tparticipantHandle: %@, \n\tisCurrentUser: %@, \n}>", v5, self, *(_OWORD *)&self->_groupID, self->_participantHandle, v7];

  return v8;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)participantName
{
  return self->_participantName;
}

- (NSString)participantHandle
{
  return self->_participantHandle;
}

- (void)setParticipantHandle:(id)a3
{
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (NSString)shareToken
{
  return self->_shareToken;
}

- (void)setShareToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong((id *)&self->_participantHandle, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_participantID, 0);

  objc_storeStrong((id *)&self->_groupID, 0);
}

@end