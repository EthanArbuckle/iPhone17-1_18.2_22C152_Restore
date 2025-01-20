@interface BMPBCommunicationSafetyResultEvent
+ (Class)contactHandlesType;
- (BMPBCommunicationSafetyResultEvent)initWithData:(id)a3 skipImage:(BOOL)a4;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasChildId;
- (BOOL)hasCommunicationSafetyResultContentType;
- (BOOL)hasCommunicationSafetyResultEventDirection;
- (BOOL)hasCommunicationSafetyResultEventType;
- (BOOL)hasContentId;
- (BOOL)hasContentURL;
- (BOOL)hasConversationId;
- (BOOL)hasConversationURL;
- (BOOL)hasDeviceId;
- (BOOL)hasImageData;
- (BOOL)hasSenderHandle;
- (BOOL)hasSourceBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (NSMutableArray)contactHandles;
- (NSString)childId;
- (NSString)contentId;
- (NSString)contentURL;
- (NSString)conversationId;
- (NSString)conversationURL;
- (NSString)deviceId;
- (NSString)senderHandle;
- (NSString)sourceBundleId;
- (double)absoluteTimestamp;
- (id)communicationSafetyResultContentTypeAsString:(int)a3;
- (id)communicationSafetyResultEventDirectionAsString:(int)a3;
- (id)communicationSafetyResultEventTypeAsString:(int)a3;
- (id)contactHandlesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCommunicationSafetyResultContentType:(id)a3;
- (int)StringAsCommunicationSafetyResultEventDirection:(id)a3;
- (int)StringAsCommunicationSafetyResultEventType:(id)a3;
- (int)communicationSafetyResultContentType;
- (int)communicationSafetyResultEventDirection;
- (int)communicationSafetyResultEventType;
- (unint64_t)contactHandlesCount;
- (unint64_t)hash;
- (void)addContactHandles:(id)a3;
- (void)clearContactHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setChildId:(id)a3;
- (void)setCommunicationSafetyResultContentType:(int)a3;
- (void)setCommunicationSafetyResultEventDirection:(int)a3;
- (void)setCommunicationSafetyResultEventType:(int)a3;
- (void)setContactHandles:(id)a3;
- (void)setContentId:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setConversationURL:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasCommunicationSafetyResultContentType:(BOOL)a3;
- (void)setHasCommunicationSafetyResultEventDirection:(BOOL)a3;
- (void)setHasCommunicationSafetyResultEventType:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setSenderHandle:(id)a3;
- (void)setSourceBundleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBCommunicationSafetyResultEvent

- (BMPBCommunicationSafetyResultEvent)initWithData:(id)a3 skipImage:(BOOL)a4
{
  self->_skipImage = a4;
  v5.receiver = self;
  v5.super_class = (Class)BMPBCommunicationSafetyResultEvent;
  return [(BMPBCommunicationSafetyResultEvent *)&v5 initWithData:a3];
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasChildId
{
  return self->_childId != 0;
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

- (int)communicationSafetyResultEventDirection
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_communicationSafetyResultEventDirection;
  }
  else {
    return 0;
  }
}

- (void)setCommunicationSafetyResultEventDirection:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_communicationSafetyResultEventDirection = a3;
}

- (void)setHasCommunicationSafetyResultEventDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommunicationSafetyResultEventDirection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)communicationSafetyResultEventDirectionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D84C0[a3];
  }

  return v3;
}

- (int)StringAsCommunicationSafetyResultEventDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Sent"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Received"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UnknownOrNotApplicable"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)communicationSafetyResultEventType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_communicationSafetyResultEventType;
  }
  else {
    return 0;
  }
}

- (void)setCommunicationSafetyResultEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_communicationSafetyResultEventType = a3;
}

- (void)setHasCommunicationSafetyResultEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCommunicationSafetyResultEventType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)communicationSafetyResultEventTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D84D8[a3];
  }

  return v3;
}

- (int)StringAsCommunicationSafetyResultEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Sensitive"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NonSensitive"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Deleted"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ConversationDeleted"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)communicationSafetyResultContentType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_communicationSafetyResultContentType;
  }
  else {
    return 0;
  }
}

- (void)setCommunicationSafetyResultContentType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_communicationSafetyResultContentType = a3;
}

- (void)setHasCommunicationSafetyResultContentType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommunicationSafetyResultContentType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)communicationSafetyResultContentTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D84F8[a3];
  }

  return v3;
}

- (int)StringAsCommunicationSafetyResultContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Photo"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Message"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearContactHandles
{
}

- (void)addContactHandles:(id)a3
{
  id v4 = a3;
  contactHandles = self->_contactHandles;
  id v8 = v4;
  if (!contactHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contactHandles;
    self->_contactHandles = v6;

    id v4 = v8;
    contactHandles = self->_contactHandles;
  }
  [(NSMutableArray *)contactHandles addObject:v4];
}

- (unint64_t)contactHandlesCount
{
  return [(NSMutableArray *)self->_contactHandles count];
}

- (id)contactHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contactHandles objectAtIndex:a3];
}

+ (Class)contactHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasSenderHandle
{
  return self->_senderHandle != 0;
}

- (BOOL)hasContentURL
{
  return self->_contentURL != 0;
}

- (BOOL)hasConversationURL
{
  return self->_conversationURL != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBCommunicationSafetyResultEvent;
  id v4 = [(BMPBCommunicationSafetyResultEvent *)&v8 description];
  objc_super v5 = [(BMPBCommunicationSafetyResultEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  childId = self->_childId;
  if (childId) {
    [v3 setObject:childId forKey:@"childId"];
  }
  deviceId = self->_deviceId;
  if (deviceId) {
    [v3 setObject:deviceId forKey:@"deviceId"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t communicationSafetyResultEventDirection = self->_communicationSafetyResultEventDirection;
    if (communicationSafetyResultEventDirection >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_communicationSafetyResultEventDirection);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55D84C0[communicationSafetyResultEventDirection];
    }
    [v3 setObject:v9 forKey:@"communicationSafetyResultEventDirection"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  uint64_t communicationSafetyResultEventType = self->_communicationSafetyResultEventType;
  if (communicationSafetyResultEventType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_communicationSafetyResultEventType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E55D84D8[communicationSafetyResultEventType];
  }
  [v3 setObject:v11 forKey:@"communicationSafetyResultEventType"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_19:
    uint64_t communicationSafetyResultContentType = self->_communicationSafetyResultContentType;
    if (communicationSafetyResultContentType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_communicationSafetyResultContentType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E55D84F8[communicationSafetyResultContentType];
    }
    [v3 setObject:v13 forKey:@"communicationSafetyResultContentType"];
  }
LABEL_23:
  contactHandles = self->_contactHandles;
  if (contactHandles) {
    [v3 setObject:contactHandles forKey:@"contactHandles"];
  }
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"contentId"];
  }
  conversationId = self->_conversationId;
  if (conversationId) {
    [v3 setObject:conversationId forKey:@"conversationId"];
  }
  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId) {
    [v3 setObject:sourceBundleId forKey:@"sourceBundleId"];
  }
  senderHandle = self->_senderHandle;
  if (senderHandle) {
    [v3 setObject:senderHandle forKey:@"senderHandle"];
  }
  contentURL = self->_contentURL;
  if (contentURL) {
    [v3 setObject:contentURL forKey:@"contentURL"];
  }
  conversationURL = self->_conversationURL;
  if (conversationURL) {
    [v3 setObject:conversationURL forKey:@"conversationURL"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBCommunicationSafetyResultEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_childId) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_contactHandles;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_contentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
  if (self->_sourceBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_senderHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationURL) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  long long v11 = v4;
  if (self->_childId)
  {
    objc_msgSend(v4, "setChildId:");
    id v4 = v11;
  }
  if (self->_deviceId)
  {
    objc_msgSend(v11, "setDeviceId:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_33:
    *((_DWORD *)v4 + 8) = self->_communicationSafetyResultEventType;
    *((unsigned char *)v4 + 112) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *((_DWORD *)v4 + 7) = self->_communicationSafetyResultEventDirection;
  *((unsigned char *)v4 + 112) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_33;
  }
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 6) = self->_communicationSafetyResultContentType;
    *((unsigned char *)v4 + 112) |= 2u;
  }
LABEL_11:
  if ([(BMPBCommunicationSafetyResultEvent *)self contactHandlesCount])
  {
    [v11 clearContactHandles];
    unint64_t v6 = [(BMPBCommunicationSafetyResultEvent *)self contactHandlesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(BMPBCommunicationSafetyResultEvent *)self contactHandlesAtIndex:i];
        [v11 addContactHandles:v9];
      }
    }
  }
  if (self->_contentId) {
    objc_msgSend(v11, "setContentId:");
  }
  v10 = v11;
  if (self->_conversationId)
  {
    objc_msgSend(v11, "setConversationId:");
    v10 = v11;
  }
  if (self->_imageData)
  {
    objc_msgSend(v11, "setImageData:");
    v10 = v11;
  }
  if (self->_sourceBundleId)
  {
    objc_msgSend(v11, "setSourceBundleId:");
    v10 = v11;
  }
  if (self->_senderHandle)
  {
    objc_msgSend(v11, "setSenderHandle:");
    v10 = v11;
  }
  if (self->_contentURL)
  {
    objc_msgSend(v11, "setContentURL:");
    v10 = v11;
  }
  if (self->_conversationURL)
  {
    objc_msgSend(v11, "setConversationURL:");
    v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 112) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_childId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_deviceId copyWithZone:a3];
  v10 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v9;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_communicationSafetyResultEventDirection;
    *(unsigned char *)(v6 + 112) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 32) = self->_communicationSafetyResultEventType;
  *(unsigned char *)(v6 + 112) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_communicationSafetyResultContentType;
    *(unsigned char *)(v6 + 112) |= 2u;
  }
