@interface KCSharingParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwner;
- (KCSharingParticipant)initWithCoder:(id)a3;
- (KCSharingParticipant)initWithHandle:(id)a3 permissionLevel:(int64_t)a4;
- (KCSharingParticipant)initWithParticipantID:(id)a3 handle:(id)a4 permissionLevel:(int64_t)a5 isCurrentUser:(BOOL)a6 inviteStatus:(int64_t)a7 sharingInvitationData:(id)a8;
- (KCSharingParticipant)invitedBy;
- (NSData)sharingInvitationData;
- (NSDictionary)JSONObject;
- (NSString)handle;
- (NSString)longDescription;
- (NSString)participantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inviteStatus;
- (int64_t)permissionLevel;
- (unint64_t)hash;
- (void)_setInvitedBy:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPermissionLevel:(int64_t)a3;
@end

@implementation KCSharingParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
  objc_destroyWeak((id *)&self->_invitedBy);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_participantID, 0);
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (KCSharingParticipant)invitedBy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invitedBy);

  return (KCSharingParticipant *)WeakRetained;
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setPermissionLevel:(int64_t)a3
{
  self->_permissionLevel = a3;
}

- (int64_t)permissionLevel
{
  return self->_permissionLevel;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)_setInvitedBy:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v7 = v6;
    v8 = [(KCSharingParticipant *)self sharingInvitationData];
    if (v8)
    {
      v9 = [(KCSharingParticipant *)self sharingInvitationData];
      v3 = [v7 sharingInvitationData];
      char v10 = [v9 isEqualToData:v3];
    }
    else
    {
      v9 = [v7 sharingInvitationData];
      char v10 = v9 == 0;
    }

    v12 = [(KCSharingParticipant *)self participantID];
    v13 = [v7 participantID];
    if (v12 == v13
      || ([(KCSharingParticipant *)self participantID],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v7 participantID],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      v14 = [(KCSharingParticipant *)self handle];
      v15 = [v7 handle];
      if ([v14 isEqual:v15]
        && (BOOL v20 = v10,
            int64_t v16 = [(KCSharingParticipant *)self permissionLevel],
            v16 == [v7 permissionLevel])
        && (int v17 = [(KCSharingParticipant *)self isCurrentUser],
            v17 == [v7 isCurrentUser]))
      {
        int64_t v19 = [(KCSharingParticipant *)self inviteStatus];
        BOOL v11 = v19 == [v7 inviteStatus] && v20;
      }
      else
      {
        BOOL v11 = 0;
      }

      if (v12 == v13) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v11 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(KCSharingParticipant *)self participantID];
  uint64_t v4 = [v3 hash];
  v5 = [(KCSharingParticipant *)self handle];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = v6 ^ [(KCSharingParticipant *)self permissionLevel];
  uint64_t v8 = [(KCSharingParticipant *)self isCurrentUser];
  int64_t v9 = v7 ^ v8 ^ [(KCSharingParticipant *)self inviteStatus];
  char v10 = [(KCSharingParticipant *)self sharingInvitationData];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingParticipant *)self participantID];
  [v4 encodeObject:v5 forKey:@"participantID"];

  uint64_t v6 = [(KCSharingParticipant *)self handle];
  [v4 encodeObject:v6 forKey:@"handle"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[KCSharingParticipant permissionLevel](self, "permissionLevel"), @"permissionLevel");
  objc_msgSend(v4, "encodeBool:forKey:", -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"), @"isCurrentUser");
  objc_msgSend(v4, "encodeInt64:forKey:", -[KCSharingParticipant inviteStatus](self, "inviteStatus"), @"inviteStatus");
  id v7 = [(KCSharingParticipant *)self sharingInvitationData];
  [v4 encodeObject:v7 forKey:@"inviteData"];
}

