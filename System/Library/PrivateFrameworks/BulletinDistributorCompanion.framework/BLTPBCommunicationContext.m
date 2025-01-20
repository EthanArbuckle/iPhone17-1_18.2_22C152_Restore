@interface BLTPBCommunicationContext
+ (Class)recipientsType;
- (BLTPBContact)sender;
- (BOOL)hasAssociatedObjectUriData;
- (BOOL)hasCapabilities;
- (BOOL)hasCapability;
- (BOOL)hasContentURLData;
- (BOOL)hasDisplayName;
- (BOOL)hasIdentifier;
- (BOOL)hasImageName;
- (BOOL)hasMentionsCurrentUser;
- (BOOL)hasNotifyRecipientAnyway;
- (BOOL)hasRecipientCount;
- (BOOL)hasReplyToCurrentUser;
- (BOOL)hasSender;
- (BOOL)hasSystemImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)mentionsCurrentUser;
- (BOOL)notifyRecipientAnyway;
- (BOOL)readFrom:(id)a3;
- (BOOL)replyToCurrentUser;
- (BOOL)systemImage;
- (NSData)contentURLData;
- (NSMutableArray)recipients;
- (NSString)associatedObjectUriData;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)imageName;
- (NSURL)contentURLLocalFileLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recipientsAtIndex:(unint64_t)a3;
- (int)capabilities;
- (int)capability;
- (int)recipientCount;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)addRecipients:(id)a3;
- (void)clearRecipients;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedObjectUriData:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCapabilities:(int)a3;
- (void)setCapability:(int)a3;
- (void)setContentURLData:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasCapabilities:(BOOL)a3;
- (void)setHasCapability:(BOOL)a3;
- (void)setHasMentionsCurrentUser:(BOOL)a3;
- (void)setHasNotifyRecipientAnyway:(BOOL)a3;
- (void)setHasRecipientCount:(BOOL)a3;
- (void)setHasReplyToCurrentUser:(BOOL)a3;
- (void)setHasSystemImage:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageName:(id)a3;
- (void)setMentionsCurrentUser:(BOOL)a3;
- (void)setNotifyRecipientAnyway:(BOOL)a3;
- (void)setRecipientCount:(int)a3;
- (void)setRecipients:(id)a3;
- (void)setReplyToCurrentUser:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setSystemImage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBCommunicationContext

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAssociatedObjectUriData
{
  return self->_associatedObjectUriData != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)clearRecipients
{
}

- (void)addRecipients:(id)a3
{
  id v4 = a3;
  recipients = self->_recipients;
  id v8 = v4;
  if (!recipients)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recipients;
    self->_recipients = v6;

    id v4 = v8;
    recipients = self->_recipients;
  }
  [(NSMutableArray *)recipients addObject:v4];
}

- (unint64_t)recipientsCount
{
  return [(NSMutableArray *)self->_recipients count];
}

- (id)recipientsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recipients objectAtIndex:a3];
}

+ (Class)recipientsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContentURLData
{
  return self->_contentURLData != 0;
}

- (void)setMentionsCurrentUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mentionsCurrentUser = a3;
}

- (void)setHasMentionsCurrentUser:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMentionsCurrentUser
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNotifyRecipientAnyway:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_notifyRecipientAnyway = a3;
}

- (void)setHasNotifyRecipientAnyway:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNotifyRecipientAnyway
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setReplyToCurrentUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_replyToCurrentUser = a3;
}

- (void)setHasReplyToCurrentUser:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReplyToCurrentUser
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRecipientCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recipientCount = a3;
}

- (void)setHasRecipientCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecipientCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasImageName
{
  return self->_imageName != 0;
}

- (void)setSystemImage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_systemImage = a3;
}

- (void)setHasSystemImage:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSystemImage
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCapability:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_capability = a3;
}

