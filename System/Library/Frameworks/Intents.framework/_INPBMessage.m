@interface _INPBMessage
+ (BOOL)supportsSecureCoding;
+ (Class)attachmentFileType;
+ (Class)recipientType;
- (BOOL)hasAudioMessageFile;
- (BOOL)hasContent;
- (BOOL)hasConversationIdentifier;
- (BOOL)hasDateLastMessageRead;
- (BOOL)hasDateSent;
- (BOOL)hasEffect;
- (BOOL)hasFileExtension;
- (BOOL)hasGroupName;
- (BOOL)hasIdentifier;
- (BOOL)hasLinkMetadata;
- (BOOL)hasLocation;
- (BOOL)hasLocationName;
- (BOOL)hasNumberOfAttachments;
- (BOOL)hasPaymentAmount;
- (BOOL)hasReaction;
- (BOOL)hasReferencedMessage;
- (BOOL)hasSender;
- (BOOL)hasServiceName;
- (BOOL)hasSpeakableGroupName;
- (BOOL)hasSticker;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)attachmentFiles;
- (NSArray)recipients;
- (NSString)content;
- (NSString)conversationIdentifier;
- (NSString)fileExtension;
- (NSString)groupName;
- (NSString)identifier;
- (NSString)locationName;
- (NSString)serviceName;
- (_INPBContact)sender;
- (_INPBCurrencyAmountValue)paymentAmount;
- (_INPBDataString)speakableGroupName;
- (_INPBDateTime)dateLastMessageRead;
- (_INPBDateTime)dateSent;
- (_INPBFile)audioMessageFile;
- (_INPBInteger)numberOfAttachments;
- (_INPBLocation)location;
- (_INPBMessage)initWithCoder:(id)a3;
- (_INPBMessage)referencedMessage;
- (_INPBMessageLinkMetadata)linkMetadata;
- (_INPBMessageReaction)reaction;
- (_INPBSticker)sticker;
- (id)attachmentFileAtIndex:(unint64_t)a3;
- (id)attributesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)effectAsString:(int)a3;
- (id)recipientAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAttributes:(id)a3;
- (int)StringAsEffect:(id)a3;
- (int)StringAsType:(id)a3;
- (int)attributeAtIndex:(unint64_t)a3;
- (int)attributes;
- (int)effect;
- (int)type;
- (unint64_t)attachmentFilesCount;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)addAttachmentFile:(id)a3;
- (void)addAttribute:(int)a3;
- (void)addRecipient:(id)a3;
- (void)clearAttachmentFiles;
- (void)clearAttributes;
- (void)clearRecipients;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentFiles:(id)a3;
- (void)setAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setAudioMessageFile:(id)a3;
- (void)setContent:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setDateLastMessageRead:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setEffect:(int)a3;
- (void)setFileExtension:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHasEffect:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLinkMetadata:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setNumberOfAttachments:(id)a3;
- (void)setPaymentAmount:(id)a3;
- (void)setReaction:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setReferencedMessage:(id)a3;
- (void)setSender:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSpeakableGroupName:(id)a3;
- (void)setSticker:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_speakableGroupName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_referencedMessage, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_numberOfAttachments, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateLastMessageRead, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_audioMessageFile, 0);

  objc_storeStrong((id *)&self->_attachmentFiles, 0);
}

- (int)type
{
  return self->_type;
}

