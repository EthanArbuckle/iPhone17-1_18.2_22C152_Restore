@interface INMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)location;
- (INCurrencyAmount)paymentAmount;
- (INFile)audioMessageFile;
- (INImage)_keyImage;
- (INMessage)initWithCoder:(id)a3;
- (INMessage)initWithIdentifier:(NSString *)identifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName attachmentFiles:(NSArray *)attachmentFiles;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName audioMessageFile:(INFile *)audioMessageFile;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName serviceName:(NSString *)serviceName linkMetadata:(INMessageLinkMetadata *)linkMetadata;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName serviceName:(NSString *)serviceName messageType:(INMessageType)messageType numberOfAttachments:(NSNumber *)numberOfAttachments;
- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients messageType:(INMessageType)messageType;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 dateMessageWasLastRead:(id)a9 numberOfAttachments:(id)a10 messageType:(int64_t)a11 messageEffectType:(int64_t)a12;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 serviceName:(id)a13 reaction:(id)a14;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 attachmentFiles:(id)a16 location:(id)a17 linkMetadata:(id)a18 reaction:(id)a19 sticker:(id)a20;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 audioMessageFile:(id)a16;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 reaction:(id)a16 attachmentFiles:(id)a17 location:(id)a18 linkMetadata:(id)a19;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 location:(id)a11;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 reaction:(id)a13;
- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 sticker:(id)a13 reaction:(id)a14;
- (INMessage)referencedMessage;
- (INMessageLinkMetadata)linkMetadata;
- (INMessageReaction)reaction;
- (INMessageType)messageType;
- (INPerson)sender;
- (INSpeakableString)groupName;
- (INSticker)sticker;
- (NSArray)attachmentFiles;
- (NSArray)recipients;
- (NSDate)dateMessageWasLastRead;
- (NSDate)dateSent;
- (NSNumber)numberOfAttachments;
- (NSString)content;
- (NSString)conversationIdentifier;
- (NSString)description;
- (NSString)fileExtension;
- (NSString)identifier;
- (NSString)locationName;
- (NSString)serviceName;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_redactedDictionaryRepresentation;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)messageEffectType;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFileExtension:(id)a3;
- (void)setLinkMetadata:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setPaymentAmount:(id)a3;
- (void)setReaction:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setSticker:(id)a3;
@end