- (KCSharingParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KCSharingParticipant;
  v5 = [(KCSharingParticipant *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"participantID"];
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    v5->_permissionLevel = [v4 decodeInt64ForKey:@"permissionLevel"];
    v5->_isCurrentUser = [v4 decodeBoolForKey:@"isCurrentUser"];
    v5->_inviteStatus = [v4 decodeInt64ForKey:@"inviteStatus"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteData"];
    sharingInvitationData = v5->_sharingInvitationData;
    v5->_sharingInvitationData = (NSData *)v10;
  }
  return v5;
}

- (NSDictionary)JSONObject
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"handle";
  v3 = [(KCSharingParticipant *)self handle];
  v18[0] = v3;
  v17[1] = @"permissionLevel";
  int64_t v4 = [(KCSharingParticipant *)self permissionLevel];
  v5 = @"readOnly";
  if (v4 == 1) {
    v5 = @"readWrite";
  }
  if (v4 == 2) {
    v5 = @"owner";
  }
  uint64_t v6 = v5;
  v18[1] = v6;
  v17[2] = @"isCurrentUser";
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"));
  v18[2] = v7;
  v17[3] = @"inviteStatus";
  int64_t v8 = [(KCSharingParticipant *)self inviteStatus];
  if ((unint64_t)(v8 - 1) > 2) {
    int64_t v9 = @"unknown";
  }
  else {
    int64_t v9 = off_1E5475DA0[v8 - 1];
  }
  v18[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  unint64_t v11 = (void *)[v10 mutableCopy];

  v12 = [(KCSharingParticipant *)self participantID];
  [v11 setObject:v12 forKeyedSubscript:@"participantID"];

  objc_super v13 = [(KCSharingParticipant *)self sharingInvitationData];
  v14 = [v13 base64EncodedStringWithOptions:0];
  [v11 setObject:v14 forKeyedSubscript:@"inviteToken"];

  v15 = (void *)[v11 copy];

  return (NSDictionary *)v15;
}

- (NSString)longDescription
{
  v3 = [(KCSharingParticipant *)self description];
  int64_t v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  uint64_t v6 = [(KCSharingParticipant *)self sharingInvitationData];
  id v7 = [v6 base64EncodedStringWithOptions:0];
  int64_t v8 = [v5 stringWithFormat:@" inviteToken:%@", v7];

  objc_msgSend(v4, "insertString:atIndex:", v8, objc_msgSend(v4, "length") - 1);

  return (NSString *)v4;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(KCSharingParticipant *)self participantID];
  v5 = [(KCSharingParticipant *)self handle];
  int64_t v6 = [(KCSharingParticipant *)self permissionLevel];
  id v7 = @"readOnly";
  if (v6 == 1) {
    id v7 = @"readWrite";
  }
  if (v6 == 2) {
    id v7 = @"owner";
  }
  int64_t v8 = v7;
  unint64_t v9 = [(KCSharingParticipant *)self inviteStatus] - 1;
  if (v9 > 2) {
    uint64_t v10 = @"unknown";
  }
  else {
    uint64_t v10 = off_1E5475DA0[v9];
  }
  if ([(KCSharingParticipant *)self isCurrentUser]) {
    unint64_t v11 = @"YES";
  }
  else {
    unint64_t v11 = @"NO";
  }
  if ([(KCSharingParticipant *)self isOwner]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  objc_super v13 = [v3 stringWithFormat:@"KCSharingParticipant(%@, handle:%@ permissionLevel:%@ inviteStatus: %@ isCurrentUser:%@ isOwner:%@)", v4, v5, v8, v10, v11, v12];

  return v13;
}

- (BOOL)isOwner
{
  return [(KCSharingParticipant *)self permissionLevel] == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [KCSharingParticipant alloc];
  v5 = [(KCSharingParticipant *)self participantID];
  int64_t v6 = [(KCSharingParticipant *)self handle];
  int64_t v7 = [(KCSharingParticipant *)self permissionLevel];
  BOOL v8 = [(KCSharingParticipant *)self isCurrentUser];
  int64_t v9 = [(KCSharingParticipant *)self inviteStatus];
  uint64_t v10 = [(KCSharingParticipant *)self sharingInvitationData];
  unint64_t v11 = [(KCSharingParticipant *)v4 initWithParticipantID:v5 handle:v6 permissionLevel:v7 isCurrentUser:v8 inviteStatus:v9 sharingInvitationData:v10];

  return v11;
}

- (KCSharingParticipant)initWithParticipantID:(id)a3 handle:(id)a4 permissionLevel:(int64_t)a5 isCurrentUser:(BOOL)a6 inviteStatus:(int64_t)a7 sharingInvitationData:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)KCSharingParticipant;
  int v17 = [(KCSharingParticipant *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    participantID = v17->_participantID;
    v17->_participantID = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    handle = v17->_handle;
    v17->_handle = (NSString *)v20;

    v17->_isCurrentUser = a6;
    v17->_permissionLevel = a5;
    v17->_inviteStatus = a7;
    uint64_t v22 = [v16 copy];
    sharingInvitationData = v17->_sharingInvitationData;
    v17->_sharingInvitationData = (NSData *)v22;
  }
  return v17;
}

- (KCSharingParticipant)initWithHandle:(id)a3 permissionLevel:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingParticipant;
  BOOL v8 = [(KCSharingParticipant *)&v11 init];
  int64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_permissionLevel = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end