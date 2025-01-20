@interface _INPBSendMessageIntent
+ (BOOL)supportsSecureCoding;
+ (Class)attachmentsType;
+ (Class)recipientType;
- (BOOL)hasAlternativeConversationIdentifier;
- (BOOL)hasContent;
- (BOOL)hasConversationIdentifier;
- (BOOL)hasEffect;
- (BOOL)hasGroupName;
- (BOOL)hasIntentMetadata;
- (BOOL)hasNotificationThreadIdentifier;
- (BOOL)hasOutgoingMessageType;
- (BOOL)hasSender;
- (BOOL)hasServiceName;
- (BOOL)hasSpeakableGroupName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)attachments;
- (NSArray)recipients;
- (NSString)alternativeConversationIdentifier;
- (NSString)conversationIdentifier;
- (NSString)notificationThreadIdentifier;
- (NSString)serviceName;
- (_INPBContact)sender;
- (_INPBDataString)speakableGroupName;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSendMessageIntent)initWithCoder:(id)a3;
- (_INPBString)content;
- (_INPBString)groupName;
- (id)attachmentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)effectAsString:(int)a3;
- (id)outgoingMessageTypeAsString:(int)a3;
- (id)recipientAtIndex:(unint64_t)a3;
- (int)StringAsEffect:(id)a3;
- (int)StringAsOutgoingMessageType:(id)a3;
- (int)effect;
- (int)outgoingMessageType;
- (unint64_t)attachmentsCount;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)addAttachments:(id)a3;
- (void)addRecipient:(id)a3;
- (void)clearAttachments;
- (void)clearRecipients;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeConversationIdentifier:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setContent:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setEffect:(int)a3;
- (void)setGroupName:(id)a3;
- (void)setHasEffect:(BOOL)a3;
- (void)setHasOutgoingMessageType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setNotificationThreadIdentifier:(id)a3;
- (void)setOutgoingMessageType:(int)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSpeakableGroupName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSendMessageIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableGroupName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_notificationThreadIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_alternativeConversationIdentifier, 0);
}