- (void)setHasCapability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCapability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCapabilities:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBCommunicationContext;
  id v4 = [(BLTPBCommunicationContext *)&v8 description];
  v5 = [(BLTPBCommunicationContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  associatedObjectUriData = self->_associatedObjectUriData;
  if (associatedObjectUriData) {
    [v4 setObject:associatedObjectUriData forKey:@"associatedObjectUriData"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  sender = self->_sender;
  if (sender)
  {
    v10 = [(BLTPBContact *)sender dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"sender"];
  }
  if ([(NSMutableArray *)self->_recipients count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_recipients, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v12 = self->_recipients;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (void)v30);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"recipients"];
  }
  contentURLData = self->_contentURLData;
  if (contentURLData) {
    [v4 setObject:contentURLData forKey:@"contentURLData"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_mentionsCurrentUser];
    [v4 setObject:v25 forKey:@"mentionsCurrentUser"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_24:
      if ((has & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_24;
  }
  v26 = objc_msgSend(NSNumber, "numberWithBool:", self->_notifyRecipientAnyway, (void)v30);
  [v4 setObject:v26 forKey:@"notifyRecipientAnyway"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_25:
    if ((has & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_38:
  v27 = objc_msgSend(NSNumber, "numberWithBool:", self->_replyToCurrentUser, (void)v30);
  [v4 setObject:v27 forKey:@"replyToCurrentUser"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_26:
    v20 = objc_msgSend(NSNumber, "numberWithInt:", self->_recipientCount, (void)v30);
    [v4 setObject:v20 forKey:@"recipientCount"];
  }
LABEL_27:
  imageName = self->_imageName;
  if (imageName) {
    [v4 setObject:imageName forKey:@"imageName"];
  }
  char v22 = (char)self->_has;
  if ((v22 & 0x40) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_systemImage];
    [v4 setObject:v28 forKey:@"systemImage"];

    char v22 = (char)self->_has;
    if ((v22 & 2) == 0)
    {
LABEL_31:
      if ((v22 & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_31;
  }
  v29 = objc_msgSend(NSNumber, "numberWithInt:", self->_capability, (void)v30);
  [v4 setObject:v29 forKey:@"capability"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_32:
    v23 = objc_msgSend(NSNumber, "numberWithInt:", self->_capabilities, (void)v30);
    [v4 setObject:v23 forKey:@"capabilities"];
  }
LABEL_33:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBCommunicationContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (!self->_bundleIdentifier) {
    -[BLTPBCommunicationContext writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_associatedObjectUriData) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_sender) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_recipients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (self->_contentURLData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_23:
  }
    PBDataWriterWriteInt32Field();
LABEL_24:
  if (self->_imageName) {
    PBDataWriterWriteStringField();
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_28;
    }
LABEL_36:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  char v11 = (char)self->_has;
  if ((v11 & 2) != 0) {
    goto LABEL_36;
  }
LABEL_28:
  if (v11) {
LABEL_29:
  }
    PBDataWriterWriteInt32Field();
LABEL_30:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v12;
  }
  [v4 setBundleIdentifier:self->_bundleIdentifier];
  if (self->_associatedObjectUriData) {
    objc_msgSend(v12, "setAssociatedObjectUriData:");
  }
  if (self->_displayName) {
    objc_msgSend(v12, "setDisplayName:");
  }
  if (self->_sender) {
    objc_msgSend(v12, "setSender:");
  }
  if ([(BLTPBCommunicationContext *)self recipientsCount])
  {
    [v12 clearRecipients];
    unint64_t v5 = [(BLTPBCommunicationContext *)self recipientsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BLTPBCommunicationContext *)self recipientsAtIndex:i];
        [v12 addRecipients:v8];
      }
    }
  }
  if (self->_contentURLData) {
    objc_msgSend(v12, "setContentURLData:");
  }
  char has = (char)self->_has;
  v10 = v12;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v12 + 88) = self->_mentionsCurrentUser;
    *((unsigned char *)v12 + 92) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_17:
      if ((has & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v12 + 89) = self->_notifyRecipientAnyway;
  *((unsigned char *)v12 + 92) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_18:
    if ((has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_31:
  *((unsigned char *)v12 + 90) = self->_replyToCurrentUser;
  *((unsigned char *)v12 + 92) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_19:
    *((_DWORD *)v12 + 16) = self->_recipientCount;
    *((unsigned char *)v12 + 92) |= 4u;
  }
LABEL_20:
  if (self->_imageName)
  {
    objc_msgSend(v12, "setImageName:");
    v10 = v12;
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v10[91] = self->_systemImage;
    v10[92] |= 0x40u;
    char v11 = (char)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_24:
      if ((v11 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_24;
  }
  *((_DWORD *)v10 + 7) = self->_capability;
  v10[92] |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_25:
    *((_DWORD *)v10 + 6) = self->_capabilities;
    v10[92] |= 1u;
  }
LABEL_26:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_associatedObjectUriData copyWithZone:a3];
  char v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_displayName copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(BLTPBContact *)self->_sender copyWithZone:a3];
  long long v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v16 = self->_recipients;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "copyWithZone:", a3, (void)v29);
        [(id)v5 addRecipients:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(NSData *)self->_contentURLData copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_mentionsCurrentUser;
    *(unsigned char *)(v5 + 92) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 89) = self->_notifyRecipientAnyway;
  *(unsigned char *)(v5 + 92) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  *(unsigned char *)(v5 + 90) = self->_replyToCurrentUser;
  *(unsigned char *)(v5 + 92) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 64) = self->_recipientCount;
    *(unsigned char *)(v5 + 92) |= 4u;
  }
LABEL_13:
  uint64_t v25 = -[NSString copyWithZone:](self->_imageName, "copyWithZone:", a3, (void)v29);
  v26 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v25;

  char v27 = (char)self->_has;
  if ((v27 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_23:
    *(_DWORD *)(v5 + 28) = self->_capability;
    *(unsigned char *)(v5 + 92) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_16;
  }
  *(unsigned char *)(v5 + 91) = self->_systemImage;
  *(unsigned char *)(v5 + 92) |= 0x40u;
  char v27 = (char)self->_has;
  if ((v27 & 2) != 0) {
    goto LABEL_23;
  }
LABEL_15:
  if (v27)
  {
LABEL_16:
    *(_DWORD *)(v5 + 24) = self->_capabilities;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_66;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_66;
    }
  }
  associatedObjectUriData = self->_associatedObjectUriData;
  if ((unint64_t)associatedObjectUriData | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](associatedObjectUriData, "isEqual:")) {
      goto LABEL_66;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_66;
    }
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 10))
  {
    if (!-[BLTPBContact isEqual:](sender, "isEqual:")) {
      goto LABEL_66;
    }
  }
  recipients = self->_recipients;
  if ((unint64_t)recipients | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](recipients, "isEqual:")) {
      goto LABEL_66;
    }
  }
  contentURLData = self->_contentURLData;
  if ((unint64_t)contentURLData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](contentURLData, "isEqual:")) {
      goto LABEL_66;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0) {
      goto LABEL_66;
    }
    if (self->_mentionsCurrentUser)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x10) == 0) {
      goto LABEL_66;
    }
    if (self->_notifyRecipientAnyway)
    {
      if (!*((unsigned char *)v4 + 89)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 89))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x20) == 0) {
      goto LABEL_66;
    }
    if (self->_replyToCurrentUser)
    {
      if (!*((unsigned char *)v4 + 90)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 90))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x20) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_recipientCount != *((_DWORD *)v4 + 16)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_66;
  }
  imageName = self->_imageName;
  if ((unint64_t)imageName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](imageName, "isEqual:")) {
      goto LABEL_66;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x40) != 0)
    {
      if (self->_systemImage)
      {
        if (!*((unsigned char *)v4 + 91)) {
          goto LABEL_66;
        }
        goto LABEL_56;
      }
      if (!*((unsigned char *)v4 + 91)) {
        goto LABEL_56;
      }
    }
