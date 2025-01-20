@interface _INPBShareFileIntent
+ (BOOL)supportsSecureCoding;
+ (Class)entityNameType;
+ (Class)recipientsType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasShareMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)entityNames;
- (NSArray)recipients;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBShareFileIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entityNameAtIndex:(unint64_t)a3;
- (id)recipientsAtIndex:(unint64_t)a3;
- (id)shareModeAsString:(int)a3;
- (int)StringAsShareMode:(id)a3;
- (int)shareMode;
- (unint64_t)entityNamesCount;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)addEntityName:(id)a3;
- (void)addRecipients:(id)a3;
- (void)clearEntityNames;
- (void)clearRecipients;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityNames:(id)a3;
- (void)setHasShareMode:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setShareMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBShareFileIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_entityNames, 0);
}

- (int)shareMode
{
  return self->_shareMode;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_entityNames count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = self->_entityNames;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"entityName"];
  }
  v11 = [(_INPBShareFileIntent *)self intentMetadata];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_recipients count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = self->_recipients;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v23 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"recipients"];
  }
  if ([(_INPBShareFileIntent *)self hasShareMode])
  {
    uint64_t v20 = [(_INPBShareFileIntent *)self shareMode];
    if (v20 >= 3)
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
    }
    else
    {
      v21 = *(&off_1E55163F0 + v20);
    }
    [v3 setObject:v21 forKeyedSubscript:@"shareMode"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_entityNames hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  uint64_t v5 = [(NSArray *)self->_recipients hash];
  if ([(_INPBShareFileIntent *)self hasShareMode]) {
    uint64_t v6 = 2654435761 * self->_shareMode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uint64_t v5 = [(_INPBShareFileIntent *)self entityNames];
  uint64_t v6 = [v4 entityNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBShareFileIntent *)self entityNames];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBShareFileIntent *)self entityNames];
    v10 = [v4 entityNames];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBShareFileIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBShareFileIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBShareFileIntent *)self intentMetadata];
    uint64_t v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBShareFileIntent *)self recipients];
  uint64_t v6 = [v4 recipients];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_INPBShareFileIntent *)self recipients];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBShareFileIntent *)self recipients];
    uint64_t v20 = [v4 recipients];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int v24 = [(_INPBShareFileIntent *)self hasShareMode];
  if (v24 == [v4 hasShareMode])
  {
    if (![(_INPBShareFileIntent *)self hasShareMode]
      || ![v4 hasShareMode]
      || (int shareMode = self->_shareMode, shareMode == [v4 shareMode]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBShareFileIntent allocWithZone:](_INPBShareFileIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_entityNames copyWithZone:a3];
  [(_INPBShareFileIntent *)v5 setEntityNames:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBShareFileIntent *)v5 setIntentMetadata:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [(_INPBShareFileIntent *)v5 setRecipients:v8];

  if ([(_INPBShareFileIntent *)self hasShareMode]) {
    [(_INPBShareFileIntent *)v5 setShareMode:[(_INPBShareFileIntent *)self shareMode]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBShareFileIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBShareFileIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBShareFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBShareFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBShareFileIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_entityNames;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBShareFileIntent *)self intentMetadata];

  if (v10)
  {
    int v11 = [(_INPBShareFileIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_recipients;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if ([(_INPBShareFileIntent *)self hasShareMode]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShareFileIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsShareMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AIRDROP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MESSAGE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAIL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)shareModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E55163F0 + a3);
  }

  return v3;
}

- (void)setHasShareMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShareMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShareMode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int shareMode = a3;
  }
}

- (id)recipientsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_recipients objectAtIndexedSubscript:a3];
}

- (unint64_t)recipientsCount
{
  return [(NSArray *)self->_recipients count];
}

- (void)addRecipients:(id)a3
{
  id v4 = a3;
  recipients = self->_recipients;
  id v8 = v4;
  if (!recipients)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recipients;
    self->_recipients = v6;

    id v4 = v8;
    recipients = self->_recipients;
  }
  [(NSArray *)recipients addObject:v4];
}

- (void)clearRecipients
{
}

- (void)setRecipients:(id)a3
{
  self->_recipients = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)entityNameAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entityNames objectAtIndexedSubscript:a3];
}

- (unint64_t)entityNamesCount
{
  return [(NSArray *)self->_entityNames count];
}

- (void)addEntityName:(id)a3
{
  id v4 = a3;
  entityNames = self->_entityNames;
  id v8 = v4;
  if (!entityNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entityNames;
    self->_entityNames = v6;

    id v4 = v8;
    entityNames = self->_entityNames;
  }
  [(NSArray *)entityNames addObject:v4];
}

- (void)clearEntityNames
{
}

- (void)setEntityNames:(id)a3
{
  self->_entityNames = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)recipientsType
{
  return (Class)objc_opt_class();
}

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
}

@end