- (_INPBDataString)speakableGroupName
{
  return self->_speakableGroupName;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (_INPBContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (int)outgoingMessageType
{
  return self->_outgoingMessageType;
}

- (NSString)notificationThreadIdentifier
{
  return self->_notificationThreadIdentifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBString)groupName
{
  return self->_groupName;
}

- (int)effect
{
  return self->_effect;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (_INPBString)content
{
  return self->_content;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSString)alternativeConversationIdentifier
{
  return self->_alternativeConversationIdentifier;
}

- (id)dictionaryRepresentation
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_alternativeConversationIdentifier)
  {
    v4 = [(_INPBSendMessageIntent *)self alternativeConversationIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"alternativeConversationIdentifier"];
  }
  if ([(NSArray *)self->_attachments count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v7 = self->_attachments;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v46 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"attachments"];
  }
  v13 = [(_INPBSendMessageIntent *)self content];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"content"];

  if (self->_conversationIdentifier)
  {
    v15 = [(_INPBSendMessageIntent *)self conversationIdentifier];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"conversationIdentifier"];
  }
  if ([(_INPBSendMessageIntent *)self hasEffect])
  {
    uint64_t v17 = [(_INPBSendMessageIntent *)self effect];
    if ((v17 - 1) >= 0xD)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E5519E60[(v17 - 1)];
    }
    [v3 setObject:v18 forKeyedSubscript:@"effect"];
  }
  v19 = [(_INPBSendMessageIntent *)self groupName];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"groupName"];

  v21 = [(_INPBSendMessageIntent *)self intentMetadata];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"intentMetadata"];

  if (self->_notificationThreadIdentifier)
  {
    v23 = [(_INPBSendMessageIntent *)self notificationThreadIdentifier];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"notificationThreadIdentifier"];
  }
  if ([(_INPBSendMessageIntent *)self hasOutgoingMessageType])
  {
    uint64_t v25 = [(_INPBSendMessageIntent *)self outgoingMessageType];
    if (v25 == 1)
    {
      v26 = @"OUTGOING_MESSAGE_TEXT";
    }
    else if (v25 == 2)
    {
      v26 = @"OUTGOING_MESSAGE_AUDIO";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v26 forKeyedSubscript:@"outgoingMessageType"];
  }
  if ([(NSArray *)self->_recipients count])
  {
    v27 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v28 = self->_recipients;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v41 + 1) + 8 * j) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKeyedSubscript:@"recipient"];
  }
  v34 = [(_INPBSendMessageIntent *)self sender];
  v35 = [v34 dictionaryRepresentation];
  [v3 setObject:v35 forKeyedSubscript:@"sender"];

  if (self->_serviceName)
  {
    v36 = [(_INPBSendMessageIntent *)self serviceName];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"serviceName"];
  }
  v38 = [(_INPBSendMessageIntent *)self speakableGroupName];
  v39 = [v38 dictionaryRepresentation];
  [v3 setObject:v39 forKeyedSubscript:@"speakableGroupName"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alternativeConversationIdentifier hash];
  uint64_t v4 = [(NSArray *)self->_attachments hash];
  unint64_t v5 = [(_INPBString *)self->_content hash];
  NSUInteger v6 = [(NSString *)self->_conversationIdentifier hash];
  if ([(_INPBSendMessageIntent *)self hasEffect]) {
    uint64_t v7 = 2654435761 * self->_effect;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(_INPBString *)self->_groupName hash];
  unint64_t v9 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  NSUInteger v10 = [(NSString *)self->_notificationThreadIdentifier hash];
  if ([(_INPBSendMessageIntent *)self hasOutgoingMessageType]) {
    uint64_t v11 = 2654435761 * self->_outgoingMessageType;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  uint64_t v13 = v10 ^ v11 ^ [(NSArray *)self->_recipients hash];
  unint64_t v14 = v12 ^ v13 ^ [(_INPBContact *)self->_sender hash];
  NSUInteger v15 = [(NSString *)self->_serviceName hash];
  return v14 ^ v15 ^ [(_INPBDataString *)self->_speakableGroupName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self alternativeConversationIdentifier];
  NSUInteger v6 = [v4 alternativeConversationIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v7 = [(_INPBSendMessageIntent *)self alternativeConversationIdentifier];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBSendMessageIntent *)self alternativeConversationIdentifier];
    NSUInteger v10 = [v4 alternativeConversationIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self attachments];
  NSUInteger v6 = [v4 attachments];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v12 = [(_INPBSendMessageIntent *)self attachments];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    unint64_t v14 = [(_INPBSendMessageIntent *)self attachments];
    NSUInteger v15 = [v4 attachments];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self content];
  NSUInteger v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v17 = [(_INPBSendMessageIntent *)self content];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSendMessageIntent *)self content];
    v20 = [v4 content];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self conversationIdentifier];
  NSUInteger v6 = [v4 conversationIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v22 = [(_INPBSendMessageIntent *)self conversationIdentifier];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBSendMessageIntent *)self conversationIdentifier];
    uint64_t v25 = [v4 conversationIdentifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  int v27 = [(_INPBSendMessageIntent *)self hasEffect];
  if (v27 != [v4 hasEffect]) {
    goto LABEL_65;
  }
  if ([(_INPBSendMessageIntent *)self hasEffect])
  {
    if ([v4 hasEffect])
    {
      int effect = self->_effect;
      if (effect != [v4 effect]) {
        goto LABEL_65;
      }
    }
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self groupName];
  NSUInteger v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v29 = [(_INPBSendMessageIntent *)self groupName];
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = [(_INPBSendMessageIntent *)self groupName];
    v32 = [v4 groupName];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self intentMetadata];
  NSUInteger v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v34 = [(_INPBSendMessageIntent *)self intentMetadata];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_INPBSendMessageIntent *)self intentMetadata];
    v37 = [v4 intentMetadata];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self notificationThreadIdentifier];
  NSUInteger v6 = [v4 notificationThreadIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v39 = [(_INPBSendMessageIntent *)self notificationThreadIdentifier];
  if (v39)
  {
    v40 = (void *)v39;
    long long v41 = [(_INPBSendMessageIntent *)self notificationThreadIdentifier];
    long long v42 = [v4 notificationThreadIdentifier];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  int v44 = [(_INPBSendMessageIntent *)self hasOutgoingMessageType];
  if (v44 != [v4 hasOutgoingMessageType]) {
    goto LABEL_65;
  }
  if ([(_INPBSendMessageIntent *)self hasOutgoingMessageType])
  {
    if ([v4 hasOutgoingMessageType])
    {
      int outgoingMessageType = self->_outgoingMessageType;
      if (outgoingMessageType != [v4 outgoingMessageType]) {
        goto LABEL_65;
      }
    }
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self recipients];
  NSUInteger v6 = [v4 recipients];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v46 = [(_INPBSendMessageIntent *)self recipients];
  if (v46)
  {
    long long v47 = (void *)v46;
    long long v48 = [(_INPBSendMessageIntent *)self recipients];
    v49 = [v4 recipients];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self sender];
  NSUInteger v6 = [v4 sender];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v51 = [(_INPBSendMessageIntent *)self sender];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_INPBSendMessageIntent *)self sender];
    v54 = [v4 sender];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self serviceName];
  NSUInteger v6 = [v4 serviceName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v56 = [(_INPBSendMessageIntent *)self serviceName];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(_INPBSendMessageIntent *)self serviceName];
    v59 = [v4 serviceName];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendMessageIntent *)self speakableGroupName];
  NSUInteger v6 = [v4 speakableGroupName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v61 = [(_INPBSendMessageIntent *)self speakableGroupName];
    if (!v61)
    {

LABEL_68:
      BOOL v66 = 1;
      goto LABEL_66;
    }
    v62 = (void *)v61;
    v63 = [(_INPBSendMessageIntent *)self speakableGroupName];
    v64 = [v4 speakableGroupName];
    char v65 = [v63 isEqual:v64];

    if (v65) {
      goto LABEL_68;
    }
  }
  else
  {
LABEL_64:
  }
