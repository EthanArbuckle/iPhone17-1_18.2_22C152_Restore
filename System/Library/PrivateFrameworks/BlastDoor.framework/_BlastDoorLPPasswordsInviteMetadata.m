@interface _BlastDoorLPPasswordsInviteMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)groupName;
- (NSString)urlParameters;
- (_BlastDoorLPPasswordsInviteMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setUrlParameters:(id)a3;
@end

@implementation _BlastDoorLPPasswordsInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPPasswordsInviteMetadata)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPPasswordsInviteMetadata;
  v5 = [(_BlastDoorLPPasswordsInviteMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"groupName");
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"urlParameters");
    urlParameters = v5->_urlParameters;
    v5->_urlParameters = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  groupName = self->_groupName;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", groupName, @"groupName");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_urlParameters, @"urlParameters");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPPasswordsInviteMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPPasswordsInviteMetadata *)self groupName];
    [(_BlastDoorLPPasswordsInviteMetadata *)v4 setGroupName:v5];

    uint64_t v6 = [(_BlastDoorLPPasswordsInviteMetadata *)self urlParameters];
    [(_BlastDoorLPPasswordsInviteMetadata *)v4 setUrlParameters:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPPasswordsInviteMetadata;
  if ([(_BlastDoorLPPasswordsInviteMetadata *)&v14 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      groupName = self->_groupName;
      uint64_t v8 = [v6 groupName];
      if ((unint64_t)groupName | v8
        && (v9 = (void *)v8, int v10 = [(NSString *)groupName isEqual:v8], v9, !v10))
      {
        char v5 = 0;
      }
      else
      {
        urlParameters = self->_urlParameters;
        uint64_t v12 = [v6 urlParameters];
        if ((unint64_t)urlParameters | v12) {
          char v5 = [(NSString *)urlParameters isEqual:v12];
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)urlParameters
{
  return self->_urlParameters;
}

- (void)setUrlParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlParameters, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end