- (_INPBSticker)sticker
{
  return self->_sticker;
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

- (_INPBMessage)referencedMessage
{
  return self->_referencedMessage;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (_INPBMessageReaction)reaction
{
  return self->_reaction;
}

- (_INPBCurrencyAmountValue)paymentAmount
{
  return self->_paymentAmount;
}

- (_INPBInteger)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (_INPBMessageLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (int)effect
{
  return self->_effect;
}

- (_INPBDateTime)dateSent
{
  return self->_dateSent;
}

- (_INPBDateTime)dateLastMessageRead
{
  return self->_dateLastMessageRead;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)content
{
  return self->_content;
}

- (_INPBFile)audioMessageFile
{
  return self->_audioMessageFile;
}

- (NSArray)attachmentFiles
{
  return self->_attachmentFiles;
}

- (id)dictionaryRepresentation
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_attachmentFiles count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v5 = self->_attachmentFiles;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v70 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v69 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"attachmentFile"];
  }
  if (self->_attributes.count)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBMessage attributesCount](self, "attributesCount"));
    if ([(_INPBMessage *)self attributesCount])
    {
      unint64_t v12 = 0;
      do
      {
        unsigned int v13 = self->_attributes.list[v12] - 1;
        if (v13 >= 5)
        {
          v14 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_attributes.list[v12]);
        }
        else
        {
          v14 = *(&off_1E5516E00 + v13);
        }
        [v11 addObject:v14];

        ++v12;
      }
      while (v12 < [(_INPBMessage *)self attributesCount]);
    }
    [v3 setObject:v11 forKeyedSubscript:@"attribute"];
  }
  v15 = [(_INPBMessage *)self audioMessageFile];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"audioMessageFile"];

  if (self->_content)
  {
    v17 = [(_INPBMessage *)self content];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"content"];
  }
  if (self->_conversationIdentifier)
  {
    v19 = [(_INPBMessage *)self conversationIdentifier];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"conversationIdentifier"];
  }
  v21 = [(_INPBMessage *)self dateLastMessageRead];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"dateLastMessageRead"];

  v23 = [(_INPBMessage *)self dateSent];
  v24 = [v23 dictionaryRepresentation];
  [v3 setObject:v24 forKeyedSubscript:@"dateSent"];

  if ([(_INPBMessage *)self hasEffect])
  {
    uint64_t v25 = [(_INPBMessage *)self effect];
    if ((v25 - 1) >= 0xD)
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
    }
    else
    {
      v26 = *(&off_1E5516E28 + (v25 - 1));
    }
    [v3 setObject:v26 forKeyedSubscript:@"effect"];
  }
  if (self->_fileExtension)
  {
    v27 = [(_INPBMessage *)self fileExtension];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"fileExtension"];
  }
  if (self->_groupName)
  {
    v29 = [(_INPBMessage *)self groupName];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"groupName"];
  }
  if (self->_identifier)
  {
    v31 = [(_INPBMessage *)self identifier];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"identifier"];
  }
  v33 = [(_INPBMessage *)self linkMetadata];
  v34 = [v33 dictionaryRepresentation];
  [v3 setObject:v34 forKeyedSubscript:@"linkMetadata"];

  v35 = [(_INPBMessage *)self location];
  v36 = [v35 dictionaryRepresentation];
  [v3 setObject:v36 forKeyedSubscript:@"location"];

  if (self->_locationName)
  {
    v37 = [(_INPBMessage *)self locationName];
    v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"locationName"];
  }
  v39 = [(_INPBMessage *)self numberOfAttachments];
  v40 = [v39 dictionaryRepresentation];
  [v3 setObject:v40 forKeyedSubscript:@"numberOfAttachments"];

  v41 = [(_INPBMessage *)self paymentAmount];
  v42 = [v41 dictionaryRepresentation];
  [v3 setObject:v42 forKeyedSubscript:@"paymentAmount"];

  v43 = [(_INPBMessage *)self reaction];
  v44 = [v43 dictionaryRepresentation];
  [v3 setObject:v44 forKeyedSubscript:@"reaction"];

  if ([(NSArray *)self->_recipients count])
  {
    v45 = [MEMORY[0x1E4F1CA48] array];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v46 = self->_recipients;
    uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v66 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = [*(id *)(*((void *)&v65 + 1) + 8 * j) dictionaryRepresentation];
          [v45 addObject:v51];
        }
        uint64_t v48 = [(NSArray *)v46 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v48);
    }

    [v3 setObject:v45 forKeyedSubscript:@"recipient"];
  }
  v52 = [(_INPBMessage *)self referencedMessage];
  v53 = [v52 dictionaryRepresentation];
  [v3 setObject:v53 forKeyedSubscript:@"referencedMessage"];

  v54 = [(_INPBMessage *)self sender];
  v55 = [v54 dictionaryRepresentation];
  [v3 setObject:v55 forKeyedSubscript:@"sender"];

  if (self->_serviceName)
  {
    v56 = [(_INPBMessage *)self serviceName];
    v57 = (void *)[v56 copy];
    [v3 setObject:v57 forKeyedSubscript:@"serviceName"];
  }
  v58 = [(_INPBMessage *)self speakableGroupName];
  v59 = [v58 dictionaryRepresentation];
  [v3 setObject:v59 forKeyedSubscript:@"speakableGroupName"];

  v60 = [(_INPBMessage *)self sticker];
  v61 = [v60 dictionaryRepresentation];
  [v3 setObject:v61 forKeyedSubscript:@"sticker"];

  if ([(_INPBMessage *)self hasType])
  {
    uint64_t v62 = [(_INPBMessage *)self type];
    if ((v62 - 1) >= 0x22)
    {
      v63 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v62);
    }
    else
    {
      v63 = *(&off_1E5516E90 + (v62 - 1));
    }
    [v3 setObject:v63 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v27 = [(NSArray *)self->_attachmentFiles hash];
  uint64_t v26 = PBRepeatedInt32Hash();
  unint64_t v25 = [(_INPBFile *)self->_audioMessageFile hash];
  NSUInteger v24 = [(NSString *)self->_content hash];
  NSUInteger v23 = [(NSString *)self->_conversationIdentifier hash];
  unint64_t v22 = [(_INPBDateTime *)self->_dateLastMessageRead hash];
  unint64_t v21 = [(_INPBDateTime *)self->_dateSent hash];
  if ([(_INPBMessage *)self hasEffect]) {
    uint64_t v20 = 2654435761 * self->_effect;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_fileExtension hash];
  NSUInteger v18 = [(NSString *)self->_groupName hash];
  NSUInteger v17 = [(NSString *)self->_identifier hash];
  unint64_t v16 = [(_INPBMessageLinkMetadata *)self->_linkMetadata hash];
  unint64_t v15 = [(_INPBLocation *)self->_location hash];
  NSUInteger v14 = [(NSString *)self->_locationName hash];
  unint64_t v3 = [(_INPBInteger *)self->_numberOfAttachments hash];
  unint64_t v4 = [(_INPBCurrencyAmountValue *)self->_paymentAmount hash];
  unint64_t v5 = [(_INPBMessageReaction *)self->_reaction hash];
  uint64_t v6 = [(NSArray *)self->_recipients hash];
  unint64_t v7 = [(_INPBMessage *)self->_referencedMessage hash];
  unint64_t v8 = [(_INPBContact *)self->_sender hash];
  NSUInteger v9 = [(NSString *)self->_serviceName hash];
  unint64_t v10 = [(_INPBDataString *)self->_speakableGroupName hash];
  unint64_t v11 = [(_INPBSticker *)self->_sticker hash];
  if ([(_INPBMessage *)self hasType]) {
    uint64_t v12 = 2654435761 * self->_type;
  }
  else {
    uint64_t v12 = 0;
  }
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_112;
  }
  unint64_t v5 = [(_INPBMessage *)self attachmentFiles];
  uint64_t v6 = [v4 attachmentFiles];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v7 = [(_INPBMessage *)self attachmentFiles];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_INPBMessage *)self attachmentFiles];
    unint64_t v10 = [v4 attachmentFiles];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_112;
  }
  unint64_t v5 = [(_INPBMessage *)self audioMessageFile];
  uint64_t v6 = [v4 audioMessageFile];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v12 = [(_INPBMessage *)self audioMessageFile];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    NSUInteger v14 = [(_INPBMessage *)self audioMessageFile];
    unint64_t v15 = [v4 audioMessageFile];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self content];
  uint64_t v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v17 = [(_INPBMessage *)self content];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    NSUInteger v19 = [(_INPBMessage *)self content];
    uint64_t v20 = [v4 content];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self conversationIdentifier];
  uint64_t v6 = [v4 conversationIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v22 = [(_INPBMessage *)self conversationIdentifier];
  if (v22)
  {
    NSUInteger v23 = (void *)v22;
    NSUInteger v24 = [(_INPBMessage *)self conversationIdentifier];
    unint64_t v25 = [v4 conversationIdentifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self dateLastMessageRead];
  uint64_t v6 = [v4 dateLastMessageRead];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v27 = [(_INPBMessage *)self dateLastMessageRead];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBMessage *)self dateLastMessageRead];
    v30 = [v4 dateLastMessageRead];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self dateSent];
  uint64_t v6 = [v4 dateSent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v32 = [(_INPBMessage *)self dateSent];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBMessage *)self dateSent];
    v35 = [v4 dateSent];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  int v37 = [(_INPBMessage *)self hasEffect];
  if (v37 != [v4 hasEffect]) {
    goto LABEL_112;
  }
  if ([(_INPBMessage *)self hasEffect])
  {
    if ([v4 hasEffect])
    {
      int effect = self->_effect;
      if (effect != [v4 effect]) {
        goto LABEL_112;
      }
    }
  }
  unint64_t v5 = [(_INPBMessage *)self fileExtension];
  uint64_t v6 = [v4 fileExtension];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v39 = [(_INPBMessage *)self fileExtension];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(_INPBMessage *)self fileExtension];
    v42 = [v4 fileExtension];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self groupName];
  uint64_t v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v44 = [(_INPBMessage *)self groupName];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(_INPBMessage *)self groupName];
    uint64_t v47 = [v4 groupName];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self identifier];
  uint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v49 = [(_INPBMessage *)self identifier];
  if (v49)
  {
    v50 = (void *)v49;
    v51 = [(_INPBMessage *)self identifier];
    v52 = [v4 identifier];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self linkMetadata];
  uint64_t v6 = [v4 linkMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v54 = [(_INPBMessage *)self linkMetadata];
  if (v54)
  {
    v55 = (void *)v54;
    v56 = [(_INPBMessage *)self linkMetadata];
    v57 = [v4 linkMetadata];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v59 = [(_INPBMessage *)self location];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(_INPBMessage *)self location];
    uint64_t v62 = [v4 location];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self locationName];
  uint64_t v6 = [v4 locationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v64 = [(_INPBMessage *)self locationName];
  if (v64)
  {
    long long v65 = (void *)v64;
    long long v66 = [(_INPBMessage *)self locationName];
    long long v67 = [v4 locationName];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self numberOfAttachments];
  uint64_t v6 = [v4 numberOfAttachments];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v69 = [(_INPBMessage *)self numberOfAttachments];
  if (v69)
  {
    long long v70 = (void *)v69;
    long long v71 = [(_INPBMessage *)self numberOfAttachments];
    long long v72 = [v4 numberOfAttachments];
    int v73 = [v71 isEqual:v72];

    if (!v73) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self paymentAmount];
  uint64_t v6 = [v4 paymentAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v74 = [(_INPBMessage *)self paymentAmount];
  if (v74)
  {
    uint64_t v75 = (void *)v74;
    v76 = [(_INPBMessage *)self paymentAmount];
    v77 = [v4 paymentAmount];
    int v78 = [v76 isEqual:v77];

    if (!v78) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self reaction];
  uint64_t v6 = [v4 reaction];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v79 = [(_INPBMessage *)self reaction];
  if (v79)
  {
    v80 = (void *)v79;
    v81 = [(_INPBMessage *)self reaction];
    v82 = [v4 reaction];
    int v83 = [v81 isEqual:v82];

    if (!v83) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self recipients];
  uint64_t v6 = [v4 recipients];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v84 = [(_INPBMessage *)self recipients];
  if (v84)
  {
    v85 = (void *)v84;
    v86 = [(_INPBMessage *)self recipients];
    v87 = [v4 recipients];
    int v88 = [v86 isEqual:v87];

    if (!v88) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self referencedMessage];
  uint64_t v6 = [v4 referencedMessage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v89 = [(_INPBMessage *)self referencedMessage];
  if (v89)
  {
    v90 = (void *)v89;
    v91 = [(_INPBMessage *)self referencedMessage];
    v92 = [v4 referencedMessage];
    int v93 = [v91 isEqual:v92];

    if (!v93) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self sender];
  uint64_t v6 = [v4 sender];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v94 = [(_INPBMessage *)self sender];
  if (v94)
  {
    v95 = (void *)v94;
    v96 = [(_INPBMessage *)self sender];
    v97 = [v4 sender];
    int v98 = [v96 isEqual:v97];

    if (!v98) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self serviceName];
  uint64_t v6 = [v4 serviceName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v99 = [(_INPBMessage *)self serviceName];
  if (v99)
  {
    v100 = (void *)v99;
    v101 = [(_INPBMessage *)self serviceName];
    v102 = [v4 serviceName];
    int v103 = [v101 isEqual:v102];

    if (!v103) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self speakableGroupName];
  uint64_t v6 = [v4 speakableGroupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_111;
  }
  uint64_t v104 = [(_INPBMessage *)self speakableGroupName];
  if (v104)
  {
    v105 = (void *)v104;
    v106 = [(_INPBMessage *)self speakableGroupName];
    v107 = [v4 speakableGroupName];
    int v108 = [v106 isEqual:v107];

    if (!v108) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMessage *)self sticker];
  uint64_t v6 = [v4 sticker];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_111:

    goto LABEL_112;
  }
  uint64_t v109 = [(_INPBMessage *)self sticker];
  if (v109)
  {
    v110 = (void *)v109;
    v111 = [(_INPBMessage *)self sticker];
    v112 = [v4 sticker];
    int v113 = [v111 isEqual:v112];

    if (!v113) {
      goto LABEL_112;
    }
  }
  else
  {
  }
  int v116 = [(_INPBMessage *)self hasType];
  if (v116 == [v4 hasType])
  {
    if (![(_INPBMessage *)self hasType]
      || ![v4 hasType]
      || (int type = self->_type, type == [v4 type]))
    {
      BOOL v114 = 1;
      goto LABEL_113;
    }
  }
LABEL_112:
  BOOL v114 = 0;
LABEL_113:

  return v114;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBMessage allocWithZone:](_INPBMessage, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_attachmentFiles copyWithZone:a3];
  [(_INPBMessage *)v5 setAttachmentFiles:v6];

  PBRepeatedInt32Copy();
  id v7 = [(_INPBFile *)self->_audioMessageFile copyWithZone:a3];
  [(_INPBMessage *)v5 setAudioMessageFile:v7];

  unint64_t v8 = (void *)[(NSString *)self->_content copyWithZone:a3];
  [(_INPBMessage *)v5 setContent:v8];

  NSUInteger v9 = (void *)[(NSString *)self->_conversationIdentifier copyWithZone:a3];
  [(_INPBMessage *)v5 setConversationIdentifier:v9];

  id v10 = [(_INPBDateTime *)self->_dateLastMessageRead copyWithZone:a3];
  [(_INPBMessage *)v5 setDateLastMessageRead:v10];

  id v11 = [(_INPBDateTime *)self->_dateSent copyWithZone:a3];
  [(_INPBMessage *)v5 setDateSent:v11];

  if ([(_INPBMessage *)self hasEffect]) {
    [(_INPBMessage *)v5 setEffect:[(_INPBMessage *)self effect]];
  }
  uint64_t v12 = (void *)[(NSString *)self->_fileExtension copyWithZone:a3];
  [(_INPBMessage *)v5 setFileExtension:v12];

  unsigned int v13 = (void *)[(NSString *)self->_groupName copyWithZone:a3];
  [(_INPBMessage *)v5 setGroupName:v13];

  NSUInteger v14 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBMessage *)v5 setIdentifier:v14];

  id v15 = [(_INPBMessageLinkMetadata *)self->_linkMetadata copyWithZone:a3];
  [(_INPBMessage *)v5 setLinkMetadata:v15];

  id v16 = [(_INPBLocation *)self->_location copyWithZone:a3];
  [(_INPBMessage *)v5 setLocation:v16];

  uint64_t v17 = (void *)[(NSString *)self->_locationName copyWithZone:a3];
  [(_INPBMessage *)v5 setLocationName:v17];

  id v18 = [(_INPBInteger *)self->_numberOfAttachments copyWithZone:a3];
  [(_INPBMessage *)v5 setNumberOfAttachments:v18];

  id v19 = [(_INPBCurrencyAmountValue *)self->_paymentAmount copyWithZone:a3];
  [(_INPBMessage *)v5 setPaymentAmount:v19];

  id v20 = [(_INPBMessageReaction *)self->_reaction copyWithZone:a3];
  [(_INPBMessage *)v5 setReaction:v20];

  int v21 = (void *)[(NSArray *)self->_recipients copyWithZone:a3];
  [(_INPBMessage *)v5 setRecipients:v21];

  id v22 = [(_INPBMessage *)self->_referencedMessage copyWithZone:a3];
  [(_INPBMessage *)v5 setReferencedMessage:v22];

  id v23 = [(_INPBContact *)self->_sender copyWithZone:a3];
  [(_INPBMessage *)v5 setSender:v23];

  NSUInteger v24 = (void *)[(NSString *)self->_serviceName copyWithZone:a3];
  [(_INPBMessage *)v5 setServiceName:v24];

  id v25 = [(_INPBDataString *)self->_speakableGroupName copyWithZone:a3];
  [(_INPBMessage *)v5 setSpeakableGroupName:v25];

  id v26 = [(_INPBSticker *)self->_sticker copyWithZone:a3];
  [(_INPBMessage *)v5 setSticker:v26];

  if ([(_INPBMessage *)self hasType]) {
    [(_INPBMessage *)v5 setType:[(_INPBMessage *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMessage *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMessage *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMessage *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMessage *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBMessage *)self clearAttributes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBMessage;
  [(_INPBMessage *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  unint64_t v5 = self->_attachmentFiles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v52;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v7);
  }

  if (self->_attributes.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_attributes.count);
  }
  id v11 = [(_INPBMessage *)self audioMessageFile];

  if (v11)
  {
    uint64_t v12 = [(_INPBMessage *)self audioMessageFile];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v13 = [(_INPBMessage *)self content];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v14 = [(_INPBMessage *)self conversationIdentifier];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  id v15 = [(_INPBMessage *)self dateLastMessageRead];

  if (v15)
  {
    id v16 = [(_INPBMessage *)self dateLastMessageRead];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(_INPBMessage *)self dateSent];

  if (v17)
  {
    id v18 = [(_INPBMessage *)self dateSent];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMessage *)self hasEffect]) {
    PBDataWriterWriteInt32Field();
  }
  id v19 = [(_INPBMessage *)self fileExtension];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  id v20 = [(_INPBMessage *)self groupName];

  if (v20) {
    PBDataWriterWriteStringField();
  }
  int v21 = [(_INPBMessage *)self identifier];

  if (v21) {
    PBDataWriterWriteStringField();
  }
  id v22 = [(_INPBMessage *)self linkMetadata];

  if (v22)
  {
    id v23 = [(_INPBMessage *)self linkMetadata];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v24 = [(_INPBMessage *)self location];

  if (v24)
  {
    id v25 = [(_INPBMessage *)self location];
    PBDataWriterWriteSubmessage();
  }
  id v26 = [(_INPBMessage *)self locationName];

  if (v26) {
    PBDataWriterWriteStringField();
  }
  uint64_t v27 = [(_INPBMessage *)self numberOfAttachments];

  if (v27)
  {
    v28 = [(_INPBMessage *)self numberOfAttachments];
    PBDataWriterWriteSubmessage();
  }
  v29 = [(_INPBMessage *)self paymentAmount];

  if (v29)
  {
    v30 = [(_INPBMessage *)self paymentAmount];
    PBDataWriterWriteSubmessage();
  }
  int v31 = [(_INPBMessage *)self reaction];

  if (v31)
  {
    uint64_t v32 = [(_INPBMessage *)self reaction];
    PBDataWriterWriteSubmessage();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v33 = self->_recipients;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v35);
  }

  v38 = [(_INPBMessage *)self referencedMessage];

  if (v38)
  {
    uint64_t v39 = [(_INPBMessage *)self referencedMessage];
    PBDataWriterWriteSubmessage();
  }
  v40 = [(_INPBMessage *)self sender];

  if (v40)
  {
    v41 = [(_INPBMessage *)self sender];
    PBDataWriterWriteSubmessage();
  }
  v42 = [(_INPBMessage *)self serviceName];

  if (v42) {
    PBDataWriterWriteStringField();
  }
  int v43 = [(_INPBMessage *)self speakableGroupName];

  if (v43)
  {
    uint64_t v44 = [(_INPBMessage *)self speakableGroupName];
    PBDataWriterWriteSubmessage();
  }
  v45 = [(_INPBMessage *)self sticker];

  if (v45)
  {
    v46 = [(_INPBMessage *)self sticker];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMessage *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMessageReadFrom(self, (uint64_t)a3);
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TEXT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUDIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DIGITAL_TOUCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HANDWRITING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STICKER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LIKED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TAPBACK_DISLIKED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TAPBACK_EMPHASIZED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LOVED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TAPBACK_QUESTIONED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LAUGHED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_CALENDAR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_LOCATION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_ADDRESS_CARD"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_IMAGE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_VIDEO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_PASS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_AUDIO"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PAYMENT_SENT"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PAYMENT_REQUEST"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PAYMENT_NOTE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ANIMOJI"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_SNIPPET"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"FILE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"LINK"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MESSAGE_REACTION"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SAFETY_MONITOR"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"LOCATION_REQUEST"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SHARED_LOCATION"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"FIND_MY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SCREEN_TIME_REQUEST"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ASK_TO"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_ANIMATED_IMAGE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY_ATTACHMENT"])
  {
    int v4 = 34;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 0x22)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516E90 + (a3 - 1));
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int type = a3;
  }
}