LABEL_65:
  BOOL v66 = 0;
LABEL_66:

  return v66;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSendMessageIntent allocWithZone:](_INPBSendMessageIntent, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSString *)self->_alternativeConversationIdentifier copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setAlternativeConversationIdentifier:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_attachments copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setAttachments:v7];

  id v8 = [(_INPBString *)self->_content copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setContent:v8];

  unint64_t v9 = (void *)[(NSString *)self->_conversationIdentifier copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setConversationIdentifier:v9];

  if ([(_INPBSendMessageIntent *)self hasEffect]) {
    [(_INPBSendMessageIntent *)v5 setEffect:[(_INPBSendMessageIntent *)self effect]];
  }
  id v10 = [(_INPBString *)self->_groupName copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setGroupName:v10];

  id v11 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setIntentMetadata:v11];

  uint64_t v12 = (void *)[(NSString *)self->_notificationThreadIdentifier copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setNotificationThreadIdentifier:v12];

  if ([(_INPBSendMessageIntent *)self hasOutgoingMessageType]) {
    [(_INPBSendMessageIntent *)v5 setOutgoingMessageType:[(_INPBSendMessageIntent *)self outgoingMessageType]];
  }
  uint64_t v13 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setRecipients:v13];

  id v14 = [(_INPBContact *)self->_sender copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setSender:v14];

  NSUInteger v15 = (void *)[(NSString *)self->_serviceName copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setServiceName:v15];

  id v16 = [(_INPBDataString *)self->_speakableGroupName copyWithZone:a3];
  [(_INPBSendMessageIntent *)v5 setSpeakableGroupName:v16];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSendMessageIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSendMessageIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSendMessageIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSendMessageIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSendMessageIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBSendMessageIntent *)self alternativeConversationIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = self->_attachments;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  id v11 = [(_INPBSendMessageIntent *)self content];

  if (v11)
  {
    uint64_t v12 = [(_INPBSendMessageIntent *)self content];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v13 = [(_INPBSendMessageIntent *)self conversationIdentifier];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBSendMessageIntent *)self hasEffect]) {
    PBDataWriterWriteInt32Field();
  }
  id v14 = [(_INPBSendMessageIntent *)self groupName];

  if (v14)
  {
    NSUInteger v15 = [(_INPBSendMessageIntent *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  id v16 = [(_INPBSendMessageIntent *)self intentMetadata];

  if (v16)
  {
    uint64_t v17 = [(_INPBSendMessageIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(_INPBSendMessageIntent *)self notificationThreadIdentifier];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBSendMessageIntent *)self hasOutgoingMessageType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v19 = self->_recipients;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  v24 = [(_INPBSendMessageIntent *)self sender];

  if (v24)
  {
    uint64_t v25 = [(_INPBSendMessageIntent *)self sender];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(_INPBSendMessageIntent *)self serviceName];

  if (v26) {
    PBDataWriterWriteStringField();
  }
  int v27 = [(_INPBSendMessageIntent *)self speakableGroupName];

  if (v27)
  {
    v28 = [(_INPBSendMessageIntent *)self speakableGroupName];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendMessageIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSpeakableGroupName
{
  return self->_speakableGroupName != 0;
}

- (void)setSpeakableGroupName:(id)a3
{
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setServiceName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  serviceName = self->_serviceName;
  self->_serviceName = v4;

  MEMORY[0x1F41817F8](v4, serviceName);
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)setSender:(id)a3
{
}

- (id)recipientAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_recipients objectAtIndexedSubscript:a3];
}

- (unint64_t)recipientsCount
{
  return [(NSArray *)self->_recipients count];
}

- (void)addRecipient:(id)a3
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

- (int)StringAsOutgoingMessageType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"OUTGOING_MESSAGE_TEXT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"OUTGOING_MESSAGE_AUDIO"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)outgoingMessageTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"OUTGOING_MESSAGE_TEXT";
  }
  else if (a3 == 2)
  {
    int v4 = @"OUTGOING_MESSAGE_AUDIO";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasOutgoingMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOutgoingMessageType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOutgoingMessageType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int outgoingMessageType = a3;
  }
}

- (BOOL)hasNotificationThreadIdentifier
{
  return self->_notificationThreadIdentifier != 0;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  notificationThreadIdentifier = self->_notificationThreadIdentifier;
  self->_notificationThreadIdentifier = v4;

  MEMORY[0x1F41817F8](v4, notificationThreadIdentifier);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (int)StringAsEffect:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HAPPY_BIRTHDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONFETTI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LASERS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FIREWORKS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHOOTING_STAR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"INVISBLE_INK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GENTLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LOUD"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"IMPACT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPARKLES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HEART"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ECHO"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)effectAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5519E60[a3 - 1];
  }

  return v3;
}

