@interface _INPBCallGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)hasGroupId;
- (BOOL)hasGroupName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCallGroup)initWithCoder:(id)a3;
- (_INPBString)groupId;
- (_INPBString)groupName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setGroupName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_groupId, 0);
}

- (_INPBString)groupName
{
  return self->_groupName;
}

- (_INPBString)groupId
{
  return self->_groupId;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCallGroup *)self groupId];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"groupId"];

  v6 = [(_INPBCallGroup *)self groupName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"groupName"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_groupId hash];
  return [(_INPBString *)self->_groupName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBCallGroup *)self groupId];
  v6 = [v4 groupId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBCallGroup *)self groupId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCallGroup *)self groupId];
    v10 = [v4 groupId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBCallGroup *)self groupName];
  v6 = [v4 groupName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBCallGroup *)self groupName];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBCallGroup *)self groupName];
    v15 = [v4 groupName];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBCallGroup allocWithZone:](_INPBCallGroup, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_groupId copyWithZone:a3];
  [(_INPBCallGroup *)v5 setGroupId:v6];

  id v7 = [(_INPBString *)self->_groupName copyWithZone:a3];
  [(_INPBCallGroup *)v5 setGroupName:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallGroup *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCallGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCallGroup *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCallGroup *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallGroup *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBCallGroup *)self groupId];

  if (v4)
  {
    v5 = [(_INPBCallGroup *)self groupId];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBCallGroup *)self groupName];

  if (v6)
  {
    uint64_t v7 = [(_INPBCallGroup *)self groupName];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallGroupReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)setGroupId:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end