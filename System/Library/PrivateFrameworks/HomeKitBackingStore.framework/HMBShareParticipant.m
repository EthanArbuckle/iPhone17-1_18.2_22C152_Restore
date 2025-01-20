@interface HMBShareParticipant
+ (BOOL)supportsSecureCoding;
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
- (BOOL)hasAccepted;
- (BOOL)hasWriteAccess;
- (BOOL)isEqual:(id)a3;
- (CKShareParticipant)ckShareParticipant;
- (HMBShareInvitation)pendingInvitation;
- (HMBShareParticipant)initWithCKShareParticipant:(id)a3 clientIdentifier:(id)a4;
- (HMBShareParticipant)initWithCoder:(id)a3;
- (HMBShareUserID)cloudShareID;
- (NSUUID)clientIdentifier;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPendingInvitation:(id)a3;
@end

@implementation HMBShareParticipant

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F28DC0];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  v10 = [v8 setWithObject:a1];
  v11 = [v7 _strictlyUnarchivedObjectOfClasses:v10 fromData:v9 error:a5];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvitation, 0);
  objc_storeStrong((id *)&self->_ckShareParticipant, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setPendingInvitation:(id)a3
{
}

- (HMBShareInvitation)pendingInvitation
{
  return (HMBShareInvitation *)objc_getProperty(self, a2, 24, 1);
}

- (CKShareParticipant)ckShareParticipant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)clientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMBShareParticipant *)self ckShareParticipant];
  [v4 encodeObject:v5 forKey:@"HMBUI.cksp"];

  v6 = [(HMBShareParticipant *)self clientIdentifier];
  [v4 encodeObject:v6 forKey:@"HMBUI.ci"];

  id v7 = [(HMBShareParticipant *)self pendingInvitation];
  [v4 encodeObject:v7 forKey:@"HMBUI.pi"];
}

- (HMBShareParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.cksp"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.ci"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.pi"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    self = [(HMBShareParticipant *)self initWithCKShareParticipant:v5 clientIdentifier:v6];
    [(HMBShareParticipant *)self setPendingInvitation:v7];
    id v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HMBShareParticipant allocWithZone:a3];
  v5 = [(HMBShareParticipant *)self ckShareParticipant];
  v6 = [(HMBShareParticipant *)self clientIdentifier];
  id v7 = [(HMBShareParticipant *)v4 initWithCKShareParticipant:v5 clientIdentifier:v6];

  BOOL v8 = [(HMBShareParticipant *)self pendingInvitation];
  [(HMBShareParticipant *)v7 setPendingInvitation:v8];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(HMBShareParticipant *)self ckShareParticipant];
  uint64_t v4 = [v3 hash];

  v5 = [(HMBShareParticipant *)self clientIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(HMBShareParticipant *)self pendingInvitation];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMBShareParticipant *)self ckShareParticipant];
    unint64_t v8 = [v6 ckShareParticipant];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMBShareParticipant *)self clientIdentifier];
      v10 = [v6 clientIdentifier];
      if ([v9 isEqual:v10])
      {
        v11 = [(HMBShareParticipant *)self pendingInvitation];
        v12 = [v6 pendingInvitation];
        char v13 = HMFEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)hasAccepted
{
  v2 = [(HMBShareParticipant *)self ckShareParticipant];
  BOOL v3 = [v2 acceptanceStatus] == 2;

  return v3;
}

- (BOOL)hasWriteAccess
{
  v2 = [(HMBShareParticipant *)self ckShareParticipant];
  BOOL v3 = [v2 permission] == 3;

  return v3;
}

- (HMBShareUserID)cloudShareID
{
  v2 = [(HMBShareParticipant *)self ckShareParticipant];
  BOOL v3 = [v2 userIdentity];
  id v4 = [v3 userRecordID];

  if (v4) {
    v5 = [[HMBShareUserID alloc] initWithUserRecordID:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBShareParticipant *)self ckShareParticipant];
  v5 = (void *)[v3 initWithName:@"CK Share Participant" value:v4 options:2 formatter:0];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v7 = [(HMBShareParticipant *)self clientIdentifier];
  unint64_t v8 = (void *)[v6 initWithName:@"Client Identifier" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMBShareParticipant *)self pendingInvitation];
  v11 = (void *)[v9 initWithName:@"Pending Invitation" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (HMBShareParticipant)initWithCKShareParticipant:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMBShareParticipant;
  unint64_t v8 = [(HMBShareParticipant *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    ckShareParticipant = v8->_ckShareParticipant;
    v8->_ckShareParticipant = (CKShareParticipant *)v9;

    uint64_t v11 = [v7 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSUUID *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end