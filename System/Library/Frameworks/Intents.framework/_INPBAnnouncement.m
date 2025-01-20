@interface _INPBAnnouncement
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEndTime;
- (BOOL)hasIdentifier;
- (BOOL)hasSpeechDataTranscription;
- (BOOL)hasSpeechDataURL;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)speechDataTranscription;
- (_INPBAnnouncement)initWithCoder:(id)a3;
- (_INPBURLValue)speechDataURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)endTime;
- (unint64_t)hash;
- (unint64_t)startTime;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSpeechDataTranscription:(id)a3;
- (void)setSpeechDataURL:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAnnouncement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDataURL, 0);
  objc_storeStrong((id *)&self->_speechDataTranscription, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (_INPBURLValue)speechDataURL
{
  return self->_speechDataURL;
}

- (NSString)speechDataTranscription
{
  return self->_speechDataTranscription;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBAnnouncement *)self hasEndTime])
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBAnnouncement endTime](self, "endTime"));
    [v3 setObject:v4 forKeyedSubscript:@"endTime"];
  }
  if (self->_identifier)
  {
    v5 = [(_INPBAnnouncement *)self identifier];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"identifier"];
  }
  if (self->_speechDataTranscription)
  {
    v7 = [(_INPBAnnouncement *)self speechDataTranscription];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"speechDataTranscription"];
  }
  v9 = [(_INPBAnnouncement *)self speechDataURL];
  v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"speechDataURL"];

  if ([(_INPBAnnouncement *)self hasStartTime])
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBAnnouncement startTime](self, "startTime"));
    [v3 setObject:v11 forKeyedSubscript:@"startTime"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBAnnouncement *)self hasEndTime]) {
    unint64_t v3 = 2654435761u * self->_endTime;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  NSUInteger v5 = [(NSString *)self->_speechDataTranscription hash];
  unint64_t v6 = [(_INPBURLValue *)self->_speechDataURL hash];
  if ([(_INPBAnnouncement *)self hasStartTime]) {
    unint64_t v7 = 2654435761u * self->_startTime;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBAnnouncement *)self hasEndTime];
  if (v5 != [v4 hasEndTime]) {
    goto LABEL_21;
  }
  if ([(_INPBAnnouncement *)self hasEndTime])
  {
    if ([v4 hasEndTime])
    {
      unint64_t endTime = self->_endTime;
      if (endTime != [v4 endTime]) {
        goto LABEL_21;
      }
    }
  }
  unint64_t v7 = [(_INPBAnnouncement *)self identifier];
  v8 = [v4 identifier];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBAnnouncement *)self identifier];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBAnnouncement *)self identifier];
    v12 = [v4 identifier];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBAnnouncement *)self speechDataTranscription];
  v8 = [v4 speechDataTranscription];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBAnnouncement *)self speechDataTranscription];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBAnnouncement *)self speechDataTranscription];
    v17 = [v4 speechDataTranscription];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBAnnouncement *)self speechDataURL];
  v8 = [v4 speechDataURL];
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v19 = [(_INPBAnnouncement *)self speechDataURL];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBAnnouncement *)self speechDataURL];
    v22 = [v4 speechDataURL];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v26 = [(_INPBAnnouncement *)self hasStartTime];
  if (v26 == [v4 hasStartTime])
  {
    if (![(_INPBAnnouncement *)self hasStartTime]
      || ![v4 hasStartTime]
      || (unint64_t startTime = self->_startTime, startTime == [v4 startTime]))
    {
      BOOL v24 = 1;
      goto LABEL_22;
    }
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBAnnouncement allocWithZone:](_INPBAnnouncement, "allocWithZone:") init];
  if ([(_INPBAnnouncement *)self hasEndTime]) {
    [(_INPBAnnouncement *)v5 setEndTime:[(_INPBAnnouncement *)self endTime]];
  }
  unint64_t v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBAnnouncement *)v5 setIdentifier:v6];

  unint64_t v7 = (void *)[(NSString *)self->_speechDataTranscription copyWithZone:a3];
  [(_INPBAnnouncement *)v5 setSpeechDataTranscription:v7];

  id v8 = [(_INPBURLValue *)self->_speechDataURL copyWithZone:a3];
  [(_INPBAnnouncement *)v5 setSpeechDataURL:v8];

  if ([(_INPBAnnouncement *)self hasStartTime]) {
    [(_INPBAnnouncement *)v5 setStartTime:[(_INPBAnnouncement *)self startTime]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAnnouncement *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAnnouncement)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAnnouncement *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAnnouncement *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAnnouncement *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBAnnouncement *)self hasEndTime]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_INPBAnnouncement *)self identifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBAnnouncement *)self speechDataTranscription];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBAnnouncement *)self speechDataURL];

  if (v6)
  {
    uint64_t v7 = [(_INPBAnnouncement *)self speechDataURL];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBAnnouncement *)self hasStartTime]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnnouncementReadFrom(self, (uint64_t)a3);
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t startTime = a3;
}

- (BOOL)hasSpeechDataURL
{
  return self->_speechDataURL != 0;
}

- (void)setSpeechDataURL:(id)a3
{
}

- (BOOL)hasSpeechDataTranscription
{
  return self->_speechDataTranscription != 0;
}

- (void)setSpeechDataTranscription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  speechDataTranscription = self->_speechDataTranscription;
  self->_speechDataTranscription = v4;

  MEMORY[0x1F41817F8](v4, speechDataTranscription);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (void)setHasEndTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEndTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t endTime = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end