LABEL_66:
    BOOL v14 = 0;
    goto LABEL_67;
  }
  if ((*((unsigned char *)v4 + 92) & 0x40) != 0) {
    goto LABEL_66;
  }
LABEL_56:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_capability != *((_DWORD *)v4 + 7)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_66;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_capabilities != *((_DWORD *)v4 + 6)) {
      goto LABEL_66;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (*((unsigned char *)v4 + 92) & 1) == 0;
  }
LABEL_67:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v18 = [(NSString *)self->_identifier hash];
  NSUInteger v17 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v16 = [(NSString *)self->_associatedObjectUriData hash];
  NSUInteger v15 = [(NSString *)self->_displayName hash];
  unint64_t v3 = [(BLTPBContact *)self->_sender hash];
  uint64_t v4 = [(NSMutableArray *)self->_recipients hash];
  uint64_t v5 = [(NSData *)self->_contentURLData hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_mentionsCurrentUser;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_notifyRecipientAnyway;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_replyToCurrentUser;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v9 = 2654435761 * self->_recipientCount;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v9 = 0;
LABEL_10:
  NSUInteger v10 = [(NSString *)self->_imageName hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v12 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v13 = 0;
    return v17 ^ v18 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v11 = 2654435761 * self->_systemImage;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_capability;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v13 = 2654435761 * self->_capabilities;
  return v17 ^ v18 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[BLTPBCommunicationContext setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[BLTPBCommunicationContext setBundleIdentifier:](self, "setBundleIdentifier:");
  }
  if (*((void *)v4 + 1)) {
    -[BLTPBCommunicationContext setAssociatedObjectUriData:](self, "setAssociatedObjectUriData:");
  }
  if (*((void *)v4 + 5)) {
    -[BLTPBCommunicationContext setDisplayName:](self, "setDisplayName:");
  }
  sender = self->_sender;
  uint64_t v6 = *((void *)v4 + 10);
  if (sender)
  {
    if (v6) {
      -[BLTPBContact mergeFrom:](sender, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BLTPBCommunicationContext setSender:](self, "setSender:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 9);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[BLTPBCommunicationContext addRecipients:](self, "addRecipients:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 4)) {
    -[BLTPBCommunicationContext setContentURLData:](self, "setContentURLData:");
  }
  char v12 = *((unsigned char *)v4 + 92);
  if ((v12 & 8) != 0)
  {
    self->_mentionsCurrentUser = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 8u;
    char v12 = *((unsigned char *)v4 + 92);
    if ((v12 & 0x10) == 0)
    {
LABEL_25:
      if ((v12 & 0x20) == 0) {
        goto LABEL_26;
      }
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x10) == 0)
  {
    goto LABEL_25;
  }
  self->_notifyRecipientAnyway = *((unsigned char *)v4 + 89);
  *(unsigned char *)&self->_has |= 0x10u;
  char v12 = *((unsigned char *)v4 + 92);
  if ((v12 & 0x20) == 0)
  {
LABEL_26:
    if ((v12 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_37:
  self->_replyToCurrentUser = *((unsigned char *)v4 + 90);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
LABEL_27:
    self->_recipientCount = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_28:
  if (*((void *)v4 + 7)) {
    -[BLTPBCommunicationContext setImageName:](self, "setImageName:");
  }
  char v13 = *((unsigned char *)v4 + 92);
  if ((v13 & 0x40) == 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0) {
      goto LABEL_32;
    }
LABEL_40:
    self->_capability = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v4 + 92) & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  self->_systemImage = *((unsigned char *)v4 + 91);
  *(unsigned char *)&self->_has |= 0x40u;
  char v13 = *((unsigned char *)v4 + 92);
  if ((v13 & 2) != 0) {
    goto LABEL_40;
  }
LABEL_32:
  if (v13)
  {
LABEL_33:
    self->_capabilities = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_34:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)associatedObjectUriData
{
  return self->_associatedObjectUriData;
}

- (void)setAssociatedObjectUriData:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BLTPBContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSMutableArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSData)contentURLData
{
  return self->_contentURLData;
}

- (void)setContentURLData:(id)a3
{
}

- (BOOL)mentionsCurrentUser
{
  return self->_mentionsCurrentUser;
}

- (BOOL)notifyRecipientAnyway
{
  return self->_notifyRecipientAnyway;
}

- (BOOL)replyToCurrentUser
{
  return self->_replyToCurrentUser;
}

- (int)recipientCount
{
  return self->_recipientCount;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (BOOL)systemImage
{
  return self->_systemImage;
}

- (int)capability
{
  return self->_capability;
}

- (int)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentURLData, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedObjectUriData, 0);
}

- (NSURL)contentURLLocalFileLocation
{
  v2 = [(BLTPBCommunicationContext *)self contentURLData];
  unint64_t v3 = objc_msgSend(v2, "blt_sha256String");
  id v4 = objc_msgSend(v3, "blt_filenameSafe");

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = objc_msgSend(v5, "blt_contactImagesDirectory");

    if (v6)
    {
      id v7 = [v6 URLByAppendingPathComponent:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSURL *)v7;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBCommunicationContext writeTo:]", "BLTPBCommunicationContext.m", 403, "nil != self->_bundleIdentifier");
}

@end