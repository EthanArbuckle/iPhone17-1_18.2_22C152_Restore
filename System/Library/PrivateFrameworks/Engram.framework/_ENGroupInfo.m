@interface _ENGroupInfo
+ (BOOL)supportsSecureCoding;
- (ENAccountIdentity)accountIdentity;
- (NSArray)participants;
- (NSData)sharedApplicationData;
- (_ENGroupInfo)initWithAccountIdentity:(id)a3 paricipants:(id)a4 sharedApplicationData:(id)a5;
- (_ENGroupInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentity:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setSharedApplicationData:(id)a3;
@end

@implementation _ENGroupInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ENGroupInfo)initWithAccountIdentity:(id)a3 paricipants:(id)a4 sharedApplicationData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ENGroupInfo;
  v12 = [(_ENGroupInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    objc_storeStrong((id *)&v13->_participants, a4);
    objc_storeStrong((id *)&v13->_sharedApplicationData, a5);
  }

  return v13;
}

- (_ENGroupInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENGroupInfoAccountIdentityKey"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kENGroupInfoParticipantsKey"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENGroupInfoSharedApplicationDataKey"];

  id v11 = [(_ENGroupInfo *)self initWithAccountIdentity:v5 paricipants:v9 sharedApplicationData:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_ENGroupInfo *)self accountIdentity];
  [v4 encodeObject:v5 forKey:@"kENGroupInfoAccountIdentityKey"];

  v6 = [(_ENGroupInfo *)self participants];
  [v4 encodeObject:v6 forKey:@"kENGroupInfoParticipantsKey"];

  id v7 = [(_ENGroupInfo *)self sharedApplicationData];
  [v4 encodeObject:v7 forKey:@"kENGroupInfoSharedApplicationDataKey"];
}

- (ENAccountIdentity)accountIdentity
{
  return (ENAccountIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentity:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSData)sharedApplicationData
{
  return self->_sharedApplicationData;
}

- (void)setSharedApplicationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedApplicationData, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end