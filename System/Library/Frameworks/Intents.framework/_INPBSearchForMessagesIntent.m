@interface _INPBSearchForMessagesIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContent;
- (BOOL)hasConversationIdentifier;
- (BOOL)hasDateTimeRange;
- (BOOL)hasGroupName;
- (BOOL)hasIdentifier;
- (BOOL)hasIntentMetadata;
- (BOOL)hasNotificationIdentifier;
- (BOOL)hasRecipient;
- (BOOL)hasSearchTerm;
- (BOOL)hasSender;
- (BOOL)hasSpeakableGroupName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContactList)recipient;
- (_INPBContactList)sender;
- (_INPBDataStringList)speakableGroupName;
- (_INPBDateTimeRange)dateTimeRange;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchForMessagesIntent)initWithCoder:(id)a3;
- (_INPBStringList)content;
- (_INPBStringList)conversationIdentifier;
- (_INPBStringList)groupName;
- (_INPBStringList)identifier;
- (_INPBStringList)notificationIdentifier;
- (_INPBStringList)searchTerm;
- (id)attributesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAttributes:(id)a3;
- (int)attributeAtIndex:(unint64_t)a3;
- (int)attributes;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (void)addAttribute:(int)a3;
- (void)clearAttributes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setContent:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setNotificationIdentifier:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setSender:(id)a3;
- (void)setSpeakableGroupName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForMessagesIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableGroupName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (_INPBDataStringList)speakableGroupName
{
  return self->_speakableGroupName;
}

- (_INPBContactList)sender
{
  return self->_sender;
}

- (_INPBStringList)searchTerm
{
  return self->_searchTerm;
}

- (_INPBContactList)recipient
{
  return self->_recipient;
}

- (_INPBStringList)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBStringList)identifier
{
  return self->_identifier;
}

- (_INPBStringList)groupName
{
  return self->_groupName;
}

- (_INPBDateTimeRange)dateTimeRange
{
  return self->_dateTimeRange;
}