LABEL_7:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v12 = self->_contactHandles;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "copyWithZone:", a3, (void)v33);
        [(id)v6 addContactHandles:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_contentId copyWithZone:a3];
  v19 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v18;

  uint64_t v20 = [(NSString *)self->_conversationId copyWithZone:a3];
  v21 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v20;

  uint64_t v22 = [(NSData *)self->_imageData copyWithZone:a3];
  v23 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v22;

  uint64_t v24 = [(NSString *)self->_sourceBundleId copyWithZone:a3];
  v25 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v24;

  uint64_t v26 = [(NSString *)self->_senderHandle copyWithZone:a3];
  v27 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v26;

  uint64_t v28 = [(NSString *)self->_contentURL copyWithZone:a3];
  v29 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v28;

  uint64_t v30 = [(NSString *)self->_conversationURL copyWithZone:a3];
  v31 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v30;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
LABEL_42:
    char v15 = 0;
    goto LABEL_43;
  }
  childId = self->_childId;
  if ((unint64_t)childId | *((void *)v4 + 2) && !-[NSString isEqual:](childId, "isEqual:")) {
    goto LABEL_42;
  }
  deviceId = self->_deviceId;
  if ((unint64_t)deviceId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](deviceId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 4) == 0 || self->_communicationSafetyResultEventDirection != *((_DWORD *)v4 + 7)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 8) == 0 || self->_communicationSafetyResultEventType != *((_DWORD *)v4 + 8)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_communicationSafetyResultContentType != *((_DWORD *)v4 + 6)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_42;
  }
  contactHandles = self->_contactHandles;
  if ((unint64_t)contactHandles | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](contactHandles, "isEqual:"))
  {
    goto LABEL_42;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:")) {
      goto LABEL_42;
    }
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceBundleId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  senderHandle = self->_senderHandle;
  if ((unint64_t)senderHandle | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](senderHandle, "isEqual:")) {
      goto LABEL_42;
    }
  }
  contentURL = self->_contentURL;
  if ((unint64_t)contentURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](contentURL, "isEqual:")) {
      goto LABEL_42;
    }
  }
  conversationURL = self->_conversationURL;
  if ((unint64_t)conversationURL | *((void *)v4 + 9)) {
    char v15 = -[NSString isEqual:](conversationURL, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_43:

  return v15;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    double v8 = fmod(v6, 1.84467441e19);
    unint64_t v9 = 2654435761u * (unint64_t)v8;
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        unint64_t v3 = v9 + (unint64_t)v7;
      }
      else {
        unint64_t v3 = 2654435761u * (unint64_t)v8;
      }
    }
    else
    {
      unint64_t v3 = v9 - (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_childId hash];
  NSUInteger v11 = [(NSString *)self->_deviceId hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = 2654435761 * self->_communicationSafetyResultEventDirection;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_communicationSafetyResultEventType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_communicationSafetyResultContentType;
LABEL_17:
  NSUInteger v15 = v10 ^ v3 ^ v11 ^ v12;
  uint64_t v16 = v13 ^ v14 ^ [(NSMutableArray *)self->_contactHandles hash];
  NSUInteger v17 = v15 ^ v16 ^ [(NSString *)self->_contentId hash];
  NSUInteger v18 = [(NSString *)self->_conversationId hash];
  uint64_t v19 = v18 ^ [(NSData *)self->_imageData hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_sourceBundleId hash];
  NSUInteger v21 = v17 ^ v20 ^ [(NSString *)self->_senderHandle hash];
  NSUInteger v22 = [(NSString *)self->_contentURL hash];
  return v21 ^ v22 ^ [(NSString *)self->_conversationURL hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  double v5 = v4;
  if ((_BYTE)v4[14])
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[BMPBCommunicationSafetyResultEvent setChildId:](self, "setChildId:");
  }
  if (*((void *)v5 + 10)) {
    -[BMPBCommunicationSafetyResultEvent setDeviceId:](self, "setDeviceId:");
  }
  char v6 = *((unsigned char *)v5 + 112);
  if ((v6 & 4) != 0)
  {
    self->_uint64_t communicationSafetyResultEventDirection = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v5 + 112);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if (((_BYTE)v5[14] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_uint64_t communicationSafetyResultEventType = *((_DWORD *)v5 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if (((_BYTE)v5[14] & 2) != 0)
  {
LABEL_10:
    self->_uint64_t communicationSafetyResultContentType = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[BMPBCommunicationSafetyResultEvent addContactHandles:](self, "addContactHandles:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v5 + 6)) {
    -[BMPBCommunicationSafetyResultEvent setContentId:](self, "setContentId:");
  }
  if (*((void *)v5 + 8)) {
    -[BMPBCommunicationSafetyResultEvent setConversationId:](self, "setConversationId:");
  }
  if (*((void *)v5 + 11)) {
    -[BMPBCommunicationSafetyResultEvent setImageData:](self, "setImageData:");
  }
  if (*((void *)v5 + 13)) {
    -[BMPBCommunicationSafetyResultEvent setSourceBundleId:](self, "setSourceBundleId:");
  }
  if (*((void *)v5 + 12)) {
    -[BMPBCommunicationSafetyResultEvent setSenderHandle:](self, "setSenderHandle:");
  }
  if (*((void *)v5 + 7)) {
    -[BMPBCommunicationSafetyResultEvent setContentURL:](self, "setContentURL:");
  }
  if (*((void *)v5 + 9)) {
    -[BMPBCommunicationSafetyResultEvent setConversationURL:](self, "setConversationURL:");
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)childId
{
  return self->_childId;
}

- (void)setChildId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSMutableArray)contactHandles
{
  return self->_contactHandles;
}

- (void)setContactHandles:(id)a3
{
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSString)conversationURL
{
  return self->_conversationURL;
}

- (void)setConversationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_conversationURL, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);

  objc_storeStrong((id *)&self->_childId, 0);
}

@end