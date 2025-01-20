@interface HMBShareInvitationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldGrantWriteAccess;
- (CKUserIdentityLookupInfo)lookupInfo;
- (HMBShareInvitationContext)initWithCoder:(id)a3;
- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 cloudShareID:(id)a4;
- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 emailAddress:(id)a4;
- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 lookupInfo:(id)a4;
- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 phoneNumber:(id)a4;
- (NSUUID)participantClientIdentifier;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldGrantWriteAccess:(BOOL)a3;
@end

@implementation HMBShareInvitationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_participantClientIdentifier, 0);
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  return (CKUserIdentityLookupInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShouldGrantWriteAccess:(BOOL)a3
{
  self->_shouldGrantWriteAccess = a3;
}

- (BOOL)shouldGrantWriteAccess
{
  return self->_shouldGrantWriteAccess;
}

- (NSUUID)participantClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMBShareInvitationContext *)self participantClientIdentifier];
  [v4 encodeObject:v5 forKey:@"HMBUIC.pci"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMBShareInvitationContext shouldGrantWriteAccess](self, "shouldGrantWriteAccess"), @"HMBUIC.sgwa");
  id v6 = [(HMBShareInvitationContext *)self lookupInfo];
  [v4 encodeObject:v6 forKey:@"HMBUIC.li"];
}

- (HMBShareInvitationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUIC.pci"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUIC.li"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v10 = [(HMBShareInvitationContext *)self initWithParticipantClientIdentifier:v5 lookupInfo:v6];
    v11 = v10;
    if (v10) {
      v10->_shouldGrantWriteAccess = [v4 decodeBoolForKey:@"HMBUIC.sgwa"];
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HMBShareInvitationContext allocWithZone:a3];
  v5 = [(HMBShareInvitationContext *)self participantClientIdentifier];
  uint64_t v6 = [(HMBShareInvitationContext *)self lookupInfo];
  v7 = [(HMBShareInvitationContext *)v4 initWithParticipantClientIdentifier:v5 lookupInfo:v6];

  [(HMBShareInvitationContext *)v7 setShouldGrantWriteAccess:[(HMBShareInvitationContext *)self shouldGrantWriteAccess]];
  return v7;
}

- (unint64_t)hash
{
  v3 = [(HMBShareInvitationContext *)self participantClientIdentifier];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(HMBShareInvitationContext *)self shouldGrantWriteAccess];
  uint64_t v6 = [(HMBShareInvitationContext *)self lookupInfo];
  unint64_t v7 = v4 ^ [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    unint64_t v7 = [(HMBShareInvitationContext *)self participantClientIdentifier];
    BOOL v8 = [v6 participantClientIdentifier];
    if ([v7 isEqual:v8]
      && (int v9 = [(HMBShareInvitationContext *)self shouldGrantWriteAccess],
          v9 == [v6 shouldGrantWriteAccess]))
    {
      v11 = [(HMBShareInvitationContext *)self lookupInfo];
      v12 = [v6 lookupInfo];
      char v10 = [v11 isEqual:v12];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBShareInvitationContext *)self participantClientIdentifier];
  uint64_t v5 = (void *)[v3 initWithName:@"User Client Identifier" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMBShareInvitationContext *)self shouldGrantWriteAccess];
  unint64_t v7 = HMFBooleanToString();
  BOOL v8 = (void *)[v6 initWithName:@"Should Grant Write Access" value:v7];
  v15[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  char v10 = [(HMBShareInvitationContext *)self lookupInfo];
  v11 = [MEMORY[0x1E4F65538] defaultFormatter];
  v12 = (void *)[v9 initWithName:@"Lookup Info" value:v10 options:2 formatter:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 lookupInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBShareInvitationContext;
  id v9 = [(HMBShareInvitationContext *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participantClientIdentifier, a3);
    objc_storeStrong((id *)&v10->_lookupInfo, a4);
  }

  return v10;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 cloudShareID:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1A488];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  char v10 = [v7 userRecordID];

  v11 = (void *)[v9 initWithUserRecordID:v10];
  objc_super v12 = [(HMBShareInvitationContext *)self initWithParticipantClientIdentifier:v8 lookupInfo:v11];

  return v12;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 phoneNumber:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1A488];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithPhoneNumber:v7];

  char v10 = [(HMBShareInvitationContext *)self initWithParticipantClientIdentifier:v8 lookupInfo:v9];
  return v10;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 emailAddress:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1A488];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithEmailAddress:v7];

  char v10 = [(HMBShareInvitationContext *)self initWithParticipantClientIdentifier:v8 lookupInfo:v9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end