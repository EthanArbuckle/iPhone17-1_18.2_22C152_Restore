@interface _INPBSetAudioSourceInCarIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAudioSource;
- (BOOL)hasIntentMetadata;
- (BOOL)hasRelativeAudioSourceReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetAudioSourceInCarIntent)initWithCoder:(id)a3;
- (id)audioSourceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)relativeAudioSourceReferenceAsString:(int)a3;
- (int)StringAsAudioSource:(id)a3;
- (int)StringAsRelativeAudioSourceReference:(id)a3;
- (int)audioSource;
- (int)relativeAudioSourceReference;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSource:(int)a3;
- (void)setHasAudioSource:(BOOL)a3;
- (void)setHasRelativeAudioSourceReference:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setRelativeAudioSourceReference:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetAudioSourceInCarIntent

- (void).cxx_destruct
{
}

- (int)relativeAudioSourceReference
{
  return self->_relativeAudioSourceReference;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSetAudioSourceInCarIntent *)self hasAudioSource])
  {
    uint64_t v4 = [(_INPBSetAudioSourceInCarIntent *)self audioSource];
    if ((v4 - 1) >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5518C70[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioSource"];
  }
  v6 = [(_INPBSetAudioSourceInCarIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSetAudioSourceInCarIntent *)self hasRelativeAudioSourceReference])
  {
    uint64_t v8 = [(_INPBSetAudioSourceInCarIntent *)self relativeAudioSourceReference];
    if (v8 == 1)
    {
      v9 = @"NEXT";
    }
    else if (v8 == 2)
    {
      v9 = @"PREVIOUS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v9 forKeyedSubscript:@"relativeAudioSourceReference"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSetAudioSourceInCarIntent *)self hasAudioSource]) {
    uint64_t v3 = 2654435761 * self->_audioSource;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSetAudioSourceInCarIntent *)self hasRelativeAudioSourceReference]) {
    uint64_t v5 = 2654435761 * self->_relativeAudioSourceReference;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  int v5 = [(_INPBSetAudioSourceInCarIntent *)self hasAudioSource];
  if (v5 != [v4 hasAudioSource]) {
    goto LABEL_13;
  }
  if ([(_INPBSetAudioSourceInCarIntent *)self hasAudioSource])
  {
    if ([v4 hasAudioSource])
    {
      int audioSource = self->_audioSource;
      if (audioSource != [v4 audioSource]) {
        goto LABEL_13;
      }
    }
  }
  v7 = [(_INPBSetAudioSourceInCarIntent *)self intentMetadata];
  uint64_t v8 = [v4 intentMetadata];
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v10 = [(_INPBSetAudioSourceInCarIntent *)self intentMetadata];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(_INPBSetAudioSourceInCarIntent *)self intentMetadata];
      v13 = [v4 intentMetadata];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    int v15 = [(_INPBSetAudioSourceInCarIntent *)self hasRelativeAudioSourceReference];
    if (v15 == [v4 hasRelativeAudioSourceReference])
    {
      if (![(_INPBSetAudioSourceInCarIntent *)self hasRelativeAudioSourceReference]
        || ![v4 hasRelativeAudioSourceReference]
        || (int relativeAudioSourceReference = self->_relativeAudioSourceReference,
            relativeAudioSourceReference == [v4 relativeAudioSourceReference]))
      {
        BOOL v16 = 1;
        goto LABEL_14;
      }
    }
  }
  else
  {
  }
LABEL_13:
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSetAudioSourceInCarIntent allocWithZone:](_INPBSetAudioSourceInCarIntent, "allocWithZone:") init];
  if ([(_INPBSetAudioSourceInCarIntent *)self hasAudioSource]) {
    [(_INPBSetAudioSourceInCarIntent *)v5 setAudioSource:[(_INPBSetAudioSourceInCarIntent *)self audioSource]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetAudioSourceInCarIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBSetAudioSourceInCarIntent *)self hasRelativeAudioSourceReference]) {
    [(_INPBSetAudioSourceInCarIntent *)v5 setRelativeAudioSourceReference:[(_INPBSetAudioSourceInCarIntent *)self relativeAudioSourceReference]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetAudioSourceInCarIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetAudioSourceInCarIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetAudioSourceInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetAudioSourceInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetAudioSourceInCarIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_INPBSetAudioSourceInCarIntent *)self hasAudioSource]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBSetAudioSourceInCarIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBSetAudioSourceInCarIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetAudioSourceInCarIntent *)self hasRelativeAudioSourceReference]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetAudioSourceInCarIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsRelativeAudioSourceReference:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NEXT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PREVIOUS"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)relativeAudioSourceReferenceAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NEXT";
  }
  else if (a3 == 2)
  {
    int v4 = @"PREVIOUS";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasRelativeAudioSourceReference:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRelativeAudioSourceReference
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRelativeAudioSourceReference:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int relativeAudioSourceReference = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (int)StringAsAudioSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CARPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IPOD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RADIO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BLUETOOTH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AUX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USB"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MEMORY_CARD"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OPTICAL_DRIVE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HARD_DRIVE"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)audioSourceAsString:(int)a3
{
  if ((a3 - 1) >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518C70[a3 - 1];
  }

  return v3;
}

- (void)setHasAudioSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioSource:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int audioSource = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end