- (_INPBStringList)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (_INPBStringList)content
{
  return self->_content;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_attributes.count)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchForMessagesIntent attributesCount](self, "attributesCount"));
    if ([(_INPBSearchForMessagesIntent *)self attributesCount])
    {
      unint64_t v5 = 0;
      do
      {
        unsigned int v6 = self->_attributes.list[v5] - 1;
        if (v6 >= 5)
        {
          v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_attributes.list[v5]);
        }
        else
        {
          v7 = *(&off_1E5517EF8 + v6);
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(_INPBSearchForMessagesIntent *)self attributesCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"attribute"];
  }
  v8 = [(_INPBSearchForMessagesIntent *)self content];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"content"];

  v10 = [(_INPBSearchForMessagesIntent *)self conversationIdentifier];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"conversationIdentifier"];

  v12 = [(_INPBSearchForMessagesIntent *)self dateTimeRange];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"dateTimeRange"];

  v14 = [(_INPBSearchForMessagesIntent *)self groupName];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"groupName"];

  v16 = [(_INPBSearchForMessagesIntent *)self identifier];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"identifier"];

  v18 = [(_INPBSearchForMessagesIntent *)self intentMetadata];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"intentMetadata"];

  v20 = [(_INPBSearchForMessagesIntent *)self notificationIdentifier];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"notificationIdentifier"];

  v22 = [(_INPBSearchForMessagesIntent *)self recipient];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"recipient"];

  v24 = [(_INPBSearchForMessagesIntent *)self searchTerm];
  v25 = [v24 dictionaryRepresentation];
  [v3 setObject:v25 forKeyedSubscript:@"searchTerm"];

  v26 = [(_INPBSearchForMessagesIntent *)self sender];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"sender"];

  v28 = [(_INPBSearchForMessagesIntent *)self speakableGroupName];
  v29 = [v28 dictionaryRepresentation];
  [v3 setObject:v29 forKeyedSubscript:@"speakableGroupName"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(_INPBStringList *)self->_content hash] ^ v3;
  unint64_t v5 = [(_INPBStringList *)self->_conversationIdentifier hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBDateTimeRange *)self->_dateTimeRange hash];
  unint64_t v7 = [(_INPBStringList *)self->_groupName hash];
  unint64_t v8 = v7 ^ [(_INPBStringList *)self->_identifier hash];
  unint64_t v9 = v6 ^ v8 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v10 = [(_INPBStringList *)self->_notificationIdentifier hash];
  unint64_t v11 = v10 ^ [(_INPBContactList *)self->_recipient hash];
  unint64_t v12 = v11 ^ [(_INPBStringList *)self->_searchTerm hash];
  unint64_t v13 = v9 ^ v12 ^ [(_INPBContactList *)self->_sender hash];
  return v13 ^ [(_INPBDataStringList *)self->_speakableGroupName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedInt32IsEqual()) {
    goto LABEL_58;
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self content];
  unint64_t v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v7 = [(_INPBSearchForMessagesIntent *)self content];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBSearchForMessagesIntent *)self content];
    unint64_t v10 = [v4 content];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self conversationIdentifier];
  unint64_t v6 = [v4 conversationIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v12 = [(_INPBSearchForMessagesIntent *)self conversationIdentifier];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    v14 = [(_INPBSearchForMessagesIntent *)self conversationIdentifier];
    v15 = [v4 conversationIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self dateTimeRange];
  unint64_t v6 = [v4 dateTimeRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v17 = [(_INPBSearchForMessagesIntent *)self dateTimeRange];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSearchForMessagesIntent *)self dateTimeRange];
    v20 = [v4 dateTimeRange];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self groupName];
  unint64_t v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v22 = [(_INPBSearchForMessagesIntent *)self groupName];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBSearchForMessagesIntent *)self groupName];
    v25 = [v4 groupName];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v27 = [(_INPBSearchForMessagesIntent *)self identifier];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBSearchForMessagesIntent *)self identifier];
    v30 = [v4 identifier];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v32 = [(_INPBSearchForMessagesIntent *)self intentMetadata];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBSearchForMessagesIntent *)self intentMetadata];
    v35 = [v4 intentMetadata];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self notificationIdentifier];
  unint64_t v6 = [v4 notificationIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v37 = [(_INPBSearchForMessagesIntent *)self notificationIdentifier];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBSearchForMessagesIntent *)self notificationIdentifier];
    v40 = [v4 notificationIdentifier];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self recipient];
  unint64_t v6 = [v4 recipient];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v42 = [(_INPBSearchForMessagesIntent *)self recipient];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBSearchForMessagesIntent *)self recipient];
    v45 = [v4 recipient];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self searchTerm];
  unint64_t v6 = [v4 searchTerm];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v47 = [(_INPBSearchForMessagesIntent *)self searchTerm];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBSearchForMessagesIntent *)self searchTerm];
    v50 = [v4 searchTerm];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self sender];
  unint64_t v6 = [v4 sender];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v52 = [(_INPBSearchForMessagesIntent *)self sender];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBSearchForMessagesIntent *)self sender];
    v55 = [v4 sender];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self speakableGroupName];
  unint64_t v6 = [v4 speakableGroupName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v57 = [(_INPBSearchForMessagesIntent *)self speakableGroupName];
    if (!v57)
    {

LABEL_61:
      BOOL v62 = 1;
      goto LABEL_59;
    }
    v58 = (void *)v57;
    v59 = [(_INPBSearchForMessagesIntent *)self speakableGroupName];
    v60 = [v4 speakableGroupName];
    char v61 = [v59 isEqual:v60];

    if (v61) {
      goto LABEL_61;
    }
  }
  else
  {
LABEL_57:
  }
LABEL_58:
  BOOL v62 = 0;
