@interface CPLShare
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)ownerIsCurrentUser;
- (CPLShare)init;
- (CPLShare)initWithCoder:(id)a3;
- (CPLShareParticipant)currentUserParticipant;
- (CPLShareParticipant)owner;
- (NSArray)participants;
- (NSDate)creationDate;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)publicPermission;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPublicPermission:(int64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation CPLShare

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setParticipants:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setPublicPermission:(int64_t)a3
{
  self->_publicPermission = a3;
}

- (int64_t)publicPermission
{
  return self->_publicPermission;
}

- (unint64_t)hash
{
  int64_t publicPermission = self->_publicPermission;
  uint64_t v4 = [(NSURL *)self->_URL hash] ^ publicPermission;
  return v4 ^ [(NSArray *)self->_participants hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CPLShare *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_publicPermission != v4->_publicPermission) {
    goto LABEL_7;
  }
  unint64_t v5 = self->_URL;
  v6 = (void *)v5;
  URL = v4->_URL;
  if (v5 && URL)
  {
    char v8 = objc_msgSend((id)v5, "isEqual:");

    if ((v8 & 1) == 0)
    {
LABEL_7:
      BOOL v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v11 = v5 | (unint64_t)URL;

    if (v11) {
      goto LABEL_7;
    }
  }
  unint64_t v12 = self->_participants;
  v13 = v4->_participants;
  unint64_t v14 = (unint64_t)v13;
  BOOL v9 = v12 && v13 && ([(id)v12 isEqual:v13] & 1) != 0 || (v12 | v14) == 0;

LABEL_9:
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setPublicPermission:self->_publicPermission];
  [v4 setURL:self->_URL];
  id v5 = [(NSArray *)self->_participants cplDeepCopy];
  [v4 setParticipants:v5];

  [v4 setCreationDate:self->_creationDate];
  return v4;
}

- (id)description
{
  int64_t publicPermission = self->_publicPermission;
  id v4 = [NSString alloc];
  uint64_t v5 = [(NSURL *)self->_URL cpl_redactedShareURL];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"<no URL yet>";
  }
  if (publicPermission == 1)
  {
    NSUInteger v8 = [(NSArray *)self->_participants count];
    BOOL v9 = [(CPLShare *)self ownerIsCurrentUser];
    v10 = "";
    if (v9) {
      v10 = "owner";
    }
    unint64_t v11 = (void *)[v4 initWithFormat:@"[%@ (%lu participants) %s]", v7, v8, v10];
  }
  else
  {
    unint64_t v12 = +[CPLShareParticipant descriptionForPermission:self->_publicPermission];
    BOOL v13 = [(CPLShare *)self ownerIsCurrentUser];
    unint64_t v14 = "";
    if (v13) {
      unint64_t v14 = "owner";
    }
    unint64_t v11 = (void *)[v4 initWithFormat:@"[%@ (public: %@) %s]", v7, v12, v14];
  }
  return v11;
}

- (BOOL)ownerIsCurrentUser
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CPLShare *)self participants];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isCurrentUser])
        {
          LOBYTE(v3) = [v6 role] == 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (CPLShareParticipant)currentUserParticipant
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CPLShare *)self participants];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
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

  return (CPLShareParticipant *)v3;
}

- (CPLShareParticipant)owner
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CPLShare *)self participants];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 role] == 1)
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

  return (CPLShareParticipant *)v3;
}

- (NSArray)participants
{
  if (self->_participants) {
    return self->_participants;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_publicPermission forKey:@"pubPerm"];
  [v4 encodeObject:self->_URL forKey:@"url"];
  if ([(NSArray *)self->_participants count]) {
    [v4 encodeObject:self->_participants forKey:@"participants"];
  }
  [v4 encodeObject:self->_creationDate forKey:@"creationDate"];
}

- (CPLShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLShare;
  uint64_t v5 = [(CPLShare *)&v13 init];
  if (v5)
  {
    v5->_int64_t publicPermission = [v4 decodeIntegerForKey:@"pubPerm"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClasses:_participantsClasses forKey:@"participants"];
    participants = v5->_participants;
    v5->_participants = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;
  }
  return v5;
}

- (CPLShare)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLShare;
  result = [(CPLShare *)&v3 init];
  if (result) {
    result->_int64_t publicPermission = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
    uint64_t v5 = _participantsClasses;
    _participantsClasses = v4;
    MEMORY[0x1F41817F8](v4, v5);
  }
}

@end