- (void)setHasEffect:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEffect
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEffect:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int effect = a3;
  }
}

- (BOOL)hasConversationIdentifier
{
  return self->_conversationIdentifier != 0;
}

- (void)setConversationIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  conversationIdentifier = self->_conversationIdentifier;
  self->_conversationIdentifier = v4;

  MEMORY[0x1F41817F8](v4, conversationIdentifier);
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContent:(id)a3
{
}

- (id)attachmentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_attachments objectAtIndexedSubscript:a3];
}

- (unint64_t)attachmentsCount
{
  return [(NSArray *)self->_attachments count];
}

- (void)addAttachments:(id)a3
{
  id v4 = a3;
  attachments = self->_attachments;
  id v8 = v4;
  if (!attachments)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_attachments;
    self->_attachments = v6;

    id v4 = v8;
    attachments = self->_attachments;
  }
  [(NSArray *)attachments addObject:v4];
}

- (void)clearAttachments
{
}

- (void)setAttachments:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  attachments = self->_attachments;
  self->_attachments = v4;

  MEMORY[0x1F41817F8](v4, attachments);
}

- (BOOL)hasAlternativeConversationIdentifier
{
  return self->_alternativeConversationIdentifier != 0;
}

- (void)setAlternativeConversationIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  alternativeConversationIdentifier = self->_alternativeConversationIdentifier;
  self->_alternativeConversationIdentifier = v4;

  MEMORY[0x1F41817F8](v4, alternativeConversationIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)recipientType
{
  return (Class)objc_opt_class();
}

+ (Class)attachmentsType
{
  return (Class)objc_opt_class();
}

@end