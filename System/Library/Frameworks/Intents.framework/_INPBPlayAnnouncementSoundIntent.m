@interface _INPBPlayAnnouncementSoundIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSoundType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBPlayAnnouncementSoundIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)soundTypeAsString:(int)a3;
- (int)StringAsSoundType:(id)a3;
- (int)soundType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasSoundType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSoundType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPlayAnnouncementSoundIntent

- (void).cxx_destruct
{
}

- (int)soundType
{
  return self->_soundType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPlayAnnouncementSoundIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBPlayAnnouncementSoundIntent *)self hasSoundType])
  {
    uint64_t v6 = [(_INPBPlayAnnouncementSoundIntent *)self soundType];
    if (v6 == 1)
    {
      v7 = @"ANNOUNCEMENT_SENT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKeyedSubscript:@"soundType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBPlayAnnouncementSoundIntent *)self hasSoundType]) {
    uint64_t v4 = 2654435761 * self->_soundType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  v5 = [(_INPBPlayAnnouncementSoundIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBPlayAnnouncementSoundIntent *)self intentMetadata];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBPlayAnnouncementSoundIntent *)self intentMetadata];
      v11 = [v4 intentMetadata];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBPlayAnnouncementSoundIntent *)self hasSoundType];
    if (v13 == [v4 hasSoundType])
    {
      if (![(_INPBPlayAnnouncementSoundIntent *)self hasSoundType]
        || ![v4 hasSoundType]
        || (int soundType = self->_soundType, soundType == [v4 soundType]))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPlayAnnouncementSoundIntent allocWithZone:](_INPBPlayAnnouncementSoundIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBPlayAnnouncementSoundIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBPlayAnnouncementSoundIntent *)self hasSoundType]) {
    [(_INPBPlayAnnouncementSoundIntent *)v5 setSoundType:[(_INPBPlayAnnouncementSoundIntent *)self soundType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPlayAnnouncementSoundIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPlayAnnouncementSoundIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPlayAnnouncementSoundIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPlayAnnouncementSoundIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPlayAnnouncementSoundIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBPlayAnnouncementSoundIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBPlayAnnouncementSoundIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPlayAnnouncementSoundIntent *)self hasSoundType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayAnnouncementSoundIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSoundType:(id)a3
{
  return 1;
}

- (id)soundTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"ANNOUNCEMENT_SENT";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSoundType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSoundType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSoundType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int soundType = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end