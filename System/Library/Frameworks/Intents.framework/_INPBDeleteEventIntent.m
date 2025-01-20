@interface _INPBDeleteEventIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)deleteAllOccurrences;
- (BOOL)hasDeleteAllOccurrences;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTargetEventIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)targetEventIdentifier;
- (_INPBDeleteEventIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleteAllOccurrences:(BOOL)a3;
- (void)setHasDeleteAllOccurrences:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTargetEventIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteEventIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEventIdentifier, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSString)targetEventIdentifier
{
  return self->_targetEventIdentifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)deleteAllOccurrences
{
  return self->_deleteAllOccurrences;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDeleteEventIntent *)self hasDeleteAllOccurrences])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBDeleteEventIntent deleteAllOccurrences](self, "deleteAllOccurrences"));
    [v3 setObject:v4 forKeyedSubscript:@"deleteAllOccurrences"];
  }
  v5 = [(_INPBDeleteEventIntent *)self intentMetadata];
  v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"intentMetadata"];

  if (self->_targetEventIdentifier)
  {
    v7 = [(_INPBDeleteEventIntent *)self targetEventIdentifier];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"targetEventIdentifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDeleteEventIntent *)self hasDeleteAllOccurrences]) {
    uint64_t v3 = 2654435761 * self->_deleteAllOccurrences;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(NSString *)self->_targetEventIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBDeleteEventIntent *)self hasDeleteAllOccurrences];
  if (v5 != [v4 hasDeleteAllOccurrences]) {
    goto LABEL_16;
  }
  if ([(_INPBDeleteEventIntent *)self hasDeleteAllOccurrences])
  {
    if ([v4 hasDeleteAllOccurrences])
    {
      int deleteAllOccurrences = self->_deleteAllOccurrences;
      if (deleteAllOccurrences != [v4 deleteAllOccurrences]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBDeleteEventIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBDeleteEventIntent *)self intentMetadata];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBDeleteEventIntent *)self intentMetadata];
    v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBDeleteEventIntent *)self targetEventIdentifier];
  v8 = [v4 targetEventIdentifier];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBDeleteEventIntent *)self targetEventIdentifier];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBDeleteEventIntent *)self targetEventIdentifier];
    v17 = [v4 targetEventIdentifier];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBDeleteEventIntent allocWithZone:](_INPBDeleteEventIntent, "allocWithZone:") init];
  if ([(_INPBDeleteEventIntent *)self hasDeleteAllOccurrences]) {
    [(_INPBDeleteEventIntent *)v5 setDeleteAllOccurrences:[(_INPBDeleteEventIntent *)self deleteAllOccurrences]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBDeleteEventIntent *)v5 setIntentMetadata:v6];

  v7 = (void *)[(NSString *)self->_targetEventIdentifier copyWithZone:a3];
  [(_INPBDeleteEventIntent *)v5 setTargetEventIdentifier:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteEventIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteEventIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteEventIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteEventIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteEventIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBDeleteEventIntent *)self hasDeleteAllOccurrences]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_INPBDeleteEventIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBDeleteEventIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBDeleteEventIntent *)self targetEventIdentifier];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteEventIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetEventIdentifier
{
  return self->_targetEventIdentifier != 0;
}

- (void)setTargetEventIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  targetEventIdentifier = self->_targetEventIdentifier;
  self->_targetEventIdentifier = v4;

  MEMORY[0x1F41817F8](v4, targetEventIdentifier);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (void)setHasDeleteAllOccurrences:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeleteAllOccurrences
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeleteAllOccurrences:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int deleteAllOccurrences = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end