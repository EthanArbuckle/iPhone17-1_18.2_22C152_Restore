@interface INCallGroup
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCallGroup)initWithCoder:(id)a3;
- (INCallGroup)initWithGroupName:(NSString *)groupName groupId:(NSString *)groupId;
- (NSString)description;
- (NSString)groupId;
- (NSString)groupName;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCallGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);

  objc_storeStrong((id *)&self->_groupName, 0);
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"groupName";
  groupName = self->_groupName;
  v4 = groupName;
  if (!groupName)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"groupId";
  v10[0] = v4;
  groupId = self->_groupId;
  v6 = groupId;
  if (!groupId)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (groupId)
  {
    if (groupName) {
      goto LABEL_7;
    }
  }
  else
  {

    if (groupName) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCallGroup;
  v6 = [(INCallGroup *)&v11 description];
  v7 = [(INCallGroup *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCallGroup *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_groupName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"groupName");

  v9 = [v6 encodeObject:self->_groupId];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"groupId");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  groupName = self->_groupName;
  id v5 = a3;
  [v5 encodeObject:groupName forKey:@"groupName"];
  [v5 encodeObject:self->_groupId forKey:@"groupId"];
}

- (INCallGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupId"];

  v7 = [(INCallGroup *)self initWithGroupName:v5 groupId:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCallGroup *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      groupName = self->_groupName;
      BOOL v8 = 0;
      if (groupName == v5->_groupName || -[NSString isEqual:](groupName, "isEqual:"))
      {
        groupId = self->_groupId;
        if (groupId == v5->_groupId || -[NSString isEqual:](groupId, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupName hash];
  return [(NSString *)self->_groupId hash] ^ v3;
}

- (INCallGroup)initWithGroupName:(NSString *)groupName groupId:(NSString *)groupId
{
  id v6 = groupName;
  v7 = groupId;
  v14.receiver = self;
  v14.super_class = (Class)INCallGroup;
  BOOL v8 = [(INCallGroup *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    v10 = v8->_groupName;
    v8->_groupName = (NSString *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_groupId;
    v8->_groupId = (NSString *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"groupName"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"groupId"];
    objc_super v14 = [v7 decodeObjectOfClass:v12 from:v13];

    v15 = (void *)[objc_alloc((Class)a1) initWithGroupName:v11 groupId:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end