@implementation INMessage

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INMessage *)self sender];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(INMessage *)self recipients];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_intents_updateContainerWithCache:", v4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INMessage *)self sender];
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "_intents_cacheableObjects");
    if ([v6 count]) {
      [v3 unionSet:v6];
    }
  }
  uint64_t v7 = [(INMessage *)self recipients];
  if ([v7 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "_intents_cacheableObjects", (void)v17);
          if ([v13 count]) {
            [v3 unionSet:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  if (objc_msgSend(v3, "count", (void)v17)) {
    long long v14 = v3;
  }
  else {
    long long v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_referencedMessage, 0);
  objc_storeStrong((id *)&self->_dateMessageWasLastRead, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_audioMessageFile, 0);
  objc_storeStrong((id *)&self->_numberOfAttachments, 0);
  objc_storeStrong((id *)&self->_attachmentFiles, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLocation:(id)a3
{
}

- (CLPlacemark)location
{
  return self->_location;
}

- (void)setFileExtension:(id)a3
{
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setLocationName:(id)a3
{
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setPaymentAmount:(id)a3
{
}

- (INCurrencyAmount)paymentAmount
{
  return self->_paymentAmount;
}

- (INMessage)referencedMessage
{
  return self->_referencedMessage;
}

- (int64_t)messageEffectType
{
  return self->_messageEffectType;
}

- (NSDate)dateMessageWasLastRead
{
  return self->_dateMessageWasLastRead;
}

- (void)setReaction:(id)a3
{
}

- (INMessageReaction)reaction
{
  return self->_reaction;
}

- (void)setSticker:(id)a3
{
}

- (INSticker)sticker
{
  return self->_sticker;
}

- (void)setLinkMetadata:(id)a3
{
}

- (INMessageLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (INFile)audioMessageFile
{
  return self->_audioMessageFile;
}

- (NSNumber)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (NSArray)attachmentFiles
{
  return self->_attachmentFiles;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (INMessageType)messageType
{
  return self->_messageType;
}

- (INSpeakableString)groupName
{
  return self->_groupName;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setSender:(id)a3
{
}

- (INPerson)sender
{
  return self->_sender;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_dictionaryRepresentation
{
  v27[8] = *MEMORY[0x1E4F143B8];
  identifier = self->_identifier;
  uint64_t v3 = (uint64_t)identifier;
  v26[0] = @"identifier";
  if (!identifier)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[0] = v3;
  v26[1] = @"conversationIdentifier";
  uint64_t conversationIdentifier = (uint64_t)self->_conversationIdentifier;
  uint64_t v23 = conversationIdentifier;
  if (!conversationIdentifier)
  {
    uint64_t conversationIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = (void *)conversationIdentifier;
  v27[1] = conversationIdentifier;
  v26[2] = @"content";
  content = self->_content;
  uint64_t v6 = (uint64_t)content;
  if (!content)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v6;
  v27[2] = v6;
  v26[3] = @"dateSent";
  dateSent = self->_dateSent;
  uint64_t v8 = (uint64_t)dateSent;
  if (!dateSent)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  long long v20 = (void *)v8;
  v27[3] = v8;
  v26[4] = @"sender";
  sender = self->_sender;
  uint64_t v10 = (uint64_t)sender;
  if (!sender)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v19 = (void *)v10;
  v27[4] = v10;
  v26[5] = @"recipients";
  recipients = self->_recipients;
  uint64_t v12 = recipients;
  if (!recipients)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v12;
  v26[6] = @"groupName";
  groupName = self->_groupName;
  long long v14 = groupName;
  if (!groupName)
  {
    long long v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[6] = v14;
  v26[7] = @"linkMetadata";
  linkMetadata = self->_linkMetadata;
  uint64_t v16 = linkMetadata;
  if (!linkMetadata)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[7] = v16;
  long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];
  if (linkMetadata)
  {
    if (groupName) {
      goto LABEL_19;
    }
  }
  else
  {

    if (groupName)
    {
LABEL_19:
      if (recipients) {
        goto LABEL_20;
      }
LABEL_32:

      if (sender) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }

  if (!recipients) {
    goto LABEL_32;
  }
LABEL_20:
  if (sender) {
    goto LABEL_21;
  }
LABEL_33:

LABEL_21:
  if (dateSent)
  {
    if (content) {
      goto LABEL_23;
    }
  }
  else
  {

    if (content) {
      goto LABEL_23;
    }
  }

LABEL_23:
  if (!v23) {

  }
  if (!identifier) {

  }
  return v17;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMessage;
  uint64_t v6 = [(INMessage *)&v11 description];
  uint64_t v7 = [(INMessage *)self _redactedDictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INMessage *)self _dictionaryRepresentation];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"content"];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(INMessage *)self descriptionAtIndent:0];
}

- (INMessage)initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"conversationIdentifier"];
  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dateSent"];
  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  uint64_t v6 = [v4 setWithArray:v5];
  v27 = [v3 decodeObjectOfClasses:v6 forKey:@"recipients"];

  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dateMessageWasLastRead"];
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfAttachments"];
  uint64_t v7 = [v3 decodeIntegerForKey:@"messageType"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"messageEffectType"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"referencedMessage"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
  objc_super v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"audioMessageFile"];
  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attachmentFiles"];
  long long v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"reaction"];
  long long v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  id v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"linkMetadata"];

  if (v11)
  {
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
    uint64_t v20 = v8;
    long long v17 = (void *)v23;
    long long v18 = objc_retain(-[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v23, v31, v30, v29, v28, v27, v26, v25, v24, v7, v20, v9, v10, v13,
              v16,
              v14,
              v15));
  }
  else
  {
    uint64_t v21 = v8;
    long long v17 = (void *)v23;
    long long v18 = objc_retain(-[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v23, v31, v30, v29, v28, v27, v26, v25, v24, v7, v21, v9, v10, v13,
              v12,
              v14,
              v15));
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_conversationIdentifier forKey:@"conversationIdentifier"];
  [v5 encodeObject:self->_content forKey:@"content"];
  [v5 encodeObject:self->_dateSent forKey:@"dateSent"];
  [v5 encodeObject:self->_sender forKey:@"sender"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
  [v5 encodeObject:self->_groupName forKey:@"groupName"];
  [v5 encodeObject:self->_dateMessageWasLastRead forKey:@"dateMessageWasLastRead"];
  [v5 encodeObject:self->_numberOfAttachments forKey:@"numberOfAttachments"];
  [v5 encodeInteger:self->_messageType forKey:@"messageType"];
  [v5 encodeInteger:self->_messageEffectType forKey:@"messageEffectType"];
  [v5 encodeObject:self->_referencedMessage forKey:@"referencedMessage"];
  [v5 encodeObject:self->_serviceName forKey:@"serviceName"];
  [v5 encodeObject:self->_reaction forKey:@"reaction"];
  [v5 encodeObject:self->_attachmentFiles forKey:@"attachmentFiles"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_linkMetadata forKey:@"linkMetadata"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INMessage *)a3;
  if (v4 == self)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      if (identifier != v5->_identifier && !-[NSString isEqual:](identifier, "isEqual:")) {
        goto LABEL_38;
      }
      uint64_t conversationIdentifier = self->_conversationIdentifier;
      if (conversationIdentifier != v5->_conversationIdentifier
        && !-[NSString isEqual:](conversationIdentifier, "isEqual:"))
      {
        goto LABEL_38;
      }
      content = self->_content;
      if (content != v5->_content && !-[NSString isEqual:](content, "isEqual:")) {
        goto LABEL_38;
      }
      dateSent = self->_dateSent;
      if (dateSent != v5->_dateSent && !-[NSDate isEqual:](dateSent, "isEqual:")) {
        goto LABEL_38;
      }
      sender = self->_sender;
      if (sender != v5->_sender && !-[INPerson isEqual:](sender, "isEqual:")) {
        goto LABEL_38;
      }
      recipients = self->_recipients;
      if (recipients != v5->_recipients && !-[NSArray isEqual:](recipients, "isEqual:")) {
        goto LABEL_38;
      }
      groupName = self->_groupName;
      if (groupName != v5->_groupName && !-[INSpeakableString isEqual:](groupName, "isEqual:")) {
        goto LABEL_38;
      }
      dateMessageWasLastRead = self->_dateMessageWasLastRead;
      if (dateMessageWasLastRead != v5->_dateMessageWasLastRead
        && !-[NSDate isEqual:](dateMessageWasLastRead, "isEqual:"))
      {
        goto LABEL_38;
      }
      if (((numberOfAttachments = self->_numberOfAttachments, numberOfAttachments == v5->_numberOfAttachments)
         || -[NSNumber isEqual:](numberOfAttachments, "isEqual:"))
        && self->_messageType == v5->_messageType
        && self->_messageEffectType == v5->_messageEffectType
        && ((referencedMessage = self->_referencedMessage, referencedMessage == v5->_referencedMessage)
         || -[INMessage isEqual:](referencedMessage, "isEqual:"))
        && ((serviceName = self->_serviceName, serviceName == v5->_serviceName)
         || -[NSString isEqual:](serviceName, "isEqual:"))
        && ((reaction = self->_reaction, reaction == v5->_reaction)
         || -[INMessageReaction isEqual:](reaction, "isEqual:"))
        && ((attachmentFiles = self->_attachmentFiles, attachmentFiles == v5->_attachmentFiles)
         || -[NSArray isEqual:](attachmentFiles, "isEqual:"))
        && ((location = self->_location, location == v5->_location)
         || -[CLPlacemark isEqual:](location, "isEqual:"))
        && ((linkMetadata = self->_linkMetadata, linkMetadata == v5->_linkMetadata)
         || -[INMessageLinkMetadata isEqual:](linkMetadata, "isEqual:")))
      {
        BOOL v21 = 1;
      }
      else
      {
LABEL_38:
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_conversationIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_content hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_dateSent hash];
  unint64_t v7 = [(INPerson *)self->_sender hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_recipients hash];
  unint64_t v9 = v6 ^ v8 ^ [(INSpeakableString *)self->_groupName hash];
  uint64_t v10 = [(NSDate *)self->_dateMessageWasLastRead hash];
  uint64_t v11 = v10 ^ [(NSNumber *)self->_numberOfAttachments hash];
  uint64_t v12 = [NSNumber numberWithInteger:self->_messageType];
  uint64_t v13 = v9 ^ v11 ^ [v12 hash];
  long long v14 = [NSNumber numberWithInteger:self->_messageEffectType];
  uint64_t v15 = [v14 hash];
  unint64_t v16 = v15 ^ [(INMessage *)self->_referencedMessage hash];
  NSUInteger v17 = v13 ^ v16 ^ [(NSString *)self->_serviceName hash];
  uint64_t v18 = [(NSArray *)self->_attachmentFiles hash];
  unint64_t v19 = v18 ^ [(INMessageReaction *)self->_reaction hash];
  uint64_t v20 = v19 ^ [(CLPlacemark *)self->_location hash];
  unint64_t v21 = v17 ^ v20 ^ [(INMessageLinkMetadata *)self->_linkMetadata hash];

  return v21;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 sticker:(id)a13 reaction:(id)a14
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:", a3, a4, a5, a6, a7, a8, a9, 0, 0, a11, 0, a12, a10, 0, 0,
           0,
           a14,
           a13);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 reaction:(id)a13
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:", a3, a4, a5, a6, a7, a8, a9, 0, 0, a11, 0, a12, a10, 0, 0,
           0,
           a13,
           0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName serviceName:(NSString *)serviceName messageType:(INMessageType)messageType numberOfAttachments:(NSNumber *)numberOfAttachments
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", identifier, conversationIdentifier, content, dateSent, sender, recipients, groupName, 0, numberOfAttachments, messageType, 0, 0, serviceName, 0, 0,
           0,
           0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName serviceName:(NSString *)serviceName linkMetadata:(INMessageLinkMetadata *)linkMetadata
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", identifier, conversationIdentifier, content, dateSent, sender, recipients, groupName, 0, 0, 25, 0, 0, serviceName, 0, 0,
           0,
           linkMetadata);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 location:(id)a11
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", a3, a4, a5, a6, a7, a8, a9, 0, 0, 13, 0, 0, a10, 0, 0,
           a11,
           0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName attachmentFiles:(NSArray *)attachmentFiles
{
  v29 = NSNumber;
  uint64_t v18 = attachmentFiles;
  unint64_t v19 = serviceName;
  uint64_t v20 = groupName;
  unint64_t v21 = recipients;
  uint64_t v22 = sender;
  uint64_t v23 = dateSent;
  v24 = content;
  v25 = conversationIdentifier;
  v26 = identifier;
  v27 = objc_msgSend(v29, "numberWithUnsignedLong:", -[NSArray count](v18, "count"));
  v31 = -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v26, v25, v24, v23, v22, v21, v20, 0, v27, messageType, 0, 0, v19, 0, v18,
          0,
          0);

  return v31;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 serviceName:(id)a13 reaction:(id)a14
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11, 0, a12, a13, a14, 0,
           0,
           0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients
{
  return [(INMessage *)self initWithIdentifier:identifier conversationIdentifier:0 content:content dateSent:dateSent sender:sender recipients:recipients messageType:0];
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients messageType:(INMessageType)messageType
{
  return [(INMessage *)self initWithIdentifier:identifier conversationIdentifier:conversationIdentifier content:content dateSent:dateSent sender:sender recipients:recipients groupName:0 messageType:messageType];
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 dateMessageWasLastRead:(id)a9 numberOfAttachments:(id)a10 messageType:(int64_t)a11 messageEffectType:(int64_t)a12
{
  return [(INMessage *)self initWithIdentifier:a3 conversationIdentifier:a4 content:a5 dateSent:a6 sender:a7 recipients:a8 groupName:0 dateMessageWasLastRead:a9 numberOfAttachments:a10 messageType:a11 messageEffectType:a12];
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName audioMessageFile:(INFile *)audioMessageFile
{
  uint64_t v18 = identifier;
  unint64_t v19 = conversationIdentifier;
  uint64_t v20 = v18;
  unint64_t v21 = v19;
  uint64_t v22 = content;
  uint64_t v23 = v21;
  v24 = v22;
  v25 = dateSent;
  v26 = v24;
  v27 = v25;
  v28 = sender;
  v29 = v27;
  v30 = v28;
  v31 = recipients;
  v32 = groupName;
  v33 = serviceName;
  v34 = audioMessageFile;
  v65.receiver = self;
  v65.super_class = (Class)INMessage;
  v35 = [(INMessage *)&v65 init];
  if (v35)
  {
    v64 = v32;
    uint64_t v36 = [(NSString *)v20 copy];
    v37 = v35->_identifier;
    v35->_identifier = (NSString *)v36;

    uint64_t v38 = [(NSString *)v23 copy];
    v39 = v35->_conversationIdentifier;
    v35->_uint64_t conversationIdentifier = (NSString *)v38;

    uint64_t v40 = [(NSString *)v26 copy];
    v41 = v35->_content;
    v35->_content = (NSString *)v40;

    uint64_t v42 = [(NSDate *)v29 copy];
    v43 = v35->_dateSent;
    v35->_dateSent = (NSDate *)v42;

    uint64_t v44 = [(INPerson *)v30 copy];
    v45 = v35->_sender;
    v35->_sender = (INPerson *)v44;

    v63 = v31;
    uint64_t v46 = [(NSArray *)v31 copy];
    v47 = v35->_recipients;
    v35->_recipients = (NSArray *)v46;

    uint64_t v48 = [(INSpeakableString *)v32 copy];
    v49 = v35->_groupName;
    v35->_groupName = (INSpeakableString *)v48;

    v35->_messageType = messageType;
    v35->_messageEffectType = 0;
    uint64_t v50 = [(NSString *)v33 copy];
    v51 = v35->_serviceName;
    v35->_serviceName = (NSString *)v50;

    if (v34)
    {
      v52 = v30;
      v53 = v29;
      v54 = v26;
      v55 = v23;
      v56 = v20;
      v57 = (void *)MEMORY[0x1E4F1C978];
      v58 = (NSArray *)[(INFile *)v34 copy];
      v59 = v57;
      uint64_t v20 = v56;
      uint64_t v23 = v55;
      v26 = v54;
      v29 = v53;
      v30 = v52;
      v32 = v64;
      uint64_t v60 = [v59 arrayWithObject:v58];
      attachmentFiles = v35->_attachmentFiles;
      v35->_attachmentFiles = (NSArray *)v60;
    }
    else
    {
      v58 = v35->_attachmentFiles;
      v35->_attachmentFiles = 0;
    }

    v31 = v63;
  }

  return v35;
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName
{
  NSUInteger v17 = identifier;
  uint64_t v18 = conversationIdentifier;
  unint64_t v19 = content;
  uint64_t v20 = dateSent;
  unint64_t v21 = sender;
  uint64_t v22 = recipients;
  uint64_t v23 = groupName;
  v24 = serviceName;
  v43.receiver = self;
  v43.super_class = (Class)INMessage;
  v25 = [(INMessage *)&v43 init];
  if (v25)
  {
    uint64_t v26 = [(NSString *)v17 copy];
    v27 = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    uint64_t v28 = [(NSString *)v18 copy];
    v29 = v25->_conversationIdentifier;
    v25->_uint64_t conversationIdentifier = (NSString *)v28;

    uint64_t v30 = [(NSString *)v19 copy];
    v31 = v25->_content;
    v25->_content = (NSString *)v30;

    uint64_t v32 = [(NSDate *)v20 copy];
    v33 = v25->_dateSent;
    v25->_dateSent = (NSDate *)v32;

    uint64_t v34 = [(INPerson *)v21 copy];
    v35 = v25->_sender;
    v25->_sender = (INPerson *)v34;

    uint64_t v36 = [(NSArray *)v22 copy];
    v37 = v25->_recipients;
    v25->_recipients = (NSArray *)v36;

    uint64_t v38 = [(INSpeakableString *)v23 copy];
    v39 = v25->_groupName;
    v25->_groupName = (INSpeakableString *)v38;

    v25->_messageType = messageType;
    v25->_messageEffectType = 0;
    uint64_t v40 = [(NSString *)v24 copy];
    v41 = v25->_serviceName;
    v25->_serviceName = (NSString *)v40;
  }
  return v25;
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType
{
  unint64_t v16 = identifier;
  NSUInteger v17 = conversationIdentifier;
  uint64_t v18 = content;
  unint64_t v19 = dateSent;
  uint64_t v20 = sender;
  unint64_t v21 = recipients;
  uint64_t v22 = groupName;
  v39.receiver = self;
  v39.super_class = (Class)INMessage;
  uint64_t v23 = [(INMessage *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [(NSString *)v16 copy];
    v25 = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    uint64_t v26 = [(NSString *)v17 copy];
    v27 = v23->_conversationIdentifier;
    v23->_uint64_t conversationIdentifier = (NSString *)v26;

    uint64_t v28 = [(NSString *)v18 copy];
    v29 = v23->_content;
    v23->_content = (NSString *)v28;

    uint64_t v30 = [(NSDate *)v19 copy];
    v31 = v23->_dateSent;
    v23->_dateSent = (NSDate *)v30;

    uint64_t v32 = [(INPerson *)v20 copy];
    v33 = v23->_sender;
    v23->_sender = (INPerson *)v32;

    uint64_t v34 = [(NSArray *)v21 copy];
    v35 = v23->_recipients;
    v23->_recipients = (NSArray *)v34;

    uint64_t v36 = [(INSpeakableString *)v22 copy];
    v37 = v23->_groupName;
    v23->_groupName = (INSpeakableString *)v36;

    v23->_messageType = messageType;
    v23->_messageEffectType = 0;
  }

  return v23;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13
{
  return [(INMessage *)self initWithIdentifier:a3 conversationIdentifier:a4 content:a5 dateSent:a6 sender:a7 recipients:a8 groupName:a9 dateMessageWasLastRead:a10 numberOfAttachments:a11 messageType:a12 messageEffectType:a13 referencedMessage:0];
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14
{
  return [(INMessage *)self initWithIdentifier:a3 conversationIdentifier:a4 content:a5 dateSent:a6 sender:a7 recipients:a8 groupName:a9 dateMessageWasLastRead:a10 numberOfAttachments:a11 messageType:a12 messageEffectType:a13 referencedMessage:a14 serviceName:0];
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15
{
  return [(INMessage *)self initWithIdentifier:a3 conversationIdentifier:a4 content:a5 dateSent:a6 sender:a7 recipients:a8 groupName:a9 dateMessageWasLastRead:a10 numberOfAttachments:a11 messageType:a12 messageEffectType:a13 referencedMessage:a14 serviceName:a15 audioMessageFile:0];
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 audioMessageFile:(id)a16
{
  id v63 = a3;
  id v62 = a4;
  id v61 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  v64.receiver = self;
  v64.super_class = (Class)INMessage;
  uint64_t v30 = [(INMessage *)&v64 init];
  if (v30)
  {
    uint64_t v31 = [v63 copy];
    identifier = v30->_identifier;
    v30->_identifier = (NSString *)v31;

    uint64_t v33 = [v62 copy];
    uint64_t conversationIdentifier = v30->_conversationIdentifier;
    v30->_uint64_t conversationIdentifier = (NSString *)v33;

    uint64_t v35 = [v61 copy];
    content = v30->_content;
    v30->_content = (NSString *)v35;

    uint64_t v37 = [v21 copy];
    dateSent = v30->_dateSent;
    v30->_dateSent = (NSDate *)v37;

    uint64_t v39 = [v22 copy];
    sender = v30->_sender;
    v30->_sender = (INPerson *)v39;

    id v59 = v23;
    uint64_t v41 = [v23 copy];
    recipients = v30->_recipients;
    v30->_recipients = (NSArray *)v41;

    uint64_t v43 = [v24 copy];
    groupName = v30->_groupName;
    v30->_groupName = (INSpeakableString *)v43;

    id v58 = v25;
    uint64_t v45 = [v25 copy];
    dateMessageWasLastRead = v30->_dateMessageWasLastRead;
    v30->_dateMessageWasLastRead = (NSDate *)v45;

    uint64_t v47 = [v26 copy];
    numberOfAttachments = v30->_numberOfAttachments;
    v30->_numberOfAttachments = (NSNumber *)v47;

    v30->_messageType = a12;
    v30->_messageEffectType = a13;
    uint64_t v49 = [v27 copy];
    referencedMessage = v30->_referencedMessage;
    v30->_referencedMessage = (INMessage *)v49;

    uint64_t v51 = [v28 copy];
    serviceName = v30->_serviceName;
    v30->_serviceName = (NSString *)v51;

    if (v29)
    {
      v53 = (void *)MEMORY[0x1E4F1C978];
      v54 = (NSArray *)[v29 copy];
      uint64_t v55 = [v53 arrayWithObject:v54];
      attachmentFiles = v30->_attachmentFiles;
      v30->_attachmentFiles = (NSArray *)v55;
    }
    else
    {
      v54 = v30->_attachmentFiles;
      v30->_attachmentFiles = 0;
    }

    id v23 = v59;
    id v25 = v58;
  }

  return v30;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 reaction:(id)a16 attachmentFiles:(id)a17 location:(id)a18 linkMetadata:(id)a19
{
  id v24 = a3;
  id v64 = a4;
  id v71 = a5;
  id v70 = a6;
  id v69 = a7;
  id v68 = a8;
  id v67 = a9;
  id v66 = a10;
  id v65 = a11;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  v72.receiver = self;
  v72.super_class = (Class)INMessage;
  uint64_t v31 = [(INMessage *)&v72 init];
  if (v31)
  {
    uint64_t v32 = [v24 copy];
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    uint64_t v34 = [v64 copy];
    uint64_t conversationIdentifier = v31->_conversationIdentifier;
    v31->_uint64_t conversationIdentifier = (NSString *)v34;

    uint64_t v36 = [v71 copy];
    content = v31->_content;
    v31->_content = (NSString *)v36;

    uint64_t v38 = [v70 copy];
    dateSent = v31->_dateSent;
    v31->_dateSent = (NSDate *)v38;

    uint64_t v40 = [v69 copy];
    sender = v31->_sender;
    v31->_sender = (INPerson *)v40;

    uint64_t v42 = [v68 copy];
    recipients = v31->_recipients;
    v31->_recipients = (NSArray *)v42;

    uint64_t v44 = [v67 copy];
    groupName = v31->_groupName;
    v31->_groupName = (INSpeakableString *)v44;

    uint64_t v46 = [v66 copy];
    dateMessageWasLastRead = v31->_dateMessageWasLastRead;
    v31->_dateMessageWasLastRead = (NSDate *)v46;

    uint64_t v48 = [v65 copy];
    numberOfAttachments = v31->_numberOfAttachments;
    v31->_numberOfAttachments = (NSNumber *)v48;

    v31->_messageType = a12;
    v31->_messageEffectType = a13;
    uint64_t v50 = [v25 copy];
    referencedMessage = v31->_referencedMessage;
    v31->_referencedMessage = (INMessage *)v50;

    uint64_t v52 = [v26 copy];
    serviceName = v31->_serviceName;
    v31->_serviceName = (NSString *)v52;

    uint64_t v54 = [v27 copy];
    reaction = v31->_reaction;
    v31->_reaction = (INMessageReaction *)v54;

    uint64_t v56 = [v28 copy];
    attachmentFiles = v31->_attachmentFiles;
    v31->_attachmentFiles = (NSArray *)v56;

    uint64_t v58 = [v29 copy];
    location = v31->_location;
    v31->_location = (CLPlacemark *)v58;

    uint64_t v60 = [v30 copy];
    linkMetadata = v31->_linkMetadata;
    v31->_linkMetadata = (INMessageLinkMetadata *)v60;
  }
  return v31;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 attachmentFiles:(id)a16 location:(id)a17 linkMetadata:(id)a18 reaction:(id)a19 sticker:(id)a20
{
  id v67 = a3;
  id v75 = a4;
  id v74 = a5;
  id v73 = a6;
  id v72 = a7;
  id v71 = a8;
  id v70 = a9;
  id v69 = a10;
  id v68 = a11;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  v76.receiver = self;
  v76.super_class = (Class)INMessage;
  uint64_t v33 = [(INMessage *)&v76 init];
  if (v33)
  {
    uint64_t v34 = [v67 copy];
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v34;

    uint64_t v36 = [v75 copy];
    uint64_t conversationIdentifier = v33->_conversationIdentifier;
    v33->_uint64_t conversationIdentifier = (NSString *)v36;

    uint64_t v38 = [v74 copy];
    content = v33->_content;
    v33->_content = (NSString *)v38;

    uint64_t v40 = [v73 copy];
    dateSent = v33->_dateSent;
    v33->_dateSent = (NSDate *)v40;

    uint64_t v42 = [v72 copy];
    sender = v33->_sender;
    v33->_sender = (INPerson *)v42;

    uint64_t v44 = [v71 copy];
    recipients = v33->_recipients;
    v33->_recipients = (NSArray *)v44;

    uint64_t v46 = [v70 copy];
    groupName = v33->_groupName;
    v33->_groupName = (INSpeakableString *)v46;

    uint64_t v48 = [v69 copy];
    dateMessageWasLastRead = v33->_dateMessageWasLastRead;
    v33->_dateMessageWasLastRead = (NSDate *)v48;

    uint64_t v50 = [v68 copy];
    numberOfAttachments = v33->_numberOfAttachments;
    v33->_numberOfAttachments = (NSNumber *)v50;

    v33->_messageType = a12;
    v33->_messageEffectType = a13;
    uint64_t v52 = [v26 copy];
    referencedMessage = v33->_referencedMessage;
    v33->_referencedMessage = (INMessage *)v52;

    uint64_t v54 = [v27 copy];
    serviceName = v33->_serviceName;
    v33->_serviceName = (NSString *)v54;

    uint64_t v56 = [v28 copy];
    attachmentFiles = v33->_attachmentFiles;
    v33->_attachmentFiles = (NSArray *)v56;

    uint64_t v58 = [v29 copy];
    location = v33->_location;
    v33->_location = (CLPlacemark *)v58;

    uint64_t v60 = [v30 copy];
    linkMetadata = v33->_linkMetadata;
    v33->_linkMetadata = (INMessageLinkMetadata *)v60;

    uint64_t v62 = [v31 copy];
    reaction = v33->_reaction;
    v33->_reaction = (INMessageReaction *)v62;

    uint64_t v64 = [v32 copy];
    sticker = v33->_sticker;
    v33->_sticker = (INSticker *)v64;
  }
  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)[(INMessage *)self copy];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v10 = INImageProxyInjectionQueue();
    [v9 setUnderlyingQueue:v10];

    [v9 setMaxConcurrentOperationCount:1];
    [v9 setSuspended:1];
    uint64_t v11 = (void *)MEMORY[0x1E4F28B48];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v19[3] = &unk_1E551F740;
    v19[4] = v8;
    id v20 = v7;
    uint64_t v12 = [v11 blockOperationWithBlock:v19];
    uint64_t v13 = [(INMessage *)self recipients];
    if (v13)
    {
      long long v14 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v14 setInjector:v13];
      [(INImageProxyInjectionOperation *)v14 setImageProxyRequestBlock:v6];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v18[3] = &unk_1E551E178;
      v18[4] = v8;
      [(INImageProxyInjectionOperation *)v14 setCopyReturnBlock:v18];
      [v12 addDependency:v14];
      [v9 addOperation:v14];
    }
    uint64_t v15 = [(INMessage *)self sender];
    if (v15)
    {
      unint64_t v16 = objc_alloc_init(INImageProxyInjectionOperation);
      [(INImageProxyInjectionOperation *)v16 setInjector:v15];
      [(INImageProxyInjectionOperation *)v16 setImageProxyRequestBlock:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v17[3] = &unk_1E551E178;
      v17[4] = v8;
      [(INImageProxyInjectionOperation *)v16 setCopyReturnBlock:v17];
      [v12 addDependency:v16];
      [v9 addOperation:v16];
    }
    [v9 addOperation:v12];
    [v9 setSuspended:0];
  }
}

uint64_t __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setRecipients:a2];
  }
  return result;
}

uint64_t __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setSender:a2];
  }
  return result;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = INKeyImageUtilitiesDefaultCompareSubProducers(v7, v6);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__INMessage_INKeyImageProducing___compareSubProducerOne_subProducerTwo___block_invoke;
  v15[3] = &unk_1E551B810;
  v15[4] = self;
  id v9 = (uint64_t (**)(void, void))MEMORY[0x192F984C0](v15);
  uint64_t v10 = ((uint64_t (**)(void, id))v9)[2](v9, v7);

  uint64_t v11 = ((uint64_t (**)(void, id))v9)[2](v9, v6);
  if (!v8)
  {
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:v10];
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
    int64_t v8 = [v12 compare:v13];
  }
  return v8;
}

uint64_t __72__INMessage_INKeyImageProducing___compareSubProducerOne_subProducerTwo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSUInteger v4 = [*(id *)(a1 + 32) recipients];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([*(id *)(a1 + 32) recipients],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 containsObject:v3],
          v7,
          (v8 & 1) != 0))
    {
      uint64_t v6 = 2;
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) sender];
      unsigned int v10 = [v3 isEqual:v9];

      uint64_t v6 = v10;
    }
  }

  return v6;
}

- (INImage)_keyImage
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  NSUInteger v4 = [(INMessage *)self recipients];

  if (v4)
  {
    char v5 = [(INMessage *)self recipients];
    [v3 addObjectsFromArray:v5];

    uint64_t v6 = [(INMessage *)self recipients];
    [v3 addObject:v6];
  }
  id v7 = INKeyImageUtilitiesKeyImageBySubProducerComparison(self, v3);

  return (INImage *)v7;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(INMessage *)self audioMessageFile];
  char v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  if ((v8 & 1) != 0
    || ([(INMessage *)self attachmentFiles],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_msgSend(v9, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6),
        v9,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)INMessage;
    BOOL v11 = [&v13 _intents_enumerateObjectsOfClass:a3 withBlock:v6];
  }

  return v11;
}

@end