- (BOOL)hasSticker
{
  return self->_sticker != 0;
}

- (void)setSticker:(id)a3
{
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
  self->_serviceName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)setSender:(id)a3
{
}

- (BOOL)hasReferencedMessage
{
  return self->_referencedMessage != 0;
}

- (void)setReferencedMessage:(id)a3
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

- (BOOL)hasReaction
{
  return self->_reaction != 0;
}

- (void)setReaction:(id)a3
{
}

- (BOOL)hasPaymentAmount
{
  return self->_paymentAmount != 0;
}

- (void)setPaymentAmount:(id)a3
{
}

- (BOOL)hasNumberOfAttachments
{
  return self->_numberOfAttachments != 0;
}

- (void)setNumberOfAttachments:(id)a3
{
}

- (BOOL)hasLocationName
{
  return self->_locationName != 0;
}

- (void)setLocationName:(id)a3
{
  self->_locationName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)hasLinkMetadata
{
  return self->_linkMetadata != 0;
}

- (void)setLinkMetadata:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
  self->_groupName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasFileExtension
{
  return self->_fileExtension != 0;
}

- (void)setFileExtension:(id)a3
{
  self->_fileExtension = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516E28 + (a3 - 1));
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

- (BOOL)hasDateSent
{
  return self->_dateSent != 0;
}

