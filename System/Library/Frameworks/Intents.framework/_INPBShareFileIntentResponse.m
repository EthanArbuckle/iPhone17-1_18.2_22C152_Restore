@interface _INPBShareFileIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)recipientsType;
- (BOOL)confirm;
- (BOOL)hasConfirm;
- (BOOL)hasShareMode;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSArray)recipients;
- (_INPBShareFileIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)recipientsAtIndex:(unint64_t)a3;
- (id)shareModeAsString:(int)a3;
- (int)StringAsShareMode:(id)a3;
- (int)shareMode;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)addRecipients:(id)a3;
- (void)clearRecipients;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirm:(BOOL)a3;
- (void)setHasConfirm:(BOOL)a3;
- (void)setHasShareMode:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)setShareMode:(int)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBShareFileIntentResponse

- (void).cxx_destruct
{
}

- (BOOL)success
{
  return self->_success;
}

- (int)shareMode
{
  return self->_shareMode;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (BOOL)confirm
{
  return self->_confirm;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBShareFileIntentResponse *)self hasConfirm])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBShareFileIntentResponse confirm](self, "confirm"));
    [v3 setObject:v4 forKeyedSubscript:@"confirm"];
  }
  if ([(NSArray *)self->_recipients count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = self->_recipients;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"recipients"];
  }
  if ([(_INPBShareFileIntentResponse *)self hasShareMode])
  {
    uint64_t v12 = [(_INPBShareFileIntentResponse *)self shareMode];
    if (v12 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5517D98[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"shareMode"];
  }
  if ([(_INPBShareFileIntentResponse *)self hasSuccess])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBShareFileIntentResponse success](self, "success"));
    [v3 setObject:v14 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBShareFileIntentResponse *)self hasConfirm]) {
    uint64_t v3 = 2654435761 * self->_confirm;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_recipients hash];
  if ([(_INPBShareFileIntentResponse *)self hasShareMode]) {
    uint64_t v5 = 2654435761 * self->_shareMode;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBShareFileIntentResponse *)self hasSuccess]) {
    uint64_t v6 = 2654435761 * self->_success;
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
  int v5 = [(_INPBShareFileIntentResponse *)self hasConfirm];
  if (v5 != [v4 hasConfirm]) {
    goto LABEL_17;
  }
  if ([(_INPBShareFileIntentResponse *)self hasConfirm])
  {
    if ([v4 hasConfirm])
    {
      int confirm = self->_confirm;
      if (confirm != [v4 confirm]) {
        goto LABEL_17;
      }
    }
  }
  uint64_t v7 = [(_INPBShareFileIntentResponse *)self recipients];
  uint64_t v8 = [v4 recipients];
  uint64_t v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v10 = [(_INPBShareFileIntentResponse *)self recipients];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [(_INPBShareFileIntentResponse *)self recipients];
      v13 = [v4 recipients];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    int v15 = [(_INPBShareFileIntentResponse *)self hasShareMode];
    if (v15 == [v4 hasShareMode])
    {
      if (![(_INPBShareFileIntentResponse *)self hasShareMode]
        || ![v4 hasShareMode]
        || (int shareMode = self->_shareMode, shareMode == [v4 shareMode]))
      {
        int v17 = [(_INPBShareFileIntentResponse *)self hasSuccess];
        if (v17 == [v4 hasSuccess])
        {
          if (![(_INPBShareFileIntentResponse *)self hasSuccess]
            || ![v4 hasSuccess]
            || (int success = self->_success, success == [v4 success]))
          {
            BOOL v18 = 1;
            goto LABEL_18;
          }
        }
      }
    }
  }
  else
  {
  }
LABEL_17:
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBShareFileIntentResponse allocWithZone:](_INPBShareFileIntentResponse, "allocWithZone:") init];
  if ([(_INPBShareFileIntentResponse *)self hasConfirm]) {
    [(_INPBShareFileIntentResponse *)v5 setConfirm:[(_INPBShareFileIntentResponse *)self confirm]];
  }
  uint64_t v6 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [(_INPBShareFileIntentResponse *)v5 setRecipients:v6];

  if ([(_INPBShareFileIntentResponse *)self hasShareMode]) {
    [(_INPBShareFileIntentResponse *)v5 setShareMode:[(_INPBShareFileIntentResponse *)self shareMode]];
  }
  if ([(_INPBShareFileIntentResponse *)self hasSuccess]) {
    [(_INPBShareFileIntentResponse *)v5 setSuccess:[(_INPBShareFileIntentResponse *)self success]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBShareFileIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBShareFileIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBShareFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBShareFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBShareFileIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBShareFileIntentResponse *)self hasConfirm]) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = self->_recipients;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(_INPBShareFileIntentResponse *)self hasShareMode]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBShareFileIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShareFileIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int success = a3;
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
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517D98[a3];
  }

  return v3;
}

- (void)setHasShareMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShareMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShareMode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
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

- (void)setHasConfirm:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirm
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirm:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int confirm = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)recipientsType
{
  return (Class)objc_opt_class();
}

@end