@interface MSASComment
+ (BOOL)supportsSecureCoding;
+ (id)MSASPCommentFromProtocolDictionary:(id)a3;
+ (id)comment;
- (BOOL)isBatchComment;
- (BOOL)isCaption;
- (BOOL)isDeletable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLike;
- (BOOL)isMine;
- (MSASComment)init;
- (MSASComment)initWithCoder:(id)a3;
- (NSDate)clientTimestamp;
- (NSDate)timestamp;
- (NSString)GUID;
- (NSString)content;
- (NSString)email;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)personID;
- (id)description;
- (int)ID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClientTimestamp:(id)a3;
- (void)setContent:(id)a3;
- (void)setEmail:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setGUID:(id)a3;
- (void)setID:(int)a3;
- (void)setIsBatchComment:(BOOL)a3;
- (void)setIsCaption:(BOOL)a3;
- (void)setIsDeletable:(BOOL)a3;
- (void)setIsLike:(BOOL)a3;
- (void)setIsMine:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation MSASComment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_clientTimestamp, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)setContent:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setEmail:(id)a3
{
}

- (void)setFullName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setIsBatchComment:(BOOL)a3
{
  self->_isBatchComment = a3;
}

- (BOOL)isBatchComment
{
  return self->_isBatchComment;
}

- (void)setIsCaption:(BOOL)a3
{
  self->_isCaption = a3;
}

- (BOOL)isCaption
{
  return self->_isCaption;
}

- (void)setIsLike:(BOOL)a3
{
  self->_isLike = a3;
}

- (BOOL)isLike
{
  return self->_isLike;
}

- (void)setClientTimestamp:(id)a3
{
}

- (NSDate)clientTimestamp
{
  return self->_clientTimestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setID:(int)a3
{
  self->_ID = a3;
}

- (int)ID
{
  return self->_ID;
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)email
{
  p_email = &self->_email;
  email = self->_email;
  if (!email)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 emailForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_email, v7);
      }
    }
    email = *p_email;
  }
  return email;
}

- (NSString)lastName
{
  p_lastName = &self->_lastName;
  lastName = self->_lastName;
  if (!lastName)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 lastNameForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_lastName, v7);
      }
    }
    lastName = *p_lastName;
  }
  return lastName;
}

- (NSString)firstName
{
  p_firstName = &self->_firstName;
  firstName = self->_firstName;
  if (!firstName)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 firstNameForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_firstName, v7);
      }
    }
    firstName = *p_firstName;
  }
  return firstName;
}

- (NSString)fullName
{
  p_fullName = &self->_fullName;
  fullName = self->_fullName;
  if (!fullName)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 fullNameForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_fullName, v7);
      }
    }
    fullName = *p_fullName;
  }
  return fullName;
}

- (id)description
{
  int mode = os_trace_get_mode();
  v36 = NSString;
  if ((mode & 0x1000000) != 0)
  {
    v38.receiver = self;
    v38.super_class = (Class)MSASComment;
    uint64_t v35 = [(MSASComment *)&v38 description];
    uint64_t v32 = [(MSASComment *)self GUID];
    uint64_t v33 = [(MSASComment *)self ID];
    v6 = [(MSASComment *)self fullName];
    v7 = [(MSASComment *)self email];
    v12 = [(MSASComment *)self personID];
    v20 = [(MSASComment *)self timestamp];
    v21 = [(MSASComment *)self clientTimestamp];
    BOOL v22 = [(MSASComment *)self isLike];
    BOOL v23 = [(MSASComment *)self isCaption];
    BOOL v24 = [(MSASComment *)self isBatchComment];
    BOOL v25 = [(MSASComment *)self isMine];
    v26 = [(MSASComment *)self content];
    if ([v26 length]) {
      v27 = @"(Present)";
    }
    else {
      v27 = @"(No)";
    }
    BOOL v28 = v24;
    v18 = (void *)v35;
    BOOL v31 = v25;
    v16 = (void *)v32;
    v19 = [v36 stringWithFormat:@"%@, GUID: %@, ID: %d, name: %@ (%@ %@) server timestamp: %@, client timestamp: %@, is Like: %d, is Caption: %d, is Batch Comment: %d, is Mine: %d, content: %@", v35, v32, v33, v6, v7, v12, v20, v21, v22, v23, v28, v31, v27];
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)MSASComment;
    uint64_t v34 = [(MSASComment *)&v37 description];
    uint64_t v4 = [(MSASComment *)self GUID];
    uint64_t v5 = [(MSASComment *)self ID];
    v6 = [(MSASComment *)self timestamp];
    v7 = [(MSASComment *)self clientTimestamp];
    BOOL v8 = [(MSASComment *)self isLike];
    BOOL v9 = [(MSASComment *)self isCaption];
    BOOL v10 = [(MSASComment *)self isBatchComment];
    BOOL v11 = [(MSASComment *)self isMine];
    v12 = [(MSASComment *)self content];
    uint64_t v13 = [v12 length];
    v14 = @"(Present)";
    if (!v13) {
      v14 = @"(No)";
    }
    v30 = v14;
    BOOL v15 = v9;
    v16 = (void *)v4;
    BOOL v17 = v8;
    v18 = (void *)v34;
    v19 = [v36 stringWithFormat:@"%@, GUID: %@, ID: %d, server timestamp: %@, client timestamp: %@, is Like: %d, is Caption: %d, is Batch Comment: %d, is Mine: %d, content: %@", v34, v4, v5, v6, v7, v17, v15, v10, v11, v30];
  }

  return v19;
}

