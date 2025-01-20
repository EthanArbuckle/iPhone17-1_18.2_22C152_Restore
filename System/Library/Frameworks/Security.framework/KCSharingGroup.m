@interface KCSharingGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwned;
- (KCSharingGroup)initWithCoder:(id)a3;
- (KCSharingGroup)initWithGroupID:(id)a3 participants:(id)a4 displayName:(id)a5 shareURL:(id)a6;
- (KCSharingGroup)initWithParticipants:(id)a3 displayName:(id)a4;
- (KCSharingParticipant)currentUserParticipant;
- (KCSharingParticipant)ownerParticipant;
- (NSArray)participants;
- (NSDictionary)JSONObject;
- (NSString)displayName;
- (NSString)groupID;
- (NSString)longDescription;
- (NSURL)shareURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)joinState;
- (unint64_t)hash;
- (void)addParticipant:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeParticipant:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation KCSharingGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_groupID, 0);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setParticipants:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingGroup *)self participants];
  v6 = (void *)[v5 mutableCopy];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__KCSharingGroup_removeParticipant___block_invoke;
  v10[3] = &unk_1E5475668;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v10];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 removeObjectAtIndex:v8];
  }
  v9 = (void *)[v6 copy];
  [(KCSharingGroup *)self setParticipants:v9];
}

uint64_t __36__KCSharingGroup_removeParticipant___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 handle];
  id v4 = [*(id *)(a1 + 32) handle];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)addParticipant:(id)a3
{
  id v4 = a3;
  id v6 = [(KCSharingGroup *)self participants];
  uint64_t v5 = [v6 arrayByAddingObject:v4];

  [(KCSharingGroup *)self setParticipants:v5];
}

- (int64_t)joinState
{
  v2 = [(KCSharingGroup *)self currentUserParticipant];
  int64_t v3 = [v2 inviteStatus];

  return v3;
}

- (BOOL)isOwned
{
  int64_t v3 = [(KCSharingGroup *)self currentUserParticipant];
  id v4 = [(KCSharingGroup *)self ownerParticipant];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (KCSharingParticipant)ownerParticipant
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(KCSharingGroup *)self participants];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isOwner])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (KCSharingParticipant *)v3;
}

- (KCSharingParticipant)currentUserParticipant
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(KCSharingGroup *)self participants];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isCurrentUser])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (KCSharingParticipant *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = [(KCSharingGroup *)self displayName];
    if (v6)
    {
      id v7 = [(KCSharingGroup *)self displayName];
      long long v8 = [v5 displayName];
      int v9 = [v7 isEqual:v8];
    }
    else
    {
      id v7 = [v5 displayName];
      int v9 = v7 == 0;
    }

    long long v11 = [(KCSharingGroup *)self shareURL];
    if (v11)
    {
      v12 = [(KCSharingGroup *)self shareURL];
      uint64_t v13 = [v5 shareURL];
      int v14 = [v12 isEqual:v13];
    }
    else
    {
      v12 = [v5 shareURL];
      int v14 = v12 == 0;
    }

    v15 = [(KCSharingGroup *)self groupID];
    v16 = [v5 groupID];
    if ([v15 isEqual:v16])
    {
      v17 = [(KCSharingGroup *)self participants];
      v18 = [v5 participants];
      int v10 = [v17 isEqual:v18] & v9 & v14;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(KCSharingGroup *)self groupID];
  uint64_t v4 = [v3 hash];
  id v5 = [(KCSharingGroup *)self participants];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(KCSharingGroup *)self displayName];
  uint64_t v8 = [v7 hash];
  int v9 = [(KCSharingGroup *)self shareURL];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingGroup *)self groupID];
  [v4 encodeObject:v5 forKey:@"groupID"];

  uint64_t v6 = [(KCSharingGroup *)self participants];
  [v4 encodeObject:v6 forKey:@"participants"];

  id v7 = [(KCSharingGroup *)self displayName];
  [v4 encodeObject:v7 forKey:@"displayName"];

  id v8 = [(KCSharingGroup *)self shareURL];
  [v4 encodeObject:v8 forKey:@"shareURL"];
}

- (KCSharingGroup)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KCSharingGroup;
  id v5 = [(KCSharingGroup *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    unint64_t v10 = [v8 setWithArray:v9];

    long long v11 = [v4 decodeObjectOfClasses:v10 forKey:@"participants"];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = v11;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1C978] array];
    }
    participants = v5->_participants;
    v5->_participants = v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v17;
  }
  return v5;
}

- (NSDictionary)JSONObject
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"groupID";
  id v3 = [(KCSharingGroup *)self groupID];
  v13[1] = @"participants";
  v14[0] = v3;
  id v4 = [(KCSharingGroup *)self participants];
  id v5 = [v4 valueForKey:@"JSONObject"];
  v14[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [(KCSharingGroup *)self displayName];
  [v7 setObject:v8 forKeyedSubscript:@"displayName"];

  int v9 = [(KCSharingGroup *)self shareURL];
  unint64_t v10 = [v9 absoluteString];
  [v7 setObject:v10 forKeyedSubscript:@"shareURL"];

  long long v11 = (void *)[v7 copy];

  return (NSDictionary *)v11;
}

- (NSString)longDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(KCSharingGroup *)self groupID];
  id v5 = [(KCSharingGroup *)self displayName];
  uint64_t v6 = [(KCSharingGroup *)self shareURL];
  id v7 = objc_msgSend(v3, "stringWithFormat:", @"KCSharingGroup(%@, name: %@ shareURL: %@ participants:\n"), v4, v5, v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(KCSharingGroup *)self participants];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) longDescription];
        [v7 appendFormat:@"\t%@\n", v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v7 appendString:@""]);
  int v14 = (void *)[v7 copy];

  return (NSString *)v14;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(KCSharingGroup *)self groupID];
  id v5 = [(KCSharingGroup *)self displayName];
  uint64_t v6 = [(KCSharingGroup *)self participants];
  id v7 = [v3 stringWithFormat:@"KCSharingGroup(%@, name: %@, participants: %@)", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [KCSharingGroup alloc];
  id v5 = [(KCSharingGroup *)self groupID];
  uint64_t v6 = (void *)[v5 copy];
  id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v8 = [(KCSharingGroup *)self participants];
  uint64_t v9 = (void *)[v7 initWithArray:v8 copyItems:1];
  uint64_t v10 = [(KCSharingGroup *)self displayName];
  uint64_t v11 = (void *)[v10 copy];
  v12 = [(KCSharingGroup *)self shareURL];
  uint64_t v13 = (void *)[v12 copy];
  int v14 = [(KCSharingGroup *)v4 initWithGroupID:v6 participants:v9 displayName:v11 shareURL:v13];

  return v14;
}

- (KCSharingGroup)initWithGroupID:(id)a3 participants:(id)a4 displayName:(id)a5 shareURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)KCSharingGroup;
  uint64_t v15 = [(KCSharingGroup *)&v20 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupID, a3);
    if (v12)
    {
      uint64_t v17 = [v12 copy];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F1C978] array];
    }
    participants = v16->_participants;
    v16->_participants = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_displayName, a5);
    objc_storeStrong((id *)&v16->_shareURL, a6);
  }

  return v16;
}

- (KCSharingGroup)initWithParticipants:(id)a3 displayName:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 UUID];
  uint64_t v10 = [v9 UUIDString];

  id v11 = [(KCSharingGroup *)self initWithGroupID:v10 participants:v8 displayName:v7 shareURL:0];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end