LABEL_59:

  return v62;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForMessagesIntent allocWithZone:](_INPBSearchForMessagesIntent, "allocWithZone:") init];
  PBRepeatedInt32Copy();
  id v6 = [(_INPBStringList *)self->_content copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setContent:v6];

  id v7 = [(_INPBStringList *)self->_conversationIdentifier copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setConversationIdentifier:v7];

  id v8 = [(_INPBDateTimeRange *)self->_dateTimeRange copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setDateTimeRange:v8];

  id v9 = [(_INPBStringList *)self->_groupName copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setGroupName:v9];

  id v10 = [(_INPBStringList *)self->_identifier copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setIdentifier:v10];

  id v11 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setIntentMetadata:v11];

  id v12 = [(_INPBStringList *)self->_notificationIdentifier copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setNotificationIdentifier:v12];

  id v13 = [(_INPBContactList *)self->_recipient copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setRecipient:v13];

  id v14 = [(_INPBStringList *)self->_searchTerm copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setSearchTerm:v14];

  id v15 = [(_INPBContactList *)self->_sender copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setSender:v15];

  id v16 = [(_INPBDataStringList *)self->_speakableGroupName copyWithZone:a3];
  [(_INPBSearchForMessagesIntent *)v5 setSpeakableGroupName:v16];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForMessagesIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForMessagesIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForMessagesIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForMessagesIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForMessagesIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBSearchForMessagesIntent *)self clearAttributes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchForMessagesIntent;
  [(_INPBSearchForMessagesIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v27 = a3;
  if (self->_attributes.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_attributes.count);
  }
  unint64_t v5 = [(_INPBSearchForMessagesIntent *)self content];

  if (v5)
  {
    id v6 = [(_INPBSearchForMessagesIntent *)self content];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSearchForMessagesIntent *)self conversationIdentifier];

  if (v7)
  {
    id v8 = [(_INPBSearchForMessagesIntent *)self conversationIdentifier];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBSearchForMessagesIntent *)self dateTimeRange];

  if (v9)
  {
    id v10 = [(_INPBSearchForMessagesIntent *)self dateTimeRange];
    PBDataWriterWriteSubmessage();
  }
  id v11 = [(_INPBSearchForMessagesIntent *)self groupName];

  if (v11)
  {
    id v12 = [(_INPBSearchForMessagesIntent *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  id v13 = [(_INPBSearchForMessagesIntent *)self identifier];

  if (v13)
  {
    id v14 = [(_INPBSearchForMessagesIntent *)self identifier];
    PBDataWriterWriteSubmessage();
  }
  id v15 = [(_INPBSearchForMessagesIntent *)self intentMetadata];

  if (v15)
  {
    id v16 = [(_INPBSearchForMessagesIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(_INPBSearchForMessagesIntent *)self notificationIdentifier];

  if (v17)
  {
    v18 = [(_INPBSearchForMessagesIntent *)self notificationIdentifier];
    PBDataWriterWriteSubmessage();
  }
  v19 = [(_INPBSearchForMessagesIntent *)self recipient];

  if (v19)
  {
    v20 = [(_INPBSearchForMessagesIntent *)self recipient];
    PBDataWriterWriteSubmessage();
  }
  int v21 = [(_INPBSearchForMessagesIntent *)self searchTerm];

  if (v21)
  {
    uint64_t v22 = [(_INPBSearchForMessagesIntent *)self searchTerm];
    PBDataWriterWriteSubmessage();
  }
  v23 = [(_INPBSearchForMessagesIntent *)self sender];

  if (v23)
  {
    v24 = [(_INPBSearchForMessagesIntent *)self sender];
    PBDataWriterWriteSubmessage();
  }
  v25 = [(_INPBSearchForMessagesIntent *)self speakableGroupName];

  if (v25)
  {
    int v26 = [(_INPBSearchForMessagesIntent *)self speakableGroupName];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForMessagesIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSpeakableGroupName
{
  return self->_speakableGroupName != 0;
}

- (void)setSpeakableGroupName:(id)a3
{
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)setSender:(id)a3
{
}

- (BOOL)hasSearchTerm
{
  return self->_searchTerm != 0;
}

- (void)setSearchTerm:(id)a3
{
}

- (BOOL)hasRecipient
{
  return self->_recipient != 0;
}

- (void)setRecipient:(id)a3
{
}

- (BOOL)hasNotificationIdentifier
{
  return self->_notificationIdentifier != 0;
}

- (void)setNotificationIdentifier:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)hasDateTimeRange
{
  return self->_dateTimeRange != 0;
}

- (void)setDateTimeRange:(id)a3
{
}

- (BOOL)hasConversationIdentifier
{
  return self->_conversationIdentifier != 0;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContent:(id)a3
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
    id v3 = *(&off_1E5517EF8 + (a3 - 1));
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end