- (MSASComment)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSASComment;
  uint64_t v5 = [(MSASComment *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    v5->_ID = [v4 decodeIntForKey:@"ID"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientTimestamp"];
    clientTimestamp = v5->_clientTimestamp;
    v5->_clientTimestamp = (NSDate *)v10;

    v5->_isLike = [v4 decodeBoolForKey:@"isLike"];
    v5->_isCaption = [v4 decodeBoolForKey:@"isCaption"];
    v5->_isBatchComment = [v4 decodeBoolForKey:@"isBatchComment"];
    v5->_isMine = [v4 decodeBoolForKey:@"isMine"];
    v5->_isDeletable = [v4 decodeBoolForKey:@"isDeletable"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personID"];
    personID = v5->_personID;
    v5->_personID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"email"];
    email = v5->_email;
    v5->_email = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  GUID = self->_GUID;
  id v18 = v4;
  if (GUID)
  {
    [v4 encodeObject:GUID forKey:@"GUID"];
    id v4 = v18;
  }
  [v4 encodeInt:self->_ID forKey:@"ID"];
  timestamp = self->_timestamp;
  if (timestamp) {
    [v18 encodeObject:timestamp forKey:@"timestamp"];
  }
  clientTimestamp = self->_clientTimestamp;
  if (clientTimestamp) {
    [v18 encodeObject:clientTimestamp forKey:@"clientTimestamp"];
  }
  [v18 encodeBool:self->_isLike forKey:@"isLike"];
  [v18 encodeBool:self->_isCaption forKey:@"isCaption"];
  [v18 encodeBool:self->_isBatchComment forKey:@"isBatchComment"];
  [v18 encodeBool:self->_isMine forKey:@"isMine"];
  [v18 encodeBool:self->_isDeletable forKey:@"isDeletable"];
  content = self->_content;
  if (content) {
    [v18 encodeObject:content forKey:@"content"];
  }
  personID = self->_personID;
  if (personID) {
    [v18 encodeObject:personID forKey:@"personID"];
  }
  uint64_t v10 = [(MSASComment *)self firstName];

  if (v10)
  {
    BOOL v11 = [(MSASComment *)self firstName];
    [v18 encodeObject:v11 forKey:@"firstName"];
  }
  uint64_t v12 = [(MSASComment *)self lastName];

  if (v12)
  {
    uint64_t v13 = [(MSASComment *)self lastName];
    [v18 encodeObject:v13 forKey:@"lastName"];
  }
  uint64_t v14 = [(MSASComment *)self fullName];

  if (v14)
  {
    BOOL v15 = [(MSASComment *)self fullName];
    [v18 encodeObject:v15 forKey:@"fullName"];
  }
  uint64_t v16 = [(MSASComment *)self email];

  if (v16)
  {
    BOOL v17 = [(MSASComment *)self email];
    [v18 encodeObject:v17 forKey:@"email"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MSASComment *)self GUID];
    uint64_t v6 = [v4 GUID];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MSASComment;
    unsigned __int8 v7 = [(MSASComment *)&v9 isEqual:v4];
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MSASComment *)self GUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (MSASComment)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSASComment;
  v2 = [(MSASComment *)&v6 init];
  if (v2)
  {
    unint64_t v3 = [NSString MSMakeUUID];
    [(MSASComment *)v2 setGUID:v3];

    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(MSASComment *)v2 setTimestamp:v4];

    [(MSASComment *)v2 setID:0xFFFFFFFFLL];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)comment
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)MSASPCommentFromProtocolDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MSASComment);
  uint64_t v5 = [v3 objectForKey:@"commentposition"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    unsigned __int8 v7 = [v3 objectForKey:@"commentposition"];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  -[MSASComment setID:](v4, "setID:", [v7 intValue]);
  if (isKindOfClass) {

  }
  uint64_t v8 = [v3 objectForKey:@"comment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [v3 objectForKey:@"comment"];
    [(MSASComment *)v4 setContent:v9];
  }
  else
  {
    [(MSASComment *)v4 setContent:0];
  }

  uint64_t v10 = [v3 objectForKey:@"commenttimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = [v3 objectForKey:@"commenttimestamp"];

    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
    [v11 doubleValue];
    uint64_t v10 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    [(MSASComment *)v4 setClientTimestamp:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

LABEL_14:
  uint64_t v13 = [v3 objectForKey:@"commentservertimestamp"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = [v3 objectForKey:@"commentservertimestamp"];

  if (!v14 || (id v15 = v14, ![v14 length]))
  {
LABEL_19:
    id v15 = v11;

    if (!v15) {
      goto LABEL_21;
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F1C9C8];
  [v15 doubleValue];
  BOOL v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
  [(MSASComment *)v4 setTimestamp:v17];

LABEL_21:
  id v18 = [v3 objectForKey:@"personid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [v3 objectForKey:@"personid"];
    [(MSASComment *)v4 setPersonID:v19];
  }
  else
  {
    [(MSASComment *)v4 setPersonID:0];
  }

  uint64_t v20 = [v3 objectForKey:@"firstname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [v3 objectForKey:@"firstname"];
    [(MSASComment *)v4 setFirstName:v21];
  }
  else
  {
    [(MSASComment *)v4 setFirstName:0];
  }

  uint64_t v22 = [v3 objectForKey:@"lastname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v23 = [v3 objectForKey:@"lastname"];
    [(MSASComment *)v4 setLastName:v23];
  }
  else
  {
    [(MSASComment *)v4 setLastName:0];
  }

  BOOL v24 = [v3 objectForKey:@"fullname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v25 = [v3 objectForKey:@"fullname"];
    [(MSASComment *)v4 setFullName:v25];
  }
  else
  {
    [(MSASComment *)v4 setFullName:0];
  }

  v26 = [v3 objectForKey:@"email"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [v3 objectForKey:@"email"];
    [(MSASComment *)v4 setEmail:v27];
  }
  else
  {
    [(MSASComment *)v4 setEmail:0];
  }

  BOOL v28 = [v3 objectForKey:@"createdbyme"];
  objc_opt_class();
  char v29 = objc_opt_isKindOfClass();
  if (v29)
  {
    v30 = [v3 objectForKey:@"createdbyme"];
  }
  else
  {
    v30 = 0;
  }
  -[MSASComment setIsMine:](v4, "setIsMine:", [v30 isEqualToString:@"1"]);
  if (v29) {

  }
  BOOL v31 = [v3 objectForKey:@"candelete"];
  objc_opt_class();
  char v32 = objc_opt_isKindOfClass();
  if (v32)
  {
    uint64_t v33 = [v3 objectForKey:@"candelete"];
  }
  else
  {
    uint64_t v33 = 0;
  }
  -[MSASComment setIsDeletable:](v4, "setIsDeletable:", [v33 isEqualToString:@"1"]);
  if (v32) {

  }
  uint64_t v34 = [v3 objectForKey:@"iscaption"];
  objc_opt_class();
  char v35 = objc_opt_isKindOfClass();
  if (v35)
  {
    v36 = [v3 objectForKey:@"iscaption"];
  }
  else
  {
    v36 = 0;
  }
  -[MSASComment setIsCaption:](v4, "setIsCaption:", [v36 isEqualToString:@"1"]);
  if (v35) {

  }
  objc_super v37 = [v3 objectForKey:@"isbatchcomment"];
  objc_opt_class();
  char v38 = objc_opt_isKindOfClass();
  if (v38)
  {
    v39 = [v3 objectForKey:@"isbatchcomment"];
  }
  else
  {
    v39 = 0;
  }
  -[MSASComment setIsBatchComment:](v4, "setIsBatchComment:", [v39 isEqualToString:@"1"]);
  if (v38) {

  }
  v40 = [v3 objectForKey:@"commenttype"];
  objc_opt_class();
  char v41 = objc_opt_isKindOfClass();
  if (v41)
  {
    v42 = [v3 objectForKey:@"commenttype"];
  }
  else
  {
    v42 = 0;
  }
  -[MSASComment setIsLike:](v4, "setIsLike:", [v42 isEqualToString:@"1"]);
  if (v41) {

  }
  return v4;
}

@end