- (void)setDateSent:(id)a3
{
}

- (BOOL)hasDateLastMessageRead
{
  return self->_dateLastMessageRead != 0;
}

- (void)setDateLastMessageRead:(id)a3
{
}

- (BOOL)hasConversationIdentifier
{
  return self->_conversationIdentifier != 0;
}

- (void)setConversationIdentifier:(id)a3
{
  self->_conversationIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContent:(id)a3
{
  self->_content = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasAudioMessageFile
{
  return self->_audioMessageFile != 0;
}

- (void)setAudioMessageFile:(id)a3
{
}

- (int)StringAsAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"READ"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UNREAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FLAGGED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNFLAGGED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLAYED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)attributesAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516E00 + (a3 - 1));
  }

  return v3;
}

- (int)attributeAtIndex:(unint64_t)a3
{
  return self->_attributes.list[a3];
}

- (unint64_t)attributesCount
{
  return self->_attributes.count;
}

- (void)addAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearAttributes
{
}

- (int)attributes
{
  return self->_attributes.list;
}

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
}

- (id)attachmentFileAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_attachmentFiles objectAtIndexedSubscript:a3];
}

- (unint64_t)attachmentFilesCount
{
  return [(NSArray *)self->_attachmentFiles count];
}

- (void)addAttachmentFile:(id)a3
{
  id v4 = a3;
  attachmentFiles = self->_attachmentFiles;
  id v8 = v4;
  if (!attachmentFiles)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_attachmentFiles;
    self->_attachmentFiles = v6;

    id v4 = v8;
    attachmentFiles = self->_attachmentFiles;
  }
  [(NSArray *)attachmentFiles addObject:v4];
}

- (void)clearAttachmentFiles
{
}

- (void)setAttachmentFiles:(id)a3
{
  self->_attachmentFiles = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)recipientType
{
  return (Class)objc_opt_class();
}

+ (Class)attachmentFileType
{
  return (Class)objc_opt_class();
}

@end