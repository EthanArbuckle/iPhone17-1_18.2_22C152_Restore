@interface _INPBSendAnnouncementIntent
+ (BOOL)supportsSecureCoding;
+ (Class)recipientsType;
- (BOOL)hasAnnouncement;
- (BOOL)hasIntentMetadata;
- (BOOL)hasIsReply;
- (BOOL)hasSharedUserID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReply;
- (BOOL)readFrom:(id)a3;
- (NSArray)recipients;
- (NSString)sharedUserID;
- (_INPBAnnouncement)announcement;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSendAnnouncementIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)recipientsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)addRecipients:(id)a3;
- (void)clearRecipients;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnouncement:(id)a3;
- (void)setHasIsReply:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setIsReply:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)setSharedUserID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSendAnnouncementIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_announcement, 0);
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBAnnouncement)announcement
{
  return self->_announcement;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSendAnnouncementIntent *)self announcement];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"announcement"];

  v6 = [(_INPBSendAnnouncementIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSendAnnouncementIntent *)self hasIsReply])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSendAnnouncementIntent isReply](self, "isReply"));
    [v3 setObject:v8 forKeyedSubscript:@"isReply"];
  }
  if ([(NSArray *)self->_recipients count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = self->_recipients;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"recipients"];
  }
  if (self->_sharedUserID)
  {
    v16 = [(_INPBSendAnnouncementIntent *)self sharedUserID];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"sharedUserID"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAnnouncement *)self->_announcement hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSendAnnouncementIntent *)self hasIsReply]) {
    uint64_t v5 = 2654435761 * self->_isReply;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSArray *)self->_recipients hash];
  return v6 ^ [(NSString *)self->_sharedUserID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  uint64_t v5 = [(_INPBSendAnnouncementIntent *)self announcement];
  uint64_t v6 = [v4 announcement];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v7 = [(_INPBSendAnnouncementIntent *)self announcement];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSendAnnouncementIntent *)self announcement];
    v10 = [v4 announcement];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendAnnouncementIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v12 = [(_INPBSendAnnouncementIntent *)self intentMetadata];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_INPBSendAnnouncementIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v17 = [(_INPBSendAnnouncementIntent *)self hasIsReply];
  if (v17 != [v4 hasIsReply]) {
    goto LABEL_26;
  }
  if ([(_INPBSendAnnouncementIntent *)self hasIsReply])
  {
    if ([v4 hasIsReply])
    {
      int isReply = self->_isReply;
      if (isReply != [v4 isReply]) {
        goto LABEL_26;
      }
    }
  }
  uint64_t v5 = [(_INPBSendAnnouncementIntent *)self recipients];
  uint64_t v6 = [v4 recipients];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBSendAnnouncementIntent *)self recipients];
  if (v19)
  {
    long long v20 = (void *)v19;
    long long v21 = [(_INPBSendAnnouncementIntent *)self recipients];
    long long v22 = [v4 recipients];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendAnnouncementIntent *)self sharedUserID];
  uint64_t v6 = [v4 sharedUserID];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v24 = [(_INPBSendAnnouncementIntent *)self sharedUserID];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBSendAnnouncementIntent *)self sharedUserID];
    v27 = [v4 sharedUserID];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSendAnnouncementIntent allocWithZone:](_INPBSendAnnouncementIntent, "allocWithZone:") init];
  id v6 = [(_INPBAnnouncement *)self->_announcement copyWithZone:a3];
  [(_INPBSendAnnouncementIntent *)v5 setAnnouncement:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSendAnnouncementIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBSendAnnouncementIntent *)self hasIsReply]) {
    [(_INPBSendAnnouncementIntent *)v5 setIsReply:[(_INPBSendAnnouncementIntent *)self isReply]];
  }
  v8 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [(_INPBSendAnnouncementIntent *)v5 setRecipients:v8];

  v9 = (void *)[(NSString *)self->_sharedUserID copyWithZone:a3];
  [(_INPBSendAnnouncementIntent *)v5 setSharedUserID:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSendAnnouncementIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSendAnnouncementIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSendAnnouncementIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSendAnnouncementIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSendAnnouncementIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBSendAnnouncementIntent *)self announcement];

  if (v5)
  {
    id v6 = [(_INPBSendAnnouncementIntent *)self announcement];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSendAnnouncementIntent *)self intentMetadata];

  if (v7)
  {
    v8 = [(_INPBSendAnnouncementIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSendAnnouncementIntent *)self hasIsReply]) {
    PBDataWriterWriteBOOLField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = self->_recipients;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  v14 = [(_INPBSendAnnouncementIntent *)self sharedUserID];

  if (v14) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendAnnouncementIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSharedUserID
{
  return self->_sharedUserID != 0;
}

- (void)setSharedUserID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  sharedUserID = self->_sharedUserID;
  self->_sharedUserID = v4;

  MEMORY[0x1F41817F8](v4, sharedUserID);
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
    id v6 = [MEMORY[0x1E4F1CA48] array];
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
  id v4 = (NSArray *)[a3 mutableCopy];
  recipients = self->_recipients;
  self->_recipients = v4;

  MEMORY[0x1F41817F8](v4, recipients);
}

- (void)setHasIsReply:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsReply
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsReply:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isReply = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasAnnouncement
{
  return self->_announcement != 0;
}

- (void)setAnnouncement:(id)a3
{
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