@interface ENGroup
+ (BOOL)supportsSecureCoding;
+ (id)sortedGroupsFromGroups:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ENCypher)cypher;
- (ENGroup)initWithCoder:(id)a3;
- (ENGroup)initWithGroupInfo:(id)a3 groupID:(id)a4 cypher:(id)a5;
- (ENGroupID)groupID;
- (NSArray)participants;
- (NSData)sharedApplicationData;
- (NSSet)destinations;
- (_ENGroupInfo)groupInfo;
- (id)accountIdentity;
- (id)description;
- (id)signAndConcealData:(id)a3 cypherIdentifier:(id *)a4 error:(id *)a5;
- (id)verifyAndRevealData:(id)a3 sendingDevice:(id)a4 cypherIdentifier:(id)a5 error:(id *)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCypher:(id)a3;
- (void)setGroupInfo:(id)a3;
@end

@implementation ENGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sortedGroupsFromGroups:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DD45B854;
  v8[3] = &unk_1E6CC5368;
  v8[4] = &v9;
  v4 = [v3 sortedArrayUsingComparator:v8];
  v5 = v4;
  if (*((unsigned char *)v10 + 24)) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (ENGroup)initWithGroupInfo:(id)a3 groupID:(id)a4 cypher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENGroup;
  char v12 = [(ENGroup *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupInfo, a3);
    objc_storeStrong((id *)&v13->_groupID, a4);
    objc_storeStrong((id *)&v13->_cypher, a5);
  }

  return v13;
}

- (ENGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENGroupGroupInfoKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENGroupGroupIDKey"];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ENGroup *)self groupInfo];
  [v4 encodeObject:v5 forKey:@"kENGroupGroupInfoKey"];

  id v6 = [(ENGroup *)self groupID];
  [v4 encodeObject:v6 forKey:@"kENGroupGroupIDKey"];

  id v7 = [(ENGroup *)self cypher];
  [v4 encodeObject:v7 forKey:@"kENGroupCypherKey"];
}

- (id)signAndConcealData:(id)a3 cypherIdentifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(ENGroup *)self cypher];
  id v10 = [(ENGroup *)self accountIdentity];
  id v11 = [v9 cypherData:v8 withAccountIdentity:v10 identifier:a4 error:a5];

  return v11;
}

- (id)verifyAndRevealData:(id)a3 sendingDevice:(id)a4 cypherIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(ENGroup *)self cypher];
  v14 = [(ENGroup *)self accountIdentity];
  objc_super v15 = [v11 devicePublicKey];

  v16 = [v13 decypherData:v12 withAccountIdentity:v14 signingDevicePublicKey:v15 identifier:v10 error:a6];

  return v16;
}

- (NSSet)destinations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(ENGroup *)self participants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) aliases];
        [v3 unionSet:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(ENGroup *)self groupID];
  uint64_t v6 = [(ENGroup *)self participants];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p groupID: %@ participants: %@>", v4, self, v5, v6];

  return v7;
}

- (id)accountIdentity
{
  v2 = [(ENGroup *)self groupInfo];
  id v3 = [v2 accountIdentity];

  return v3;
}

- (NSArray)participants
{
  v2 = [(ENGroup *)self groupInfo];
  id v3 = [v2 participants];

  return (NSArray *)v3;
}

- (NSData)sharedApplicationData
{
  v2 = [(ENGroup *)self groupInfo];
  id v3 = [v2 sharedApplicationData];

  return (NSData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 groupID];
    uint64_t v6 = [(ENGroup *)self groupID];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(ENGroup *)self groupID];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (ENCypher)cypher
{
  return self->_cypher;
}

- (void)setCypher:(id)a3
{
}

- (_ENGroupInfo)groupInfo
{
  return self->_groupInfo;
}

- (void)setGroupInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupInfo, 0);
  objc_storeStrong((id *)&self->_cypher, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end