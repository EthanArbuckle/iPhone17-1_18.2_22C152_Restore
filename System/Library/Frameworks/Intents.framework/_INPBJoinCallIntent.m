@interface _INPBJoinCallIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasGroupConversation;
- (BOOL)hasGroupConversationFilter;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCallGroupConversation)groupConversation;
- (_INPBCallGroupConversationFilter)groupConversationFilter;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBJoinCallIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupConversation:(id)a3;
- (void)setGroupConversationFilter:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBJoinCallIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupConversationFilter, 0);

  objc_storeStrong((id *)&self->_groupConversation, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBCallGroupConversationFilter)groupConversationFilter
{
  return self->_groupConversationFilter;
}

- (_INPBCallGroupConversation)groupConversation
{
  return self->_groupConversation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBJoinCallIntent *)self groupConversation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"groupConversation"];

  v6 = [(_INPBJoinCallIntent *)self groupConversationFilter];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"groupConversationFilter"];

  v8 = [(_INPBJoinCallIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCallGroupConversation *)self->_groupConversation hash];
  unint64_t v4 = [(_INPBCallGroupConversationFilter *)self->_groupConversationFilter hash] ^ v3;
  return v4 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBJoinCallIntent *)self groupConversation];
  v6 = [v4 groupConversation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBJoinCallIntent *)self groupConversation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBJoinCallIntent *)self groupConversation];
    v10 = [v4 groupConversation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBJoinCallIntent *)self groupConversationFilter];
  v6 = [v4 groupConversationFilter];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBJoinCallIntent *)self groupConversationFilter];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBJoinCallIntent *)self groupConversationFilter];
    v15 = [v4 groupConversationFilter];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBJoinCallIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBJoinCallIntent *)self intentMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBJoinCallIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBJoinCallIntent allocWithZone:](_INPBJoinCallIntent, "allocWithZone:") init];
  id v6 = [(_INPBCallGroupConversation *)self->_groupConversation copyWithZone:a3];
  [(_INPBJoinCallIntent *)v5 setGroupConversation:v6];

  id v7 = [(_INPBCallGroupConversationFilter *)self->_groupConversationFilter copyWithZone:a3];
  [(_INPBJoinCallIntent *)v5 setGroupConversationFilter:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBJoinCallIntent *)v5 setIntentMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBJoinCallIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBJoinCallIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBJoinCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBJoinCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBJoinCallIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBJoinCallIntent *)self groupConversation];

  if (v4)
  {
    v5 = [(_INPBJoinCallIntent *)self groupConversation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBJoinCallIntent *)self groupConversationFilter];

  if (v6)
  {
    uint64_t v7 = [(_INPBJoinCallIntent *)self groupConversationFilter];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBJoinCallIntent *)self intentMetadata];

  if (v8)
  {
    v9 = [(_INPBJoinCallIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBJoinCallIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasGroupConversationFilter
{
  return self->_groupConversationFilter != 0;
}

- (void)setGroupConversationFilter:(id)a3
{
}

- (BOOL)hasGroupConversation
{
  return self->_groupConversation != 0;
}

- (void)setGroupConversation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end