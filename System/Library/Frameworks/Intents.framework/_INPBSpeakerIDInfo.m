@interface _INPBSpeakerIDInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSharedUserID;
- (BOOL)hasSpeakerIDConfidence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBSpeakerIDInfo)initWithCoder:(id)a3;
- (_INPBString)sharedUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)speakerIDConfidenceAsString:(int)a3;
- (int)StringAsSpeakerIDConfidence:(id)a3;
- (int)speakerIDConfidence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasSpeakerIDConfidence:(BOOL)a3;
- (void)setSharedUserID:(id)a3;
- (void)setSpeakerIDConfidence:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSpeakerIDInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSpeakerIDInfo allocWithZone:](_INPBSpeakerIDInfo, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_sharedUserID copyWithZone:a3];
  [(_INPBSpeakerIDInfo *)v5 setSharedUserID:v6];

  if ([(_INPBSpeakerIDInfo *)self hasSpeakerIDConfidence]) {
    [(_INPBSpeakerIDInfo *)v5 setSpeakerIDConfidence:[(_INPBSpeakerIDInfo *)self speakerIDConfidence]];
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (int)speakerIDConfidence
{
  return self->_speakerIDConfidence;
}

- (_INPBString)sharedUserID
{
  return self->_sharedUserID;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSpeakerIDInfo *)self sharedUserID];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"sharedUserID"];

  if ([(_INPBSpeakerIDInfo *)self hasSpeakerIDConfidence])
  {
    uint64_t v6 = [(_INPBSpeakerIDInfo *)self speakerIDConfidence];
    if (v6 >= 6)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E5520038 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"speakerIDConfidence"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_sharedUserID hash];
  if ([(_INPBSpeakerIDInfo *)self hasSpeakerIDConfidence]) {
    uint64_t v4 = 2654435761 * self->_speakerIDConfidence;
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
  v5 = [(_INPBSpeakerIDInfo *)self sharedUserID];
  uint64_t v6 = [v4 sharedUserID];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBSpeakerIDInfo *)self sharedUserID];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBSpeakerIDInfo *)self sharedUserID];
      v11 = [v4 sharedUserID];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBSpeakerIDInfo *)self hasSpeakerIDConfidence];
    if (v13 == [v4 hasSpeakerIDConfidence])
    {
      if (![(_INPBSpeakerIDInfo *)self hasSpeakerIDConfidence]
        || ![v4 hasSpeakerIDConfidence]
        || (int speakerIDConfidence = self->_speakerIDConfidence,
            speakerIDConfidence == [v4 speakerIDConfidence]))
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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSpeakerIDInfo *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSpeakerIDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSpeakerIDInfo *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSpeakerIDInfo *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSpeakerIDInfo *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBSpeakerIDInfo *)self sharedUserID];

  if (v4)
  {
    v5 = [(_INPBSpeakerIDInfo *)self sharedUserID];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSpeakerIDInfo *)self hasSpeakerIDConfidence]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSpeakerIDInfoReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSpeakerIDConfidence:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONFIDENCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FULL_CONFIDENCE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HIGH_CONFIDENCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MEDIUM_CONFIDENCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AMBIGUOUS_CONFIDENCE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NO_CONFIDENCE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)speakerIDConfidenceAsString:(int)a3
{
  if (a3 >= 6)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5520038 + a3);
  }

  return v3;
}

- (void)setHasSpeakerIDConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSpeakerIDConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSpeakerIDConfidence:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int speakerIDConfidence = a3;
  }
}

- (BOOL)hasSharedUserID
{
  return self->_sharedUserID != 0;
}

- (void)setSharedUserID:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end